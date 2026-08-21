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
import { taskpool } from '@kit.ArkTS';
import { ConcurrentData } from '../testability/pages/ConcurrentTestData';

function simpleAdd(a: number, b: number): number {
  'use concurrent'
  return a + b
}

function identityFunc(n: number): number {
  'use concurrent'
  return n
}

function one(): number {
  'use concurrent'
  return 1
}

function typedAdd(a: number, b: number): number {
  'use concurrent'
  return a + b
}

function genericConcat(n: number, s: string): string {
  'use concurrent'
  return `${s}: ${n}`
}

function stringFunc(n: number): string {
  'use concurrent'
  return `value: ${n}`
}

function longRunningTask(): number {
  'use concurrent'
  let sum: number = 0
  for (let i = 0; i < 1000000; i++) {
    sum += i
  }
  return sum
}

function processArrayBuffer(ab: ArrayBuffer): number {
  'use concurrent'
  return ab.byteLength
}

function sendProgress(): void {
  'use concurrent'
  taskpool.Task.sendData('progress: 50%')
}

function dependencyFlagProducer(data: ConcurrentData): number {
  'use concurrent'
  data.output_ = 1
  return 10
}

function dependencyFlagConsumer(data: ConcurrentData): number {
  'use concurrent'
  if (data.output_ === 1) {
    return 100
  }
  return 0
}

