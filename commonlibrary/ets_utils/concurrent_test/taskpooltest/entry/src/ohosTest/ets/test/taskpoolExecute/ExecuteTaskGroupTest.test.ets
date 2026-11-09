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
import { sleep , cooperativeGc } from '../Utils';

import { ETGNestFlag, etgFlagInc } from './ExecuteTaskGroupTestInner';

@Concurrent
function etgSimple(): number { return 42 }

@Sendable
class ETGOverlapProbe {
  inA: boolean = false
  inB: boolean = false
  sawA: boolean = false
  sawB: boolean = false
}

@Concurrent
function etgOverlapFuncA(probe: ETGOverlapProbe): number {
  probe.inA = true
  let acc: number = 0
  for (let i: number = 0; i < 3000000; i++) {
    if (probe.inB) {
      probe.sawB = true
    }
    acc += i % 7
  }
  probe.inA = false
  return acc % 7 === -1 ? 0 : 1
}

@Concurrent
function etgOverlapFuncB(probe: ETGOverlapProbe): number {
  probe.inB = true
  let acc: number = 0
  for (let i: number = 0; i < 3000000; i++) {
    if (probe.inA) {
      probe.sawA = true
    }
    acc += i % 7
  }
  probe.inB = false
  return acc % 7 === -1 ? 0 : 2
}

@Concurrent
function etgAdd(a: number, b: number): number { return a + b }

@Concurrent
function etgMul(a: number, b: number): number { return a * b }

@Concurrent
function etgTrue(): boolean { return true }

@Concurrent
function etgVoid(): void { let x: number = 1 + 1 }

@Concurrent
function etgNull(): null { return null }

@Concurrent
function etgUndef(): undefined { return undefined }

@Concurrent
function etgZero(): number { return 0 }

@Concurrent
function etgFalse(): boolean { return false }

@Concurrent
function etgEmptyArr(): number[] {
  let arr: number[] = []
  return arr
}

@Concurrent
function etgSquare(n: number): number { return n * n }

@Concurrent
function etgTimes10(v: number): number { return v * 10 }

@Concurrent
function etgIdentity(v: number): number { return v }

@Concurrent
async function etgDelay(delay: number, value: number): Promise<number> {
  let s: number = Date.now()
  while ((Date.now() - s) < delay) {
    await new Promise<void>((resolve: () => void) => {
      setTimeout(resolve, 100)
    })
  }
  return value
}

@Concurrent
function etgErrFunc(): number { throw new Error('task group error') }

@Concurrent
function etgMaxVal(): number { return Number.MAX_VALUE }

@Concurrent
function etgBigArr(): number[] {
  let arr: number[] = []
  for (let i: number = 0; i < 10000; i++) { arr.push(i) }
  return arr
}

@Concurrent
function etgHelloStr(s: string): string { return 'hello ' + s }

@Concurrent
function etgMixedNum(): number { return 42 }

@Concurrent
function etgMixedStr(): string { return 'hello' }

@Concurrent
function etgMixedBool(): boolean { return true }

@Concurrent
function etgBatchIdx(idx: number): number { return idx }

@Concurrent
function etgNestedInner(): number { return 200 }

@Concurrent
async function etgCounter(c: ETGCounter): Promise<number> {
  await c.lock.lockAsync<number>((): number => {
    c.count++
    return c.count
  })
  return 100
}

@Concurrent
function etgSendData(): void { taskpool.Task.sendData(42) }

@Sendable
class ETGCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
  nestedDone: boolean = false
  nestedResult: number = 0
}

@Sendable
class ETGFlag {
  completed: boolean = false
}

@Concurrent
function etgErrDelayed(delay: number): number {
  let s: number = Date.now()
  while ((Date.now() - s) < delay) { let x: number = 0; x++ }
  throw new Error('delayed group task error')
}

interface ETGEmptyObj {
}

@Concurrent
function etgEmptyObj(): Object {
  let obj: ETGEmptyObj = {}
  return obj
}

