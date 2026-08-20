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
import { BusinessError } from '@kit.BasicServicesKit';

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

interface TestWorkerEvent {
  type: string;
  timeStamp: number;
}

/**
 * User-defined class implementing worker.WorkerEventTarget with the full set of
 * interface methods (addEventListener/removeEventListener/dispatchEvent/
 * removeAllListener) plus the ThreadWorker convenience methods (on/once/off)
 * and custom extension properties (name/eventCount/getEventCount).
 */
class CustomEventTarget implements WorkerEventTarget {
  private listeners: Map<string, WorkerEventListener[]> = new Map<string, WorkerEventListener[]>();
  name: string = 'CustomEventTarget';
  eventCount: number = 0;

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
    this.eventCount++;
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
    let self: CustomEventTarget = this;
    let onceListener: WorkerEventListener = (event: Event): void => {
      self.removeEventListener(type, onceListener);
      listener(event);
    };
    this.addEventListener(type, onceListener);
  }

  off(type: string, callback?: WorkerEventListener): void {
    this.removeEventListener(type, callback);
  }

  getEventCount(): number {
    return this.eventCount;
  }
}

interface ILogger {
  log(message: string): void;
}

/**
 * User-defined class implementing worker.WorkerEventTarget together with an
 * extra user interface ILogger, verifying multi-interface implementation on a
 * single inheritance object.
 */
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

  on(type: string, listener: WorkerEventListener): void {
    this.addEventListener(type, listener);
  }

  once(type: string, listener: WorkerEventListener): void {
    let self: CustomTargetLogger = this;
    let onceListener: WorkerEventListener = (event: Event): void => {
      self.removeEventListener(type, onceListener);
      listener(event);
    };
    this.addEventListener(type, onceListener);
  }

  off(type: string, callback?: WorkerEventListener): void {
    this.removeEventListener(type, callback);
  }

  log(message: string): void {
    this.logs.push(message);
  }

  getLogCount(): number {
    return this.logs.length;
  }
}

@Concurrent
async function createWorkerInTask(): Promise<string> {
  let w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
  try {
    // Wait for an observable worker response instead of using a fixed delay.
    // This keeps the lifecycle deterministic before terminate() is requested.
    let responded: boolean = false;
    const responsePromise = new Promise<void>((resolve: () => void) => {
      w.onmessage = (e: MessageEvents): void => {
        if (e.data === 'hello_response') {
          responded = true;
          resolve();
        }
      };
    });
    w.postMessage('hello');
    let timeoutId: number = -1;
    await Promise.race([
      responsePromise,
      new Promise<void>((resolve: () => void) => {
        timeoutId = setTimeout(resolve, 2000);
      })
    ]);
    clearTimeout(timeoutId);
    return responded ? 'done' : 'no_response';
  } finally {
    try {
      w.terminate();
    } catch (err) {
      console.warn(`createWorkerInTask terminate failed: ${String(err)}`);
    }
  }
}

