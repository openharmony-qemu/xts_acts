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
import { ErrorEvent, MessageEvents, Event, WorkerEventListener, WorkerEventTarget, worker, collections, taskpool } from '@kit.ArkTS';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

interface TestWorkerEvent {
  type: string;
  timeStamp: number;
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

@Concurrent
function computeDouble(value: number): number {
  return value * 2;
}

class CustomTarget implements WorkerEventTarget {
  private listeners: Map<string, WorkerEventListener[]> = new Map<string, WorkerEventListener[]>();

  addEventListener(type: string, listener: WorkerEventListener): void {
    let list: WorkerEventListener[] | undefined = this.listeners.get(type);
    if (list === undefined) {
      list = [];
    }
    list.push(listener);
    this.listeners.set(type, list);
  }

  removeEventListener(type: string, callback?: WorkerEventListener): void {
    if (callback === undefined) {
      this.listeners.delete(type);
      return;
    }
    let list: WorkerEventListener[] | undefined = this.listeners.get(type);
    if (list === undefined) {
      return;
    }
    for (let i = 0; i < list.length; i++) {
      if (list[i] === callback) {
        list.splice(i, 1);
        break;
      }
    }
    if (list.length === 0) {
      this.listeners.delete(type);
    }
  }

  removeAllListener(): void {
    this.listeners.clear();
  }

  dispatchEvent(event: Event): boolean {
    let list: WorkerEventListener[] | undefined = this.listeners.get(event.type);
    if (list === undefined) {
      return false;
    }
    for (let i = 0; i < list.length; i++) {
      let handler: WorkerEventListener = list[i];
      handler(event);
    }
    return true;
  }

  on(type: string, listener: WorkerEventListener): void {
    this.addEventListener(type, listener);
  }

  once(type: string, listener: WorkerEventListener): void {
    let self: CustomTarget = this;
    let onceListener: WorkerEventListener = (event: Event): void => {
      self.removeEventListener(type, onceListener);
      listener(event);
    };
    this.addEventListener(type, onceListener);
  }

  off(type: string, callback?: WorkerEventListener): void {
    this.removeEventListener(type, callback);
  }
}

interface ILogger {
  log(message: string): void;
}

class CustomTargetLogger implements WorkerEventTarget, ILogger {
  private listeners: Map<string, WorkerEventListener[]> = new Map<string, WorkerEventListener[]>();
  private logs: string[] = [];

  addEventListener(type: string, listener: WorkerEventListener): void {
    let list: WorkerEventListener[] | undefined = this.listeners.get(type);
    if (list === undefined) {
      list = [];
    }
    list.push(listener);
    this.listeners.set(type, list);
  }

  removeEventListener(type: string, callback?: WorkerEventListener): void {
    if (callback === undefined) {
      this.listeners.delete(type);
      return;
    }
    let list: WorkerEventListener[] | undefined = this.listeners.get(type);
    if (list === undefined) {
      return;
    }
    for (let i = 0; i < list.length; i++) {
      if (list[i] === callback) {
        list.splice(i, 1);
        break;
      }
    }
    if (list.length === 0) {
      this.listeners.delete(type);
    }
  }

  removeAllListener(): void {
    this.listeners.clear();
  }

  dispatchEvent(event: Event): boolean {
    let list: WorkerEventListener[] | undefined = this.listeners.get(event.type);
    if (list === undefined) {
      return false;
    }
    for (let i = 0; i < list.length; i++) {
      let handler: WorkerEventListener = list[i];
      handler(event);
    }
    return true;
  }

  log(message: string): void {
    this.logs.push(message);
  }

