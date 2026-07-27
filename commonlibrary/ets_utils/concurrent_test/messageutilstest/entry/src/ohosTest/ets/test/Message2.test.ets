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
} from '@ohos/hypium';
import Utils from './Util.test';

class MessageObject {
  id: number

  constructor(id: number) {
    this.id = id;
  }
}

function TSleep(delay:number):void {
  for(let t = Date.now(); Date.now() - t <= delay;);
}

export function Sleep(ms: number): Promise<number> {
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0158
     * @tc.name GetWhatTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetWhatTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0159
     * @tc.name GetWhatTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetWhatTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0160
     * @tc.name GetWhatTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GetWhatTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0161
     * @tc.name GetCallbackTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GetCallbackTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0162
     * @tc.name GetCallbackTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GetCallbackTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0163
     * @tc.name GetCallbackTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GetCallbackTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0164
     * @tc.name GetCallbackTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetCallbackTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0165
     * @tc.name GetTargetTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetTargetTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0166
     * @tc.name GetTargetTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GetTargetTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0167
     * @tc.name GetTargetTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GetTargetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0168
     * @tc.name GetTargetTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GetTargetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0169
     * @tc.name MessageScenarioTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageScenarioTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
          if (result.length == messages.length) {
            result.forEach((msg, index) => {
              console.error(`equals`);
              expect(msg.equals(messages[index.toInt()])).assertTrue();
            });
          } else {
            expect().assertFail();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0170
     * @tc.name MessageScenarioTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageScenarioTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest002';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let result: concurrency.Message[] = [];
          let i: number = 0;
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
          if (result.length == messages.length) {
            result.forEach((msg, index) => {
              expect(msg.equals(messages[index.toInt()])).assertTrue();
            });
          } else {
            expect().assertFail();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0171
     * @tc.name MessageScenarioTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MessageScenarioTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest003';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let workNum: number = 0;
        let works: EAWorker[] = [];
        try {
          let lock = new AsyncLock();
          let result: concurrency.Message[] = [];
          let handlerNum: number = 0;
          let messageNum: number = 0;
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
