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
import { ArkTSUtils } from '@kit.ArkTS'
import { sharedGuideService } from '../../workers/shared_guide_service'

@Concurrent
async function incrSharedGuide(lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync((): number => sharedGuideService.incr())
}

@Concurrent
function getSharedGuide(): number {
  return sharedGuideService.getCounter()
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
    })
    afterEach((): void => {
      for (let i: number = 0; i < activeTasks.length; i++) {
        try {
          taskpool.cancel(activeTasks[i])
        } catch (e) {
        }
      }
      activeTasks = []
      sharedGuideService.counter_ = 0
    })

    /**
     * @tc.name   testUseSharedModule0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SHARED_MODULE_TEST_0100
     * @tc.desc   Verify "use shared" module singleton counter starts at zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUseSharedModule0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      expect(sharedGuideService.getCounter()).assertEqual(0)
    })

    /**
     * @tc.name   testUseSharedModule0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SHARED_MODULE_TEST_0200
     * @tc.desc   Verify TaskPool can mutate "use shared" module singleton by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUseSharedModule0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      const task: taskpool.Task = trackTask(new taskpool.Task(incrSharedGuide, lock))
      const result: number = await taskpool.execute(task) as number
      expect(result).assertEqual(1)
      expect(sharedGuideService.getCounter()).assertEqual(1)
    })

    /**
     * @tc.name   testUseSharedModule0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SHARED_MODULE_TEST_0300
     * @tc.desc   Verify multiple TaskPool tasks share the same "use shared" instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUseSharedModule0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      const t1: taskpool.Task = trackTask(new taskpool.Task(incrSharedGuide, lock))
      const t2: taskpool.Task = trackTask(new taskpool.Task(incrSharedGuide, lock))
      await Promise.all([taskpool.execute(t1), taskpool.execute(t2)])
      const t3: taskpool.Task = trackTask(new taskpool.Task(getSharedGuide))
      const result: number = await taskpool.execute(t3) as number
      expect(result).assertEqual(2)
      expect(sharedGuideService.getCounter()).assertEqual(2)
    })
  })
}
