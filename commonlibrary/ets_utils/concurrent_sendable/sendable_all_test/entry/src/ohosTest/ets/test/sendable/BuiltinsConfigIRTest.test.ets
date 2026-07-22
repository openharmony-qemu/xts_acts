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
import Utils from '../utils'

@Sendable
class IRConfigManager {
  public version_: number = 0
  public updateTime_: number = 0
  public configCount_: number = 0
  public configMap_: collections.Map<string, string>

  constructor(configMap_: collections.Map<string, string>) {
    this.configMap_ = configMap_
  }


  getIRStats(): number[] {
    return [this.version_, this.updateTime_, this.configCount_]
  }
}

@Sendable
class ICConfigManager {
  public configMap_: collections.Map<string, string>

  constructor(configMap_: collections.Map<string, string>) {
    this.configMap_ = configMap_
  }


  set(k: string, v: string): void {
    this.configMap_.set(k, v)
  }

  get(k: string): string | undefined {
    return this.configMap_.get(k)
  }
}

@Sendable
class StandardConfigManager {
  public capacity_: number = 100
  public configMap_: collections.Map<string, string>

  constructor(configMap_: collections.Map<string, string>) {
    this.configMap_ = configMap_
  }

}

@Sendable
class LargeConfigManager {
  public configMap_: collections.Map<string, number>

  constructor(configMap_: collections.Map<string, number>) {
    this.configMap_ = configMap_
  }

}

@Sendable
class ConcurrentConfigManager {
  public configMap_: collections.Map<string, string>

  constructor(configMap_: collections.Map<string, string>) {
    this.configMap_ = configMap_
  }

}

@Concurrent
function readConfigValue(c: ConcurrentConfigManager, k: string): string | undefined {
  return c.configMap_.get(k)
}

@Sendable
class ConfigPropertyIR {
  public version_: number = 0
  public loaded_: boolean = false
  public status_: number = 0

  markLoaded(): void {
    this.loaded_ = true
    this.status_ = 1
    this.version_++
  }

  getIRStatus(): number[] {
    return [this.version_, this.loaded_ ? 1 : 0, this.status_]
  }
}

@Sendable
class ConfigMethodIR {
  public configMap_: collections.Map<string, string>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(configMap_: collections.Map<string, string>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.configMap_ = configMap_
    this.lock_ = lock_
  }


  async setConfig(k: string, v: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.configMap_.set(k, v)
    })
  }

  async getConfig(k: string): Promise<string | undefined> {
    return await this.lock_.lockAsync((): string | undefined => this.configMap_.get(k))
  }
}

@Sendable
class CrossThreadConfig {
  public version_: number = 10
  public configMap_: collections.Map<string, number>

  constructor(configMap_: collections.Map<string, number>) {
    this.configMap_ = configMap_
  }

}

@Concurrent
function readCrossThreadConfig(c: CrossThreadConfig, k: string): number | undefined {
  return c.configMap_.get(k)
}

@Concurrent
function readCrossThreadVersion(c: CrossThreadConfig): number {
  return c.version_
}

@Sendable
class BatchConfigManager {
  public configMap_: collections.Map<string, string>

  constructor(configMap_: collections.Map<string, string>) {
    this.configMap_ = configMap_
  }

  public version_: number = 0

  batchSet(keys: string[], values: string[]): void {
    for (let i = 0; i < keys.length; i++) {
      this.configMap_.set(keys[i], values[i])
    }
    this.version_++
  }

  getCount(): number {
    return this.configMap_.size
  }
}