export default function ThreadWorkerInheritanceTest(): void {
  describe('ThreadWorkerInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   ThreadWorkerInheritanceTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0100
     * @tc.desc   Verify a ThreadWorker instance belongs to the ThreadWorker inheritance chain.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        expect(typeof workerInstance.postMessage).assertEqual('function');
        expect(typeof workerInstance.terminate).assertEqual('function');
        let received: string = '';
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents): void => {
            received = e.data as string;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(receivedPromise);
        expect(received).assertEqual('hello_response');
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
     * @tc.desc   Verify ThreadWorker implements the WorkerEventTarget interface methods and they work on real message events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
        let fired: boolean = false;
        const firedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.addEventListener('message', (): void => {
            fired = true;
            resolve();
          });
        });
        workerInstance.postMessage('ping');
        await waitForEvent(firedPromise);
        expect(fired).assertTrue();
        workerInstance.removeEventListener('message');
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
     * @tc.desc   Verify RestrictedWorker extends ThreadWorker and inherits its methods; construction is rejected on a non-system test app because RestrictedWorker is a system API.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let restrictedWorker: worker.RestrictedWorker | null = null;
      let constructionRejected: boolean = false;
      try {
        restrictedWorker = new worker.RestrictedWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
      } catch (err) {
        // RestrictedWorker is declared with @systemapi in the SDK; a normal
        // (non-system) test application cannot construct it, which is recorded
        // as evidence for the NOT_APPLICABLE status of this design point.
        constructionRejected = true;
        console.error(`ThreadWorkerInheritanceTest0300 RestrictedWorker construction rejected: ${String(err)}`);
      }
      if (restrictedWorker === null) {
        expect(constructionRejected).assertTrue();
      } else {
        // Runtime evidence (2026-08-19, SDK 26 dynamic): instanceof against
        // native-backed worker classes is unreliable (the same limitation is
        // verified for taskpool.LongTask/GenericsTask), so inheritance is
        // verified through the inherited method surface instead.
        expect(typeof restrictedWorker.postMessage).assertEqual('function');
        expect(typeof restrictedWorker.terminate).assertEqual('function');
        expect(typeof restrictedWorker.addEventListener).assertEqual('function');
        expect(typeof restrictedWorker.removeEventListener).assertEqual('function');
        expect(typeof restrictedWorker.dispatchEvent).assertEqual('function');
        expect(typeof restrictedWorker.removeAllListener).assertEqual('function');
        expect(typeof restrictedWorker.on).assertEqual('function');
        expect(typeof restrictedWorker.once).assertEqual('function');
        expect(typeof restrictedWorker.off).assertEqual('function');
        await terminateAndAwait(restrictedWorker);
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0400
     * @tc.desc   Verify a custom class fully implements WorkerEventTarget and addEventListener registers a listener that dispatchEvent invokes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let target = new CustomEventTarget();
      expect(typeof target.addEventListener).assertEqual('function');
      expect(typeof target.removeEventListener).assertEqual('function');
      expect(typeof target.dispatchEvent).assertEqual('function');
      expect(typeof target.removeAllListener).assertEqual('function');
      expect(typeof target.on).assertEqual('function');
      expect(typeof target.once).assertEqual('function');
      expect(typeof target.off).assertEqual('function');
      let count: number = 0;
      target.addEventListener('custom', (): void => {
        count++;
      });
      let dispatched: boolean = target.dispatchEvent({ type: 'custom', timeStamp: Date.now() } as TestWorkerEvent);
      expect(dispatched).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0500
     * @tc.desc   Verify dispatchEvent returns false without listeners and a custom class extension property counts dispatched events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let target = new CustomEventTarget();
      expect(target.name).assertEqual('CustomEventTarget');
      expect(target.eventCount).assertEqual(0);
      let dispatched: boolean = target.dispatchEvent({ type: 'no_listener', timeStamp: Date.now() } as TestWorkerEvent);
      expect(dispatched).assertFalse();
      expect(target.getEventCount()).assertEqual(1);
      target.addEventListener('custom', (): void => {});
      dispatched = target.dispatchEvent({ type: 'custom', timeStamp: Date.now() } as TestWorkerEvent);
      expect(dispatched).assertTrue();
      expect(target.eventCount).assertEqual(2);
      expect(target.getEventCount()).assertEqual(2);
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0600
     * @tc.desc   Verify removeEventListener removes a specific listener and removes all listeners of a type when no callback is given.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let target = new CustomEventTarget();
      let count: number = 0;
      const cb = (): void => { count++; };
      target.addEventListener('custom', cb);
      target.dispatchEvent({ type: 'custom', timeStamp: Date.now() } as TestWorkerEvent);
      expect(count).assertEqual(1);
      target.removeEventListener('custom', cb);
      target.dispatchEvent({ type: 'custom', timeStamp: Date.now() } as TestWorkerEvent);
      expect(count).assertEqual(1);
      let count2: number = 0;
      target.addEventListener('custom2', (): void => { count2++; });
      target.addEventListener('custom2', (): void => { count2++; });
      target.removeEventListener('custom2');
      let dispatched: boolean = target.dispatchEvent({ type: 'custom2', timeStamp: Date.now() } as TestWorkerEvent);
      expect(dispatched).assertFalse();
      expect(count2).assertEqual(0);
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0700
     * @tc.desc   Verify removeAllListener clears listeners of all event types on a custom WorkerEventTarget.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let target = new CustomEventTarget();
      let count: number = 0;
      target.addEventListener('type1', (): void => { count++; });
      target.addEventListener('type2', (): void => { count++; });
      target.dispatchEvent({ type: 'type1', timeStamp: Date.now() } as TestWorkerEvent);
      target.dispatchEvent({ type: 'type2', timeStamp: Date.now() } as TestWorkerEvent);
      expect(count).assertEqual(2);
      target.removeAllListener();
      let dispatched1: boolean = target.dispatchEvent({ type: 'type1', timeStamp: Date.now() } as TestWorkerEvent);
      let dispatched2: boolean = target.dispatchEvent({ type: 'type2', timeStamp: Date.now() } as TestWorkerEvent);
      expect(dispatched1).assertFalse();
      expect(dispatched2).assertFalse();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0800
     * @tc.desc   Verify on/once/off behavior on a custom WorkerEventTarget and multi-interface implementation with ILogger.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let target = new CustomEventTarget();
      let onCount: number = 0;
      target.on('ontest', (): void => { onCount++; });
      target.dispatchEvent({ type: 'ontest', timeStamp: Date.now() } as TestWorkerEvent);
      target.dispatchEvent({ type: 'ontest', timeStamp: Date.now() } as TestWorkerEvent);
      expect(onCount).assertEqual(2);
      let onceCount: number = 0;
      target.once('oncetest', (): void => { onceCount++; });
      target.dispatchEvent({ type: 'oncetest', timeStamp: Date.now() } as TestWorkerEvent);
      target.dispatchEvent({ type: 'oncetest', timeStamp: Date.now() } as TestWorkerEvent);
      expect(onceCount).assertEqual(1);
      const cb = (): void => { onCount++; };
      target.on('offtest', cb);
      target.off('offtest', cb);
      target.dispatchEvent({ type: 'offtest', timeStamp: Date.now() } as TestWorkerEvent);
      expect(onCount).assertEqual(2);
      let logger = new CustomTargetLogger();
      expect(typeof logger.addEventListener).assertEqual('function');
      expect(typeof logger.log).assertEqual('function');
      logger.log('test message');
      expect(logger.getLogCount()).assertEqual(1);
      let logCount: number = 0;
      logger.addEventListener('log', (): void => { logCount++; });
      let dispatched: boolean = logger.dispatchEvent({ type: 'log', timeStamp: Date.now() } as TestWorkerEvent);
      expect(dispatched).assertTrue();
      expect(logCount).assertEqual(1);
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_0900
     * @tc.desc   Verify ThreadWorker.postMessage sends a message to the worker and receives the echo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received: string = '';
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            received = e.data as string;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(receivedPromise);
        expect(received).assertEqual('hello_response');
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
     * @tc.desc   Verify postMessage with transfer hands ArrayBuffer ownership to the worker and the echoed buffer keeps its size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received: boolean = false;
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
        const buffer = new ArrayBuffer(32);
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
     * @tc.desc   Verify postMessageWithSharedSendable passes a sendable container by shared reference visible on both sides.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        const sharedArr = new collections.Array<number>(1, 2, 3);
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
        workerInstance.postMessageWithSharedSendable(sharedArr);
        await waitForEvent(receivedPromise);
        expect(received).assertTrue();
        // The worker appended a value through the shared reference; the host
        // side observes the mutation without an explicit reply message.
        expect(sharedArr.length).assertEqual(4);
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
     * @tc.desc   Verify ThreadWorker.terminate stops the worker thread with exit code 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let exitCode: number = -1;
        let exited: boolean = false;
        const exitPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onexit = (code: number) => {
            exitCode = code;
            exited = true;
            resolve();
          };
        });
        workerInstance.terminate();
        let timeoutId1200: number = -1;
        await Promise.race([
          exitPromise,
          new Promise<void>((resolve: () => void) => {
            timeoutId1200 = setTimeout(resolve, 3000);
          })
        ]);
        clearTimeout(timeoutId1200);
        expect(exited).assertTrue();
        expect(exitCode).assertEqual(0);
        workerInstance = null;
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
     * @tc.desc   Verify the onexit callback property can be set and is triggered after termination.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let triggered: boolean = false;
        workerInstance.onexit = (code: number) => {
          triggered = true;
        };
        expect(typeof workerInstance.onexit).assertEqual('function');
        const exitPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onexit = (code: number) => {
            triggered = true;
            resolve();
          };
        });
        workerInstance.terminate();
        let timeoutId1300: number = -1;
        await Promise.race([
          exitPromise,
          new Promise<void>((resolve: () => void) => {
            timeoutId1300 = setTimeout(resolve, 3000);
          })
        ]);
        clearTimeout(timeoutId1300);
        expect(triggered).assertTrue();
        workerInstance = null;
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
     * @tc.desc   Verify the onerror callback property can be set and is triggered when the worker throws an error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let triggered: boolean = false;
        workerInstance.onerror = (err: ErrorEvent) => {
          triggered = true;
        };
        expect(typeof workerInstance.onerror).assertEqual('function');
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
     * @tc.desc   Verify the onmessage callback property can be set and is triggered with the worker echo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        let received: string = '';
        workerInstance.onmessage = (e: MessageEvents) => {
          received = e.data as string;
        };
        expect(typeof workerInstance.onmessage).assertEqual('function');
        const receivedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            received = e.data as string;
            resolve();
          };
        });
        workerInstance.postMessage('hello');
        await waitForEvent(receivedPromise);
        expect(received).assertEqual('hello_response');
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
     * @tc.desc   Verify a ThreadWorker can be created and used inside a TaskPool task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadWorkerInheritanceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      try {
        const task = new taskpool.Task(createWorkerInTask);
        const taskResultPromise = taskpool.execute(task);
        let timeoutId1600: number = -1;
        let taskResult: string = (await Promise.race([
          taskResultPromise,
          new Promise<string>((resolve: (v: string) => void) => {
            timeoutId1600 = setTimeout(() => resolve('timeout'), 5000);
          })
        ])) as string;
        clearTimeout(timeoutId1600);
        expect(taskResult).assertEqual('done');
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1600 failed, error: ${String(err)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1700
     * @tc.desc   Verify multiple ThreadWorker instances run concurrently and each returns its echo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
        console.error(`ThreadWorkerInheritanceTest1700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        for (const w of workers) {
          await terminateAndAwait(w);
        }
      }
      done();
    });

    /**
     * @tc.name   ThreadWorkerInheritanceTest1800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_THREADWORKER_1800
     * @tc.desc   Verify postMessage on a terminated worker throws BusinessError with code 10200004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ThreadWorkerInheritanceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        await terminateAndAwait(workerInstance);
        let caught: boolean = false;
        try {
          workerInstance.postMessage('test');
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          expect(e.code).assertEqual(10200004);
          caught = true;
        }
        expect(caught).assertTrue();
        workerInstance = null;
      } catch (err) {
        console.error(`ThreadWorkerInheritanceTest1800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });
  });
}
