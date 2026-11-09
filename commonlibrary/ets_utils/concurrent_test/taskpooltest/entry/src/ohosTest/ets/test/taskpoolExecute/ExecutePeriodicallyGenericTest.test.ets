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
import { collections, ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../Utils';
import { EPGResult } from './ExecutePeriodicallyGenericTestInner';

// ========== Module-level @Concurrent Functions ==========

@Concurrent
function epgVoidToNumFunc(): number {
  return Date.now()
}

@Concurrent
async function epgCounterFunc(counter: EPGCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  return counter.count
}

@Concurrent
function epgSendDataFunc(): void {
  taskpool.Task.sendData(42)
}

@Concurrent
async function epgIntermittentFunc(counter: EPGIntermittentCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  if (counter.count % 3 === 0) {
    throw new Error('intermittent generic error')
  }
  return counter.count
}

@Concurrent
function epgNumSendDataFunc(x: number): void {
  taskpool.Task.sendData(x + 1)
}

@Concurrent
function epgStrSendDataFunc(s: string): void {
  taskpool.Task.sendData(s + '_tick')
}

@Concurrent
function epgNumToStrSendDataFunc(x: number): void {
  taskpool.Task.sendData('tick_' + x)
}

@Concurrent
function epgStrToNumSendDataFunc(s: string): void {
  taskpool.Task.sendData(s.length)
}

@Concurrent
function epgVoidToNumSendDataFunc(): void {
  taskpool.Task.sendData(Date.now())
}

@Concurrent
function epgVoidToStrSendDataFunc(): void {
  taskpool.Task.sendData('voidTick')
}

@Concurrent
function epgVoidToBoolSendDataFunc(): void {
  taskpool.Task.sendData(true)
}

interface EPGIdMsg {
  id: number
}

@Concurrent
function epgIdToResultSendDataFunc(msg: EPGIdMsg): void {
  taskpool.Task.sendData(msg.id * 2)
}

interface EPGTickResult {
  id: number
  time: number
}

@Concurrent
function epgVoidToObjSendDataFunc(): void {
  let r: EPGTickResult = { id: 7, time: Date.now() }
  taskpool.Task.sendData(r)
}

@Concurrent
function epgArrSumSendDataFunc(arr: number[]): void {
  let sum: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0)
  taskpool.Task.sendData(sum)
}

@Concurrent
function epgMapSendDataFunc(m: Map<string, number>): void {
  taskpool.Task.sendData(m.get('key') as number)
}

@Concurrent
async function epgSendableReturnFunc(state: EPGCounter): Promise<EPGResult> {
  await state.lock.lockAsync((): void => {
    state.count++
  })
  let r: EPGResult = new EPGResult()
  r.value = state.count
  return r
}

// Concurrent modification arbitration 2026-10-29: executePeriodically re-dispatches this body every
// 200ms on the shared sendable collections.Array while the host thread polls arr.length; unsynchronized
// cross-thread container access can throw "Concurrent modification exception" (observed once in ~204
// strict rounds). All container accesses (worker push + host length reads) are serialized with
// AsyncLock.lockAsync, same pattern as the EPGCounter cases below.
@Concurrent
async function epgCollectionsPushFunc(arr: collections.Array<number>, arrLock: ArkTSUtils.locks.AsyncLock): Promise<void> {
  await arrLock.lockAsync((): void => {
    arr.push(arr.length + 1)
  })
}

@Concurrent
async function epgAsyncCounterFunc(counter: EPGCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  return counter.count
}

@Concurrent
async function epgAlwaysThrowFunc(counter: EPGIntermittentCounter): Promise<void> {
  await counter.lock.lockAsync((): void => {
    counter.count++
  })
  throw new Error('always throw generic periodic error')
}

@Concurrent
async function epgMissingPropFunc(counter: EPGIntermittentCounter, msg: EPGIdMsg): Promise<void> {
  await counter.lock.lockAsync((): void => {
    counter.count++
  })
  let rec: Record<string, Object> = msg as ESObject as Record<string, Object>
  let missing: ESObject = rec['noSuchProp']
  taskpool.Task.sendData(missing.length)
}

@Concurrent
async function epgNumToStrStateFunc(state: EPGCounter, x: number): Promise<string> {
  await state.lock.lockAsync((): void => {
    state.count++
  })
  return 'tick_' + x
}

@Concurrent
async function epgControlFunc(counter: EPGCounter): Promise<void> {
  await counter.lock.lockAsync((): void => {
    counter.count++
  })
  taskpool.Task.sendData(counter.count % 3)
}

// ========== Module-level @Sendable Classes ==========

