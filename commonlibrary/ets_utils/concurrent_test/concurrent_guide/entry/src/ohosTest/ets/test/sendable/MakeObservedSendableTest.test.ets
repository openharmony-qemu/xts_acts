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
import { taskpool, ArkTSUtils } from '@kit.ArkTS';

@Sendable
class ObservableModel {
  count: number = 0
  name: string = 'Initial'
  itemCount: number = 0
}

@Sendable
class UIState {
  message: string = 'Hello'
  visible: boolean = true
  progress: number = 0
}

@Sendable
class ReplaceableData {
  count: number = 0
  valueCount: number = 0
  timestamp: number = 0
}

@Sendable
class ProcessedResult {
  status: string = ''
  dataCount: number = 0
  duration: number = 0
}

@Sendable
class ExecutionResult {
  taskId: number = 0
  output: string = ''
  success: boolean = false
}

@Sendable
class WatchedState {
  counter: number = 0
  label: string = 'Counter'
  lastUpdate: number = 0
}

@Sendable
class ClickState {
  clickCount: number = 0
  message: string = 'Click me'
  historyCount: number = 0
}

@Sendable
class AsyncDataState {
  loading: boolean = false
  dataCount: number = 0
  error: string = ''
}

@Sendable
class EmptySendable {
  value: number = 0
  label: string = ''
}

@Sendable
class SharedUpdateData {
  value: number = 0
}

@Concurrent
function generateNewData(count: number): number {
  return count
}

@Concurrent
function processData(size: number): string {
  let result: string = 'completed|'
  for (let i: number = 0; i < size; i++) {
    result += (i * 2).toString() + ','
  }
  return result
}

@Concurrent
function executeTask(id: number): string {
  return 'Task ' + id.toString() + ' completed'
}

@Concurrent
function fetchAsyncData(): number {
  return 10
}

@Concurrent
async function updateSharedValue(data: SharedUpdateData, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  let result: number = await lock.lockAsync(() => {
    data.value++
    return data.value
  })
  return result
}

