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
import { freezeObject, isObjectFrozen } from './FreezeHelper';

@Sendable
class ConfigData {
  apiUrl: string = ''
  timeout: number = 0
  retries: number = 0
}

@Sendable
class ReadOnlyConfig {
  appId: string = ''
  maxConnections: number = 0
  enabled: boolean = false
}

@Sendable
class FrozenData {
  value: number = 0
  label: string = ''
}

@Sendable
class ImmutableConfig {
  version: string = '1.0.0'
  maxItems: number = 1000
  enableCache: boolean = true
}

@Sendable
class InnerConfig {
  innerValue: number = 0
}

@Sendable
class OuterConfig {
  outerValue: number = 0
  inner: InnerConfig = new InnerConfig()
}

@Concurrent
function readConfig(config: ConfigData): string {
  return 'URL: ' + config.apiUrl + ', Timeout: ' + config.timeout.toString()
}

@Concurrent
function readConfigValue(config: ReadOnlyConfig): string {
  return config.appId + '|' + config.maxConnections.toString() + '|' + config.enabled.toString()
}

@Concurrent
function readAnotherValue(config: ReadOnlyConfig): number {
  return config.maxConnections
}

@Concurrent
function tryModifyFrozen(data: FrozenData): string {
  data.value = 100
  return 'Modified'
}

@Concurrent
function readVersion(config: ImmutableConfig): string {
  return config.version
}

@Concurrent
function readMaxItems(config: ImmutableConfig): number {
  return config.maxItems
}

@Concurrent
function checkCache(config: ImmutableConfig): boolean {
  return config.enableCache
}

@Concurrent
function readNestedConfig(config: OuterConfig): string {
  return 'Outer: ' + config.outerValue.toString() + ', Inner: ' + config.inner.innerValue.toString()
}

@Concurrent
function verifyIsSendable(data: FrozenData): boolean {
  return ArkTSUtils.isSendable(data)
}