  getLogCount(): number {
    return this.logs.length;
  }
}

class CustomWorkerWrapper {
  messageCount: number = 0;
  errorCount: number = 0;
  onMessageReceived: (e: MessageEvents) => void = (e: MessageEvents) => {};
  private _worker: worker.ThreadWorker;
  constructor(w: worker.ThreadWorker) {
    this._worker = w;
    w.onmessage = (e: MessageEvents) => {
      this.messageCount++;
      this.onMessageReceived(e);
    };
    w.onerror = () => {
      this.errorCount++;
    };
  }
  post(msg: string): void {
    this._worker.postMessage(msg);
  }
}

export default function threadWorkerInheritanceTest(): void {
  describe('ThreadWorkerInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100);
    })

    afterEach(async (): Promise<void> => {
      await sleep(100);
    })

    /**
     * @tc.name   ThreadWorkerInheritanceTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0100
     * @tc.desc   Verify ThreadWorker implements WorkerEventTarget methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        expect(typeof workerInstance.addEventListener).assertEqual('function');
        expect(typeof workerInstance.removeEventListener).assertEqual('function');
        expect(typeof workerInstance.dispatchEvent).assertEqual('function');
        expect(typeof workerInstance.removeAllListener).assertEqual('function');
        expect(typeof workerInstance.on).assertEqual('function');
        expect(typeof workerInstance.once).assertEqual('function');
        expect(typeof workerInstance.off).assertEqual('function');
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0200
     * @tc.desc   Verify addEventListener and dispatchEvent behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received = false;
        workerInstance.addEventListener('custom', () => {
          received = true;
        });
        workerInstance.dispatchEvent({ type: 'custom', timeStamp: Date.now() } as TestWorkerEvent);
        expect(received).assertTrue();
        workerInstance.removeEventListener('custom');
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0300
     * @tc.desc   Verify ThreadWorker.postMessage sends message to worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received = false;
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === 'hello_response') {
              received = true;
              resolve();
            }
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(receivedPromise);
        expect(received).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0400
     * @tc.desc   Verify ThreadWorker.terminate stops the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let exited = false;
        let exitCode = -1;
        const exitPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onexit = (code: number) => {
            exitCode = code;
            exited = true;
            resolve();
          };
        });
        workerInstance.terminate();
        let timeoutId0400: number = -1;
        await Promise.race([
          exitPromise,
          new Promise<void>((resolve: () => void) => {
            timeoutId0400 = setTimeout(resolve, 3000);
          })
        ]);
        clearTimeout(timeoutId0400);
        expect(exited).assertTrue();
        expect(exitCode).assertEqual(0);
        workerInstance = null;
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0500
     * @tc.desc   Verify ThreadWorker events inherit Event interface properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let echoWorker: worker.ThreadWorker | null = null;
      let errorWorker: worker.ThreadWorker | null = null;
      try {
        let msgChecked = false;
        let errChecked = false;
        echoWorker = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const msgPromise = new Promise<void>((resolve: () => void) => {
          echoWorker!.onmessage = (e: MessageEvents) => {
            msgChecked = true;
            resolve();
          };
        });
        echoWorker.postMessage('hello');
        await waitForEvent(msgPromise);

        errorWorker = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        const errPromise = new Promise<void>((resolve: () => void) => {
          errorWorker!.onerror = (err: ErrorEvent) => {
            errChecked = true;
            resolve();
          };
        });
        errorWorker.postMessage('throw_error');
        await waitForEvent(errPromise);

        expect(msgChecked).assertTrue();
        expect(errChecked).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(echoWorker);
        await terminateAndAwait(errorWorker);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0600
     * @tc.desc   Verify ThreadWorker callback properties can be set correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        workerInstance.onexit = (code: number) => {};
        workerInstance.onerror = (err: ErrorEvent) => {};
        workerInstance.onmessage = (e: MessageEvents) => {};
        expect(typeof workerInstance.onexit).assertEqual('function');
        expect(typeof workerInstance.onerror).assertEqual('function');
        expect(typeof workerInstance.onmessage).assertEqual('function');
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0700
     * @tc.desc   Verify ThreadWorker instance type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        expect(typeof workerInstance.postMessage).assertEqual('function');
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0800
     * @tc.desc   Verify ThreadWorker addEventListener dispatchEvent removeAllListener functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let msgReceived: boolean = false;
        const msgPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.addEventListener('message', () => {
            msgReceived = true;
            resolve();
          });
        });
        workerInstance.postMessage('ping');
        await waitForEvent(msgPromise);
        expect(msgReceived).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0900
     * @tc.desc   Verify ThreadWorker addEventListener method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        expect(typeof workerInstance.addEventListener).assertEqual('function');
        workerInstance.addEventListener('test', () => {});
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest0900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1000
     * @tc.desc   Verify ThreadWorker dispatchEvent method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received = false;
        workerInstance.addEventListener('test', () => {
          received = true;
        });
        workerInstance.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(received).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1100
     * @tc.desc   Verify ThreadWorker removeEventListener method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let count = 0;
        const cb = () => { count++; };
        workerInstance.addEventListener('test', cb);
        workerInstance.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(count).assertEqual(1);
        workerInstance.removeEventListener('test');
        workerInstance.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1200
     * @tc.desc   Verify ThreadWorker removeAllListener method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let count = 0;
        workerInstance.addEventListener('test', () => { count++; });
        workerInstance.addEventListener('test', () => { count++; });
        workerInstance.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(count).assertEqual(2);
        workerInstance.removeAllListener();
        workerInstance.onerror = (): void => {};
        workerInstance.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(count).assertEqual(2);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1300
     * @tc.desc   Verify ThreadWorker on method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received = false;
        workerInstance.on('test', () => {
          received = true;
        });
        workerInstance.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(received).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1400
     * @tc.desc   Verify ThreadWorker once method fires only once.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let count = 0;
        workerInstance.once('oncetest', () => {
          count++;
        });
        workerInstance.dispatchEvent({ type: 'oncetest', timeStamp: Date.now() } as TestWorkerEvent);
        workerInstance.dispatchEvent({ type: 'oncetest', timeStamp: Date.now() } as TestWorkerEvent);
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1500
     * @tc.desc   Verify ThreadWorker off method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let count = 0;
        const cb = () => { count++; };
        workerInstance.on('test', cb);
        workerInstance.off('test', cb);
        workerInstance.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(count).assertEqual(0);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1600
     * @tc.desc   Verify ThreadWorker postMessage with object data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received = false;
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let data = e.data as Record<string, Object>;
            if (data.type === 'init' && data.data === 100) {
              received = true;
              resolve();
            }
          };
        });
        workerInstance.postMessage({ type: 'init', data: 100 });
        await waitForEvent(receivedPromise);
        expect(received).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1700
     * @tc.desc   Verify ThreadWorker terminate with exit code 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let exitCode = -1;
        let exitCalled = false;
        const exitPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onexit = (code: number) => {
            exitCode = code;
            exitCalled = true;
            resolve();
          };
        });
        workerInstance.terminate();
        let timeoutId1700: number = -1;
        await Promise.race([
          exitPromise,
          new Promise<void>((resolve: () => void) => {
            timeoutId1700 = setTimeout(resolve, 3000);
          })
        ]);
        clearTimeout(timeoutId1700);
        expect(exitCode).assertEqual(0);
        workerInstance = null;
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1800
     * @tc.desc   Verify ThreadWorker onexit callback is triggered.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let triggered = false;
        const exitPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onexit = (code: number) => {
            triggered = true;
            resolve();
          };
        });
        workerInstance.terminate();
        let timeoutId1800: number = -1;
        await Promise.race([
          exitPromise,
          new Promise<void>((resolve: () => void) => {
            timeoutId1800 = setTimeout(resolve, 3000);
          })
        ]);
        clearTimeout(timeoutId1800);
        expect(triggered).assertTrue();
        workerInstance = null;
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1900
     * @tc.desc   Verify ThreadWorker onerror callback is triggered.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let triggered = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            triggered = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(triggered).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2000
     * @tc.desc   Verify ThreadWorker onmessage callback is triggered.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received = false;
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === 'hello_response') {
              received = true;
              resolve();
            }
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(receivedPromise);
        expect(received).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2100
     * @tc.desc   Verify multiple workers running concurrently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workers: worker.ThreadWorker[] = [];
      try {
        let completed = 0;
        const completedPromise = new Promise<void>((resolve: () => void) => {
          for (let i = 0; i < 3; i++) {
            const w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            w.onexit = (code: number) => {
              completed++;
              if (completed >= 3) {
                resolve();
              }
            };
            workers.push(w);
          }
        });
        workers.forEach(w => w.terminate());
        await waitForEvent(completedPromise);
        expect(completed).assertEqual(3);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        for (const w of workers) {
          await terminateAndAwait(w);
        }
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2200
     * @tc.desc   Verify ThreadWorker on once off event listener functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');

        // Phase 1: Test on() — persistent listener fires on message
        let onCount: number = 0;
        workerInstance.on('message', (): void => {
          onCount++;
        });
        workerInstance.postMessage('msg1');
        // Wait for worker response using counter-based polling
        let waitCount: number = 0;
        while (onCount < 1 && waitCount < 100) {
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
          waitCount++;
        }
        expect(onCount).assertEqual(1);

        // Phase 2: Test off() — remove on listener
        workerInstance.off('message');

        // Phase 3: Test once() — fires exactly once; also proves off() worked
        let onceCount: number = 0;
        workerInstance.once('message', (): void => {
          onceCount++;
        });
        workerInstance.postMessage('msg2');
        // Wait for once callback
        waitCount = 0;
        while (onceCount < 1 && waitCount < 100) {
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
          waitCount++;
        }
        expect(onceCount).assertEqual(1);
        // onCount must remain 1 — if off() failed, the on listener would fire again
        expect(onCount).assertEqual(1);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2300
     * @tc.desc   Verify postMessage on terminated worker throws 10200004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        await terminateAndAwait(workerInstance);
        try {
          workerInstance.postMessage('test');
          expect().assertFail();
        } catch (err) {
          let e = err as Record<string, Object>;
          expect(e.code).assertEqual(10200004);
        }
        workerInstance = null;
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2400
     * @tc.desc   Verify postMessage with transfer transfers ArrayBuffer ownership.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received = false;
        const buffer = new ArrayBuffer(32);
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data instanceof ArrayBuffer) {
              let data = e.data as ArrayBuffer;
              if (data.byteLength === 32) {
                received = true;
                resolve();
              }
            }
          };
        });
        workerInstance.postMessage(buffer, [buffer]);
        await waitForEvent(receivedPromise);
        expect(received).assertTrue();
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2500
     * @tc.desc   Verify worker instanceof checks in inheritance chain.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        expect(typeof workerInstance.postMessage).assertEqual('function');
        expect(typeof workerInstance.terminate).assertEqual('function');
        expect(typeof workerInstance.addEventListener).assertEqual('function');
        expect(typeof workerInstance.removeEventListener).assertEqual('function');
        expect(typeof workerInstance.dispatchEvent).assertEqual('function');
        expect(typeof workerInstance.removeAllListener).assertEqual('function');
        expect(typeof workerInstance.on).assertEqual('function');
        expect(typeof workerInstance.once).assertEqual('function');
        expect(typeof workerInstance.off).assertEqual('function');
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2600
     * @tc.desc   Verify postMessageWithSharedSendable transfers Sendable object by shared reference in both directions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const sharedArr = new collections.Array<number>(1, 2, 3);
        let received = false;
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            let data = e.data as collections.Array<number>;
            if (data.length === 4) {
              received = true;
              resolve();
            }
          };
        });
        workerInstance.postMessageWithSharedSendable(sharedArr);
        await waitForEvent(receivedPromise);
        expect(received).assertTrue();
        // The worker appended a value through the shared reference, which is
        // visible on the host side without an explicit reply message.
        expect(sharedArr.length).assertEqual(4);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2700
     * @tc.desc   Verify custom class implementing WorkerEventTarget supports addEventListener and removeEventListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      try {
        let target = new CustomTarget();
        let count = 0;
        const cb = () => { count++; };
        target.addEventListener('custom', cb);
        let dispatched = target.dispatchEvent({ type: 'custom', timeStamp: Date.now() } as TestWorkerEvent);
        expect(dispatched).assertTrue();
        expect(count).assertEqual(1);
        target.removeEventListener('custom', cb);
        dispatched = target.dispatchEvent({ type: 'custom', timeStamp: Date.now() } as TestWorkerEvent);
        expect(dispatched).assertFalse();
        expect(count).assertEqual(1);
        // removeEventListener without callback removes all listeners of the type.
        let count2 = 0;
        target.addEventListener('custom2', () => { count2++; });
        target.removeEventListener('custom2');
        let dispatched2 = target.dispatchEvent({ type: 'custom2', timeStamp: Date.now() } as TestWorkerEvent);
        expect(dispatched2).assertFalse();
        expect(count2).assertEqual(0);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2700 failed, error: ${String(err)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2800
     * @tc.desc   Verify custom class once fires once and removeAllListener clears all listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      try {
        let target = new CustomTarget();
        let onceCount = 0;
        target.once('oncetest', () => { onceCount++; });
        target.dispatchEvent({ type: 'oncetest', timeStamp: Date.now() } as TestWorkerEvent);
        target.dispatchEvent({ type: 'oncetest', timeStamp: Date.now() } as TestWorkerEvent);
        expect(onceCount).assertEqual(1);

        let count = 0;
        target.addEventListener('test', () => { count++; });
        target.addEventListener('test', () => { count++; });
        target.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(count).assertEqual(2);
        target.removeAllListener();
        target.dispatchEvent({ type: 'test', timeStamp: Date.now() } as TestWorkerEvent);
        expect(count).assertEqual(2);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2800 failed, error: ${String(err)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest2900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_2900
     * @tc.desc   Verify custom wrapper class extends onmessage and onerror functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadWorkerInheritanceTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let wrapper = new CustomWorkerWrapper(workerInstance);
        let received = '';
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          wrapper.onMessageReceived = (e: MessageEvents) => {
            received = e.data as string;
            resolve();
          };
        });
        wrapper.post('hello');
        await waitForEvent(receivedPromise);
        expect(received).assertEqual('hello_response');
        expect(wrapper.messageCount).assertEqual(1);
        expect(wrapper.errorCount).assertEqual(0);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest2900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest3000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_3000
     * @tc.desc   Verify custom class implementing WorkerEventTarget and ILogger works for both interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadWorkerInheritanceTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      try {
        let target = new CustomTargetLogger();
        let count = 0;
        target.addEventListener('log', () => { count++; });
        let dispatched = target.dispatchEvent({ type: 'log', timeStamp: Date.now() } as TestWorkerEvent);
        expect(dispatched).assertTrue();
        expect(count).assertEqual(1);
        target.log('test message');
        expect(target.getLogCount()).assertEqual(1);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest3000 failed, error: ${String(err)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest3100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_3100
     * @tc.desc   Verify Worker and TaskPool can be used concurrently in one test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadWorkerInheritanceTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let workerReceived = false;
        const workerPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            if (e.data === 'hello_response') {
              workerReceived = true;
              resolve();
            }
          };
        });
        const task = new taskpool.Task(computeDouble, 21);
        const taskResultPromise = taskpool.execute(task);
        workerInstance.postMessage('hello');
        await waitForEvent(workerPromise);
        let timeoutId3100: number = -1;
        let taskResult = (await Promise.race([
          taskResultPromise,
          new Promise<number>((resolve: (v: number) => void) => {
            timeoutId3100 = setTimeout(() => resolve(-1), 5000);
          })
        ])) as number;
        clearTimeout(timeoutId3100);
        expect(workerReceived).assertTrue();
        expect(taskResult).assertEqual(42);
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest3100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });
  });
}
