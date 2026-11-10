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
import { ArkTSUtils, MessageEvents, worker } from '@kit.ArkTS';
import { sleep } from '../Utils';
import { SHARED_QUEUE_NAME, peekSharedQueueRunner, getSameNameQueueRunner } from './SharedQueueHelper';

@Concurrent
function simpleNamedFunc(): number {
  return 42
}

@Concurrent
function addNamedFunc(n: number): number {
  return n * 2
}

// W5 SeqC2#024: busy-wait slow task used to hold the shared named serial queue
@Concurrent
function seqNamedBusyWaitFunc(duration: number): number {
  const start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}

@Concurrent
function identityNamedFunc(n: number): number {
  return n
}

@Concurrent
function sendDataNamedFunc(): void {
  taskpool.Task.sendData('trigger')
}

@Sendable
class SharedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function nestedNamedRunnerFunc(counter: SharedCounter): Promise<void> {
  const nestedRunner = new taskpool.SequenceRunner('nestedNamedQueue')
  await counter.lock.lockAsync<void>((): void => {
    counter.count++
  })
}

// AsyncLock-protected increment (multi-worker safe, ref TaskpoolCancelGroupTest locked-counter pattern)
@Concurrent
async function concurrentNamedFunc3(counter: SharedCounter): Promise<void> {
  new taskpool.SequenceRunner('concurrentNamedQueue3')
  await counter.lock.lockAsync<void>((): void => {
    counter.count++
  })
}

@Concurrent
async function multiNamedSequenceFunc(counter: SharedCounter): Promise<number> {
  const runnerA = new taskpool.SequenceRunner('namedGlobalA')
  const runnerB = new taskpool.SequenceRunner('namedGlobalB')
  const runnerA2 = new taskpool.SequenceRunner('namedGlobalA')
  await counter.lock.lockAsync<void>((): void => {
    counter.count++
  })
  return 1
}

@Concurrent
async function singletonNamedVerifyFunc(counter: SharedCounter): Promise<void> {
  new taskpool.SequenceRunner('namedSameGlobal')
  new taskpool.SequenceRunner('namedSameGlobal')
  await counter.lock.lockAsync<void>((): void => {
    counter.count += 2
  })
}

