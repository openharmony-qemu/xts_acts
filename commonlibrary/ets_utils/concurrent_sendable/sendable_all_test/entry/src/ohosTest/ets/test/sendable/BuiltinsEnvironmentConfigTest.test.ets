/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
import { Environment } from './SendableTestEnums'


@Sendable
class EnvironmentConfigManager {
  public currentEnv_: string = Environment.DEVELOPMENT
  public envConfigs_: collections.Map<string, collections.Map<string, string>>
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(lock_: ArkTSUtils.locks.AsyncLock, envConfigs_: collections.Map<string, collections.Map<string, string>>) {
    this.envConfigs_ = envConfigs_
    this.lock_ = lock_
  }

  async switchEnvironment(env: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.currentEnv_ = env
    })
  }

  async getCurrentEnvironment(): Promise<string> {
    return await this.lock_.lockAsync((): string => this.currentEnv_)
  }

  async setEnvConfig(env: string, key: string, value: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const configMap: collections.Map<string, string> | undefined = this.envConfigs_.get(env)
      if (configMap) {
        configMap.set(key, value)
      }
    })
  }

  async getEnvConfig(env: string, key: string): Promise<string | undefined> {
    return await this.lock_.lockAsync((): string | undefined => {
      const configMap: collections.Map<string, string> | undefined = this.envConfigs_.get(env)
      if (configMap) {
        return configMap.get(key)
      }
      return undefined
    })
  }

  async getCurrentConfig(key: string): Promise<string | undefined> {
    return await this.lock_.lockAsync((): string | undefined => {
      const configMap: collections.Map<string, string> | undefined = this.envConfigs_.get(this.currentEnv_)
      if (configMap) {
        return configMap.get(key)
      }
      return undefined
    })
  }

  async loadEnvConfigs(env: string, keys: string[], values: string[]): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const configMap: collections.Map<string, string> | undefined = this.envConfigs_.get(env)
      if (configMap) {
        for (let i = 0; i < keys.length; i++) {
          configMap.set(keys[i], values[i])
        }
      }
    })
  }

  async getEnvConfigSize(env: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const configMap: collections.Map<string, string> | undefined = this.envConfigs_.get(env)
      if (configMap) {
        return configMap.size
      }
      return 0
    })
  }

  async clearAll(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.envConfigs_.forEach((configMap: collections.Map<string, string>): void => {
        configMap.clear()
      })
      this.currentEnv_ = Environment.DEVELOPMENT
    })
  }
}

@Concurrent
function readEnvConfigTask(manager: EnvironmentConfigManager, key: string): string | undefined {
  const configMap: collections.Map<string, string> | undefined = manager.envConfigs_.get(manager.currentEnv_)
  if (configMap) {
    return configMap.get(key)
  }
  return undefined
}

@Concurrent
function getCurrentEnvTask(manager: EnvironmentConfigManager): string {
  return manager.currentEnv_
}

