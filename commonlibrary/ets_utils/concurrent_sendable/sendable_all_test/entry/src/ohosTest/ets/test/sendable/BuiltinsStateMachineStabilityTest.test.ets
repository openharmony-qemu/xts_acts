/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

@Sendable
class StabilityStateMachine {
  public currentState_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  public history_: collections.Array<number>

  constructor(lock_: ArkTSUtils.locks.AsyncLock, history_: collections.Array<number>) {
    this.lock_ = lock_
    this.history_ = history_
  }

  public invalidTransitionCount_: number = 0

  async transition(toState: number, allowedFrom: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.currentState_ !== allowedFrom) {
        this.invalidTransitionCount_++
        return false
      }
      this.history_.push(this.currentState_)
      this.currentState_ = toState
      return true
    })
  }

  async getCurrentState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.currentState_)
  }

  async getInvalidTransitionCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.invalidTransitionCount_)
  }

  async getHistoryCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.history_.length)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.currentState_ = 0
      while (this.history_.length > 0) { this.history_.pop() }
      this.invalidTransitionCount_ = 0
    })
  }
}

@Concurrent
async function atomicCheckTransitionTask(sm: StabilityStateMachine, toState: number, allowedFrom: number): Promise<boolean> {
  return await sm.lock_.lockAsync((): boolean => {
    if (sm.currentState_ !== allowedFrom) {
      sm.invalidTransitionCount_++
      return false
    }
    sm.history_.push(sm.currentState_)
    sm.currentState_ = toState
    return true

  })
}

export default function BuiltinsStateMachineStabilityTest(): void {
  describe('BuiltinsStateMachineStabilityTest', () => {
    let sm: StabilityStateMachine

    beforeEach(async (): Promise<void> => {
      sm = new StabilityStateMachine(new ArkTSUtils.locks.AsyncLock(), new collections.Array<number>())
    })

    afterEach(async (): Promise<void> => {
      await sm.reset()
    })

    /**
     * @tc.name   testStateMachineStability0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_STATEMACHINESTABILITY_TEST_0100
     * @tc.desc   Verify testStateMachineStability0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateMachineStability0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await sm.transition(1, 0)).assertTrue()
      expect(await sm.getCurrentState()).assertEqual(1)
      expect(await sm.transition(2, 0)).assertFalse()
      expect(await sm.getCurrentState()).assertEqual(1)
      expect(await sm.getInvalidTransitionCount()).assertEqual(1)
    })

    /**
     * @tc.name   testStateMachineStability0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_STATEMACHINESTABILITY_TEST_0200
     * @tc.desc   Verify testStateMachineStability0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateMachineStability0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(atomicCheckTransitionTask, sm, 1, 0))
      }
      const promises: Promise<Object>[] = []
      for (let i: number = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i: number = 0; i < results.length; i++) {
        if (results[i] as boolean) {
          successCount++
        }
      }
      expect(successCount).assertEqual(1)
      expect(await sm.getCurrentState()).assertEqual(1)
    })

    /**
     * @tc.name   testStateMachineStability0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_STATEMACHINESTABILITY_TEST_0300
     * @tc.desc   Verify testStateMachineStability0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateMachineStability0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await sm.transition(1, 0)).assertTrue()
      expect(await sm.transition(2, 1)).assertTrue()
      expect(await sm.transition(0, 2)).assertTrue()
      expect(await sm.transition(1, 0)).assertTrue()
      expect(await sm.getHistoryCount()).assertEqual(4)
    })

    /**
     * @tc.name   testStateMachineStability0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_STATEMACHINESTABILITY_TEST_0400
     * @tc.desc   Verify testStateMachineStability0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateMachineStability0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i: number = 0; i < 50; i++) {
        const result: boolean = await sm.transition(1, 99)
        if (result) {
          break
        }
      }
      expect(await sm.getCurrentState()).assertEqual(0)
      expect(await sm.getInvalidTransitionCount()).assertEqual(50)
    })

    /**
     * @tc.name   testStateMachineStability0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_STATEMACHINESTABILITY_TEST_0500
     * @tc.desc   Verify testStateMachineStability0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStateMachineStability0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const readTasks: taskpool.Task[] = []
      const writeTasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        readTasks.push(new taskpool.Task(atomicCheckTransitionTask, sm, 1, 0))
      }
      writeTasks.push(new taskpool.Task(atomicCheckTransitionTask, sm, 1, 0))
      const allPromises: Promise<Object>[] = []
      for (let i: number = 0; i < readTasks.length; i++) {
        allPromises.push(taskpool.execute(readTasks[i]))
      }
      for (let i: number = 0; i < writeTasks.length; i++) {
        allPromises.push(taskpool.execute(writeTasks[i]))
      }
      const results: Object[] = await Promise.all(allPromises)
      let successCount: number = 0
      for (let i: number = 0; i < results.length; i++) {
        if (results[i] as boolean) {
          successCount++
        }
      }
      expect(successCount).assertEqual(1)
      expect(await sm.getCurrentState()).assertEqual(1)
    })
  })
}
