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
import { freezeSendable, isFrozenSendable } from '../helper/freezeHelper'
import { SharedCounter } from '../../../workers/sendable'

@Sendable
class FreezeConfig implements lang.ISendable {
  public version_: number = 1
  public name_: string = 'cfg'
}

@Concurrent
function readFrozenConfig(cfg: FreezeConfig): number {
  return cfg.version_
}

@Concurrent
function readFrozenCounter(counter: SharedCounter): number {
  return counter.count_
}

export default function FreezeSendableTest(): void {
  describe('FreezeSendableTest', (): void => {
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
     * @tc.name   testFreezeSendable0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_FREEZE_SENDABLE_TEST_0100
     * @tc.desc   Verify freezeSendable via .ts helper freezes Sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFreezeSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const cfg: FreezeConfig = new FreezeConfig()
      const frozen: FreezeConfig = freezeSendable<FreezeConfig>(cfg)
      expect(isFrozenSendable(frozen)).assertTrue()
      expect(ArkTSUtils.isSendable(frozen)).assertTrue()
      expect(frozen.version_).assertEqual(1)
    })

    /**
     * @tc.name   testFreezeSendable0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_FREEZE_SENDABLE_TEST_0200
     * @tc.desc   Verify frozen Sendable config can transfer to TaskPool and be read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFreezeSendable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const cfg: FreezeConfig = new FreezeConfig()
      cfg.version_ = 7
      const frozen: FreezeConfig = freezeSendable<FreezeConfig>(cfg)
      const task: taskpool.Task = trackTask(new taskpool.Task(readFrozenConfig, frozen))
      const result: number = await taskpool.execute(task) as number
      expect(result).assertEqual(7)
    })

    /**
     * @tc.name   testFreezeSendable0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_FREEZE_SENDABLE_TEST_0300
     * @tc.desc   Verify frozen SharedCounter remains readable after TaskPool transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFreezeSendable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const counter: SharedCounter = new SharedCounter()
      counter.count_ = 9
      const frozen: SharedCounter = freezeSendable<SharedCounter>(counter)
      const task: taskpool.Task = trackTask(new taskpool.Task(readFrozenCounter, frozen))
      const result: number = await taskpool.execute(task) as number
      expect(result).assertEqual(9)
      expect(isFrozenSendable(frozen)).assertTrue()
    })
  })
}
