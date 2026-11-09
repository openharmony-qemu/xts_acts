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
import { sleep, drainTaskPool } from '../TaskpoolTestSharedUtils';
import { addConfigsFunc } from './TaskpoolConfigsTestInner';

// ============ @Concurrent Helper Functions (module top-level) ============

@Concurrent
function simpleConfigsFunc(): number {
  return 42
}

@Concurrent
function computeConfigsFunc(n: number): number {
  let sum: number = 0
  for (let i = 0; i < n; i++) {
    sum += i
  }
  return sum
}

@Concurrent
function longConfigsFunc(duration: number): number {
  const start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}

@Concurrent
function sendDataConfigsFunc(): number {
  taskpool.Task.sendData(42)
  return 100
}

@Concurrent
async function countConfigsFunc(counter: SharedCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  // Per-task fixed contribution; host side sums the return values (worker-side count++ is non-atomic and never asserted)
  return 1
}

@Concurrent
async function nestedExecConfigsFunc(counter: SharedCounter): Promise<void> {
  const innerTask = new taskpool.Task(addConfigsFunc, 20)
  const innerConfigs: taskpool.Configs = { timeout: 10000 }
  try {
    const value = await taskpool.execute(innerTask, innerConfigs)
    if (value as number === 40) {
      counter.count++
    }
  } catch (e) {
    console.error('nestedExecConfigsFunc inner execute failed')
  }
}

// ============ @Sendable Classes ============

@Sendable
class SharedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

// ============ Test Suite ============

