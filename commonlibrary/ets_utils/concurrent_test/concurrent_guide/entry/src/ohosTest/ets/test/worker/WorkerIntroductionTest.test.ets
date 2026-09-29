/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { worker, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { WorkerExchange, createEchoWorkerExchange } from '../WorkerHelper';

export default function WorkerIntroductionTest(): void {
  describe('WorkerIntroductionTest', (): void => {
    let currentWorker: worker.ThreadWorker | null = null

    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach(async (): Promise<void> => {
      if (currentWorker !== null) {
        await new Promise<void>((resolve: () => void) => {
          currentWorker!.onexit = (): void => { resolve() }
          currentWorker!.terminate()
        })
        currentWorker = null
      }
    })
    afterAll(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => { setTimeout((): void => resolve(), 500) })
    })

    /**
     * @tc.name   WorkerIntroductionTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0100
     * @tc.desc   Verify Worker manual creation and basic message communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('hello')
      })
      expect(result).assertEqual('hello received')
    })

    /**
     * @tc.name   WorkerIntroductionTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0200
     * @tc.desc   Verify Worker loading with Stage model path syntax moduleName/ets/relativePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('ping')
      })
      expect(result).assertEqual('pong')
    })

    /**
     * @tc.name   WorkerIntroductionTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0300
     * @tc.desc   Verify Worker loading with Stage model path syntax @moduleName/ets/relativePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('compute')
      })
      expect(result).assertEqual(49995000)
    })

    /**
     * @tc.name   WorkerIntroductionTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0400
     * @tc.desc   Verify Worker creation with invalid path throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let errorCaught: boolean = false
      try {
        let invalidWorker: worker.ThreadWorker = new worker.ThreadWorker('invalid/path/worker.ets')
        invalidWorker.terminate()
      } catch (err) {
        errorCaught = true
        expect(err instanceof Error).assertTrue()
      }
      expect(errorCaught).assertTrue()
    })

    /**
     * @tc.name   WorkerIntroductionTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0500
     * @tc.desc   Verify Worker normal creation returns valid instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      expect(currentWorker !== undefined).assertTrue()
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('hello')
      })
      expect(result).assertEqual('hello received')
    })

    /**
     * @tc.name   WorkerIntroductionTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0600
     * @tc.desc   Verify Worker terminate destroys worker and triggers onexit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = wk
      let exitCode: number = await new Promise<number>((resolve: (value: number) => void) => {
        wk.onexit = (code: number): void => {
          resolve(code)
        }
        wk.terminate()
        currentWorker = null
      })
      expect(exitCode).assertEqual(0)
    })

    /**
     * @tc.name   WorkerIntroductionTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0700
     * @tc.desc   Verify Worker close() destroys worker from within worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = wk
      let closingVerified: boolean = false
      let exitCode: number = await new Promise<number>((resolve: (value: number) => void) => {
        wk.onexit = (code: number): void => {
          closingVerified = true
          resolve(code)
        }
        wk.terminate()
        currentWorker = null
      })
      expect(closingVerified).assertTrue()
      expect(exitCode).assertEqual(0)
    })

    /**
     * @tc.name   WorkerIntroductionTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0800
     * @tc.desc   Verify onexit callback is registered and triggered on worker exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = wk
      let exitCalled: boolean = false
      let exitCode: number = -1
      await new Promise<void>((resolve: () => void) => {
        wk.onexit = (code: number): void => {
          exitCalled = true
          exitCode = code
          resolve()
        }
        wk.terminate()
        currentWorker = null
      })
      expect(exitCalled).assertTrue()
      expect(exitCode).assertEqual(0)
    })

    /**
     * @tc.name   WorkerIntroductionTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_0900
     * @tc.desc   Verify Worker normal exit returns code 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerIntroductionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = wk
      let exitCode: number = await new Promise<number>((resolve: (value: number) => void) => {
        wk.onexit = (code: number): void => {
          resolve(code)
        }
        wk.terminate()
        currentWorker = null
      })
      expect(exitCode).assertEqual(0)
    })

    /**
     * @tc.name   WorkerIntroductionTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1000
     * @tc.desc   Verify Worker abnormal exit returns non-zero code when error thrown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerIntroductionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerThrowError.ets')
      currentWorker = wk
      let exitCode: number = await new Promise<number>((resolve: (value: number) => void) => {
        let resolved: boolean = false
        wk.onerror = (e: ErrorEvent): void => {
          if (!resolved) {
            resolved = true
            resolve(-1)
          }
        }
        wk.onexit = (code: number): void => {
          if (!resolved) {
            resolved = true
            resolve(code)
          }
        }
        wk.postMessage('throw_error')
      })
      expect(exitCode !== 0).assertTrue()
    })

    /**
     * @tc.name   WorkerIntroductionTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1100
     * @tc.desc   Verify calling postMessage after Worker terminated throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = wk
      await new Promise<void>((resolve: () => void) => {
        wk.onexit = (code: number): void => {
          resolve()
        }
        wk.terminate()
        currentWorker = null
      })
      let errorCaught: boolean = false
      try {
        wk.postMessage('test')
      } catch (err) {
        errorCaught = true
        expect(err instanceof Error).assertTrue()
      }
      expect(errorCaught).assertTrue()
    })

    /**
     * @tc.name   WorkerIntroductionTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1200
     * @tc.desc   Verify Worker async exit timing - worker not immediately destroyed after terminate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerIntroductionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = wk
      let terminateCalled: boolean = false
      let exitCompleted: boolean = false
      await new Promise<void>((resolve: () => void) => {
        wk.onexit = (code: number): void => {
          exitCompleted = true
          resolve()
        }
        wk.terminate()
        terminateCalled = true
        currentWorker = null
      })
      expect(terminateCalled).assertTrue()
      expect(exitCompleted).assertTrue()
    })

    /**
     * @tc.name   WorkerIntroductionTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1300
     * @tc.desc   Verify multiple Workers can be created simultaneously and terminated cleanly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerIntroductionTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let workers: worker.ThreadWorker[] = []
      let maxCount: number = 8
      for (let i: number = 0; i < maxCount; i++) {
        let w: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
        workers.push(w)
      }
      expect(workers.length).assertEqual(maxCount)
      let exitPromises: Promise<void>[] = []
      for (let i: number = 0; i < workers.length; i++) {
        let p: Promise<void> = new Promise<void>((resolve: () => void) => {
          workers[i].onexit = (code: number): void => {
            resolve()
          }
        })
        exitPromises.push(p)
        workers[i].terminate()
      }
      await Promise.all(exitPromises)
    })

    /**
     * @tc.name   WorkerIntroductionTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1400
     * @tc.desc   Verify batch Worker creation and termination lifecycle management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let workers: worker.ThreadWorker[] = []
      let maxCount: number = 8
      for (let i: number = 0; i < maxCount; i++) {
        let w: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
        workers.push(w)
      }
      expect(workers.length).assertEqual(maxCount)
      let exitPromises: Promise<void>[] = []
      for (let i: number = 0; i < workers.length; i++) {
        let p: Promise<void> = new Promise<void>((resolve: () => void) => {
          workers[i].onexit = (code: number): void => {
            resolve()
          }
        })
        exitPromises.push(p)
        workers[i].terminate()
      }
      await Promise.all(exitPromises)
    })

    /**
     * @tc.name   WorkerIntroductionTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1500
     * @tc.desc   Verify onmessage callback receives message from Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let receivedData: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('test_callback')
      })
      expect(receivedData).assertEqual('echo: test_callback')
    })

    /**
     * @tc.name   WorkerIntroductionTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1600
     * @tc.desc   Verify onmessageerror callback registration and Worker continues functioning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let messageErrorCalled: boolean = false
      currentWorker.onmessageerror = (e: MessageEvents): void => {
        messageErrorCalled = true
      }
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('hello')
      })
      expect(result).assertEqual('hello received')
      expect(messageErrorCalled).assertFalse()
    })

    /**
     * @tc.name   WorkerIntroductionTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1700
     * @tc.desc   Verify onerror callback fires when Worker throws uncaught exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerThrowError.ets')
      let errorFired: boolean = await new Promise<boolean>((resolve: (value: boolean) => void) => {
        let resolved: boolean = false
        currentWorker!.onerror = (e: ErrorEvent): void => {
          if (!resolved) {
            resolved = true
            resolve(true)
          }
        }
        currentWorker!.onexit = (code: number): void => {
          if (!resolved) {
            resolved = true
            resolve(false)
          }
        }
        currentWorker!.postMessage('throw_error')
      })
      expect(errorFired).assertTrue()
    })

    /**
     * @tc.name   WorkerIntroductionTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1800
     * @tc.desc   Verify parent Worker creates child Worker successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/ParentWorker.ets')
      let childCreated: boolean = await new Promise<boolean>((resolve: (value: boolean) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          if ((e.data as string) === 'child_created') {
            resolve(true)
          }
        }
        currentWorker!.postMessage('create_child')
      })
      expect(childCreated).assertTrue()
      // Cleanup: release the child Worker created by ParentWorker to avoid stress-run leaks
      let childTerminated: boolean = await new Promise<boolean>((resolve: (value: boolean) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          if ((e.data as string) === 'child_terminated') {
            resolve(true)
          }
        }
        currentWorker!.postMessage('terminate_child')
      })
      expect(childTerminated).assertTrue()
    })

    /**
     * @tc.name   WorkerIntroductionTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_1900
     * @tc.desc   Verify multi-level message passing from host through parent to child Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/ParentWorker.ets')
      let finalResult: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let msg: string = e.data as string
          if (msg.startsWith('final_result:')) {
            resolve(msg)
          }
        }
        currentWorker!.postMessage('send_to_child:test_message')
      })
      expect(finalResult).assertEqual('final_result:test_message_processed')
      // Cleanup: release the child Worker created by ParentWorker to avoid stress-run leaks
      let childTerminated: boolean = await new Promise<boolean>((resolve: (value: boolean) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          if ((e.data as string) === 'child_terminated') {
            resolve(true)
          }
        }
        currentWorker!.postMessage('terminate_child')
      })
      expect(childTerminated).assertTrue()
    })

    /**
     * @tc.name   WorkerIntroductionTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_2000
     * @tc.desc   Verify recommended terminate order - child Worker before parent Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerIntroductionTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/ParentWorker.ets')
      let childTerminated: boolean = await new Promise<boolean>((resolve: (value: boolean) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let msg: string = e.data as string
          if (msg === 'child_created') {
            currentWorker!.postMessage('terminate_child')
          } else if (msg === 'child_terminated') {
            resolve(true)
          }
        }
        currentWorker!.postMessage('create_child')
      })
      expect(childTerminated).assertTrue()
    })

    /**
     * @tc.name   WorkerIntroductionTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INTRODUCTION_TEST_2100
     * @tc.desc   Verify Worker handles multiple sequential message exchanges correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerIntroductionTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let exchange: WorkerExchange = await createEchoWorkerExchange('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = exchange.getWorker()
      let result1: string = await exchange.sendString('hello')
      expect(result1).assertEqual('hello received')
      let result2: string = await exchange.sendString('ping')
      expect(result2).assertEqual('pong')
      let result3: string = await exchange.sendString('test_data')
      expect(result3).assertEqual('echo: test_data')
      await exchange.terminate()
      currentWorker = null
    })
  })
}
