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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ServiceVersion {
  public name: string = ''
  public version: string = ''
  public config: collections.Map<string, string>

  constructor(config: collections.Map<string, string>) {
    this.config = config
  }

  public updateTime: number = 0
}

@Sendable
class ServiceHotUpdater {
  public versions_: collections.Map<string, ServiceVersion>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(versions_: collections.Map<string, ServiceVersion>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.versions_ = versions_
    this.lock_ = lock_
  }

  public updateCount_: number = 0

  async deploy(name: string, version: string, config: collections.Map<string, string>): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const svcVersion: ServiceVersion = new ServiceVersion(config)
      svcVersion.name = name
      svcVersion.version = version
      svcVersion.updateTime = Date.now()
      this.versions_.set(name, svcVersion)
      this.updateCount_++
    })
  }

  async hotUpdate(name: string, newVersion: string, newConfig: collections.Map<string, string>): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const existing: ServiceVersion | undefined = this.versions_.get(name)
      if (existing !== undefined) {
        existing.version = newVersion
        existing.config = newConfig
        existing.updateTime = Date.now()
        this.updateCount_++
        return true
      }
      return false
    })
  }

  async rollback(name: string, previousVersion: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const existing: ServiceVersion | undefined = this.versions_.get(name)
      if (existing !== undefined) {
        existing.version = previousVersion
        existing.updateTime = Date.now()
        return true
      }
      return false
    })
  }

  getVersion(name: string): ServiceVersion | undefined {
    return this.versions_.get(name)
  }

  getUpdateCount(): number {
    return this.updateCount_
  }

  async updateConfig(name: string, key: string, value: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const existing: ServiceVersion | undefined = this.versions_.get(name)
      if (existing !== undefined) {
        existing.config.set(key, value)
        existing.updateTime = Date.now()
        return true
      }
      return false
    })
  }
}

