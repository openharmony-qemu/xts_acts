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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { sharedGuideService, SharedGuideService } from '../../workers/shared_guide_service'

@Concurrent
function incrSharedGuide(svc: SharedGuideService): number {
  return svc.incr()
}

@Concurrent
function getSharedGuide(svc: SharedGuideService): number {
  return svc.getCounter()
}

export default function UseSharedModuleTest(): void {
  describe('UseSharedModuleTest', (): void => {
    let activeTasks: taskpool.Task[] = []

    const trackTask = (task: taskpool.Task): taskpool.Task => {
      activeTasks.push(task)
      return task
    }

    beforeEach((): void => {
      activeTasks = []
      sharedGuideService.counter_ = 0
    })
    afterEach((): void => {
      for (let i: number = 0; i < activeTasks.length; i++) {
        try {
          taskpool.cancel(activeTasks[i])
        } catch (e) {
        }
      }
      activeTasks = []
    })

    /**
     * @tc.name   UseSharedModuleTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SHARED_MODULE_TEST_0100
     * @tc.desc   Verify "use shared" module singleton counter starts at zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSharedModuleTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      expect(sharedGuideService.getCounter()).assertEqual(0)
    })

    /**
     * @tc.name   UseSharedModuleTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SHARED_MODULE_TEST_0200
     * @tc.desc   Verify TaskPool can mutate "use shared" module singleton by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSharedModuleTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const task: taskpool.Task = trackTask(new taskpool.Task(incrSharedGuide, sharedGuideService))
      const result: number = await taskpool.execute(task) as number
      expect(result).assertEqual(1)
      expect(sharedGuideService.getCounter()).assertEqual(1)
    })

    /**
     * @tc.name   UseSharedModuleTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SHARED_MODULE_TEST_0300
     * @tc.desc   Verify multiple TaskPool tasks share the same "use shared" instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSharedModuleTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const t1: taskpool.Task = trackTask(new taskpool.Task(incrSharedGuide, sharedGuideService))
      const t2: taskpool.Task = trackTask(new taskpool.Task(incrSharedGuide, sharedGuideService))
      await taskpool.execute(t1)
      await taskpool.execute(t2)
      const t3: taskpool.Task = trackTask(new taskpool.Task(getSharedGuide, sharedGuideService))
      const result: number = await taskpool.execute(t3) as number
      expect(result).assertEqual(2)
      expect(sharedGuideService.getCounter()).assertEqual(2)
    })
  })
}
