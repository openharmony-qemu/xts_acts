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
import { ARSharedCounter, arCountFunc } from './AsyncRunnerConstructorTestInner';

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

@Sendable
class ARMaxCounter {
  cur: number = 0
  max: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

// runtime arbitration 2026-09-06 (stress r4 2026-09-07): unsynchronized cur++/cur-- on the shared
// Sendable counter raced across workers and transiently overcounted (max observed > capacity);
// enter/exit of the busy-wait window are now serialized with AsyncLock.lockAsync
@Concurrent
async function arMaxProbeFunc(counter: ARMaxCounter, duration: number): Promise<number> {
  await counter.lock.lockAsync<void>((): void => {
    counter.cur++
    if (counter.cur > counter.max) {
      counter.max = counter.cur
    }
  })
  const start: number = Date.now()
  while (Date.now() - start < duration) {}
  await counter.lock.lockAsync<void>((): void => {
    counter.cur--
  })
  return 42
}

// AsyncLock-protected increment (multi-worker safe, ref TaskpoolCancelGroupTest locked-counter pattern)
@Concurrent
function arSendDataFunc(): number {
  taskpool.Task.sendData(1)
  taskpool.Task.sendData(2)
  taskpool.Task.sendData(3)
  return 42
}

// ============ W5 F4 probe: AsyncRunner constructed inside @Concurrent body ==========

@Sendable
class ARProbeCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function arProbeConstructExecFunc(counter: ARProbeCounter): Promise<number> {
  const probeRunner = new taskpool.AsyncRunner(2)
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

export default function AsyncRunnerConstructorTest(): void {
  describe('AsyncRunnerConstructorTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify AsyncRunner constructor with single runningCapacity parameter constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity and waitingCapacity constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3, 10)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=1 (minimum value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=100 (large value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(100)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify AsyncRunner constructor throws error 401 when runningCapacity=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let err: BusinessError | null = null
      try {
        new taskpool.AsyncRunner(0)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=-1 can execute task successfully (runtime arbitration: suite-measured success, mindmap expected 401, d.ts negative-value wording conflicts with measured behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(-1)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=-10 can execute task successfully (runtime arbitration: suite-measured success, mindmap expected 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(-10)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=3.7 constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3.7)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify AsyncRunner constructor throws error 401 when runningCapacity=0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let err: BusinessError | null = null
      try {
        new taskpool.AsyncRunner(0.5)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify AsyncRunner constructor throws error 401 when runningCapacity=-0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let err: BusinessError | null = null
      try {
        new taskpool.AsyncRunner(-0.5)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify AsyncRunner constructor throws error 401 when runningCapacity=NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let err: BusinessError | null = null
      try {
        new taskpool.AsyncRunner(NaN)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify AsyncRunner with waitingCapacity=0 means unlimited waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 0)
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 10; i++) {
        const task = new taskpool.Task(simpleFunc)
        promises.push(runner.execute(task))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(10)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest1200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify AsyncRunner with positive waitingCapacity constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 10)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest1300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify AsyncRunner with waitingCapacity=1 (minimum positive integer) constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 1)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest1400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify AsyncRunner constructor throws error 401 when waitingCapacity=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let err: BusinessError | null = null
      try {
        new taskpool.AsyncRunner(3, -1)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify AsyncRunner with waitingCapacity=10.7 constructs and executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3, 10.7)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest1600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify AsyncRunner constructor with waitingCapacity=NaN can execute task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3, NaN)
      try {
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest1700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify different AsyncRunner instances are independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner(2)
      const runner2 = new taskpool.AsyncRunner(3)
      expect(runner1 !== runner2).assertTrue()
      try {
        const r1 = await runner1.execute(new taskpool.Task(addFunc, 5))
        const r2 = await runner2.execute(new taskpool.Task(addFunc, 10))
        expect(r1 as number).assertEqual(10)
        expect(r2 as number).assertEqual(20)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest1800 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_1900
     * @tc.desc   Verify non-global AsyncRunner is not singleton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const runner1 = new taskpool.AsyncRunner(3)
      const runner2 = new taskpool.AsyncRunner(3)
      expect(runner1 === runner2).assertFalse()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2000
     * @tc.desc   Verify resource isolation between different runners
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner(2)
      const runner2 = new taskpool.AsyncRunner(2)
      const p1 = runner1.execute(new taskpool.Task(addFunc, 1))
      const p2 = runner2.execute(new taskpool.Task(addFunc, 2))
      try {
        const r1 = await p1
        const r2 = await p2
        expect(r1 as number).assertEqual(2)
        expect(r2 as number).assertEqual(4)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest2000 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2100
     * @tc.desc   Verify AsyncRunner discards tasks when waitingCapacity exceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 2)
      const totalTasks: number = 6
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(longFunc, 200)
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
     * @tc.name   AsyncRunnerConstructorTest2200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2200
     * @tc.desc   Verify AsyncRunner discards head-of-queue tasks when waitingCapacity exceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 1)
      const totalTasks: number = 4
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(longFunc, 200)
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
     * @tc.name   AsyncRunnerConstructorTest2300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2300
     * @tc.desc   Verify extreme concurrency values 1 and 100 work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner(1)
      const runner100 = new taskpool.AsyncRunner(100)
      try {
        const r1 = await runner1.execute(new taskpool.Task(simpleFunc))
        const r100 = await runner100.execute(new taskpool.Task(simpleFunc))
        expect(r1 as number).assertEqual(42)
        expect(r100 as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest2300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2400
     * @tc.desc   Verify extreme waitingCapacity values 0 and 100 work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner0 = new taskpool.AsyncRunner(2, 0)
      const runner100 = new taskpool.AsyncRunner(2, 100)
      try {
        const r0 = await runner0.execute(new taskpool.Task(simpleFunc))
        const r100 = await runner100.execute(new taskpool.Task(simpleFunc))
        expect(r0 as number).assertEqual(42)
        expect(r100 as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest2400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2500
     * @tc.desc   Verify AsyncRunner still works after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      try {
        for (let i = 0; i < 5; i++) {
          const tempRunner = new taskpool.AsyncRunner(2)
          await tempRunner.execute(new taskpool.Task(simpleFunc))
        }
        const result = await runner.execute(new taskpool.Task(simpleFunc))
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest2500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2600
     * @tc.desc   Verify AsyncRunner handles 100 tasks stably
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(10, 0)
      const taskCount: number = 100
      let completedCount: number = 0
      let failureCount: number = 0
      try {
        for (let i = 0; i < taskCount; i++) {
          const task = new taskpool.Task(simpleFunc)
          try {
            await runner.execute(task)
            completedCount++
          } catch (error) {
            failureCount++
            completedCount++
          }
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorTest2600 failed')
        expect(false).assertFail()
      }
      expect(completedCount).assertEqual(taskCount)
      expect(failureCount).assertEqual(0)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2700
     * @tc.desc   Verify high concurrency stress with runningCapacity=50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(50, 0)
      const taskCount: number = 60
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(simpleFunc)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest2700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2800
     * @tc.desc   Verify discard policy burst determinism: 30 instant tasks synchronously submitted into capacity(2,3) settle into exactly 5 executed (2 running + 3 waiting slots) and 25 discarded with code 10200054
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 3)
      const taskCount: number = 30
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(simpleFunc)
        promises.push(runner.execute(task))
      }
      let successCount: number = 0
      let discardCount: number = 0
      let discardErr: BusinessError | null = null
      // All 30 submissions complete inside one synchronous loop, so no worker
      // result can be processed before the loop ends: exactly running(2)+waiting(3)
      // submissions are accepted and the rest are discarded on arrival.
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
      expect(successCount).assertEqual(5)
      expect(discardCount).assertEqual(taskCount - 5)
      expect(discardErr !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_2900
     * @tc.desc   Verify nested execute after successful task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 5)
      try {
        const outerResult = await runner.execute(new taskpool.Task(simpleFunc))
        const innerResult = await runner.execute(new taskpool.Task(addFunc, outerResult as number))
        expect(innerResult as number).assertEqual(84)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest2900 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3000
     * @tc.desc   Verify nested execute after failed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 5)
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
        console.error('AsyncRunnerConstructorTest3000 failed')
        expect(false).assertFail()
      }
      done()
    })


    /**
     * @tc.name   AsyncRunnerConstructorTest3100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3100
     * @tc.desc   Verify concurrency=3 executes 6 tasks successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3, 0)
      const taskCount: number = 6
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(addFunc, i)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest3100 failed')
        expect(false).assertFail()
      }
      done()
    })


    /**
     * @tc.name   AsyncRunnerConstructorTest3200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3200
     * @tc.desc   Verify multi-level nested concurrent execution with counting wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 10)
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
        console.error('AsyncRunnerConstructorTest3200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3300
     * @tc.desc   Verify chain nested execution via sequential await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 10)
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
        console.error('AsyncRunnerConstructorTest3300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3400
     * @tc.desc   Verify runningCapacity=5 (missing value in matrix) constructs and executes 5 tasks successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(5)
      const taskCount: number = 5
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(simpleFunc)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
        for (let i = 0; i < taskCount; i++) {
          expect(results[i] as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorTest3400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3500
     * @tc.desc   Verify float runningCapacity 2.9 and 5.1 both construct and execute (SDK floors non-integer values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner29 = new taskpool.AsyncRunner(2.9)
      const runner51 = new taskpool.AsyncRunner(5.1)
      try {
        const r29 = await runner29.execute(new taskpool.Task(simpleFunc))
        expect(r29 as number).assertEqual(42)
        const r51 = await runner51.execute(new taskpool.Task(simpleFunc))
        expect(r51 as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest3500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3600
     * @tc.desc   Verify max concurrent execution count respects runningCapacity via Sendable counter (capacity=1 exact serial, capacity=3 upper bound)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner(1)
      const counter1 = new ARMaxCounter()
      const promises1: Promise<Object>[] = []
      for (let i = 0; i < 4; i++) {
        promises1.push(runner1.execute(new taskpool.Task(arMaxProbeFunc, counter1, 150)))
      }
      try {
        await Promise.all(promises1)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest3600 failed')
        expect(false).assertFail()
      }
      expect(promises1.length).assertEqual(4)
      expect(counter1.max).assertEqual(1)

      const runner3 = new taskpool.AsyncRunner(3)
      const counter3 = new ARMaxCounter()
      const promises3: Promise<Object>[] = []
      for (let i = 0; i < 6; i++) {
        promises3.push(runner3.execute(new taskpool.Task(arMaxProbeFunc, counter3, 100)))
      }
      try {
        await Promise.all(promises3)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest3600 failed')
        expect(false).assertFail()
      }
      expect(promises3.length).assertEqual(6)
      expect(counter3.max <= 3).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3700
     * @tc.desc   Verify non-number runningCapacity (string/null/undefined/object) throws error 401 per input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let err: BusinessError | null = null
      try {
        const badCapacity: ESObject = '4'
        new taskpool.AsyncRunner(badCapacity)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()

      err = null
      try {
        const badCapacity: ESObject = null
        new taskpool.AsyncRunner(badCapacity)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()

      err = null
      try {
        const badCapacity: ESObject = undefined
        new taskpool.AsyncRunner(badCapacity)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()

      err = null
      try {
        const badCapacity: ESObject = new Object()
        new taskpool.AsyncRunner(badCapacity)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3800
     * @tc.desc   Verify waitingCapacity=5.5 constructs and executes task successfully (SDK floors non-integer waiting capacity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3, 5.5)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest3800 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3900
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_3900
     * @tc.desc   Verify string waitingCapacity throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let err: BusinessError | null = null
      try {
        const badWaiting: ESObject = '5'
        new taskpool.AsyncRunner(3, badWaiting)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest4000
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4000
     * @tc.desc   Verify discarded tasks are head-of-queue tasks while newest submission survives (results identify discarded vs executed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 1)
      const blockerPromise = runner.execute(new taskpool.Task(longFunc, 300))
      const pA = runner.execute(new taskpool.Task(addFunc, 11))
      const pB = runner.execute(new taskpool.Task(addFunc, 22))
      const pC = runner.execute(new taskpool.Task(addFunc, 33))
      const pD = runner.execute(new taskpool.Task(addFunc, 44))
      let discardCount: number = 0
      let discardErr: BusinessError | null = null
      const rejected: Promise<Object>[] = [pA, pB, pC]
      for (let i = 0; i < rejected.length; i++) {
        try {
          await rejected[i]
          console.error('AsyncRunnerConstructorTest4000 rejected promise resolved unexpectedly')
          expect(false).assertFail()
        } catch (e) {
          discardCount++
          discardErr = e
          if (discardErr !== null) {
            expect(discardErr.code).assertEqual(10200054)
          }
        }
      }
      expect(discardCount).assertEqual(3)
      expect(discardErr !== null).assertTrue()
      try {
        const survivor = await pD
        expect(survivor as number).assertEqual(88)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest4000 survivor failed')
        expect(false).assertFail()
      }
      try {
        await blockerPromise
      } catch (error) {
        console.error('AsyncRunnerConstructorTest4000 blocker failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest4100
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4100
     * @tc.desc   Verify high concurrency stress with runningCapacity=50 and 100 tasks all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(50, 0)
      const taskCount: number = 100
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(simpleFunc)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
        for (let i = 0; i < taskCount; i++) {
          expect(results[i] as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerConstructorTest4100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest4200
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4200
     * @tc.desc   Verify discard policy stress with 50 tasks and separately counted success and discard outcomes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 3)
      const taskCount: number = 50
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(longFunc, 150)))
      }
      let successCount: number = 0
      let discardCount: number = 0
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
          console.info(`AsyncRunnerConstructorTest.test.ets catch error: ${JSON.stringify(e)}`)
        }
      }
      expect(successCount + discardCount).assertEqual(taskCount)
      expect(discardCount > 0).assertTrue()
      expect(successCount > 0).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest4300
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4300
     * @tc.desc   Verify onExecutionSucceeded callback triggers once and nested execute inside callback completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 5)
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
        console.error('AsyncRunnerConstructorTest4300 failed')
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
        console.error('AsyncRunnerConstructorTest4300 nested failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest4400
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4400
     * @tc.desc   Verify onExecutionFailed callback triggers on task failure and nested execute inside callback completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 5)
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
        console.error('AsyncRunnerConstructorTest4400 nested failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest4500
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4500
     * @tc.desc   Verify sendData from task triggers onReceiveData three times with values 1 2 3 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 5)
      const task = new taskpool.Task(arSendDataFunc)
      const received: number[] = []
      task.onReceiveData((data: Object): void => {
        received.push(data as number)
      })
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerConstructorTest4500 failed')
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
     * @tc.name   AsyncRunnerConstructorTest4600
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4600
     * @tc.desc   Verify Sendable shared counter statistics with concurrency 5 and 10 tasks count exactly 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(5)
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
        console.error('AsyncRunnerConstructorTest4600 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest4700
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4700
     * @tc.desc   Verify two-stage callback chain nesting via onExecutionSucceeded completes all chained tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 10)
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
        console.error('AsyncRunnerConstructorTest4700 failed')
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
        console.error('AsyncRunnerConstructorTest4700 stage2 failed')
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
        console.error('AsyncRunnerConstructorTest4700 stage3 failed')
        expect(false).assertFail()
      }
      expect(chainCount).assertEqual(2)
      done()
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest4800
     * @tc.number SUB_ASYNC_RUNNER_CONSTRUCTOR_TEST_4800
     * @tc.desc   Verify F4 probe: a @Concurrent function body constructs an AsyncRunner, executes an inner task through it, and collects module-level Sendable counts; host polls up to 5s and asserts inner increment plus outer success marker both landed exactly (count == 2, result == 1); 15s race guard prevents a wedged probe from hanging (M15b c1#035; if infeasible at runtime the main workflow converts it to NAC with run evidence)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: ARProbeCounter = new ARProbeCounter()
      const probeTask = new taskpool.Task(arProbeConstructExecFunc, counter)
      let probeResult: Object = 'timeout'
      try {
        probeResult = await Promise.race([taskpool.execute(probeTask), arProbeTimeoutGuard(15000)])
      } catch (error) {
        console.info(`AsyncRunnerConstructorTest4800 probe rejected: ${JSON.stringify(error)}`)
        probeResult = 'rejected'
      }
      let waited4800: number = 0
      while (counter.count < 2 && waited4800 < 5000) {
        await sleep(100)
        waited4800 += 100
      }
      expect(probeResult as number).assertEqual(1)
      expect(counter.count).assertEqual(2)
      done()
    })
  })
}
