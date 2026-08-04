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
import { TaskState } from './SendableTestEnums'


@Sendable
class TaskTransitionRecord {
  public from_: number = 0
  public to_: number = 0
  public timestamp_: number = 0

  constructor(from: number, to: number) {
    this.from_ = from
    this.to_ = to
    this.timestamp_ = Date.now()
  }
}

@Sendable
class TaskTransitionRule {
  public from_: number = 0
  public to_: number = 0

  constructor(from: number, to: number) {
    this.from_ = from
    this.to_ = to
  }
}

@Sendable
class TaskStateMachine {
  public currentState_: number = TaskState.PENDING
  public previousState_: number = -1
  public lock_: ArkTSUtils.locks.AsyncLock

  public history_: collections.Array<TaskTransitionRecord>

  public rules_: collections.Array<TaskTransitionRule>

  public taskId_: string = ''

  constructor(taskId: string, lock_: ArkTSUtils.locks.AsyncLock, history_: collections.Array<TaskTransitionRecord>, rules_: collections.Array<TaskTransitionRule>) {
    this.lock_ = lock_
    this.history_ = history_
    this.rules_ = rules_

    this.taskId_ = taskId
    this.currentState_ = TaskState.PENDING
  }

  async setupRules(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.rules_.push(new TaskTransitionRule(TaskState.PENDING, TaskState.RUNNING))
      this.rules_.push(new TaskTransitionRule(TaskState.PENDING, TaskState.CANCELLED))
      this.rules_.push(new TaskTransitionRule(TaskState.RUNNING, TaskState.COMPLETED))
      this.rules_.push(new TaskTransitionRule(TaskState.RUNNING, TaskState.FAILED))
      this.rules_.push(new TaskTransitionRule(TaskState.RUNNING, TaskState.CANCELLED))
    })
  }

  async getCurrentState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.currentState_)
  }

  async getPreviousState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.previousState_)
  }

  async getTaskId(): Promise<string> {
    return await this.lock_.lockAsync((): string => this.taskId_)
  }

  async transition(toState: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      let allowed: boolean = false
      for (let i: number = 0; i < this.rules_.length; i++) {
        const rule: TaskTransitionRule = this.rules_[i]
        if (rule.from_ === this.currentState_ && rule.to_ === toState) {
          allowed = true
          break
        }
      }
      if (!allowed) {
        return false
      }
      this.history_.push(new TaskTransitionRecord(this.currentState_, toState))
      this.previousState_ = this.currentState_
      this.currentState_ = toState
      return true
    })
  }

  async getHistoryCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.history_.length)
  }

  async isInState(state: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.currentState_ === state)
  }

  async isFinalState(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      return this.currentState_ === TaskState.COMPLETED ||
             this.currentState_ === TaskState.FAILED ||
             this.currentState_ === TaskState.CANCELLED
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.currentState_ = TaskState.PENDING
      this.previousState_ = -1
      while (this.history_.length > 0) { this.history_.pop() }
    })
  }
}

@Concurrent
function readTaskStateTask(sm: TaskStateMachine): number {
  return sm.currentState_
}

@Concurrent
function sendDataRunningTask(sm: TaskStateMachine): void {
  taskpool.Task.sendData('running')
}

