/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'
import { SimpleState } from './SendableTestEnums'


@Sendable
class ConcurrentStateMachine {
  public currentState_: number = SimpleState.IDLE
  public lock_: ArkTSUtils.locks.AsyncLock

  public history_: collections.Array<number>

  public transitionCount_: number = 0
  public readCount_: number = 0

  constructor(lock_: ArkTSUtils.locks.AsyncLock, history_: collections.Array<number>) {
    this.lock_ = lock_
    this.history_ = history_

    this.currentState_ = SimpleState.IDLE
  }

  async getCurrentState(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.readCount_++
      return this.currentState_
    })
  }

  async transition(toState: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.currentState_ === SimpleState.STOPPED) {
        return false
      }
      this.history_.push(this.currentState_)
      this.currentState_ = toState
      this.transitionCount_++
      return true
    })
  }

  async getTransitionCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.transitionCount_)
  }

  async getReadCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.readCount_)
  }

  async getHistoryCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.history_.length)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.currentState_ = SimpleState.IDLE
      while (this.history_.length > 0) { this.history_.pop() }
      this.transitionCount_ = 0
      this.readCount_ = 0
    })
  }
}

@Concurrent
function readStateConcurrentTask(sm: ConcurrentStateMachine): number {
  return sm.currentState_
}

@Concurrent
async function tryTransitionConcurrentTask(sm: ConcurrentStateMachine, toState: number): Promise<boolean> {
  return await sm.lock_.lockAsync((): boolean => {
    if (sm.currentState_ === SimpleState.STOPPED) {
      return false
    }
    if (sm.currentState_ === toState) {
      return false
    }
    sm.history_.push(sm.currentState_)
    sm.currentState_ = toState
    sm.transitionCount_++
    return true

  })
}

