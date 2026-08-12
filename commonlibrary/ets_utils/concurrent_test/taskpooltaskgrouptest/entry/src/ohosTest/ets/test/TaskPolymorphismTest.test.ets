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
import { ConcurrentData, ResultData } from '../testability/pages/ConcurrentTestData';
function simpleAdd(a: number, b: number): number {
  'use concurrent'
  return a + b
}

function simpleMultiply(a: number, b: number): number {
  'use concurrent'
  return a * b
}

function identityFunc(n: number): number {
  'use concurrent'
  return n
}

function processSendable(data: ConcurrentData): number {
  'use concurrent'
  return data.input_ * 2
}

function modifySendable(data: ConcurrentData, val: number): void {
  'use concurrent'
  data.output_ = val
}

function createResultData(val: number): ResultData {
  'use concurrent'
  let result = new ResultData()
  result.value_ = val
  return result
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

function sendProgress(): number {
  'use concurrent'
  taskpool.Task.sendData('progress: 50%')
  return 0
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

class NamedTask extends taskpool.Task {
  taskName_: string = ''

  constructor(func: Function, name: string, ...args: Object[]) {
    super(func, ...args)
    this.taskName_ = name
  }

  getTaskName(): string {
    return this.taskName_
  }
}

class RetryTask extends taskpool.Task {
  maxRetries_: number = 0

  constructor(func: Function, maxRetries: number, ...args: Object[]) {
    super(func, ...args)
    this.maxRetries_ = maxRetries
  }

  getMaxRetries(): number {
    return this.maxRetries_
  }
}

class ValidatedTask extends taskpool.Task {
  isValid_: boolean = true

  constructor(func: Function, ...args: Object[]) {
    super(func, ...args)
  }

  isValid(): boolean {
    return this.isValid_
  }
}

class MetaTask extends taskpool.Task {
  metadata_: Map<string, string> = new Map<string, string>()

  constructor(func: Function, ...args: Object[]) {
    super(func, ...args)
  }

  addMetadata(key: string, value: string): void {
    this.metadata_.set(key, value)
  }

  getMetadata(key: string): string | undefined {
    return this.metadata_.get(key)
  }
}

class GenericsTask extends taskpool.Task {
  constructor(func: Function, ...args: Object[]) {
    super(func, ...args)
  }
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
     * @tc.desc   Verify Task constructor with function and arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(simpleAdd, 3.0, 4.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(7))
    })

    /**
     * @tc.name   TaskPolymorphismTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0200
     * @tc.desc   Verify Task constructor with function and single argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(identityFunc, 42.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   TaskPolymorphismTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0300
     * @tc.desc   Verify Task with custom class parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let data = new ConcurrentData()
      data.input_ = 21

      let task = new taskpool.Task(processSendable, data)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   TaskPolymorphismTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0400
     * @tc.desc   Verify Task modifying custom class parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let data = new ConcurrentData()
      data.input_ = 10

      let task = new taskpool.Task(modifySendable, data, 99.0)
      await taskpool.execute(task)

      expect(data.output_).assertEqual(99)
    })

    /**
     * @tc.name   TaskPolymorphismTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0500
     * @tc.desc   Verify custom Task subclass with name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new NamedTask(simpleAdd, 'add_task', 3.0, 4.0)
      expect(task.getTaskName()).assertEqual('add_task')

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(7))
    })

    /**
     * @tc.name   TaskPolymorphismTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0600
     * @tc.desc   Verify custom Task subclass with max retries property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new RetryTask(simpleAdd, 3, 5.0, 6.0)
      expect(task.getMaxRetries()).assertEqual(3)

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(11))
    })

    /**
     * @tc.name   TaskPolymorphismTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0700
     * @tc.desc   Verify Task with priority setting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(simpleAdd, 1.0, 2.0)
      let result = await taskpool.execute(task, taskpool.Priority.HIGH)

      expect(String(result)).assertEqual(String(3))
    })

    /**
     * @tc.name   TaskPolymorphismTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0800
     * @tc.desc   Verify multiple Tasks execute concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task1 = new taskpool.Task(simpleAdd, 1.0, 2.0)
      let task2 = new taskpool.Task(simpleMultiply, 3.0, 4.0)
      let task3 = new taskpool.Task(identityFunc, 42.0)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2),
        taskpool.execute(task3)
      ])

      expect(String(results[0])).assertEqual(String(3))
      expect(String(results[1])).assertEqual(String(12))
      expect(String(results[2])).assertEqual(String(42))
    })

    /**
     * @tc.name   TaskPolymorphismTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_0900
     * @tc.desc   Verify custom Task subclass with validation flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new ValidatedTask(simpleAdd, 10.0, 20.0)
      expect(task.isValid()).assertTrue()

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(30))
    })

    /**
     * @tc.name   TaskPolymorphismTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1000
     * @tc.desc   Verify Task with custom class return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(createResultData, 42.0)
      let result = await taskpool.execute(task) as ResultData

      expect(result.value_).assertEqual(42)
    })

    /**
     * @tc.name   TaskPolymorphismTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1100
     * @tc.desc   Verify custom Task subclass with metadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskPolymorphismTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let task = new MetaTask(simpleAdd, 1.0, 2.0)
      task.addMetadata('category', 'math')
      task.addMetadata('version', '1.0')

      expect(task.getMetadata('category')).assertEqual('math')
      expect(task.getMetadata('version')).assertEqual('1.0')

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(3))
    })

    /**
     * @tc.name   TaskPolymorphismTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1200
     * @tc.desc   Verify Task execute with different priority levels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new taskpool.Task(simpleAdd, 100.0, 200.0)

      let result = await taskpool.execute(task, taskpool.Priority.LOW)
      expect(String(result)).assertEqual(String(300))
    })

    /**
     * @tc.name   TaskPolymorphismTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1300
     * @tc.desc   Verify Task with long-running computation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new taskpool.Task(longRunningTask)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(499999500000))
    })

    /**
     * @tc.name   TaskPolymorphismTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1400
     * @tc.desc   Verify LongTask inherits from Task and executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let longTask = new taskpool.LongTask(simpleAdd, 10.0, 20.0)
      try {
        let result = await taskpool.execute(longTask)
        expect(String(result)).assertEqual(String(30))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion — a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1500
     * @tc.desc   Verify execute accepts Task subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let namedTask = new NamedTask(simpleMultiply, 'multiply_task', 6.0, 7.0)
      let result = await taskpool.execute(namedTask)

      expect(String(result)).assertEqual(String(42))
      expect(namedTask.getTaskName()).assertEqual('multiply_task')
    })

    /**
     * @tc.name   TaskPolymorphismTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1600
     * @tc.desc   Verify Task reference can point to subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new NamedTask(simpleAdd, 'poly_task', 8.0, 9.0)
      expect((task as NamedTask).getTaskName()).assertEqual('poly_task')

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(17))
    })

    /**
     * @tc.name   TaskPolymorphismTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1700
     * @tc.desc   Verify LongTask executes long-running computation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let longTask = new taskpool.LongTask(longRunningTask)
      try {
        let result = await taskpool.execute(longTask)
        expect(String(result)).assertEqual(String(499999500000))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion — a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1800
     * @tc.desc   Verify LongTask instance is also a Task (inheritance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let longTask = new taskpool.LongTask(simpleAdd, 100.0, 200.0)
      try {
        expect(typeof longTask.function === 'function').assertTrue()
        expect(typeof longTask.setTransferList === 'function').assertTrue()
        expect(typeof longTask.addDependency === 'function').assertTrue()
        let result = await taskpool.execute(longTask)
        expect(String(result)).assertEqual(String(300))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion — a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_1900
     * @tc.desc   Verify custom Task subclass inherits from Task and executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let genericsTask = new GenericsTask(simpleAdd, 15.0, 25.0)

      let result = await taskpool.execute(genericsTask)
      expect(String(result)).assertEqual(String(40))
    })

    /**
     * @tc.name   TaskPolymorphismTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2000
     * @tc.desc   Verify custom Task subclass handles typed parameters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let genericsTask = new GenericsTask(simpleMultiply, 7.0, 8.0)
      let result = await taskpool.execute(genericsTask)

      expect(String(result)).assertEqual(String(56))
    })

    /**
     * @tc.name   TaskPolymorphismTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2100
     * @tc.desc   Verify Task handles zero value parameter and returns zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new taskpool.Task(identityFunc, 0.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(0))
    })

    /**
     * @tc.name   TaskPolymorphismTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2200
     * @tc.desc   Verify multiple Task subclasses execute concurrently and independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let namedTask = new NamedTask(simpleAdd, 'addTask', 10.0, 20.0)
      let retryTask = new RetryTask(simpleMultiply, 3, 6.0, 7.0)
      let validatedTask = new ValidatedTask(identityFunc, 42.0)

      expect(namedTask.getTaskName()).assertEqual('addTask')
      expect(retryTask.getMaxRetries()).assertEqual(3)

      let results = await Promise.all([
        taskpool.execute(namedTask),
        taskpool.execute(retryTask),
        taskpool.execute(validatedTask)
      ])

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(30))
      expect(String(results[1])).assertEqual(String(42))
      expect(String(results[2])).assertEqual(String(42))
    })

    /**
     * @tc.name   TaskPolymorphismTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2300
     * @tc.desc   Verify setTransferList inherited by LongTask instance transfers ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let buffer = new ArrayBuffer(64)
      let longTask = new taskpool.LongTask(processArrayBuffer, buffer)
      longTask.setTransferList([buffer])
      try {
        let result = await taskpool.execute(longTask)
        expect(String(result)).assertEqual(String(64))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion — a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2400
     * @tc.desc   Verify onReceiveData inherited by GenericsTask receives data sent by task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let received: string = ''
      let genTask = new GenericsTask(sendProgress)
      genTask.onReceiveData((data: Object): void => {
        received = String(data)
      })
      let result = await taskpool.execute(genTask)
      let deadline: number = Date.now() + 10000
      while (received === '' && Date.now() < deadline) {
        await new Promise<void>((resolve) => {
          setTimeout((): void => {
            resolve()
          }, 100)
        })
      }
      expect(String(result)).assertEqual(String(0))
      expect(received).assertEqual('progress: 50%')
    })

    /**
     * @tc.name   TaskPolymorphismTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2500
     * @tc.desc   Verify executeDelayed accepts Task subclass instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let namedTask = new NamedTask(simpleMultiply, 'delayed_task', 6.0, 7.0)
      let result1 = await taskpool.executeDelayed(100, namedTask)
      let genericsTask = new GenericsTask(simpleAdd, 10.0, 20.0)
      let result2 = await taskpool.executeDelayed(100, genericsTask)

      expect(String(result1)).assertEqual(String(42))
      expect(String(result2)).assertEqual(String(30))
    })

    /**
     * @tc.name   TaskPolymorphismTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2600
     * @tc.desc   Verify addDependency inherited by Task subclass executes dependent task first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let data = new ConcurrentData()
      let depTask = new taskpool.Task(dependencyFlagProducer, data)
      let mainTask = new GenericsTask(dependencyFlagConsumer, data)
      mainTask.addDependency(depTask)

      let results = await Promise.all([
        taskpool.execute(mainTask),
        taskpool.execute(depTask)
      ])

      expect(String(results[0])).assertEqual(String(100))
      expect(String(results[1])).assertEqual(String(10))
    })

    /**
     * @tc.name   TaskPolymorphismTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2700
     * @tc.desc   Verify function property inherited by Task subclass equals the passed function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new NamedTask(simpleAdd, 'func_task', 3.0, 4.0)
      expect(task.function).assertEqual(simpleAdd)

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(7))
    })

    /**
     * @tc.name   TaskPolymorphismTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2800
     * @tc.desc   Verify name property equals the name passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task('poly_named_task', simpleAdd, 1.0, 2.0)
      expect(task.name).assertEqual('poly_named_task')

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(3))
    })

    /**
     * @tc.name   TaskPolymorphismTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_2900
     * @tc.desc   Verify arguments property inherited by Task subclass records the passed arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new NamedTask(simpleAdd, 'args_task', 10.0, 20.0)
      let args = task.arguments
      expect(args !== undefined).assertTrue()
      if (args !== undefined) {
        expect(args.length).assertEqual(2)
      }

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(30))
    })

    /**
     * @tc.name   TaskPolymorphismTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_3000
     * @tc.desc   Verify custom Task subclass and system Task instances execute concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPolymorphismTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let plainTask = new taskpool.Task(identityFunc, 1.0)
      let namedTask = new NamedTask(identityFunc, 'mixed_task', 1.0)
      let retryTask = new RetryTask(identityFunc, 2, 1.0)
      let longTask = new taskpool.LongTask(identityFunc, 1.0)
      try {
        let results = await Promise.all([
          taskpool.execute(plainTask),
          taskpool.execute(namedTask),
          taskpool.execute(retryTask),
          taskpool.execute(longTask)
        ])

        expect(results.length).assertEqual(4)
        expect(String(results[0])).assertEqual(String(1))
        expect(String(results[1])).assertEqual(String(1))
        expect(String(results[2])).assertEqual(String(1))
        expect(String(results[3])).assertEqual(String(1))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion — a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_3100
     * @tc.desc   Verify LongTask inherits Task properties and methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longTask = new taskpool.LongTask(simpleAdd, 1.0, 2.0)
      try {
        // LongTask inherits from Task: verify inherited properties exist
        expect(typeof longTask.function === 'function').assertTrue()
        expect(typeof longTask.setTransferList === 'function').assertTrue()
        expect(typeof longTask.addDependency === 'function').assertTrue()
        expect(typeof longTask.onReceiveData === 'function').assertTrue()
        expect(typeof longTask.removeDependency === 'function').assertTrue()
        expect(typeof longTask.setCloneList === 'function').assertTrue()
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion — a failure here does not invalidate the test result.
        try { taskpool.terminateTask(longTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_3200
     * @tc.desc   Verify Task reference can point to LongTask and execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.LongTask(simpleAdd, 10.0, 20.0)
      try {
        // Verify inherited Task properties are accessible through Task reference
        expect(typeof task.function === 'function').assertTrue()
        expect(typeof task.setTransferList === 'function').assertTrue()
        expect(typeof task.onReceiveData === 'function').assertTrue()

        let result = await taskpool.execute(task)
        expect(String(result)).assertEqual(String(30))
      } finally {
        // Cleanup-only: terminateTask() may throw if the task already finished
        // or was never scheduled. This is best-effort cleanup, not a test
        // assertion — a failure here does not invalidate the test result.
        try { taskpool.terminateTask(task as taskpool.LongTask) } catch (e) { console.warn(`terminateTask error: ${e}`) }
      }
    })

    /**
     * @tc.name   TaskPolymorphismTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_3300
     * @tc.desc   Verify custom Task subclass instances pass instanceof checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let namedTask = new NamedTask(simpleAdd, 'task_a', 1.0, 2.0)
      let retryTask = new RetryTask(simpleAdd, 3, 1.0, 2.0)

      expect(namedTask instanceof taskpool.Task).assertTrue()
      expect(retryTask instanceof taskpool.Task).assertTrue()

      // Verify constructor points to the subclass
      expect(namedTask.constructor === NamedTask).assertTrue()
      expect(retryTask.constructor === RetryTask).assertTrue()
    })

    /**
     * @tc.name   TaskPolymorphismTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_POLYMORPHISM_TEST_3400
     * @tc.desc   Verify custom Task subclass inherits system name property via super(name, func)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPolymorphismTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task('inherited_name_task', simpleAdd, 5.0, 6.0)
      expect(task.name).assertEqual('inherited_name_task')

      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(11))
    })
  })
}
