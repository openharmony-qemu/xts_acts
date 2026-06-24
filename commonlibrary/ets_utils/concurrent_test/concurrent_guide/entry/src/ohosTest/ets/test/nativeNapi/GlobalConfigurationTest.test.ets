/*
 * Copyright (c) 2026 RKH Corp.
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
import { ArkTSUtils, taskpool } from '@kit.ArkTS';

@Sendable
class GlobalConfig {
  isLogin: boolean = false
  user: string = ''
  wifiOn: boolean = true
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

  login(username: string): void {
    this.isLogin = true
    this.user = username
  }

  logout(): void {
    this.isLogin = false
    this.user = ''
  }

  getIsLogin(): boolean {
    return this.isLogin
  }

  getUser(): string {
    return this.user
  }

  setWifiState(state: boolean): void {
    this.wifiOn = state
  }

  isWifiOn(): boolean {
    return this.wifiOn
  }
}

@Concurrent
function readLoginStatus(config: GlobalConfig): boolean {
  return config.getIsLogin()
}

@Concurrent
function readUsername(config: GlobalConfig): string {
  return config.getUser()
}

@Concurrent
function readWifiState(config: GlobalConfig): boolean {
  return config.isWifiOn()
}

@Concurrent
function loginInWorker(config: GlobalConfig, username: string): boolean {
  config.login(username)
  return config.getIsLogin()
}

@Concurrent
function logoutInWorker(config: GlobalConfig): boolean {
  config.logout()
  return config.getIsLogin()
}

@Concurrent
function setWifiInWorker(config: GlobalConfig, state: boolean): boolean {
  config.setWifiState(state)
  return config.isWifiOn()
}

@Concurrent
async function writeWithLock(lock: ArkTSUtils.locks.AsyncLock, config: GlobalConfig, username: string): Promise<string> {
  let result: string = await lock.lockAsync((): string => {
    config.login(username)
    return config.getUser()
  })
  return result
}

@Concurrent
async function readWithLock(lock: ArkTSUtils.locks.AsyncLock, config: GlobalConfig): Promise<string> {
  let result: string = await lock.lockAsync((): string => {
    return config.getUser()
  })
  return result
}

@Concurrent
async function incrementWithLock(lock: ArkTSUtils.locks.AsyncLock, counter: SharedCounter): Promise<number> {
  let result: number = await lock.lockAsync((): number => {
    counter.count++
    return counter.count
  })
  return result
}

@Sendable
class SharedCounter {
  count: number = 0
}

export default function GlobalConfigurationTest(): void {
  describe('GlobalConfigurationTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   GlobalConfigurationTest0100
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0100
     * @tc.desc   Verify @Sendable class GlobalConfig definition and default state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalConfigurationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: GlobalConfig = new GlobalConfig()
      expect(config.getIsLogin()).assertFalse()
      expect(config.getUser()).assertEqual('')
      expect(config.isWifiOn()).assertTrue()
    })

    /**
     * @tc.name   GlobalConfigurationTest0200
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0200
     * @tc.desc   Verify AsyncLock creation with GlobalConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalConfigurationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: GlobalConfig = new GlobalConfig()
      expect(config.lock !== undefined).assertTrue()
    })

    /**
     * @tc.name   GlobalConfigurationTest0300
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0300
     * @tc.desc   Verify lockAsync EXCLUSIVE mode write operation with login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalConfigurationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: GlobalConfig = new GlobalConfig()
      await config.lock.lockAsync(() => {
        config.login('admin')
      })
      expect(config.getIsLogin()).assertTrue()
      expect(config.getUser()).assertEqual('admin')
    })

    /**
     * @tc.name   GlobalConfigurationTest0400
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0400
     * @tc.desc   Verify lockAsync SHARED mode read operation with getIsLogin and getUser
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalConfigurationTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: GlobalConfig = new GlobalConfig()
      config.login('reader')
      let loginStatus: boolean = await config.lock.lockAsync(() => {
        return config.getIsLogin()
      })
      let username: string = await config.lock.lockAsync(() => {
        return config.getUser()
      })
      expect(loginStatus).assertTrue()
      expect(username).assertEqual('reader')
    })

    /**
     * @tc.name   GlobalConfigurationTest0500
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0500
     * @tc.desc   Verify login and logout methods work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalConfigurationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: GlobalConfig = new GlobalConfig()
      config.login('user1')
      expect(config.getIsLogin()).assertTrue()
      expect(config.getUser()).assertEqual('user1')
      config.logout()
      expect(config.getIsLogin()).assertFalse()
      expect(config.getUser()).assertEqual('')
    })

    /**
     * @tc.name   GlobalConfigurationTest0600
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0600
     * @tc.desc   Verify setWifiState and isWifiOn methods work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalConfigurationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: GlobalConfig = new GlobalConfig()
      expect(config.isWifiOn()).assertTrue()
      config.setWifiState(false)
      expect(config.isWifiOn()).assertFalse()
      config.setWifiState(true)
      expect(config.isWifiOn()).assertTrue()
    })

    /**
     * @tc.name   GlobalConfigurationTest0700
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0700
     * @tc.desc   Verify UI main thread access to global configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalConfigurationTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: GlobalConfig = new GlobalConfig()
      config.login('mainThread')
      config.setWifiState(true)
      expect(config.getIsLogin()).assertTrue()
      expect(config.getUser()).assertEqual('mainThread')
      expect(config.isWifiOn()).assertTrue()
    })

    /**
     * @tc.name   GlobalConfigurationTest0800
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0800
     * @tc.desc   Verify TaskPool sub-thread access to global configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GlobalConfigurationTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: GlobalConfig = new GlobalConfig()
      let loginResult = await taskpool.execute(new taskpool.Task(loginInWorker, config, 'workerUser'))
      expect(loginResult as boolean).assertTrue()
      expect(config.getIsLogin()).assertTrue()
      expect(config.getUser()).assertEqual('workerUser')
    })

    /**
     * @tc.name   GlobalConfigurationTest0900
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_0900
     * @tc.desc   Verify multiple threads concurrent read with SHARED lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: GlobalConfig = new GlobalConfig()
      config.login('sharedRead')
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readLoginStatus, config)))
      }
      let results: Object[] = await Promise.all(promises)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as boolean).assertTrue()
      }
    })

    /**
     * @tc.name   GlobalConfigurationTest1000
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1000
     * @tc.desc   Verify multiple threads concurrent write with EXCLUSIVE lock mutual exclusion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let counter: SharedCounter = new SharedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(incrementWithLock, lock, counter)))
      }
      await Promise.all(promises)
      expect(counter.count).assertEqual(20)
    })

    /**
     * @tc.name   GlobalConfigurationTest1100
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1100
     * @tc.desc   Verify read and write concurrent conflict with lock mutual exclusion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let config: GlobalConfig = new GlobalConfig()
      let writePromise: Promise<Object> = taskpool.execute(new taskpool.Task(writeWithLock, lock, config, 'writer'))
      let readPromise: Promise<Object> = taskpool.execute(new taskpool.Task(readWithLock, lock, config))
      await Promise.all([writePromise, readPromise])
      expect(config.getUser()).assertEqual('writer')
    })

    /**
     * @tc.name   GlobalConfigurationTest1200
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1200
     * @tc.desc   Verify data consistency after thread A modifies config and thread B reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: GlobalConfig = new GlobalConfig()
      await taskpool.execute(new taskpool.Task(loginInWorker, config, 'userA'))
      let readResult = await taskpool.execute(new taskpool.Task(readUsername, config))
      expect(readResult as string).assertEqual('userA')
    })

    /**
     * @tc.name   GlobalConfigurationTest1300
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1300
     * @tc.desc   Verify empty username login handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: GlobalConfig = new GlobalConfig()
      config.login('')
      expect(config.getIsLogin()).assertTrue()
      expect(config.getUser()).assertEqual('')
    })

    /**
     * @tc.name   GlobalConfigurationTest1400
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1400
     * @tc.desc   Verify logout without prior login
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: GlobalConfig = new GlobalConfig()
      config.logout()
      expect(config.getIsLogin()).assertFalse()
      expect(config.getUser()).assertEqual('')
    })

    /**
     * @tc.name   GlobalConfigurationTest1500
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1500
     * @tc.desc   Verify repeated login replaces previous user
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: GlobalConfig = new GlobalConfig()
      config.login('user1')
      config.login('user2')
      expect(config.getIsLogin()).assertTrue()
      expect(config.getUser()).assertEqual('user2')
    })

    /**
     * @tc.name   GlobalConfigurationTest1600
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1600
     * @tc.desc   Verify long username string storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: GlobalConfig = new GlobalConfig()
      let longName: string = 'a'.repeat(1000)
      config.login(longName)
      expect(config.getUser().length).assertEqual(1000)
    })

    /**
     * @tc.name   GlobalConfigurationTest1700
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1700
     * @tc.desc   Verify lockAsync callback throwing exception releases lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let caughtError: boolean = false
      try {
        await lock.lockAsync(() => {
          throw new Error('lock callback error')
        })
        expect().assertFail()
      } catch (e) {
        caughtError = true
        
      }
      expect(caughtError).assertTrue()
      let result: string = await lock.lockAsync(() => {
        return 'recovered'
      })
      expect(result).assertEqual('recovered')
    })

    /**
     * @tc.name   GlobalConfigurationTest1800
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1800
     * @tc.desc   Verify wifi state toggle cross-thread via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: GlobalConfig = new GlobalConfig()
      let result = await taskpool.execute(new taskpool.Task(setWifiInWorker, config, false))
      expect(result as boolean).assertFalse()
      expect(config.isWifiOn()).assertFalse()
      let result2 = await taskpool.execute(new taskpool.Task(setWifiInWorker, config, true))
      expect(result2 as boolean).assertTrue()
    })

    /**
     * @tc.name   GlobalConfigurationTest1900
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_1900
     * @tc.desc   Verify high concurrent read/write pressure with AsyncLock stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GlobalConfigurationTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let counter: SharedCounter = new SharedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(incrementWithLock, lock, counter)))
      }
      await Promise.all(promises)
      expect(counter.count).assertEqual(50)
    })

    /**
     * @tc.name   GlobalConfigurationTest2000
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_2000
     * @tc.desc   Verify sequential login and logout operations maintain correct state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GlobalConfigurationTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: GlobalConfig = new GlobalConfig()
      for (let i: number = 0; i < 5; i++) {
        config.login('user' + i.toString())
        expect(config.getIsLogin()).assertTrue()
        expect(config.getUser()).assertEqual('user' + i.toString())
        config.logout()
        expect(config.getIsLogin()).assertFalse()
      }
    })

    /**
     * @tc.name   GlobalConfigurationTest2100
     * @tc.number SUB_GLOBAL_CONFIGURATION_TEST_2100
     * @tc.desc   Verify concurrent logout operations from multiple threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GlobalConfigurationTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let config: GlobalConfig = new GlobalConfig()
      config.login('toLogout')
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(logoutInWorker, config)))
      }
      await Promise.all(promises)
      expect(config.getIsLogin()).assertFalse()
      expect(config.getUser()).assertEqual('')
    })
  })
}
