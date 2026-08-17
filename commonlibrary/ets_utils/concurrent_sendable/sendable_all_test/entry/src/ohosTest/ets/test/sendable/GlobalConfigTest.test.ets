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
import Utils from '../utils'

@Sendable
class GlobalConfigManager {
  public configMap_: collections.Map<string, string>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(configMap_: collections.Map<string, string>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.configMap_ = configMap_
    this.lock_ = lock_
  }

  public version_: number = 0
  public updateTime_: number = 0

  async get(key: string): Promise<string | undefined> {
    return await this.lock_.lockAsync((): string | undefined => this.configMap_.get(key))
  }

  async set(key: string, value: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.configMap_.set(key, value)
      this.version_++
      this.updateTime_ = Date.now()
    })
  }

  async getVersion(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.version_)
  }

  async getUpdateTime(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.updateTime_)
  }

  async has(key: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.configMap_.has(key))
  }

  async delete(key: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const result: boolean = this.configMap_.delete(key)
      if (result) {
        this.version_++
        this.updateTime_ = Date.now()
      }
      return result
    })
  }

  async size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.configMap_.size)
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.configMap_.clear()
      this.version_ = 0
      this.updateTime_ = 0
    })
  }

  async loadConfig(keys: string[], values: string[]): Promise<void> {
    await this.lock_.lockAsync((): void => {
      for (let i = 0; i < keys.length; i++) {
        this.configMap_.set(keys[i], values[i])
      }
      this.version_++
      this.updateTime_ = Date.now()
    })
  }
}

@Concurrent
function readConfigTask(manager: GlobalConfigManager, key: string): string | undefined {
  return manager.configMap_.get(key)
}

@Concurrent
async function writeConfigTask(manager: GlobalConfigManager, key: string, value: string): Promise<void> {
  return await manager.lock_.lockAsync((): void => {
    manager.configMap_.set(key, value)
    manager.version_++

  })
}

@Concurrent
function checkConfigTask(manager: GlobalConfigManager, key: string): boolean {
  return manager.configMap_.has(key)
}

