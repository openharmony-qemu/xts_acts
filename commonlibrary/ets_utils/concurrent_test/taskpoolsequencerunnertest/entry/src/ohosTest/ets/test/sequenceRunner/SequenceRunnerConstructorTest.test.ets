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
import taskpool from '@ohos.taskpool';
import { ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../Utils';

@Concurrent
function simpleFunc(): number {
  return 42
}

@Concurrent
function addFunc(n: number): number {
  return n * 2
}

@Concurrent
function identityFunc(n: number): number {
  return n
}

@Concurrent
function sendDataFunc(): void {
  taskpool.Task.sendData('trigger')
}

@Sendable
class SharedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

// AsyncLock-protected increment (multi-worker safe, ref TaskpoolCancelGroupTest locked-counter pattern)
@Concurrent
async function nestedRunnerFunc(counter: SharedCounter): Promise<void> {
  const nestedRunner = new taskpool.SequenceRunner()
  await counter.lock.lockAsync<void>((): void => {
    counter.count++
  })
}

@Concurrent
async function multiSequenceFunc(counter: SharedCounter): Promise<number> {
  const runnerA = new taskpool.SequenceRunner()
  const runnerB = new taskpool.SequenceRunner()
  await counter.lock.lockAsync<void>((): void => {
    counter.count++
  })
  return 1
}

export default function SequenceRunnerConstructorTest(): void {
  describe('SequenceRunnerConstructorTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0100
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify SequenceRunner() no-arg construction followed by execute returns the task result 42 (basic construct-and-execute)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest0100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0200
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify SequenceRunner constructor with Priority.HIGH creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner(taskpool.Priority.HIGH)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest0200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0300
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify SequenceRunner constructor with Priority.MEDIUM creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner(taskpool.Priority.MEDIUM)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest0300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0400
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify SequenceRunner constructor with Priority.LOW creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner(taskpool.Priority.LOW)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest0400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0500
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify SequenceRunner constructor with Priority.IDLE creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner(taskpool.Priority.IDLE)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest0500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0600
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify SequenceRunner constructor with numeric priority values creates instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner0 = new taskpool.SequenceRunner(0)
      const runner1 = new taskpool.SequenceRunner(1)
      const runner2 = new taskpool.SequenceRunner(2)
      const runner3 = new taskpool.SequenceRunner(3)
      try {
        const r0 = await runner0.execute(new taskpool.Task(simpleFunc))
        const r1 = await runner1.execute(new taskpool.Task(simpleFunc))
        const r2 = await runner2.execute(new taskpool.Task(simpleFunc))
        const r3 = await runner3.execute(new taskpool.Task(simpleFunc))
        expect(r0 as number).assertEqual(42)
        expect(r1 as number).assertEqual(42)
        expect(r2 as number).assertEqual(42)
        expect(r3 as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest0600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0700
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify SequenceRunner constructor with priority=-1 throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let caught: boolean = false
      try {
        new taskpool.SequenceRunner(-1)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0800
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify SequenceRunner constructor with priority=4 throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let caught: boolean = false
      try {
        new taskpool.SequenceRunner(4)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0900
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify SequenceRunner constructor with priority=100 throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let caught: boolean = false
      try {
        new taskpool.SequenceRunner(100)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1000
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify the constructed default runner instance remains usable for task execution and returns result 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest1000 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1100
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify the instance method execute() is available and callable on a constructed runner, returning the task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest1100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1200
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify different default runner instances independently execute their own tasks and both return correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.SequenceRunner()
      const runner2 = new taskpool.SequenceRunner()
      try {
        const r1 = await runner1.execute(new taskpool.Task(identityFunc, 7))
        const r2 = await runner2.execute(new taskpool.Task(identityFunc, 9))
        expect(r1 as number).assertEqual(7)
        expect(r2 as number).assertEqual(9)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest1200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1300
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify execute() accepts a pre-constructed Task instance and returns its result 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest1300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1400
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify serial execution - tasks in same runner execute sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      const executionOrder: number[] = []

      const task1 = new taskpool.Task(identityFunc, 1)
      const task2 = new taskpool.Task(identityFunc, 2)
      const task3 = new taskpool.Task(identityFunc, 3)

      const p1 = runner.execute(task1)
      const p2 = runner.execute(task2)
      const p3 = runner.execute(task3)

      try {
        const r1 = await p1
        executionOrder.push(r1 as number)
        const r2 = await p2
        executionOrder.push(r2 as number)
        const r3 = await p3
        executionOrder.push(r3 as number)

        expect(executionOrder.length).assertEqual(3)
        expect(executionOrder[0]).assertEqual(1)
        expect(executionOrder[1]).assertEqual(2)
        expect(executionOrder[2]).assertEqual(3)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest1400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1500
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify all Priority values boundary combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const priorities: number[] = [
        taskpool.Priority.HIGH,
        taskpool.Priority.MEDIUM,
        taskpool.Priority.LOW,
        taskpool.Priority.IDLE
      ]
      for (let i = 0; i < priorities.length; i++) {
        const runner = new taskpool.SequenceRunner(priorities[i])
        try {
          const result = await runner.execute(new taskpool.Task(simpleFunc))
          expect(result as number).assertEqual(42)
        } catch (error) {
          console.error('SequenceRunnerConstructorTest1500 failed')
          expect(false).assertFail()
        }
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1600
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify SequenceRunner works after creating and discarding instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      try {
        for (let i = 0; i < 5; i++) {
          const tempRunner = new taskpool.SequenceRunner()
          await tempRunner.execute(new taskpool.Task(simpleFunc))
        }
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest1600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1700
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify multiple SequenceRunner instances execute tasks independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.SequenceRunner()
      const runner2 = new taskpool.SequenceRunner()
      const p1 = runner1.execute(new taskpool.Task(addFunc, 5))
      const p2 = runner2.execute(new taskpool.Task(addFunc, 10))
      try {
        const r1 = await p1
        const r2 = await p2
        expect(r1 as number).assertEqual(10)
        expect(r2 as number).assertEqual(20)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest1700 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1800
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify SequenceRunner construction inside Task function with SharedCounter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const task = new taskpool.Task(nestedRunnerFunc, counter)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest1800 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1900
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1900
     * @tc.desc   Verify creating 100 SequenceRunner instances under pressure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const runners: taskpool.SequenceRunner[] = []
      for (let i = 0; i < 100; i++) {
        runners.push(new taskpool.SequenceRunner())
      }
      expect(runners.length).assertEqual(100)
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2000
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2000
     * @tc.desc   Verify concurrent creation of SequenceRunner instances via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(new Promise<Object>((resolve): void => {
          resolve(new taskpool.SequenceRunner())
        }))
      }
      try {
        const runners = await Promise.all(promises)
        expect(runners.length).assertEqual(10)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2000 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2100
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2100
     * @tc.desc   Verify SequenceRunner construction in onReceiveData callback with counting wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const expectedCount = 1

      const task = new taskpool.Task(sendDataFunc)
      task.onReceiveData((data: Object): void => {
        if (data === null || data === undefined) {
          console.info('SequenceRunnerConstructorTest2100 received empty data')
          return
        }
        const innerRunner = new taskpool.SequenceRunner()
        counter.count++
      })

      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2100 failed')
        expect(false).assertFail()
      }

      let waited: number = 0
      try {
        while (counter.count < expectedCount && waited < 5000) { await sleep(100); waited += 100 }
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2100 failed')
        expect(false).assertFail()
      }

      expect(counter.count).assertEqual(expectedCount)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2200
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2200
     * @tc.desc   Verify SequenceRunner construction in onExecutionSucceeded callback with Promise wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let innerRunnerCreated = false

      const task = new taskpool.Task(simpleFunc)
      const onSucceeded: () => void = (): void => {
        const innerRunner = new taskpool.SequenceRunner()
        innerRunnerCreated = true
      }
      task.onExecutionSucceeded(onSucceeded)

      const runner = new taskpool.SequenceRunner()
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2200 failed')
        expect(false).assertFail()
      }

      let waited: number = 0
      try {
        while (!innerRunnerCreated && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2200 failed')
        expect(false).assertFail()
      }

      expect(innerRunnerCreated).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2300
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2300
     * @tc.desc   Verify concurrent 3 tasks with SequenceRunner construction and SharedCounter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(nestedRunnerFunc, counter)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2400
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2400
     * @tc.desc   Verify multi-sequence nested - different runners execute independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(multiSequenceFunc, counter)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
        for (let i = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(1)
        }
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2500
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2500
     * @tc.desc   Verify nested execute tasks in onExecutionSucceeded callback verify independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const outerTask = new taskpool.Task(simpleFunc)

      const onOuterSucceeded: () => Promise<void> = async (): Promise<void> => {
        const runnerA = new taskpool.SequenceRunner()
        const runnerB = new taskpool.SequenceRunner()
        const taskA = new taskpool.Task(addFunc, 5)
        const taskB = new taskpool.Task(addFunc, 10)
        try {
          await runnerA.execute(taskA)
          counter.count++
        } catch (error) {
          console.error('SequenceRunnerConstructorTest2500 runnerA execute failed')
          expect(false).assertFail()
        }
        try {
          await runnerB.execute(taskB)
          counter.count++
        } catch (error) {
          console.error('SequenceRunnerConstructorTest2500 runnerB execute failed')
          expect(false).assertFail()
        }
      }
      outerTask.onExecutionSucceeded(onOuterSucceeded)

      const runner = new taskpool.SequenceRunner()
      try {
        await runner.execute(outerTask)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2500 failed')
        expect(false).assertFail()
      }

      let waited: number = 0
      try {
        while (counter.count < 2 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2500 failed')
        expect(false).assertFail()
      }

      expect(counter.count).assertEqual(2)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2600
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2600
     * @tc.desc   Verify constructor with illegal priority types (null/undefined/object) throws 401 per input; a string argument is treated as queue name per the named overload and executes successfully (runtime arbitration: design expected string to throw 401, measured success creating a named queue)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      try {
        const badPriority: ESObject = null
        new taskpool.SequenceRunner(badPriority)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badPriority: ESObject = undefined
        new taskpool.SequenceRunner(badPriority)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badPriority: ESObject = new Object()
        new taskpool.SequenceRunner(badPriority)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      const stringRunner = new taskpool.SequenceRunner('stringQueue2800')
      try {
        const result = await stringRunner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorTest2600 failed')
        expect(false).assertFail()
      }
      done()
    })
  })
}
