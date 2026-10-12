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
import { UIUtils } from '@kit.ArkUI'
import taskpool from '@ohos.taskpool'

@Sendable
class ObservedModel implements lang.ISendable {
  public value_: number = 0
  public label_: string = ''
}

@Concurrent
function readObservedValue(model: ObservedModel): number {
  return model.value_
}

export default function MakeObservedSendableTest(): void {
  describe('MakeObservedSendableTest', (): void => {
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
     * @tc.name   testMakeObservedSendable0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MAKE_OBSERVED_SENDABLE_TEST_0100
     * @tc.desc   Verify UIUtils.makeObserved converts Sendable object for property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeObservedSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const model: ObservedModel = new ObservedModel()
      model.value_ = 3
      model.label_ = 'ok'
      const observed: ObservedModel = UIUtils.makeObserved(model)
      expect(observed.value_).assertEqual(3)
      expect(observed.label_).assertEqual('ok')
      observed.value_ = 5
      expect(observed.value_).assertEqual(5)
    })

    /**
     * @tc.name   testMakeObservedSendable0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MAKE_OBSERVED_SENDABLE_TEST_0200
     * @tc.desc   Verify empty Sendable object can be makeObserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMakeObservedSendable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const model: ObservedModel = new ObservedModel()
      const observed: ObservedModel = UIUtils.makeObserved(model)
      expect(observed.value_).assertEqual(0)
      expect(observed.label_).assertEqual('')
    })

    /**
     * @tc.name   testMakeObservedSendable0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MAKE_OBSERVED_SENDABLE_TEST_0300
     * @tc.desc   Verify makeObserved result cannot be passed to TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeObservedSendable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const model: ObservedModel = new ObservedModel()
      model.value_ = 1
      const observed: ObservedModel = UIUtils.makeObserved(model)
      expect(ArkTSUtils.isSendable(observed)).assertFalse()
      let caught: boolean = false
      try {
        const task: taskpool.Task = trackTask(new taskpool.Task(readObservedValue, observed))
        await taskpool.execute(task)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      expect(ArkTSUtils.isSendable(model)).assertTrue()
      done();
    })
  })
}