export default function BuiltinsConfigIRTest(): void {
  describe('BuiltinsConfigIRTest', (): void => {
    afterEach((): void => {})

    /**
     * @tc.name   BuiltinsConfigIRTest0100
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0100
     * @tc.desc   Verify config manager fixed property IR verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigIRTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const config: IRConfigManager = new IRConfigManager(new collections.Map<string, string>())
      const stats: number[] = config.getIRStats()
      expect(stats[0]).assertEqual(0)
      expect(stats[2]).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsConfigIRTest0200
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0200
     * @tc.desc   Verify config access IC cache verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigIRTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const config: ICConfigManager = new ICConfigManager(new collections.Map<string, string>())
      config.set('key1', 'value1')
      for (let i = 0; i < 100; i++) {
        const value: string | undefined = config.get('key1')
        expect(value).assertEqual('value1')
      }
    })

    /**
     * @tc.name   BuiltinsConfigIRTest0300
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0300
     * @tc.desc   Verify same capacity config manager HiddenClass sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigIRTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const config1: StandardConfigManager = new StandardConfigManager(new collections.Map<string, string>())
      const config2: StandardConfigManager = new StandardConfigManager(new collections.Map<string, string>())
      expect(config1.capacity_).assertEqual(config2.capacity_)
    })

    /**
     * @tc.name   BuiltinsConfigIRTest0400
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0400
     * @tc.desc   Verify config element count > 1024 dictionary mode trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigIRTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const config: LargeConfigManager = new LargeConfigManager(new collections.Map<string, number>())
      for (let i = 0; i < 1025; i++) {
        config.configMap_.set(`cfg_${i}`, i)
      }
      expect(config.configMap_.size).assertEqual(1025)
      expect(config.configMap_.get('cfg_1024')).assertEqual(1024)
    })

    /**
     * @tc.name   BuiltinsConfigIRTest0500
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0500
     * @tc.desc   Verify multiple config IR objects concurrent access with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConfigIRTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const config: ConcurrentConfigManager = new ConcurrentConfigManager(new collections.Map<string, string>())
      for (let i = 0; i < 100; i++) {
        config.configMap_.set(`k_${i}`, `v_${i}`)
      }
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(readConfigValue, config, `k_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < 100; i++) {
        expect(results[i] as string).assertEqual(`v_${i}`)
      }
    })

    /**
     * @tc.name   BuiltinsConfigIRTest0600
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0600
     * @tc.desc   Verify config IR object property access verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigIRTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const config: ConfigPropertyIR = new ConfigPropertyIR()
      config.markLoaded()
      const status: number[] = config.getIRStatus()
      expect(status[0]).assertEqual(1)
      expect(status[1]).assertEqual(1)
      expect(status[2]).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsConfigIRTest0700
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0700
     * @tc.desc   Verify config IR object method call verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigIRTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const config: ConfigMethodIR = new ConfigMethodIR(new collections.Map<string, string>(), new ArkTSUtils.locks.AsyncLock())
      await config.setConfig('method_key', 'method_value')
      const value: string | undefined = await config.getConfig('method_key')
      expect(value).assertEqual('method_value')
    })

    /**
     * @tc.name   BuiltinsConfigIRTest0800
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0800
     * @tc.desc   Verify config IR object TaskPool transfer verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConfigIRTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const config: CrossThreadConfig = new CrossThreadConfig(new collections.Map<string, number>())
      config.configMap_.set('shared_key', 42)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readCrossThreadConfig, config, 'shared_key'))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < 10; i++) {
        expect(results[i] as number).assertEqual(42)
      }
    })

    /**
     * @tc.name   BuiltinsConfigIRTest0900
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_0900
     * @tc.desc   Verify config IR object cross-thread property access verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConfigIRTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const config: CrossThreadConfig = new CrossThreadConfig(new collections.Map<string, number>())
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readCrossThreadVersion, config))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < 10; i++) {
        expect(results[i] as number).assertEqual(10)
      }
    })

    /**
     * @tc.name   BuiltinsConfigIRTest1000
     * @tc.number SUB_BUILTINS_CONFIG_IR_TEST_1000
     * @tc.desc   Verify config IR object batch operation verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsConfigIRTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const config: BatchConfigManager = new BatchConfigManager(new collections.Map<string, string>())
      const keys: string[] = []
      const values: string[] = []
      for (let i = 0; i < 50; i++) {
        keys.push(`batch_key_${i}`)
        values.push(`batch_value_${i}`)
      }
      config.batchSet(keys, values)
      expect(config.getCount()).assertEqual(50)
      expect(config.version_).assertEqual(1)
    })
  })
}
