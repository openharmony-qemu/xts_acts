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
class AppSettingsManager {
  public settings_: collections.Map<string, string>

  public defaults_: collections.Map<string, string>

  public featureFlags_: collections.Map<string, boolean>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(settings_: collections.Map<string, string>, defaults_: collections.Map<string, string>, featureFlags_: collections.Map<string, boolean>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.settings_ = settings_
    this.defaults_ = defaults_
    this.featureFlags_ = featureFlags_
    this.lock_ = lock_
  }

  public version_: number = 0

  async loadDefaults(keys: string[], values: string[]): Promise<void> {
    await this.lock_.lockAsync((): void => {
      for (let i = 0; i < keys.length; i++) {
        this.defaults_.set(keys[i], values[i])
        this.settings_.set(keys[i], values[i])
      }
    })
  }

  async getSetting(key: string): Promise<string | undefined> {
    return await this.lock_.lockAsync((): string | undefined => this.settings_.get(key))
  }

  async setSetting(key: string, value: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.settings_.set(key, value)
      this.version_++
    })
  }

  async resetToDefault(key: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const defaultVal: string | undefined = this.defaults_.get(key)
      if (defaultVal !== undefined) {
        this.settings_.set(key, defaultVal)
        this.version_++
      }
    })
  }

  async deleteSetting(key: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const result: boolean = this.settings_.delete(key)
      if (result) {
        this.version_++
      }
      return result
    })
  }

  async getVersion(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.version_)
  }

  async getFeatureFlag(flagName: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const flag: boolean | undefined = this.featureFlags_.get(flagName)
      if (flag !== undefined) {
        return flag
      }
      return false
    })
  }

  async setFeatureFlag(flagName: string, enabled: boolean): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.featureFlags_.set(flagName, enabled)
      this.version_++
    })
  }

  async toggleFeatureFlag(flagName: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const current: boolean | undefined = this.featureFlags_.get(flagName)
      const newValue: boolean = current !== undefined ? !current : true
      this.featureFlags_.set(flagName, newValue)
      this.version_++
      return newValue
    })
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.settings_.clear()
      this.defaults_.clear()
      this.featureFlags_.clear()
      this.version_ = 0
    })
  }
}

@Concurrent
async function readSettingTask(manager: AppSettingsManager, key: string): Promise<string | undefined> {
  return await manager.lock_.lockAsync((): string | undefined => manager.settings_.get(key))
}

@Concurrent
async function updateSettingTask(manager: AppSettingsManager, key: string, value: string): Promise<void> {
  return await manager.lock_.lockAsync((): void => {
    manager.settings_.set(key, value)
    manager.version_++
  })
}

@Concurrent
async function checkFeatureFlagTask(manager: AppSettingsManager, flagName: string): Promise<boolean> {
  return await manager.lock_.lockAsync((): boolean => {
    const flag: boolean | undefined = manager.featureFlags_.get(flagName)
    if (flag !== undefined) {
      return flag
    }
    return false
  })
}

@Concurrent
function notifySettingsChangeTask(): void {
  taskpool.Task.sendData({ type: 'settings_changed', key: 'updated_key' })
}

@Concurrent
function multiNotifySettingsTask(): void {
  taskpool.Task.sendData({ type: 'change1', key: 'key1' })
  taskpool.Task.sendData({ type: 'change2', key: 'key2' })
  taskpool.Task.sendData({ type: 'change3', key: 'key3' })
}

@Concurrent
function triggerSettingsUpdateTask(): void {
  taskpool.Task.sendData('trigger')
}

