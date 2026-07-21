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
import { taskpool, ArkTSUtils } from '@kit.ArkTS';
import { sharedCounter, ThreadSafeCounter } from './SharedCounterModule';
import { dataStore, SharedDataStore } from './SharedModuleData';

@Concurrent
async function incrementSharedCounter(lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  let result: number = await lock.lockAsync(() => {
    sharedCounter.increment()
    return sharedCounter.getCount()
  })
  return result
}

@Concurrent
function getSharedCounterValue(): number {
  return sharedCounter.getCount()
}

@Concurrent
async function addItemToDataStore(item: string, lock: ArkTSUtils.locks.AsyncLock): Promise<void> {
  await lock.lockAsync(() => {
    dataStore.addItem(item)
  })
}

@Concurrent
function getDataStoreCount(): number {
  return dataStore.getItemCount()
}

@Concurrent
function verifySharedInstance(): boolean {
  return ArkTSUtils.isSendable(sharedCounter)
}

export default function SendableModuleTest(): void {
  describe('SendableModuleTest', (): void => {
    beforeAll((): void => {
      sharedCounter.count = 0
    })
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   SendableModuleTest0100
     * @tc.number SUB_SENDABLE_MODULE_TEST_0100
     * @tc.desc   Verify shared module with use shared declaration exports valid Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableModuleTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(ArkTSUtils.isSendable(sharedCounter)).assertTrue()
      expect(ArkTSUtils.isSendable(dataStore)).assertTrue()
    })

    /**
     * @tc.name   SendableModuleTest0200
     * @tc.number SUB_SENDABLE_MODULE_TEST_0200
     * @tc.desc   Verify shared module singleton instance is accessible from main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableModuleTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(sharedCounter instanceof ThreadSafeCounter).assertTrue()
      expect(sharedCounter.getCount()).assertEqual(0)
    })

    /**
     * @tc.name   SendableModuleTest0300
     * @tc.number SUB_SENDABLE_MODULE_TEST_0300
     * @tc.desc   Verify multi-thread access to same shared module instance via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableModuleTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      sharedCounter.count = 0
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

      let p1 = taskpool.execute(new taskpool.Task(incrementSharedCounter, lock))
      let p2 = taskpool.execute(new taskpool.Task(incrementSharedCounter, lock))
      let p3 = taskpool.execute(new taskpool.Task(incrementSharedCounter, lock))

      await Promise.all([p1, p2, p3])
      expect(sharedCounter.getCount()).assertEqual(3)
    })

    /**
     * @tc.name   SendableModuleTest0400
     * @tc.number SUB_SENDABLE_MODULE_TEST_0400
     * @tc.desc   Verify thread data sharing through shared module data store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableModuleTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let p1 = taskpool.execute(new taskpool.Task(addItemToDataStore, 'item_0', lock))
      let p2 = taskpool.execute(new taskpool.Task(addItemToDataStore, 'item_1', lock))
      let p3 = taskpool.execute(new taskpool.Task(addItemToDataStore, 'item_2', lock))

      await Promise.all([p1, p2, p3])
      let count: number = dataStore.getItemCount()
      expect(count >= 3).assertTrue()
    })

    /**
     * @tc.name   SendableModuleTest0500
     * @tc.number SUB_SENDABLE_MODULE_TEST_0500
     * @tc.desc   Verify TaskPool task uses shared module exported object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableModuleTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      sharedCounter.count = 0
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

      let task: taskpool.Task = new taskpool.Task(getSharedCounterValue)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(0)

      await taskpool.execute(new taskpool.Task(incrementSharedCounter, lock))
      let result2 = await taskpool.execute(new taskpool.Task(getSharedCounterValue))
      expect(result2 as number).assertEqual(1)
    })

    /**
     * @tc.name   SendableModuleTest0600
     * @tc.number SUB_SENDABLE_MODULE_TEST_0600
     * @tc.desc   Verify concurrent counter increment with AsyncLock protection in shared module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableModuleTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      sharedCounter.count = 0
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let taskCount: number = 10
      let promises: Array<Promise<Object>> = []

      for (let i: number = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(incrementSharedCounter, lock)))
      }

      await Promise.all(promises)
      expect(sharedCounter.getCount()).assertEqual(taskCount)
    })

    /**
     * @tc.name   SendableModuleTest0700
     * @tc.number SUB_SENDABLE_MODULE_TEST_0700
     * @tc.desc   Verify data consistency with multiple read and write operations on shared module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableModuleTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      sharedCounter.count = 0
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

      let writePromises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 5; i++) {
        writePromises.push(taskpool.execute(new taskpool.Task(incrementSharedCounter, lock)))
      }
      await Promise.all(writePromises)

      let readResult = await taskpool.execute(new taskpool.Task(getSharedCounterValue))
      expect(readResult as number).assertEqual(5)
      expect(sharedCounter.getCount()).assertEqual(5)
    })

    /**
     * @tc.name   SendableModuleTest0800
     * @tc.number SUB_SENDABLE_MODULE_TEST_0800
     * @tc.desc   Verify shared module exports Sendable type that passes isSendable in worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableModuleTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(verifySharedInstance)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   SendableModuleTest0900
     * @tc.number SUB_SENDABLE_MODULE_TEST_0900
     * @tc.desc   Verify shared module data store items are accessible across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableModuleTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      await taskpool.execute(new taskpool.Task(addItemToDataStore, 'test_item', lock))
      let count = await taskpool.execute(new taskpool.Task(getDataStoreCount))
      expect((count as number) >= 1).assertTrue()
    })

    /**
     * @tc.name   SendableModuleTest1000
     * @tc.number SUB_SENDABLE_MODULE_TEST_1000
     * @tc.desc   Verify shared module lazy loading behavior with sequential access pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SendableModuleTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      sharedCounter.count = 0
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

      await taskpool.execute(new taskpool.Task(incrementSharedCounter, lock))
      expect(sharedCounter.getCount()).assertEqual(1)

      await taskpool.execute(new taskpool.Task(incrementSharedCounter, lock))
      expect(sharedCounter.getCount()).assertEqual(2)

      await taskpool.execute(new taskpool.Task(incrementSharedCounter, lock))
      expect(sharedCounter.getCount()).assertEqual(3)
    })
  })
}
