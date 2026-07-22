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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections } from '@kit.ArkTS'
import { ArkTSUtils } from '@kit.ArkTS'

@Sendable
class VersionHistoryEntry {
  public version_: number = 0
  public time_: number = 0
  public changeCount_: number = 0
  public changeKey_: string = ''

  constructor(version: number, time: number, changeCount: number, changeKey: string) {
    this.version_ = version
    this.time_ = time
    this.changeCount_ = changeCount
    this.changeKey_ = changeKey
  }
}

@Sendable
class ConfigVersionManager {
  public configMap_: collections.Map<string, string>
  public versionHistory_: collections.Array<VersionHistoryEntry>
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(configMap_: collections.Map<string, string>, versionHistory_: collections.Array<VersionHistoryEntry>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.configMap_ = configMap_
    this.versionHistory_ = versionHistory_
    this.lock_ = lock_
  }

  public currentVersion_: number = 0

  async set(key: string, value: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.configMap_.set(key, value)
      this.currentVersion_++
      const entry: VersionHistoryEntry = new VersionHistoryEntry(
        this.currentVersion_, Date.now(), 1, key
      )
      this.versionHistory_.push(entry)
    })
  }

  async batchSet(keys: string[], values: string[]): Promise<void> {
    await this.lock_.lockAsync((): void => {
      for (let i = 0; i < keys.length; i++) {
        this.configMap_.set(keys[i], values[i])
      }
      this.currentVersion_++
      const entry: VersionHistoryEntry = new VersionHistoryEntry(
        this.currentVersion_, Date.now(), keys.length, keys[0]
      )
      this.versionHistory_.push(entry)
    })
  }

  async get(key: string): Promise<string | undefined> {
    return await this.lock_.lockAsync((): string | undefined => this.configMap_.get(key))
  }

  async getVersion(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.currentVersion_)
  }

  async getVersionHistory(): Promise<collections.Array<VersionHistoryEntry>> {
    return await this.lock_.lockAsync((): collections.Array<VersionHistoryEntry> => this.versionHistory_)
  }

  async getLastUpdateTime(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      if (this.versionHistory_.length === 0) {
        return 0
      }
      const last: VersionHistoryEntry = this.versionHistory_[this.versionHistory_.length - 1]
      return last.time_
    })
  }

  async getChangeCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.versionHistory_.length)
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.configMap_.clear()
      this.versionHistory_.splice(0, this.versionHistory_.length)
      this.currentVersion_ = 0
    })
  }
}

@Concurrent
function getVersionTask(manager: ConfigVersionManager): number {
  return manager.currentVersion_
}

@Concurrent
async function updateConfigTask(manager: ConfigVersionManager, key: string, value: string): Promise<void> {
  return await manager.lock_.lockAsync((): void => {
    manager.configMap_.set(key, value)
    manager.currentVersion_++

  })
}

@Concurrent
function syncConfigNotificationTask(): void {
  taskpool.Task.sendData({ type: 'config_sync', version: 1 })
}

@Concurrent
function triggerVersionUpdateTask(): void {
  taskpool.Task.sendData('trigger')
}

@Concurrent
function multiListenerNotifyTask(): void {
  taskpool.Task.sendData({ type: 'sync1', version: 10 })
  taskpool.Task.sendData({ type: 'sync2', version: 11 })
}

