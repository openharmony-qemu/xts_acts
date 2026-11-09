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
import { collections, ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../Utils';
import { EPCounter, EPNestedProbeState, epNestedInnerFunc } from './ExecutePeriodicallyTaskTestInner';

// ========== Module-level @Concurrent Functions ==========

@Concurrent
function epSimpleFunc(): number {
  return 42
}

@Concurrent
function epSendDataFunc(): void {
  taskpool.Task.sendData(42)
}

@Concurrent
async function epCounterFunc(counter: EPCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  return counter.count
}

@Concurrent
function epNumFuncSendData(x: number): void {
  taskpool.Task.sendData(x * 2)
}

@Concurrent
function epSendableFuncSendData(data: EPSharedData): void {
  taskpool.Task.sendData(data.value * 2)
}

@Concurrent
function epArrFuncSendData(data: number[]): void {
  taskpool.Task.sendData(data.length)
}

@Concurrent
function epTimestampSendData(): void {
  taskpool.Task.sendData(Date.now())
}

@Concurrent
async function epIntermittentFunc(counter: EPIntermittentCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  if (counter.count % 3 === 0) {
    throw new Error('intermittent error')
  }
  return counter.count
}

@Concurrent
async function epAlwaysThrowFunc(counter: EPIntermittentCounter): Promise<void> {
  await counter.lock.lockAsync((): void => {
    counter.count++
  })
  throw new Error('always throw periodic error')
}

@Concurrent
function epStrArrFuncSendData(arr: string[]): void {
  taskpool.Task.sendData(arr.join('|'))
}

interface EPTimestampMsg {
  timestamp: number
}

@Concurrent
function epObjFuncSendData(msg: EPTimestampMsg): void {
  taskpool.Task.sendData(msg.timestamp)
}

@Concurrent
async function epAsyncCounterFunc(counter: EPCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  return counter.count
}

// Concurrent modification arbitration 2026-10-29: executePeriodically re-dispatches this body every
// 200ms on the shared sendable collections.Array while the host thread polls arr.length; unsynchronized
// cross-thread container access can throw "Concurrent modification exception" (same defect class as the
// generic sibling case, observed once in ~204 strict rounds). All container accesses (worker push +
// host length reads) are serialized with AsyncLock.lockAsync, same pattern as the 2026-09-07
// epNestedPeriodicProbeFunc arbitration above.
@Concurrent
async function epCollectionsPushFunc(arr: collections.Array<number>, arrLock: ArkTSUtils.locks.AsyncLock): Promise<void> {
  await arrLock.lockAsync((): void => {
    arr.push(arr.length + 1)
  })
}

// runtime arbitration 2026-09-07: executePeriodically re-dispatches this body every 200ms on the
// shared EPNestedProbeState (and the once-armed inner periodic epNestedInnerFunc runs alongside
// later ticks), so execCount++/attempted check-set/nestedCount++ raced across ticks; the whole
// exactly-once attempt RMW block is serialized with AsyncLock.lockAsync (ref AsyncRunnerExecuteTest
// arMaxProbeFunc pattern). executePeriodically()/task construction are non-await calls, no
// busy-wait lives inside the critical section.
@Concurrent
async function epNestedPeriodicProbeFunc(state: EPNestedProbeState, innerCounter: EPCounter): Promise<void> {
  await state.lock.lockAsync<void>((): void => {
    state.execCount++
    if (!state.attempted) {
      state.attempted = true
      try {
        let innerTask: taskpool.Task = new taskpool.Task(epNestedInnerFunc, state, innerCounter)
        state.innerTaskId = innerTask.taskId
        taskpool.executePeriodically(100, innerTask)
        state.nestedCount++
      } catch (e) {
        state.nestedError++
      }
    }
  })
}

// ========== Module-level @Sendable Classes ==========

@Sendable
class EPSharedData {
  value: number = 0
}

@Sendable
class EPIntermittentCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

// ========== Helper ==========

async function waitForCondition(condition: () => boolean, maxWait: number = 5000, interval: number = 100): Promise<void> {
  let elapsed: number = 0
  try {
    while (!condition() && elapsed < maxWait) {
      await sleep(interval)
      elapsed += interval
    }
  } catch (error) {
    console.error('ExecutePeriodicallyTaskTest waitForCondition failed')
    expect(false).assertFail()
  }
  expect(condition()).assertTrue()
}

// ========== W5 AsyncLock protected shared-state helpers ==========

@Sendable
class EPLockedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function epLockedIncrementFunc(counter: EPLockedCounter): Promise<number> {
  let observed: number = 0
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    observed = counter.count
    return observed
  })
  return observed
}