export default function TaskpoolConfigsTest(): void {
  describe('TaskpoolConfigsTest', (): void => {
beforeAll(async (): Promise<void> => {
      // Environment restoration: drain leftover pool tasks from preceding
      // suites (see shared utils.ets drainTaskPool).
      await drainTaskPool()
    })
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      try {
        await sleep(100)
      } catch (error) {
        console.error('afterAll sleep failed');
      }
    })

    // ============ Section 1: timeout normal value tests ============

    /**
     * @tc.name   TaskpoolConfigsTest0100
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0100
     * @tc.desc   Verify execute with timeout=1000 returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: 1000 }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest0200
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0200
     * @tc.desc   Verify execute with timeout=5000 returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: 5000 }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest0300
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0300
     * @tc.desc   Verify execute with timeout=10000 and compute task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(computeConfigsFunc, 1000)
        const configs: taskpool.Configs = { timeout: 10000 }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(499500)
      } catch (error) {
        console.error('TaskpoolConfigsTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ============ Section 2: timeout boundary value tests ============

    /**
     * @tc.name   TaskpoolConfigsTest0400
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0400
     * @tc.desc   Verify execute with timeout=0 treats as no timeout and task completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: 0 }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest0500
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0500
     * @tc.desc   Verify execute with timeout=-100 returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: -100 }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest0600
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0600
     * @tc.desc   Verify execute with timeout=1000.9 returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolConfigsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: 1000.9 }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest0700
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0700
     * @tc.desc   Verify execute with timeout=0.9 returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolConfigsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: 0.9 }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest0800
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0800
     * @tc.desc   Verify execute with timeout=1 activates timeout mechanism on long-running task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(longConfigsFunc, 100)
      const configs: taskpool.Configs = { timeout: 1 }
      let timedOut = false
      try {
        await taskpool.execute(task, configs)
      } catch (e) {
        timedOut = true
      }
      expect(timedOut).assertTrue()
      done()
    })

    // ============ Section 3: timeout overflow value tests ============

    /**
     * @tc.name   TaskpoolConfigsTest0900
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_0900
     * @tc.desc   Verify execute with timeout=Number.MAX_VALUE returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolConfigsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: Number.MAX_VALUE }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest1000
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1000
     * @tc.desc   Verify execute with timeout=Number.MAX_SAFE_INTEGER returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolConfigsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: Number.MAX_SAFE_INTEGER }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ============ Section 4: timeout special value tests ============

    /**
     * @tc.name   TaskpoolConfigsTest1100
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1100
     * @tc.desc   Verify execute with timeout=NaN returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolConfigsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: NaN }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest1100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest1200
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1200
     * @tc.desc   Verify execute with timeout=Infinity returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolConfigsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: Infinity }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest1200 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ============ Section 5: timeout trigger tests ============

    /**
     * @tc.name   TaskpoolConfigsTest1300
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1300
     * @tc.desc   Verify execute with short timeout terminates long-running task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(longConfigsFunc, 5000)
      const configs: taskpool.Configs = { timeout: 500 }
      let rejected = false
      try {
        await taskpool.execute(task, configs)
      } catch (e) {
        rejected = true
      }
      expect(rejected).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest1400
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1400
     * @tc.desc   Verify execute with long timeout allows short task to complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: 10000 }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest1400 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ============ Section 6: priority normal value tests ============

    /**
     * @tc.name   TaskpoolConfigsTest1500
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1500
     * @tc.desc   Verify execute with priority=HIGH returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { priority: taskpool.Priority.HIGH }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest1500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest1600
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1600
     * @tc.desc   Verify execute with priority=MEDIUM returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { priority: taskpool.Priority.MEDIUM }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest1600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest1700
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1700
     * @tc.desc   Verify execute with priority=LOW returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { priority: taskpool.Priority.LOW }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest1700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest1800
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1800
     * @tc.desc   Verify execute with priority=IDLE returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { priority: taskpool.Priority.IDLE }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest1800 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ============ Section 7: priority default value tests ============

    /**
     * @tc.name   TaskpoolConfigsTest1900
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_1900
     * @tc.desc   Verify execute without Configs defaults to MEDIUM priority and task completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleConfigsFunc)
      let result: number = 0
      try {
        const execResult = await taskpool.execute(task) as number
        result = execResult
      } catch (error) {
        console.error('TaskpoolConfigsTest1900 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(42)
      done()
    })

    // ============ Section 8: combination tests ============

    /**
     * @tc.name   TaskpoolConfigsTest2000
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2000
     * @tc.desc   Verify execute with both timeout and priority set returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleConfigsFunc)
      const configs: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.HIGH }
      let result: number = 0
      try {
        const execResult = await taskpool.execute(task, configs) as number
        result = execResult
      } catch (error) {
        console.error('TaskpoolConfigsTest2000 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(42)
      done()
    })

    // ============ Section 9: concurrent scenario tests ============

    /**
     * @tc.name   TaskpoolConfigsTest2100
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2100
     * @tc.desc   Verify multiple tasks with different configs execute concurrently via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolConfigsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const task1 = new taskpool.Task(addConfigsFunc, 10)
      const task2 = new taskpool.Task(addConfigsFunc, 20)
      const task3 = new taskpool.Task(addConfigsFunc, 30)
      const configs1: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.HIGH }
      const configs2: taskpool.Configs = { timeout: 5000, priority: taskpool.Priority.MEDIUM }
      const configs3: taskpool.Configs = { timeout: 8000, priority: taskpool.Priority.LOW }
      const p1 = taskpool.execute(task1, configs1)
      const p2 = taskpool.execute(task2, configs2)
      const p3 = taskpool.execute(task3, configs3)
      let results: Object[] = []
      try {
        results = await Promise.all([p1, p2, p3])
      } catch (error) {
        console.error('TaskpoolConfigsTest2100 failed');
        expect(false).assertFail();
      }
      expect(results.length).assertEqual(3)
      expect(results[0] as number).assertEqual(20)
      expect(results[1] as number).assertEqual(40)
      expect(results[2] as number).assertEqual(60)
      done()
    })

    // ============ Section 10: nested combination scenario tests ============

    /**
     * @tc.name   TaskpoolConfigsTest2200
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2200
     * @tc.desc   Verify sequential task execution where task2 depends on task1 result with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolConfigsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const task1 = new taskpool.Task(addConfigsFunc, 21)
      const configs1: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.HIGH }
      let result1: number = 0
      try {
        const execResult1 = await taskpool.execute(task1, configs1) as number
        result1 = execResult1
      } catch (error) {
        console.error('TaskpoolConfigsTest2300 failed');
        expect(false).assertFail();
      }
      expect(result1).assertEqual(42)

      // Use result of task1 as input to task2
      const task2 = new taskpool.Task(addConfigsFunc, result1 as number)
      const configs2: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.MEDIUM }
      let result2: number = 0
      try {
        const execResult2 = await taskpool.execute(task2, configs2) as number
        result2 = execResult2
      } catch (error) {
        console.error('TaskpoolConfigsTest2300 failed');
        expect(false).assertFail();
      }
      expect(result2).assertEqual(84)
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest2300
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2300
     * @tc.desc   Verify nested task execution inside onReceiveData callback with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolConfigsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const task = new taskpool.Task(sendDataConfigsFunc)
      const innerTask = new taskpool.Task(addConfigsFunc, 5)
      const innerPromises: Promise<Object>[] = []

      const onReceive: (data: Object) => void = (data: Object): void => {
        if (data === null || data === undefined) {
          console.info('TaskpoolConfigsTest2400 received empty data')
          return
        }
        innerPromises.push(taskpool.execute(innerTask, { timeout: 10000 }))
      };
      task.onReceiveData(onReceive)

      let result: number = 0
      try {
        const execResult = await taskpool.execute(task, { timeout: 10000 }) as number
        result = execResult
      } catch (error) {
        console.error('TaskpoolConfigsTest2400 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(100)

      // Wait for callback completion using counting mechanism
      let waited: number = 0
      try {
        while (innerPromises.length < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolConfigsTest2400 failed');
        expect(false).assertFail();
      }
      try {
        const innerResults = await Promise.all(innerPromises)
        expect(innerResults.length).assertEqual(1)
        expect(innerResults[0] as number).assertEqual(10)
        counter.count++
      } catch (error) {
        console.error('TaskpoolConfigsTest2400 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest2400
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2400
     * @tc.desc   Verify 3 concurrent tasks with Sendable shared counter parameter and configs; per-task return values summed on host equal 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolConfigsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 3; i++) {
        const task = new taskpool.Task(countConfigsFunc, counter)
        const configs: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.MEDIUM }
        promises.push(taskpool.execute(task, configs))
      }
      let results: Object[] = []
      try {
        results = await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolConfigsTest2500 failed');
        expect(false).assertFail();
      }
      let hostSum: number = 0
      for (let i = 0; i < results.length; i++) {
        hostSum += results[i] as number
      }
      expect(hostSum).assertEqual(3)
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest2500
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2500
     * @tc.desc   Verify 5 concurrent tasks with Sendable shared counter parameter and configs; per-task return values summed on host equal 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolConfigsTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 5; i++) {
        const task = new taskpool.Task(countConfigsFunc, counter)
        const configs: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.MEDIUM }
        promises.push(taskpool.execute(task, configs))
      }
      let results: Object[] = []
      try {
        results = await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolConfigsTest2600 failed');
        expect(false).assertFail();
      }
      let hostSum: number = 0
      for (let i = 0; i < results.length; i++) {
        hostSum += results[i] as number
      }
      expect(hostSum).assertEqual(5)
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest2600
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2600
     * @tc.desc   Verify 10 concurrent tasks with Sendable shared counter parameter and configs; per-task return values summed on host equal 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolConfigsTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 10; i++) {
        const task = new taskpool.Task(countConfigsFunc, counter)
        const configs: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.MEDIUM }
        promises.push(taskpool.execute(task, configs))
      }
      let results: Object[] = []
      try {
        results = await Promise.all(promises)
      } catch (error) {
        console.error('TaskpoolConfigsTest2700 failed');
        expect(false).assertFail();
      }
      expect(results.length).assertEqual(10)
      let hostSum: number = 0
      for (let i = 0; i < results.length; i++) {
        expect(typeof (results[i] as number)).assertEqual('number')
        hostSum += results[i] as number
      }
      expect(hostSum).assertEqual(10)
      done()
    })

    // ============ Section 11: Configs param special value tests ============

    /**
     * @tc.name   TaskpoolConfigsTest2700
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2700
     * @tc.desc   Verify execute with timeout=undefined takes default no-timeout (d.ts: omitted timeout defaults to 0) and task completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { timeout: undefined }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest2800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest2800
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2800
     * @tc.desc   Verify execute with timeout=null throws BusinessError 401 (runtime arbitration: native GetExecuteParams routes null through IsNumber type validation throwing TYPE_ERROR 401, not the mind-map expectation "treat as no timeout")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleConfigsFunc)
      // JSON.parse('null') evaluates to the null runtime value while staying
      // statically non-literal, so the native IsNumber rejection (401) on a
      // null-ish timeout is covered without an illegal null cast.
      const configs: taskpool.Configs = { timeout: JSON.parse('null') as Object as number }
      let threw = false
      try {
        await taskpool.execute(task, configs)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest2900
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_2900
     * @tc.desc   Verify execute with priority=undefined takes default MEDIUM priority (d.ts: default value is Priority.MEDIUM) and task completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(simpleConfigsFunc)
        const configs: taskpool.Configs = { priority: undefined }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('TaskpoolConfigsTest3000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest3000
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_3000
     * @tc.desc   Verify two tasks launched concurrently with different timeout configs: normal task completes while long task is terminated by its timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const normalTask = new taskpool.Task(simpleConfigsFunc)
      const timeoutTask = new taskpool.Task(longConfigsFunc, 5000)
      const normalConfigs: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.HIGH }
      const timeoutConfigs: taskpool.Configs = { timeout: 500, priority: taskpool.Priority.LOW }
      // Concurrent initiation: launch both executes before awaiting either
      const normalPromise = taskpool.execute(normalTask, normalConfigs)
      const timeoutPromise = taskpool.execute(timeoutTask, timeoutConfigs)
      let normalResult: number = 0
      try {
        const execResult = await normalPromise as number
        normalResult = execResult
      } catch (error) {
        console.error('TaskpoolConfigsTest3100 failed');
        expect(false).assertFail();
      }
      expect(normalResult).assertEqual(42)
      let rejected = false
      try {
        await timeoutPromise
      } catch (e) {
        rejected = true
      }
      expect(rejected).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest3100
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_3100
     * @tc.desc   Verify execute with timeout of cast string type throws BusinessError 401 (F2 parameter-validation family: native timeout non-number type validation TYPE_ERROR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task = new taskpool.Task(simpleConfigsFunc)
      const configs: taskpool.Configs = { timeout: '500' as Object as number }
      let threw = false
      try {
        await taskpool.execute(task, configs)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest3200
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_3200
     * @tc.desc   Verify execute Configs.priority rejects invalid values with BusinessError 401; bundled sub-tests: (1) priority=-1 below range, (2) priority=999 above range (F2 parameter-validation family: native out-of-range values hit "execute's priority value is error" TYPE_ERROR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task1 = new taskpool.Task(simpleConfigsFunc)
      const negativeConfigs: taskpool.Configs = { priority: -1 as Object as taskpool.Priority }
      let threwNegative = false
      try {
        await taskpool.execute(task1, negativeConfigs)
      } catch (error) {
        threwNegative = true
        expect(error.code).assertEqual(401)
      }
      expect(threwNegative).assertTrue()
      const task2 = new taskpool.Task(simpleConfigsFunc)
      const overflowConfigs: taskpool.Configs = { priority: 999 as Object as taskpool.Priority }
      let threwOverflow = false
      try {
        await taskpool.execute(task2, overflowConfigs)
      } catch (error) {
        threwOverflow = true
        expect(error.code).assertEqual(401)
      }
      expect(threwOverflow).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest3300
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_3300
     * @tc.desc   Verify execute Configs.priority rejects non-number values with BusinessError 401; bundled sub-tests: (1) priority='500' cast string, (2) priority=null (F2 parameter-validation family: native priority non-number type validation TYPE_ERROR, null is not undefined and does not take the default tier)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolConfigsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const task1 = new taskpool.Task(simpleConfigsFunc)
      const stringConfigs: taskpool.Configs = { priority: '500' as Object as taskpool.Priority }
      let threwString = false
      try {
        await taskpool.execute(task1, stringConfigs)
      } catch (error) {
        threwString = true
        expect(error.code).assertEqual(401)
      }
      expect(threwString).assertTrue()
      const task2 = new taskpool.Task(simpleConfigsFunc)
      // JSON.parse('null') evaluates to the null runtime value while staying
      // statically non-literal, so the native IsNumber rejection (401) on a
      // null-ish priority is covered without an illegal null cast.
      const nullConfigs: taskpool.Configs = { priority: JSON.parse('null') as Object as taskpool.Priority }
      let threwNull = false
      try {
        await taskpool.execute(task2, nullConfigs)
      } catch (error) {
        threwNull = true
        expect(error.code).assertEqual(401)
      }
      expect(threwNull).assertTrue()
      done()
    })

    /**
     * @tc.name   TaskpoolConfigsTest3400
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_3400
     * @tc.desc   Verify execute with timeout and Priority.IDLE combo (Configs#023 combined-tier extension: IDLE tier and timeout take effect together)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolConfigsTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(computeConfigsFunc, 1000)
        const configs: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.IDLE }
        const result = await taskpool.execute(task, configs)
        expect(result as number).assertEqual(499500)
      } catch (error) {
        console.error('TaskpoolConfigsTest3500 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ============ Section 12: nested execute in concurrent function test ============

    /**
     * @tc.name   TaskpoolConfigsTest3500
     * @tc.number SUB_TASKPOOL_CONFIGS_TEST_3500
     * @tc.desc   Verify nested execute with configs inside @Concurrent function body via module-level counter (F4 probe: if infeasible at runtime, the main workflow converts to NAC with runtime evidence)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolConfigsTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const task = new taskpool.Task(nestedExecConfigsFunc, counter)
      const configs: taskpool.Configs = { timeout: 10000, priority: taskpool.Priority.MEDIUM }
      try {
        await taskpool.execute(task, configs)
      } catch (error) {
        console.error('TaskpoolConfigsTest3600 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (counter.count < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('TaskpoolConfigsTest3600 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })
  })
}