export default function BuiltinsConfigVersionTest(): void {
  describe('BuiltinsConfigVersionTest', (): void => {
    let versionManager: ConfigVersionManager

    beforeAll((): void => {})
    beforeEach((): void => {
      const configMapArg: collections.Map<string, string> = new collections.Map<string, string>()
      const versionHistoryArg: collections.Array<VersionHistoryEntry> = new collections.Array<VersionHistoryEntry>()
      versionManager = new ConfigVersionManager(configMapArg, versionHistoryArg, new ArkTSUtils.locks.AsyncLock())
    })
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsConfigVersionTest0100
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0100
     * @tc.desc   Verify initial version equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConfigVersionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(await versionManager.getVersion()).assertEqual(0)
      expect(await versionManager.getChangeCount()).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest0200
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0200
     * @tc.desc   Verify config update increments version
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConfigVersionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const initialVersion: number = await versionManager.getVersion()
      await versionManager.set('config_key', 'config_value')
      const newVersion: number = await versionManager.getVersion()
      expect(newVersion).assertEqual(initialVersion + 1)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest0300
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0300
     * @tc.desc   Verify version number retrieval after multiple updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConfigVersionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await versionManager.set('key1', 'value1')
      await versionManager.set('key2', 'value2')
      const version: number = await versionManager.getVersion()
      expect(version).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest0400
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0400
     * @tc.desc   Verify version history records
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConfigVersionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await versionManager.set('first', 'value1')
      await versionManager.set('second', 'value2')
      const history: collections.Array<VersionHistoryEntry> = await versionManager.getVersionHistory()
      expect(history.length).assertEqual(2)
      expect(history[0].version_).assertEqual(1)
      expect(history[1].version_).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest0500
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0500
     * @tc.desc   Verify multi-thread version query consistency with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigVersionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await versionManager.set('base', 'base_value')
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(getVersionTask, versionManager))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(1)
      }
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest0600
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0600
     * @tc.desc   Verify config update version synchronization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigVersionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const versionBefore: number = await versionManager.getVersion()
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(updateConfigTask, versionManager, `key${i}`, `value${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      const versionAfter: number = await versionManager.getVersion()
      expect(versionAfter).assertEqual(versionBefore + 3)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest0700
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0700
     * @tc.desc   Verify TaskPool version query with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigVersionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await versionManager.batchSet(['batch1', 'batch2'], ['val1', 'val2'])
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(getVersionTask, versionManager))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(1)
      }
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest0800
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0800
     * @tc.desc   Verify config update timestamp recording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConfigVersionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await versionManager.set('timestamped', 'value')
      const updateTime: number = await versionManager.getLastUpdateTime()
      expect(updateTime > 0).assertTrue()
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest0900
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_0900
     * @tc.desc   Verify multiple update history tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConfigVersionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      for (let i = 0; i < 5; i++) {
        await versionManager.set(`update${i}`, `value${i}`)
      }
      const history: collections.Array<VersionHistoryEntry> = await versionManager.getVersionHistory()
      expect(history.length).assertEqual(5)
      for (let i = 0; i < 5; i++) {
        expect(history[i].version_).assertEqual(i + 1)
        expect(history[i].changeCount_).assertEqual(1)
      }
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest1000
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_1000
     * @tc.desc   Verify version change count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConfigVersionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await versionManager.batchSet(['batch_key1'], ['batch_val1'])
      await versionManager.set('single_key', 'single_val')
      await versionManager.batchSet(['batch_key2', 'batch_key3'], ['batch_val2', 'batch_val3'])
      const changeCount: number = await versionManager.getChangeCount()
      expect(changeCount).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest1100
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_1100
     * @tc.desc   Verify batch update version increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConfigVersionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const initialVersion: number = await versionManager.getVersion()
      await versionManager.batchSet(
        ['batch1', 'batch2', 'batch3'],
        ['value1', 'value2', 'value3']
      )
      const newVersion: number = await versionManager.getVersion()
      expect(newVersion).assertEqual(initialVersion + 1)
      const history: collections.Array<VersionHistoryEntry> = await versionManager.getVersionHistory()
      const lastEntry: VersionHistoryEntry = history[history.length - 1]
      expect(lastEntry.changeCount_).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest1200
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_1200
     * @tc.desc   Verify sendData config sync notification via onReceiveData Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigVersionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const task: taskpool.Task = new taskpool.Task(syncConfigNotificationTask)
      const receivePromise: Promise<number> = new Promise<number>((resolve: (value: number) => void): void => {
        task.onReceiveData((data: Object): void => {
          const d: Record<string, Object> = data as Record<string, Object>
          resolve(d['version'] as number)
        })
      })
      await taskpool.execute(task)
      const syncVersion: number = await receivePromise
      expect(syncVersion).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest1300
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_1300
     * @tc.desc   Verify callback nested version update via onReceiveData Promise and Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigVersionTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const task: taskpool.Task = new taskpool.Task(triggerVersionUpdateTask)
      const nestedPromises: Promise<Object>[] = []
      const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
        task.onReceiveData((): void => {
          const innerTask: taskpool.Task = new taskpool.Task(updateConfigTask, versionManager, 'nested_key', 'nested_value')
          nestedPromises.push(taskpool.execute(innerTask))
          resolve()
        })
      })
      await taskpool.execute(task)
      await receivePromise
      await Promise.all(nestedPromises)
      expect(nestedPromises.length).assertEqual(1)
      expect(await versionManager.getVersion()).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsConfigVersionTest1400
     * @tc.number SUB_BUILTINS_CONFIG_VERSION_TEST_1400
     * @tc.desc   Verify multi-listener concurrent notification via onReceiveData Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigVersionTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const notifications1: Record<string, Object>[] = []
      const task: taskpool.Task = new taskpool.Task(multiListenerNotifyTask)
      const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
        task.onReceiveData((data: Object): void => {
          notifications1.push(data as Record<string, Object>)
          if (notifications1.length >= 2) {
            resolve()
          }
        })
      })
      await taskpool.execute(task)
      await receivePromise
      expect(notifications1.length).assertEqual(2)
      expect(notifications1[0]['version'] as number).assertEqual(10)
      expect(notifications1[1]['version'] as number).assertEqual(11)
    })
  })
}