function executeTasksGetNumbers(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsConcurrentStateTest(): void {
  describe('BuiltinsConcurrentStateTest', () => {
    let stateMachine: ConcurrentStateMachine

    beforeEach(async (): Promise<void> => {
      stateMachine = new ConcurrentStateMachine(new ArkTSUtils.locks.AsyncLock(), new collections.Array<number>())
    })

    afterEach(async (): Promise<void> => {
      await stateMachine.reset()
    })

    /**
     * @tc.name   testConcurrentState0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0100
     * @tc.desc   Verify testConcurrentState0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readStateConcurrentTask, stateMachine))
      }
      const results: Object[] = await executeTasksGetNumbers(tasks)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(SimpleState.IDLE)
      }
    })

    /**
     * @tc.name   testConcurrentState0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0200
     * @tc.desc   Verify testConcurrentState0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 50; i++) {
        tasks.push(new taskpool.Task(readStateConcurrentTask, stateMachine))
      }
      const results: Object[] = await executeTasksGetNumbers(tasks)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(SimpleState.IDLE)
      }
    })

    /**
     * @tc.name   testConcurrentState0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0300
     * @tc.desc   Verify testConcurrentState0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcurrentState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(readStateConcurrentTask, stateMachine))
      }
      const results: Object[] = await executeTasksGetNumbers(tasks)
      let allSame: boolean = true
      for (let i: number = 0; i < results.length; i++) {
        if ((results[i] as number) !== SimpleState.IDLE) {
          allSame = false
          break
        }
      }
      expect(allSame).assertTrue()
    })

    /**
     * @tc.name   testConcurrentState0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0400
     * @tc.desc   Verify testConcurrentState0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(tryTransitionConcurrentTask, stateMachine, SimpleState.ACTIVE))
      }
      const results: Object[] = await executeTasksGetNumbers(tasks)
      let successCount: number = 0
      for (let i: number = 0; i < results.length; i++) {
        if (results[i] as boolean) {
          successCount++
        }
      }
      expect(successCount).assertEqual(1)
      expect(await stateMachine.getCurrentState()).assertEqual(SimpleState.ACTIVE)
    })

    /**
     * @tc.name   testConcurrentState0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0500
     * @tc.desc   Verify testConcurrentState0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConcurrentState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i: number = 0; i < 10; i++) {
        await stateMachine.transition(SimpleState.ACTIVE)
        await stateMachine.transition(SimpleState.PAUSED)
        await stateMachine.transition(SimpleState.IDLE)
      }
      expect(await stateMachine.getTransitionCount()).assertEqual(30)
      expect(await stateMachine.getHistoryCount()).assertEqual(30)
    })

    /**
     * @tc.name   testConcurrentState0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0600
     * @tc.desc   Verify testConcurrentState0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentState0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const readTasks: taskpool.Task[] = []
      const writeTasks: taskpool.Task[] = []
      for (let i: number = 0; i < 20; i++) {
        readTasks.push(new taskpool.Task(readStateConcurrentTask, stateMachine))
      }
      writeTasks.push(new taskpool.Task(tryTransitionConcurrentTask, stateMachine, SimpleState.ACTIVE))
      const allPromises: Promise<Object>[] = []
      for (let i: number = 0; i < readTasks.length; i++) {
        allPromises.push(taskpool.execute(readTasks[i]))
      }
      for (let i: number = 0; i < writeTasks.length; i++) {
        allPromises.push(taskpool.execute(writeTasks[i]))
      }
      await Promise.all(allPromises)
      const finalState: number = await stateMachine.getCurrentState()
      expect(finalState === SimpleState.IDLE || finalState === SimpleState.ACTIVE).assertTrue()
    })

    /**
     * @tc.name   testConcurrentState0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0700
     * @tc.desc   Verify testConcurrentState0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentState0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await stateMachine.transition(SimpleState.STOPPED)
      let successCount: number = 0
      for (let i: number = 0; i < 5; i++) {
        const result: boolean = await stateMachine.transition(SimpleState.ACTIVE)
        if (result) {
          successCount++
        }
      }
      expect(successCount).assertEqual(0)
      expect(await stateMachine.getCurrentState()).assertEqual(SimpleState.STOPPED)
    })

    /**
     * @tc.name   testConcurrentState0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0800
     * @tc.desc   Verify testConcurrentState0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentState0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i: number = 0; i < 100; i++) {
        await stateMachine.transition(SimpleState.ACTIVE)
        await stateMachine.transition(SimpleState.IDLE)
      }
      expect(await stateMachine.getTransitionCount()).assertEqual(200)
      expect(await stateMachine.getHistoryCount()).assertEqual(200)
    })

    /**
     * @tc.name   testConcurrentState0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_0900
     * @tc.desc   Verify testConcurrentState0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConcurrentState0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      for (let i: number = 0; i < 1000; i++) {
        await stateMachine.transition(SimpleState.ACTIVE)
        await stateMachine.transition(SimpleState.PAUSED)
        await stateMachine.transition(SimpleState.IDLE)
      }
      expect(await stateMachine.getTransitionCount()).assertEqual(3000)
    })

    /**
     * @tc.name   testConcurrentState1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_1000
     * @tc.desc   Verify testConcurrentState1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentState1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm1: ConcurrentStateMachine = new ConcurrentStateMachine(new ArkTSUtils.locks.AsyncLock(), new collections.Array<number>())
      const sm2: ConcurrentStateMachine = new ConcurrentStateMachine(new ArkTSUtils.locks.AsyncLock(), new collections.Array<number>())
      const sm3: ConcurrentStateMachine = new ConcurrentStateMachine(new ArkTSUtils.locks.AsyncLock(), new collections.Array<number>())
      const tasks1: taskpool.Task[] = []
      const tasks2: taskpool.Task[] = []
      const tasks3: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks1.push(new taskpool.Task(tryTransitionConcurrentTask, sm1, SimpleState.ACTIVE))
        tasks2.push(new taskpool.Task(tryTransitionConcurrentTask, sm2, SimpleState.PAUSED))
        tasks3.push(new taskpool.Task(tryTransitionConcurrentTask, sm3, SimpleState.ACTIVE))
      }
      const allPromises: Promise<Object>[] = []
      for (let i: number = 0; i < tasks1.length; i++) {
        allPromises.push(taskpool.execute(tasks1[i]))
      }
      for (let i: number = 0; i < tasks2.length; i++) {
        allPromises.push(taskpool.execute(tasks2[i]))
      }
      for (let i: number = 0; i < tasks3.length; i++) {
        allPromises.push(taskpool.execute(tasks3[i]))
      }
      await Promise.all(allPromises)
      expect(await sm1.getCurrentState()).assertEqual(SimpleState.ACTIVE)
      expect(await sm2.getCurrentState()).assertEqual(SimpleState.PAUSED)
      expect(await sm3.getCurrentState()).assertEqual(SimpleState.ACTIVE)
      await sm1.reset()
      await sm2.reset()
      await sm3.reset()
    })

    /**
     * @tc.name   testConcurrentState1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENTSTATE_TEST_1100
     * @tc.desc   Verify testConcurrentState1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentState1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await stateMachine.transition(SimpleState.ACTIVE)
      await stateMachine.transition(SimpleState.PAUSED)
      await stateMachine.transition(SimpleState.IDLE)
      await stateMachine.transition(SimpleState.STOPPED)
      expect(await stateMachine.getHistoryCount()).assertEqual(4)
      const transitionCount: number = await stateMachine.getTransitionCount()
      expect(transitionCount).assertEqual(4)
    })
  })
}