export default function BuiltinsTaskStateMachineTest(): void {
  describe('BuiltinsTaskStateMachineTest', () => {
    let taskSM: TaskStateMachine

    beforeEach(async (): Promise<void> => {
      taskSM = new TaskStateMachine('test_task_001', new ArkTSUtils.locks.AsyncLock(), new collections.Array<TaskTransitionRecord>(), new collections.Array<TaskTransitionRule>())
      await taskSM.setupRules()
    })

    afterEach(async (): Promise<void> => {
      await taskSM.reset()
    })

    /**
     * @tc.name   testTaskStateMachine0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0100
     * @tc.desc   Verify testTaskStateMachine0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskStateMachine0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await taskSM.getCurrentState()).assertEqual(TaskState.PENDING)
      expect(await taskSM.getHistoryCount()).assertEqual(0)
      expect(await taskSM.getTaskId()).assertEqual('test_task_001')
    })

    /**
     * @tc.name   testTaskStateMachine0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0200
     * @tc.desc   Verify testTaskStateMachine0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskStateMachine0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await taskSM.transition(TaskState.RUNNING)).assertTrue()
      expect(await taskSM.getCurrentState()).assertEqual(TaskState.RUNNING)
      expect(await taskSM.getHistoryCount()).assertEqual(1)
      expect(await taskSM.transition(TaskState.COMPLETED)).assertTrue()
      expect(await taskSM.getCurrentState()).assertEqual(TaskState.COMPLETED)
      expect(await taskSM.getHistoryCount()).assertEqual(2)
      expect(await taskSM.isFinalState()).assertTrue()
    })

    /**
     * @tc.name   testTaskStateMachine0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0300
     * @tc.desc   Verify testTaskStateMachine0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskStateMachine0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await taskSM.transition(TaskState.RUNNING)
      expect(await taskSM.transition(TaskState.FAILED)).assertTrue()
      expect(await taskSM.getCurrentState()).assertEqual(TaskState.FAILED)
      expect(await taskSM.isFinalState()).assertTrue()
    })

    /**
     * @tc.name   testTaskStateMachine0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0400
     * @tc.desc   Verify testTaskStateMachine0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskStateMachine0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await taskSM.transition(TaskState.CANCELLED)).assertTrue()
      expect(await taskSM.getCurrentState()).assertEqual(TaskState.CANCELLED)
      expect(await taskSM.getHistoryCount()).assertEqual(1)
      expect(await taskSM.isFinalState()).assertTrue()
    })

    /**
     * @tc.name   testTaskStateMachine0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0500
     * @tc.desc   Verify testTaskStateMachine0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskStateMachine0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await taskSM.transition(TaskState.RUNNING)
      expect(await taskSM.transition(TaskState.CANCELLED)).assertTrue()
      expect(await taskSM.getCurrentState()).assertEqual(TaskState.CANCELLED)
    })

    /**
     * @tc.name   testTaskStateMachine0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0600
     * @tc.desc   Verify testTaskStateMachine0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskStateMachine0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await taskSM.transition(TaskState.RUNNING)
      await taskSM.transition(TaskState.COMPLETED)
      expect(await taskSM.transition(TaskState.RUNNING)).assertFalse()
      expect(await taskSM.getCurrentState()).assertEqual(TaskState.COMPLETED)
    })

    /**
     * @tc.name   testTaskStateMachine0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0700
     * @tc.desc   Verify testTaskStateMachine0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskStateMachine0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await taskSM.isInState(TaskState.PENDING)).assertTrue()
      expect(await taskSM.isInState(TaskState.RUNNING)).assertFalse()
      await taskSM.transition(TaskState.RUNNING)
      expect(await taskSM.isInState(TaskState.RUNNING)).assertTrue()
      expect(await taskSM.isInState(TaskState.PENDING)).assertFalse()
    })

    /**
     * @tc.name   testTaskStateMachine0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0800
     * @tc.desc   Verify testTaskStateMachine0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskStateMachine0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stateUpdates: string[] = []
      const task: taskpool.Task = new taskpool.Task(sendDataRunningTask, taskSM)
      const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
        task.onReceiveData((data: string): void => {
          stateUpdates.push(data)
          resolve()
        })
      })
      await taskpool.execute(task)
      await receivePromise
      expect(stateUpdates.length).assertLargerOrEqual(1)
      expect(stateUpdates[0]).assertEqual('running')
    })

    /**
     * @tc.name   testTaskStateMachine0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_0900
     * @tc.desc   Verify testTaskStateMachine0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskStateMachine0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await taskSM.transition(TaskState.RUNNING)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 20; i++) {
        tasks.push(new taskpool.Task(readTaskStateTask, taskSM))
      }
      const promises: Promise<Object>[] = []
      for (let i: number = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(TaskState.RUNNING)
      }
    })

    /**
     * @tc.name   testTaskStateMachine1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_1000
     * @tc.desc   Verify testTaskStateMachine1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskStateMachine1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const taskSM1: TaskStateMachine = new TaskStateMachine('task_001', new ArkTSUtils.locks.AsyncLock(), new collections.Array<TaskTransitionRecord>(), new collections.Array<TaskTransitionRule>())
      const taskSM2: TaskStateMachine = new TaskStateMachine('task_002', new ArkTSUtils.locks.AsyncLock(), new collections.Array<TaskTransitionRecord>(), new collections.Array<TaskTransitionRule>())
      await taskSM1.setupRules()
      await taskSM2.setupRules()
      await taskSM1.transition(TaskState.RUNNING)
      await taskSM2.transition(TaskState.CANCELLED)
      expect(await taskSM1.getCurrentState()).assertEqual(TaskState.RUNNING)
      expect(await taskSM2.getCurrentState()).assertEqual(TaskState.CANCELLED)
      await taskSM1.reset()
      await taskSM2.reset()
    })

    /**
     * @tc.name   testTaskStateMachine1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKSTATEMACHINE_TEST_1100
     * @tc.desc   Verify testTaskStateMachine1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskStateMachine1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await taskSM.transition(TaskState.RUNNING)
      await taskSM.transition(TaskState.FAILED)
      expect(await taskSM.transition(TaskState.COMPLETED)).assertFalse()
      expect(await taskSM.transition(TaskState.CANCELLED)).assertFalse()
      expect(await taskSM.getCurrentState()).assertEqual(TaskState.FAILED)
    })
  })
}