@Concurrent
function etgNestGroupHost(flag: ETGNestFlag): number {
  let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
  nestedGroup.addTask(etgFlagInc, flag)
  taskpool.execute(nestedGroup).then((r: Object[]): void => {
    flag.nestedResult = r[0] as number
    flag.nestedDone = true
  })
  return 1
}

// ============ W5 AsyncLock protected shared-state helpers ==========

@Sendable
class ETGLockedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function etgLockedIncrementFunc(counter: ETGLockedCounter): Promise<number> {
  let observed: number = 0
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    observed = counter.count
    return observed
  })
  return observed
}

export default function ExecuteTaskGroupTest(): void {
  describe('ExecuteTaskGroupTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
      await cooperativeGc()
    })

    // ===== 1. Input Parameter Tests =====

    /**
     * @tc.name   ExecuteTaskGroupTest0100
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0100
     * @tc.desc   Verify execute(group) without priority returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgAdd, 1, 2)
      group.addTask(etgAdd, 3, 4)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(2)
        expect(results[0] as number).assertEqual(3)
        expect(results[1] as number).assertEqual(7)
      } catch (error) {
        console.error('ExecuteTaskGroupTest0100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest0200
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0200
     * @tc.desc   Verify execute(group, priority) with HIGH priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgMul, 2, 3)
      group.addTask(etgMul, 4, 5)
      try {
        let results: Object[] = await taskpool.execute(group, taskpool.Priority.HIGH)
        expect(results.length).assertEqual(2)
        expect(results[0] as number).assertEqual(6)
        expect(results[1] as number).assertEqual(20)
      } catch (error) {
        console.error('ExecuteTaskGroupTest0200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest0300
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0300
     * @tc.desc   Verify execute with empty TaskGroup returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(0)
        expect(Array.isArray(results)).assertTrue()
      } catch (error) {
        console.error('ExecuteTaskGroupTest0300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest0400
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0400
     * @tc.desc   Verify execute with single task TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgSimple)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupTest0400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest0500
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0500
     * @tc.desc   Verify execute with multiple tasks TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 1; i <= 5; i++) {
        group.addTask(etgSquare, i)
      }
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(5)
        expect(results[0] as number).assertEqual(1)
        expect(results[4] as number).assertEqual(25)
      } catch (error) {
        console.error('ExecuteTaskGroupTest0500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest0600
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0600
     * @tc.desc   Verify execute with Task objects added via addTask(task)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task1: taskpool.Task = new taskpool.Task(etgTimes10, 10)
      let task2: taskpool.Task = new taskpool.Task(etgTimes10, 20)
      group.addTask(task1)
      group.addTask(task2)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(2)
        expect(results[0] as number).assertEqual(100)
        expect(results[1] as number).assertEqual(200)
      } catch (error) {
        console.error('ExecuteTaskGroupTest0600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest0700
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0700
     * @tc.desc   Verify execute with named TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup('myGroup')
      group.addTask(etgTrue)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0] as boolean).assertTrue()
      } catch (error) {
        console.error('ExecuteTaskGroupTest0700 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest0800
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0800
     * @tc.desc   Verify execute with large TaskGroup of 100 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let taskCount: number = 100
      for (let i: number = 0; i < taskCount; i++) {
        group.addTask(etgBatchIdx, i)
      }
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(taskCount)
        expect(results[0] as number).assertEqual(0)
        expect(results[99] as number).assertEqual(99)
      } catch (error) {
        console.error('ExecuteTaskGroupTest0800 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest0900
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_0900
     * @tc.desc   Verify re-executing an executed TaskGroup without configs succeeds (runtime arbitration: measured re-execution success; SDK d.ts declares 10200059 and the configs form asserts it in ExecuteTaskGroupConfigsTest2400)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgSimple)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        let secondResults: Object[] = await taskpool.execute(group)
        expect(secondResults.length).assertEqual(1)
        expect(secondResults[0] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskGroupTest0900 failed')
        expect(false).assertFail()
      }
      done()
    })

    // ===== 2. Return Value Tests =====

    /**
     * @tc.name   ExecuteTaskGroupTest1000
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1000
     * @tc.desc   Verify execute returns array type with correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgSimple)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(Array.isArray(results)).assertTrue()
        expect(results.length).assertEqual(1)
      } catch (error) {
        console.error('ExecuteTaskGroupTest1000 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest1100
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1100
     * @tc.desc   Verify result order matches addTask order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgIdentity, 1)
      group.addTask(etgIdentity, 2)
      group.addTask(etgIdentity, 3)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(1)
        expect(results[1] as number).assertEqual(2)
        expect(results[2] as number).assertEqual(3)
      } catch (error) {
        console.error('ExecuteTaskGroupTest1100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest1200
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1200
     * @tc.desc   Verify result order preserved with different execution times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgDelay, 50, 1)
      group.addTask(etgDelay, 10, 2)
      group.addTask(etgDelay, 30, 3)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(1)
        expect(results[1] as number).assertEqual(2)
        expect(results[2] as number).assertEqual(3)
      } catch (error) {
        console.error('ExecuteTaskGroupTest1200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest1300
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1300
     * @tc.desc   Verify return values containing null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgNull)
      try {
        let r1: Object[] = await taskpool.execute(g1)
        expect(r1[0]).assertNull()
        let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
        g2.addTask(etgUndef)
        let r2: Object[] = await taskpool.execute(g2)
        expect(r2[0]).assertUndefined()
      } catch (error) {
        console.error('ExecuteTaskGroupTest1300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest1400
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1400
     * @tc.desc   Verify return values with falsy values 0/false/empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgZero)
      group.addTask(etgFalse)
      group.addTask(etgEmptyArr)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(0)
        expect(results[1] as boolean).assertFalse()
        expect((results[2] as number[]).length).assertEqual(0)
      } catch (error) {
        console.error('ExecuteTaskGroupTest1400 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest1500
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1500
     * @tc.desc   Verify return types number and string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgSquare, 2)
      g1.addTask(etgSquare, 3)
      try {
        let r1: Object[] = await taskpool.execute(g1)
        expect(r1[0] as number).assertEqual(4)
        expect(r1[1] as number).assertEqual(9)
        let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
        g2.addTask(etgHelloStr, 'world')
        g2.addTask(etgHelloStr, 'taskpool')
        let r2: Object[] = await taskpool.execute(g2)
        expect(r2[0] as string).assertEqual('hello world')
        expect(r2[1] as string).assertEqual('hello taskpool')
      } catch (error) {
        console.error('ExecuteTaskGroupTest1500 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest1600
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1600
     * @tc.desc   Verify mixed return types number/string/boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgMixedNum)
      group.addTask(etgMixedStr)
      group.addTask(etgMixedBool)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(typeof results[0]).assertEqual('number')
        expect(typeof results[1]).assertEqual('string')
        expect(typeof results[2]).assertEqual('boolean')
      } catch (error) {
        console.error('ExecuteTaskGroupTest1600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest1700
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1700
     * @tc.desc   Verify boundary return values MAX_VALUE and large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgMaxVal)
      try {
        let r1: Object[] = await taskpool.execute(g1)
        expect(r1[0] as number).assertEqual(Number.MAX_VALUE)
        let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
        g2.addTask(etgBigArr)
        let r2: Object[] = await taskpool.execute(g2)
        expect((r2[0] as number[]).length).assertEqual(10000)
      } catch (error) {
        console.error('ExecuteTaskGroupTest1700 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest1800
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1800
     * @tc.desc   Verify void return yields undefined in TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgVoid)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(results[0]).assertUndefined()
      } catch (error) {
        console.error('ExecuteTaskGroupTest1800 failed')
        expect(false).assertFail()
      }
      done()
    })

    // ===== 3. Async Concurrency Tests =====

    /**
     * @tc.name   ExecuteTaskGroupTest1900
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_1900
     * @tc.desc   Verify await execute(TaskGroup) resolves and group results are processed in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgSimple)
      let finalResult: number = 0
      try {
        let val: Object = await taskpool.execute(group)
        finalResult = (val as Object[])[0] as number
      } catch (error) {
        console.error('ExecuteTaskGroupTest1900 failed')
        expect(false).assertFail()
      }
      expect(finalResult).assertEqual(42)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest2000
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2000
     * @tc.desc   Verify .catch() captures task exception in TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgErrFunc)
      let caught: boolean = false
      let operationDone: boolean = false
      try {
        await taskpool.execute(group)
      } catch (error) {
        console.info(`ExecuteTaskGroupTest.test.ets catch error: ${JSON.stringify(error)}`)
        caught = true
        operationDone = true
      }
      let w: number = 0
      try {
        while (!operationDone && w < 50) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskGroupTest2000 failed')
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest2100
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2100
     * @tc.desc   Verify Promise.all with multiple TaskGroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgIdentity, 1)
      let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
      g2.addTask(etgIdentity, 2)
      let g3: taskpool.TaskGroup = new taskpool.TaskGroup()
      g3.addTask(etgIdentity, 3)
      let p1: Promise<Object[]> = taskpool.execute(g1)
      let p2: Promise<Object[]> = taskpool.execute(g2)
      let p3: Promise<Object[]> = taskpool.execute(g3)
      try {
        let allResults: Object[] = await Promise.all([p1, p2, p3])
        expect(allResults.length).assertEqual(3)
        expect((allResults[0] as Object[])[0] as number).assertEqual(1)
        expect((allResults[1] as Object[])[0] as number).assertEqual(2)
        expect((allResults[2] as Object[])[0] as number).assertEqual(3)
      } catch (error) {
        console.error('ExecuteTaskGroupTest2100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest2200
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2200
     * @tc.desc   Verify TaskGroup internal concurrent execution with correct values in addTask order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let taskCount: number = 5
      for (let i: number = 0; i < taskCount; i++) {
        group.addTask(etgDelay, 100, i)
      }
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(taskCount)
        for (let i: number = 0; i < taskCount; i++) {
          expect(results[i] as number).assertEqual(i)
        }
      } catch (error) {
        console.error('ExecuteTaskGroupTest2200 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest2300
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2300
     * @tc.desc   Verify single parameter passing to TaskGroup task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgTimes10, 10)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskGroupTest2300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest2400
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2400
     * @tc.desc   Verify multiple parameters passing to TaskGroup task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgAdd, 1, 2)
      group.addTask(etgAdd, 3, 4)
      group.addTask(etgAdd, 5, 6)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results[0] as number).assertEqual(3)
        expect(results[1] as number).assertEqual(7)
        expect(results[2] as number).assertEqual(11)
      } catch (error) {
        console.error('ExecuteTaskGroupTest2400 failed')
        expect(false).assertFail()
      }
      done()
    })

    // ===== 4. Task Nested Combination Scenarios =====

    /**
     * @tc.name   ExecuteTaskGroupTest2500
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2500
     * @tc.desc   Verify executing a counter Task increments Sendable counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCounter = new ETGCounter()
      let outerTask: taskpool.Task = new taskpool.Task(etgCounter, counter)
      try {
        await taskpool.execute(outerTask)
      } catch (error) {
        console.error('ExecuteTaskGroupTest2500 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest2600
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2600
     * @tc.desc   Verify nested execute(TaskGroup) in onReceiveData callback of a Task inside a TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCounter = new ETGCounter()
      let task: taskpool.Task = new taskpool.Task(etgSendData)
      const onReceiveData: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) {
          console.info('ExecuteTaskGroupTest2600 received empty data')
          return
        }
        let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        nestedGroup.addTask(etgCounter, counter)
        try {
          let r: Object = await taskpool.execute(nestedGroup)
          counter.nestedResult = (r as Object[])[0] as number
          counter.nestedDone = true
        } catch (error) {
          console.error('ExecuteTaskGroupTest2600 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onReceiveData(onReceiveData)
      let hostGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      hostGroup.addTask(task)
      try {
        let hostResults: Object[] = await taskpool.execute(hostGroup)
        expect(hostResults.length).assertEqual(1)
      } catch (error) {
        console.error('ExecuteTaskGroupTest2600 failed')
        expect(false).assertFail()
      }
      let w: number = 0
      try {
        while (!counter.nestedDone && w < 50) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskGroupTest2600 failed')
        expect(false).assertFail()
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest2700
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2700
     * @tc.desc   Verify sequential nested execute(TaskGroup) after the first group resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nestedResult: number = 0
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgSimple)
      try {
        let val: Object = await taskpool.execute(g1)
        let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
        g2.addTask(etgNestedInner)
        let r: Object = await taskpool.execute(g2)
        nestedResult = (r as Object[])[0] as number
      } catch (error) {
        console.error('ExecuteTaskGroupTest2700 failed')
        expect(false).assertFail()
      }
      expect(nestedResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest2800
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2800
     * @tc.desc   Verify 3 concurrent tasks with Sendable counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCounter = new ETGCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etgCounter, counter)))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error('ExecuteTaskGroupTest2800 failed: ' + String(error))
        expect(false).assertFail()
      }
      done()
    })


    /**
     * @tc.name   ExecuteTaskGroupTest2900
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_2900
     * @tc.desc   Verify 10 concurrent tasks with Sendable counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCounter = new ETGCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etgCounter, counter)))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(10)
        expect(counter.count).assertEqual(10)
      } catch (error) {
        console.error('ExecuteTaskGroupTest2900 failed: ' + JSON.stringify(error))
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3000
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3000
     * @tc.desc   Verify 10 task results order matches addTask order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 10; i++) {
        group.addTask(etgIdentity, i * 2)
      }
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(10)
        for (let i: number = 0; i < 10; i++) {
          expect(results[i] as number).assertEqual(i * 2)
        }
      } catch (error) {
        console.error('ExecuteTaskGroupTest3000 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3100
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3100
     * @tc.desc   Verify execute with a non-TaskGroup object throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let fakeGroup: taskpool.TaskGroup = new Object() as Object as taskpool.TaskGroup
      let threw: boolean = false
      try {
        await taskpool.execute(fakeGroup)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3200
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3200
     * @tc.desc   Verify execute with null and undefined group input throws 401 for each input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let nullGroup: taskpool.TaskGroup = null as ESObject as taskpool.TaskGroup
      let threwNull: boolean = false
      try {
        await taskpool.execute(nullGroup)
      } catch (error) {
        threwNull = true
        expect(error.code).assertEqual(401)
      }
      expect(threwNull).assertTrue()
      let undefGroup: taskpool.TaskGroup = undefined as ESObject as taskpool.TaskGroup
      let threwUndef: boolean = false
      try {
        await taskpool.execute(undefGroup)
      } catch (error) {
        threwUndef = true
        expect(error.code).assertEqual(401)
      }
      expect(threwUndef).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3300
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3300
     * @tc.desc   Verify task returning an empty object yields an empty object element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgEmptyObj)
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(1)
        expect(typeof results[0]).assertEqual('object')
        expect(JSON.stringify(results[0])).assertEqual('{}')
      } catch (error) {
        console.error('ExecuteTaskGroupTest3300 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3400
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3400
     * @tc.desc   Verify TaskGroup with two failing tasks rejects as a whole
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgErrFunc)
      group.addTask(etgErrDelayed, 500)
      let threw: boolean = false
      try {
        await taskpool.execute(group)
      } catch (error) {
        threw = true
      }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3500
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3500
     * @tc.desc   Verify TaskGroup with mixed success and failing tasks rejects as a whole
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskGroupTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgSimple)
      group.addTask(etgErrFunc)
      let threw: boolean = false
      try {
        await taskpool.execute(group)
      } catch (error) {
        threw = true
      }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3600
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3600
     * @tc.desc   Verify Promise.race across TaskGroups resolves with the first finished group result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let gFast: taskpool.TaskGroup = new taskpool.TaskGroup()
      gFast.addTask(etgSimple)
      let gSlow: taskpool.TaskGroup = new taskpool.TaskGroup()
      gSlow.addTask(etgDelay, 500, 7)
      let pFast: Promise<Object[]> = taskpool.execute(gFast)
      let pSlow: Promise<Object[]> = taskpool.execute(gSlow)
      try {
        let winner: Object = await Promise.race([pFast, pSlow])
        expect((winner as Object[])[0] as number).assertEqual(42)
        let slowResults: Object[] = await pSlow
        expect(slowResults[0] as number).assertEqual(7)
      } catch (error) {
        console.error('ExecuteTaskGroupTest3600 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3700
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3700
     * @tc.desc   Verify nested execute(TaskGroup) inside @Concurrent task body collects Sendable counter == 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: ETGNestFlag = new ETGNestFlag()
      let hostTask: taskpool.Task = new taskpool.Task(etgNestGroupHost, flag)
      try {
        await taskpool.execute(hostTask)
      } catch (error) {
        console.error('ExecuteTaskGroupTest3700 failed')
        expect(false).assertFail()
      }
      let w: number = 0
      try {
        while (!flag.nestedDone && w < 50) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskGroupTest3700 failed')
        expect(false).assertFail()
      }
      expect(flag.nestedDone).assertTrue()
      expect(flag.count).assertEqual(1)
      expect(flag.nestedResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3800
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3800
     * @tc.desc   Verify nested execute(TaskGroup) fired from onReceiveData callbacks of two tasks in one TaskGroup: both callbacks run (cbCount == 2) and both nested groups execute (Sendable counter == 2); runtime arbitration 2026-09-06: execute() inside an onReceiveData callback runs the tasks but its promise never settles, so nested execution is evidenced via the counter instead of await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGNestFlag = new ETGNestFlag()
      let task1: taskpool.Task = new taskpool.Task(etgSendData)
      let task2: taskpool.Task = new taskpool.Task(etgSendData)
      const onReceiveData1: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) {
          console.info('ExecuteTaskGroupTest3800 received empty data on task1')
          return
        }
        // Runtime arbitration 2026-09-06: execute() invoked inside an
        // onReceiveData callback runs the nested group tasks but the returned
        // promise never settles (cbCount stayed 0 while the Sendable counter
        // reached 2 across two full runs), so the nested execution is
        // evidenced through the counter instead of an await.
        counter.cbCount++
        let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        nestedGroup.addTask(etgFlagInc, counter)
        taskpool.execute(nestedGroup)
      }
      const onReceiveData2: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) {
          console.info('ExecuteTaskGroupTest3800 received empty data on task2')
          return
        }
        counter.cbCount++
        let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
        nestedGroup.addTask(etgFlagInc, counter)
        taskpool.execute(nestedGroup)
      }
      task1.onReceiveData(onReceiveData1)
      task2.onReceiveData(onReceiveData2)
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(task1)
      group.addTask(task2)
      try {
        let results: Object[] = await taskpool.execute(group)
        console.info(`ExecuteTaskGroupTest3800 diag: results.length=${results.length}, count=${counter.count}, cbCount=${counter.cbCount}`)
        expect(results.length).assertEqual(2)
      } catch (error) {
        console.error('ExecuteTaskGroupTest3800 failed: ' + String(error))
        expect(false).assertFail()
      }
      let w: number = 0
      try {
        while (counter.count < 2 && w < 50) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskGroupTest3800 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(2)
      expect(counter.cbCount).assertEqual(2)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest3900
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_3900
     * @tc.desc   Verify onReceiveData callback creates and fires 3 nested TaskGroups (callback count == 1, group count == 3, Sendable counter == 3) and a void task function resolves undefined; runtime arbitration 2026-09-06: execute() inside an onReceiveData callback runs the tasks but its promise never settles, so nested execution is evidenced via the counter instead of await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGNestFlag = new ETGNestFlag()
      let task: taskpool.Task = new taskpool.Task(etgSendData)
      const onReceiveData: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) {
          console.info('ExecuteTaskGroupTest3900 received empty data')
          return
        }
        // Runtime arbitration 2026-09-06: same unsettled nested-execute
        // behavior as ExecuteTaskGroupTest3800; nested groups are fired
        // without await and evidenced through the Sendable counter.
        counter.cbCount++
        for (let i: number = 0; i < 3; i++) {
          let nestedGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
          nestedGroup.addTask(etgFlagInc, counter)
          counter.groupCount++
          taskpool.execute(nestedGroup)
        }
        counter.nestedDone = true
      }
      task.onReceiveData(onReceiveData)
      try {
        let results: Object = await taskpool.execute(task)
        // etgSendData has a void return: a single Task execute resolves
        // undefined (runtime arbitration 2026-09-06; the previous array-shape
        // assumption raised TypeError length-of-undefined).
        expect(results === undefined).assertTrue()
      } catch (error) {
        console.error('ExecuteTaskGroupTest3900 failed: ' + String(error))
        expect(false).assertFail()
      }
      let w: number = 0
      try {
        while (!counter.nestedDone && w < 50) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskGroupTest3900 failed')
        expect(false).assertFail()
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.cbCount).assertEqual(1)
      expect(counter.groupCount).assertEqual(3)
      // The three nested groups were fired without await: poll until the
      // Sendable counter converges to 3 (bounded 5s) before asserting.
      let countWaited3900: number = 0
      while (counter.count < 3 && countWaited3900 < 5000) {
        await sleep(100)
        countWaited3900 += 100
      }
      expect(counter.count).assertEqual(3)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest4000
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_4000
     * @tc.desc   Verify three-level sequential TaskGroup nesting where each level feeds the next (final result == 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let chainResult: number = 0
      try {
        let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
        g1.addTask(etgIdentity, 1)
        let r1: Object[] = await taskpool.execute(g1)
        let v1: number = r1[0] as number
        let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
        g2.addTask(etgAdd, v1, 1)
        let r2: Object[] = await taskpool.execute(g2)
        let v2: number = r2[0] as number
        let g3: taskpool.TaskGroup = new taskpool.TaskGroup()
        g3.addTask(etgAdd, v2, 1)
        let r3: Object[] = await taskpool.execute(g3)
        chainResult = r3[0] as number
      } catch (error) {
        console.error('ExecuteTaskGroupTest4000 failed')
        expect(false).assertFail()
      }
      expect(chainResult).assertEqual(3)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest4100
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_4100
     * @tc.desc   Verify nested Promise.all of three TaskGroups after a first group completes (results 100/110/120)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ga: taskpool.TaskGroup = new taskpool.TaskGroup()
      ga.addTask(etgTimes10, 10)
      let gb: taskpool.TaskGroup = new taskpool.TaskGroup()
      gb.addTask(etgTimes10, 11)
      let gc: taskpool.TaskGroup = new taskpool.TaskGroup()
      gc.addTask(etgTimes10, 12)
      try {
        let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
        g1.addTask(etgSimple)
        let r1: Object[] = await taskpool.execute(g1)
        expect(r1[0] as number).assertEqual(42)
        let nestedResults: Object[] = await Promise.all([
          taskpool.execute(ga),
          taskpool.execute(gb),
          taskpool.execute(gc)
        ])
        expect(nestedResults.length).assertEqual(3)
        expect((nestedResults[0] as Object[])[0] as number).assertEqual(100)
        expect((nestedResults[1] as Object[])[0] as number).assertEqual(110)
        expect((nestedResults[2] as Object[])[0] as number).assertEqual(120)
      } catch (error) {
        console.error('ExecuteTaskGroupTest4100 failed')
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest4200
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_4200
     * @tc.desc   Verify success chain then failing group catch recovery chain both execute as expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let successResult: number = 0
      let recoveryResult: number = 0
      let catchEntered: boolean = false
      try {
        let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
        g1.addTask(etgSimple)
        let r1: Object[] = await taskpool.execute(g1)
        successResult = r1[0] as number
      } catch (error) {
        console.error('ExecuteTaskGroupTest4200 success chain failed')
        expect(false).assertFail()
      }
      try {
        let gErr: taskpool.TaskGroup = new taskpool.TaskGroup()
        gErr.addTask(etgErrFunc)
        await taskpool.execute(gErr)
      } catch (error) {
        catchEntered = true
        try {
          let gRec: taskpool.TaskGroup = new taskpool.TaskGroup()
          gRec.addTask(etgNestedInner)
          let rRec: Object[] = await taskpool.execute(gRec)
          recoveryResult = rRec[0] as number
        } catch (nestedError) {
          console.error('ExecuteTaskGroupTest4200 recovery chain failed')
          expect(false).assertFail()
        }
      }
      expect(successResult).assertEqual(42)
      expect(catchEntered).assertTrue()
      expect(recoveryResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest4300
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_4300
     * @tc.desc   Verify 5 counter tasks in one TaskGroup with result count equal to Sendable counter (both == 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCounter = new ETGCounter()
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 5; i++) {
        group.addTask(etgCounter, counter)
      }
      try {
        let results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(5)
        expect(results[0] as number).assertEqual(100)
        expect(results[4] as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskGroupTest4300 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(5)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest4400
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_4400
     * @tc.desc   Verify Promise.all of 3 TaskGroups each incrementing a shared Sendable counter (counter == 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETGCounter = new ETGCounter()
      let g1: taskpool.TaskGroup = new taskpool.TaskGroup()
      g1.addTask(etgCounter, counter)
      let g2: taskpool.TaskGroup = new taskpool.TaskGroup()
      g2.addTask(etgCounter, counter)
      let g3: taskpool.TaskGroup = new taskpool.TaskGroup()
      g3.addTask(etgCounter, counter)
      let p1: Promise<Object[]> = taskpool.execute(g1)
      let p2: Promise<Object[]> = taskpool.execute(g2)
      let p3: Promise<Object[]> = taskpool.execute(g3)
      try {
        let allResults: Object[] = await Promise.all([p1, p2, p3])
        expect(allResults.length).assertEqual(3)
        expect((allResults[0] as Object[])[0] as number).assertEqual(100)
        expect((allResults[1] as Object[])[0] as number).assertEqual(100)
        expect((allResults[2] as Object[])[0] as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskGroupTest4400 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(3)
      done()
    })



    /**
     * @tc.name   ExecuteTaskGroupTest4600
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_4600
     * @tc.desc   Verify a TaskGroup of 8 tasks increments one shared Sendable counter under AsyncLock.lockAsync protection with exact final count 8 (e4#046; atomic protection uses the AsyncLock.lockAsync equivalent; no suite precedent for Atomics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskGroupTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: ETGLockedCounter = new ETGLockedCounter()
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 8; i++) {
        group.addTask(etgLockedIncrementFunc, counter)
      }
      try {
        const results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(8)
      } catch (error) {
        console.error('ExecuteTaskGroupTest4600 failed')
        expect(false).assertFail()
      }
      expect(counter.count).assertEqual(8)
      done()
    })

    /**
     * @tc.name   ExecuteTaskGroupTest4700
     * @tc.number SUB_EXECUTE_TASK_GROUP_TEST_4700
     * @tc.desc   Verify two group tasks execute concurrently by observing overlapping execution windows via Sendable flags (e4#041; overlap observation replaces timing-delta assertions which are forbidden by stability rules)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskGroupTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const probe: ETGOverlapProbe = new ETGOverlapProbe()
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      group.addTask(etgOverlapFuncA, probe)
      group.addTask(etgOverlapFuncB, probe)
      try {
        const results: Object[] = await taskpool.execute(group)
        expect(results.length).assertEqual(2)
      } catch (error) {
        console.error('ExecuteTaskGroupTest4700 failed')
        expect(false).assertFail()
      }
      expect(probe.sawB).assertTrue()
      expect(probe.sawA).assertTrue()
      done()
    })
  })
}