@Concurrent
async function hotUpdateTask(updater: ServiceHotUpdater, name: string, version: string): Promise<void> {
  const newConfig: collections.Map<string, string> = new collections.Map<string, string>()
  newConfig.set('timeout', '5000')
  await updater.hotUpdate(name, version, newConfig)
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsServiceHotUpdateTest(): void {
  describe('BuiltinsServiceHotUpdateTest', (): void => {
    const hotUpdater: ServiceHotUpdater = new ServiceHotUpdater(new collections.Map<string, ServiceVersion>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach(async (): Promise<void> => {
      await hotUpdater.lock_.lockAsync((): void => {
        hotUpdater.versions_.clear()
        hotUpdater.updateCount_ = 0
      })
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testServiceHotUpdate0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0100
     * @tc.desc   Verify testServiceHotUpdate0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceHotUpdate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      config.set('port', '8080')

      await hotUpdater.deploy('webApp', '1.0.0', config)

      const version: ServiceVersion | undefined = hotUpdater.getVersion('webApp')
      expect(version !== undefined).assertTrue()
      expect(version!.version).assertEqual('1.0.0')
    })

    /**
     * @tc.name   testServiceHotUpdate0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0200
     * @tc.desc   Verify testServiceHotUpdate0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceHotUpdate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const initialConfig: collections.Map<string, string> = new collections.Map<string, string>()
      await hotUpdater.deploy('apiApp', '1.0.0', initialConfig)

      const newConfig: collections.Map<string, string> = new collections.Map<string, string>()
      newConfig.set('timeout', '3000')
      const result: boolean = await hotUpdater.hotUpdate('apiApp', '2.0.0', newConfig)

      expect(result).assertTrue()
      expect(hotUpdater.getVersion('apiApp')!.version).assertEqual('2.0.0')
    })

    /**
     * @tc.name   testServiceHotUpdate0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0300
     * @tc.desc   Verify testServiceHotUpdate0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testServiceHotUpdate0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      const result: boolean = await hotUpdater.hotUpdate('nonexistent', '2.0.0', config)

      expect(result).assertFalse()
    })

    /**
     * @tc.name   testServiceHotUpdate0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0400
     * @tc.desc   Verify testServiceHotUpdate0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceHotUpdate0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      await hotUpdater.deploy('rollbackApp', '1.0.0', config)
      await hotUpdater.hotUpdate('rollbackApp', '2.0.0', config)

      const result: boolean = await hotUpdater.rollback('rollbackApp', '1.0.0')

      expect(result).assertTrue()
      expect(hotUpdater.getVersion('rollbackApp')!.version).assertEqual('1.0.0')
    })

    /**
     * @tc.name   testServiceHotUpdate0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0500
     * @tc.desc   Verify testServiceHotUpdate0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceHotUpdate0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      await hotUpdater.deploy('configApp', '1.0.0', config)

      const result: boolean = await hotUpdater.updateConfig('configApp', 'maxConnections', '100')

      expect(result).assertTrue()
      expect(hotUpdater.getVersion('configApp')!.config.get('maxConnections')).assertEqual('100')
    })

    /**
     * @tc.name   testServiceHotUpdate0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0600
     * @tc.desc   Verify testServiceHotUpdate0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceHotUpdate0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      await hotUpdater.deploy('countApp', '1.0.0', config)
      expect(hotUpdater.getUpdateCount()).assertEqual(1)

      await hotUpdater.hotUpdate('countApp', '2.0.0', config)
      expect(hotUpdater.getUpdateCount()).assertEqual(2)
    })

    /**
     * @tc.name   testServiceHotUpdate0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0700
     * @tc.desc   Verify testServiceHotUpdate0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceHotUpdate0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      await hotUpdater.deploy('concurrentApp', '1.0.0', config)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(hotUpdateTask, hotUpdater, 'concurrentApp', `2.${i}.0`))
      }
      await executeTasksGetObjects(tasks)

      expect(hotUpdater.getUpdateCount() > 1).assertTrue()
    })

    /**
     * @tc.name   testServiceHotUpdate0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0800
     * @tc.desc   Verify testServiceHotUpdate0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceHotUpdate0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      await hotUpdater.deploy('timeApp', '1.0.0', config)
      const deployTime: number = hotUpdater.getVersion('timeApp')!.updateTime

      await Utils.sleep(500)
      await hotUpdater.hotUpdate('timeApp', '2.0.0', config)
      const updateTime: number = hotUpdater.getVersion('timeApp')!.updateTime

      expect(updateTime > deployTime).assertTrue()
    })

    /**
     * @tc.name   testServiceHotUpdate0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_0900
     * @tc.desc   Verify testServiceHotUpdate0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceHotUpdate0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      const services: string[] = ['deploy1', 'deploy2', 'deploy3']

      for (const svc of services) {
        await hotUpdater.deploy(svc, '1.0.0', config)
      }

      expect(hotUpdater.getUpdateCount()).assertEqual(3)
    })

    /**
     * @tc.name   testServiceHotUpdate1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_1000
     * @tc.desc   Verify testServiceHotUpdate1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceHotUpdate1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      const services: string[] = []
      for (let i: number = 0; i < 5; i++) {
        services.push(`deploySvc${i}`)
      }

      for (const svc of services) {
        await hotUpdater.deploy(svc, '1.0.0', config)
      }

      expect(hotUpdater.getUpdateCount()).assertEqual(5)
    })

    /**
     * @tc.name   testServiceHotUpdate1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_1100
     * @tc.desc   Verify testServiceHotUpdate1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceHotUpdate1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const config: collections.Map<string, string> = new collections.Map<string, string>()
      const services: string[] = []
      for (let i: number = 0; i < 10; i++) {
        services.push(`deploySvc${i}`)
      }

      for (const svc of services) {
        await hotUpdater.deploy(svc, '1.0.0', config)
      }

      expect(hotUpdater.getUpdateCount()).assertEqual(10)
    })

    /**
     * @tc.name   testServiceHotUpdate1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEHOTUPDATE_TEST_1200
     * @tc.desc   Verify testServiceHotUpdate1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testServiceHotUpdate1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const result: boolean = await hotUpdater.rollback('nonexistent', '1.0.0')
      expect(result).assertFalse()
    })
  })
}
