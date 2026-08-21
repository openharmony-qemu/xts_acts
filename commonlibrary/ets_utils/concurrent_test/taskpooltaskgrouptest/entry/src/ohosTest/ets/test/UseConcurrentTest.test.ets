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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool, collections, worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import { ConcurrentData, ResultData } from '../testability/pages/ConcurrentTestData';
import { tsConcurrentAdd, tsConcurrentMultiply, tsConcurrentIdentity, tsConcurrentStringLength, tsComboConcurrent, ucComboSendableMainDispatch } from './ConcurrentTsFuncSource';
import { jsConcurrentDouble, jsConcurrentAdd } from './ConcurrentJsFuncSource';

interface WorkerTimeout {
  timeoutPromise: Promise<never>;
  cancel: () => void;
}

function createWorkerTimeout(timeoutMs: number, message: string): WorkerTimeout {
  let timeoutId: number = -1;
  const timeoutPromise = new Promise<never>((resolve: (value?: never) => void, reject: (reason?: Object) => void): void => {
    timeoutId = setTimeout((): void => {
      reject(new Error(message));
    }, timeoutMs);
  });
  const cancel = (): void => {
    if (timeoutId !== -1) {
      clearTimeout(timeoutId);
    }
  };
  return { timeoutPromise: timeoutPromise, cancel: cancel };
}

/*
 * Local 'use concurrent' functions that use collections sendable containers.
 * These cannot live in .ts files (which cannot import collections from
 * @kit.ArkTS), so they are defined here in the .ets test module.
 */
function ucArrayModify(arr: collections.Array<number>): number {
  'use concurrent'
  arr.push(100)
  return arr.length
}

function ucMapModify(map: collections.Map<string, number>): number {
  'use concurrent'
  map.set('uc_key', 42)
  return map.size
}

function ucSetModify(set: collections.Set<number>): number {
  'use concurrent'
  set.add(99)
  return set.size
}

function ucBitVectorLength(bv: collections.BitVector): number {
  'use concurrent'
  bv.push(1)
  bv.push(1)
  return bv.length
}

function concurrentReturnCollectionsArray(): collections.Array<number> {
  'use concurrent'
  let arr = new collections.Array<number>()
  arr.push(10)
  arr.push(20)
  arr.push(30)
  return arr
}

function concurrentReturnCollectionsMap(): collections.Map<string, number> {
  'use concurrent'
  let map = new collections.Map<string, number>()
  map.set('x', 100)
  map.set('y', 200)
  return map
}

/*
 * 'use concurrent' keyword placed at the first line of the function body,
 * functionally equivalent to the @Concurrent decorator.
 */
function concurrentNoArgs(): number {
  'use concurrent'
  return 100
}

function concurrentAdd(a: number, b: number): number {
  'use concurrent'
  return a + b
}

function concurrentStringLen(s: string): number {
  'use concurrent'
  return s.length
}

function concurrentBoolToInt(b: boolean): number {
  'use concurrent'
  return b ? 1 : 0
}

function concurrentWithArrayBuffer(ab: ArrayBuffer): number {
  'use concurrent'
  return ab.byteLength
}

function concurrentProcessSendable(data: ConcurrentData): number {
  'use concurrent'
  return data.input_ * 2
}

function concurrentReturnNumber(): number {
  'use concurrent'
  return 42
}

function concurrentReturnString(): string {
  'use concurrent'
  return 'result'
}

function concurrentReturnBoolean(val: number): boolean {
  'use concurrent'
  return val > 0
}

function concurrentCreateResult(val: number): ResultData {
  'use concurrent'
  let result = new ResultData()
  result.value_ = val
  return result
}

function ucAdd(a: number, b: number): number {
  'use concurrent'
  return a + b
}

function ucBlankLineFirst(): number {

  'use concurrent'
  return 100
}

async function ucNestedTaskPool(): Promise<number> {
  'use concurrent'
  let innerTaskObj = new taskpool.Task(tsConcurrentIdentity, 100.0)
  let result = await taskpool.execute(innerTaskObj)
  return Number(result) + 50
}

async function ucAsyncConcurrent(): Promise<number> {
  'use concurrent'
  let v: number = await Promise.resolve(42)
  return v
}

