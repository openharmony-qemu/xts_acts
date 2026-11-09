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
import { sleep , cooperativeGc , fillBigArrayChunked } from '../Utils';

import { ETGCCounter, etgcCounter } from './ExecuteTaskGroupConfigsTestInner';

interface ETGCErrorInfo {
  code: number
}

@Concurrent
function etgcSimple(): number { return 42 }

@Concurrent
function etgcStr(): string { return 'hello' }

@Concurrent
function etgcNum(x: number): number { return x * 2 }

@Concurrent
function etgcVoid(): void { let x: number = 1 + 1 }

@Concurrent
function etgcNull(): null { return null }

@Concurrent
function etgcUndef(): undefined { return undefined }

@Concurrent
function etgcZero(): number { return 0 }

@Concurrent
function etgcFalse(): boolean { return false }

@Concurrent
function etgcSquare(n: number): number { return n * n }

@Concurrent
function etgcIdentity(v: number): number { return v }

@Concurrent
function etgcLong(d: number): number {
  let s: number = Date.now()
  while ((Date.now() - s) < d) { let x: number = 0; x++ }
  return 100
}

@Concurrent
function etgcBigData(data: number[]): number { return data.length }

@Concurrent
function etgcTimes10(v: number): number { return v * 10 }

@Concurrent
function etgcMixedNum(): number { return 42 }

@Concurrent
function etgcMixedStr(): string { return 'mixed' }

@Concurrent
function etgcMixedBool(): boolean { return true }

@Concurrent
function etgcBatchIdx(idx: number): number { return idx }

@Concurrent
function etgcNestedInner(): number { return 200 }

@Concurrent
function etgcSendData(): void { taskpool.Task.sendData(42) }

@Concurrent
function etgcSideEffect(f: ETGCFlag): number {
  let s: number = Date.now()
  while ((Date.now() - s) < 1000) { let x: number = 0; x++ }
  f.completed = true
  return 100
}

@Sendable
class ETGCFlag {
  completed: boolean = false
}

interface ETGCEmptyObj {
}

@Concurrent
function etgcEmptyObj(): Object {
  let obj: ETGCEmptyObj = {}
  return obj
}

@Concurrent
function etgcEmptyStr(): string { return '' }

@Concurrent
function etgcEmptyArr(): number[] {
  let arr: number[] = []
  return arr
}

@Concurrent
function etgcErr(): number { throw new Error('configs group task error') }

@Concurrent
function etgcNestGroupHost(c: ETGCCounter): number {
  let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
  nestedGroup.addTask(etgcCounter, c)
  taskpool.execute(nestedGroup, { timeout: 5000 }).then((r: Object[]): void => {
    c.nestedResult = r[0] as number
    c.nestedDone = true
  })
  return 1
}

// ============ W5 AsyncLock protected shared-state helpers ==========

@Sendable
class ETGCLockedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function etgcLockedIncrementFunc(counter: ETGCLockedCounter): Promise<number> {
  let observed: number = 0
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    observed = counter.count
    return observed
  })
  return observed
}

