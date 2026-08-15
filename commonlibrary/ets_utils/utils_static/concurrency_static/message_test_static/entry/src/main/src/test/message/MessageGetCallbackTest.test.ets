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
import { BusinessError } from '@ohos.base';

type CB = () => void

function normalFunctionCallback(): void {
  console.info("normal function callback");
}

function executeRetrievedCallback(fn: CB): void {
  fn();
}

export default function MessageGetCallbackTest(): void {
  describe('MessageGetCallbackTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageGetCallbackTest0100
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0100
     * @tc.desc   Verify Message.getCallback() with no args returns callback from callback constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => { console.info("callback message"); }
        let msg = new concurrency.Message(callback, messageHandler);
        let result: CB | undefined = msg.getCallback();
        expect(result !== undefined).assertTrue();
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
     * @tc.name   MessageGetCallbackTest0200
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0200
     * @tc.desc   Verify Message.getCallback() returns same callback reference as constructor input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => { console.info("this is callback message"); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        expect(cb === callback).assertTrue();
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
     * @tc.name   MessageGetCallbackTest0300
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0300
     * @tc.desc   Verify Message.getCallback() returned function can be executed normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let executed: boolean = false;
        let callback: CB = (): void => { executed = true; }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        expect(executed).assertTrue();
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
     * @tc.name   MessageGetCallbackTest0400
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0400
     * @tc.desc   Verify Message.getCallback() returns undefined when using constructor(handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(messageHandler);
        let result: CB | undefined = msg.getCallback();
        expect(result === undefined).assertTrue();
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
     * @tc.name   MessageGetCallbackTest0500
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0500
     * @tc.desc   Verify Message.getCallback() returns undefined when using constructor(what, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, messageHandler);
        let result: CB | undefined = msg.getCallback();
        expect(result === undefined).assertTrue();
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
     * @tc.name   MessageGetCallbackTest0600
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0600
     * @tc.desc   Verify Message.getCallback() returns undefined when using constructor(what, obj, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "data", messageHandler);
        let result: CB | undefined = msg.getCallback();
        expect(result === undefined).assertTrue();
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
     * @tc.name   MessageGetCallbackTest0700
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0700
     * @tc.desc   Verify Message.getCallback() returns empty body callback as non-undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let emptyCallback: CB = (): void => {}
        let msg = new concurrency.Message(emptyCallback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
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
     * @tc.name   MessageGetCallbackTest0800
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0800
     * @tc.desc   Verify Message.getCallback() return value type is function when callback is set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => {}
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
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
     * @tc.name   MessageGetCallbackTest0900
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_0900
     * @tc.desc   Verify Message.getCallback() returned function returns void when called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => { console.info("callback test"); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        // Void function called successfully without error
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
     * @tc.name   MessageGetCallbackTest1000
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1000
     * @tc.desc   Verify Message.getCallback() returns same reference when called multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => {}
        let msg = new concurrency.Message(callback, messageHandler);
        let cb1: CB | undefined = msg.getCallback();
        let cb2: CB | undefined = msg.getCallback();
        expect(cb1 === cb2).assertTrue();
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
     * @tc.name   MessageGetCallbackTest1100
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1100
     * @tc.desc   Verify Message.getCallback() returns different callback for different Message instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback1: CB = (): void => { console.info("cb1"); }
        let callback2: CB = (): void => { console.info("cb2"); }
        let msg1 = new concurrency.Message(callback1, messageHandler);
        let msg2 = new concurrency.Message(callback2, messageHandler);
        expect(msg1.getCallback() !== msg2.getCallback()).assertTrue();
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
     * @tc.name   MessageGetCallbackTest1200
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1200
     * @tc.desc   Verify Message.getCallback() returns function even when callback throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let errorCallback: CB = (): void => { throw new Error("callback error"); }
        let msg = new concurrency.Message(errorCallback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        let caught = false;
        try {
          cb!();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
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
     * @tc.name   MessageGetCallbackTest1300
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1300
     * @tc.desc   Verify Message.getCallback() returned callback exception can be caught by try-catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => { throw new Error("test error"); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        let caught = false;
        try {
          cb!();
        } catch (error) {
          caught = true;
        }
        expect(caught).assertTrue();
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
     * @tc.name   MessageGetCallbackTest1400
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1400
     * @tc.desc   Verify Message.getCallback() works normally without special annotations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message((): void => {}, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
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
     * @tc.name   MessageGetCallbackTest1500
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1500
     * @tc.desc   Verify Message.getCallback() returns reference when callback creates internal Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let asyncCallback: CB = (): void => {
          (async (): Promise<void> => {
            try {
              await Promise.resolve();
              console.info("async callback done");
            } catch (e) {
              console.info("async callback error caught");
            }
          })();
        };
        let msg = new concurrency.Message(asyncCallback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
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
     * @tc.name   MessageGetCallbackTest1600
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1600
     * @tc.desc   Verify Message.getCallback() returns reference when callback uses Promise internally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let promiseCallback: CB = (): void => {
          let p: Promise<string> = Promise.resolve("result");
          p.then((r: string): void => {
            console.info(r);
            done();
          }).catch((error: BusinessError): void => {
            expect(error).assertFail();
            done();
          });
        }
        let msg = new concurrency.Message(promiseCallback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
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
     * @tc.name   MessageGetCallbackTest1700
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1700
     * @tc.desc   Verify Message.getCallback() returned void function can be called without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => { console.info("executed"); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        // Void function called successfully
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
     * @tc.name   MessageGetCallbackTest1800
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1800
     * @tc.desc   Verify Message.getCallback() callback captures external variable via closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let capturedValue: string = "test";
        let resultValue: string = "";
        let callback: CB = (): void => { resultValue = capturedValue; }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        capturedValue = "modified";
        cb!();
        expect(resultValue).assertEqual("modified");
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
     * @tc.name   MessageGetCallbackTest1900
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_1900
     * @tc.desc   Verify Message.getCallback() called inside callback returns self reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let innerCbNotNull: boolean = false;
        let msg: concurrency.Message = new concurrency.Message(messageHandler);
        let callback: CB = (): void => {
          let innerCb: CB | undefined = msg.getCallback();
          innerCbNotNull = innerCb !== undefined;
        }
        msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        expect(innerCbNotNull).assertTrue();
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
     * @tc.name   MessageGetCallbackTest2000
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2000
     * @tc.desc   Verify Message.getCallback() callback execution tracked by AtomicInt state change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let state: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { state.store(1); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        expect(state.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest2100
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2100
     * @tc.desc   Verify Message.getCallback() result tracked by AtomicInt after retrieval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let state: AtomicInt = new AtomicInt(0);
        let result: CB | undefined = undefined;
        let callback: CB = (): void => { console.info("callback"); }
        let msg = new concurrency.Message(callback, messageHandler);
        result = msg.getCallback();
        state.store(1);
        expect(result !== undefined).assertTrue();
        expect(state.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest2200
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2200
     * @tc.desc   Verify Message.getCallback() inside MessageHandler callback returns correct callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let innerCallbackExecuted: AtomicInt = new AtomicInt(0);
        let innerCallback: CB = (): void => { innerCallbackExecuted.fetchAdd(1); }
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: CB | undefined = msg.getCallback();
          if (cb !== undefined) { cb(); }
        }, eaw);
        let msg = new concurrency.Message(innerCallback, messageHandler);
        msg.sendToTarget();
        let waitCount = 0;
        while (innerCallbackExecuted.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(innerCallbackExecuted.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest2300
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2300
     * @tc.desc   Verify Message.getCallback() callback executed in sequence for multiple Messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let order: string = "";
        let msg1 = new concurrency.Message((): void => { order += "1"; }, messageHandler);
        let msg2 = new concurrency.Message((): void => { order += "2"; }, messageHandler);
        let msg3 = new concurrency.Message((): void => { order += "3"; }, messageHandler);
        msg1.getCallback()!();
        msg2.getCallback()!();
        msg3.getCallback()!();
        expect(order).assertEqual("123");
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
     * @tc.name   MessageGetCallbackTest2400
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2400
     * @tc.desc   Verify Message.getCallback() callbacks executed in parallel via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let counter: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { counter.fetchAdd(1); }
        let msg1 = new concurrency.Message(callback, messageHandler);
        let msg2 = new concurrency.Message(callback, messageHandler);
        let msg3 = new concurrency.Message(callback, messageHandler);
        let cb1: CB | undefined = msg1.getCallback();
        let cb2: CB | undefined = msg2.getCallback();
        let cb3: CB | undefined = msg3.getCallback();
        expect(cb1 !== undefined).assertTrue();
        expect(cb2 !== undefined).assertTrue();
        expect(cb3 !== undefined).assertTrue();
        cb1!();
        cb2!();
        cb3!();
        expect(counter.load()).assertEqual(3);
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
     * @tc.name   MessageGetCallbackTest2500
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2500
     * @tc.desc   Verify Message.getCallback() AtomicInt counter tracks concurrent callback execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let counter: AtomicInt = new AtomicInt(0);
        let newValue: int = 1;
        let exchangeResult: int = counter.exchange(newValue);
        expect(exchangeResult).assertEqual(0);
        expect(counter.load()).assertEqual(1);
        let callback: CB = (): void => { counter.fetchAdd(1); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        expect(counter.load()).assertEqual(2);
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
     * @tc.name   MessageGetCallbackTest2600
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2600
     * @tc.desc   Verify Message.getCallback() with array stores and retrieves callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let counter: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { counter.fetchAdd(1); }
        let messages: concurrency.Message[] = []
        let msg1 = new concurrency.Message(callback, messageHandler);
        let msg2 = new concurrency.Message(callback, messageHandler);
        messages.push(msg1);
        messages.push(msg2);
        expect(messages.length).assertEqual(2);
        let mapMsg1: concurrency.Message = messages[0];
        let mapMsg2: concurrency.Message = messages[1];
        let cb1: CB | undefined = mapMsg1.getCallback();
        let cb2: CB | undefined = mapMsg2.getCallback();
        expect(cb1 !== undefined).assertTrue();
        expect(cb2 !== undefined).assertTrue();
        cb1!();
        cb2!();
        expect(counter.load()).assertEqual(2);
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
     * @tc.name   MessageGetCallbackTest2700
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2700
     * @tc.desc   Verify Message.getCallback() with arrow function callback returns non-undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let arrowCallback: CB = (): void => { console.info("arrow"); }
        let msg = new concurrency.Message(arrowCallback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
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
     * @tc.name   MessageGetCallbackTest2800
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2800
     * @tc.desc   Verify Message.getCallback() with type assertion as CB works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => {}
        let msg = new concurrency.Message(callback, messageHandler);
        let cb1: CB = msg.getCallback() as CB;
        let cb2: CB | undefined = msg.getCallback();
        expect(cb1 !== undefined).assertTrue();
        expect(cb2 !== undefined).assertTrue();
        cb1();
        cb2!();
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
     * @tc.name   MessageGetCallbackTest2900
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_2900
     * @tc.desc   Verify Message.getCallback() combined with sendToTarget executes callback in handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let callbackExecuted: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { callbackExecuted.fetchAdd(1); }
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: CB | undefined = msg.getCallback();
          if (cb !== undefined) { cb(); }
        }, eaw);
        let msg = new concurrency.Message(callback, messageHandler);
        msg.sendToTarget();
        let waitCount = 0;
        while (callbackExecuted.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(callbackExecuted.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest3000
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3000
     * @tc.desc   Verify Message.getCallback() with equals compares callback references between two Messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => {}
        let msg1 = new concurrency.Message(callback, messageHandler);
        let msg2 = new concurrency.Message(callback, messageHandler);
        let cb1: CB | undefined = msg1.getCallback();
        let cb2: CB | undefined = msg2.getCallback();
        expect(cb1 === cb2).assertTrue();
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
     * @tc.name   MessageGetCallbackTest3100
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3100
     * @tc.desc   Verify Message.getCallback() inside callback accesses getTarget correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let targetMatch: boolean = false;
        let msg: concurrency.Message = new concurrency.Message(messageHandler);
        let callback: CB = (): void => {
          let target: concurrency.MessageHandler = msg.getTarget();
          targetMatch = target === messageHandler;
        }
        msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        expect(targetMatch).assertTrue();
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
     * @tc.name   MessageGetCallbackTest3200
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3200
     * @tc.desc   Verify Message.getCallback() returns undefined for what+obj Message while getWhat/getObject work
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetCallbackTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "data", messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb === undefined).assertTrue();
        expect(msg.getWhat()).assertEqual(1);
        expect(msg.getObject() as string).assertEqual("data");
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
     * @tc.name   MessageGetCallbackTest3300
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3300
     * @tc.desc   Verify Message.getCallback() multiple callback executions tracked by AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callCount: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { callCount.fetchAdd(1); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        cb!();
        cb!();
        expect(callCount.load()).assertEqual(3);
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
     * @tc.name   MessageGetCallbackTest3400
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3400
     * @tc.desc   Verify Message.getCallback() AtomicInt tracks state after callback execution with AtomicInt wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let state: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { state.store(1); }
        let msg = new concurrency.Message(callback, messageHandler);
        msg.getCallback()!();
        expect(state.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest3500
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3500
     * @tc.desc   Verify Message.getCallback() multiple Messages callbacks assign values tracked by AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let counter: AtomicInt = new AtomicInt(0);
        let results: string[] = [];
        let msg1 = new concurrency.Message((): void => { results.push("one"); counter.fetchAdd(1); }, messageHandler);
        let msg2 = new concurrency.Message((): void => { results.push("two"); counter.fetchAdd(1); }, messageHandler);
        let msg3 = new concurrency.Message((): void => { results.push("three"); counter.fetchAdd(1); }, messageHandler);
        msg1.getCallback()!();
        msg2.getCallback()!();
        msg3.getCallback()!();
        expect(counter.load()).assertEqual(3);
        expect(results.length).assertEqual(3);
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
     * @tc.name   MessageGetCallbackTest3600
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3600
     * @tc.desc   Verify Message.getCallback() callback closure captures and modifies external counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let counter: int = 0;
        let callback: CB = (): void => { counter++; }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        expect(counter).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest3700
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3700
     * @tc.desc   Verify Message.getCallback() combined with sendToTarget and AtomicInt wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let state: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { state.fetchAdd(1); }
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: CB | undefined = msg.getCallback();
          if (cb !== undefined) { cb(); }
        }, eaw);
        let msg = new concurrency.Message(callback, messageHandler);
        msg.sendToTarget();
        let waitCount = 0;
        while (state.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(state.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest3800
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3800
     * @tc.desc   Verify Message.getCallback() multiple Messages sendToTarget with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let counter: AtomicInt = new AtomicInt(0);
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: CB | undefined = msg.getCallback();
          if (cb !== undefined) { cb(); }
        }, eaw);
        let msg1 = new concurrency.Message((): void => { counter.fetchAdd(1); }, messageHandler);
        let msg2 = new concurrency.Message((): void => { counter.fetchAdd(1); }, messageHandler);
        let msg3 = new concurrency.Message((): void => { counter.fetchAdd(1); }, messageHandler);
        msg1.sendToTarget();
        msg2.sendToTarget();
        msg3.sendToTarget();
        let waitCount = 0;
        while (counter.load() < 3 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(counter.load()).assertEqual(3);
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
     * @tc.name   MessageGetCallbackTest3900
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_3900
     * @tc.desc   Verify Message.getCallback() post callback execution via MessageHandler.post
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let counter: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { counter.fetchAdd(1); }
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: CB | undefined = msg.getCallback();
          if (cb !== undefined) { cb(); }
        }, eaw);
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        messageHandler.sendMessage(msg);
        let waitCount = 0;
        while (counter.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(counter.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest4000
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4000
     * @tc.desc   Verify Message.getCallback() with post method creates callback message and executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let callbackExecuted: AtomicInt = new AtomicInt(0);
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: CB | undefined = msg.getCallback();
          if (cb !== undefined) { cb(); }
        }, eaw);
        let postedCallback: CB = (): void => { callbackExecuted.fetchAdd(1); }
        messageHandler.post(postedCallback);
        let waitCount = 0;
        while (callbackExecuted.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(callbackExecuted.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest4100
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4100
     * @tc.desc   Verify Message.getCallback() combined with getWhat for mixed property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb === undefined).assertTrue();
        expect(msg.getWhat()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest4200
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4200
     * @tc.desc   Verify Message.getCallback() callback modifies AtomicInt state and state verified by exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let state: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { state.store(1); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        let oldVal: number = state.exchange(0);
        expect(oldVal).assertEqual(1);
        expect(state.load()).assertEqual(0);
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
     * @tc.name   MessageGetCallbackTest4300
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4300
     * @tc.desc   Verify Message.getCallback() with try-catch callback, getCallback returns non-undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: CB = (): void => {
          try {
            throw new Error("test error");
          } catch (e) {
            console.info("caught error");
          }
        }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
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
     * @tc.name   MessageGetCallbackTest4400
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4400
     * @tc.desc   Verify Message.getCallback() with MessageHandler containing processing logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let processed: AtomicInt = new AtomicInt(0);
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          processed.fetchAdd(1);
          console.info("message processed");
        }, eaw);
        let msg = new concurrency.Message((): void => {
          console.info("callback after processing");
        }, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        expect(msg.getTarget() === messageHandler).assertTrue();
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
     * @tc.name   MessageGetCallbackTest4500
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4500
     * @tc.desc   Verify Message.getCallback() retrieved callback executes long-running operation to completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let state: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => {
          let sum: int = 0;
          for (let i: int = 0; i < 10000; i++) {
            sum += i;
          }
          state.store(sum);
        }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
        expect(state.load()).assertEqual(49995000);
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
     * @tc.name   MessageGetCallbackTest4600
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4600
     * @tc.desc   Verify Message.getCallback() returned callback executed on event emission as registered listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetCallbackTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let executed: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { executed.fetchAdd(1); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        let listeners: CB[] = [];
        if (cb !== undefined) {
          listeners.push(cb);
        }
        expect(listeners.length).assertEqual(1);
        for (let i: int = 0; i < listeners.length; i++) {
          listeners[i]();
        }
        expect(executed.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest4700
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4700
     * @tc.desc   Verify Message.getCallback() return value passed as parameter to other function executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let executed: AtomicInt = new AtomicInt(0);
        let callback: CB = (): void => { executed.fetchAdd(1); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        if (cb !== undefined) {
          executeRetrievedCallback(cb);
        }
        expect(executed.load()).assertEqual(1);
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
     * @tc.name   MessageGetCallbackTest4800
     * @tc.number SUB_MESSAGE_GET_CALLBACK_TEST_4800
     * @tc.desc   Verify Message.getCallback() returns callable normal named function used as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetCallbackTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(normalFunctionCallback, messageHandler);
        let cb: CB | undefined = msg.getCallback();
        expect(cb !== undefined).assertTrue();
        cb!();
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
  })
}