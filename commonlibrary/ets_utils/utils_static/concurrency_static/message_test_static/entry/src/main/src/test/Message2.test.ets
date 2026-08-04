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

function TSleep(delay:int):void {
  for(let t = Date.now(); Date.now() - t <= delay;);
}

export function Sleep(ms: int): Promise<number> {
  return new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1)
    }, ms)
  });
}

type CB = () => void;

export default function MessageTest2(): void {
  describe('MessageTest2', (): void => {
    afterEach(async () => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   GetWhatTest0158
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0158
     * @tc.desc   Verify Message.getWhat() returns default value -1000000 for a message created with constructor(callback, handler) after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetWhatTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWhatTest002';
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
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }

          done();
        }
      });

    /**
     * @tc.name   GetWhatTest0159
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0159
     * @tc.desc   Verify Message.getWhat() returns specified what values (0, 1, -1, 65535, -65535, max/min int) after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetWhatTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWhatTest003';
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

          let messageMax: concurrency.Message = new concurrency.Message(Int.MAX_VALUE, handler);
          handler.sendMessage(messageMax);
          expect(messageMax.getWhat()).assertEqual(Int.MAX_VALUE);

          let messageMin: concurrency.Message = new concurrency.Message(Int.MIN_VALUE, handler);
          handler.sendMessage(messageMin);
          expect(messageMin.getWhat()).assertEqual(Int.MIN_VALUE);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetWhatTest0160
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0160
     * @tc.desc   Verify Message.getWhat() returns specified what values for constructor(what, obj, handler) messages sent via sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetWhatTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWhatTest004';
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

          let messageMax: concurrency.Message = new concurrency.Message(Int.MAX_VALUE, 'obj', handler);
          handler.sendMessage(messageMax);
          expect(messageMax.getWhat()).assertEqual(Int.MAX_VALUE);

          let messageMin: concurrency.Message = new concurrency.Message(Int.MIN_VALUE, 'obj', handler);
          handler.sendMessage(messageMin);
          expect(messageMin.getWhat()).assertEqual(Int.MIN_VALUE);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetCallbackTest0161
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0161
     * @tc.desc   Verify Message.getCallback() returns undefined for a message created with constructor(handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetCallbackTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetCallbackTest001';
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
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetCallbackTest0162
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0162
     * @tc.desc   Verify Message.getCallback() returns undefined for a message created with constructor(what, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetCallbackTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetCallbackTest002';
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
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetCallbackTest0163
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0163
     * @tc.desc   Verify Message.getCallback() returns undefined for a message created with constructor(what, obj, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetCallbackTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetCallbackTest003';
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
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetCallbackTest0164
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0164
     * @tc.desc   Verify Message.getCallback() returns the specified callback for a message created with constructor(callback, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetCallbackTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetCallbackTest004';
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
          let callback: CB = () => {
            console.log(`concurrency.Message callback！`);
          };
          let message: concurrency.Message = new concurrency.Message(callback, handler);
          let callback1: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback1).assertEqual(callback);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });


    /**
     * @tc.name   GetTargetTest0165
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0165
     * @tc.desc   Verify Message.getTarget() returns the bound handler for a message created with constructor(handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetTargetTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetTargetTest001';
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
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetTargetTest0166
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0166
     * @tc.desc   Verify Message.getTarget() returns the bound handler for a message created with constructor(what, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetTargetTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetTargetTest002';
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
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetTargetTest0167
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0167
     * @tc.desc   Verify Message.getTarget() returns the bound handler for a message created with constructor(what, obj, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetTargetTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetTargetTest003';
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
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetTargetTest0168
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0168
     * @tc.desc   Verify Message.getTarget() returns the bound handler for a message created with constructor(callback, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetTargetTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetTargetTest004';
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
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioTest0169
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0169
     * @tc.desc   Test multiple messages with different constructor variants are all received on the worker in order and keep equality with the original message objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest001';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let result: concurrency.Message[] = [];
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
              result.push(msg);
            })().awaitSync()
          }, eaw);
          let messages: concurrency.Message[] = [];
          let message0 = new concurrency.Message(handler);
          handler.sendMessage(message0);
          messages.push(message0);
          let message1: concurrency.Message = new concurrency.Message(1, handler);
          handler.sendMessage(message1);
          messages.push(message1);
          let message2: concurrency.Message = new concurrency.Message(10, handler);
          handler.sendMessage(message2);
          messages.push(message2);
          let message3: concurrency.Message = new concurrency.Message(-1, handler);
          handler.sendMessage(message3);
          messages.push(message3);
          let message4: concurrency.Message = new concurrency.Message(1, "msg4", handler);
          handler.sendMessage(message4);
          messages.push(message4);
          let callback: CB = () => {
            console.log(`concurrency.Message callback！`);
          };
          let message5 = new concurrency.Message(callback, handler);
          handler.sendMessage(message5);
          messages.push(message5);
          while (true) {
            await Sleep(10);
            if (result.length == 6) {
              break;
            }
          }
          console.info(`resulr length: ${result.length}  ${messages.length}`);
          expect(result.length).assertEqual(messages.length);
          for (const sent of messages) {
            expect(result.some((r) => r.equals(sent))).assertTrue();
          }
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioTest0170
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0170
     * @tc.desc   Test messages sent to multiple handlers on one worker are all received and keep equality with the original message objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageScenarioTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest002';
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
              (async () => {
                await Sleep(1000);
                result.push(msg)
                flag = true;
              })().awaitSync()
            }, eaw));
            messages.push(new concurrency.Message(i, handlers[i]));
            handlers[i].sendMessage(messages[i]);
            i++;
          }
          while (true) {
            await Sleep(10);
            if (result.length == 5) {
              break;
            }
          }
          expect(result.length).assertEqual(messages.length);
          for (const sent of messages) {
            expect(result.some((r) => r.equals(sent))).assertTrue();
          }
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioTest0171
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0171
     * @tc.desc   Test 30 messages across 3 workers with multiple handlers are all received with async lock protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest003';
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
                (async () => {
                  await lock.lockAsync(() => {
                    result.push(msg);
                    console.info(`push msg`);
                  })
                  await Sleep(1000);
                  flag = true;
                })().awaitSync()
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
          while (true) {
            await Sleep(10);
            console.info(`result.length ${result.length}`);
            if (result.length == 30) {
              break;
            }
          }
          expect(result.length == 30).assertTrue();
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          while (workNum > 0) {
            try {
              works[--workNum].quit();
            } catch (error) {
              console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            }
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioTest0172
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0172
     * @tc.desc   Test only the messages processed before worker quit() are received by the handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageScenarioTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest004';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        try {
          let eaw = new EAWorker();
          eaw.start();
          let result: concurrency.Message[] = [];
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            TSleep(1000);
            result.push(msg);
            console.info(`push msg`);
            flag = true;
          }, eaw);

          setTimeout(() => {
            console.info(`quit!`);
            eaw.quit();
          }, 2000);

          let message = new concurrency.Message(handler);
          let i: int = 5;
          while (i > 0) {
            handler.sendMessage(message);
            i--;
          }

          while (true) {
            await Sleep(200);
            console.info(`sleep 200 ${result.length}  ${eaw.isAlive()}`);
            if (result.length == 2 && !eaw.isAlive()) {
              break;
            }
          }
          expect(result.length == 2).assertTrue();
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioTest0173
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0173
     * @tc.desc   Test hasMessages() and removeMessages() behavior when multiple messages with the same what (with/without object) are queued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest005';
        let flag: boolean = false;
        let firstStarted: boolean = false;
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            firstStarted = true;
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, eaw);
          let messageObj = new concurrency.Message(1, "messageObj", handler);
          let message1 = new concurrency.Message(1, handler);
          handler.sendMessage(messageObj);
          while (!firstStarted) {
            await Utils.msSleep(10);
          }
          handler.sendMessage(message1);
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
          handler.removeMessages(1);
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
          handler.sendMessage(message1);
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetWorkerTest0174
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0174
     * @tc.desc   Verify MessageHandler.getWorker() returns the worker bound at construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetWorkerTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWorkerTest001';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          }, eaw);
          expect(handler.getWorker()).assertEqual(eaw);
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   GetWorkerTest0175
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0175
     * @tc.desc   Verify MessageHandler.getWorker() returns the bound worker rather than another worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetWorkerTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWorkerTest002';
        console.info(`${TAG} test start`);
        let eaw1 = new EAWorker();
        let eaw2 = new EAWorker();
        try {
          eaw1.start();
          eaw2.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          }, eaw1);
          expect(handler.getWorker() != eaw2).assertTrue();
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw1.quit();
            eaw2.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   SendEmptyMessageTest0176
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0176
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() enqueues an empty message with the specified what and it is processed by the handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendEmptyMessageTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'SendEmptyMessageTest001';
        console.info(`${TAG} test start`);
        let doneFlag: boolean = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const handler = new concurrency.MessageHandler(() => {
            (async () => {
              await Sleep(1000)
              doneFlag = true;
            })().awaitSync()
          }, worker);
          const ok = handler.sendEmptyMessage(1);
          console.info(`${TAG} sendEmptyMessage(1) returned: ${ok}`);
          expect(ok).assertTrue();
          console.info(`${TAG} Messages in queue: ${handler.hasMessages(1)}`);
          console.info(`${TAG} doneFlag: ${doneFlag}`);
          expect(handler.hasMessages(1)).assertTrue();
          while (!doneFlag) {
            await Utils.msSleep(100)
          }
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
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   SendEmptyMessageTest0177
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0177
     * @tc.desc   Verify MessageHandler.sendEmptyMessage() delivers the message whose getWhat() equals the specified what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendEmptyMessageTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG = 'SendEmptyMessageTest002';
        console.info(`${TAG} test start`);
        let doneFlag: boolean = false;
        const worker = new EAWorker();
        worker.start();
        try {
          let receivedWhat = -1;
          const handler = new concurrency.MessageHandler((msg) => {
            (async () => {
              receivedWhat = msg.getWhat();
              await Sleep(1000)
              doneFlag = true;
            })().awaitSync()
          }, worker);
          const ok = handler.sendEmptyMessage(1);
          console.info(`${TAG} sendEmptyMessage(1) returned: ${ok}`);
          expect(ok).assertTrue();
          console.info(`${TAG} doneFlag: ${doneFlag}`);
          while (!doneFlag) {
            await Utils.msSleep(100)
          }
          console.info(`${TAG} receivedWhat: ${receivedWhat}`);
          expect(doneFlag).assertTrue();
          expect(receivedWhat).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   SendMessageTest0178
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0178
     * @tc.desc   Verify MessageHandler.sendMessage() returns false and delivers nothing when the message target handler is on another worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendMessageTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        const TAG = 'SendMessageTest001';
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
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   SendMessageTest0179
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0179
     * @tc.desc   Verify MessageHandler.sendMessage() returns true and the handler callback runs for a message bound to the same handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest002';
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
          await Sleep(100);
          expect(received).assertTrue();
          while (!received) {
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
     * @tc.name   SendMessageTest0180
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0180
     * @tc.desc   Verify MessageHandler.sendMessage() returns false when a message with callback is sent to a handler on another worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest003';
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
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   SendMessageTest0181
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0181
     * @tc.desc   Verify MessageHandler.sendMessage() invokes the handler callback instead of the message callback for a callback-carrying message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest004';
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
          await Sleep(2000);
          console.info(`${TAG} received: ${received}`);
          console.info(`${TAG} received2: ${received2}`);
          expect(received).assertTrue();
          expect(received2).assertFalse();
          while (!received) {
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
     * @tc.name   SendMessageTest0182
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0182
     * @tc.desc   Verify MessageHandler.sendMessage() delivers a message whose callback is obtained via getCallback() and executed by the handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest005';
        console.info(`${TAG} test start`);
        let executed = false;
        let received = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler((msg) => {
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
          await Sleep(200);
          expect(executed).assertTrue();
          while (!received) {
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
     * @tc.name   SendMessageTest0183
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0183
     * @tc.desc   Verify MessageHandler.sendMessage() returns false when a message with what is sent to a handler on another worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest006';
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
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   SendMessageTest0184
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0184
     * @tc.desc   Verify MessageHandler.sendMessage() returns true for various what values and getWhat() preserves each value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest007';
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
     * @tc.name   SendMessageTest0185
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0185
     * @tc.desc   Verify MessageHandler.sendMessage() returns false when a message with Map object is sent to a handler on another worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest008';
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
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   SendMessageTest0186
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0186
     * @tc.desc   Verify MessageHandler.sendMessage() returns true for various what values with Map object payload and getWhat() preserves each value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'SendMessageTest009';
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
     * @tc.name   SendMessageTest0187
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0187
     * @tc.desc   Verify MessageHandler.sendMessage() returns true for various object payload types (number, float, boolean, string, array, Map) and getObject() returns each payload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendMessageTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest010';
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
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
          ;
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
     * @tc.name   SendMessageTest0188
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0188
     * @tc.desc   Verify MessageHandler.sendMessage() returns false when a message bound to another handler is sent to the current handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendMessageTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        const TAG = 'SendMessageTest011';
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
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
            worker2.quit();
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.name   MessageHandler0189
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0189
     * @tc.desc   Verify Message(what, obj, handler) constructor preserves what and object (int) values after sendToTarget()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest001';
        let worker1 = new EAWorker("worker one");
        let flag: boolean = false;
        worker1.start();
        try {
          let handler1: concurrency.MessageHandler;
          handler1 = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker1);
          let message1 = new concurrency.Message(1, 1, handler1);
          message1.sendToTarget();
          expect(message1.getWhat()).assertEqual(1)
          expect(message1.getObject() as int).assertEqual(1)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   MessageHandler0190
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0190
     * @tc.desc   Verify Message(what, obj, handler) constructor preserves various what values (0, 1, negative, max/min int) after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg1 = new concurrency.Message(0, 1, handler);
          let msg2 = new concurrency.Message(1, 1, handler);
          let msg3 = new concurrency.Message(-165535, 1, handler);
          let msg4 = new concurrency.Message(-65535, 1, handler);
          let msg5 = new concurrency.Message(Int.MAX_VALUE, 1, handler);
          let msg6 = new concurrency.Message(Int.MIN_VALUE, 1, handler);
          handler.sendMessage(msg1);
          expect(msg1.getWhat()).assertEqual(0);
          expect(msg2.getWhat()).assertEqual(1);
          expect(msg3.getWhat()).assertEqual(-165535);
          expect(msg4.getWhat()).assertEqual(-65535);
          expect(msg5.getWhat()).assertEqual(Int.MAX_VALUE);
          expect(msg6.getWhat()).assertEqual(Int.MIN_VALUE);
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
          done();
        }
      });

    /**
     * @tc.name   MessageHandler0191
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0191
     * @tc.desc   Verify Message(what, obj, handler) constructor keeps getObject() as int payload after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(1, 1 as int, handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as int).assertEqual(1);
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
          done();
        }
      });

    /**
     * @tc.name   MessageHandler0192
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0192
     * @tc.desc   Verify Message(what, obj, handler) constructor keeps getObject() as int payload after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(1, 1, handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as int).assertEqual(1);
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
          done();
        }
      });

    /**
     * @tc.name   MessageHandler0193
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0193
     * @tc.desc   Verify Message(what, obj, handler) constructor keeps getObject() as int payload after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(1, 1, handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as int).assertEqual(1);
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
          done();
        }
      });

    /**
     * @tc.name   MessageHandler0194
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0194
     * @tc.desc   Verify Message(what, obj, handler) constructor keeps getObject() as Boolean payload after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(1, true, handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as Boolean).assertEqual(true);
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
          done();
        }
      });

    /**
     * @tc.name   MessageHandler0195
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0195
     * @tc.desc   Verify Message(what, obj, handler) constructor keeps getObject() as string payload after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(1, '1', handler);
          handler.sendMessage(msg);
          expect(msg.getObject() as string).assertEqual('1');
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
          done();
        }
      });

    /**
     * @tc.name   MessageHandler0196
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0196
     * @tc.desc   Verify Message(what, obj, handler) constructor keeps getObject() as array payload after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(1, [1, 2], handler);
          handler.sendMessage(msg);
          const msgObj = msg.getObject()! as Object;
          expect(msgObj.toString()).assertEqual('1,2');
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
          done();
        }
      });

    /**
     * @tc.name   MessageHandler0197
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0197
     * @tc.desc   Verify Message(what, obj, handler) constructor keeps custom object payload after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(1, obj, handler);
          handler.sendMessage(msg);
          expect((msg.getObject() as MessageObject)!.id).assertEqual(10);
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
          done();
        }
      });

    /**
     * @tc.name   MessageHandler0198
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0198
     * @tc.desc   Verify Message(what, obj, handler) constructor without callback leaves getCallback() undefined after sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandler0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler004';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg1 = new concurrency.Message(1, 1, handler);
          handler.sendMessage(msg1);
          expect(msg1.getCallback()).assertEqual(undefined);
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
          done();
        }
      });

    /**
     * @tc.name   PostTest0199
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0199
     * @tc.desc   Verify MessageHandler.post() returns true for 10 anonymous callbacks posted to the handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("PostTest0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let time: number = 0
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            let handlerValue = handler.post(() => {
            })
            time++;
            expect(handlerValue).assertTrue();
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   PostTest0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0200
     * @tc.desc   Verify MessageHandler.post() returns true for 10 posts of the same callback p
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("PostTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let time: number = 0
        worker.start();
        let p = () => {
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            let handlerValue = handler.post(p)
            time++;
            expect(handlerValue).assertTrue();
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   PostTest0201
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0201
     * @tc.desc   Verify MessageHandler.post() returns true for 10 blocking anonymous callbacks posted to the handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("PostTest0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let time: number = 0;
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            let handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
            time++;
            expect(handlerValue).assertTrue();
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   PostTest0202
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0202
     * @tc.desc   Verify MessageHandler.post() returns true for blocking callbacks posted asynchronously without awaiting the post
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("PostTest0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler | undefined;
        let flag: boolean = false;
        let time: number = 0
        let handlerValue: boolean = false;
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler!.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
            resolve(1);
          });
        };
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            (async () => {
              await Sleep(1000);
              flag = true;
            })().awaitSync()
          }, worker)
          worker.start();
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            func();
            time++;
            expect(handlerValue).assertTrue();
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   PostTest0203
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0203
     * @tc.desc   Verify MessageHandler.post() returns true for 10 awaited posts of blocking callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("PostTest0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let time: number = 0
        let flag: boolean = false;
        let handlerValue: boolean = false;
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          (async () => {
            await Sleep(1000);
            flag = true;
          })().awaitSync()
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
            resolve(1);
          });
        };
        try {
          worker.start();
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            await func();
            time++;
            expect(handlerValue).assertTrue()
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   PostTest0204
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0204
     * @tc.desc   Verify MessageHandler.post() returns true for 10 posts of the same blocking callback p via async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("PostTest0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let time: number = 0;
        let p = () => {
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
        }
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          (async () => {
            await Sleep(1000);
            flag = true;
          })().awaitSync()
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
            time++;
            expect(handlerValue).assertTrue()
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   PostTest0205
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0205
     * @tc.desc   Verify MessageHandler.post() returns true for 10 anonymous blocking callbacks posted via async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("PostTest0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let time: number = 0;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          (async () => {
            await Sleep(1000);
            flag = true;
          })().awaitSync()
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
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
            time++;
            expect(handlerValue).assertTrue()
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   PostTest0206
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0206
     * @tc.desc   Verify MessageHandler.post() returns true for 10 awaited posts of anonymous blocking callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("PostTest0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let time: number = 0;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          (async () => {
            await Sleep(1000);
            flag = true;
          })().awaitSync()
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
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
            await func();
            time++;
            expect(handlerValue).assertTrue()
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   RemoveCallbacksTest0207
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0207
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns false for a callback that was never posted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("RemoveCallbacksTest0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          (async () => {
            await Sleep(1000);
            flag = true;
          })().awaitSync()
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
          while (!flag) {
            await Utils.msSleep(100);
          }
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.name   RemoveCallbacksTest0208
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0208
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns false repeatedly for a callback that was never posted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveCallbacksTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let worker = new EAWorker();
        const TAG: string = 'MessageTest061';
        let flag: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          (async () => {
            await Sleep(1000);
            flag = true;
          })().awaitSync()
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
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   RemoveCallbacksTest0209
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0209
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns true and removes a callback previously posted via post()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveCallbacksTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let worker = new EAWorker();
        const TAG: string = 'MessageTest062';
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            TSleep(1000);
            flag = true;
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          expect(handler.removeCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   RemoveCallbacksTest0210
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0210
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns false after the posted callback has already been executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveCallbacksTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
          await Utils.msSleep(1300);
          expect(handler.removeCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   RemoveCallbacksTest0211
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0211
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns true for a callback posted twice via post()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveCallbacksTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest064';
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let worker = new EAWorker();
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            TSleep(1000);
            flag = true;
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          handler.post(p);
          expect(handler.removeCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   RemoveCallbacksTest0212
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0212
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns false after posted callbacks were executed and no new callback was posted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveCallbacksTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
            Sleep(1000).awaitSync()
          }, worker);
          handler.post(p);
          handler.post(p);
          await Utils.msSleep(1300);
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
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   RemoveCallbacksTest0213
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0213
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns true for a callback carried by a message sent via sendMessage()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveCallbacksTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let removeFlag: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          (async () => {
            await Sleep(1000);
            flag = true;
          })().awaitSync()
        }, worker)
        let p = () => {
        }
        worker.start();
        try {
          let headMsg = new concurrency.Message(p, handler)
          handler.sendMessage(headMsg);
          removeFlag = handler.removeCallbacks(p)
          expect(removeFlag).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.name   RemoveCallbacksTest0214
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0214
     * @tc.desc   Verify MessageHandler.removeCallbacks() returns false after the callback-carrying message has been processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RemoveCallbacksTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
            Sleep(1000).awaitSync()
          }, worker);
          handler.sendMessage(new concurrency.Message(p, handler));
          await Utils.msSleep(1300);
          expect(handler.removeCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });
  });
}
