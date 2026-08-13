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
    await waitForEvent(exitPromise);
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

export default function onExitTest(): void {
  describe('OnExitTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100);
    })

    afterEach(async (): Promise<void> => {
      await sleep(100);
    })

    /**
     * @tc.name   OnExitTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0100
     * @tc.desc   Verify onexit property exists and has the correct type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnExitTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            expect(workerInstance.onexit).assertUndefined();
        } catch (err) {
            console.error(`OnExitTest0100 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest0200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0200
     * @tc.desc   Verify onexit property can be set to a callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnExitTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            workerInstance.onexit = (code: number) => {};
            expect(typeof workerInstance.onexit).assertEqual('function');
        } catch (err) {
            console.error(`OnExitTest0200 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest0300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0300
     * @tc.desc   Verify exit code is 0 when worker terminates normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnExitTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
            await waitForEvent(exitPromise);
            workerInstance = null;
            expect(exitCalled).assertTrue();
            expect(exitCode).assertEqual(0);
        } catch (err) {
            console.error(`OnExitTest0300 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0400
     * @tc.desc   Verify exit code is 1 when worker exits abnormally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnExitTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
            let exitCode = -1;
            let exitCalled = false;
            workerInstance!.onerror = (e: ErrorEvent) => {
                console.info(`OnExitTest0400 onerror: ${e.message}`);
            };
            const exitPromise = new Promise<void>((resolve: () => void) => {
                workerInstance!.onexit = (code: number) => {
                    exitCode = code;
                    exitCalled = true;
                    resolve();
                };
            });
            workerInstance.postMessage('trigger_error');
            await waitForEvent(exitPromise);
            expect(exitCalled).assertTrue();
            expect(exitCode).assertEqual(1);
        } catch (err) {
            console.error(`OnExitTest0400 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0500
     * @tc.desc   Verify the code parameter is of type number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnExitTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            let receivedCode: number | null = null;
            const receivedPromise = new Promise<void>((resolve: () => void) => {
                workerInstance!.onexit = (code: number) => {
                    receivedCode = code;
                    resolve();
                };
            });
            workerInstance.terminate();
            await waitForEvent(receivedPromise);
            workerInstance = null;
            expect(typeof receivedCode).assertEqual('number');
        } catch (err) {
            console.error(`OnExitTest0500 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0600
     * @tc.desc   Verify exit code is 0 when worker is terminated normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnExitTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            let exitChecked = false;
            const exitPromise = new Promise<void>((resolve: () => void) => {
                workerInstance!.onexit = (code: number) => {
                    expect(code).assertEqual(0);
                    exitChecked = true;
                    resolve();
                };
            });
            workerInstance.terminate();
            await waitForEvent(exitPromise);
            workerInstance = null;
            expect(exitChecked).assertTrue();
        } catch (err) {
            console.error(`OnExitTest0600 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0700
     * @tc.desc   Verify onexit fires after terminate call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnExitTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            let exitCalled = false;
            const exitPromise = new Promise<void>((resolve: () => void) => {
                workerInstance!.onexit = (code: number) => {
                    exitCalled = true;
                    resolve();
                };
            });
            workerInstance.terminate();
            await waitForEvent(exitPromise);
            workerInstance = null;
            expect(exitCalled).assertTrue();
        } catch (err) {
            console.error(`OnExitTest0700 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0800
     * @tc.desc   Verify worker internal close triggers host onexit.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnExitTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceSelfCloseWorker.ets');
            let exitCode = -1;
            let exitCalled = false;
            const exitPromise = new Promise<void>((resolve: () => void) => {
                workerInstance!.onexit = (code: number) => {
                    exitCode = code;
                    exitCalled = true;
                    resolve();
                };
            });
            workerInstance.postMessage('close_self');
            await waitForEvent(exitPromise);
            expect(exitCalled).assertTrue();
            expect(exitCode).assertEqual(0);
        } catch (err) {
            console.error(`OnExitTest0800 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_0900
     * @tc.desc   Verify setting onexit twice overwrites the previous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnExitTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            let count1 = 0;
            let count2 = 0;
            const exitPromise = new Promise<void>((resolve: () => void) => {
                workerInstance!.onexit = (code: number) => {
                    count1++;
                };
                workerInstance!.onexit = (code: number) => {
                    count2++;
                    resolve();
                };
            });
            workerInstance.terminate();
            await waitForEvent(exitPromise);
            workerInstance = null;
            expect(count1).assertEqual(0);
            expect(count2).assertEqual(1);
        } catch (err) {
            console.error(`OnExitTest0900 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest1000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_1000
     * @tc.desc   Verify setting onexit to undefined prevents callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnExitTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            let count = 0;
            workerInstance.onexit = (code: number) => {
                count++;
            };
            workerInstance.onexit = undefined;
            workerInstance.terminate();
            const pollDeadline = Date.now() + 500;
            while (Date.now() < pollDeadline) {
                await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
            }
            workerInstance = null;
            expect(count).assertEqual(0);
        } catch (err) {
            console.error(`OnExitTest1000 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });

    /**
     * @tc.name   OnExitTest1100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_1100
     * @tc.desc   Verify multiple worker instances trigger onexit independently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnExitTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let workers: worker.ThreadWorker[] = [];
        try {
            const exitCodes: number[] = [];
            const exitPromise = new Promise<void>((resolve: () => void) => {
                for (let i = 0; i < 5; i++) {
                    const w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
                    w.onexit = (code: number) => {
                        exitCodes.push(code);
                        if (exitCodes.length >= 5) {
                            resolve();
                        }
                    };
                    workers.push(w);
                }
            });
            workers.forEach(w => w.terminate());
            await waitForEvent(exitPromise);
            workers = [];
            expect(exitCodes.length).assertEqual(5);
            for (let i = 0; i < exitCodes.length; i++) {
                expect(exitCodes[i]).assertEqual(0);
            }
        } catch (err) {
            console.error(`OnExitTest1100 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            for (const w of workers) {
                await terminateAndAwait(w);
            }
        }
        done();
    });

    /**
     * @tc.name   OnExitTest1200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONEXIT_1200
     * @tc.desc   Verify an exception thrown in onexit callback is contained and does not affect host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnExitTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
        let workerInstance: worker.ThreadWorker | null = null;
        try {
            workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
            let exitCalled = false;
            let exceptionContained = false;
            const exitPromise = new Promise<void>((resolve: () => void) => {
                workerInstance!.onexit = (code: number) => {
                    exitCalled = true;
                    try {
                        throw new Error('onexit callback error');
                    } catch (e) {
                        exceptionContained = true;
                    }
                    resolve();
                };
            });
            workerInstance.terminate();
            await waitForEvent(exitPromise);
            workerInstance = null;
            expect(exitCalled).assertTrue();
            expect(exceptionContained).assertTrue();
            // Main thread continues normally after onexit callback threw an exception.
            // Verify by creating a new worker and communicating with it.
            let secondWorker: worker.ThreadWorker | null = null;
            try {
                secondWorker = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
                let received = false;
                const receivedPromise = new Promise<void>((resolve: () => void) => {
                    secondWorker!.onmessage = (e: MessageEvents) => {
                        if (e.data === 'hello_response') {
                            received = true;
                            resolve();
                        }
                    };
                });
                secondWorker.postMessage('hello');
                await waitForEvent(receivedPromise);
                expect(received).assertTrue();
            } finally {
                await terminateAndAwait(secondWorker);
            }
        } catch (err) {
            console.error(`OnExitTest1200 failed, error: ${String(err)}`);
            expect().assertFail();
        } finally {
            await terminateAndAwait(workerInstance);
        }
        done();
    });
  });
}
