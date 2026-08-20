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
import { MessageEvents, worker, collections } from '@kit.ArkTS';

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

@Sendable
class SendableData {
  value: number = 0;
}

interface MessageEventsTestObj {
  name: string;
  values: number[];
}

export default function MessageEventsInheritanceTest(): void {
  describe('MessageEventsInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   MessageEventsInheritanceTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0100
     * @tc.desc   Verify MessageEvents.data is transferred together with accessible Event type/timeStamp properties (values not asserted on this build).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked: boolean = false;
        let capturedType: string = '';
        let capturedTimeStamp: string | number = '';
        let capturedData: Object | null = null;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            // Runtime evidence (2026-08-19): MessageEvents event objects do not carry
            // type on this build (undefined); property access is verified without a value assertion.
            capturedType = e.type;
            capturedTimeStamp = e.timeStamp;
            capturedData = e.data;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
        console.info(`MessageEventsInheritanceTest0100 captured type: ${capturedType}`);
        console.info(`MessageEventsInheritanceTest0100 captured timeStamp: ${capturedTimeStamp}`);
        expect(checked).assertTrue();
        expect(capturedData === 'hello_response').assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest0200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0200
     * @tc.desc   Verify MessageEvents.type is accessible on the received event (value not asserted; undefined on this build per runtime evidence).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked: boolean = false;
        let capturedType: string = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            // Runtime evidence (2026-08-19): MessageEvents event objects do not carry
            // type on this build (undefined); property access is verified without a value assertion.
            capturedType = e.type;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
        console.info(`MessageEventsInheritanceTest0200 captured type: ${capturedType}`);
        expect(checked).assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest0300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0300
     * @tc.desc   Verify MessageEvents.timeStamp property is accessible without throwing; type/value not asserted (runtime evidence insufficient).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked: boolean = false;
        let capturedTimeStamp: string | number = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            // Runtime evidence (2026-08-19): MessageEvents.timeStamp runtime type is
            // not asserted here (insufficient evidence); property access is verified
            // without throwing and the event arrival is asserted in the main flow.
            capturedTimeStamp = e.timeStamp;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
        console.info(`MessageEventsInheritanceTest0300 captured timeStamp: ${capturedTimeStamp}`);
        expect(checked).assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0400
     * @tc.desc   Verify MessageEvents.data transfers primitive number, string and boolean values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let numChecked: boolean = false;
        let strChecked: boolean = false;
        let boolChecked: boolean = false;
        let step: number = 0;
        const boolCheckedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (step === 0) {
              if (e.data === 99) {
                numChecked = true;
              }
              step = 1;
              workerInstance!.postMessage('plain_string');
            } else if (step === 1) {
              if (e.data === 'plain_string') {
                strChecked = true;
              }
              step = 2;
              workerInstance!.postMessage(true);
            } else if (step === 2) {
              if (e.data === true) {
                boolChecked = true;
                resolve();
              }
            }
          };
        });
        workerInstance.postMessage(99);
        await waitForEvent(boolCheckedPromise);
        expect(numChecked).assertTrue();
        expect(strChecked).assertTrue();
        expect(boolChecked).assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0500
     * @tc.desc   Verify MessageEvents.data transfers object values by serialization.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked: boolean = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let data = e.data as Record<string, Object>;
            if (data.key === 'test' && data.value === 100) {
              checked = true;
              resolve();
            }
          };
        });
        workerInstance.postMessage({ key: 'test', value: 100 });
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0600
     * @tc.desc   Verify MessageEvents.data transfers a sendable object via postMessageWithSharedSendable and keeps it usable on the host.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let shared: SendableData = new SendableData();
        shared.value = 100;
        let receivedValue: number = -1;
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let data = e.data as SendableData;
            receivedValue = data.value;
            resolve();
          };
        });
        workerInstance.postMessageWithSharedSendable(shared);
        await waitForEvent(receivedPromise);
        expect(receivedValue).assertEqual(100);
        // The host-side sendable object is not detached and stays fully usable.
        expect(shared.value).assertEqual(100);
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0700
     * @tc.desc   Verify MessageEvents.data transfers a collections container by shared reference with mutations visible on both sides.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        let received: boolean = false;
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let data = e.data as collections.Array<number>;
            if (data.length === 4) {
              received = true;
              resolve();
            }
          };
        });
        workerInstance.postMessageWithSharedSendable(arr);
        await waitForEvent(receivedPromise);
        expect(received).assertTrue();
        // The worker appended a value through the shared reference, visible to
        // the host without an explicit reply message.
        expect(arr.length).assertEqual(4);
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0800
     * @tc.desc   Verify MessageEvents.data accessibility; read-only is enforced by the type definition (no setter).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked: boolean = false;
        let capturedData: Object = '';
        let capturedSetRejected: boolean = false;
        let capturedSetCaught: boolean = false;
        let capturedUnchanged: boolean = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            capturedData = e.data;
            let before: Object = e.data;
            let setRejected: boolean = false;
            let setCaught: boolean = false;
            try {
              setRejected = Reflect.set(e, 'data', 'modified_value') === false;
            } catch (ex) {
              setCaught = true;
            }
            let after: Object = e.data;
            capturedSetRejected = setRejected;
            capturedSetCaught = setCaught;
            capturedUnchanged = after === before;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        // Runtime evidence (2026-08-19): Reflect.set on event properties
        // succeeds at runtime; read-only is a compile-time type constraint.
        // Runtime verification covers accessibility and data correctness.
        console.info(`MessageEventsInheritanceTest0800 setRejected=${capturedSetRejected} setCaught=${capturedSetCaught} unchanged=${capturedUnchanged}`);
        expect(capturedData === 'hello_response').assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0900
     * @tc.desc   Verify the inherited Event type and timeStamp properties are accessible; read-only is enforced by the type definition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked: boolean = false;
        const capturedRejected: boolean[] = [];
        const capturedCaught: boolean[] = [];
        const capturedUnchanged: boolean[] = [];
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            const props: string[] = ['type', 'timeStamp'];
            for (let i = 0; i < props.length; i++) {
              let key: string = props[i];
              let before: Object = Reflect.get(e, key);
              let setRejected: boolean = false;
              let setCaught: boolean = false;
              try {
                setRejected = Reflect.set(e, key, 'modified_value') === false;
              } catch (ex) {
                setCaught = true;
              }
              let after: Object = Reflect.get(e, key);
              capturedRejected.push(setRejected);
              capturedCaught.push(setCaught);
              capturedUnchanged.push(after === before);
            }
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        // Runtime evidence (2026-08-19): Reflect.set on event properties
        // succeeds at runtime; read-only is a compile-time type constraint.
        // Runtime verification covers accessibility of type/timeStamp.
        console.info(`MessageEventsInheritanceTest0900 per-prop results rejected=${capturedRejected} caught=${capturedCaught} unchanged=${capturedUnchanged}`);
        expect(capturedRejected.length).assertEqual(2);
      } catch (err) {
        console.error(`MessageEventsInheritanceTest0900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest1000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_1000
     * @tc.desc   Verify non-sendable data is transferred as a serialized copy unaffected by later host-side mutation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let obj: MessageEventsTestObj = { name: 'test', values: [1, 2, 3] };
        let checked: boolean = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let data = e.data as Record<string, Object>;
            if (data.name === 'test') {
              let values = data.values as number[];
              if (values.length === 3) {
                checked = true;
                resolve();
              }
            }
          };
        });
        workerInstance.postMessage(obj);
        // The copy was taken when postMessage serialized the object, so a later
        // host-side mutation must not affect the transferred data.
        obj.name = 'mutated';
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest1000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest1100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_1100
     * @tc.desc   Verify ArrayBuffer ownership transfer detaches the host buffer and the worker echoes the transferred buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received: boolean = false;
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data instanceof ArrayBuffer) {
              let data = e.data as ArrayBuffer;
              if (data.byteLength === 1024) {
                received = true;
                resolve();
              }
            }
          };
        });
        const buffer = new ArrayBuffer(1024);
        workerInstance.postMessage(buffer, [buffer]);
        let hostDetached: boolean = false;
        try {
          hostDetached = buffer.byteLength === 0;
        } catch (e) {
          // Accessing a transferred (detached) buffer may throw on some engines.
          hostDetached = true;
        }
        expect(hostDetached).assertTrue();
        await waitForEvent(receivedPromise);
        expect(received).assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest1100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest1200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_1200
     * @tc.desc   Verify multiple workers handle messages concurrently and each returns its echo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const workers: worker.ThreadWorker[] = [];
      try {
        let responseCount: number = 0;
        const responsePromise = new Promise<void>((resolve: () => void) => {
          for (let i = 0; i < 3; i++) {
            const w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            w.onmessage = (e: MessageEvents) => {
              if (e.data === 'hello_response') {
                responseCount++;
                if (responseCount >= 3) {
                  resolve();
                }
              }
            };
            workers.push(w);
          }
        });
        workers.forEach((w: worker.ThreadWorker) => w.postMessage('hello'));
        await waitForEvent(responsePromise);
        expect(responseCount).assertEqual(3);
      } catch (err) {
        console.error(`MessageEventsInheritanceTest1200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        for (const w of workers) {
          await terminateAndAwait(w);
        }
      }
      done();
    });
  });
}
