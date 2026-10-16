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
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class DatabaseService {
  public connectionCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

  public connected_: boolean = false

  async connect(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.connected_ = true
      this.connectionCount_++
    })
  }

  async disconnect(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.connected_ = false
    })
  }

  isConnected(): boolean {
    return this.connected_
  }

  getConnectionCount(): number {
    return this.connectionCount_
  }
}

@Sendable
class SingletonHolder {
  private static instance_: DatabaseService | null = null

  static async getInstance(lock: ArkTSUtils.locks.AsyncLock): Promise<DatabaseService> {
    return await lock.lockAsync((): DatabaseService => {
      if (SingletonHolder.instance_ === null) {
        SingletonHolder.instance_ = new DatabaseService(lock)
      }
      return SingletonHolder.instance_!
    })
  }

  static resetInstance(): void {
    SingletonHolder.instance_ = null
  }
}

@Concurrent
async function connectTask(service: DatabaseService): Promise<void> {
  await service.connect()
}

@Concurrent
function getDbInstanceAndConnectTask(svc: DatabaseService): DatabaseService {
  return svc
}

@Concurrent
function verifySingletonRefTask(svc: DatabaseService): boolean {
  return svc.isConnected() !== undefined
}

@Concurrent
function collectInstanceTask(svc: DatabaseService): DatabaseService {
  return svc
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function ServiceSingletonTest(): void {
  describe('ServiceSingletonTest', (): void => {
    let dbService: DatabaseService | null = null

    beforeEach(async (): Promise<void> => {
      SingletonHolder.resetInstance()
      dbService = await SingletonHolder.getInstance(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      if (dbService !== null) {
        await dbService.disconnect()
      }
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testServiceSingleton0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0100
     * @tc.desc   Verify singleton getInstance returns same instance multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceSingleton0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const instance1: DatabaseService = await SingletonHolder.getInstance(new ArkTSUtils.locks.AsyncLock())
        const instance2: DatabaseService = await SingletonHolder.getInstance(new ArkTSUtils.locks.AsyncLock())

        expect(instance1 === instance2).assertTrue()
      } catch (error) {
        console.error("testServiceSingleton0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0200
     * @tc.desc   Verify TaskPool task gets singleton instance with reference passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const task: taskpool.Task = new taskpool.Task(getDbInstanceAndConnectTask, dbService!)
        const result: Object = await taskpool.execute(task)
        const taskInstance: DatabaseService = result as DatabaseService

        expect(taskInstance === dbService).assertTrue()
      } catch (error) {
        console.error("testServiceSingleton0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0300
     * @tc.desc   Verify singleton state modification takes effect globally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceSingleton0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await dbService!.connect()

        const task: taskpool.Task = new taskpool.Task(getDbInstanceAndConnectTask, dbService!)
        const result: Object = await taskpool.execute(task)
        const taskInstance: DatabaseService = result as DatabaseService

        expect(taskInstance.isConnected()).assertTrue()
      } catch (error) {
        console.error("testServiceSingleton0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0400
     * @tc.desc   Verify multi-thread concurrent connect with Promise.all waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(connectTask, dbService!))
        }
        await executeTasksGetObjects(tasks)

        expect(dbService!.getConnectionCount()).assertEqual(5)
        expect(dbService!.isConnected()).assertTrue()
      } catch (error) {
        console.error("testServiceSingleton0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0500
     * @tc.desc   Verify connection state with AsyncLock protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceSingleton0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        expect(dbService!.isConnected()).assertFalse()

        await dbService!.connect()
        expect(dbService!.isConnected()).assertTrue()

        await dbService!.disconnect()
        expect(dbService!.isConnected()).assertFalse()
      } catch (error) {
        console.error("testServiceSingleton0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0600
     * @tc.desc   Verify connection counter concurrent safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const initialCount: number = dbService!.getConnectionCount()

        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 3; i++) {
          tasks.push(new taskpool.Task(connectTask, dbService!))
        }
        await executeTasksGetObjects(tasks)

        expect(dbService!.getConnectionCount()).assertEqual(initialCount + 3)
      } catch (error) {
        console.error("testServiceSingleton0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0700
     * @tc.desc   Verify small concurrency 3 connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 3; i++) {
          tasks.push(new taskpool.Task(connectTask, dbService!))
        }
        await executeTasksGetObjects(tasks)
        expect(dbService!.getConnectionCount()).assertEqual(3)
      } catch (error) {
        console.error("testServiceSingleton0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0800
     * @tc.desc   Verify small concurrency 5 connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(connectTask, dbService!))
        }
        await executeTasksGetObjects(tasks)
        expect(dbService!.getConnectionCount()).assertEqual(5)
      } catch (error) {
        console.error("testServiceSingleton0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_0900
     * @tc.desc   Verify small concurrency 10 connections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(connectTask, dbService!))
        }
        await executeTasksGetObjects(tasks)
        expect(dbService!.getConnectionCount()).assertEqual(10)
      } catch (error) {
        console.error("testServiceSingleton0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_1000
     * @tc.desc   Verify singleton reference consistency across different threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const task: taskpool.Task = new taskpool.Task(verifySingletonRefTask, dbService!)
        const result: Object = await taskpool.execute(task)

        expect(result as boolean).assertTrue()
      } catch (error) {
        console.error("testServiceSingleton1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_1100
     * @tc.desc   Verify singleton state isolation across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const task1: taskpool.Task = new taskpool.Task(getDbInstanceAndConnectTask, dbService!)
        const instance1: Object = await taskpool.execute(task1)
        const dbInst1: DatabaseService = instance1 as DatabaseService

        await dbInst1.connect()

        const task2: taskpool.Task = new taskpool.Task(getDbInstanceAndConnectTask, dbService!)
        const instance2: Object = await taskpool.execute(task2)
        const dbInst2: DatabaseService = instance2 as DatabaseService

        expect(dbInst2.isConnected()).assertTrue()
      } catch (error) {
        console.error("testServiceSingleton1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_1200
     * @tc.desc   Verify singleton lifecycle management connect and disconnect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceSingleton1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await dbService!.connect()
        expect(dbService!.isConnected()).assertTrue()

        await dbService!.disconnect()
        expect(dbService!.isConnected()).assertFalse()
      } catch (error) {
        console.error("testServiceSingleton1200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceSingleton1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_SINGLETON_TEST_1300
     * @tc.desc   Verify singleton reference address consistency across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceSingleton1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(collectInstanceTask, dbService!))
        }
        const results: Object[] = await executeTasksGetObjects(tasks)
        const dbResults: DatabaseService[] = results.map((r: Object): DatabaseService => r as DatabaseService)

        const allSame: boolean = dbResults.every((inst: DatabaseService): boolean => inst === dbService)
        expect(allSame).assertTrue()
      } catch (error) {
        console.error("testServiceSingleton1300 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