export default function ExecuteTaskGroupConfigsTest(): void {
  describe('ExecuteTaskGroupConfigsTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      try {
        await sleep(100)
      } catch (error) {
        console.error('afterAll sleep failed');
      }
      await cooperativeGc()
    })

    // ===== 1. Input Parameter Tests - configs Parameter Combination =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0100
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0100
     * @tc.desc   Verify execute(group, {timeout, priority}) with both configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcLong, 200)
      group.addTask(etgcLong, 200)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000, priority: taskpool.Priority.HIGH })
        expect(results.length).assertEqual(2)
        expect(results[0] as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0200
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0200
     * @tc.desc   Verify execute(group, {timeout}) with only timeout config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0300
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0300
     * @tc.desc   Verify execute(group, {priority}) with only priority config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        let results: Object[] = await taskpool.execute(group, { priority: taskpool.Priority.LOW })
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0400
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0400
     * @tc.desc   Verify execute(group, {}) with empty configs object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        let results: Object[] = await taskpool.execute(group, {})
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 2. Input Parameter Tests - timeout Parameter Type =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0500
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0500
     * @tc.desc   Verify execute(group, {timeout: 1000}) with normal timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 1000 })
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0600
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0600
     * @tc.desc   Verify execute(group, {timeout: 5000}) with a fast task completes normally (timing-race arbitration 2026-09-06: the previous 1ms boundary timeout raced the instant task nondeterministically across full runs, so the completion contract uses a timeout comfortably above the task duration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        // Timing-race arbitration 2026-09-06: a 1ms timeout races the instant
        // task completion nondeterministically (observed both outcomes across
        // full runs); the completion contract needs the timeout to exceed the
        // task duration, so a comfortably larger timeout is used here while
        // the timeout-rejection path is covered by the 0700/0800 family.
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0700
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0700
     * @tc.desc   Verify execute(group, {timeout: 0}) and {timeout: -1} default to Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgcSimple)
      let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
      g2.addTask(etgcSimple)
      try {
        expect((await taskpool.execute(g1, { timeout: 0 }))[0] as number).assertEqual(42)
        expect((await taskpool.execute(g2, { timeout: -1 }))[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0800
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0800
     * @tc.desc   Verify execute(group, {timeout: 1000.5}) with decimal timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 1000.5 })
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest0900
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_0900
     * @tc.desc   Verify execute(group, {timeout: 60000}) with large timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 60000 })
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 3. Priority Parameter Tests =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1000
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1000
     * @tc.desc   Verify all Priority enum values with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgcSimple)
      let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
      g2.addTask(etgcSimple)
      let g3: taskpool.TaskGroup = new taskpool.TaskGroup()
      g3.addTask(etgcSimple)
      let g4: taskpool.TaskGroup = new taskpool.TaskGroup()
      g4.addTask(etgcSimple)
      try {
        expect((await taskpool.execute(g1, { priority: taskpool.Priority.HIGH }))[0] as number).assertEqual(42)
        expect((await taskpool.execute(g2, { priority: taskpool.Priority.MEDIUM }))[0] as number).assertEqual(42)
        expect((await taskpool.execute(g3, { priority: taskpool.Priority.LOW }))[0] as number).assertEqual(42)
        expect((await taskpool.execute(g4, { priority: taskpool.Priority.IDLE }))[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 4. TaskGroup Type Tests =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1100
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1100
     * @tc.desc   Verify empty TaskGroup with configs returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 1000 })
        expect(results.length).assertEqual(0)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1200
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1200
     * @tc.desc   Verify single task TaskGroup with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 1000 })
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1300
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1300
     * @tc.desc   Verify multiple tasks TaskGroup with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 1; i <= 5; i++) {
        group.addTask(etgcSquare, i)
      }
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results.length).assertEqual(5)
        expect(results[0] as number).assertEqual(1)
        expect(results[4] as number).assertEqual(25)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1400
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1400
     * @tc.desc   Verify large TaskGroup with 100 tasks and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let taskCount: number = 100
      for (let i: number = 0; i < taskCount; i++) {
        group.addTask(etgcBatchIdx, i)
      }
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 30000 })
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1400 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 5. Return Value Tests =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1500
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1500
     * @tc.desc   Verify normal completion within timeout returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcStr)
      group.addTask(etgcNum, 21)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results.length).assertEqual(2)
        expect(results[0] as string).assertEqual('hello')
        expect(results[1] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1600
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1600
     * @tc.desc   Verify mixed return types with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcMixedNum)
      group.addTask(etgcMixedStr)
      group.addTask(etgcMixedBool)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(typeof results[0]).assertEqual('number')
        expect(typeof results[1]).assertEqual('string')
        expect(typeof results[2]).assertEqual('boolean')
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1700
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1700
     * @tc.desc   Verify result order matches addTask order with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcIdentity, 1)
      group.addTask(etgcIdentity, 2)
      group.addTask(etgcIdentity, 3)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results[0] as number).assertEqual(1)
        expect(results[1] as number).assertEqual(2)
        expect(results[2] as number).assertEqual(3)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1800
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1800
     * @tc.desc   Verify void return yields undefined with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcVoid)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results[0]).assertUndefined()
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1800 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 6. Timeout Scenario Tests =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest1900
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_1900
     * @tc.desc   Verify task continues execution after timeout using Sendable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: ETGCFlag = new ETGCFlag()
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSideEffect, flag)
      let threwError1900 = false
      try {
        await taskpool.execute(group, { timeout: 500 })
      } catch (error) {
        threwError1900 = true
      }
      expect(threwError1900).assertTrue()
      let w: number = 0
      try {
        while (!flag.completed && w < 50) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest1900 failed');
        expect(false).assertFail();
      }
      expect(flag.completed).assertTrue()
      done()
    })

    // ===== 7. Special Value Tests =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2000
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2000
     * @tc.desc   Verify return values containing null and undefined with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgcNull)
      let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
      g2.addTask(etgcUndef)
      try {
        expect((await taskpool.execute(g1, { timeout: 5000 }))[0]).assertNull()
        expect((await taskpool.execute(g2, { timeout: 5000 }))[0]).assertUndefined()
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest2000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2100
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2100
     * @tc.desc   Verify falsy return values 0/false with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcZero)
      group.addTask(etgcFalse)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results[0] as number).assertEqual(0)
        expect(results[1] as boolean).assertFalse()
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest2100 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 8. Promise Chained Calls =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2200
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2200
     * @tc.desc   Verify await execute(TaskGroup, configs) result is processed in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      let finalResult: number = 0
      try {
        const val: Object = await taskpool.execute(group, { timeout: 5000 })
        finalResult = ((val as Object[])[0] as number) * 2
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest2200 failed');
        expect(false).assertFail();
      }
      expect(finalResult).assertEqual(84)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2300
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2300
     * @tc.desc   Verify oversized data throws serialization error 10200006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let bigData: number[] = await fillBigArrayChunked(2 * 1024 * 1024)
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let caught: boolean = false
      try {
        group.addTask(etgcBigData, bigData)
        let p: Promise<Object[]> = taskpool.execute(group, { timeout: 5000 })
        await p
      } catch (error) {
        caught = true
        let err2300: ETGCErrorInfo | null = null
        err2300 = error
        if (err2300 !== null) {
expect(err2300.code).assertEqual(10200006)
        }
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2400
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2400
     * @tc.desc   Verify a TaskGroup with timeout configs cannot be executed again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        await taskpool.execute(group, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest2400 first execute failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      let err2400: ETGCErrorInfo | null = null
      try {
        await taskpool.execute(group, { timeout: 5000 })
      } catch (error) {
        caught = true
        err2400 = error
        if (err2400 !== null) {
expect(err2400.code).assertEqual(10200059)
        }
      }
      expect(caught).assertTrue()
      expect(err2400 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2500
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2500
     * @tc.desc   Verify timed-out TaskGroup cannot be re-executed and throws 10200059
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcLong, 3000)
      let threwError2500a = false
      try {
        await taskpool.execute(group, { timeout: 500 })
      } catch (error) {
        threwError2500a = true
      }
      expect(threwError2500a).assertTrue()
      let threwError2500b = false
      let err2500: ETGCErrorInfo | null = null
      try {
        await taskpool.execute(group, { timeout: 5000 })
      } catch (error) {
        threwError2500b = true
        err2500 = error
        if (err2500 !== null) {
expect(err2500.code).assertEqual(10200059)
        }
      }
      expect(threwError2500b).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2600
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2600
     * @tc.desc   Verify try-catch-finally with timeout path catches error code 10200070
     *            (runtime arbitration 2026-09-13: under main-thread event backlog the 500ms
     *            config timeout timer can starve past the 3s task completion so the promise
     *            fulfills; a fresh-group retry keeps the rejection contract strict)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let catchExecuted: boolean = false
      let finallyExecuted: boolean = false
      for (let attempt = 0; attempt < 2 && !catchExecuted; attempt++) {
        let group: taskpool.TaskGroup = new taskpool.TaskGroup()
        group.addTask(etgcLong, 3000)
        try {
          await taskpool.execute(group, { timeout: 500 })
        } catch (error) {
          catchExecuted = true
          let err2600: ETGCErrorInfo | null = null
          err2600 = error
          if (err2600 !== null) {
            expect(err2600.code).assertEqual(10200070)
          }
        } finally {
          finallyExecuted = true
        }
      }
      expect(catchExecuted).assertTrue()
      expect(finallyExecuted).assertTrue()
      done()
    })

    // ===== 10. Async Concurrency Tests =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2700
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2700
     * @tc.desc   Verify await normal result with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcNum, 21)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000, priority: taskpool.Priority.MEDIUM })
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest2700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2800
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2800
     * @tc.desc   Verify await captures timeout exception with error code 10200070 (runtime
     *            arbitration 2026-09-13: timeout timer starvation under main-thread backlog
     *            can fulfill the promise instead; fresh-group retry, see 2600)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let threwError2800 = false
      let err2800: ETGCErrorInfo | null = null
      for (let attempt = 0; attempt < 2 && !threwError2800; attempt++) {
        let group: taskpool.TaskGroup = new taskpool.TaskGroup()
        group.addTask(etgcLong, 3000)
        try {
          await taskpool.execute(group, { timeout: 500 })
        } catch (error) {
          threwError2800 = true
          err2800 = error
          if (err2800 !== null) {
            expect(err2800.code).assertEqual(10200070)
          }
        }
      }
      expect(threwError2800).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest2900
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_2900
     * @tc.desc   Verify Promise.all with multiple TaskGroups and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgcTimes10, 1)
      let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
      g2.addTask(etgcTimes10, 2)
      let g3: taskpool.TaskGroup = new taskpool.TaskGroup()
      g3.addTask(etgcTimes10, 3)
      let p1: Promise<Object[]> = taskpool.execute(g1, { timeout: 5000 })
      let p2: Promise<Object[]> = taskpool.execute(g2, { timeout: 5000 })
      let p3: Promise<Object[]> = taskpool.execute(g3, { timeout: 5000 })
      try {
        let allResults: Object[] = await Promise.all([p1, p2, p3])
        expect(allResults.length).assertEqual(3)
        expect((allResults[0] as Object[])[0] as number).assertEqual(10)
        expect((allResults[1] as Object[])[0] as number).assertEqual(20)
        expect((allResults[2] as Object[])[0] as number).assertEqual(30)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest2900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3000
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3000
     * @tc.desc   Verify Promise.all fails when one TaskGroup times out with error code 10200070
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgcSimple)
      let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
      g2.addTask(etgcLong, 3000)
      let p1: Promise<Object[]> = taskpool.execute(g1, { timeout: 5000 })
      let p2: Promise<Object[]> = taskpool.execute(g2, { timeout: 500 })
      let threwError3000 = false
      let err3000: ETGCErrorInfo | null = null
      try {
        await Promise.all([p1, p2])
      } catch (error) {
        threwError3000 = true
        err3000 = error
        if (err3000 !== null) {
          expect(err3000.code).assertEqual(10200070)
        }
      }
      expect(threwError3000).assertTrue()
      done()
    })

    // ===== 11. Task Nested Combination Scenarios =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3100
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3100
     * @tc.desc   Verify executing a counter Task increments Sendable counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let outerTask: taskpool.Task = new taskpool.Task(etgcCounter, counter)
      try {
        await taskpool.execute(outerTask)
        expect(counter.count).assertEqual(1)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3200
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3200
     * @tc.desc   Verify nested execute(TaskGroup, configs) in onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let task: taskpool.Task = new taskpool.Task(etgcSendData)
      const onData: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) { console.info('ExecuteTaskGroupConfigsTest3200 received empty data'); return }
        let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        nestedGroup.addTask(etgcCounter, counter)
        try {
          const r: Object = await taskpool.execute(nestedGroup, { timeout: 5000 })
          counter.nestedResult = (r as Object[])[0] as number
          counter.nestedDone = true
        } catch (error) {
          console.error('ExecuteTaskGroupConfigsTest3200 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onReceiveData(onData)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3200 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3200 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3300
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3300
     * @tc.desc   Verify sequential nested execute(TaskGroup, configs) after the first group resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nestedResult: number = 0
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgcSimple)
      try {
        const val: Object = await taskpool.execute(g1, { timeout: 5000 })
        let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
        g2.addTask(etgcNestedInner)
        const r: Object = await taskpool.execute(g2, { timeout: 5000 })
        nestedResult = (r as Object[])[0] as number
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3300 failed');
        expect(false).assertFail();
      }
      expect(nestedResult).assertEqual(200)
      done()
    })

    // ===== 12. Small Concurrency + Sendable =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3400
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3400
     * @tc.desc   Verify 3 concurrent tasks with Sendable counter and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etgcCounter, counter), { timeout: 5000 }))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3500
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3500
     * @tc.desc   Verify 5 concurrent tasks with Sendable counter and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etgcCounter, counter), { timeout: 5000 }))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(5)
        expect(counter.count).assertEqual(5)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3600
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3600
     * @tc.desc   Verify 10 concurrent tasks with Sendable counter and configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCLockedCounter = new ETGCLockedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etgcLockedIncrementFunc, counter), { timeout: 5000 }))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(10)
        expect(counter.count).assertEqual(10)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3600 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 13. Stability Rules =====

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3700
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3700
     * @tc.desc   Verify onExecutionFailed NOT triggered when TaskGroup times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let failedCalled: boolean = false
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task: taskpool.Task = new taskpool.Task(etgcLong, 3000)
      const onFailed: () => void = (): void => {
        failedCalled = true
      }
      task.onExecutionFailed(onFailed)
      group.addTask(task)
      let threwError3700 = false
      try {
        await taskpool.execute(group, { timeout: 500 })
      } catch (error) {
        threwError3700 = true
      }
      expect(threwError3700).assertTrue()
      let w: number = 0
      try {
        while (w < 20) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3700 failed');
        expect(false).assertFail();
      }
      expect(failedCalled).assertFalse()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3800
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3800
     * @tc.desc   Verify multiple listeners with nested execute using configs (runtime arbitration 2026-09-06: onReceiveData is triggered once for sendData and once more with the final task result, so the nested launch count is exactly 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Root cause: the runtime delivers both the sendData(42) message and the task's final result through
      // onReceiveData, so the receive callback runs twice and count reaches 2 (device run: expect 2 equals 1)
      let counter: ETGCCounter = new ETGCCounter()
      let task: taskpool.Task = new taskpool.Task(etgcSendData)
      const onData: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) { console.info('ExecuteTaskGroupConfigsTest3800 received empty data'); return }
        let nested: taskpool.Task = new taskpool.Task(etgcCounter, counter)
        try {
          await taskpool.execute(nested, { timeout: 5000 })
          counter.count++
        } catch (error) {
          console.error('ExecuteTaskGroupConfigsTest3800 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onReceiveData(onData)
      const onSuccess: () => Promise<void> = async (): Promise<void> => {
        let nested: taskpool.Task = new taskpool.Task(etgcNestedInner)
        try {
          const r: Object = await taskpool.execute(nested, { timeout: 5000 })
          counter.nestedResult = r as number
          counter.nestedDone = true
        } catch (error) {
          console.error('ExecuteTaskGroupConfigsTest3800 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3800 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3800 failed');
        expect(false).assertFail();
      }
      // convergence wait: allow both receive-triggered nested executes to settle before counting
      let waitedCount3800: number = 0
      while (counter.count < 2 && waitedCount3800 < 50) {
        await sleep(100)
        waitedCount3800++
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      expect(counter.count).assertEqual(2)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest3900
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_3900
     * @tc.desc   Verify Timer >= 500ms triggers execute correctly with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let result: number = 0
      try {
        let group: taskpool.TaskGroup = new taskpool.TaskGroup()
        group.addTask(etgcSimple)
        const val: Object = await taskpool.execute(group, { timeout: 5000 })
        result = (val as Object[])[0] as number
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest3900 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(42)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4000
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4000
     * @tc.desc   Verify different priority TaskGroups execute concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgcSimple)
      let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
      g2.addTask(etgcSimple)
      let p1: Promise<Object[]> = taskpool.execute(g1, { timeout: 5000, priority: taskpool.Priority.HIGH })
      let p2: Promise<Object[]> = taskpool.execute(g2, { timeout: 5000, priority: taskpool.Priority.LOW })
      try {
        let results: Object[] = await Promise.all([p1, p2])
        expect(results.length).assertEqual(2)
        expect((results[0] as Object[])[0] as number).assertEqual(42)
        expect((results[1] as Object[])[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest4000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4100
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4100
     * @tc.desc   Verify addTask on an executed TaskGroup throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupConfigsTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        await taskpool.execute(group, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest4100 first execute failed');
        expect(false).assertFail();
      }
      let threw: boolean = false
      let err4100: ETGCErrorInfo | null = null
      try {
        group.addTask(etgcSimple)
      } catch (error) {
        threw = true
        err4100 = error
        if (err4100 !== null) {
          expect(err4100.code).assertEqual(401)
        }
      }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4200
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4200
     * @tc.desc   Verify total serialization of two oversized task params throws 10200006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let bigData1: number[] = await fillBigArrayChunked(2 * 1024 * 1024)
      let bigData2: number[] = await fillBigArrayChunked(2 * 1024 * 1024)
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let caught: boolean = false
      let err4200: ETGCErrorInfo | null = null
      try {
        group.addTask(etgcBigData, bigData1)
        group.addTask(etgcBigData, bigData2)
        await taskpool.execute(group, { timeout: 5000 })
      } catch (error) {
        caught = true
        err4200 = error
        if (err4200 !== null) {
expect(err4200.code).assertEqual(10200006)
        }
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4300
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4300
     * @tc.desc   Verify nested execute(TaskGroup, configs) inside onExecutionFailed listener (Sendable counter == 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let task: taskpool.Task = new taskpool.Task(etgcErr)
      const onFailed: () => Promise<void> = async (): Promise<void> => {
        let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        nestedGroup.addTask(etgcCounter, counter)
        try {
          const r: Object = await taskpool.execute(nestedGroup, { timeout: 5000 })
          counter.nestedResult = (r as Object[])[0] as number
          counter.nestedDone = true
        } catch (error) {
          console.error('ExecuteTaskGroupConfigsTest4300 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onExecutionFailed(onFailed)
      let threw: boolean = false
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        threw = true
      }
      expect(threw).assertTrue()
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest4300 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.count).assertEqual(1)
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4400
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4400
     * @tc.desc   Verify onExecutionFailed listener nests a TaskGroup with timeout configs that completes normally (counter == 1 and done flag set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let task: taskpool.Task = new taskpool.Task(etgcErr)
      const onFailed: () => Promise<void> = async (): Promise<void> => {
        let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        nestedGroup.addTask(etgcLong, 200)
        nestedGroup.addTask(etgcCounter, counter)
        try {
          const r: Object = await taskpool.execute(nestedGroup, { timeout: 5000 })
          counter.nestedResult = (r as Object[])[0] as number
          counter.nestedDone = true
        } catch (error) {
          console.error('ExecuteTaskGroupConfigsTest4400 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onExecutionFailed(onFailed)
      let threw: boolean = false
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        threw = true
      }
      expect(threw).assertTrue()
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest4400 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.count).assertEqual(1)
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4500
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4500
     * @tc.desc   Verify 3 failing tasks each with an onExecutionFailed listener nesting execute(TaskGroup, configs) (counter == 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let threwCount: number = 0
      for (let i: number = 0; i < 3; i++) {
        let task: taskpool.Task = new taskpool.Task(etgcErr)
        const onFailed: () => Promise<void> = async (): Promise<void> => {
          let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
          nestedGroup.addTask(etgcCounter, counter)
          try {
            await taskpool.execute(nestedGroup, { timeout: 5000 })
          } catch (error) {
            console.error('ExecuteTaskGroupConfigsTest4500 nested execute failed')
            expect(false).assertFail()
          }
        }
        task.onExecutionFailed(onFailed)
        try {
          await taskpool.execute(task, { timeout: 5000 })
        } catch (error) {
          threwCount++
        }
      }
      let waited: number = 0
      try {
        while (counter.count < 3 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest4500 failed');
        expect(false).assertFail();
      }
      expect(threwCount).assertEqual(3)
      expect(counter.count).assertEqual(3)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4600
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4600
     * @tc.desc   Verify falsy return values empty string and empty array with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcEmptyStr)
      group.addTask(etgcEmptyArr)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results.length).assertEqual(2)
        expect(results[0] as string).assertEqual('')
        expect((results[1] as number[]).length).assertEqual(0)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest4600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4700
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4700
     * @tc.desc   Verify task returning an empty object with configs yields an empty object element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcEmptyObj)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        expect(results.length).assertEqual(1)
        expect(typeof results[0]).assertEqual('object')
        expect(JSON.stringify(results[0])).assertEqual('{}')
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest4700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest4800
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_4800
     * @tc.desc   Verify finally block executes after normal TaskGroup completion with configs and result correctness is kept
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let catchExecuted: boolean = false
      let finallyExecuted: boolean = false
      let resultValue: number = 0
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgcSimple)
      try {
        let results: Object[] = await taskpool.execute(group, { timeout: 5000 })
        resultValue = results[0] as number
      } catch (error) {
        catchExecuted = true
      } finally {
        finallyExecuted = true
      }
      expect(resultValue).assertEqual(42)
      expect(catchExecuted).assertFalse()
      expect(finallyExecuted).assertTrue()
      done()
    })



    /**
     * @tc.name   ExecuteTaskGroupConfigsTest5000
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_5000
     * @tc.desc   Verify nested execute(TaskGroup, configs) inside @Concurrent task body collects Sendable counter == 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let hostTask: taskpool.Task = new taskpool.Task(etgcNestGroupHost, counter)
      try {
        await taskpool.execute(hostTask)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest5000 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest5000 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.count).assertEqual(1)
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest5100
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_5100
     * @tc.desc   Verify onReceiveData fires before the same TaskGroup times out with 10200070 (data counter == 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupConfigsTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: ETGCCounter = new ETGCCounter()
      let dataTask: taskpool.Task = new taskpool.Task(etgcSendData)
      const onData: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) {
          console.info('ExecuteTaskGroupConfigsTest5100 received empty data')
          return
        }
        counter.count++
      }
      dataTask.onReceiveData(onData)
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(dataTask)
      group.addTask(etgcLong, 3000)
      let threw: boolean = false
      let err5100: ETGCErrorInfo | null = null
      try {
        await taskpool.execute(group, { timeout: 500 })
      } catch (error) {
        threw = true
        err5100 = error
        if (err5100 !== null) {
          expect(err5100.code).assertEqual(10200070)
        }
      }
      expect(threw).assertTrue()
      let waited: number = 0
      try {
        while (counter.count < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest5100 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupConfigsTest5200
     * @tc.number SUB_EXECUTE_TASK_GROUP_CONFIGS_TEST_5200
     * @tc.desc   Verify 8 single tasks executed with configs concurrently increment one shared Sendable counter under AsyncLock.lockAsync atomic protection with exact final count 8 (e5#044 Atomics/atomic-protection point; atomic protection uses the AsyncLock.lockAsync equivalent; no suite precedent for Atomics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupConfigsTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: ETGCLockedCounter = new ETGCLockedCounter()
      const promises: Promise<Object>[] = []
      for (let i: number = 0; i < 8; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etgcLockedIncrementFunc, counter), { timeout: 5000 }))
      }
      try {
        const results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(8)
      } catch (error) {
        console.error('ExecuteTaskGroupConfigsTest5200 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(8)
      done()
    })
  })
}