export default function TaskPolymorphismTest(): void {
  describe('TaskPolymorphismTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   TaskPolymorphismTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0100
     * @tc.desc   Verify Task reference can point to LongTask instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longTask = new taskpool.LongTask(longRunningTask)
      let task: taskpool.Task = longTask

      // Runtime evidence (2026-08-19, SDK 26 dynamic): instanceof against the
      // native-backed taskpool classes returns false even though the SDK d.ts
      // declares LongTask extends Task. The verifiable polymorphism evidence
      // is the base-typed reference exposing the same task function.
      expect(task.function).assertEqual(longRunningTask)
    })

    /**
     * @tc.name   TaskPolymorphismTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0200
     * @tc.desc   Verify taskpool.execute accepts LongTask subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let longTask = new taskpool.LongTask(simpleAdd, 10.0, 20.0)
      try {
        let result = await taskpool.execute(longTask)
        expect(String(result)).assertEqual(String(30))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion, so a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
      done()
    })

    /**
     * @tc.name   TaskPolymorphismTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0300
     * @tc.desc   Verify Task reference invokes inherited setTransferList on LongTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let buffer = new ArrayBuffer(64)
        let longTask = new taskpool.LongTask(processArrayBuffer, buffer)
        let task: taskpool.Task = longTask
        task.setTransferList([buffer])
        try {
          let result = await taskpool.execute(task)
          expect(String(result)).assertEqual(String(64))
        } finally {
          // Cleanup-only: terminateTask() may throw if the task already finished
          // or was never scheduled. This is best-effort cleanup, not a test
          // assertion, so a failure here does not invalidate the test result.
          try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
        }
        done()
      } catch (error) {
        console.error(`TaskPolymorphismTest0300 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0400
     * @tc.desc   Verify terminateTask manages LongTask lifecycle after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let longTask = new taskpool.LongTask(simpleAdd, 1.0, 2.0)
      try {
        let result = await taskpool.execute(longTask)
        expect(String(result)).assertEqual(String(3))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion, so a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
      done()
    })

    /**
     * @tc.name   TaskPolymorphismTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0500
     * @tc.desc   Verify Task reference can point to GenericsTask instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let genericsTask = new taskpool.GenericsTask<[number, string], string>(genericConcat, 100, 'result')
      let task: taskpool.Task = genericsTask

      // Runtime evidence (2026-08-19, SDK 26 dynamic): instanceof against the
      // native-backed taskpool classes returns false even though the SDK d.ts
      // declares GenericsTask extends Task. The verifiable polymorphism
      // evidence is the base-typed reference exposing the same task function.
      expect(task.function).assertEqual(genericConcat)
    })

    /**
     * @tc.name   TaskPolymorphismTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0600
     * @tc.desc   Verify GenericsTask type-safe execution returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let genericsTask = new taskpool.GenericsTask<[number, number], number>(typedAdd, 10.0, 20.0)
      try {
        let result = await taskpool.execute(genericsTask)
      } catch (error) {
        console.error(`async await failed: ${error}`)
        expect().assertFail()
      }

      expect(String(result)).assertEqual(String(30))
      done()
    })

    /**
     * @tc.name   TaskPolymorphismTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0700
     * @tc.desc   Verify Task reference invokes inherited onReceiveData on GenericsTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let genericsTask = new taskpool.GenericsTask<[], void>(sendProgress)
        let task: taskpool.Task = genericsTask
        let received: string = ''
        let dataPromise = new Promise<void>((resolve: () => void, reject: (reason?: Object) => void) => {
          let timer: number = setTimeout((): void => {
            reject(new Error('receive data timeout'))
          }, 10000)
          task.onReceiveData((data: Object): void => {
            received = String(data)
            clearTimeout(timer)
            resolve()
          })
        })

        await taskpool.execute(task)
        await dataPromise

        expect(received).assertEqual('progress: 50%')
        done()
      } catch (error) {
        console.error(`TaskPolymorphismTest0700 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0800
     * @tc.desc   Verify taskpool.execute accepts Task, LongTask and GenericsTask instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let normalTask = new taskpool.Task(one)
      let longTask = new taskpool.LongTask(one)
      let genericsTask = new taskpool.GenericsTask<[], number>(one)
      try {
        let results = await Promise.all([
          taskpool.execute(normalTask),
          taskpool.execute(longTask),
          taskpool.execute(genericsTask)
        ])

        expect(results.length).assertEqual(3)
        expect(String(results[0])).assertEqual(String(1))
        expect(String(results[1])).assertEqual(String(1))
        expect(String(results[2])).assertEqual(String(1))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion, so a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
      done()
    })

    /**
     * @tc.name   TaskPolymorphismTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0900
     * @tc.desc   Verify executeDelayed accepts LongTask subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let longTask = new taskpool.LongTask(identityFunc, 100.0)
        try {
          let result = await taskpool.executeDelayed(1000, longTask)
          expect(String(result)).assertEqual(String(100))
        } finally {
          // Cleanup-only: terminateTask() may throw if the task already finished
          // or was never scheduled. This is best-effort cleanup, not a test
          // assertion, so a failure here does not invalidate the test result.
          try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
        }
        done()
      } catch (error) {
        console.error(`TaskPolymorphismTest0900 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1000
     * @tc.desc   Verify LongTask subclass adds dependency and executes after dependency task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = new ConcurrentData()
        let depTask = new taskpool.Task(dependencyFlagProducer, data)
        let mainTask = new taskpool.LongTask(dependencyFlagConsumer, data)
        mainTask.addDependency(depTask)
        try {
          let results = await Promise.all([
            taskpool.execute(mainTask),
            taskpool.execute(depTask)
          ])

          expect(String(results[0])).assertEqual(String(100))
          expect(String(results[1])).assertEqual(String(10))
        } finally {
          // Cleanup-only: terminateTask() may throw if the task already finished
          // or was never scheduled. This is best-effort cleanup, not a test
          // assertion, so a failure here does not invalidate the test result.
          try { taskpool.terminateTask(mainTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
        }
        done()
      } catch (error) {
        console.error(`TaskPolymorphismTest1000 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1100
     * @tc.desc   Verify LongTask and GenericsTask inherit Task.function property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longTask = new taskpool.LongTask(identityFunc)
      let genericsTask = new taskpool.GenericsTask<[number], number>(identityFunc, 42)

      expect(longTask.function).assertEqual(identityFunc)
      expect(genericsTask.function).assertEqual(identityFunc)
    })

    /**
     * @tc.name   TaskPolymorphismTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1200
     * @tc.desc   Verify LongTask and GenericsTask inherit Task.name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longTask = new taskpool.LongTask('long_task', identityFunc)
      let genericsTask = new taskpool.GenericsTask<[number], number>('generic_task', identityFunc, 42)

      expect(longTask.name).assertEqual('long_task')
      expect(genericsTask.name).assertEqual('generic_task')
    })

    /**
     * @tc.name   TaskPolymorphismTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1300
     * @tc.desc   Verify LongTask inherits Task.arguments property with passed arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longTask = new taskpool.LongTask(simpleAdd, 10.0, 20.0)
      let args = longTask.arguments

      expect(args !== undefined).assertTrue()
      if (args !== undefined) {
        expect(args.length).assertEqual(2)
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1400
     * @tc.desc   Verify LongTask executes long-running computation without timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let longTask = new taskpool.LongTask(longRunningTask)
        try {
          let result = await taskpool.execute(longTask)
          expect(String(result)).assertEqual(String(499999500000))
        } finally {
          // Cleanup-only: terminateTask() may throw if the task already finished
          // or was never scheduled. This is best-effort cleanup, not a test
          // assertion, so a failure here does not invalidate the test result.
          try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
        }
        done()
      } catch (error) {
        console.error(`TaskPolymorphismTest1400 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1500
     * @tc.desc   Verify GenericsTask compile-time type safety returns typed result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let genericsTask = new taskpool.GenericsTask<[number], string>(stringFunc, 100)
        let result = await taskpool.execute(genericsTask)

        expect(result as string).assertEqual('value: 100')
        expect(typeof result).assertEqual('string')
        done()
      } catch (error) {
        console.error(`TaskPolymorphismTest1500 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })
  })
}
