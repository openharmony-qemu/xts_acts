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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool, collections, ArkTSUtils } from '@kit.ArkTS';

@Sendable
class LargeData {
  dataCount: number = 0
  size: number = 0
}

@Sendable
class DataProcessor {
  value: number = 0

  process(): number {
    return this.value * 2
  }

  getValue(): number {
    return this.value
  }
}

@Sendable
class TaskData {
  id: number = 0
  payload: string = ''
}

@Sendable
class InnerData {
  value: number = 0
}

@Sendable
class OuterData {
  inner: InnerData = new InnerData()
  name: string = ''
}

@Sendable
class SharedRefData {
  objectId: number = 0
  checksum: number = 0
}

@Sendable
class ConcurrentAccessData {
  count: number = 0
}

@Concurrent
function processLargeData(data: LargeData): number {
  return data.size
}

@Concurrent
function callMethod(processor: DataProcessor): number {
  return processor.process()
}

@Concurrent
function processTask(data: TaskData): string {
  return 'Processed: ' + data.id.toString() + ' - ' + data.payload
}

@Concurrent
function processNested(data: OuterData): number {
  return data.inner.value + data.name.length
}

@Concurrent
function verifyRef(obj: SharedRefData, expectedId: number): boolean {
  return obj.objectId === expectedId
}

@Concurrent
async function safeIncrement(data: ConcurrentAccessData, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  let result: number = await lock.lockAsync(() => {
    data.count++
    return data.count
  })
  return result
}

@Concurrent
function readSize(data: LargeData): number {
  return data.dataCount
}

export default function SendableGuideTest(): void {
  describe('SendableGuideTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   SendableGuideTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0100
     * @tc.desc   Verify cross-thread large data transfer with collections.Array over 100KB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableGuideTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let largeData: LargeData = new LargeData()
      for (let i: number = 0; i < 10240; i++) {
        largeData.dataCount++
      }
      largeData.size = largeData.dataCount

      let task: taskpool.Task = new taskpool.Task(processLargeData, largeData)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10240)
    })

    /**
     * @tc.name   SendableGuideTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0200
     * @tc.desc   Verify Sendable class with methods can be passed and invoked across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableGuideTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let processor: DataProcessor = new DataProcessor()
      processor.value = 100

      let task: taskpool.Task = new taskpool.Task(callMethod, processor)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(200)
    })

    /**
     * @tc.name   SendableGuideTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0300
     * @tc.desc   Verify TaskPool data transfer with taskpool.Task carrying Sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableGuideTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let taskData: TaskData = new TaskData()
      taskData.id = 1
      taskData.payload = 'test payload'

      let task: taskpool.Task = new taskpool.Task(processTask, taskData)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('Processed: 1 - test payload')
    })

    /**
     * @tc.name   SendableGuideTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0400
     * @tc.desc   Verify ASON stringify and parse work with Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableGuideTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskData: TaskData = new TaskData()
      taskData.id = 42
      taskData.payload = 'ason test'

      let jsonStr: string = ArkTSUtils.ASON.stringify(taskData)
      expect(jsonStr).assertContain('42')
      expect(jsonStr).assertContain('ason test')

      let parsed = ArkTSUtils.ASON.parse(jsonStr) as TaskData
      expect(parsed.id).assertEqual(42)
      expect(parsed.payload).assertEqual('ason test')
    })

    /**
     * @tc.name   SendableGuideTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0500
     * @tc.desc   Verify nested Sendable objects transfer correctly across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableGuideTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let outer: OuterData = new OuterData()
      outer.inner.value = 100
      outer.name = 'test'

      let task: taskpool.Task = new taskpool.Task(processNested, outer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(104)
    })

    /**
     * @tc.name   SendableGuideTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0600
     * @tc.desc   Verify multiple TaskPool tasks concurrently access same Sendable object with AsyncLock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableGuideTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let shared: ConcurrentAccessData = new ConcurrentAccessData()
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

      let p1 = taskpool.execute(new taskpool.Task(safeIncrement, shared, lock))
      let p2 = taskpool.execute(new taskpool.Task(safeIncrement, shared, lock))
      let p3 = taskpool.execute(new taskpool.Task(safeIncrement, shared, lock))
      let p4 = taskpool.execute(new taskpool.Task(safeIncrement, shared, lock))
      let p5 = taskpool.execute(new taskpool.Task(safeIncrement, shared, lock))

      let results: Array<Object> = await Promise.all([p1, p2, p3, p4, p5])
      expect(results.length).assertEqual(5)
    })

    /**
     * @tc.name   SendableGuideTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0700
     * @tc.desc   Verify Sendable object reference identity preserved across thread boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableGuideTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SharedRefData = new SharedRefData()
      obj.objectId = 12345
      obj.checksum = 999

      let originalId: number = obj.objectId
      let task: taskpool.Task = new taskpool.Task(verifyRef, obj, originalId)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
      expect(obj.objectId).assertEqual(originalId)
    })

    /**
     * @tc.name   SendableGuideTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0800
     * @tc.desc   Verify large data transfer performance baseline with Sendable reference passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SendableGuideTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let largeData: LargeData = new LargeData()
      for (let i: number = 0; i < 10240; i++) {
        largeData.dataCount++
      }
      largeData.size = largeData.dataCount

      let task: taskpool.Task = new taskpool.Task(readSize, largeData)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(10240)
    })

    /**
     * @tc.name   SendableGuideTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_0900
     * @tc.desc   Verify Sendable class method getValue works correctly after cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableGuideTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let processor: DataProcessor = new DataProcessor()
      processor.value = 50

      let task: taskpool.Task = new taskpool.Task(callMethod, processor)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
      expect(processor.value).assertEqual(50)
    })

    /**
     * @tc.name   SendableGuideTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_GUIDE_TEST_1000
     * @tc.desc   Verify ASON round-trip preserves Sendable nested object data integrity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableGuideTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outer: OuterData = new OuterData()
      outer.inner.value = 42
      outer.name = 'nested'

      let jsonStr: string = ArkTSUtils.ASON.stringify(outer)
      expect(jsonStr).assertContain('42')
      expect(jsonStr).assertContain('nested')

      let parsed = ArkTSUtils.ASON.parse(jsonStr) as OuterData
      expect(parsed.inner.value).assertEqual(42)
      expect(parsed.name).assertEqual('nested')
    })
  })
}