export default function BuiltinsEnvironmentConfigTest(): void {
  describe('BuiltinsEnvironmentConfigTest', (): void => {
    let envManager: EnvironmentConfigManager

    beforeEach((): void => {
      const envConfigs: collections.Map<string, collections.Map<string, string>> = new collections.Map<string, collections.Map<string, string>>()
      envConfigs.set(Environment.DEVELOPMENT, new collections.Map<string, string>())
      envConfigs.set(Environment.TESTING, new collections.Map<string, string>())
      envConfigs.set(Environment.PRODUCTION, new collections.Map<string, string>())
      envManager = new EnvironmentConfigManager(new ArkTSUtils.locks.AsyncLock(), envConfigs)
    })
    /**
     * @tc.name   testEnvironmentConfig0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0100
     * @tc.desc   Verify default environment is DEVELOPMENT on initialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(await envManager.getCurrentEnvironment()).assertEqual(Environment.DEVELOPMENT)
    })

    /**
     * @tc.name   testEnvironmentConfig0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0200
     * @tc.desc   Verify three environment config containers are initialized empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(await envManager.getEnvConfigSize(Environment.DEVELOPMENT)).assertEqual(0)
      expect(await envManager.getEnvConfigSize(Environment.TESTING)).assertEqual(0)
      expect(await envManager.getEnvConfigSize(Environment.PRODUCTION)).assertEqual(0)
    })

    /**
     * @tc.name   testEnvironmentConfig0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0300
     * @tc.desc   Verify setting development environment config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.setEnvConfig(Environment.DEVELOPMENT, 'debug', 'true')
      await envManager.setEnvConfig(Environment.DEVELOPMENT, 'log_level', 'verbose')
      expect(await envManager.getEnvConfig(Environment.DEVELOPMENT, 'debug')).assertEqual('true')
      expect(await envManager.getEnvConfig(Environment.DEVELOPMENT, 'log_level')).assertEqual('verbose')
      expect(await envManager.getEnvConfigSize(Environment.DEVELOPMENT)).assertEqual(2)
    })

    /**
     * @tc.name   testEnvironmentConfig0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0400
     * @tc.desc   Verify setting testing environment config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.setEnvConfig(Environment.TESTING, 'mock_api', 'true')
      await envManager.setEnvConfig(Environment.TESTING, 'test_data', 'sample')
      expect(await envManager.getEnvConfig(Environment.TESTING, 'mock_api')).assertEqual('true')
      expect(await envManager.getEnvConfig(Environment.TESTING, 'test_data')).assertEqual('sample')
      expect(await envManager.getEnvConfigSize(Environment.TESTING)).assertEqual(2)
    })

    /**
     * @tc.name   testEnvironmentConfig0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0500
     * @tc.desc   Verify setting production environment config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.setEnvConfig(Environment.PRODUCTION, 'ssl', 'enabled')
      await envManager.setEnvConfig(Environment.PRODUCTION, 'cache', 'redis')
      expect(await envManager.getEnvConfig(Environment.PRODUCTION, 'ssl')).assertEqual('enabled')
      expect(await envManager.getEnvConfig(Environment.PRODUCTION, 'cache')).assertEqual('redis')
      expect(await envManager.getEnvConfigSize(Environment.PRODUCTION)).assertEqual(2)
    })

    /**
     * @tc.name   testEnvironmentConfig0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0600
     * @tc.desc   Verify getting current environment config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.setEnvConfig(Environment.DEVELOPMENT, 'app_name', 'DevApp')
      const currentConfig: string | undefined = await envManager.getCurrentConfig('app_name')
      expect(currentConfig).assertEqual('DevApp')
    })

    /**
     * @tc.name   testEnvironmentConfig0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0700
     * @tc.desc   Verify switching to testing environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.setEnvConfig(Environment.DEVELOPMENT, 'mode', 'dev')
      await envManager.setEnvConfig(Environment.TESTING, 'mode', 'test')
      await envManager.switchEnvironment(Environment.TESTING)
      expect(await envManager.getCurrentEnvironment()).assertEqual(Environment.TESTING)
      expect(await envManager.getCurrentConfig('mode')).assertEqual('test')
    })

    /**
     * @tc.name   testEnvironmentConfig0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0800
     * @tc.desc   Verify switching to production environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.setEnvConfig(Environment.PRODUCTION, 'performance', 'optimized')
      await envManager.switchEnvironment(Environment.PRODUCTION)
      expect(await envManager.getCurrentEnvironment()).assertEqual(Environment.PRODUCTION)
      expect(await envManager.getCurrentConfig('performance')).assertEqual('optimized')
    })

    /**
     * @tc.name   testEnvironmentConfig0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_0900
     * @tc.desc   Verify switching back to development environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.switchEnvironment(Environment.TESTING)
      await envManager.switchEnvironment(Environment.DEVELOPMENT)
      expect(await envManager.getCurrentEnvironment()).assertEqual(Environment.DEVELOPMENT)
    })

    /**
     * @tc.name   testEnvironmentConfig1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_1000
     * @tc.desc   Verify config isolation after environment switch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.setEnvConfig(Environment.DEVELOPMENT, 'env_specific', 'dev_value')
      await envManager.setEnvConfig(Environment.TESTING, 'env_specific', 'test_value')
      await envManager.setEnvConfig(Environment.PRODUCTION, 'env_specific', 'prod_value')
      await envManager.switchEnvironment(Environment.TESTING)
      expect(await envManager.getCurrentConfig('env_specific')).assertEqual('test_value')
      await envManager.switchEnvironment(Environment.PRODUCTION)
      expect(await envManager.getCurrentConfig('env_specific')).assertEqual('prod_value')
      await envManager.switchEnvironment(Environment.DEVELOPMENT)
      expect(await envManager.getCurrentConfig('env_specific')).assertEqual('dev_value')
    })

    /**
     * @tc.name   testEnvironmentConfig1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_1100
     * @tc.desc   Verify TaskPool concurrent read current env config with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnvironmentConfig1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await envManager.loadEnvConfigs(
        Environment.DEVELOPMENT,
        ['config1', 'config2', 'config3'],
        ['value1', 'value2', 'value3']
      )
      const tasks: taskpool.Task[] = []
      for (let i = 1; i <= 3; i++) {
        tasks.push(new taskpool.Task(readEnvConfigTask, envManager, `config${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(3)
      expect(results[0] as string).assertEqual('value1')
      expect(results[1] as string).assertEqual('value2')
      expect(results[2] as string).assertEqual('value3')
    })

    /**
     * @tc.name   testEnvironmentConfig1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_1200
     * @tc.desc   Verify TaskPool concurrent get current environment with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnvironmentConfig1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(getCurrentEnvTask, envManager))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as string).assertEqual(Environment.DEVELOPMENT)
      }
    })

    /**
     * @tc.name   testEnvironmentConfig1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_1300
     * @tc.desc   Verify batch loading development environment configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.loadEnvConfigs(
        Environment.DEVELOPMENT,
        ['api_url', 'timeout', 'retry', 'log_level'],
        ['http://localhost:8080', '5000', '3', 'debug']
      )
      expect(await envManager.getEnvConfigSize(Environment.DEVELOPMENT)).assertEqual(4)
      expect(await envManager.getCurrentConfig('api_url')).assertEqual('http://localhost:8080')
    })

    /**
     * @tc.name   testEnvironmentConfig1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_1400
     * @tc.desc   Verify batch loading production environment configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await envManager.loadEnvConfigs(
        Environment.PRODUCTION,
        ['api_url', 'timeout', 'ssl', 'cache'],
        ['https://api.example.com', '10000', 'enabled', 'redis']
      )
      await envManager.switchEnvironment(Environment.PRODUCTION)
      expect(await envManager.getEnvConfigSize(Environment.PRODUCTION)).assertEqual(4)
      expect(await envManager.getCurrentConfig('api_url')).assertEqual('https://api.example.com')
    })

    /**
     * @tc.name   testEnvironmentConfig1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ENVIRONMENT_CONFIG_TEST_1500
     * @tc.desc   Verify config integrity after batch loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvironmentConfig1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const keys: string[] = ['key1', 'key2', 'key3']
      const values: string[] = ['val1', 'val2', 'val3']
      await envManager.loadEnvConfigs(Environment.TESTING, keys, values)
      await envManager.switchEnvironment(Environment.TESTING)
      for (let i = 0; i < keys.length; i++) {
        const value: string | undefined = await envManager.getCurrentConfig(keys[i])
        expect(value).assertEqual(values[i])
      }
    })
  })
}
