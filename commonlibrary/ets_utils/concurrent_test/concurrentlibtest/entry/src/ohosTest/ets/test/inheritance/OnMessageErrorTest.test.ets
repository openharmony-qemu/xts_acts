/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterAll, it, afterEach, expect, Level, Size, TestType } from '@ohos/hypium';
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';

async function terminateAndAwait(w: worker.ThreadWorker | null): Promise<void> {
  if (!w) {
    return;
  }
  try {
    const exitPromise = new Promise<void>((resolve: () => void): void => {
      w.onexit = (): void => {
        resolve();
      };
    });
    w.terminate();
    let timeoutId: number = -1;
    await Promise.race([
      exitPromise,
      new Promise<void>((resolve: () => void) => {
        timeoutId = setTimeout(resolve, 3000);
      })
    ]);
    clearTimeout(timeoutId);
    w.removeAllListener();
    w.onexit = (): void => {};
    w.onmessage = (e: MessageEvents): void => {};
    w.onerror = (): void => {};
  } catch (e) { console.warn(`terminateAndAwait error: ${e}`) }
}

async function waitForEvent(promise: Promise<void>): Promise<void> {
  let timeoutId: number = -1;
  await Promise.race([
    promise,
    new Promise<void>((resolve: () => void) => {
      timeoutId = setTimeout(resolve, 5000);
    })
  ]);
  clearTimeout(timeoutId);
}

const WORKER_SERIALIZE_ERROR = '__worker_serialize_error__';

interface FlagValue {
  value: boolean;
}

interface SerializeErrorListener {
  promise: Promise<void>;
  flag: FlagValue;
}

function setupSerializeErrorListener(w: worker.ThreadWorker): SerializeErrorListener {
  let flag: FlagValue = { value: false };
  let promise = new Promise<void>((resolve: () => void) => {
    w.onmessageerror = (e: MessageEvents) => {
      flag.value = true;
      resolve();
    };
    w.onmessage = (e: MessageEvents) => {
      if (e.data === WORKER_SERIALIZE_ERROR) {
        flag.value = true;
        resolve();
      }
    };
  });
  let result: SerializeErrorListener = { promise: promise, flag: flag };
  return result;
}

class HostCircularData {
  name: string = '';
  self: HostCircularData | null = null;
  fn: () => void = () => {};
}

