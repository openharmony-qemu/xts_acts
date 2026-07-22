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
import { worker, MessageEvents } from '@kit.ArkTS';

class TestCallObject {
  msg: string = 'hello from host'

  getMessage(): string {
    return this.msg
  }

  getValue(): number {
    return 42
  }

  addValues(a: number, b: number): number {
    return a + b
  }
}

class SecondCallObject {
  label: string = 'second'

  getLabel(): string {
    return this.label
  }
}

export default function WorkerInvokeTest(): void {
  describe('WorkerInvokeTest', (): void => {
    let currentWorker: worker.ThreadWorker | null = null

    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach(async (): Promise<void> => {
      if (currentWorker !== null) {
        await new Promise<void>((resolve: () => void) => {
          currentWorker!.onexit = (code: number): void => {
            resolve()
          }
          currentWorker!.terminate()
        })
        currentWorker = null
      }
    })
    afterAll(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => { setTimeout((): void => resolve(), 500) })
    })

    /**
     * @tc.name   WorkerInvokeTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0100
     * @tc.desc   Verify registerGlobalCallObject registers object on host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let obj: TestCallObject = new TestCallObject()
      currentWorker.registerGlobalCallObject('testObj', obj)
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_result') {
            resolve(data['value'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_no_args', objName: 'testObj', methodName: 'getMessage' })
      })
      expect(result).assertEqual('hello from host')
    })

    /**
     * @tc.name   WorkerInvokeTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0200
     * @tc.desc   Verify Worker calls host no-arg method and gets return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let obj: TestCallObject = new TestCallObject()
      currentWorker.registerGlobalCallObject('testObj', obj)
      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'call_no_args', objName: 'testObj', methodName: 'getValue' })
      })
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   WorkerInvokeTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0300
     * @tc.desc   Verify callGlobalCallObjectMethod returns correct string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let obj: TestCallObject = new TestCallObject()
      obj.msg = 'custom message'
      currentWorker.registerGlobalCallObject('customObj', obj)
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_result') {
            resolve(data['value'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_no_args', objName: 'customObj', methodName: 'getMessage' })
      })
      expect(result).assertEqual('custom message')
    })

    /**
     * @tc.name   WorkerInvokeTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0400
     * @tc.desc   Verify callGlobalCallObjectMethod executes synchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let callCount: number = 0
      let obj: TestCallObject = new TestCallObject()
      currentWorker.registerGlobalCallObject('syncObj', obj)
      let result1: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_result') {
            callCount++
            resolve(data['value'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_no_args', objName: 'syncObj', methodName: 'getMessage' })
      })
      expect(result1).assertEqual('hello from host')
      expect(callCount).assertEqual(1)
    })

    /**
     * @tc.name   WorkerInvokeTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0500
     * @tc.desc   Verify multiple objects registered and callable independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerInvokeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let obj1: TestCallObject = new TestCallObject()
      let obj2: SecondCallObject = new SecondCallObject()
      currentWorker.registerGlobalCallObject('obj1', obj1)
      currentWorker.registerGlobalCallObject('obj2', obj2)
      let result1: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_result') {
            resolve(data['value'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_no_args', objName: 'obj1', methodName: 'getMessage' })
      })
      expect(result1).assertEqual('hello from host')
      let result2: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_result') {
            resolve(data['value'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_no_args', objName: 'obj2', methodName: 'getLabel' })
      })
      expect(result2).assertEqual('second')
    })

    /**
     * @tc.name   WorkerInvokeTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0600
     * @tc.desc   Verify calling nonexistent method on registered object returns error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let obj: TestCallObject = new TestCallObject()
      currentWorker.registerGlobalCallObject('testObj', obj)
      let errorMsg: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_error') {
            resolve(data['message'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_nonexistent_method', objName: 'testObj' })
      })
      expect(errorMsg).assertEqual(
        'The method to be called is not callable or is an async method or a generator.')
    })

    /**
     * @tc.name   WorkerInvokeTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0700
     * @tc.desc   Verify calling method on nonexistent object returns error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let errorMsg: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_error') {
            resolve(data['message'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_nonexistent_object' })
      })
      expect(errorMsg).assertEqual('The globalCallObject is not registered')
    })

    /**
     * @tc.name   WorkerInvokeTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0800
     * @tc.desc   Verify callGlobalCallObjectMethod with method arguments returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Register host object before any Worker messaging to avoid call_error race.
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let obj: TestCallObject = new TestCallObject()
      currentWorker.registerGlobalCallObject('argsObj0800', obj)

      // Warm up Worker thread; only resolve on ready (ignore unrelated messages).
      await new Promise<void>((resolve: (value: void) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'ready') {
            resolve()
          }
        }
        currentWorker!.postMessage({ type: '__ready__' })
      })

      // Filter call_result only; call_error/unknown must not resolve with undefined value.
      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'call_add_values', objName: 'argsObj0800' })
      })
      expect(result).assertEqual(30)
    })

    /**
     * @tc.name   WorkerInvokeTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_0900
     * @tc.desc   Verify unregisterGlobalCallObject removes registered object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      let obj: TestCallObject = new TestCallObject()
      currentWorker.registerGlobalCallObject('removeObj', obj)
      let result1: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_result') {
            resolve(data['value'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_no_args', objName: 'removeObj', methodName: 'getMessage' })
      })
      expect(result1).assertEqual('hello from host')
      currentWorker.unregisterGlobalCallObject('removeObj')
      let errorMsg: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'call_error') {
            resolve(data['message'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'call_nonexistent_object' })
      })
      expect(errorMsg).assertEqual('The globalCallObject is not registered')
    })

    /**
     * @tc.name   WorkerInvokeTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_INVOKE_TEST_1000
     * @tc.desc   Verify calling method after Worker terminated throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerInvokeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let wk: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/InvokeWorker.ets')
      currentWorker = wk
      let obj: TestCallObject = new TestCallObject()
      wk.registerGlobalCallObject('termObj', obj)
      await new Promise<void>((resolve: () => void) => {
        wk.onexit = (code: number): void => {
          resolve()
        }
        wk.terminate()
        currentWorker = null
      })
      let errorCaught: boolean = false
      try {
        wk.postMessage({ type: 'call_no_args', objName: 'termObj', methodName: 'getMessage' })
      } catch (err) {
        errorCaught = true
        if (err instanceof Error) {
          expect(err.message).assertEqual(
            'The Worker instance is not running, maybe worker is terminated when PostMessage')
        }
      }
      expect(errorCaught).assertTrue()
    })
  })
}