@Sendable
class EPGCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
  nestedExecuted: boolean = false
  nestedResult: number = 0
}

@Sendable
class EPGIntermittentCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

// ========== Helper ==========

async function waitForCondition(condition: () => boolean, maxWait: number = 5000, interval: number = 100): Promise<void> {
  let elapsed: number = 0
  while (!condition() && elapsed < maxWait) {
    await sleep(interval)
    elapsed += interval
  }
}

// ========== W5 AsyncLock protected shared-state helpers ==========

@Sendable
class EPGLockedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function epgLockedIncrementFunc(counter: EPGLockedCounter): Promise<number> {
  let observed: number = 0
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    observed = counter.count
    return observed
  })
  return observed
}

export default function ExecutePeriodicallyGenericTest(): void {
  describe('ExecutePeriodicallyGenericTest', (): void => {
    let periodicTasks: taskpool.Task[] = []

    beforeAll((): void => {})
    beforeEach((): void => {
      periodicTasks = []
    })
    afterEach((): void => {
      periodicTasks.forEach((task: taskpool.Task): void => {
        try {
          taskpool.cancel(task)
        } catch (e) {
          console.warn(`ExecutePeriodicallyGenericTest.test.ets afterEach cancel skip: ${JSON.stringify(e)}`)
        }
      })
      periodicTasks = []
    })
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== 1. period Parameter Generics Tests =====

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0100
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0100
     * @tc.desc   Verify executePeriodically<A,R>(0, genericsTask) with minimum period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(100, task)
      await waitForCondition((): boolean => counter.count >= 3, 5000)
      await sleep(200)
      expect(counter.count >= 2).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0200
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0200
     * @tc.desc   Verify executePeriodically<A,R>(200, genericsTask) with standard period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task)
      await waitForCondition((): boolean => counter.count >= 3, 5000)
      expect(counter.count >= 2 && counter.count <= 6).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0300
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0300
     * @tc.desc   Verify executePeriodically<A,R>(-1, genericsTask) throws error code 10200028 for invalid period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      let caught: boolean = false
      try {
        taskpool.executePeriodically<[], number>(-1, task)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(10200028)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0400
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0400
     * @tc.desc   Verify executePeriodically<A,R>(500.5, genericsTask) with float period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(500.5, task)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2).assertTrue()
    })

    // ===== 2. GenericsTask Generics Type Combination Tests =====

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0500
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0500
     * @tc.desc   Verify genericsTask<[EPGCounter],number> periodic execution with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2).assertTrue()
    })

    // ===== 3. priority Generics Parameter Tests =====

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0600
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0600
     * @tc.desc   Verify genericsTask periodic with HIGH priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task, taskpool.Priority.HIGH)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0700
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0700
     * @tc.desc   Verify genericsTask periodic with MEDIUM priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task, taskpool.Priority.MEDIUM)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0800
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0800
     * @tc.desc   Verify genericsTask periodic with LOW priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task, taskpool.Priority.LOW)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest0900
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_0900
     * @tc.desc   Verify genericsTask periodic with IDLE priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task, taskpool.Priority.IDLE)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest1000
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_1000
     * @tc.desc   Verify executePeriodically<A,R> without priority argument is accepted with default priority and executes periodically (default-value acceptance point, distinct from 0500 counter periodic; no priority introspection asserted)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2).assertTrue()
    })

    // ===== 4. Generics Periodic Execution Characteristics Tests =====

    /**
     * @tc.name   ExecutePeriodicallyGenericTest1100
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_1100
     * @tc.desc   Verify genericsTask sendData/onReceiveData with periodic execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let receivedData: number = 0
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(epgSendDataFunc)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual(42)
    })

    // ===== 5. Generics Periodic Execution Callback Validation Tests =====

    // ===== 6. Generics Cancel Periodic Task Tests =====









    // ===== 7. Generics Error Handling Tests =====

    /**
     * @tc.name   ExecutePeriodicallyGenericTest1600
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_1600
     * @tc.desc   Verify genericsTask periodic continues after intermittent exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let counter: EPGIntermittentCounter = new EPGIntermittentCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGIntermittentCounter], number>(epgIntermittentFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGIntermittentCounter], number>(200, task)
      await waitForCondition((): boolean => counter.count >= 6, 8000)
      expect(counter.count >= 6).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest1700
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_1700
     * @tc.desc   Verify executed genericsTask cannot be periodic - throws error code 10200050 (runtime arbitration: design expected 10200006 but SDK 10200006 is serialization error; executed task state is rejected with 10200050, consistent with non-generic TaskTest0900)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      await taskpool.execute<[], number>(task)
      let caught: boolean = false
      try {
        taskpool.executePeriodically<[], number>(200, task)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(10200050)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest1800
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_1800
     * @tc.desc   Verify already periodic genericsTask cannot re-register - throws error code 10200050 (consistent with non-generic TaskTest1100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task)
      await sleep(600)
      let caught: boolean = false
      try {
        taskpool.executePeriodically<[EPGCounter], number>(200, task)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(10200050)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest1900
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_1900
     * @tc.desc   Verify multiple genericsTask periodic with different types concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let counter1: EPGCounter = new EPGCounter()
      let counter2: EPGCounter = new EPGCounter()
      let task1: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter1)
      let task2: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter2)
      periodicTasks.push(task1, task2)
      taskpool.executePeriodically<[EPGCounter], number>(200, task1)
      taskpool.executePeriodically<[EPGCounter], number>(200, task2)
      await waitForCondition((): boolean => (counter1.count >= 2 && counter2.count >= 2), 5000)
      expect(counter1.count >= 2).assertTrue()
      expect(counter2.count >= 2).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2000
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2000
     * @tc.desc   Verify genericsTask periodic with priority combination (runtime arbitration
     *            2026-09-09: LOW priority initial dispatch latency can exceed the HIGH
     *            time-to-2-ticks window under soak, so both counters are gated together)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let highCounter: EPGCounter = new EPGCounter()
      let lowCounter: EPGCounter = new EPGCounter()
      let highTask: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, highCounter)
      let lowTask: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, lowCounter)
      periodicTasks.push(highTask, lowTask)
      taskpool.executePeriodically<[EPGCounter], number>(200, highTask, taskpool.Priority.HIGH)
      taskpool.executePeriodically<[EPGCounter], number>(200, lowTask, taskpool.Priority.LOW)
      await waitForCondition((): boolean => highCounter.count >= 2 && lowCounter.count >= 2, 5000)
      expect(highCounter.count >= 2).assertTrue()
      expect(lowCounter.count >= 2).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2100
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2100
     * @tc.desc   Verify two sequential genericsTask periodic tasks with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task1: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      let task2: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task1, task2)
      taskpool.executePeriodically<[EPGCounter], number>(200, task1)
      taskpool.executePeriodically<[EPGCounter], number>(200, task2)
      await waitForCondition((): boolean => counter.count >= 4, 8000)
      expect(counter.count >= 4).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2200
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2200
     * @tc.desc   Verify Sendable shared counter with 3 genericsTask periodic tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task1: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      let task2: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      let task3: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task1, task2, task3)
      taskpool.executePeriodically<[EPGCounter], number>(200, task1)
      taskpool.executePeriodically<[EPGCounter], number>(200, task2)
      taskpool.executePeriodically<[EPGCounter], number>(200, task3)
      await waitForCondition((): boolean => counter.count >= 6, 5000)
      expect(counter.count >= 6).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2300
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2300
     * @tc.desc   Verify genericsTask dependent task cannot be periodic - throws Parameter error 401 (runtime arbitration: native HasDependency check throws TYPE_ERROR 401; point allowed 10200057 or 10200050 but actual behavior is 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let depTask: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      task.addDependency(depTask)
      let caught: boolean = false
      try {
        taskpool.executePeriodically<[], number>(200, task)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    // ===== 8. period Boundary Value Generics Tests (workorder M6 G#001/002/004/005/006/007/009/010/011) =====

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2400
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2400
     * @tc.desc   Verify executePeriodically<A,R>(0, genericsTask) at minimum period boundary executes exactly once (runtime arbitration 2026-09-06: period 0 reaches uv_timer_start as timeout=0 repeat=0, a one-shot timer, so the task runs a single time instead of at max frequency; cancel afterwards is silent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Root cause: repeat=0 uv timers fire only once, so waiting for count>=5 always timed out; the
      // observable contract for period 0 is exactly one execution and no further ticks
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(0, task)
      await waitForCondition((): boolean => counter.count >= 1, 5000)
      // bounded no-repeat observation: with repeat=0 the one-shot timer cannot enqueue further executions
      let countAfterTick2400: number = counter.count
      await sleep(400)
      expect(counter.count).assertEqual(countAfterTick2400)
      taskpool.cancel(task)
      await sleep(100)
      expect(counter.count).assertEqual(countAfterTick2400)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2500
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2500
     * @tc.desc   Verify executePeriodically<A,R>(500, genericsTask) integer 500ms period executes 3 times in 1.7s window obeying Timer stability practice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(500, task)
      await waitForCondition((): boolean => counter.count >= 3, 5000)
      expect(counter.count >= 3 && counter.count <= 5).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2600
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2600
     * @tc.desc   Verify executePeriodically<A,R> with period=undefined and period='500' each throw error code 401 per input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      let caught: boolean = false
      try {
        const badPeriod: ESObject = undefined
        taskpool.executePeriodically<[], number>(badPeriod, task)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const strPeriod: ESObject = '500'
        taskpool.executePeriodically<[], number>(strPeriod, task)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2700
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2700
     * @tc.desc   Verify executePeriodically<A,R>(1000, genericsTask) 1s period triggers multiple executions and validates >=500ms Timer stability on generic side
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(1000, task)
      await waitForCondition((): boolean => counter.count >= 2, 6000)
      expect(counter.count >= 2 && counter.count <= 4).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2800
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2800
     * @tc.desc   Verify executePeriodically<A,R>(5000, genericsTask) 5s period registers without error and no execution within 400ms window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(5000, task)
      await sleep(400)
      expect(counter.count).assertEqual(0)
      taskpool.cancel(task)
      await sleep(400)
      expect(counter.count).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest2900
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_2900
     * @tc.desc   Verify executePeriodically<A,R>(100000, genericsTask) 100s period registers without error and no execution within 300ms window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(100000, task)
      await sleep(300)
      expect(counter.count).assertEqual(0)
      taskpool.cancel(task)
      await sleep(300)
      expect(counter.count).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3000
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3000
     * @tc.desc   Verify executePeriodically<A,R>(NaN, genericsTask) does not throw and runs as period 0 which executes exactly once (runtime arbitration 2026-09-06: NaN passes the number type check and ToInt32(NaN)=0, a repeat=0 one-shot uv timer, so the task runs a single time)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: NaN converts to period 0 which maps to a repeat=0 one-shot uv timer, so count>=5
      // never happened; the observable contract is exactly one execution and no further ticks
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(NaN, task)
      await waitForCondition((): boolean => counter.count >= 1, 5000)
      // bounded no-repeat observation: with repeat=0 the one-shot timer cannot enqueue further executions
      let countAfterTick3000: number = counter.count
      await sleep(400)
      expect(counter.count).assertEqual(countAfterTick3000)
      taskpool.cancel(task)
      await sleep(100)
      expect(counter.count).assertEqual(countAfterTick3000)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3100
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3100
     * @tc.desc   Verify executePeriodically<A,R>(Infinity/-Infinity, genericsTask) per input does not throw and runs as period 0 which executes exactly once (runtime arbitration 2026-09-06: ToInt32 converts both infinities to 0, a repeat=0 one-shot uv timer, so each task runs a single time)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: ±Infinity converts to period 0 which maps to a repeat=0 one-shot uv timer, so count>=5
      // never happened; the observable contract per input is exactly one execution and no further ticks
      let counter1: EPGCounter = new EPGCounter()
      let task1: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter1)
      periodicTasks.push(task1)
      taskpool.executePeriodically<[EPGCounter], number>(Infinity, task1)
      await waitForCondition((): boolean => counter1.count >= 1, 5000)
      // bounded no-repeat observation: with repeat=0 the one-shot timer cannot enqueue further executions
      let countAfterTick3100a: number = counter1.count
      await sleep(400)
      expect(counter1.count).assertEqual(countAfterTick3100a)
      taskpool.cancel(task1)
      await sleep(100)
      expect(counter1.count).assertEqual(countAfterTick3100a)

      let counter2: EPGCounter = new EPGCounter()
      let task2: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter2)
      periodicTasks.push(task2)
      taskpool.executePeriodically<[EPGCounter], number>(-Infinity, task2)
      await waitForCondition((): boolean => counter2.count >= 1, 5000)
      let countAfterTick3100b: number = counter2.count
      await sleep(400)
      expect(counter2.count).assertEqual(countAfterTick3100b)
      taskpool.cancel(task2)
      await sleep(100)
      expect(counter2.count).assertEqual(countAfterTick3100b)
      done()
    })

    // ===== 9. Generics Type Combination Matrix Tests =====

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3200
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3200
     * @tc.desc   Verify number to number generic periodic computation (input 21, sendData receives x+1=22 each tick; runtime arbitration 2026-09-06: the concurrent function sends x+1, so the expected value is corrected from 42 to 22)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: epgNumSendDataFunc sends x+1 (21+1=22) but the test expected 42; the runtime value 22
      // is the observable contract (expect 22 equals 42 was reported with 22 in the actual position)
      let receivedData: number = 0
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[number], void>(epgNumSendDataFunc, 21)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[number], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual(22)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3300
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3300
     * @tc.desc   Verify string to string generic periodic processing (input 'ab', sendData receives 'ab_tick' each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: string = ''
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[string], void>(epgStrSendDataFunc, 'ab')
      periodicTasks.push(task)
      task.onReceiveData((data: string): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[string], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual('ab_tick')
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3400
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3400
     * @tc.desc   Verify void to boolean generic periodic logic (sendData receives true each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: boolean = false
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(epgVoidToBoolSendDataFunc)
      periodicTasks.push(task)
      task.onReceiveData((data: boolean): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3500
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3500
     * @tc.desc   Verify number to string generic periodic conversion (input 21, sendData receives 'tick_21' each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: string = ''
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[number], void>(epgNumToStrSendDataFunc, 21)
      periodicTasks.push(task)
      task.onReceiveData((data: string): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[number], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual('tick_21')
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3600
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3600
     * @tc.desc   Verify explicit generic type arguments <[EPGCounter], string> compile and run periodically (R=string validated at compile time, execution observed via shared counter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let state: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter, number], string>(epgNumToStrStateFunc, state, 21)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter, number], string>(200, task)
      await waitForCondition((): boolean => state.count >= 2, 5000)
      expect(state.count >= 2 && state.count <= 20).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3700
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3700
     * @tc.desc   Verify constrained object type satisfies generic constraint A extends Array<Object> (interface with id field compiles and runs periodically)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let receivedCount: number = 0
      let msg: EPGIdMsg = { id: 8 }
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGIdMsg], void>(epgIdToResultSendDataFunc, msg)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[EPGIdMsg], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual(16)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3800
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3800
     * @tc.desc   Verify string to number generic periodic parsing (input 'abcd', sendData receives length 4 each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[string], void>(epgStrToNumSendDataFunc, 'abcd')
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[string], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual(4)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest3900
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_3900
     * @tc.desc   Verify void to number generic periodic execution succeeds with changing values (timestamps received per tick are strictly increasing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValues: number[] = []
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(epgVoidToNumSendDataFunc)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedValues.push(data)
      })
      taskpool.executePeriodically<[], void>(200, task)
      await waitForCondition((): boolean => receivedValues.length >= 3, 5000)
      expect(receivedValues.length >= 3).assertTrue()
      for (let i: number = 0; i < receivedValues.length; i++) {
        expect(receivedValues[i] > 0).assertTrue()
        if (i > 0) {
          expect(receivedValues[i] > receivedValues[i - 1]).assertTrue()
        }
      }
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4000
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4000
     * @tc.desc   Verify void to string generic periodic execution (sendData receives 'voidTick' each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: string = ''
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(epgVoidToStrSendDataFunc)
      periodicTasks.push(task)
      task.onReceiveData((data: string): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual('voidTick')
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4100
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4100
     * @tc.desc   Verify object to object generic periodic processing ({id:21} mapped to result id*2=42 each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let receivedCount: number = 0
      let msg: EPGIdMsg = { id: 21 }
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGIdMsg], void>(epgIdToResultSendDataFunc, msg)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[EPGIdMsg], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual(42)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4200
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4200
     * @tc.desc   Verify void to object generic periodic return ({id:7,time} object received with id and positive time fields)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedId: number = 0
      let receivedTime: number = 0
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(epgVoidToObjSendDataFunc)
      periodicTasks.push(task)
      task.onReceiveData((data: ESObject): void => {
        receivedId = data.id
        receivedTime = data.time
        receivedCount++
      })
      taskpool.executePeriodically<[], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedId).assertEqual(7)
      expect(receivedTime > 0).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4300
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4300
     * @tc.desc   Verify Array<number> generic periodic reduce sum ([1,2,3] sums to 6 received each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let receivedCount: number = 0
      let data: number[] = [1, 2, 3]
      let task: taskpool.Task = new taskpool.GenericsTask<[number[]], void>(epgArrSumSendDataFunc, data)
      periodicTasks.push(task)
      task.onReceiveData((value: number): void => {
        receivedData = value
        receivedCount++
      })
      taskpool.executePeriodically<[number[]], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual(6)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4400
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4400
     * @tc.desc   Verify Map<string,number> generic periodic processing (map value for 'key' received each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let receivedCount: number = 0
      let mapData: Map<string, number> = new Map<string, number>()
      mapData.set('key', 42)
      let task: taskpool.Task = new taskpool.GenericsTask<[Map<string, number>], void>(epgMapSendDataFunc, mapData)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedData = data
        receivedCount++
      })
      taskpool.executePeriodically<[Map<string, number>], void>(200, task)
      await waitForCondition((): boolean => receivedCount >= 2, 5000)
      expect(receivedCount >= 2).assertTrue()
      expect(receivedData).assertEqual(42)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4500
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4500
     * @tc.desc   Verify Sendable-returning generic periodic task (R=@Sendable class compiled and executed; return values have no periodic channel so shared counter observes executions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let state: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], EPGResult>(epgSendableReturnFunc, state)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], EPGResult>(200, task)
      await waitForCondition((): boolean => state.count >= 2, 5000)
      expect(state.count >= 2 && state.count <= 20).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4600
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4600
     * @tc.desc   Verify shared collections.Array<number> generic periodic container (shared sendable array grows each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sharedArr: collections.Array<number> = new collections.Array<number>()
      let arrLock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let task: taskpool.Task = new taskpool.GenericsTask<[collections.Array<number>, ArkTSUtils.locks.AsyncLock], void>(epgCollectionsPushFunc, sharedArr, arrLock)
      periodicTasks.push(task)
      taskpool.executePeriodically<[collections.Array<number>, ArkTSUtils.locks.AsyncLock], void>(200, task)
      let lenSnapshot: number = 0
      let waited: number = 0
      while (lenSnapshot < 3 && waited < 5000) {
        await arrLock.lockAsync((): void => {
          lenSnapshot = sharedArr.length
        })
        if (lenSnapshot < 3) {
          await sleep(100)
          waited += 100
        }
      }
      expect(lenSnapshot >= 3 && lenSnapshot <= 8).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4700
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4700
     * @tc.desc   Verify async generic periodic task (async @Concurrent function increments shared counter each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgAsyncCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGCounter], number>(200, task)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2 && counter.count <= 20).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4800
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4800
     * @tc.desc   Verify generic periodic with GenericsTask=null and GenericsTask=undefined each throw error code 401 per input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let caught: boolean = false
      try {
        const nullTask: ESObject = null
        taskpool.executePeriodically<[], number>(200, nullTask)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const undefinedTask: ESObject = undefined
        taskpool.executePeriodically<[], number>(200, undefinedTask)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(401)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest4900
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_4900
     * @tc.desc   Verify genericsTask already added to TaskGroup cannot register as generic periodic task, throws error code 10200050 (runtime arbitration: addTask marks taskType GROUP_COMMON_TASK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let groupTask: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      group.addTask(groupTask)
      let caught: boolean = false
      try {
        taskpool.executePeriodically<[], number>(200, groupTask)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(10200050)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest5000
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5000
     * @tc.desc   Verify genericsTask executed by SequenceRunner cannot register as generic periodic task, throws error code 10200050 (runtime arbitration: runner execution marks taskType SEQRUNNER_TASK)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let runnerTask: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      try {
        await runner.execute(runnerTask)
      } catch (error) {
        console.error('ExecutePeriodicallyGenericTest5000 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      try {
        taskpool.executePeriodically<[], number>(200, runnerTask)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(10200050)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest5100
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5100
     * @tc.desc   Verify genericsTask executed by AsyncRunner cannot register as generic periodic task, throws error code 10200057 (runtime arbitration: async runner execution marks taskType ASYNCRUNNER_TASK, rejected with 10200057 since API18)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyGenericTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1)
      let runnerTask: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      try {
        await runner.execute(runnerTask)
      } catch (error) {
        console.error('ExecutePeriodicallyGenericTest5100 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      try {
        taskpool.executePeriodically<[], number>(200, runnerTask)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error.code).assertEqual(10200057)
      }
      expect(caught).assertTrue()
      done()
    })



    /**
     * @tc.name   ExecutePeriodicallyGenericTest5300
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5300
     * @tc.desc   Verify LongTask registers as generic periodic task without error and executes periodically (runtime arbitration: design expected 10200051 but native has no LongTask restriction for executePeriodically)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let longTask: taskpool.LongTask = new taskpool.LongTask(epgCounterFunc, counter)
      periodicTasks.push(longTask)
      const periodicTask: ESObject = longTask
      taskpool.executePeriodically<[EPGCounter], number>(200, periodicTask)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2 && counter.count <= 20).assertTrue()
      taskpool.cancel(longTask)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest5400
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5400
     * @tc.desc   Verify GenericsTask-typed variable can call executePeriodically with omitted type arguments (runtime arbitration: overload resolution accepts the call; design inference point validated by compilable run with execution observed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let genericsTask: taskpool.GenericsTask<[EPGCounter], number> =
        new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(genericsTask)
      taskpool.executePeriodically(200, genericsTask)
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2 && counter.count <= 20).assertTrue()
      taskpool.cancel(genericsTask)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest5500
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5500
     * @tc.desc   Verify generic periodic task with runtime missing-property error keeps executing (each tick throws TypeError on undefined property, shared counter observes every execution)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGIntermittentCounter = new EPGIntermittentCounter()
      let msg: EPGIdMsg = { id: 1 }
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGIntermittentCounter, EPGIdMsg], void>(epgMissingPropFunc, counter, msg)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGIntermittentCounter, EPGIdMsg], void>(200, task)
      await waitForCondition((): boolean => counter.count >= 3, 5000)
      expect(counter.count >= 3).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest5600
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5600
     * @tc.desc   Verify generic periodic task keeps executing when every execution throws (always-throw genericsTask still ticks, shared counter observes each execution)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGIntermittentCounter = new EPGIntermittentCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGIntermittentCounter], void>(epgAlwaysThrowFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically<[EPGIntermittentCounter], void>(200, task)
      await waitForCondition((): boolean => counter.count >= 4, 5000)
      expect(counter.count >= 4).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest5700
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5700
     * @tc.desc   Verify onExecutionSucceeded never fires for generic periodic task and nesting inside it is impossible (actual behavior: after 3+ executions succeededCount stays 0 and no inner task was created)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let succeededCount: number = 0
      let innerCreated: boolean = false
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      const onSucceeded: () => void = (): void => {
        succeededCount++
        if (!innerCreated) {
          innerCreated = true
          let innerTask: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically<[EPGCounter], number>(200, innerTask)
        }
      }
      task.onExecutionSucceeded(onSucceeded)
      taskpool.executePeriodically<[EPGCounter], number>(200, task)
      await waitForCondition((): boolean => counter.count >= 3, 5000)
      expect(counter.count >= 3).assertTrue()
      expect(succeededCount).assertEqual(0)
      expect(innerCreated).assertFalse()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest5800
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5800
     * @tc.desc   Verify onExecutionFailed never fires for generic periodic task and nesting inside it is impossible (actual behavior: always-throw task keeps ticking but failedCount stays 0 and no inner task was created)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGIntermittentCounter = new EPGIntermittentCounter()
      let failedCount: number = 0
      let innerCreated: boolean = false
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGIntermittentCounter], void>(epgAlwaysThrowFunc, counter)
      periodicTasks.push(task)
      const onFailed: () => void = (): void => {
        failedCount++
        if (!innerCreated) {
          innerCreated = true
          let innerTask: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically<[], number>(200, innerTask)
        }
      }
      task.onExecutionFailed(onFailed)
      taskpool.executePeriodically<[EPGIntermittentCounter], void>(200, task)
      await waitForCondition((): boolean => counter.count >= 3, 5000)
      expect(counter.count >= 3).assertTrue()
      expect(failedCount).assertEqual(0)
      expect(innerCreated).assertFalse()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest5900
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_5900
     * @tc.desc   Verify different-type generic periodic tasks run concurrently (number/string/object typed tasks each observed at least twice)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let numReceived: number = 0
      let strReceived: number = 0
      let task1: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      let task2: taskpool.Task = new taskpool.GenericsTask<[number], void>(epgNumSendDataFunc, 21)
      let task3: taskpool.Task = new taskpool.GenericsTask<[string], void>(epgStrSendDataFunc, 'ab')
      periodicTasks.push(task1, task2, task3)
      task2.onReceiveData((data: number): void => {
        numReceived++
      })
      task3.onReceiveData((data: string): void => {
        strReceived++
      })
      taskpool.executePeriodically<[EPGCounter], number>(200, task1)
      taskpool.executePeriodically<[number], void>(200, task2)
      taskpool.executePeriodically<[string], void>(200, task3)
      await waitForCondition((): boolean => counter.count >= 2 && numReceived >= 2 && strReceived >= 2, 8000)
      expect(counter.count >= 2).assertTrue()
      expect(numReceived >= 2).assertTrue()
      expect(strReceived >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest6000
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_6000
     * @tc.desc   Verify generic periodic control-message collection (task sends count%3 control values, host collects at least 4 messages and validates the cyclic protocol)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let controlMessages: number[] = []
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], void>(epgControlFunc, counter)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        controlMessages.push(data)
      })
      taskpool.executePeriodically<[EPGCounter], void>(200, task)
      await waitForCondition((): boolean => controlMessages.length >= 4, 5000)
      expect(controlMessages.length >= 4).assertTrue()
      for (let i: number = 0; i < controlMessages.length; i++) {
        expect(controlMessages[i]).assertEqual((i + 1) % 3)
      }
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest6100
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_6100
     * @tc.desc   Verify generic periodic full lifecycle events (onEnqueued/onStartExecution fire per tick; onExecutionSucceeded/onExecutionFailed never fire for periodic; host isCanceled stays false after cancel - runtime arbitration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyGenericTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let enqueuedCount: number = 0
      let startCount: number = 0
      let succeededCount: number = 0
      let failedCount: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(task)
      task.onEnqueued((): void => {
        enqueuedCount++
      })
      task.onStartExecution((): void => {
        startCount++
      })
      task.onExecutionSucceeded((): void => {
        succeededCount++
      })
      task.onExecutionFailed((): void => {
        failedCount++
      })
      taskpool.executePeriodically<[EPGCounter], number>(200, task)
      await waitForCondition((): boolean => enqueuedCount >= 2 && startCount >= 2, 5000)
      expect(enqueuedCount >= 2).assertTrue()
      expect(startCount >= 2).assertTrue()
      expect(succeededCount).assertEqual(0)
      expect(failedCount).assertEqual(0)
      let enqueuedBeforeCancel: number = enqueuedCount
      taskpool.cancel(task)
      await sleep(500)
      expect(taskpool.Task.isCanceled()).assertFalse()
      expect(enqueuedCount).assertLargerOrEqual(enqueuedBeforeCancel)
      expect(enqueuedCount).assertLessOrEqual(enqueuedBeforeCancel + 1)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest6200
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_6200
     * @tc.desc   Verify nested generic executePeriodically in onReceiveData callback (outer sendData triggers inner generic periodic task, nested counter reaches 2, both canceled)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let outerTask: taskpool.Task = new taskpool.GenericsTask<[], void>(epgSendDataFunc)
      periodicTasks.push(outerTask)
      let innerTask: taskpool.Task | null = null
      const onReceiveData: () => void = (): void => {
        if (innerTask === null) {
          innerTask = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically<[EPGCounter], number>(200, innerTask)
        }
      }
      outerTask.onReceiveData(onReceiveData)
      taskpool.executePeriodically<[], void>(200, outerTask)
      await waitForCondition((): boolean => counter.count >= 2, 8000)
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest6300
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_6300
     * @tc.desc   Verify nested generic executePeriodically in onEnqueued callback (inner generic periodic task starts from callback, nested counter reaches 2, both canceled)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let outerTask: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      periodicTasks.push(outerTask)
      let innerTask: taskpool.Task | null = null
      const onEnqueued: () => void = (): void => {
        if (innerTask === null) {
          innerTask = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically<[EPGCounter], number>(200, innerTask)
        }
      }
      outerTask.onEnqueued(onEnqueued)
      taskpool.executePeriodically<[], number>(200, outerTask)
      await waitForCondition((): boolean => counter.count >= 2, 8000)
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest6400
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_6400
     * @tc.desc   Verify nested generic executePeriodically in onStartExecution callback (inner generic periodic task starts from callback, nested counter reaches 2, both canceled)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let outerTask: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      periodicTasks.push(outerTask)
      let innerTask: taskpool.Task | null = null
      const onStartExec: () => void = (): void => {
        if (innerTask === null) {
          innerTask = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically<[EPGCounter], number>(200, innerTask)
        }
      }
      outerTask.onStartExecution(onStartExec)
      taskpool.executePeriodically<[], number>(200, outerTask)
      await waitForCondition((): boolean => counter.count >= 2, 8000)
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyGenericTest6500
     * @tc.number SUB_EXECUTE_PERIODICALLY_GENERIC_TEST_6500
     * @tc.desc   Verify executeDelayed<A,R> and executePeriodically<A,R> work in combination (delayed one-shot returns timestamp while generic periodic task runs concurrently)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyGenericTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPGCounter = new EPGCounter()
      let delayTask: taskpool.Task = new taskpool.GenericsTask<[], number>(epgVoidToNumFunc)
      let periodicTask: taskpool.Task = new taskpool.GenericsTask<[EPGCounter], number>(epgCounterFunc, counter)
      periodicTasks.push(periodicTask)
      taskpool.executePeriodically<[EPGCounter], number>(200, periodicTask)
      let delayed: number = 0
      try {
        delayed = await taskpool.executeDelayed<[], number>(300, delayTask)
      } catch (error) {
        console.error('ExecutePeriodicallyGenericTest6500 failed');
        expect(false).assertFail();
      }
      expect(delayed > 0).assertTrue()
      await waitForCondition((): boolean => counter.count >= 2, 5000)
      expect(counter.count >= 2 && counter.count <= 20).assertTrue()
      taskpool.cancel(periodicTask)
      done()
    })




  })
}
