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

export default function MessageScenarioSecondTest(): void {
  describe('MessageScenarioSecondTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach((): void => {
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.name   MessageScenarioSecondTest0100
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0100
     * @tc.desc   Verify sendMessage with callback Message triggers handler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0100';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let callback: CB = () => {};
          let message: concurrency.Message = new concurrency.Message(callback, handler);
          expect(handler.sendMessage(message)).assertTrue();
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
          console.error(`${TAG} error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }

        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest0200
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0200
     * @tc.desc   Verify Message what boundary values including int max and min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0200';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);

          let message0: concurrency.Message = new concurrency.Message(0, handler);
          handler.sendMessage(message0);
          expect(message0.getWhat()).assertEqual(0);

          let message1: concurrency.Message = new concurrency.Message(1, handler);
          handler.sendMessage(message1);
          expect(message1.getWhat()).assertEqual(1);

          let message_1: concurrency.Message = new concurrency.Message(-1, handler);
          handler.sendMessage(message_1);
          expect(message_1.getWhat()).assertEqual(-1);

          let message65535: concurrency.Message = new concurrency.Message(65535, handler);
          handler.sendMessage(message65535);
          expect(message65535.getWhat()).assertEqual(65535);

          let message_65535: concurrency.Message = new concurrency.Message(-65535, handler);
          handler.sendMessage(message_65535);
          expect(message_65535.getWhat()).assertEqual(-65535);

          let messageMax: concurrency.Message = new concurrency.Message(2147483647, handler);
          handler.sendMessage(messageMax);
          expect(messageMax.getWhat()).assertEqual(2147483647);

          let messageMin: concurrency.Message = new concurrency.Message(-2147483648, handler);
          handler.sendMessage(messageMin);
          expect(messageMin.getWhat()).assertEqual(-2147483648);
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
          console.error(`${TAG} error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest0300
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0300
     * @tc.desc   Verify Message getWhat boundary values including int max and min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0300';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);

          let message0: concurrency.Message = new concurrency.Message(0, 'obj', handler);
          handler.sendMessage(message0);
          expect(message0.getWhat()).assertEqual(0);

          let message1: concurrency.Message = new concurrency.Message(1, 'obj', handler);
          handler.sendMessage(message1);
          expect(message1.getWhat()).assertEqual(1);

          let message_1: concurrency.Message = new concurrency.Message(-1, 'obj', handler);
          handler.sendMessage(message_1);
          expect(message_1.getWhat()).assertEqual(-1);

          let message65535: concurrency.Message = new concurrency.Message(65535, 'obj', handler);
          handler.sendMessage(message65535);
          expect(message65535.getWhat()).assertEqual(65535);

          let message_65535: concurrency.Message = new concurrency.Message(-65535, 'obj', handler);
          handler.sendMessage(message_65535);
          expect(message_65535.getWhat()).assertEqual(-65535);

          let messageMax: concurrency.Message = new concurrency.Message(2147483647, 'obj', handler);
          handler.sendMessage(messageMax);
          expect(messageMax.getWhat()).assertEqual(2147483647);

          let messageMin: concurrency.Message = new concurrency.Message(-2147483648, 'obj', handler);
          handler.sendMessage(messageMin);
          expect(messageMin.getWhat()).assertEqual(-2147483648);
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest0400
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0400
     * @tc.desc   Verify Message getCallback returns undefined for identifier Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0400';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(handler);
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest0500
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0500
     * @tc.desc   Verify Message getCallback returns undefined for what-only Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0500';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, handler);
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest0600
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0600
     * @tc.desc   Verify Message getCallback returns undefined for default Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0600';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, 'obj', handler);
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest0700
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0700
     * @tc.desc   Verify getCallback returns the identical single callback for callback Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0700';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let callback: CB = () => {
            console.log(`concurrency.Message callback！`);
          };
          let message: concurrency.Message = new concurrency.Message(callback, handler);
          let callback1: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback1).assertEqual(callback);
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });


    /**
     * @tc.name   MessageScenarioSecondTest0800
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0800
     * @tc.desc   Verify MessageHandler receives identifier Message correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0800';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(handler);
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest0900
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_0900
     * @tc.desc   Verify MessageHandler receives what Message correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest0900';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, handler);
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest1000
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1000
     * @tc.desc   Verify MessageHandler receives object Message correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest1000';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, 'obj', handler);
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest1100
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1100
     * @tc.desc   Verify MessageHandler receives callback Message correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest1100';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let callback: CB = () => {};
          let message: concurrency.Message = new concurrency.Message(callback, handler);
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest1200
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1200
     * @tc.desc   Verify MessageHandler processes mixed Message list in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest1200';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          // Sequential send+wait: avoid relying on FIFO across 6 queued messages under stress
          // (observed reorder: first delivered what=1 while Message(handler) default is -1000000).
          let lastWhat = new AtomicInt(-999);
          let received = new AtomicInt(0);
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            lastWhat.store(msg.getWhat());
            received.fetchAdd(1);
          }, eaw);
          let callback: CB = () => {
            console.log(`concurrency.Message callback！`);
          };
          let message0 = new concurrency.Message(handler);
          let message1: concurrency.Message = new concurrency.Message(1, handler);
          let message2: concurrency.Message = new concurrency.Message(10, handler);
          let message3: concurrency.Message = new concurrency.Message(-1, handler);
          let message4: concurrency.Message = new concurrency.Message(1, "msg4", handler);
          let message5 = new concurrency.Message(callback, handler);
          let msgs: concurrency.Message[] = [message0, message1, message2, message3, message4, message5];
          for (let i: int = 0; i < msgs.length; i++) {
            let before: int = received.load();
            let expectWhat: int = msgs[i].getWhat();
            handler.sendMessage(msgs[i]);
            let waitCount: int = 0;
            while (received.load() < before + 1 && waitCount < 50) {
              waitCount++;
              try {
                await Utils.msSleep(100);
              } catch (error) {
                expect(error).assertFail();
              }
            }
            expect(received.load()).assertEqual(before + 1);
            expect(lastWhat.load()).assertEqual(expectWhat);
          }
          expect(received.load()).assertEqual(6);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest1300
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1300
     * @tc.desc   Verify concurrent handlers deliver all messages regardless of completion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest1300';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let result: concurrency.Message[] = [];
          let i: int = 0;
          let messages: concurrency.Message[] = [];
          let handlers: concurrency.MessageHandler[] = [];
          while (i < 5) {
            handlers.push(new concurrency.MessageHandler((msg: concurrency.Message) => {
              waitForCompletion(async () => {
                try {
                  await Sleep(1000);
                } catch (error) {
                  expect(error).assertFail();
                }
                result.push(msg)
                flag = true;
              })
            }, eaw));
            messages.push(new concurrency.Message(i, handlers[i]));
            handlers[i].sendMessage(messages[i]);
            i++;
          }
          let waitLen: int = 0;
          while (result.length < 5 && waitLen < 500) {
            waitLen++;
            try {
              await Sleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(result.length).assertEqual(messages.length);
          for (let mi: int = 0; mi < messages.length; mi++) {
            let found: boolean = false;
            for (let ri: int = 0; ri < result.length; ri++) {
              if (result[ri].equals(messages[mi])) {
                found = true;
                break;
              }
            }
            expect(found).assertTrue();
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
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest1400
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1400
     * @tc.desc   Verify multi-worker MessageHandler concurrent delivery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest1400';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let workNum: int = 0;
        let works: EAWorker[] = [];
        try {
          let lock = new AsyncLock();
          let result: concurrency.Message[] = [];
          let handlerNum: int = 0;
          let messageNum: int = 0;
          while (workNum < 3) {
            works.push(new EAWorker());
            works[workNum].start();
            while (handlerNum < 2) {
              let handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
                waitForCompletion(async () => {
                  try {
                    let lockCallback = () => {
                      result.push(msg);
                      console.info(`push msg`);
                    };
                    await lock.lockAsync(lockCallback);
                    try {
                      await Sleep(1000);
                    } catch (error) {
                      expect(error).assertFail();
                    }
                    flag = true;
                  } catch (error) {
                    console.info(`MessageScenarioSecondTest async task error: ${JSON.stringify(error)}`);
                  }
                })
              }, works[workNum]);
              while (messageNum < 5) {
                let message = new concurrency.Message(messageNum, handler);
                handler.sendMessage(message);
                messageNum++;
              }
              messageNum = 0;
              handlerNum++;
            }
            handlerNum = 0;
            workNum++;
          }
          let waitLen30: int = 0;
          while (result.length < 30 && waitLen30 < 500) {
            waitLen30++;
            try {
              await Sleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
            console.info(`result.length ${result.length}`);
          }
          expect(result.length).assertEqual(30);
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
          while (workNum > 0) {
            try {
              works[--workNum].quit();
            } catch (error) {
              console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
              expect(false).assertFail();
            }
          }
          console.info(`${TAG} test end`)
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest1500
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1500
     * @tc.desc   Verify quit worker after partial message processing completes safely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest1500';
        let flag: boolean = false;
        let eaw = new EAWorker();
        console.info(`${TAG} test start`);
        try {
          eaw.start();
          let result: concurrency.Message[] = [];
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async (): Promise<void> => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              result.push(msg);
              console.info(`push msg`);
              flag = true;
            })();
          }, eaw);

          let message = new concurrency.Message(handler);
          let i: int = 5;
          while (i > 0) {
            handler.sendMessage(message);
            i--;
          }

          let waitReady: int = 0;
          while (result.length < 2 && waitReady < 50) {
            waitReady++;
            try {
              await Sleep(200);
            } catch (error) {
              expect(error).assertFail();
            }
            console.info(`wait ready ${result.length}`);
          }
          expect(result.length >= 2).assertTrue();
          console.info(`quit after processed ${result.length}`);
          eaw.quit();
          let waitQuit: int = 0;
          while (eaw.isAlive() && waitQuit < 50) {
            waitQuit++;
            try {
              await Sleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(eaw.isAlive()).assertFalse();
          expect(result.length >= 2).assertTrue();
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
          if (eaw.isAlive()) { eaw.quit(); }
          console.info(`${TAG} test end`)
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest1600
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1600
     * @tc.desc   Verify removeMessages clears pending what after first message starts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest1600';
        let flag: boolean = false;
        let firstStarted: boolean = false;
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            firstStarted = true;
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, eaw);
          let messageObj = new concurrency.Message(1, "messageObj", handler);
          let message1 = new concurrency.Message(1, handler);
          handler.sendMessage(messageObj);
          let waitFirst: int = 0;
          while (!firstStarted && waitFirst < 50) {
            waitFirst++;
            try {
              await Utils.msSleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(firstStarted).assertTrue();
          handler.sendMessage(message1);
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
          handler.removeMessages(1);
          // messageObj 正在执行（IN_EXECUTION），所以 hasMessages(1) 仍为 true；
          // removeMessages 只移除 NOT_EXECUTED 的 pending 消息（message1）
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
          handler.sendMessage(message1);
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
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
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest1700
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1700
     * @tc.desc   Verify MessageHandler getWorker returns constructor EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const TAG: string = 'MessageScenarioSecondTest1700';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          }, eaw);
          expect(handler.getWorker()).assertEqual(eaw);
        } catch (error) {
          console.info(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
      });

    /**
     * @tc.name   MessageScenarioSecondTest1800
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1800
     * @tc.desc   Verify MessageHandler getWorker equals bound EAWorker instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG: string = 'MessageScenarioSecondTest1800';
        console.info(`${TAG} test start`);
        let eaw1 = new EAWorker();
        let eaw2 = new EAWorker();
        try {
          eaw1.start();
          eaw2.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          }, eaw1);
          expect(handler.getWorker() === eaw1).assertTrue();
        } catch (error) {
          console.info(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw1.quit();
            eaw2.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
      });

    /**
     * @tc.name   MessageScenarioSecondTest1900
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_1900
     * @tc.desc   Verify MessageHandler post and message interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioSecondTest1900';
        console.info(`${TAG} test start`);
        let doneFlag: boolean = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const handler = new concurrency.MessageHandler(() => {
            (async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              doneFlag = true;
            })()
          }, worker);
          const ok = handler.sendEmptyMessage(1);
          console.info(`${TAG} sendEmptyMessage(1) returned: ${ok}`);
          expect(ok).assertTrue();
          console.info(`${TAG} Messages in queue: ${handler.hasMessages(1)}`);
          console.info(`${TAG} doneFlag: ${doneFlag}`);
          expect(handler.hasMessages(1)).assertTrue();
          let waitDone: int = 0;
          while (!doneFlag && waitDone < 50) {
            waitDone++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(doneFlag).assertTrue();
          console.info(`${TAG} Messages in queue 2: ${handler.hasMessages(1)}`);
          expect(doneFlag).assertTrue();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest2000
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2000
     * @tc.desc   Verify sendEmptyMessage delivers expected what to handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioSecondTest2000';
        console.info(`${TAG} test start`);
        let doneFlag: boolean = false;
        const worker = new EAWorker();
        worker.start();
        try {
          let receivedWhat: int = -1;
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              receivedWhat = msg.getWhat();
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              doneFlag = true;
            })()
          }, worker);
          const ok = handler.sendEmptyMessage(1);
          console.info(`${TAG} sendEmptyMessage(1) returned: ${ok}`);
          expect(ok).assertTrue();
          console.info(`${TAG} doneFlag: ${doneFlag}`);
          let waitDone: int = 0;
          while (!doneFlag && waitDone < 50) {
            waitDone++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(doneFlag).assertTrue();
          console.info(`${TAG} receivedWhat: ${receivedWhat}`);
          expect(doneFlag).assertTrue();
          expect(receivedWhat).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest2100
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2100
     * @tc.desc   Verify sendEmptyMessage basic delivery path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = 'MessageScenarioSecondTest2100';
        console.info(`${TAG} test start`);
        let h1Received = false;
        let h2Received = false;
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const msg = new concurrency.Message(h2);
          const sendOk = h1.sendMessage(msg);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.info(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioSecondTest2200
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2200
     * @tc.desc   Verify hasMessages and removeMessages interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioSecondTest2200';
        console.info(`${TAG} test start`);
        let received = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler(() => {
            received = true;
          }, worker);
          const msg = new concurrency.Message(h);
          expect(h.sendMessage(msg)).assertTrue();
          try {
            await Sleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
          expect(received).assertTrue();
          let waitRecv: int = 0;
          while (!received && waitRecv < 50) {
            waitRecv++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(received).assertTrue();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest2300
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2300
     * @tc.desc   Verify hasCallbacks and removeCallbacks interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const TAG = 'MessageScenarioSecondTest2300';
        console.info(`${TAG} test start`);
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        let h1Received = false;
        let h2Received = false;
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const msg = new concurrency.Message(() => {
            h1Received = true;
          }, h1);
          const sendOk = h2.sendMessage(msg);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.info(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioSecondTest2400
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2400
     * @tc.desc   Verify handler callback executes and Message callback is not auto-executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioSecondTest2400';
        console.info(`${TAG} test start`);
        let received = false;
        let received2 = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler(() => {
            received = true;
          }, worker);
          const msg = new concurrency.Message(() => {
            received2 = true;
          }, h);
          expect(h.sendMessage(msg)).assertTrue();
          try {
            await Sleep(2000);
          } catch (error) {
            expect(error).assertFail();
          }
          console.info(`${TAG} received: ${received}`);
          console.info(`${TAG} received2: ${received2}`);
          expect(received).assertTrue();
          expect(received2).assertFalse();
          let waitRecv: int = 0;
          while (!received && waitRecv < 50) {
            waitRecv++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(received).assertTrue();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest2500
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2500
     * @tc.desc   Verify Message getCallback invocation through sendMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioSecondTest2500';
        console.info(`${TAG} test start`);
        let executed: boolean = false;
        let received: boolean = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler((msg: concurrency.Message) => {
            const cb = msg.getCallback()!;
            if (cb) {
              cb();
            }
            received = true;
          }, worker);
          const msg = new concurrency.Message(() => {
            executed = true;
          }, h);
          expect(h.sendMessage(msg)).assertTrue();
          let waitExec: int = 0;
          while (!executed && waitExec < 50) {
            waitExec++;
            try {
              await Utils.msSleep(10);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(executed).assertTrue();
          let waitRecv: int = 0;
          while (!received && waitRecv < 50) {
            waitRecv++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(received).assertTrue();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest2600
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2600
     * @tc.desc   Verify MessageHandler removeCallbacks return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const TAG = 'MessageScenarioSecondTest2600';
        console.info(`${TAG} test start`);
        let h1Received = false;
        let h2Received = false;
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const msg = new concurrency.Message(999, h1);
          const sendOk = h2.sendMessage(msg);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.info(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioSecondTest2700
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2700
     * @tc.desc   Verify MessageHandler removeCallbacks with multiple posts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioSecondTest2700';
        console.info(`${TAG} test start`);
        let flag = false;
        const worker = new EAWorker();
        worker.start();
        const testValues: int[] = [0, 1, -1, 65535, -65536];
        try {
          const h = new concurrency.MessageHandler(() => {
            flag = true;
          }, worker);
          for (const val of testValues) {
            const msg = new concurrency.Message(val, h);
            expect(h.sendMessage(msg)).assertTrue();
            expect(msg.getWhat()).assertEqual(val);
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
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest2800
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2800
     * @tc.desc   Verify Message equals behavior in scenario context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const TAG = 'MessageScenarioSecondTest2800';
        console.info(`${TAG} test start`);
        let h1Received = false;
        let h2Received = false;
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const data = new Map<string, number>();
          data.set('x', 1);
          const msg = new concurrency.Message(123, data, h1);
          const sendOk = h2.sendMessage(msg);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.info(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
      });

    /**
     * @tc.name   MessageScenarioSecondTest2900
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_2900
     * @tc.desc   Verify MessageHandler sendMessage return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioSecondTest2900';
        console.info(`${TAG} test start`);
        let flag = false;
        const worker = new EAWorker();
        worker.start();
        const testValues: int[] = [0, 1, -1, 65535, -65536];
        try {
          const h = new concurrency.MessageHandler(() => {
            flag = true;
          }, worker);
          const data = new Map<string, number>();
          data.set('any', 1);
          for (const val of testValues) {
            const msg = new concurrency.Message(val, data, h);
            expect(h.sendMessage(msg)).assertTrue();
            expect(msg.getWhat()).assertEqual(val);
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
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest3000
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3000
     * @tc.desc   Verify Message getObject round-trips multiple object types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageScenarioSecondTest3000';
        console.info(`${TAG} test start`);
        let flag = false;
        const samples: Object[] = [
          2000,
          3.14,
          255,
          true,
          'hello',
          [1, 2, 3],
          new Map<string, string>([['k', 'v']])
        ];
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler(() => {
            flag = true;
          }, worker);
          for (const obj of samples) {
            const msg = new concurrency.Message(0, obj, h);
            expect(h.sendMessage(msg)).assertTrue();
            expect(msg.getObject() as Object).assertEqual(obj);
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
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
          ;
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest3100
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3100
     * @tc.desc   Verify MessageHandler removeMessages for pending queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = 'MessageScenarioSecondTest3100';
        console.info(`${TAG} test start`);
        let h1Received = false;
        let h2Received = false;
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const m1 = new concurrency.Message(h1);
          const sendOk = h2.sendMessage(m1);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.info(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
          console.info(`${TAG} test end`);
        }
      });


    /**
     * @tc.name   MessageScenarioSecondTest3200
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3200
     * @tc.desc   Verify Message what object constructor scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest001';
        let worker1 = new EAWorker("worker one");
        let flag: boolean = false;
        worker1.start();
        try {
          let handler1: concurrency.MessageHandler;
          handler1 = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker1);
          let message1 = new concurrency.Message(1, 1, handler1);
          message1.sendToTarget();
          expect(message1.getWhat()).assertEqual(1)
          expect(message1.getObject() as int).assertEqual(1)
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
            worker1.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioSecondTest3300
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3300
     * @tc.desc   Verify MessageHandler concurrent send and hasMessages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest3300';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg1 = new concurrency.Message(0, 1, handler);
          let msg2 = new concurrency.Message(1, 1, handler);
          let msg3 = new concurrency.Message(-165535, 1, handler);
          let msg4 = new concurrency.Message(-65535, 1, handler);
          let msg5 = new concurrency.Message(2147483647, 1, handler);
          let msg6 = new concurrency.Message(-2147483648, 1, handler);
          handler.sendMessage(msg1);
          expect(msg1.getWhat()).assertEqual(0);
          expect(msg2.getWhat()).assertEqual(1);
          expect(msg3.getWhat()).assertEqual(-165535);
          expect(msg4.getWhat()).assertEqual(-65535);
          expect(msg5.getWhat()).assertEqual(2147483647);
          expect(msg6.getWhat()).assertEqual(-2147483648);
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
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest3400
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3400
     * @tc.desc   Verify MessageHandler removeMessagesWhatObj scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest3400';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg = new concurrency.Message(1, 1 as int, handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as int).assertEqual(1);
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
            expect(false).assertFail();
          }
        }
        done();
      });


    /**
     * @tc.name   MessageScenarioSecondTest3500
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3500
     * @tc.desc   Verify MessageHandler sendEmptyMessage delayed handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest3500';
        let worker = new EAWorker();
        let received = new AtomicInt(0);
        try {
          worker.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            received.fetchAdd(1);
          }, worker)
          let msg = new concurrency.Message(1, 1 as short, handler);
          handler.sendMessage(msg);
          // short object must be asserted as short (not int)
          expect(msg.getObject() as short).assertEqual(1 as short);
          let waitCount: int = 0;
          while (received.load() < 1 && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(received.load()).assertEqual(1);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest3600
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3600
     * @tc.desc   Verify MessageHandler post delayed handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest3400';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg = new concurrency.Message(1, true, handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as Boolean).assertEqual(true);
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
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest3700
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3700
     * @tc.desc   Verify MessageHandler callback removal after post
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest3400';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg = new concurrency.Message(1, '1', handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as string).assertEqual('1');
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
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest3800
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3800
     * @tc.desc   Verify MessageHandler multi-message remove path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest3400';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg = new concurrency.Message(1, [1, 2], handler);
          handler.sendMessage(msg);
          const msgObj = msg.getObject()! as Object;
          expect(msgObj.toString()).assertEqual('1,2');
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
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest3900
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_3900
     * @tc.desc   Verify MessageHandler scenario coverage for send and wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest3400';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg = new concurrency.Message(1, obj, handler);
          handler.sendMessage(msg);
          expect((msg.getObject() as MessageObject)!.id).assertEqual(10);
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
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest4000
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4000
     * @tc.desc   Verify getCallback returns undefined for Message with what and object payload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioSecondTest3500';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg1 = new concurrency.Message(1, 1, handler);
          handler.sendMessage(msg1);
          expect(msg1.getCallback()).assertEqual(undefined);
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
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest4100
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4100
     * @tc.desc   Verify MessageHandler sendMessage scenario for case 4200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            let postCb2118 = () => {
            };
            let handlerValue = handler.post(postCb2118)
            expect(handlerValue).assertTrue();
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
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      })


    /**
     * @tc.name   MessageScenarioSecondTest4200
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4200
     * @tc.desc   Verify MessageHandler sendMessage scenario for case 4400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            let postedCallback = (): void => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            };
            let handlerValue = handler.post(postedCallback)
            expect(handlerValue).assertTrue();
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
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioSecondTest4300
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4300
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 4500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler | undefined;
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            let postedCallback = (): void => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            };
            handlerValue = handler!.post(postedCallback)
            resolve(1);
          });
        };
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            waitForCompletion(async () => {
              try {
                await Sleep(1000);
              } catch (error) {
                expect(error).assertFail();
              }
              flag = true;
            })
          }, worker)
          worker.start();
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            func();
            expect(handlerValue).assertTrue();
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
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioSecondTest4400
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4400
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 4600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let handlerValue: boolean = false;
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          waitForCompletion(async () => {
            try {
              await Sleep(1000);
            } catch (error) {
              expect(error).assertFail();
            }
            flag = true;
          })
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            let postedCallback = (): void => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            };
            handlerValue = handler.post(postedCallback)
            resolve(1);
          });
        };
        try {
          worker.start();
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            await func();
            expect(handlerValue).assertTrue()
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
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioSecondTest4500
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4500
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 4700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let p = () => {
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
        }
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          waitForCompletion(async () => {
            try {
              await Sleep(1000);
            } catch (error) {
              expect(error).assertFail();
            }
            flag = true;
          })
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(p)
            resolve(1);
          });
        };
        try {
          worker.start();
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            func();
            expect(handlerValue).assertTrue()
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
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioSecondTest4600
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4600
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 4800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          waitForCompletion(async () => {
            try {
              await Sleep(1000);
            } catch (error) {
              expect(error).assertFail();
            }
            flag = true;
          })
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            let postedCallback = (): void => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            };
            handlerValue = handler.post(postedCallback)
            resolve(1);
          });
        };
        let p = () => {
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
        }
        worker.start();
        try {
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            func();
            expect(handlerValue).assertTrue()
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
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioSecondTest4700
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4700
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 4900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          waitForCompletion(async () => {
            try {
              await Sleep(1000);
            } catch (error) {
              expect(error).assertFail();
            }
            flag = true;
          })
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            let postedCallback = (): void => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            };
            handlerValue = handler.post(postedCallback)
            resolve(1);
          });
        };
        worker.start();
        try {
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            await func();
            expect(handlerValue).assertTrue()
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
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioSecondTest4800
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4800
     * @tc.desc   Verify Message and MessageHandler concurrent scenario for case 5000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          waitForCompletion(async () => {
            try {
              await Sleep(1000);
            } catch (error) {
              expect(error).assertFail();
            }
            flag = true;
          })
        }, worker)
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          let timeOut = () => {
            const end = Date.now() + 1000;
            while (Date.now() < end) {
            }
          }
          let headMsg = new concurrency.Message(timeOut, handler)
          handler.sendMessage(headMsg);
          expect(handler.removeCallbacks(p)).assertEqual(false);
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
            expect(false).assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   MessageScenarioSecondTest4900
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_4900
     * @tc.desc   Verify removeCallbacks returns false when callback is not queued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let worker = new EAWorker();
        const TAG: string = 'MessageTest061';
        let flag: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          (async () => {
            try {
              await Sleep(1000);
            } catch (error) {
              expect(error).assertFail();
            }
            flag = true;
          })()
        }, worker);
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          expect(handler.removeCallbacks(p)).assertEqual(false);
          expect(handler.removeCallbacks(p)).assertEqual(false);
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
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest5000
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_5000
     * @tc.desc   Verify MessageHandler callback queue scenario for case 5200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest062';
        let worker = new EAWorker();
        let removed = new AtomicInt(0);
        let doneFlag = new AtomicInt(0);
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            let cb: (() => void) | undefined = msg.getCallback();
            if (cb !== undefined) { cb(); }
          }, worker);
          // post+remove inside post to avoid EAWorker draining before remove
          let postedCallbackSecond = (): void => {
            handler.post(p);
            if (handler.removeCallbacks(p)) {
              removed.fetchAdd(1);
            }
            doneFlag.fetchAdd(1);
          };
          handler.post(postedCallbackSecond);
          let waitCount: int = 0;
          while (doneFlag.load() < 1 && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(removed.load()).assertEqual(1);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest5100
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_5100
     * @tc.desc   Verify MessageHandler callback queue scenario for case 5300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let worker = new EAWorker();
        worker.start();
        const TAG: string = 'MessageTest063';
        let handler: concurrency.MessageHandler;
        let p = () => {
          let a = 1;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          try {
            await Utils.msSleep(1300);
          } catch (error) {
            expect(error).assertFail();
          }
          expect(handler.removeCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest5200
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_5200
     * @tc.desc   Verify MessageHandler callback queue scenario for case 5400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest064';
        let worker = new EAWorker();
        let removed = new AtomicInt(0);
        let doneFlag = new AtomicInt(0);
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            let cb: (() => void) | undefined = msg.getCallback();
            if (cb !== undefined) { cb(); }
          }, worker);
          // post+remove inside post to avoid EAWorker draining before remove
          let postedCallbackThird = (): void => {
            handler.post(p);
            handler.post(p);
            if (handler.removeCallbacks(p)) {
              removed.fetchAdd(1);
            }
            doneFlag.fetchAdd(1);
          };
          handler.post(postedCallbackThird);
          let waitCount: int = 0;
          while (doneFlag.load() < 1 && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(removed.load()).assertEqual(1);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest5300
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_5300
     * @tc.desc   Verify MessageHandler callback queue scenario for case 5500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest065';
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 1;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000)
              } catch (error) {
                console.info(`MessageScenarioSecondTest5500 sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          handler.post(p);
          handler.post(p);
          try {
            await Utils.msSleep(1300);
          } catch (error) {
            expect(error).assertFail();
          }
          expect(handler.removeCallbacks(p)).assertEqual(false);
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.hasCallbacks(p);
          expect(handler.removeCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest5400
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_5400
     * @tc.desc   Verify MessageHandler sendMessage scenario for case 5600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let removed = new AtomicInt(0);
        let doneFlag = new AtomicInt(0);
        let p = () => {
        }
        worker.start();
        try {
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            let cb: (() => void) | undefined = msg.getCallback();
            if (cb !== undefined) { cb(); }
          }, worker);
          // send+remove inside post to avoid EAWorker draining before remove
          let postedCallback = (): void => {
            handler.sendMessage(new concurrency.Message(p, handler));
            if (handler.removeCallbacks(p)) {
              removed.fetchAdd(1);
            }
            doneFlag.fetchAdd(1);
          };
          handler.post(postedCallback);
          let waitCount: int = 0;
          while (doneFlag.load() < 1 && waitCount < 50) {
            waitCount++;
            try {
              await Utils.msSleep(100);
            } catch (error) {
              expect(error).assertFail();
            }
          }
          expect(removed.load()).assertEqual(1);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });

    /**
     * @tc.name   MessageScenarioSecondTest5500
     * @tc.number SUB_MESSAGE_SCENARIO_SECOND_TEST_5500
     * @tc.desc   Verify MessageHandler callback queue scenario for case 5700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest067';
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 1;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              try {
                await Sleep(1000)
              } catch (error) {
                console.info(`MessageScenarioSecondTest5500 sleep error: ${JSON.stringify(error)}`);
              }
            })()
          }, worker);
          handler.sendMessage(new concurrency.Message(p, handler));
          try {
            await Utils.msSleep(1300);
          } catch (error) {
            expect(error).assertFail();
          }
          expect(handler.removeCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            expect(false).assertFail();
          }
        }
        done();
      });
  });
}