export default function OnMessageErrorTest(): void {
  describe('OnMessageErrorTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    // Design point 6 "object containing a DOM element" is NOT_APPLICABLE:
    // ArkTS has no DOM element type, so such an object cannot be constructed.


    /**
     * @tc.name   OnMessageErrorTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0100
     * @tc.desc   Verify onmessageerror property exists and is initially undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        expect(workerInstance.onmessageerror).assertUndefined();
      } catch (err) {
        console.error(`OnMessageErrorTest0100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest0200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0200
     * @tc.desc   Verify onmessageerror property can be set to a callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        workerInstance.onmessageerror = (e: MessageEvents) => {};
        expect(typeof workerInstance.onmessageerror).assertEqual('function');
      } catch (err) {
        console.error(`OnMessageErrorTest0200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest0300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0300
     * @tc.desc   Verify normal messages trigger onmessage but not onmessageerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let messageReceived = false;
        let messageErrorReceived = false;
        const messagePromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            messageReceived = true;
            resolve();
          };
        });
        workerInstance.onmessageerror = (e: MessageEvents) => {
          messageErrorReceived = true;
        };
        workerInstance.postMessage('hello');
        await waitForEvent(messagePromise);
        expect(messageReceived).assertTrue();
        expect(messageErrorReceived).assertFalse();
      } catch (err) {
        console.error(`OnMessageErrorTest0300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0400
     * @tc.desc   Verify worker sending an object containing a function triggers onmessageerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const messageErrorListener = setupSerializeErrorListener(workerInstance!);
        const messageErrorPromise = messageErrorListener.promise;
        const messageErrorReceived = messageErrorListener.flag;
        workerInstance.postMessage('sendFunctionObject');
        await waitForEvent(messageErrorPromise);
        expect(messageErrorReceived.value).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest0400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0500
     * @tc.desc   Verify worker sending an object containing a Symbol triggers onmessageerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const messageErrorListener = setupSerializeErrorListener(workerInstance!);
        const messageErrorPromise = messageErrorListener.promise;
        const messageErrorReceived = messageErrorListener.flag;
        workerInstance.postMessage('sendSymbolToHost');
        await waitForEvent(messageErrorPromise);
        expect(messageErrorReceived.value).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest0500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0600
     * @tc.desc   Verify worker sending an object containing an Error triggers expected serialization behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let outcome = 'none';
        let dataStr = '';
        const eventPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              outcome = 'error';
            } else {
              outcome = 'received';
              dataStr = String(e.data);
            }
            resolve();
          };
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            outcome = 'error';
            resolve();
          };
        });
        workerInstance.postMessage('send_error_object');
        await waitForEvent(eventPromise);
        expect(outcome !== 'none').assertTrue();
        if (outcome === 'received') {
          expect(dataStr.length > 0).assertTrue();
        }
      } catch (err) {
        console.error(`OnMessageErrorTest0600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0700
     * @tc.desc   Verify worker sending a circular reference object triggers onmessageerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const messageErrorListener = setupSerializeErrorListener(workerInstance!);
        const messageErrorPromise = messageErrorListener.promise;
        const messageErrorReceived = messageErrorListener.flag;
        workerInstance.postMessage('sendCircularRef');
        await waitForEvent(messageErrorPromise);
        expect(messageErrorReceived.value).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest0700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0800
     * @tc.desc   Verify worker sending a circular reference array triggers onmessageerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const messageErrorListener = setupSerializeErrorListener(workerInstance!);
        const messageErrorPromise = messageErrorListener.promise;
        const messageErrorReceived = messageErrorListener.flag;
        workerInstance.postMessage('sendCircularArray');
        await waitForEvent(messageErrorPromise);
        expect(messageErrorReceived.value).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest0800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_0900
     * @tc.desc   Verify worker sending a large object triggers expected serialization behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let outcome = 'none';
        let dataStr = '';
        const eventPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              outcome = 'error';
            } else {
              outcome = 'received';
              dataStr = String(e.data);
            }
            resolve();
          };
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            outcome = 'error';
            resolve();
          };
        });
        workerInstance.postMessage('send_large_object');
        await waitForEvent(eventPromise);
        expect(outcome !== 'none').assertTrue();
        if (outcome === 'received') {
          expect(dataStr.length > 0).assertTrue();
        }
      } catch (err) {
        console.error(`OnMessageErrorTest0900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1000
     * @tc.desc   Verify worker sending a Map object triggers expected serialization behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let outcome = 'none';
        let dataVerified = false;
        const eventPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              outcome = 'error';
            } else if (e.data instanceof Map) {
              outcome = 'received';
              let m = e.data as Map<string, number>;
              dataVerified = m.size === 2 && m.get('key1') === 100 && m.get('key2') === 200;
            } else {
              outcome = 'error';
            }
            resolve();
          };
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            outcome = 'error';
            resolve();
          };
        });
        workerInstance.postMessage('send_map_object');
        await waitForEvent(eventPromise);
        expect(outcome !== 'none').assertTrue();
        if (outcome === 'received') {
          expect(dataVerified).assertTrue();
        }
      } catch (err) {
        console.error(`OnMessageErrorTest1000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1100
     * @tc.desc   Verify worker sending a Set object triggers expected serialization behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let outcome = 'none';
        let dataVerified = false;
        const eventPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              outcome = 'error';
            } else if (e.data instanceof Set) {
              outcome = 'received';
              let st = e.data as Set<number>;
              dataVerified = st.size === 2 && st.has(10) && st.has(20);
            } else {
              outcome = 'error';
            }
            resolve();
          };
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            outcome = 'error';
            resolve();
          };
        });
        workerInstance.postMessage('send_set_object');
        await waitForEvent(eventPromise);
        expect(outcome !== 'none').assertTrue();
        if (outcome === 'received') {
          expect(dataVerified).assertTrue();
        }
      } catch (err) {
        console.error(`OnMessageErrorTest1100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1200
     * @tc.desc   Verify worker sending a Date object triggers expected serialization behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let outcome = 'none';
        let dataVerified = false;
        const eventPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              outcome = 'error';
            } else if (e.data instanceof Date) {
              outcome = 'received';
              let d = e.data as Date;
              dataVerified = d.getTime() === new Date(2024, 0, 1).getTime();
            } else {
              outcome = 'error';
            }
            resolve();
          };
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            outcome = 'error';
            resolve();
          };
        });
        workerInstance.postMessage('send_date_object');
        await waitForEvent(eventPromise);
        expect(outcome !== 'none').assertTrue();
        if (outcome === 'received') {
          expect(dataVerified).assertTrue();
        }
      } catch (err) {
        console.error(`OnMessageErrorTest1200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1300
     * @tc.desc   Verify worker sending a RegExp object triggers expected serialization behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let outcome = 'none';
        let dataVerified = false;
        const eventPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              outcome = 'error';
            } else if (e.data instanceof RegExp) {
              outcome = 'received';
              let r = e.data as RegExp;
              dataVerified = r.source === 'pattern';
            } else {
              outcome = 'error';
            }
            resolve();
          };
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            outcome = 'error';
            resolve();
          };
        });
        workerInstance.postMessage('send_regexp_object');
        await waitForEvent(eventPromise);
        expect(outcome !== 'none').assertTrue();
        if (outcome === 'received') {
          expect(dataVerified).assertTrue();
        }
      } catch (err) {
        console.error(`OnMessageErrorTest1300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1400
     * @tc.desc   Verify host sending a function to worker triggers serialization error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let errorDetected = false;
        workerInstance.onerror = (err: ErrorEvent) => {};
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            errorDetected = true;
            resolve();
          };
        });
        try {
          workerInstance.postMessage(() => {});
        } catch (e) {
          errorDetected = true;
        }
        if (!errorDetected) {
          await waitForEvent(errorPromise);
        }
        expect(errorDetected).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest1400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1500
     * @tc.desc   Verify host sending a circular reference object to worker triggers serialization error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let errorDetected = false;
        workerInstance.onerror = (err: ErrorEvent) => {};
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            errorDetected = true;
            resolve();
          };
        });
        try {
          let circularObj = new HostCircularData();
          circularObj.name = 'circular';
          circularObj.self = circularObj;
          workerInstance.postMessage(circularObj);
        } catch (e) {
          errorDetected = true;
        }
        if (!errorDetected) {
          await waitForEvent(errorPromise);
        }
        expect(errorDetected).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest1500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1600
     * @tc.desc   Verify worker sending a function to host triggers onmessageerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const messageErrorListener = setupSerializeErrorListener(workerInstance!);
        const messageErrorPromise = messageErrorListener.promise;
        const messageErrorReceived = messageErrorListener.flag;
        workerInstance.postMessage('sendFunctionToHost');
        await waitForEvent(messageErrorPromise);
        expect(messageErrorReceived.value).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest1600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1700
     * @tc.desc   Verify worker sending a circular reference to host triggers onmessageerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const messageErrorListener = setupSerializeErrorListener(workerInstance!);
        const messageErrorPromise = messageErrorListener.promise;
        const messageErrorReceived = messageErrorListener.flag;
        workerInstance.postMessage('sendCircularToHost');
        await waitForEvent(messageErrorPromise);
        expect(messageErrorReceived.value).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest1700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1800
     * @tc.desc   Verify setting onmessageerror multiple times, last one overwrites.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let count1 = 0;
        let count2 = 0;
        workerInstance.onmessageerror = (e: MessageEvents) => {
          count1++;
        };
        const count2Promise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            count2++;
            resolve();
          };
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              count2++;
              resolve();
            }
          };
        });
        workerInstance.postMessage('sendFunctionToHost');
        await waitForEvent(count2Promise);
        expect(count1).assertEqual(0);
        expect(count2).assertEqual(1);
      } catch (err) {
        console.error(`OnMessageErrorTest1800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest1900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_1900
     * @tc.desc   Verify setting onmessageerror to undefined stops triggering.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let count = 0;
        workerInstance.onmessageerror = (e: MessageEvents) => {
          count++;
        };
        workerInstance.onmessageerror = undefined;
        workerInstance.postMessage('sendFunctionToHost');
        const pollDeadline = Date.now() + 500;
        while (Date.now() < pollDeadline) {
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
        }
        expect(count).assertEqual(0);
      } catch (err) {
        console.error(`OnMessageErrorTest1900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest2000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_2000
     * @tc.desc   Verify worker continues running after message serialization failure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let serializeErrorReceived = false;
        let exitTriggered = false;
        let normalMessageReceived = false;
        workerInstance.onexit = (code: number) => {
          exitTriggered = true;
        };
        workerInstance.onmessageerror = () => {
          serializeErrorReceived = true;
        };
        workerInstance.onmessage = (e: MessageEvents) => {
          if (e.data === WORKER_SERIALIZE_ERROR) {
            serializeErrorReceived = true;
          } else {
            normalMessageReceived = true;
          }
        };
        workerInstance.postMessage('sendFunctionToHost');
        let waitCount1 = 0;
        while (!serializeErrorReceived && waitCount1 < 100) {
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
          waitCount1++;
        }
        expect(serializeErrorReceived).assertTrue();
        expect(exitTriggered).assertFalse();
        workerInstance.postMessage('hello');
        let waitCount2 = 0;
        while (!normalMessageReceived && waitCount2 < 100) {
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
          waitCount2++;
        }
        expect(normalMessageReceived).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest2000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest2100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_2100
     * @tc.desc   Verify sending non-serializable data multiple times triggers onmessageerror repeatedly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let errorCount = 0;
        const errorCountPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            errorCount++;
            if (errorCount >= 3) {
              resolve();
            }
          };
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              errorCount++;
              if (errorCount >= 3) {
                resolve();
              }
            }
          };
        });
        workerInstance.postMessage('sendFunctionToHost');
        workerInstance.postMessage('sendFunctionToHost');
        workerInstance.postMessage('sendFunctionToHost');
        await waitForEvent(errorCountPromise);
        expect(errorCount).assertEqual(3);
      } catch (err) {
        console.error(`OnMessageErrorTest2100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest2200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_2200
     * @tc.desc   Verify onmessageerror callback throwing exception does not affect host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let callbackExecuted = false;
        let exceptionContained = false;
        const callbackPromise = new Promise<void>((resolve: () => void) => {
          const onEvent = () => {
            callbackExecuted = true;
            try {
              throw new Error('onmessageerror callback error');
            } catch (e) {
              exceptionContained = true;
            }
            resolve();
          };
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            onEvent();
          };
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              onEvent();
            }
          };
        });
        workerInstance.postMessage('sendFunctionToHost');
        await waitForEvent(callbackPromise);
        expect(callbackExecuted).assertTrue();
        expect(exceptionContained).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest2200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest2300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_2300
     * @tc.desc   Verify message serialization failure triggers onmessageerror but not onerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let msgErrorReceived = false;
        let errorReceived = false;
        const msgErrorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            msgErrorReceived = true;
            resolve();
          };
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              msgErrorReceived = true;
              resolve();
            }
          };
        });
        workerInstance.onerror = (err: ErrorEvent) => {
          errorReceived = true;
        };
        workerInstance.postMessage('sendFunctionToHost');
        await waitForEvent(msgErrorPromise);
        expect(msgErrorReceived).assertTrue();
        expect(errorReceived).assertFalse();
      } catch (err) {
        console.error(`OnMessageErrorTest2300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest2400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_2400
     * @tc.desc   Verify serialization failure does not terminate worker while error does terminate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let worker1: worker.ThreadWorker | null = null;
      let worker2: worker.ThreadWorker | null = null;
      try {
        worker1 = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let exitAfterMessageError = false;
        const msgErrorPromise = new Promise<void>((resolve: () => void) => {
          worker1!.onmessageerror = (e: MessageEvents) => {
            resolve();
          };
          worker1!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              resolve();
            }
          };
        });
        worker1.onexit = (code: number) => {
          exitAfterMessageError = true;
        };
        worker1.postMessage('sendFunctionToHost');
        await waitForEvent(msgErrorPromise);
        const pollDeadline = Date.now() + 500;
        while (Date.now() < pollDeadline) {
          if (exitAfterMessageError) break;
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
        }
        expect(exitAfterMessageError).assertFalse();

        worker2 = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let exitAfterError = false;
        worker2.onerror = (err: ErrorEvent) => {};
        const exitAfterErrorPromise = new Promise<void>((resolve: () => void) => {
          worker2!.onexit = (code: number) => {
            exitAfterError = true;
            resolve();
          };
        });
        worker2.postMessage('throw_error');
        await waitForEvent(exitAfterErrorPromise);
        expect(exitAfterError).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest2400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(worker1);
        await terminateAndAwait(worker2);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest2500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_2500
     * @tc.desc   Verify multiple worker instances trigger onmessageerror independently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnMessageErrorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const workers: worker.ThreadWorker[] = [];
      try {
        const counts: number[] = [0, 0, 0];
        const allErrorsPromise = new Promise<void>((resolve: () => void) => {
          let totalReceived = 0;
          for (let i = 0; i < 3; i++) {
            const w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            const idx = i;
            const onEvent = () => {
              counts[idx]++;
              totalReceived++;
              if (totalReceived >= 3) {
                resolve();
              }
            };
            w.onmessageerror = (e: MessageEvents) => {
              onEvent();
            };
            w.onmessage = (e: MessageEvents) => {
              if (e.data === WORKER_SERIALIZE_ERROR) {
                onEvent();
              }
            };
            workers.push(w);
          }
        });
        workers.forEach(w => w.postMessage('sendFunctionToHost'));
        await waitForEvent(allErrorsPromise);
        for (let i = 0; i < 3; i++) {
          expect(counts[i]).assertEqual(1);
        }
      } catch (err) {
        console.error(`OnMessageErrorTest2500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        for (const w of workers) {
          await terminateAndAwait(w);
        }
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest2600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_2600
     * @tc.desc   Verify high-frequency serialization failure is captured stably for 100 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let errorCount = 0;
        const totalCount = 100;
        const errorCountPromise = new Promise<void>((resolve: () => void) => {
          const onEvent = () => {
            errorCount++;
            if (errorCount >= totalCount) {
              resolve();
            }
          };
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            onEvent();
          };
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              onEvent();
            }
          };
        });
        for (let i = 0; i < totalCount; i++) {
          workerInstance.postMessage('sendFunctionToHost');
        }
        await waitForEvent(errorCountPromise);
        expect(errorCount).assertEqual(totalCount);
      } catch (err) {
        console.error(`OnMessageErrorTest2600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });


    /**
     * @tc.name   OnMessageErrorTest2700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONMESSAGEERROR_2700
     * @tc.desc   Verify event.data in onmessageerror contains non-empty error information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnMessageErrorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let errorData: Object | null = null;
        let messageErrorReceived = false;
        const messageErrorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessageerror = (e: MessageEvents) => {
            errorData = e.data as Object;
            messageErrorReceived = true;
            resolve();
          };
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === WORKER_SERIALIZE_ERROR) {
              errorData = e.data as Object;
              messageErrorReceived = true;
              resolve();
            }
          };
        });
        workerInstance.postMessage('sendFunctionToHost');
        await waitForEvent(messageErrorPromise);
        expect(messageErrorReceived).assertTrue();
        expect(errorData !== undefined && errorData !== null).assertTrue();
      } catch (err) {
        console.error(`OnMessageErrorTest2700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

  });
}
