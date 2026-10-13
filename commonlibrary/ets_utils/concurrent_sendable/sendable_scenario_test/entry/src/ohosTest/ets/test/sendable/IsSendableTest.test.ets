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
import { ArkTSUtils, lang } from '@kit.ArkTS'
import taskpool from '@ohos.taskpool'
import { SharedCounter } from '../../workers/Sendable'

class PlainObject {
  a: number = 1
}

@Concurrent
function checkIsSendable(counter: SharedCounter): boolean {
  return ArkTSUtils.isSendable(counter)
}

export default function IsSendableTest(): void {
  describe('IsSendableTest', (): void => {
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
    })

    /**
     * @tc.name   testIsSendable0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IS_SENDABLE_TEST_0100
     * @tc.desc   Verify ArkTSUtils.isSendable returns true for @Sendable instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const counter: SharedCounter = new SharedCounter()
      expect(ArkTSUtils.isSendable(counter)).assertTrue()
      expect(ArkTSUtils.isSendable(counter as lang.ISendable)).assertTrue()
    })

    /**
     * @tc.name   testIsSendable0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IS_SENDABLE_TEST_0200
     * @tc.desc   Verify ArkTSUtils.isSendable returns false for plain object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const plain: PlainObject = new PlainObject()
      expect(ArkTSUtils.isSendable(plain)).assertFalse()
    })

    /**
     * @tc.name   testIsSendable0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IS_SENDABLE_TEST_0300
     * @tc.desc   Verify isSendable remains true inside TaskPool concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        const counter: SharedCounter = new SharedCounter()
        const task: taskpool.Task = trackTask(new taskpool.Task(checkIsSendable, counter))
        const result: boolean = await taskpool.execute(task) as boolean
        expect(result).assertTrue()
      } catch (error) {
        console.error("testIsSendable0300 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
