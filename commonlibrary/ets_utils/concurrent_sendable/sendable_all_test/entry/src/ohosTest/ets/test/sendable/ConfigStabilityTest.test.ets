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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'

@Sendable
class StabilityConfigManager {
  public configMap_: collections.Map<string, string>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(configMap_: collections.Map<string, string>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.configMap_ = configMap_
    this.lock_ = lock_
  }

  public version_: number = 0
  public notificationCount_: number = 0

  async get(key: string): Promise<string | undefined> {
    return await this.lock_.lockAsync((): string | undefined => this.configMap_.get(key))
  }

  async set(key: string, value: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.configMap_.set(key, value)
      this.version_++
    })
  }

  async getVersion(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.version_)
  }

  async getNotificationCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.notificationCount_)
  }

  async incrementNotification(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.notificationCount_++
    })
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.configMap_.clear()
      this.version_ = 0
      this.notificationCount_ = 0
    })
  }
}

@Concurrent
async function concurrentReadConfig(manager: StabilityConfigManager, key: string): Promise<string | undefined> {
  return await manager.lock_.lockAsync((): string | undefined => manager.configMap_.get(key))
}

@Concurrent
async function concurrentWriteConfig(manager: StabilityConfigManager, key: string, value: string): Promise<void> {
  return await manager.lock_.lockAsync((): void => {
    manager.configMap_.set(key, value)
    manager.version_++

  })
}

@Concurrent
function triggerHotUpdate(): void {
  taskpool.Task.sendData({ type: 'hot_update', key: 'updated_key' })
}

export default function ConfigStabilityTest(): void {
  describe('ConfigStabilityTest', (): void => {
    let configManager: StabilityConfigManager

    beforeEach((): void => {
      configManager = new StabilityConfigManager(new collections.Map<string, string>(), new ArkTSUtils.locks.AsyncLock())
    })

    /**
     * @tc.name   testConfigStability0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONFIG_STABILITY_TEST_0100
     * @tc.desc   Verify config read-write lock protection under concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigStability0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await configManager.set('shared_key', 'initial_value')
        const initialVersion: number = await configManager.getVersion()
        const readTasks: taskpool.Task[] = []
        const writeTasks: taskpool.Task[] = []
        for (let i = 0; i < 5; i++) {
          readTasks.push(new taskpool.Task(concurrentReadConfig, configManager, 'shared_key'))
        }
        for (let i = 0; i < 5; i++) {
          writeTasks.push(new taskpool.Task(concurrentWriteConfig, configManager, `write_key_${i}`, `write_val_${i}`))
        }
        const readPromises: Promise<Object>[] = []
        const writePromises: Promise<Object>[] = []
        for (let i = 0; i < readTasks.length; i++) {
          readPromises.push(taskpool.execute(readTasks[i]))
        }
        for (let i = 0; i < writeTasks.length; i++) {
          writePromises.push(taskpool.execute(writeTasks[i]))
        }
        await Promise.all([...readPromises, ...writePromises])
        const finalVersion: number = await configManager.getVersion()
        expect(finalVersion).assertEqual(initialVersion + 5)
        for (let i = 0; i < 5; i++) {
          const val: string | undefined = await configManager.get(`write_key_${i}`)
          expect(val).assertEqual(`write_val_${i}`)
        }
      } catch (error) {
        console.error("testConfigStability0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testConfigStability0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONFIG_STABILITY_TEST_0200
     * @tc.desc   Verify config hot update notification with sendData and onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigStability0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let hotUpdateReceived: boolean = false
        let updateKey: string = ''
        const task: taskpool.Task = new taskpool.Task(triggerHotUpdate)
        task.onReceiveData((data: Object): void => {
          const notification: Record<string, string> = data as Record<string, string>
          hotUpdateReceived = true
          updateKey = notification['key'] as string
          configManager.incrementNotification()
        })
        await taskpool.execute(task)
        await new Promise<void>((resolve: () => void, reject: (reason: Error) => void): void => {
          let timeoutId: number = -1
          const checkInterval: number = setInterval((): void => {
            if (hotUpdateReceived) {
              clearInterval(checkInterval)
              clearTimeout(timeoutId)
              resolve()
            }
          }, 500)
          timeoutId = setTimeout((): void => {
            clearInterval(checkInterval)
            reject(new Error('hot update notification timeout'))
          }, 5000)
        })
        expect(hotUpdateReceived).assertTrue()
        expect(updateKey).assertEqual('updated_key')
        expect(await configManager.getNotificationCount()).assertEqual(1)
      } catch (error) {
        console.error("testConfigStability0200 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