export default function BuiltinsAppSettingsTest(): void {
  describe('BuiltinsAppSettingsTest', (): void => {
    let settingsManager: AppSettingsManager

    beforeAll((): void => {})
    beforeEach((): void => {
      settingsManager = new AppSettingsManager(new collections.Map<string, string>(), new collections.Map<string, string>(), new collections.Map<string, boolean>(), new ArkTSUtils.locks.AsyncLock())
    })
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   testAppSettings0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0100
     * @tc.desc   Verify loading default settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppSettings0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await settingsManager.loadDefaults(
        ['theme', 'language', 'notifications'],
        ['light', 'en', 'enabled']
      )
      expect(await settingsManager.getSetting('theme')).assertEqual('light')
      expect(await settingsManager.getSetting('language')).assertEqual('en')
      expect(await settingsManager.getSetting('notifications')).assertEqual('enabled')
    })

    /**
     * @tc.name   testAppSettings0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0200
     * @tc.desc   Verify getting setting value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppSettings0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await settingsManager.setSetting('user_preference', 'custom_value')
      const value: string | undefined = await settingsManager.getSetting('user_preference')
      expect(value).assertEqual('custom_value')
    })

    /**
     * @tc.name   testAppSettings0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0300
     * @tc.desc   Verify updating setting value with version increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppSettings0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await settingsManager.loadDefaults(['initial'], ['default'])
      const oldVersion: number = await settingsManager.getVersion()
      await settingsManager.setSetting('initial', 'updated')
      const newVersion: number = await settingsManager.getVersion()
      expect(newVersion).assertEqual(oldVersion + 1)
      expect(await settingsManager.getSetting('initial')).assertEqual('updated')
    })

    /**
     * @tc.name   testAppSettings0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0400
     * @tc.desc   Verify deleting setting item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppSettings0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await settingsManager.setSetting('temp_setting', 'temp_value')
      const deleted: boolean = await settingsManager.deleteSetting('temp_setting')
      expect(deleted).assertTrue()
      expect(await settingsManager.getSetting('temp_setting') === undefined).assertTrue()
    })

    /**
     * @tc.name   testAppSettings0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0500
     * @tc.desc   Verify resetting setting to default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppSettings0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await settingsManager.loadDefaults(['config'], ['default_config'])
      await settingsManager.setSetting('config', 'modified_config')
      await settingsManager.resetToDefault('config')
      expect(await settingsManager.getSetting('config')).assertEqual('default_config')
    })

    /**
     * @tc.name   testAppSettings0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0600
     * @tc.desc   Verify TaskPool concurrent read settings with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAppSettings0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await settingsManager.loadDefaults(
        ['setting1', 'setting2', 'setting3', 'setting4', 'setting5'],
        ['value1', 'value2', 'value3', 'value4', 'value5']
      )
      const tasks: taskpool.Task[] = []
      for (let i = 1; i <= 5; i++) {
        tasks.push(new taskpool.Task(readSettingTask, settingsManager, `setting${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i = 0; i < 5; i++) {
        expect(results[i] as string).assertEqual(`value${i + 1}`)
      }
    })

    /**
     * @tc.name   testAppSettings0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0700
     * @tc.desc   Verify TaskPool concurrent update settings with version consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAppSettings0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await settingsManager.loadDefaults(['base'], ['base_value'])
      const initialVersion: number = await settingsManager.getVersion()
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(updateSettingTask, settingsManager, `update${i}`, `val${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      const finalVersion: number = await settingsManager.getVersion()
      expect(finalVersion).assertEqual(initialVersion + 5)
    })

    /**
     * @tc.name   testAppSettings0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0800
     * @tc.desc   Verify concurrent settings read/write mixed with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAppSettings0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await settingsManager.loadDefaults(['read1', 'read2'], ['read_val1', 'read_val2'])
      const readTasks: taskpool.Task[] = []
      const writeTasks: taskpool.Task[] = []
      readTasks.push(new taskpool.Task(readSettingTask, settingsManager, 'read1'))
      readTasks.push(new taskpool.Task(readSettingTask, settingsManager, 'read2'))
      writeTasks.push(new taskpool.Task(updateSettingTask, settingsManager, 'write1', 'new_val1'))
      writeTasks.push(new taskpool.Task(updateSettingTask, settingsManager, 'write2', 'new_val2'))
      const readPromises: Promise<Object>[] = []
      const writePromises: Promise<Object>[] = []
      for (let i = 0; i < readTasks.length; i++) {
        readPromises.push(taskpool.execute(readTasks[i]))
      }
      for (let i = 0; i < writeTasks.length; i++) {
        writePromises.push(taskpool.execute(writeTasks[i]))
      }
      await Promise.all([...readPromises, ...writePromises])
      const readResults: Object[] = await Promise.all(readPromises)
      expect(readResults[0] as string).assertEqual('read_val1')
      expect(readResults[1] as string).assertEqual('read_val2')
    })

    /**
     * @tc.name   testAppSettings0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_0900
     * @tc.desc   Verify feature flag state query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppSettings0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await settingsManager.setFeatureFlag('experimental_feature', true)
      const enabled: boolean = await settingsManager.getFeatureFlag('experimental_feature')
      expect(enabled).assertTrue()
      const disabled: boolean = await settingsManager.getFeatureFlag('nonexistent_flag')
      expect(disabled).assertFalse()
    })

    /**
     * @tc.name   testAppSettings1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_1000
     * @tc.desc   Verify feature flag state toggle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppSettings1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await settingsManager.setFeatureFlag('beta_feature', false)
      const newState: boolean = await settingsManager.toggleFeatureFlag('beta_feature')
      expect(newState).assertTrue()
      const toggledAgain: boolean = await settingsManager.toggleFeatureFlag('beta_feature')
      expect(toggledAgain).assertFalse()
    })

    /**
     * @tc.name   testAppSettings1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_1100
     * @tc.desc   Verify TaskPool concurrent feature flag check with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAppSettings1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const flagTasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        await settingsManager.setFeatureFlag(`flag${i}`, false)
        flagTasks.push(new taskpool.Task(checkFeatureFlagTask, settingsManager, `flag${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < flagTasks.length; i++) {
        promises.push(taskpool.execute(flagTasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as boolean).assertFalse()
      }
    })

    /**
     * @tc.name   testAppSettings1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_1200
     * @tc.desc   Verify sendData settings change notification via onReceiveData Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAppSettings1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const task: taskpool.Task = new taskpool.Task(notifySettingsChangeTask)
      const receivePromise: Promise<string> = new Promise<string>((resolve: (value: string) => void): void => {
        task.onReceiveData((data: Object): void => {
          const d: Record<string, Object> = data as Record<string, Object>
          resolve(d['key'] as string)
        })
      })
      await taskpool.execute(task)
      const notificationKey: string = await receivePromise
      expect(notificationKey).assertEqual('updated_key')
    })

    /**
     * @tc.name   testAppSettings1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_1300
     * @tc.desc   Verify onReceiveData receiving multiple notifications via Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAppSettings1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const notifications: Record<string, Object>[] = []
      const task: taskpool.Task = new taskpool.Task(multiNotifySettingsTask)
      const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
        task.onReceiveData((data: Object): void => {
          notifications.push(data as Record<string, Object>)
          if (notifications.length >= 3) {
            resolve()
          }
        })
      })
      await taskpool.execute(task)
      await receivePromise
      expect(notifications.length).assertEqual(3)
      expect(notifications[0]['key'] as string).assertEqual('key1')
      expect(notifications[2]['key'] as string).assertEqual('key3')
    })

    /**
     * @tc.name   testAppSettings1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_1400
     * @tc.desc   Verify callback nested setting update via onReceiveData Promise and Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAppSettings1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const task: taskpool.Task = new taskpool.Task(triggerSettingsUpdateTask)
      const nestedPromises: Promise<Object>[] = []
      const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
        task.onReceiveData((): void => {
          const innerTask: taskpool.Task = new taskpool.Task(updateSettingTask, settingsManager, 'nested_key', 'nested_value')
          nestedPromises.push(taskpool.execute(innerTask))
          resolve()
        })
      })
      await taskpool.execute(task)
      await receivePromise
      await Promise.all(nestedPromises)
      expect(nestedPromises.length).assertEqual(1)
      expect(await settingsManager.getSetting('nested_key')).assertEqual('nested_value')
    })

    /**
     * @tc.name   testAppSettings1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APP_SETTINGS_TEST_1500
     * @tc.desc   Verify string setting values including numeric- and boolean-like strings are stored and retrieved as string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppSettings1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await settingsManager.setSetting('string_setting', 'text_value')
      await settingsManager.setSetting('numeric_setting', '42')
      await settingsManager.setSetting('boolean_setting', 'true')
      const strVal: string | undefined = await settingsManager.getSetting('string_setting')
      const numVal: string | undefined = await settingsManager.getSetting('numeric_setting')
      const boolVal: string | undefined = await settingsManager.getSetting('boolean_setting')
      expect(typeof strVal).assertEqual('string')
      expect(typeof numVal).assertEqual('string')
      expect(typeof boolVal).assertEqual('string')
      expect(strVal).assertEqual('text_value')
      expect(numVal).assertEqual('42')
      expect(boolVal).assertEqual('true')
    })
  })
}