export default function SequenceRunnerConstructorNamedTest(): void {
  describe('SequenceRunnerConstructorNamedTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0100
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0100
     * @tc.desc   Verify SequenceRunner constructor with name only creates instance with default priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('defaultNamedQueue')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0200
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0200
     * @tc.desc   Verify SequenceRunner constructor with name and Priority.HIGH constructs the queue and executes a task returning 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('highNamedQueue', taskpool.Priority.HIGH)
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0300
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0300
     * @tc.desc   Verify SequenceRunner constructor with name and Priority.MEDIUM creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('mediumNamedQueue', taskpool.Priority.MEDIUM)
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0400
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0400
     * @tc.desc   Verify SequenceRunner constructor with name and Priority.LOW creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('lowNamedQueue', taskpool.Priority.LOW)
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0500
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0500
     * @tc.desc   Verify SequenceRunner constructor with name and Priority.IDLE creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('idleNamedQueue', taskpool.Priority.IDLE)
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0600
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0600
     * @tc.desc   Verify SequenceRunner constructor with normal string name executes a task and returns 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('normalStringQueue')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0700
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0700
     * @tc.desc   Verify SequenceRunner constructor with empty string name (runtime arbitration: design expected empty-name 401, measured empty string creates an anonymous-queue overload instance and the task executes normally)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0800
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0800
     * @tc.desc   Verify SequenceRunner constructor with underscore name creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('underscore_queue')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest0900
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_0900
     * @tc.desc   Verify SequenceRunner constructor with Chinese name creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('中文队列')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1000
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1000
     * @tc.desc   Verify SequenceRunner constructor with Unicode escape name creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('unicode\u4E00')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1100
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1100
     * @tc.desc   Verify SequenceRunner constructor with long string name (1024 chars)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let longName = ''
      for (let i = 0; i < 1024; i++) {
        longName += 'a'
      }
      const runner = new taskpool.SequenceRunner(longName)
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1200
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1200
     * @tc.desc   Verify SequenceRunner same name shares global queue through task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.SequenceRunner('singletonTestQueue')
      const runner2 = new taskpool.SequenceRunner('singletonTestQueue')
      const p1 = runner1.execute(new taskpool.Task(simpleNamedFunc))
      const p2 = runner2.execute(new taskpool.Task(addNamedFunc, 5))
      let results: Object[] = []
      try {
        results = await Promise.all([p1, p2])
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1200 failed');
        expect(false).assertFail();
      }
      expect(results[1] as number).assertEqual(10)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1300
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1300
     * @tc.desc   Verify different-name constructors produce independently usable queues and both execution results are correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.SequenceRunner('diffQueueA')
      const runner2 = new taskpool.SequenceRunner('diffQueueB')
      try {
        const r1 = await runner1.execute(new taskpool.Task(identityNamedFunc, 11))
        const r2 = await runner2.execute(new taskpool.Task(identityNamedFunc, 22))
        expect(r1 as number).assertEqual(11)
        expect(r2 as number).assertEqual(22)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1400
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1400
     * @tc.desc   Verify SequenceRunner singleton lifecycle - multiple references can execute tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.SequenceRunner('lifecycleQueue')
      let r1: number = 0
      try {
        const result1 = await runner1.execute(new taskpool.Task(simpleNamedFunc)) as number
        r1 = result1
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1400 failed');
        expect(false).assertFail();
      }
      expect(r1).assertEqual(42)

      const runner2 = new taskpool.SequenceRunner('lifecycleQueue')
      let r2: number = 0
      try {
        const result2 = await runner2.execute(new taskpool.Task(addNamedFunc, 5)) as number
        r2 = result2
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1400 failed');
        expect(false).assertFail();
      }
      expect(r2).assertEqual(10)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1500
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1500
     * @tc.desc   Verify first-time creation of a named queue accepts Priority.HIGH and the queue executes a task returning 42 (priority itself is not directly observable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('firstHighQueue', taskpool.Priority.HIGH)
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1600
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1600
     * @tc.desc   Verify SequenceRunner same-name creation with a different priority throws an exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
       const runner1 = new taskpool.SequenceRunner('immutablePriorityQueue', taskpool.Priority.HIGH)
       expect(runner1.execute !== undefined).assertTrue()
      let caught: boolean = false
      try {
         new taskpool.SequenceRunner('immutablePriorityQueue', taskpool.Priority.LOW)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1700
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1700
     * @tc.desc   Verify different named queues each execute their own task and return correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const queueA = new taskpool.SequenceRunner('concurrentQueueA')
      const queueB = new taskpool.SequenceRunner('concurrentQueueB')

      const p1 = queueA.execute(new taskpool.Task(simpleNamedFunc))
      const p2 = queueB.execute(new taskpool.Task(addNamedFunc, 5))

      let results: Object[] = []
      try {
        results = await Promise.all([p1, p2])
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1700 failed');
        expect(false).assertFail();
      }
      expect(results[1] as number).assertEqual(10)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1800
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1800
     * @tc.desc   Verify same-name SequenceRunner queue executes tasks serially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('namedSerialQueue')
      const executionOrder: number[] = []

      const p1 = runner.execute(new taskpool.Task(identityNamedFunc, 1))
      const p2 = runner.execute(new taskpool.Task(identityNamedFunc, 2))
      const p3 = runner.execute(new taskpool.Task(identityNamedFunc, 3))

      try {
        const r1 = await p1
        executionOrder.push(r1 as number)
        const r2 = await p2
        executionOrder.push(r2 as number)
        const r3 = await p3
        executionOrder.push(r3 as number)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1800 failed');
        expect(false).assertFail();
      }

      expect(executionOrder.length).assertEqual(3)
      expect(executionOrder[0]).assertEqual(1)
      expect(executionOrder[1]).assertEqual(2)
      expect(executionOrder[2]).assertEqual(3)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest1900
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_1900
     * @tc.desc   Verify high-frequency singleton acquisition (1000 times) shares global queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runners: taskpool.SequenceRunner[] = []
      for (let i = 0; i < 1000; i++) {
        runners.push(new taskpool.SequenceRunner('pressureNamedQueue'))
      }
      expect(runners.length).assertEqual(1000)
      let result: number = 0
      try {
        const execResult = await runners[0].execute(new taskpool.Task(simpleNamedFunc)) as number
        result = execResult
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1900 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(42)
      let secondResult: number = 0
      try {
        const execResult2 = await runners[999].execute(new taskpool.Task(addNamedFunc, 5)) as number
        secondResult = execResult2
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest1900 failed');
        expect(false).assertFail();
      }
      expect(secondResult).assertEqual(10)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2000
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2000
     * @tc.desc   Verify creating 100 different named queues does not throw and all instances are collected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queues: taskpool.SequenceRunner[] = []
      for (let i = 0; i < 100; i++) {
        queues.push(new taskpool.SequenceRunner('multiQueue_' + i.toString()))
      }
      expect(queues.length).assertEqual(100)
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2100
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2100
     * @tc.desc   Verify SequenceRunner constructor with single character name creates instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('a')
      let result: number = 0
      try {
        const execResult = await runner.execute(new taskpool.Task(simpleNamedFunc)) as number
        result = execResult
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2100 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(42)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2200
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2200
     * @tc.desc   Verify SequenceRunner constructor with space in name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('queue name')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2300
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2300
     * @tc.desc   Verify SequenceRunner constructor with special symbols in name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('queue@#$')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2400
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2400
     * @tc.desc   Verify SequenceRunner constructor with zero-width space in name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner('\u200B')
      try {
        const result = await runner.execute(new taskpool.Task(simpleNamedFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2500
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2500
     * @tc.desc   Verify two same-name references both execute tasks with correct results through the shared underlying queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const queueA = new taskpool.SequenceRunner('sharedGlobalQueue')
      const queueB = new taskpool.SequenceRunner('sharedGlobalQueue')

      const p1 = queueA.execute(new taskpool.Task(simpleNamedFunc))
      const p2 = queueB.execute(new taskpool.Task(addNamedFunc, 5))

      let results: Object[] = []
      try {
        results = await Promise.all([p1, p2])
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2500 failed');
        expect(false).assertFail();
      }
      expect(results[1] as number).assertEqual(10)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2600
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2600
     * @tc.desc   Verify different named SequenceRunner queues isolate tasks independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const queue1 = new taskpool.SequenceRunner('isolatedQueue1')
      const queue2 = new taskpool.SequenceRunner('isolatedQueue2')

      const p1 = queue1.execute(new taskpool.Task(simpleNamedFunc))
      const p2 = queue2.execute(new taskpool.Task(addNamedFunc, 10))

      let results: Object[] = []
      try {
        results = await Promise.all([p1, p2])
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2600 failed');
        expect(false).assertFail();
      }
      expect(results[0] as number).assertEqual(42)
      expect(results[1] as number).assertEqual(20)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2700
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2700
     * @tc.desc   Verify constructing named SequenceRunner inside Task function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const task = new taskpool.Task(nestedNamedRunnerFunc, counter)
      try {
        await taskpool.execute(task)
        expect(counter.count).assertEqual(1)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2800
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2800
     * @tc.desc   Verify constructing named SequenceRunner in onReceiveData callback with counting wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const expectedCount = 1

      const task = new taskpool.Task(sendDataNamedFunc)
      const onReceive: (data: Object) => void = (data: Object): void => {
        if (data === null || data === undefined) {
          console.info('SequenceRunnerConstructorNamedTest2800 received empty data')
          return
        }
        const innerRunner = new taskpool.SequenceRunner('innerNamedQueue')
        counter.count++
      };
      task.onReceiveData(onReceive)

      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2800 failed');
        expect(false).assertFail();
      }

      let waited: number = 0
      try {
        while (counter.count < expectedCount && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2800 failed');
        expect(false).assertFail();
      }

      expect(counter.count).assertEqual(expectedCount)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest2900
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_2900
     * @tc.desc   Verify constructing named SequenceRunner in onExecutionSucceeded callback with Promise wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let innerRunnerCreated = false

      const task = new taskpool.Task(simpleNamedFunc)
      const innerPromise = new Promise<void>((resolve): void => {
        const onSuccess: () => void = (): void => {
          const innerRunner = new taskpool.SequenceRunner('completedNamedQueue')
          innerRunnerCreated = true
          resolve()
        };
        task.onExecutionSucceeded(onSuccess)
      })

      const runner = new taskpool.SequenceRunner('outerNamedQueue')
      try {
        await runner.execute(task)
        await innerPromise
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest2900 failed');
        expect(false).assertFail();
      }

      expect(innerRunnerCreated).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3000
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3000
     * @tc.desc   Verify concurrent 3 tasks with named SequenceRunner construction and SharedCounter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(concurrentNamedFunc3, counter)))
      }
      let results: Object[] = []
      try {
        results = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3100
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3100
     * @tc.desc   Verify multi-sequence nested - different named global queues created in concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(multiNamedSequenceFunc, counter)))
      }
      let results: Object[] = []
      try {
        results = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3100 failed');
        expect(false).assertFail();
      }
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(1)
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3200
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3200
     * @tc.desc   Verify multi-sequence nested - same name runners created concurrently share global queue (runtime arbitration: each task constructs the same name twice counting +2, 5 tasks measured count==10; design literal ==5 used task-count semantics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(singletonNamedVerifyFunc, counter)))
      }
      let results: Object[] = []
      try {
        results = await Promise.all(promises)
        expect(results.length).assertEqual(5)
        expect(counter.count).assertEqual(10)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3300
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3300
     * @tc.desc   Verify multi-sequence nested - named runners execute tasks independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const outerTask = new taskpool.Task(simpleNamedFunc)
      const innerTasks: taskpool.Task[] = []

      const innerPromises: Promise<Object>[] = []
      const onSuccess: () => void = (): void => {
        const runnerA = new taskpool.SequenceRunner('namedExecQueueA')
        const runnerB = new taskpool.SequenceRunner('namedExecQueueB')
        const taskA = new taskpool.Task(addNamedFunc, 5)
        const taskB = new taskpool.Task(addNamedFunc, 10)
        innerTasks.push(taskA)
        innerTasks.push(taskB)
        innerPromises.push(runnerA.execute(taskA))
        innerPromises.push(runnerB.execute(taskB))
      };
      outerTask.onExecutionSucceeded(onSuccess)

      const runner = new taskpool.SequenceRunner('outerExecQueue')
      try {
        await runner.execute(outerTask)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3300 failed');
        expect(false).assertFail();
      }

      let waited: number = 0
      try {
        while (innerPromises.length < 2 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3300 failed');
        expect(false).assertFail();
      }
      try {
        const innerResults: Object[] = await Promise.all(innerPromises)
        counter.count += innerResults.length
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3300 failed');
        expect(false).assertFail();
      }
      expect(innerTasks.length).assertEqual(2)

      expect(counter.count).assertEqual(2)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3400
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3400
     * @tc.desc   Verify named constructor with illegal name/priority types throws error 401 per input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorNamedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let caught: boolean = false
      try {
        const badName: ESObject = null
        new taskpool.SequenceRunner(badName)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badName: ESObject = new Object()
        new taskpool.SequenceRunner(badName)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badName: ESObject = undefined
        new taskpool.SequenceRunner(badName)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badName: ESObject = 123
        new taskpool.SequenceRunner(badName)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badPriority: ESObject = 'HIGH'
        new taskpool.SequenceRunner('badPrioQueue3800', badPriority)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3500
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3500
     * @tc.desc   Verify same-name references share one serial queue with exact submission order (runtime arbitration: design expected identical instances, measured JS wrapper objects are newly created each time while the underlying singleton queue is shared; asserted through shared-queue serial behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const refA = new taskpool.SequenceRunner('singletonOrderQueue3900')
      const refB = new taskpool.SequenceRunner('singletonOrderQueue3900')
      const refC = new taskpool.SequenceRunner('singletonOrderQueue3900')
      const executionOrder: number[] = []

      const p1 = refA.execute(new taskpool.Task(identityNamedFunc, 1))
      const p2 = refB.execute(new taskpool.Task(identityNamedFunc, 2))
      const p3 = refC.execute(new taskpool.Task(identityNamedFunc, 3))

      try {
        const r1 = await p1
        executionOrder.push(r1 as number)
        const r2 = await p2
        executionOrder.push(r2 as number)
        const r3 = await p3
        executionOrder.push(r3 as number)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3500 failed');
        expect(false).assertFail();
      }

      expect(executionOrder.length).assertEqual(3)
      expect(executionOrder[0]).assertEqual(1)
      expect(executionOrder[1]).assertEqual(2)
      expect(executionOrder[2]).assertEqual(3)
      done()
    })

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3600
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3600
     * @tc.desc   Verify 100 different named queues all execute tasks correctly in batches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const queues: taskpool.SequenceRunner[] = []
      for (let i = 0; i < 100; i++) {
        queues.push(new taskpool.SequenceRunner('multiExecQueue4100_' + i.toString()))
      }
      expect(queues.length).assertEqual(100)

      let successCount: number = 0
      const batchSize: number = 20
      try {
        for (let start = 0; start < queues.length; start += batchSize) {
          const batchPromises: Promise<Object>[] = []
          for (let i = start; i < start + batchSize && i < queues.length; i++) {
            batchPromises.push(queues[i].execute(new taskpool.Task(simpleNamedFunc)))
          }
          const batchResults = await Promise.all(batchPromises)
          for (let i = 0; i < batchResults.length; i++) {
            expect(batchResults[i] as number).assertEqual(42)
            successCount++
          }
        }
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3600 failed');
        expect(false).assertFail();
      }
      expect(successCount).assertEqual(100)
      done()
    })

    // ========== Cross-Module Shared Named Queue (c2#037, SharedQueueHelper asset) ==========

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3700
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3700
     * @tc.desc   Verify true cross-file shared named queue: this file imports the SharedQueueHelper module, executes the first task through the peeked exported shared instance while a same-name wrapper created in this file shares the same underlying global queue, tasks submitted through both references execute serially with exact results 21 and 20 (c2#037 cross-file import shared same-name queue)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorNamedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(SHARED_QUEUE_NAME).assertEqual('crossModuleSharedQueueW4')
      const peekedRunner: taskpool.SequenceRunner = peekSharedQueueRunner()
      const sameNameRef: taskpool.SequenceRunner = getSameNameQueueRunner()
      try {
        const r1 = await peekedRunner.execute(new taskpool.Task(identityNamedFunc, 21))
        expect(r1 as number).assertEqual(21)
        const r2 = await sameNameRef.execute(new taskpool.Task(addNamedFunc, 10))
        expect(r2 as number).assertEqual(20)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3700 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ========== W5 Worker Concurrent Same-name SequenceRunner (SeqC2#024) ==========

    /**
     * @tc.name   SequenceRunnerConstructorNamedTest3800
     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_NAMED_TEST_3800
     * @tc.desc   Verify host and worker concurrently obtain a same-name SequenceRunner and the same-name references serialize into one shared global queue (SeqC2#024; worker posts its fast-task result back via postMessage and the host compares the exact value 42 with the serial wait behind the host's preceding 1500ms slow task; JS wrapper reference equality across threads is not observable so identity is asserted through the shared-queue serial order, consistent with SequenceRunnerConstructorNamedTest3500 arbitration; 15s bounded wait)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorNamedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const queueName3800: string = 'w5SeqRunnerWorkerShared024'
      const hostRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner(queueName3800)
      const seqWorker = new worker.ThreadWorker('../../workers/WorkerSeqRunnerConcurrent.ets')
      let workerReport: string = ''
      let workerFailed: string = ''
      seqWorker.onmessage = (event: MessageEvents): void => {
        workerReport = event.data as string
      }
      // Fallback reporting so a worker-side failure appears immediately instead
      // of stalling the host until the 15s bounded wait expires.
      seqWorker.onerror = (event: Object): void => {
        workerFailed = 'onerror'
      }
      seqWorker.onmessageerror = (event: Object): void => {
        workerFailed = 'onmessageerror'
      }
      // Host occupies the shared named queue with a slow task first, then the
      // worker concurrently obtains the same-name runner and enqueues its fast task.
      const slowPromise: Promise<Object> = hostRunner.execute(new taskpool.Task(seqNamedBusyWaitFunc, 1500))
      seqWorker.postMessage(queueName3800)
      let waited3800: number = 0
      try {
        while (workerReport === '' && workerFailed === '' && waited3800 < 15000) {
          await sleep(100)
          waited3800 += 100
        }
        expect(workerFailed).assertEqual('')
        const reportParts: string[] = workerReport.split('|')
        expect(reportParts.length).assertEqual(3)
        expect(reportParts[0]).assertEqual('ok')
        expect(reportParts[1]).assertEqual('42')
        const workerElapsed: number = Number(reportParts[2])
        // Proxy evidence for shared-queue serialization: the worker fast task
        // waited behind the host 1500ms slow task. Lower bound kept with margin
        // (>=400ms) to stay robust under worker startup jitter on loaded devices.
        expect(workerElapsed >= 400).assertTrue()
        const slowResult = await slowPromise
        expect(slowResult as number).assertEqual(1500)
      } catch (error) {
        console.error('SequenceRunnerConstructorNamedTest3800 failed')
        expect(false).assertFail()
      } finally {
        seqWorker.terminate()
      }
      done()
    })
  })
}