export default function ExecutePeriodicallyTaskTest(): void {
  describe('ExecutePeriodicallyTaskTest', (): void => {
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
          console.info(`ExecutePeriodicallyTaskTest.test.ets catch error: ${JSON.stringify(e)}`)
        }
      })
      periodicTasks = []
    })
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== 1. period Parameter Tests =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0100
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0100
     * @tc.desc   Verify executePeriodically(100, task) executes periodically with 100ms interval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let execCount: number = 0
      let task: taskpool.Task = new taskpool.Task(epSendDataFunc)
      periodicTasks.push(task)
      const onData3: () => void = (): void => {
        execCount++
      }
      task.onReceiveData(onData3)
      taskpool.executePeriodically(100, task)
      const condExecCount3: () => boolean = (): boolean => execCount >= 3
      try {
        await waitForCondition(condExecCount3, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest0100 failed');
        expect(false).assertFail();
      }
      expect(execCount >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0200
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0200
     * @tc.desc   Verify executePeriodically(200, task) executes periodically with 200ms interval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task)
      const condCounterCount3: () => boolean = (): boolean => counter.count >= 3
      try {
        await waitForCondition(condCounterCount3, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest0200 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2 && counter.count <= 6).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0300
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0300
     * @tc.desc   Verify executePeriodically(300, task) executes with 300ms period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(300, task)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest0300 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2 && counter.count <= 4).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0400
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0400
     * @tc.desc   Verify executePeriodically(-1, task) throws error code 10200028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(epSimpleFunc)
      let threwError0400 = false
      let err: BusinessError | null = null
      try {
        taskpool.executePeriodically(-1, task)
      } catch (e) {
        threwError0400 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(10200028)
        }
      }
      expect(threwError0400).assertTrue()
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0500
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0500
     * @tc.desc   Verify executePeriodically(500.5, task) executes with float period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(500.5, task)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest0500 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    // ===== 2. task Parameter Tests =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0600
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0600
     * @tc.desc   Verify executePeriodically with normal Task executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest0600 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0700
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0700
     * @tc.desc   Verify executePeriodically with Task that has arguments passes args correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedCount: number = 0
      let receivedValue: number = 0
      let task: taskpool.Task = new taskpool.Task(epNumFuncSendData, 21)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedCount++
        receivedValue = data
      })
      taskpool.executePeriodically(200, task)
      const condReceivedCount2: () => boolean = (): boolean => receivedCount >= 2
      try {
        await waitForCondition(condReceivedCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest0700 failed');
        expect(false).assertFail();
      }
      expect(receivedCount >= 2).assertTrue()
      expect(receivedValue).assertEqual(42)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0800
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0800
     * @tc.desc   Verify executePeriodically with Sendable argument works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let data: EPSharedData = new EPSharedData()
      data.value = 21
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.Task(epSendableFuncSendData, data)
      periodicTasks.push(task)
      const onReceiveData: () => void = (): void => {
        receivedCount++
      }
      task.onReceiveData(onReceiveData)
      taskpool.executePeriodically(200, task)
      const condReceivedCount2: () => boolean = (): boolean => receivedCount >= 2
      try {
        await waitForCondition(condReceivedCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest0800 failed');
        expect(false).assertFail();
      }
      expect(receivedCount >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest0900
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_0900
     * @tc.desc   Verify executePeriodically with executed Task throws error code 10200050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(epSimpleFunc)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest0900 failed');
        expect(false).assertFail();
      }
      let threwError0900: boolean = false
      let err: BusinessError | null = null
      try {
        taskpool.executePeriodically(200, task)
      } catch (e) {
        threwError0900 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(10200050)
        }
      }
      expect(threwError0900).assertTrue()
      expect(err !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1000
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1000
     * @tc.desc   Verify executePeriodically with dependent Task throws Parameter error 401 (runtime arbitration: native HasDependency check throws TYPE_ERROR 401; design expected 10200057/10200050 and d.ts marks 10200057 since API18, actual behavior is 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let depTask: taskpool.Task = new taskpool.Task(epSimpleFunc)
      let task: taskpool.Task = new taskpool.Task(epSimpleFunc)
      task.addDependency(depTask)
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        taskpool.executePeriodically(200, task)
      } catch (error) {
        caught = true
        err = error
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(401)
        }
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1100
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1100
     * @tc.desc   Verify executePeriodically with already periodic Task throws error code 10200050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task)
      const condCounterCount1: () => boolean = (): boolean => counter.count >= 1
      try {
        await waitForCondition(condCounterCount1)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1100 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        taskpool.executePeriodically(200, task)
      } catch (e) {
        caught = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(10200050)
        }
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      done()
    })

    // ===== 3. priority Parameter Tests =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1200
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1200
     * @tc.desc   Verify executePeriodically with HIGH priority executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task, taskpool.Priority.HIGH)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1200 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1300
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1300
     * @tc.desc   Verify executePeriodically with MEDIUM priority executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task, taskpool.Priority.MEDIUM)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1300 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1400
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1400
     * @tc.desc   Verify executePeriodically with LOW priority executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task, taskpool.Priority.LOW)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1400 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1500
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1500
     * @tc.desc   Verify executePeriodically with IDLE priority executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task, taskpool.Priority.IDLE)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1500 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    // ===== 4. Periodic Execution Characteristics Tests =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1600
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1600
     * @tc.desc   Verify periodic interval is approximately correct for 300ms period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executionTimes: number[] = []
      let task: taskpool.Task = new taskpool.Task(epTimestampSendData)
      periodicTasks.push(task)
      task.onReceiveData((timestamp: number): void => {
        executionTimes.push(timestamp)
      })
      taskpool.executePeriodically(300, task)
      const condExecTimes3: () => boolean = (): boolean => executionTimes.length >= 3
      try {
        await waitForCondition(condExecTimes3, 8000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1600 failed');
        expect(false).assertFail();
      }
      if (executionTimes.length >= 2) {
        for (let i: number = 1; i < executionTimes.length; i++) {
          let interval: number = executionTimes[i] - executionTimes[i - 1]
          expect(interval >= 200 && interval <= 600).assertTrue()
        }
      }
      done()
    })

    // ===== 5. sendData/onReceiveData Tests =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1700
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1700
     * @tc.desc   Verify sendData and onReceiveData work with periodic task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let task: taskpool.Task = new taskpool.Task(epSendDataFunc)
      periodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        receivedData = data
      })
      taskpool.executePeriodically(200, task)
      const condReceivedData: () => boolean = (): boolean => receivedData !== 0
      try {
        await waitForCondition(condReceivedData, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1700 failed');
        expect(false).assertFail();
      }
      expect(receivedData).assertEqual(42)
      done()
    })

    // ===== 6. Callback Listener Tests =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1800
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1800
     * @tc.desc   Verify onEnqueued callback is triggered for periodic task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let enqueuedCount: number = 0
      let task: taskpool.Task = new taskpool.Task(epSimpleFunc)
      periodicTasks.push(task)
      const onEnqueued: () => void = (): void => {
        enqueuedCount++
      }
      task.onEnqueued(onEnqueued)
      taskpool.executePeriodically(200, task)
      const condEnqueuedCount2: () => boolean = (): boolean => enqueuedCount >= 2
      try {
        await waitForCondition(condEnqueuedCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1800 failed');
        expect(false).assertFail();
      }
      expect(enqueuedCount >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest1900
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_1900
     * @tc.desc   Verify onStartExecution callback is triggered for periodic task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let startCount: number = 0
      let task: taskpool.Task = new taskpool.Task(epSimpleFunc)
      periodicTasks.push(task)
      const onStartExec: () => void = (): void => {
        startCount++
      }
      task.onStartExecution(onStartExec)
      taskpool.executePeriodically(200, task)
      const condStartCount2: () => boolean = (): boolean => startCount >= 2
      try {
        await waitForCondition(condStartCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest1900 failed');
        expect(false).assertFail();
      }
      expect(startCount >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest2000
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_2000
     * @tc.desc   Verify onReceiveData callback is triggered for each periodic execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.Task(epTimestampSendData)
      periodicTasks.push(task)
      const onData2: () => void = (): void => {
        receivedCount++
      }
      task.onReceiveData(onData2)
      taskpool.executePeriodically(200, task)
      const condReceivedCount3: () => boolean = (): boolean => receivedCount >= 3
      try {
        await waitForCondition(condReceivedCount3, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest2000 failed');
        expect(false).assertFail();
      }
      expect(receivedCount >= 2).assertTrue()
      done()
    })

    // ===== 7. Cancel Periodic Task Tests =====









    // ===== 8. Error Handling Tests =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest2500
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_2500
     * @tc.desc   Verify periodic task continues after intermittent exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPIntermittentCounter = new EPIntermittentCounter()
      let task: taskpool.Task = new taskpool.Task(epIntermittentFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task)
      const condCounterCount4: () => boolean = (): boolean => counter.count >= 4
      try {
        await waitForCondition(condCounterCount4, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest2500 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 4).assertTrue()
      done()
    })

    // ===== 9. Combination Scenario Tests =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest2600
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_2600
     * @tc.desc   Verify multiple periodic tasks with different periods run concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter1: EPCounter = new EPCounter()
      let counter2: EPCounter = new EPCounter()
      let task1: taskpool.Task = new taskpool.Task(epCounterFunc, counter1)
      let task2: taskpool.Task = new taskpool.Task(epCounterFunc, counter2)
      periodicTasks.push(task1)
      periodicTasks.push(task2)
      taskpool.executePeriodically(200, task1)
      taskpool.executePeriodically(300, task2)
      const condCounter1Count4: () => boolean = (): boolean => counter1.count >= 4
      try {
        await waitForCondition(condCounter1Count4, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest2600 failed');
        expect(false).assertFail();
      }
      expect(counter1.count >= 3).assertTrue()
      expect(counter2.count >= 1).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest2700
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_2700
     * @tc.desc   Verify same period multiple periodic tasks run concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter1: EPCounter = new EPCounter()
      let counter2: EPCounter = new EPCounter()
      let counter3: EPCounter = new EPCounter()
      let task1: taskpool.Task = new taskpool.Task(epCounterFunc, counter1)
      let task2: taskpool.Task = new taskpool.Task(epCounterFunc, counter2)
      let task3: taskpool.Task = new taskpool.Task(epCounterFunc, counter3)
      periodicTasks.push(task1, task2, task3)
      taskpool.executePeriodically(200, task1)
      taskpool.executePeriodically(200, task2)
      taskpool.executePeriodically(200, task3)
      const condSumCount6: () => boolean = (): boolean => (counter1.count + counter2.count + counter3.count) >= 6
      try {
        await waitForCondition(condSumCount6, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest2700 failed');
        expect(false).assertFail();
      }
      expect(counter1.count >= 1).assertTrue()
      expect(counter2.count >= 1).assertTrue()
      expect(counter3.count >= 1).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest2800
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_2800
     * @tc.desc   Verify periodic tasks with different priorities run correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let highCounter: EPCounter = new EPCounter()
      let lowCounter: EPCounter = new EPCounter()
      let highTask: taskpool.Task = new taskpool.Task(epCounterFunc, highCounter)
      let lowTask: taskpool.Task = new taskpool.Task(epCounterFunc, lowCounter)
      periodicTasks.push(highTask, lowTask)
      taskpool.executePeriodically(200, highTask, taskpool.Priority.HIGH)
      taskpool.executePeriodically(200, lowTask, taskpool.Priority.LOW)
      const condHighCount2: () => boolean = (): boolean => highCounter.count >= 2
      try {
        await waitForCondition(condHighCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest2800 failed');
        expect(false).assertFail();
      }
      const condLowCount2: () => boolean = (): boolean => lowCounter.count >= 2
      try {
        await waitForCondition(condLowCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest2800 failed');
        expect(false).assertFail();
      }
      expect(highCounter.count >= 2).assertTrue()
      expect(lowCounter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest2900
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_2900
     * @tc.desc   Verify Sendable shared counter with 3 concurrent periodic tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task1: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      let task2: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      let task3: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task1, task2, task3)
      taskpool.executePeriodically(200, task1)
      taskpool.executePeriodically(200, task2)
      taskpool.executePeriodically(200, task3)
      const condCounterCount6: () => boolean = (): boolean => counter.count >= 6
      try {
        await waitForCondition(condCounterCount6, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest2900 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 6).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3000
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3000
     * @tc.desc   Verify nested executePeriodically in onReceiveData callback (from outer sendData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let outerTask: taskpool.Task = new taskpool.Task(epSendDataFunc)
      periodicTasks.push(outerTask)
      let innerTask: taskpool.Task | null = null
      const onReceiveData: () => void = (): void => {
        if (innerTask === null) {
          innerTask = new taskpool.Task(epCounterFunc, counter)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically(200, innerTask)
        }
      }
      outerTask.onReceiveData(onReceiveData)
      taskpool.executePeriodically(200, outerTask)
      const condCounterCount2_8: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2_8, 8000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3000 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3100
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3100
     * @tc.desc   Verify nested executePeriodically in onEnqueued callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let outerTask: taskpool.Task = new taskpool.Task(epSimpleFunc)
      periodicTasks.push(outerTask)
      let innerTask: taskpool.Task | null = null
      const onEnqueued: () => void = (): void => {
        if (innerTask === null) {
          innerTask = new taskpool.Task(epCounterFunc, counter)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically(200, innerTask)
        }
      }
      outerTask.onEnqueued(onEnqueued)
      taskpool.executePeriodically(200, outerTask)
      const condCounterCount2_8: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2_8, 8000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3100 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3200
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3200
     * @tc.desc   Verify nested executePeriodically in onStartExecution callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let outerTask: taskpool.Task = new taskpool.Task(epSimpleFunc)
      periodicTasks.push(outerTask)
      let innerTask: taskpool.Task | null = null
      const onStartExec: () => void = (): void => {
        if (innerTask === null) {
          innerTask = new taskpool.Task(epCounterFunc, counter)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically(200, innerTask)
        }
      }
      outerTask.onStartExecution(onStartExec)
      taskpool.executePeriodically(200, outerTask)
      const condCounterCount2_8: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2_8, 8000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3200 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3300
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3300
     * @tc.desc   Verify periodic task with array argument works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedCount: number = 0
      let data: number[] = [1, 2, 3]
      let task: taskpool.Task = new taskpool.Task(epArrFuncSendData, data)
      periodicTasks.push(task)
      const onData1: () => void = (): void => {
        receivedCount++
      }
      task.onReceiveData(onData1)
      taskpool.executePeriodically(200, task)
      const condReceivedCount2: () => boolean = (): boolean => receivedCount >= 2
      try {
        await waitForCondition(condReceivedCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3300 failed');
        expect(false).assertFail();
      }
      expect(receivedCount >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3400
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3400
     * @tc.desc   Verify periodic task with named constructor works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task('namedPeriodicTask', epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3400 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      expect(task.name).assertEqual('namedPeriodicTask')
      done()
    })

    // ===== 10. period Boundary Value Tests (workorder M6 #001/002/004/005/060) =====

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3500
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3500
     * @tc.desc   Verify executePeriodically(0, task) at minimum period boundary executes exactly once (runtime arbitration 2026-09-06: period 0 reaches uv_timer_start as timeout=0 repeat=0, a one-shot timer, so the task runs a single time instead of at max frequency; cancel afterwards is silent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Root cause: repeat=0 uv timers fire only once, so waiting for count>=5 always timed out; the
      // observable contract for period 0 is exactly one execution and no further ticks
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(0, task)
      const condCounterCount1: () => boolean = (): boolean => counter.count >= 1
      try {
        await waitForCondition(condCounterCount1, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3500 failed');
        expect(false).assertFail();
      }
      // bounded no-repeat observation: with repeat=0 the one-shot timer cannot enqueue further executions
      let countAfterTick3500: number = counter.count
      await sleep(400)
      expect(counter.count).assertEqual(countAfterTick3500)
      taskpool.cancel(task)
      await sleep(100)
      expect(counter.count).assertEqual(countAfterTick3500)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3600
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3600
     * @tc.desc   Verify executePeriodically(1, task) minimum valid period value executes at high frequency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(1, task)
      const condCounterCount5: () => boolean = (): boolean => counter.count >= 5
      try {
        await waitForCondition(condCounterCount5, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3600 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 5 && counter.count <= 300).assertTrue()
      let countBeforeCancel: number = counter.count
      taskpool.cancel(task)
      await sleep(400)
      expect(counter.count).assertLargerOrEqual(countBeforeCancel)
      expect(counter.count).assertLessOrEqual(countBeforeCancel + 1)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3700
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3700
     * @tc.desc   Verify executePeriodically(-0.5, task) does not throw and runs as period 0 which executes exactly once (runtime arbitration 2026-09-06: ToInt32(-0.5)=0 and repeat=0 uv timers are one-shot, so the task runs a single time; cancel afterwards is silent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: -0.5 truncates to period 0 which maps to a repeat=0 one-shot uv timer, so count>=5
      // never happened; the observable contract is exactly one execution and no further ticks
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(-0.5, task)
      const condCounterCount1: () => boolean = (): boolean => counter.count >= 1
      try {
        await waitForCondition(condCounterCount1, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3700 failed');
        expect(false).assertFail();
      }
      // bounded no-repeat observation: with repeat=0 the one-shot timer cannot enqueue further executions
      let countAfterTick3700: number = counter.count
      await sleep(400)
      expect(counter.count).assertEqual(countAfterTick3700)
      taskpool.cancel(task)
      await sleep(100)
      expect(counter.count).assertEqual(countAfterTick3700)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3800
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3800
     * @tc.desc   Verify executePeriodically with period=undefined and period='500' each throw error code 401 per input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(epSimpleFunc)
      let threwError3800 = false
      let err: BusinessError | null = null
      try {
        const badPeriod: ESObject = undefined
        taskpool.executePeriodically(badPeriod, task)
      } catch (e) {
        threwError3800 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(401)
        }
      }
      expect(threwError3800).assertTrue()
      expect(err !== null).assertTrue()

      threwError3800 = false
      err = null
      try {
        const strPeriod: ESObject = '500'
        taskpool.executePeriodically(strPeriod, task)
      } catch (e) {
        threwError3800 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(401)
        }
      }
      expect(threwError3800).assertTrue()
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest3900
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_3900
     * @tc.desc   Verify executePeriodically(500, task) integer 500ms period executes 3 times in 1.7s window and obeys Timer stability practice (period>=500ms)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(500, task)
      const condCounterCount3: () => boolean = (): boolean => counter.count >= 3
      try {
        await waitForCondition(condCounterCount3, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest3900 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 3 && counter.count <= 5).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4000
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4000
     * @tc.desc   Verify executePeriodically(1000, task) 1s period triggers multiple executions (2 ticks in 2.3s window)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(1000, task)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 6000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest4000 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2 && counter.count <= 4).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4100
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4100
     * @tc.desc   Verify executePeriodically(5000, task) 5s period registers without error and no execution within 400ms window (first tick at 5000ms)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(5000, task)
      await sleep(400)
      expect(counter.count).assertEqual(0)
      taskpool.cancel(task)
      await sleep(400)
      expect(counter.count).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4200
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4200
     * @tc.desc   Verify executePeriodically(10000, task) 10s period registers without error and no execution within 400ms window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(10000, task)
      await sleep(400)
      expect(counter.count).assertEqual(0)
      taskpool.cancel(task)
      await sleep(400)
      expect(counter.count).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4300
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4300
     * @tc.desc   Verify executePeriodically(100000, task) 100s period registers without error and no execution within 300ms window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(100000, task)
      await sleep(300)
      expect(counter.count).assertEqual(0)
      taskpool.cancel(task)
      await sleep(300)
      expect(counter.count).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4400
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4400
     * @tc.desc   Verify executePeriodically(Number.MAX_SAFE_INTEGER, task) throws error code 10200028 (runtime arbitration: native converts period via ToInt32, 2^53-1 converts to -1 which is negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(epSimpleFunc)
      let threwError4400 = false
      let err: BusinessError | null = null
      try {
        taskpool.executePeriodically(Number.MAX_SAFE_INTEGER, task)
      } catch (e) {
        threwError4400 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(10200028)
        }
      }
      expect(threwError4400).assertTrue()
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4500
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4500
     * @tc.desc   Verify executePeriodically(NaN, task) does not throw and runs as period 0 which executes exactly once (runtime arbitration 2026-09-06: NaN passes the number type check and ToInt32(NaN)=0, a repeat=0 one-shot uv timer, so the task runs a single time)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: NaN converts to period 0 which maps to a repeat=0 one-shot uv timer, so count>=5
      // never happened; the observable contract is exactly one execution and no further ticks
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(NaN, task)
      const condCounterCount1: () => boolean = (): boolean => counter.count >= 1
      try {
        await waitForCondition(condCounterCount1, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest4500 failed');
        expect(false).assertFail();
      }
      // bounded no-repeat observation: with repeat=0 the one-shot timer cannot enqueue further executions
      let countAfterTick4500: number = counter.count
      await sleep(400)
      expect(counter.count).assertEqual(countAfterTick4500)
      taskpool.cancel(task)
      await sleep(100)
      expect(counter.count).assertEqual(countAfterTick4500)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4600
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4600
     * @tc.desc   Verify executePeriodically(Infinity/-Infinity, task) per input does not throw and runs as period 0 which executes exactly once (runtime arbitration 2026-09-06: ToInt32(±Infinity)=0, a repeat=0 one-shot uv timer, so each task runs a single time)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: ±Infinity converts to period 0 which maps to a repeat=0 one-shot uv timer, so count>=5
      // never happened; the observable contract per input is exactly one execution and no further ticks
      let counter1: EPCounter = new EPCounter()
      let task1: taskpool.Task = new taskpool.Task(epCounterFunc, counter1)
      periodicTasks.push(task1)
      taskpool.executePeriodically(Infinity, task1)
      const condCounter1Count1: () => boolean = (): boolean => counter1.count >= 1
      try {
        await waitForCondition(condCounter1Count1, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest4600 failed');
        expect(false).assertFail();
      }
      // bounded no-repeat observation: with repeat=0 the one-shot timer cannot enqueue further executions
      let countAfterTick4600a: number = counter1.count
      await sleep(400)
      expect(counter1.count).assertEqual(countAfterTick4600a)
      taskpool.cancel(task1)
      await sleep(100)
      expect(counter1.count).assertEqual(countAfterTick4600a)

      let counter2: EPCounter = new EPCounter()
      let task2: taskpool.Task = new taskpool.Task(epCounterFunc, counter2)
      periodicTasks.push(task2)
      taskpool.executePeriodically(-Infinity, task2)
      const condCounter2Count1: () => boolean = (): boolean => counter2.count >= 1
      try {
        await waitForCondition(condCounter2Count1, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest4600 failed');
        expect(false).assertFail();
      }
      let countAfterTick4600b: number = counter2.count
      await sleep(400)
      expect(counter2.count).assertEqual(countAfterTick4600b)
      taskpool.cancel(task2)
      await sleep(100)
      expect(counter2.count).assertEqual(countAfterTick4600b)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4700
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4700
     * @tc.desc   Verify executePeriodically with task=null and task=undefined each throw error code 401 per input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let threwError4700 = false
      let err: BusinessError | null = null
      try {
        const nullTask: ESObject = null
        taskpool.executePeriodically(200, nullTask)
      } catch (e) {
        threwError4700 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(401)
        }
      }
      expect(threwError4700).assertTrue()
      expect(err !== null).assertTrue()

      threwError4700 = false
      err = null
      try {
        const undefinedTask: ESObject = undefined
        taskpool.executePeriodically(200, undefinedTask)
      } catch (e) {
        threwError4700 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(401)
        }
      }
      expect(threwError4700).assertTrue()
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4800
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4800
     * @tc.desc   Verify executePeriodically with explicit priority=null throws error code 401 (runtime arbitration: design expected default priority fallback, native rejects non-number third param with TYPE_ERROR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(epSimpleFunc)
      let threwError4800 = false
      let err: BusinessError | null = null
      try {
        const nullPriority: ESObject = null
        taskpool.executePeriodically(200, task, nullPriority)
      } catch (e) {
        threwError4800 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(401)
        }
      }
      expect(threwError4800).assertTrue()
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest4900
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_4900
     * @tc.desc   Verify task already added to TaskGroup cannot register as periodic task, throws error code 10200050 (runtime arbitration: addTask marks taskType GROUP_COMMON_TASK, IsExecuted rejects periodic registration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      let groupTask: taskpool.Task = new taskpool.Task(epSimpleFunc)
      group.addTask(groupTask)
      let threwError4900 = false
      let err: BusinessError | null = null
      try {
        taskpool.executePeriodically(200, groupTask)
      } catch (e) {
        threwError4900 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(10200050)
        }
      }
      expect(threwError4900).assertTrue()
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest5000
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5000
     * @tc.desc   Verify task executed by SequenceRunner cannot register as periodic task, throws error code 10200050 (runtime arbitration: runner execution marks taskType SEQRUNNER_TASK, IsExecuted rejects periodic registration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let runnerTask: taskpool.Task = new taskpool.Task(epSimpleFunc)
      try {
        await runner.execute(runnerTask)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5000 failed');
        expect(false).assertFail();
      }
      let threwError5000 = false
      let err: BusinessError | null = null
      try {
        taskpool.executePeriodically(200, runnerTask)
      } catch (e) {
        threwError5000 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(10200050)
        }
      }
      expect(threwError5000).assertTrue()
      expect(err !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest5100
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5100
     * @tc.desc   Verify task executed by AsyncRunner cannot register as periodic task, throws error code 10200057 (runtime arbitration: async runner execution marks taskType ASYNCRUNNER_TASK, IsAsyncRunnerTask rejects with 10200057 since API18; passing the runner object itself has no native validation entry, so the SDK-semantics construction is used)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecutePeriodicallyTaskTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1)
      let runnerTask: taskpool.Task = new taskpool.Task(epSimpleFunc)
      try {
        await runner.execute(runnerTask)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5100 failed');
        expect(false).assertFail();
      }
      let threwError5100 = false
      let err: BusinessError | null = null
      try {
        taskpool.executePeriodically(200, runnerTask)
      } catch (e) {
        threwError5100 = true
        err = e
        if (err !== null) {
          expect(err instanceof Error).assertTrue()
          expect(err.code).assertEqual(10200057)
        }
      }
      expect(threwError5100).assertTrue()
      expect(err !== null).assertTrue()
      done()
    })



    /**
     * @tc.name   ExecutePeriodicallyTaskTest5300
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5300
     * @tc.desc   Verify LongTask registers as periodic task without error and executes periodically (runtime arbitration: design expected 10200051 but native has no LongTask restriction for executePeriodically, actual behavior is periodic execution)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let longTask: taskpool.LongTask = new taskpool.LongTask(epCounterFunc, counter)
      periodicTasks.push(longTask)
      taskpool.executePeriodically(200, longTask)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5300 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2 && counter.count <= 20).assertTrue()
      taskpool.cancel(longTask)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest5400
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5400
     * @tc.desc   Verify periodic task with string[] serialized argument preserves data integrity (join result received via sendData each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedCount: number = 0
      let receivedValue: string = ''
      let data: string[] = ['a', 'b', 'c']
      let task: taskpool.Task = new taskpool.Task(epStrArrFuncSendData, data)
      periodicTasks.push(task)
      task.onReceiveData((value: string): void => {
        receivedCount++
        receivedValue = value
      })
      taskpool.executePeriodically(200, task)
      const condReceivedCount2: () => boolean = (): boolean => receivedCount >= 2
      try {
        await waitForCondition(condReceivedCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5400 failed');
        expect(false).assertFail();
      }
      expect(receivedCount >= 2).assertTrue()
      expect(receivedValue).assertEqual('a|b|c')
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest5500
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5500
     * @tc.desc   Verify periodic task with plain object {timestamp} serialized argument passes the object field correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedCount: number = 0
      let receivedTimestamp: number = 0
      let msg: EPTimestampMsg = { timestamp: 123 }
      let task: taskpool.Task = new taskpool.Task(epObjFuncSendData, msg)
      periodicTasks.push(task)
      task.onReceiveData((value: number): void => {
        receivedCount++
        receivedTimestamp = value
      })
      taskpool.executePeriodically(200, task)
      const condReceivedCount2: () => boolean = (): boolean => receivedCount >= 2
      try {
        await waitForCondition(condReceivedCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5500 failed');
        expect(false).assertFail();
      }
      expect(receivedCount >= 2).assertTrue()
      expect(receivedTimestamp).assertEqual(123)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest5600
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5600
     * @tc.desc   Verify async @Concurrent function works as periodic task (async execution increments shared counter each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epAsyncCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5600 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2 && counter.count <= 20).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest5700
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5700
     * @tc.desc   Verify high frequency periodic execution with 50ms period reaches 20 executions (range assert 15-28, count assertion instead of exact timing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(50, task)
      const condCounterCount20: () => boolean = (): boolean => counter.count >= 20
      try {
        await waitForCondition(condCounterCount20, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5700 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 15 && counter.count <= 28).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest5800
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5800
     * @tc.desc   Verify 1000ms period reaches 5 executions (range assert 5-7; count assertion replaces 990-1100ms interval assertion per no-exact-time rule)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(1000, task)
      const condCounterCount5: () => boolean = (): boolean => counter.count >= 5
      try {
        await waitForCondition(condCounterCount5, 8000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5800 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 5 && counter.count <= 7).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest5900
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_5900
     * @tc.desc   Verify 3 periodic tasks with periods 500/1000/1500ms run concurrently, each keeps its own execution count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter1: EPCounter = new EPCounter()
      let counter2: EPCounter = new EPCounter()
      let counter3: EPCounter = new EPCounter()
      let task1: taskpool.Task = new taskpool.Task(epCounterFunc, counter1)
      let task2: taskpool.Task = new taskpool.Task(epCounterFunc, counter2)
      let task3: taskpool.Task = new taskpool.Task(epCounterFunc, counter3)
      periodicTasks.push(task1, task2, task3)
      taskpool.executePeriodically(500, task1)
      taskpool.executePeriodically(1000, task2)
      taskpool.executePeriodically(1500, task3)
      const condCounter1Count5: () => boolean = (): boolean => counter1.count >= 5
      try {
        await waitForCondition(condCounter1Count5, 8000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest5900 failed');
        expect(false).assertFail();
      }
      expect(counter1.count >= 5 && counter1.count <= 7).assertTrue()
      expect(counter2.count >= 2 && counter2.count <= 4).assertTrue()
      expect(counter3.count >= 1 && counter3.count <= 3).assertTrue()
      taskpool.cancel(task1)
      taskpool.cancel(task2)
      taskpool.cancel(task3)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest6000
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_6000
     * @tc.desc   Verify periodic task updates shared collections.Array container concurrently (shared sendable container grows each tick)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let sharedArr: collections.Array<number> = new collections.Array<number>()
      let arrLock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let task: taskpool.Task = new taskpool.Task(epCollectionsPushFunc, sharedArr, arrLock)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task)
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
     * @tc.name   ExecutePeriodicallyTaskTest6100
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_6100
     * @tc.desc   Verify periodic task keeps executing when every execution throws (always-throw task still ticks, shared counter observes each execution)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPIntermittentCounter = new EPIntermittentCounter()
      let task: taskpool.Task = new taskpool.Task(epAlwaysThrowFunc, counter)
      periodicTasks.push(task)
      taskpool.executePeriodically(200, task)
      const condCounterCount4: () => boolean = (): boolean => counter.count >= 4
      try {
        await waitForCondition(condCounterCount4, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest6100 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 4).assertTrue()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest6200
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_6200
     * @tc.desc   Verify onExecutionSucceeded never fires for periodic task and nesting inside it is impossible (actual behavior: after 3+ executions succeededCount stays 0 and no inner task was created)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let succeededCount: number = 0
      let innerCreated: boolean = false
      let task: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(task)
      const onSucceeded: () => void = (): void => {
        succeededCount++
        if (!innerCreated) {
          innerCreated = true
          let innerTask: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically(200, innerTask)
        }
      }
      task.onExecutionSucceeded(onSucceeded)
      taskpool.executePeriodically(200, task)
      const condCounterCount3: () => boolean = (): boolean => counter.count >= 3
      try {
        await waitForCondition(condCounterCount3, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest6200 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 3).assertTrue()
      expect(succeededCount).assertEqual(0)
      expect(innerCreated).assertFalse()
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest6300
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_6300
     * @tc.desc   Verify onExecutionFailed never fires for periodic task even when every execution throws (actual behavior: failed executions keep ticking but failedCount stays 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPIntermittentCounter = new EPIntermittentCounter()
      let failedCount: number = 0
      let task: taskpool.Task = new taskpool.Task(epAlwaysThrowFunc, counter)
      periodicTasks.push(task)
      const onFailed: () => void = (): void => {
        failedCount++
      }
      task.onExecutionFailed(onFailed)
      taskpool.executePeriodically(200, task)
      const condCounterCount3: () => boolean = (): boolean => counter.count >= 3
      try {
        await waitForCondition(condCounterCount3, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest6300 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 3).assertTrue()
      expect(failedCount).assertEqual(0)
      taskpool.cancel(task)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest6400
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_6400
     * @tc.desc   Verify nesting inside onExecutionFailed is impossible for periodic task (callback never fires so no inner periodic task is created)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecutePeriodicallyTaskTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter: EPIntermittentCounter = new EPIntermittentCounter()
      let failedCount: number = 0
      let innerCreated: boolean = false
      let task: taskpool.Task = new taskpool.Task(epAlwaysThrowFunc, counter)
      periodicTasks.push(task)
      const onFailed: () => void = (): void => {
        failedCount++
        if (!innerCreated) {
          innerCreated = true
          let innerTask: taskpool.Task = new taskpool.Task(epSimpleFunc)
          periodicTasks.push(innerTask)
          taskpool.executePeriodically(200, innerTask)
        }
      }
      task.onExecutionFailed(onFailed)
      taskpool.executePeriodically(200, task)
      const condCounterCount3: () => boolean = (): boolean => counter.count >= 3
      try {
        await waitForCondition(condCounterCount3, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest6400 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 3).assertTrue()
      expect(failedCount).assertEqual(0)
      expect(innerCreated).assertFalse()
      taskpool.cancel(task)
      done()
    })





    /**
     * @tc.name   ExecutePeriodicallyTaskTest6700
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_6700
     * @tc.desc   Verify nesting probe: executePeriodically called inside @Concurrent task body (F4 probe; exactly one attempt is made and it either succeeds with inner ticks or throws once, runtime arbitration by main workflow with run evidence)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let state: EPNestedProbeState = new EPNestedProbeState()
      let innerCounter: EPCounter = new EPCounter()
      let outerTask: taskpool.Task = new taskpool.Task(epNestedPeriodicProbeFunc, state, innerCounter)
      periodicTasks.push(outerTask)
      taskpool.executePeriodically(200, outerTask)
      state.outerTaskId = outerTask.taskId
      const condProbeDone: () => boolean = (): boolean =>
        state.nestedError >= 1 || (state.nestedCount >= 1 && innerCounter.count >= 3)
      try {
        await waitForCondition(condProbeDone, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest6700 failed');
        expect(false).assertFail();
      }
      expect(state.execCount >= 1).assertTrue()
      expect(state.attempted).assertTrue()
      expect(state.nestedCount + state.nestedError).assertEqual(1)
      if (state.innerTaskId > 0) {
        try {
          taskpool.cancel(state.innerTaskId)
        } catch (e) {
          console.info(`ExecutePeriodicallyTaskTest.test.ets catch error: ${JSON.stringify(e)}`)
        }
      }
      taskpool.cancel(outerTask)
      done()
    })

    /**
     * @tc.name   ExecutePeriodicallyTaskTest6800
     * @tc.number SUB_EXECUTE_PERIODICALLY_TASK_TEST_6800
     * @tc.desc   Verify executeDelayed and executePeriodically work in combination (delayed one-shot returns 42 while periodic task runs concurrently)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecutePeriodicallyTaskTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EPCounter = new EPCounter()
      let delayTask: taskpool.Task = new taskpool.Task(epSimpleFunc)
      let periodicTask: taskpool.Task = new taskpool.Task(epCounterFunc, counter)
      periodicTasks.push(periodicTask)
      taskpool.executePeriodically(200, periodicTask)
      let delayed: number = 0
      try {
        delayed = await taskpool.executeDelayed(300, delayTask) as number
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest6800 failed');
        expect(false).assertFail();
      }
      expect(delayed).assertEqual(42)
      const condCounterCount2: () => boolean = (): boolean => counter.count >= 2
      try {
        await waitForCondition(condCounterCount2, 5000)
      } catch (error) {
        console.error('ExecutePeriodicallyTaskTest6800 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2 && counter.count <= 20).assertTrue()
      taskpool.cancel(periodicTask)
      done()
    })



    // ===== 11. W5 AsyncLock protected shared-state Tests =====




  })
}