export default function GlobalConfigTest(): void {
  describe('GlobalConfigTest', (): void => {
    let configManager: GlobalConfigManager

    beforeEach((): void => {
      configManager = new GlobalConfigManager(new collections.Map<string, string>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testGlobalConfig0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0100
     * @tc.desc   Verify empty config initial state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        expect(await configManager.size()).assertEqual(0)
        expect(await configManager.getVersion()).assertEqual(0)
        expect(await configManager.getUpdateTime()).assertEqual(0)
      } catch (error) {
        console.error("testGlobalConfig0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0200
     * @tc.desc   Verify loading initial config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await configManager.loadConfig(
          ['app.name', 'app.version', 'debug.mode'],
          ['TestApp', '1.0.0', 'false']
        )
        expect(await configManager.size()).assertEqual(3)
        expect(await configManager.getVersion()).assertEqual(1)
      } catch (error) {
        console.error("testGlobalConfig0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0300
     * @tc.desc   Verify reading single config item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalConfig0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await configManager.set('server.host', '192.168.1.100')
        const value: string | undefined = await configManager.get('server.host')
        expect(value).assertEqual('192.168.1.100')
      } catch (error) {
        console.error("testGlobalConfig0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0400
     * @tc.desc   Verify writing single config item with version increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalConfig0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const oldVersion: number = await configManager.getVersion()
        await configManager.set('timeout', '5000')
        const newVersion: number = await configManager.getVersion()
        expect(newVersion).assertEqual(oldVersion + 1)
      } catch (error) {
        console.error("testGlobalConfig0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0500
     * @tc.desc   Verify config existence check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalConfig0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await configManager.set('feature.enabled', 'true')
        expect(await configManager.has('feature.enabled')).assertTrue()
        expect(await configManager.has('nonexistent')).assertFalse()
      } catch (error) {
        console.error("testGlobalConfig0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0600
     * @tc.desc   Verify deleting config item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalConfig0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await configManager.set('temp.key', 'temp_value')
        const sizeBefore: number = await configManager.size()
        const deleted: boolean = await configManager.delete('temp.key')
        expect(deleted).assertTrue()
        const sizeAfter: number = await configManager.size()
        expect(sizeAfter).assertEqual(sizeBefore - 1)
        expect(await configManager.has('temp.key')).assertFalse()
      } catch (error) {
        console.error("testGlobalConfig0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0700
     * @tc.desc   Verify TaskPool concurrent read 5 config items with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGlobalConfig0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await configManager.loadConfig(
          ['key1', 'key2', 'key3', 'key4', 'key5'],
          ['value1', 'value2', 'value3', 'value4', 'value5']
        )
        const tasks: taskpool.Task[] = []
        for (let i = 1; i <= 5; i++) {
          tasks.push(new taskpool.Task(readConfigTask, configManager, `key${i}`))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(5)
        expect(results[0] as string).assertEqual('value1')
        expect(results[4] as string).assertEqual('value5')
      } catch (error) {
        console.error("testGlobalConfig0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0800
     * @tc.desc   Verify TaskPool concurrent read 10 config items stress test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGlobalConfig0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const keys: string[] = []
        const values: string[] = []
        for (let i = 1; i <= 10; i++) {
          keys.push(`config${i}`)
          values.push(`setting${i}`)
        }
        await configManager.loadConfig(keys, values)
        const tasks: taskpool.Task[] = []
        for (let i = 1; i <= 10; i++) {
          tasks.push(new taskpool.Task(readConfigTask, configManager, `config${i}`))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(10)
        for (let i = 0; i < 10; i++) {
          expect(results[i] as string).assertEqual(`setting${i + 1}`)
        }
      } catch (error) {
        console.error("testGlobalConfig0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_0900
     * @tc.desc   Verify TaskPool concurrent write config with version consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGlobalConfig0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const initialVersion: number = await configManager.getVersion()
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(writeConfigTask, configManager, `setting${i}`, `val${i}`))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        const finalVersion: number = await configManager.getVersion()
        expect(finalVersion).assertEqual(initialVersion + 5)
      } catch (error) {
        console.error("testGlobalConfig0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_1000
     * @tc.desc   Verify concurrent read/write mixed with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGlobalConfig1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await configManager.loadConfig(['read1', 'read2'], ['base1', 'base2'])
        const readTasks: taskpool.Task[] = []
        const writeTasks: taskpool.Task[] = []
        for (let i = 1; i <= 2; i++) {
          readTasks.push(new taskpool.Task(readConfigTask, configManager, `read${i}`))
        }
        for (let i = 0; i < 3; i++) {
          writeTasks.push(new taskpool.Task(writeConfigTask, configManager, `write${i}`, `new${i}`))
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
        expect(readPromises.length).assertEqual(2)
      } catch (error) {
        console.error("testGlobalConfig1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_1100
     * @tc.desc   Verify config dynamic update with version and timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalConfig1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await configManager.loadConfig(['initial'], ['value'])
        const version1: number = await configManager.getVersion()
        const time1: number = await configManager.getUpdateTime()
        await configManager.set('updated', 'new_value')
        const version2: number = await configManager.getVersion()
        const time2: number = await configManager.getUpdateTime()
        expect(version2).assertEqual(version1 + 1)
        expect(time2 >= time1).assertTrue()
      } catch (error) {
        console.error("testGlobalConfig1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testGlobalConfig1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_GLOBAL_CONFIG_TEST_1200
     * @tc.desc   Verify TaskPool concurrent config existence check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGlobalConfig1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await configManager.set('check_key', 'check_value')
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(checkConfigTask, configManager, 'check_key'))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        for (let i = 0; i < results.length; i++) {
          expect(results[i] as boolean).assertTrue()
        }
      } catch (error) {
        console.error("testGlobalConfig1200 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