export default function SendableFreezeTest(): void {
  describe('SendableFreezeTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   SendableFreezeTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0100
     * @tc.desc   Verify Object freeze via ts helper freezes Sendable object successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableFreezeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: ConfigData = new ConfigData()
      config.apiUrl = 'https://api.example.com'
      config.timeout = 30000
      config.retries = 3

      freezeObject(config)
      expect(isObjectFrozen(config)).assertTrue()
    })

    /**
     * @tc.name   SendableFreezeTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0200
     * @tc.desc   Verify frozen Sendable object properties are readable across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableFreezeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: ReadOnlyConfig = new ReadOnlyConfig()
      config.appId = 'APP_001'
      config.maxConnections = 100
      config.enabled = true

      freezeObject(config)

      let task: taskpool.Task = new taskpool.Task(readConfigValue, config)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('APP_001|100|true')
    })

    /**
     * @tc.name   SendableFreezeTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0300
     * @tc.desc   Verify frozen Sendable object can be transferred to TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableFreezeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: ConfigData = new ConfigData()
      config.apiUrl = 'https://test.api.com'
      config.timeout = 5000
      config.retries = 1

      freezeObject(config)

      let task: taskpool.Task = new taskpool.Task(readConfig, config)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('URL: https://test.api.com, Timeout: 5000')
    })

    /**
     * @tc.name   SendableFreezeTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0400
     * @tc.desc   Verify modifying frozen Sendable object property throws exception in task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableFreezeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: FrozenData = new FrozenData()
      data.value = 50
      data.label = 'original'

      freezeObject(data)

      let task: taskpool.Task = new taskpool.Task(tryModifyFrozen, data)
      let caughtError: boolean = false
      try {
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError = true
        
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   SendableFreezeTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0500
     * @tc.desc   Verify frozen Sendable object cannot be modified in main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableFreezeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: FrozenData = new FrozenData()
      data.value = 42
      data.label = 'test'

      freezeObject(data)

      let hasError: boolean = false
      try {
        data.value = 999
      } catch (e) {
        hasError = true
      }
      if (hasError) {
        expect(hasError).assertTrue()
      } else {
        expect(data.value).assertEqual(42)
      }
    })

    /**
     * @tc.name   SendableFreezeTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0600
     * @tc.desc   Verify frozen Sendable object is still Sendable after freeze
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableFreezeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: FrozenData = new FrozenData()
      data.value = 10
      data.label = 'frozen'

      expect(ArkTSUtils.isSendable(data)).assertTrue()
      freezeObject(data)
      expect(ArkTSUtils.isSendable(data)).assertTrue()
    })

    /**
     * @tc.name   SendableFreezeTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0700
     * @tc.desc   Verify multiple threads concurrently read frozen Sendable without lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableFreezeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: ImmutableConfig = new ImmutableConfig()
      freezeObject(config)

      let p1 = taskpool.execute(new taskpool.Task(readVersion, config))
      let p2 = taskpool.execute(new taskpool.Task(readMaxItems, config))
      let p3 = taskpool.execute(new taskpool.Task(checkCache, config))
      let p4 = taskpool.execute(new taskpool.Task(readVersion, config))
      let p5 = taskpool.execute(new taskpool.Task(readVersion, config))

      let results: Array<Object> = await Promise.all([p1, p2, p3, p4, p5])
      expect(results.length).assertEqual(5)
      expect(results[0] as string).assertEqual('1.0.0')
      expect(results[1] as number).assertEqual(1000)
      expect(results[2] as boolean).assertTrue()
      expect(results[3] as string).assertEqual('1.0.0')
      expect(results[4] as string).assertEqual('1.0.0')
    })

    /**
     * @tc.name   SendableFreezeTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0800
     * @tc.desc   Verify nested Sendable objects can be frozen and read across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableFreezeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outer: OuterConfig = new OuterConfig()
      outer.outerValue = 100
      outer.inner.innerValue = 50

      freezeObject(outer)

      let task: taskpool.Task = new taskpool.Task(readNestedConfig, outer)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('Outer: 100, Inner: 50')
    })

    /**
     * @tc.name   SendableFreezeTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_0900
     * @tc.desc   Verify repeated freeze on same Sendable object is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableFreezeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: FrozenData = new FrozenData()
      data.value = 77
      data.label = 'idempotent'

      freezeObject(data)
      expect(isObjectFrozen(data)).assertTrue()

      freezeObject(data)
      expect(isObjectFrozen(data)).assertTrue()

      let task: taskpool.Task = new taskpool.Task(tryModifyFrozen, data)
      let caughtError: boolean = false
      try {
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError = true
        
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   SendableFreezeTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_1000
     * @tc.desc   Verify freeze operation has minimal performance overhead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SendableFreezeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let config: ConfigData = new ConfigData()
      config.apiUrl = 'https://perf.test.com'
      config.timeout = 1000
      config.retries = 5

      let startTime: number = Date.now()
      freezeObject(config)
      let freezeTime: number = Date.now() - startTime

      expect(freezeTime < 1000).assertTrue()
      expect(isObjectFrozen(config)).assertTrue()
    })

    /**
     * @tc.name   SendableFreezeTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_1100
     * @tc.desc   Verify frozen Sendable object passes isSendable check in worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableFreezeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: FrozenData = new FrozenData()
      data.value = 123
      data.label = 'verify'

      freezeObject(data)

      let task: taskpool.Task = new taskpool.Task(verifyIsSendable, data)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   SendableFreezeTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_FREEZE_TEST_1200
     * @tc.desc   Verify frozen ReadOnlyConfig can be read from multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SendableFreezeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let config: ReadOnlyConfig = new ReadOnlyConfig()
      config.appId = 'MULTI'
      config.maxConnections = 50
      config.enabled = true

      freezeObject(config)

      let p1 = taskpool.execute(new taskpool.Task(readConfigValue, config))
      let p2 = taskpool.execute(new taskpool.Task(readAnotherValue, config))

      let results: Array<Object> = await Promise.all([p1, p2])
      expect(results[0] as string).assertEqual('MULTI|50|true')
      expect(results[1] as number).assertEqual(50)
    })
  })
}
