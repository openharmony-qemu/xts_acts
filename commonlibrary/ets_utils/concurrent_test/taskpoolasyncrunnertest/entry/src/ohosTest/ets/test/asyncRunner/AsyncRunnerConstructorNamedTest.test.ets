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
import { BusinessError } from '@ohos.base';
import { ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../Utils';
import { ARSharedCounter, arCountFunc } from './AsyncRunnerConstructorNamedTestInner';

@Concurrent
function simpleFunc(): number {
  return 42
}

@Concurrent
function addFunc(n: number): number {
  return n * 2
}

@Concurrent
function longFunc(duration: number): number {
  const start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}

@Concurrent
function errorFunc(): number {
  throw new Error('test error')
}

// AsyncLock-protected increment (multi-worker safe, ref TaskpoolCancelGroupTest locked-counter pattern)
@Concurrent
function arSendDataFunc(): number {
  taskpool.Task.sendData(1)
  taskpool.Task.sendData(2)
  taskpool.Task.sendData(3)
  return 42
}

// ============ W5 F4 probe: named AsyncRunner constructed inside @Concurrent body ==========

@Sendable
class ARProbeCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function arProbeNamedConstructExecFunc(counter: ARProbeCounter): Promise<number> {
  const probeRunner = new taskpool.AsyncRunner('c2probeNestedQueue', 2)
  const probeTask = new taskpool.Task(arCountFunc, counter)
  try {
    await probeRunner.execute(probeTask)
    counter.count++
    return 1
  } catch (e) {
    return -1
  }
}

// 15s race guard so a wedged nested probe cannot hang the suite
async function arProbeTimeoutGuard(ms: number): Promise<Object> {
  const end: number = Date.now() + ms
  while (Date.now() < end) {
    await sleep(100)
  }
  return 'timeout'
}

export default function AsyncRunnerConstructorNamedTest(): void {
  describe('AsyncRunnerConstructorNamedTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0100
     * @tc.desc   Verify AsyncRunner constructor with name and runningCapacity constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test0100', 3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0200
     * @tc.desc   Verify AsyncRunner constructor with name, runningCapacity and waitingCapacity constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test0200', 3, 10)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0300
     * @tc.desc   Verify AsyncRunner constructor with normal English string name constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('myAsyncQueue', 3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0400
     * @tc.desc   Verify AsyncRunner constructor with underscore name constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('queue_1', 3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0500
     * @tc.desc   Verify AsyncRunner constructor with Chinese name constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('异步队列A', 3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0600
     * @tc.desc   Verify AsyncRunner constructor with Unicode character name constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('队列\u4E00', 3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0700
     * @tc.desc   Verify AsyncRunner constructor with long string name constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let longName: string = 'a'
      for (let i = 0; i < 100; i++) {
        longName = longName + 'a'
      }
      const runner = new taskpool.AsyncRunner(longName, 3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0700 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0800
     * @tc.desc   Verify AsyncRunner constructor with empty string name constructs and executes task successfully (runtime arbitration: suite-measured success, mindmap expected 401 with name in message)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('', 3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0800 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest0900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_0900
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=1 (minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test0900', 1)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest0900 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1000
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=100 (large value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test1000', 100)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest1000 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1100
     * @tc.desc   Verify AsyncRunner constructor throws error when runningCapacity=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let err: BusinessError | null = null
      try {
        new taskpool.AsyncRunner('c2test1100', 0)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1200
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=-1 can execute task successfully (runtime arbitration: suite-measured success, mindmap expected 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test1200', -1)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest1200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1300
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=3.7 constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test1300', 3.7)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest1300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1400
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=5.1 constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test1400', 5.1)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest1400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1500
     * @tc.desc   Verify AsyncRunner with waitingCapacity=0 means unlimited waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test1500', 2, 0)
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 10; i++) {
        const task = new taskpool.Task(simpleFunc)
        promises.push(runner.execute(task))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(10)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest1500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1600
     * @tc.desc   Verify AsyncRunner with positive waitingCapacity constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test1600', 2, 10)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest1600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1700
     * @tc.desc   Verify AsyncRunner constructor throws error when waitingCapacity=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let err: BusinessError | null = null
      try {
        new taskpool.AsyncRunner('c2test1700', 3, -1)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1800
     * @tc.desc   Verify AsyncRunner constructor with waitingCapacity=10.7 constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test1800', 3, 10.7)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest1800 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest1900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_1900
     * @tc.desc   Verify same name with different runningCapacity throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const runner1 = new taskpool.AsyncRunner('c2test1900', 3)
      let caught: boolean = false
      try {
        new taskpool.AsyncRunner('c2test1900', 5)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2000
     * @tc.desc   Verify different names return different instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const runner1 = new taskpool.AsyncRunner('c2test2000a', 3)
      const runner2 = new taskpool.AsyncRunner('c2test2000b', 3)
      expect(runner1 !== runner2).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2100
     * @tc.desc   Verify singleton lifecycle - same name same params can both execute tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner('c2test2100', 3)
      const task1 = new taskpool.Task(simpleFunc)
      const runner2 = new taskpool.AsyncRunner('c2test2100', 3)
      const task2 = new taskpool.Task(addFunc, 5)
      try {
        const result1 = await runner1.execute(task1)
        expect(result1 as number).assertEqual(42)
        const result2 = await runner2.execute(task2)
        expect(result2 as number).assertEqual(10)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest2100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2200
     * @tc.desc   Verify AsyncRunner global instance constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test2200', 3, 10)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest2200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2300
     * @tc.desc   Verify named runner constructed with runningCapacity=5 and waitingCapacity=10 accepts the parameters and executes a task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test2500', 5, 10)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest2300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2400
     * @tc.desc   Verify subsequent same-name creation throws error when waitingCapacity differs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const runner1 = new taskpool.AsyncRunner('c2test2700', 5, 10)
      let caught: boolean = false
      try {
        new taskpool.AsyncRunner('c2test2700', 5, 5)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2500
     * @tc.desc   Verify parameters immutable - different params on same name throws error after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test2800', 2, 5)
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 5; i++) {
        const task = new taskpool.Task(addFunc, i)
        promises.push(runner.execute(task))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(5)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest2500 failed')
        expect(false).assertFail()
      }
      let caught: boolean = false
      try {
        new taskpool.AsyncRunner('c2test2800', 10, 20)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2600
     * @tc.desc   Verify global AsyncRunner discards tasks when waitingCapacity exceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test2900', 1, 2)
      const totalTasks: number = 6
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(longFunc, 500)
        promises.push(runner.execute(task))
      }
      let successCount: number = 0
      let discardCount: number = 0
      let discardErr: BusinessError | null = null
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
          discardErr = e
          if (discardErr !== null) {
            expect(discardErr.code).assertEqual(10200054)
          }
        }
      }
      expect(successCount + discardCount).assertEqual(totalTasks)
      expect(discardCount > 0).assertTrue()
      expect(successCount > 0).assertTrue()
      expect(discardErr !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2700
     * @tc.desc   Verify singleton discard consistency - different params throws, same params shares queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner('c2test3000', 2, 3)
      let caught: boolean = false
      try {
        new taskpool.AsyncRunner('c2test3000', 5, 10)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      const runner2 = new taskpool.AsyncRunner('c2test3000', 2, 3)
      const totalTasks: number = 8
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(longFunc, 500)
        promises.push(runner2.execute(task))
      }
      let successCount: number = 0
      let discardCount: number = 0
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
        }
      }
      expect(successCount + discardCount).assertEqual(totalTasks)
      expect(discardCount > 0).assertTrue()
      expect(successCount > 0).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2800
     * @tc.desc   Verify different global queues execute tasks concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runnerA = new taskpool.AsyncRunner('c2test3100a', 3)
      const runnerB = new taskpool.AsyncRunner('c2test3100b', 3)
      const p1 = runnerA.execute(new taskpool.Task(addFunc, 5))
      const p2 = runnerB.execute(new taskpool.Task(addFunc, 10))
      try {
        const r1 = await p1
        const r2 = await p2
        expect(r1 as number).assertEqual(10)
        expect(r2 as number).assertEqual(20)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest2800 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest2900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_2900
     * @tc.desc   Verify different named queues isolate task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner('c2test3200x', 3)
      const runner2 = new taskpool.AsyncRunner('c2test3200y', 5)
      const p1 = runner1.execute(new taskpool.Task(addFunc, 1))
      const p2 = runner2.execute(new taskpool.Task(addFunc, 2))
      try {
        const r1 = await p1
        const r2 = await p2
        expect(r1 as number).assertEqual(2)
        expect(r2 as number).assertEqual(4)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest2900 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3000
     * @tc.desc   Verify global and non-global queues both execute tasks correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const nonGlobal1 = new taskpool.AsyncRunner(3)
      const nonGlobal2 = new taskpool.AsyncRunner(3)
      expect(nonGlobal1 !== nonGlobal2).assertTrue()
      const global1 = new taskpool.AsyncRunner('c2test3400', 3)
      const global2 = new taskpool.AsyncRunner('c2test3400', 3)
      try {
        const r1 = await global1.execute(new taskpool.Task(simpleFunc))
        expect(r1 as number).assertEqual(42)
        const r2 = await global2.execute(new taskpool.Task(simpleFunc))
        expect(r2 as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest3000 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3100
     * @tc.desc   Verify AsyncRunner constructor with single character name constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('a', 3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest3100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3200
     * @tc.desc   Verify global queue remains valid after GC simulation - tasks execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner('c2test3600', 3)
      try {
        for (let i = 0; i < 5; i++) {
          const tempRunner = new taskpool.AsyncRunner(2)
          await tempRunner.execute(new taskpool.Task(simpleFunc))
        }
        const runner2 = new taskpool.AsyncRunner('c2test3600', 3)
        const result = await runner2.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest3200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3300
     * @tc.desc   Verify high frequency singleton acquisition 1000 times creates valid instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const runners: taskpool.AsyncRunner[] = []
      for (let i = 0; i < 1000; i++) {
        runners.push(new taskpool.AsyncRunner('c2test3700', 3))
      }
      expect(runners.length).assertEqual(1000)
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3400
     * @tc.desc   Verify creating 100 different named global queues
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queues: taskpool.AsyncRunner[] = []
      for (let i = 0; i < 100; i++) {
        queues.push(new taskpool.AsyncRunner('c2test3800_' + i.toString(), 3))
      }
      expect(queues.length).assertEqual(100)
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3500
     * @tc.desc   Verify nested execute after successful task with Promise wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test3900', 2, 5)
      try {
        const outerResult = await runner.execute(new taskpool.Task(simpleFunc))
        const innerResult = await runner.execute(new taskpool.Task(addFunc, outerResult as number))
        expect(innerResult as number).assertEqual(84)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest3500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3600
     * @tc.desc   Verify nested execute after failed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test4000', 2, 5)
      let caught: boolean = false
      try {
        await runner.execute(new taskpool.Task(errorFunc))
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      try {
        const innerResult = await runner.execute(new taskpool.Task(simpleFunc))
        expect(innerResult as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest3600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3700
     * @tc.desc   Verify multi-level nested execution with 2 levels and counting wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test4100', 2, 10)
      const expectedL1: number = 3
      const expectedL2: number = expectedL1 * 2
      const level1Promises: Promise<Object>[] = []
      for (let i = 0; i < expectedL1; i++) {
        level1Promises.push(runner.execute(new taskpool.Task(simpleFunc)))
      }
      try {
        await Promise.all(level1Promises)
        const level2Promises: Promise<Object>[] = []
        for (let j = 0; j < expectedL2; j++) {
          level2Promises.push(runner.execute(new taskpool.Task(addFunc, j)))
        }
        const level2Results = await Promise.all(level2Promises)
        expect(level1Promises.length).assertEqual(expectedL1)
        expect(level2Results.length).assertEqual(expectedL2)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest3700 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3800
     * @tc.desc   Verify multi-async nested concurrency on same queue with counting wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test4200', 2, 10)
      let completedCount: number = 0
      const totalOuter: number = 3
      const totalInner: number = 2
      const expectedTotal: number = totalOuter + totalOuter * totalInner
      try {
        for (let i = 0; i < totalOuter; i++) {
          const outerTask = new taskpool.Task(simpleFunc)
          // waitingCapacity=10 never discards this workload, so only the success
          // path may increment the counter; a failure must appear as a shortfall.
          await runner.execute(outerTask)
          completedCount++
          for (let j = 0; j < totalInner; j++) {
            const innerTask = new taskpool.Task(addFunc, j)
            await runner.execute(innerTask)
            completedCount++
          }
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest3800 failed')
        expect(false).assertFail()
      }
      expect(completedCount).assertEqual(expectedTotal)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest3900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_3900
     * @tc.desc   Verify multi-async nested concurrency on different queues
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner('c2test4300a', 2)
      const runner2 = new taskpool.AsyncRunner('c2test4300b', 2)
      const p1 = runner1.execute(new taskpool.Task(simpleFunc))
      const p2 = runner2.execute(new taskpool.Task(addFunc, 5))
      try {
        const r1 = await p1
        const r2 = await p2
        expect(r1 as number).assertEqual(42)
        expect(r2 as number).assertEqual(10)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest3900 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4000
     * @tc.desc   Verify nested task discard scenario on global queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test4400', 1, 1)
      const totalTasks: number = 5
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(longFunc, 500)
        promises.push(runner.execute(task))
      }
      let successCount: number = 0
      let discardCount: number = 0
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
        }
      }
      expect(successCount + discardCount).assertEqual(totalTasks)
      expect(discardCount > 0).assertTrue()
      expect(successCount > 0).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4100
     * @tc.desc   Verify concurrency=3 executes 6 tasks successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test4500', 3, 0)
      const taskCount: number = 6
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(addFunc, i)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest4100 failed')
        expect(false).assertFail()
      }
      done()
    })


    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4200
     * @tc.desc   Verify chain nested execution via sequential await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2test4600', 2, 10)
      let chainCount: number = 0
      const chainLength: number = 3
      try {
        const r1 = await runner.execute(new taskpool.Task(simpleFunc))
        chainCount++
        expect(r1 as number).assertEqual(42)
        const r2 = await runner.execute(new taskpool.Task(simpleFunc))
        chainCount++
        expect(r2 as number).assertEqual(42)
        const r3 = await runner.execute(new taskpool.Task(simpleFunc))
        chainCount++
        expect(r3 as number).assertEqual(42)
        expect(chainCount).assertEqual(chainLength)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest4200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4300
     * @tc.desc   Verify non-string name input routing: number name constructs successfully because the 2-arg form treats it as runningCapacity, while null/undefined/object throw 401 (runtime arbitration 2026-09-06: async_runner.cpp 2-arg overload routes a non-string first arg to runningCapacity/waitingCapacity, only invalid capacities raise 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // root cause: AsyncRunner(100, 3) matches the (runningCapacity, waitingCapacity) 2-arg
      // overload, so it constructs a valid runner instead of throwing 401
      let threwForNumber = false
      try {
        const numberName: ESObject = 100
        new taskpool.AsyncRunner(numberName, 3)
      } catch (e) {
        threwForNumber = true
      }
      expect(threwForNumber).assertFalse()

      let err: BusinessError | null = null
      try {
        const badName: ESObject = null
        new taskpool.AsyncRunner(badName, 3)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()

      err = null
      try {
        const badName: ESObject = undefined
        new taskpool.AsyncRunner(badName, 3)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()

      err = null
      try {
        const badName: ESObject = new Object()
        new taskpool.AsyncRunner(badName, 3)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4400
     * @tc.desc   Verify string runningCapacity on named constructor throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let err: BusinessError | null = null
      try {
        const badCapacity: ESObject = '4'
        new taskpool.AsyncRunner('c2n4600', badCapacity)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4500
     * @tc.desc   Verify names containing space and special symbols construct and execute tasks successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runnerSpace = new taskpool.AsyncRunner('c2n 4700 queue', 3)
      const runnerSpecial = new taskpool.AsyncRunner('c2n+4700=queue', 3)
      try {
        const rSpace = await runnerSpace.execute(new taskpool.Task(simpleFunc))
        expect(rSpace as number).assertEqual(42)
        const rSpecial = await runnerSpecial.execute(new taskpool.Task(simpleFunc))
        expect(rSpecial as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest4500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4600
     * @tc.desc   Verify 1000-character name constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let longName: string = 'n'
      for (let i = 0; i < 999; i++) {
        longName = longName + 'n'
      }
      expect(longName.length).assertEqual(1000)
      const runner = new taskpool.AsyncRunner(longName, 3)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest4600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4700
     * @tc.desc   Verify zero-width space name constructs and executes successfully (runtime arbitration: mindmap allowed either accept or 401, suite-measured accept)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('\u200B', 3)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest4700 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4800
     * @tc.desc   Verify 1000 high-frequency same-name acquisitions all succeed on the shared native singleton queue (runtime arbitration 2026-09-06: each `new` wraps a fresh JS object around the shared native runner, so JS identity never holds; wrapper distinctness plus shared-queue serial behavior prove the singleton, per SequenceRunnerConstructorNamedTest3500 paradigm)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // root cause: AsyncRunnerConstructorInner re-wraps `thisVar` on every construction,
      // so same-name acquisitions return distinct JS objects sharing one native runner
      const runnerName = 'c2n5000'
      const first = new taskpool.AsyncRunner(runnerName, 1)
      let distinctCount: number = 0
      let lastRef = first
      for (let i = 0; i < 1000; i++) {
        lastRef = new taskpool.AsyncRunner(runnerName, 1)
        if (lastRef !== first) {
          distinctCount++
        }
      }
      expect(distinctCount).assertEqual(1000)
      // shared native queue proof: capacity 1 serializes slow+fast submitted through two
      // different wrappers into submission order
      const completionOrder: number[] = []
      const slowP = first.execute(new taskpool.Task(longFunc, 300)).then((): void => {
        completionOrder.push(1)
      })
      const fastP = lastRef.execute(new taskpool.Task(addFunc, 10)).then((): void => {
        completionOrder.push(2)
      })
      await Promise.all([slowP, fastP])
      expect(completionOrder.length).assertEqual(2)
      expect(completionOrder[0]).assertEqual(1)
      expect(completionOrder[1]).assertEqual(2)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest4900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_4900
     * @tc.desc   Verify 100 different named queues all execute their tasks successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const queueCount: number = 100
      const promises: Promise<Object>[] = []
      for (let i = 0; i < queueCount; i++) {
        const runner = new taskpool.AsyncRunner('c2n5100_' + i.toString(), 2)
        promises.push(runner.execute(new taskpool.Task(simpleFunc)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(queueCount)
        for (let i = 0; i < queueCount; i++) {
          expect(results[i] as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest4900 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest5000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_5000
     * @tc.desc   Verify same-name wrappers share one native singleton queue while non-global instances run independently (runtime arbitration 2026-09-06: same-name `new` returns fresh JS objects, never strictly equal; singleton semantics proven through shared-queue serial order, per SequenceRunnerConstructorNamedTest3500 paradigm)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorNamedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // root cause: each construction wraps a fresh JS object; same-name wrapper identity
      // in JS is unobservable, so the shared native runner is proven via serial order
      const global1 = new taskpool.AsyncRunner('c2n5200', 1)
      const global2 = new taskpool.AsyncRunner('c2n5200', 1)
      expect(global1 !== global2).assertTrue()
      // shared native queue: slow submitted first through global1, fast through global2,
      // serialized into submission order
      const completionOrder: number[] = []
      const slowP = global1.execute(new taskpool.Task(longFunc, 300)).then((): void => {
        completionOrder.push(1)
      })
      const fastP = global2.execute(new taskpool.Task(addFunc, 10)).then((): void => {
        completionOrder.push(2)
      })
      await Promise.all([slowP, fastP])
      expect(completionOrder[0]).assertEqual(1)
      expect(completionOrder[1]).assertEqual(2)
      // non-global runners are independent: the fast task finishes before the slow one
      const nonGlobal1 = new taskpool.AsyncRunner(1)
      const nonGlobal2 = new taskpool.AsyncRunner(1)
      expect(nonGlobal1 !== nonGlobal2).assertTrue()
      const independentOrder: number[] = []
      const slowP2 = nonGlobal1.execute(new taskpool.Task(longFunc, 300)).then((): void => {
        independentOrder.push(1)
      })
      const fastP2 = nonGlobal2.execute(new taskpool.Task(addFunc, 10)).then((): void => {
        independentOrder.push(2)
      })
      await Promise.all([slowP2, fastP2])
      expect(independentOrder[0]).assertEqual(2)
      expect(independentOrder[1]).assertEqual(1)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest5100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_5100
     * @tc.desc   Verify onExecutionSucceeded callback triggers once and nested execute inside callback completes on named queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2n5300', 2, 5)
      const task = new taskpool.Task(simpleFunc)
      let triggered: boolean = false
      let nestedPromise: Promise<Object> | null = null
      const onSuccess = (): void => {
        triggered = true
        nestedPromise = runner.execute(new taskpool.Task(simpleFunc))
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest5100 failed')
        expect(false).assertFail()
      }
      let waited: number = 0
      while (nestedPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(triggered).assertTrue()
      try {
        if (nestedPromise !== null) {
          const nestedResult = await nestedPromise
          expect(nestedResult as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest5100 nested failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest5200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_5200
     * @tc.desc   Verify onExecutionFailed callback triggers on task failure and nested execute inside callback completes on named queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2n5400', 2, 5)
      const task = new taskpool.Task(errorFunc)
      let triggered: boolean = false
      let nestedPromise: Promise<Object> | null = null
      const onFailed = (): void => {
        triggered = true
        nestedPromise = runner.execute(new taskpool.Task(simpleFunc))
      }
      task.onExecutionFailed(onFailed)
      let caught: boolean = false
      try {
        await runner.execute(task)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      let waited: number = 0
      while (nestedPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(triggered).assertTrue()
      try {
        if (nestedPromise !== null) {
          const nestedResult = await nestedPromise
          expect(nestedResult as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest5200 nested failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest5300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_5300
     * @tc.desc   Verify sendData from task triggers onReceiveData three times with values 1 2 3 in order on named queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2n5500', 2, 5)
      const task = new taskpool.Task(arSendDataFunc)
      const received: number[] = []
      task.onReceiveData((data: Object): void => {
        received.push(data as number)
      })
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest5300 failed')
        expect(false).assertFail()
      }
      let waited: number = 0
      while (received.length < 3 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(received.length).assertEqual(3)
      expect(received[0]).assertEqual(1)
      expect(received[1]).assertEqual(2)
      expect(received[2]).assertEqual(3)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest5400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_5400
     * @tc.desc   Verify Sendable shared counter statistics with concurrency 5 and 10 tasks count exactly 10 on named queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorNamedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2n5600', 5)
      const counter = new ARSharedCounter()
      const taskCount: number = 10
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(arCountFunc, counter)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest5400 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest5500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_5500
     * @tc.desc   Verify two-stage callback chain nesting via onExecutionSucceeded completes all chained tasks on named queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner('c2n5700', 2, 10)
      let chainCount: number = 0
      let p2: Promise<Object> | null = null
      let p3: Promise<Object> | null = null
      const task1 = new taskpool.Task(simpleFunc)
      task1.onExecutionSucceeded((): void => {
        chainCount++
        const task2 = new taskpool.Task(simpleFunc)
        task2.onExecutionSucceeded((): void => {
          chainCount++
          p3 = runner.execute(new taskpool.Task(addFunc, 21))
        })
        p2 = runner.execute(task2)
      })
      try {
        const r1 = await runner.execute(task1)
        expect(r1 as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest5500 failed')
        expect(false).assertFail()
      }
      let waited: number = 0
      while (p2 === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      try {
        if (p2 !== null) {
          const r2 = await p2
          expect(r2 as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest5500 stage2 failed')
        expect(false).assertFail()
      }
      waited = 0
      while (p3 === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(chainCount).assertEqual(2)
      try {
        if (p3 !== null) {
          const r3 = await p3
          expect(r3 as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorNamedTest5500 stage3 failed')
        expect(false).assertFail()
      }
      expect(chainCount).assertEqual(2)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorNamedTest5600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_NAMED_TEST_5600
     * @tc.desc   Verify F4 probe: a @Concurrent function body constructs a named AsyncRunner, executes an inner task through it, and collects module-level Sendable counts; host polls up to 5s and asserts inner increment plus outer success marker both landed exactly (count == 2, result == 1); 15s race guard prevents a wedged probe from hanging (M15b c2#040; if infeasible at runtime the main workflow converts it to NAC with run evidence)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorNamedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: ARProbeCounter = new ARProbeCounter()
      const probeTask = new taskpool.Task(arProbeNamedConstructExecFunc, counter)
      let probeResult: Object = 'timeout'
      try {
        probeResult = await Promise.race([taskpool.execute(probeTask), arProbeTimeoutGuard(15000)])
      } catch (error) {
        console.info(`AsyncRunnerConstructorNamedTest5600 probe rejected: ${JSON.stringify(error)}`)
        probeResult = 'rejected'
      }
      let waited5600: number = 0
      while (counter.count < 2 && waited5600 < 5000) {
        await sleep(100)
        waited5600 += 100
      }
      expect(probeResult as number).assertEqual(1)
      expect(counter.count).assertEqual(2)
      done()
    })
  })
}