export default function UseConcurrentTest(): void {
  describe('UseConcurrentTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   UseConcurrentTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0100
     * @tc.desc   Verify use concurrent keyword in .ets file function executes in TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(concurrentNoArgs)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(100))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0200
     * @tc.desc   Verify use concurrent keyword in .ts file function executes via cross-file import
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(tsConcurrentAdd, 15.0, 27.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0300
     * @tc.desc   Verify use concurrent keyword in .js file function executes via cross-file import
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(jsConcurrentDouble, 21.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0400
     * @tc.desc   Verify use concurrent function with number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(concurrentAdd, 8.0, 2.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(10))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0500
     * @tc.desc   Verify use concurrent function with string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(concurrentStringLen, 'hello')
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(5))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0600
     * @tc.desc   Verify use concurrent function with boolean parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1 = new taskpool.Task(concurrentBoolToInt, true)
      let task2 = new taskpool.Task(concurrentBoolToInt, false)

      try {
        let result1 = await taskpool.execute(task1)
      } catch (error) {
        console.error(`async await failed: ${error}`)
        expect().assertFail()
      }
      try {
        let result2 = await taskpool.execute(task2)
      } catch (error) {
        console.error(`async await failed: ${error}`)
        expect().assertFail()
      }

      expect(String(result1)).assertEqual(String(1))
      expect(String(result2)).assertEqual(String(0))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0700
     * @tc.desc   Verify use concurrent function modifying collections.Array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1)
      arr.push(2)
      arr.push(3)

      let task = new taskpool.Task(ucArrayModify, arr)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(4))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0800
     * @tc.desc   Verify use concurrent function modifying collections.Map parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let map = new collections.Map<string, number>()
      map.set('existing', 1)

      let task = new taskpool.Task(ucMapModify, map)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(2))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0900
     * @tc.desc   Verify use concurrent function modifying collections.Set parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)

      let task = new taskpool.Task(ucSetModify, set)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(3))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1000
     * @tc.desc   Verify use concurrent function processing collections.BitVector parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let bv = new collections.BitVector(16)

      let task = new taskpool.Task(ucBitVectorLength, bv)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(18))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1100
     * @tc.desc   Verify use concurrent function with ArrayBuffer parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let ab = new ArrayBuffer(32)

      let task = new taskpool.Task(concurrentWithArrayBuffer, ab)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(32))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1200
     * @tc.desc   Verify use concurrent function with @Sendable class parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let data = new ConcurrentData()
      data.input_ = 30

      let task = new taskpool.Task(concurrentProcessSendable, data)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(60))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1300
     * @tc.desc   Verify use concurrent function returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(concurrentReturnNumber)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1400
     * @tc.desc   Verify use concurrent function returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(concurrentReturnString)
      let result = await taskpool.execute(task)

      expect(result as string).assertEqual('result')
      done()
    })

    /**
     * @tc.name   UseConcurrentTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1500
     * @tc.desc   Verify use concurrent function returning boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1 = new taskpool.Task(concurrentReturnBoolean, 42.0)
        let task2 = new taskpool.Task(concurrentReturnBoolean, -1.0)

        let result1 = await taskpool.execute(task1)
        let result2 = await taskpool.execute(task2)

        expect(result1 as boolean).assertTrue()
        expect(result2 as boolean).assertFalse()
        done()
      } catch (error) {
        console.error(`UseConcurrentTest1500 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseConcurrentTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1600
     * @tc.desc   Verify use concurrent function returning collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(concurrentReturnCollectionsArray)
        let result = await taskpool.execute(task) as collections.Array<number>

        expect(result.length).assertEqual(3)
        expect(result[0]).assertEqual(10)
        expect(result[1]).assertEqual(20)
        expect(result[2]).assertEqual(30)
        done()
      } catch (error) {
        console.error(`UseConcurrentTest1600 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseConcurrentTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1700
     * @tc.desc   Verify use concurrent function returning collections.Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(concurrentReturnCollectionsMap)
        let result = await taskpool.execute(task) as collections.Map<string, number>

        expect(result.size).assertEqual(2)
        expect(result.get('x')).assertEqual(100)
        expect(result.get('y')).assertEqual(200)
        done()
      } catch (error) {
        console.error(`UseConcurrentTest1700 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseConcurrentTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1800
     * @tc.desc   Verify use concurrent function returning @Sendable class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(concurrentCreateResult, 55.0)
        let result = await taskpool.execute(task) as ResultData

        expect(result.value_).assertEqual(55)
        done()
      } catch (error) {
        console.error(`UseConcurrentTest1800 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseConcurrentTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1900
     * @tc.desc   Verify use concurrent keyword placed at first line of function body is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(ucAdd, 15.0, 25.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(40))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2000
     * @tc.desc   Verify use concurrent keyword still valid when preceded by blank line in function body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(ucBlankLineFirst)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(100))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2100
     * @tc.desc   Verify .ets file imports .ts concurrent function with string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(tsConcurrentStringLength, 'cross_file')
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(10))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2200
     * @tc.desc   Verify .ets file imports .js concurrent function with two params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(jsConcurrentAdd, 15.0, 27.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2300
     * @tc.desc   Verify TaskGroup uses cross-file imported .ts concurrent functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup()
        group.addTask(tsConcurrentAdd, 10.0, 20.0)
        group.addTask(tsConcurrentMultiply, 3.0, 4.0)
        group.addTask(tsConcurrentIdentity, 42.0)

        let results = await taskpool.execute(group) as Object[]

        expect(results.length).assertEqual(3)
        expect(String(results[0])).assertEqual(String(30))
        expect(String(results[1])).assertEqual(String(12))
        expect(String(results[2])).assertEqual(String(42))
        done()
      } catch (error) {
        console.error(`UseConcurrentTest2300 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseConcurrentTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2400
     * @tc.desc   Verify use concurrent function nests TaskPool.execute of an inner task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(ucNestedTaskPool)
      let result: Object = undefined
      try {
        result = await taskpool.execute(task)
      } catch (error) {
        console.error(`UseConcurrentTest2400 failed: ${error}`)
        expect().assertFail()
        done()
        return
      }

      expect(String(result)).assertEqual(String(150))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2500
     * @tc.desc   Verify 10 concurrent tasks using .ts imported functions execute with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(tsConcurrentIdentity, i * 1.0))
        }

        let results = await Promise.all(tasks.map((t: taskpool.Task): Promise<Object> => {
          return taskpool.execute(t)
        }))

        expect(results.length).assertEqual(10)
        expect(String(results[0])).assertEqual(String(0))
        expect(String(results[5])).assertEqual(String(5))
        expect(String(results[9])).assertEqual(String(9))
        done()
      } catch (error) {
        console.error(`UseConcurrentTest2500 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseConcurrentTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2600
     * @tc.desc   Verify worker thread invokes imported .ts concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let work: worker.ThreadWorker | null = null
      try {
        work = new worker.ThreadWorker('../workers/WorkerConcurrentTs.ets')
        const replyTimeout = createWorkerTimeout(10000, 'worker response timeout')
        let workerResult = ''
        try {
          workerResult = await Promise.race<string>([
            new Promise<string>((resolve: (v: string) => void, reject: (reason?: Object) => void) => {
              work!.onmessage = (e: MessageEvents): void => {
                resolve(String(e.data))
              }
              work!.onerror = (e: ErrorEvent): void => {
                reject(new Error('worker error occurred'))
              }
              work!.postMessage(32)
            }),
            replyTimeout.timeoutPromise
          ])
        } finally {
          replyTimeout.cancel()
        }

        expect(workerResult).assertEqual('42')
      } catch (e) {
        expect().assertFail()
        done()
      } finally {
        if (work) {
          try { work.terminate() } catch (e) { /* best-effort cleanup */ }
        }
      }
      done()
    })

    /**
     * @tc.name   UseConcurrentTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2700
     * @tc.desc   Verify TaskPool processed result is sent to worker thread for further processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let work: worker.ThreadWorker | null = null
      try {
        let task = new taskpool.Task(jsConcurrentDouble, 21.0)
        let taskResult = await taskpool.execute(task)
        expect(String(taskResult)).assertEqual(String(42))

        work = new worker.ThreadWorker('../workers/WorkerConcurrentTs.ets')
        const replyTimeout = createWorkerTimeout(10000, 'worker response timeout')
        let workerResult = ''
        try {
          workerResult = await Promise.race<string>([
            new Promise<string>((resolve: (v: string) => void, reject: (reason?: Object) => void) => {
              work!.onmessage = (e: MessageEvents): void => {
                resolve(String(e.data))
              }
              work!.onerror = (e: ErrorEvent): void => {
                reject(new Error('worker error occurred'))
              }
              work!.postMessage(Number(taskResult))
            }),
            replyTimeout.timeoutPromise
          ])
        } finally {
          replyTimeout.cancel()
        }

        expect(workerResult).assertEqual('52')
      } catch (e) {
        expect().assertFail()
        done()
      } finally {
        if (work) {
          try { work.terminate() } catch (e) { /* best-effort cleanup */ }
        }
      }
      done()
    })

    /**
     * @tc.name   UseConcurrentTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2800
     * @tc.desc   Verify async function with use concurrent keyword executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(ucAsyncConcurrent)
      try {
        let result = await taskpool.execute(task)
      } catch (cleanupError) {
        console.warn(`async await failed: ${cleanupError}`)
      }

      expect(String(result)).assertEqual(String(42))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2900
     * @tc.desc   Verify same-file combination where a use sendable function calls a use concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(ucComboSendableMainDispatch, 20)
      try {
        let result = await taskpool.execute(task)
      } catch (error) {
        console.error(`async await failed: ${error}`)
        expect().assertFail()
      }

      expect(String(result)).assertEqual(String(41))
      done()
    })

    /**
     * @tc.name   UseConcurrentTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_3000
     * @tc.desc   Verify cross-file combination where a use concurrent function in a .ts file calls a use sendable function from another .ts file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(tsComboConcurrent, 7)
        let result = await taskpool.execute(task)

        expect(String(result)).assertEqual(String(120))
        done()
      } catch (error) {
        console.error(`UseConcurrentTest3000 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })
  })
}
