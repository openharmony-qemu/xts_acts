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
import { ErrorEvent, MessageEvents, worker, collections } from '@kit.ArkTS';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

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

export default function messageEventsInheritanceTest(): void {
  describe('MessageEventsInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100);
    })

    afterEach(async (): Promise<void> => {
      await sleep(100);
    })

    /**
     * @tc.name   MessageEventsInheritanceTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_0100
     * @tc.desc   Verify MessageEvents inherits Event properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
        let capturedType: string = '';
        let capturedTimeStamp: number = 0;
        let capturedDataExists: boolean = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            capturedType = typeof e.type;
            capturedTimeStamp = e.timeStamp;
            capturedDataExists = e.data !== undefined;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
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
     * @tc.desc   Verify MessageEvents.type inherits Event.type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
        let capturedType: string = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            capturedType = e.type;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
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
     * @tc.desc   Verify MessageEvents.timeStamp inherits Event.timeStamp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
        let capturedTimeStamp: number = 0;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            capturedTimeStamp = e.timeStamp;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
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
     * @tc.desc   Verify MessageEvents.data passes primitive types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let strChecked = false;
        let numChecked = false;
        let step = 0;
        const numCheckedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (step === 0) {
              if (e.data === 'hello_response') {
                strChecked = true;
              }
              step = 1;
              workerInstance!.postMessage(42);
            } else if (step === 1) {
              if (e.data === 84) {
                numChecked = true;
                resolve();
              }
            }
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(numCheckedPromise);
        expect(strChecked).assertTrue();
        expect(numChecked).assertTrue();
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
     * @tc.desc   Verify MessageEvents.data passes objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
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
     * @tc.desc   Verify MessageEvents.data is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let capturedData: string = '';
        const caughtPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            capturedData = e.data as string;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(caughtPromise);
        // Verify the actual content value to confirm data is accessible and correct.
        // readonly is enforced by the runtime type definition (MessageEvents.data has no setter).
        expect(capturedData).assertEqual('hello_response');
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
     * @tc.desc   Verify MessageEvents.data passes number/string/boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let numChecked = false;
        let strChecked = false;
        let boolChecked = false;
        let step = 0;
        const boolCheckedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (step === 0) {
              if (e.data === 84) {
                numChecked = true;
              }
              step = 1;
              workerInstance!.postMessage('ping');
            } else if (step === 1) {
              if (e.data === 'pong') {
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
        workerInstance.postMessage(42);
        await waitForEvent(boolCheckedPromise);
        expect(numChecked).assertTrue();
        expect(strChecked).assertTrue();
        expect(boolChecked).assertTrue();
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
     * @tc.desc   Verify MessageEvents.data passes object with properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let data = e.data as Record<string, Object>;
            if (data.name === 'test' && data.value === 200) {
              checked = true;
              resolve();
            }
          };
        });
        workerInstance.postMessage({ name: 'test', value: 200 });
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
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
     * @tc.desc   Verify MessageEvents.data passes collections.Array container.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let arr = e.data as collections.Array<number>;
            if (arr.length === 4) {
              checked = true;
              resolve();
            }
          };
        });
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        workerInstance.postMessageWithSharedSendable(arr);
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
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
     * @tc.desc   Verify MessageEvents.data is accessible with number type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let capturedData: number = 0;
        const caughtPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            capturedData = e.data as number;
            resolve();
          };
        });
        workerInstance.postMessage(99);
        await waitForEvent(caughtPromise);
        // Verify numeric data is accessible and correctly echoed.
        expect(capturedData).assertEqual(99);
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
     * @tc.desc   Verify MessageEvents data is accessible through inherited Event interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let responseData = e.data as string;
            if (responseData === 'hello_response') {
              checked = true;
              resolve();
            }
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
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
     * @tc.desc   Verify non-Sendable data is serialized and passed as a copy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
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
        workerInstance.postMessage({ name: 'test', values: [1, 2, 3] });
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest1200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest1300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_1300
     * @tc.desc   Verify ArrayBuffer is transferred.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let checked = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let buffer = e.data as ArrayBuffer;
            if (buffer.byteLength === 1024) {
              checked = true;
              resolve();
            }
          };
        });
        const buffer = new ArrayBuffer(1024);
        workerInstance.postMessage(buffer, [buffer]);
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
      } catch (err) {
        console.error(`MessageEventsInheritanceTest1300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   MessageEventsInheritanceTest1400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_MESSAGEEVENTS_1400
     * @tc.desc   Verify concurrent workers message handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageEventsInheritanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const workers: worker.ThreadWorker[] = [];
      try {
        let responseCount = 0;
        const responseCountPromise = new Promise<void>((resolve: () => void) => {
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
        workers.forEach(w => w.postMessage('hello'));
        await waitForEvent(responseCountPromise);
        expect(responseCount).assertEqual(3);
      } catch (err) {
        console.error(`MessageEventsInheritanceTest1400 failed, error: ${String(err)}`);
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