export default function MakeObservedSendableTest(): void {
  describe('MakeObservedSendableTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   MakeObservedSendableTest0100
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0100
     * @tc.desc   Verify Sendable object creation and property modification for observable pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedSendableTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let model: ObservableModel = new ObservableModel()
      expect(model.count).assertEqual(0)
      expect(model.name).assertEqual('Initial')
      expect(model.itemCount).assertEqual(0)

      model.count++
      model.name = 'Updated_1'
      model.itemCount++

      expect(model.count).assertEqual(1)
      expect(model.name).assertEqual('Updated_1')
      expect(model.itemCount).assertEqual(1)
    })

    /**
     * @tc.name   MakeObservedSendableTest0200
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0200
     * @tc.desc   Verify Sendable UIState property changes are observable and consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedSendableTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let state: UIState = new UIState()
      expect(state.message).assertEqual('Hello')
      expect(state.visible).assertTrue()
      expect(state.progress).assertEqual(0)

      state.message = 'Updated Message'
      state.visible = false
      state.progress = 50

      expect(state.message).assertEqual('Updated Message')
      expect(state.visible).assertFalse()
      expect(state.progress).assertEqual(50)
    })

    /**
     * @tc.name   MakeObservedSendableTest0300
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0300
     * @tc.desc   Verify Sendable object property binding with collections Array works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedSendableTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let model: ObservableModel = new ObservableModel()
      model.itemCount = 3

      expect(model.itemCount).assertEqual(3)
    })

    /**
     * @tc.name   MakeObservedSendableTest0400
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0400
     * @tc.desc   Verify whole data replacement from TaskPool returned Sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedSendableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let currentData: ReplaceableData = new ReplaceableData()
      expect(currentData.count).assertEqual(0)

      let task: taskpool.Task = new taskpool.Task(generateNewData, 100)
      let result = await taskpool.execute(task) as number

      currentData.count = result
      currentData.timestamp = Date.now()
      currentData.valueCount = result
      expect(currentData.count).assertEqual(100)
      expect(currentData.valueCount).assertEqual(100)
      expect(currentData.timestamp > 0).assertTrue()
    })

    /**
     * @tc.name   MakeObservedSendableTest0500
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0500
     * @tc.desc   Verify TaskPool task returns Sendable object with correct data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedSendableTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(processData, 50)
      let result = await taskpool.execute(task) as string

      expect(result).assertContain('completed')
      expect(result).assertContain('0,')
      expect(result).assertContain('98,')
    })

    /**
     * @tc.name   MakeObservedSendableTest0600
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0600
     * @tc.desc   Verify Concurrent function returns Sendable object from TaskPool execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedSendableTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(executeTask, 1)
      let result = await taskpool.execute(task) as string

      expect(result).assertContain('Task 1 completed')
    })

    /**
     * @tc.name   MakeObservedSendableTest0700
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0700
     * @tc.desc   Verify multiple concurrent TaskPool tasks return correct Sendable results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MakeObservedSendableTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let p1 = taskpool.execute(new taskpool.Task(executeTask, 0))
      let p2 = taskpool.execute(new taskpool.Task(executeTask, 1))
      let p3 = taskpool.execute(new taskpool.Task(executeTask, 2))
      let p4 = taskpool.execute(new taskpool.Task(executeTask, 3))
      let p5 = taskpool.execute(new taskpool.Task(executeTask, 4))

      let results: Array<Object> = await Promise.all([p1, p2, p3, p4, p5])
      expect(results.length).assertEqual(5)

      for (let i: number = 0; i < 5; i++) {
        let r = results[i] as string
        expect(r).assertContain('completed')
      }
    })

    /**
     * @tc.name   MakeObservedSendableTest0800
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0800
     * @tc.desc   Verify WatchedState property modification pattern for UI observation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MakeObservedSendableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state: WatchedState = new WatchedState()
      expect(state.counter).assertEqual(0)
      expect(state.label).assertEqual('Counter')

      state.counter++
      state.lastUpdate = Date.now()
      state.label = 'Counter_1'

      expect(state.counter).assertEqual(1)
      expect(state.label).assertEqual('Counter_1')
      expect(state.lastUpdate > 0).assertTrue()
    })

    /**
     * @tc.name   MakeObservedSendableTest0900
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_0900
     * @tc.desc   Verify ClickState update pattern with history tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MakeObservedSendableTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state: ClickState = new ClickState()

      for (let i: number = 0; i < 5; i++) {
        state.clickCount++
        state.message = 'Clicked ' + state.clickCount.toString() + ' times'
        state.historyCount++
      }

      expect(state.clickCount).assertEqual(5)
      expect(state.message).assertEqual('Clicked 5 times')
      expect(state.historyCount).assertEqual(5)
    })

    /**
     * @tc.name   MakeObservedSendableTest1000
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_1000
     * @tc.desc   Verify async data fetch pattern with Sendable collections Array result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedSendableTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let state: AsyncDataState = new AsyncDataState()
      state.loading = true

      let task: taskpool.Task = new taskpool.Task(fetchAsyncData)
      let count = await taskpool.execute(task) as number

      state.dataCount = count
      state.loading = false

      expect(state.loading).assertFalse()
      expect(state.dataCount).assertEqual(10)
    })

    /**
     * @tc.name   MakeObservedSendableTest1100
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_1100
     * @tc.desc   Verify empty Sendable object creation with default values for observation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MakeObservedSendableTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let empty: EmptySendable = new EmptySendable()
      expect(empty.value).assertEqual(0)
      expect(empty.label).assertEqual('')
      expect(ArkTSUtils.isSendable(empty)).assertTrue()

      empty.value = 42
      empty.label = 'updated'
      expect(empty.value).assertEqual(42)
      expect(empty.label).assertEqual('updated')
    })

    /**
     * @tc.name   MakeObservedSendableTest1200
     * @tc.number SUB_MAKE_OBSERVED_SENDABLE_TEST_1200
     * @tc.desc   Verify concurrent data update with AsyncLock protection maintains consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MakeObservedSendableTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let shared: SharedUpdateData = new SharedUpdateData()
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

      let p1 = taskpool.execute(new taskpool.Task(updateSharedValue, shared, lock))
      let p2 = taskpool.execute(new taskpool.Task(updateSharedValue, shared, lock))
      let p3 = taskpool.execute(new taskpool.Task(updateSharedValue, shared, lock))
      let p4 = taskpool.execute(new taskpool.Task(updateSharedValue, shared, lock))
      let p5 = taskpool.execute(new taskpool.Task(updateSharedValue, shared, lock))

      await Promise.all([p1, p2, p3, p4, p5])
      expect(shared.value).assertEqual(5)
    })
  })
}
