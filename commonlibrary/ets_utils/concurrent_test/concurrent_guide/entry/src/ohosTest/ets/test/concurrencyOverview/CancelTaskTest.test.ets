/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { taskpool } from '@kit.ArkTS';

@Sendable
class TaskIdStorage {
  taskId: number = 0
}

@Concurrent
function simpleTask(): string {
  return 'done'
}

@Concurrent
function delayedTask(): string {
  return 'delayed executed'
}

@Concurrent
function taskWithId(id: number): number {
  return id
}

@Concurrent
function quickReturnTask(): string {
  return 'quick'
}

export default function CancelTaskTest(): void {
  describe('CancelTaskTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   CancelTaskTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CANCEL_TASK_TEST_0100
     * @tc.desc   Verify Task object taskId property is a valid number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CancelTaskTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(simpleTask)
      expect(task.taskId !== undefined).assertTrue()
      expect(task.taskId > 0).assertTrue()
    })

    /**
     * @tc.name   CancelTaskTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CANCEL_TASK_TEST_0200
     * @tc.desc   Verify taskpool.cancel cancels task by taskId before execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CancelTaskTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(delayedTask)
      let executePromise: Promise<Object> = taskpool.executeDelayed(5000, task)

      taskpool.cancel(task.taskId)

      let caughtError1: boolean = false
      try {
        await executePromise
        expect().assertFail()
      } catch (e) {
        caughtError1 = true
        
      }
      expect(caughtError1).assertTrue()
    })

    /**
     * @tc.name   CancelTaskTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CANCEL_TASK_TEST_0300
     * @tc.desc   Verify Sendable class can store and retrieve task ID correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CancelTaskTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let storage: TaskIdStorage = new TaskIdStorage()
      let task: taskpool.Task = new taskpool.Task(taskWithId, 42)
      storage.taskId = task.taskId

      let result = await taskpool.execute(task)
      expect(storage.taskId).assertEqual(task.taskId)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   CancelTaskTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CANCEL_TASK_TEST_0400
     * @tc.desc   Verify taskpool.executeDelayed executes task after specified delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CancelTaskTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(delayedTask)
      let startTime: number = Date.now()

      let result = await taskpool.executeDelayed(1000, task)
      let elapsed: number = Date.now() - startTime

      expect(elapsed >= 999).assertTrue()
      expect(result as string).assertEqual('delayed executed')
    })

    /**
     * @tc.name   CancelTaskTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CANCEL_TASK_TEST_0500
     * @tc.desc   Verify executing a canceled task throws task has been canceled exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CancelTaskTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(quickReturnTask)
      let executePromise: Promise<Object> = taskpool.executeDelayed(5000, task)

      taskpool.cancel(task.taskId)

      let caughtError2: boolean = false
      try {
        await executePromise
        expect().assertFail()
      } catch (e) {
        caughtError2 = true
        
      }
      expect(caughtError2).assertTrue()
    })
  })
}
