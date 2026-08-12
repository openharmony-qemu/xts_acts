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
import { ServiceState } from './SendableTestEnums'


@Sendable
class LifecycleManagedService {
  public name: string = ''
  public state_: number = ServiceState.CREATED
  public createTime_: number = 0
  public initTime_: number = 0
  public stopTime_: number = 0
}

@Sendable
class ServiceLifecycleManager {
  private services_: collections.Map<string, LifecycleManagedService>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(services_: collections.Map<string, LifecycleManagedService>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.services_ = services_
    this.lock_ = lock_
  }

  private serviceCount_: number = 0

  async create(name: string): Promise<LifecycleManagedService> {
    return await this.lock_.lockAsync((): LifecycleManagedService => {
      const service: LifecycleManagedService = new LifecycleManagedService()
      service.name = name
      service.state_ = ServiceState.CREATED
      service.createTime_ = Date.now()
      this.services_.set(name, service)
      this.serviceCount_++
      return service
    })
  }

  async initialize(name: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const service: LifecycleManagedService | undefined = this.services_.get(name)
      if (service !== undefined && service.state_ === ServiceState.CREATED) {
        service.state_ = ServiceState.INITIALIZED
        service.initTime_ = Date.now()
        return true
      }
      return false
    })
  }

  async start(name: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const service: LifecycleManagedService | undefined = this.services_.get(name)
      if (service !== undefined && service.state_ === ServiceState.INITIALIZED) {
        service.state_ = ServiceState.RUNNING
        return true
      }
      return false
    })
  }

  async stop(name: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const service: LifecycleManagedService | undefined = this.services_.get(name)
      if (service !== undefined && service.state_ === ServiceState.RUNNING) {
        service.state_ = ServiceState.STOPPED
        service.stopTime_ = Date.now()
        return true
      }
      return false
    })
  }

  async destroy(name: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const service: LifecycleManagedService | undefined = this.services_.get(name)
      if (service !== undefined) {
        service.state_ = ServiceState.DESTROYED
        this.services_.delete(name)
        return true
      }
      return false
    })
  }

  getServiceCount(): number {
    return this.serviceCount_
  }

  getService(name: string): LifecycleManagedService | undefined {
    return this.services_.get(name)
  }
}

@Concurrent
async function createServiceTask(mgr: ServiceLifecycleManager, name: string): Promise<void> {
  await mgr.create(name)
}

@Concurrent
async function initServiceTask(mgr: ServiceLifecycleManager, name: string): Promise<void> {
  await mgr.initialize(name)
}

function executeTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function ServiceLifecycleTest(): void {
  describe('ServiceLifecycleTest', (): void => {
    let manager: ServiceLifecycleManager = new ServiceLifecycleManager(new collections.Map<string, LifecycleManagedService>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach(async (): Promise<void> => {
      manager = new ServiceLifecycleManager(new collections.Map<string, LifecycleManagedService>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testServiceLifecycle0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0100
     * @tc.desc   Verify service creation state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceLifecycle0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const service: LifecycleManagedService = await manager.create('testService')
      expect(service.name).assertEqual('testService')
      expect(service.state_).assertEqual(ServiceState.CREATED)
      expect(service.createTime_ > 0).assertTrue()
    })

    /**
     * @tc.name   testServiceLifecycle0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0200
     * @tc.desc   Verify service initialization state transition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceLifecycle0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await manager.create('initService')
      const result: boolean = await manager.initialize('initService')
      expect(result).assertTrue()

      const service: LifecycleManagedService | undefined = manager.getService('initService')
      expect(service !== undefined).assertTrue()
      expect(service!.state_).assertEqual(ServiceState.INITIALIZED)
      expect(service!.initTime_ > 0).assertTrue()
    })

    /**
     * @tc.name   testServiceLifecycle0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0300
     * @tc.desc   Verify service start from initialized to running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceLifecycle0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await manager.create('startService')
      await manager.initialize('startService')
      const result: boolean = await manager.start('startService')
      expect(result).assertTrue()

      const service: LifecycleManagedService | undefined = manager.getService('startService')
      expect(service!.state_).assertEqual(ServiceState.RUNNING)
    })

    /**
     * @tc.name   testServiceLifecycle0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0400
     * @tc.desc   Verify service stop from running to stopped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceLifecycle0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await manager.create('stopService')
      await manager.initialize('stopService')
      await manager.start('stopService')
      const result: boolean = await manager.stop('stopService')
      expect(result).assertTrue()

      const service: LifecycleManagedService | undefined = manager.getService('stopService')
      expect(service!.state_).assertEqual(ServiceState.STOPPED)
      expect(service!.stopTime_ > 0).assertTrue()
    })

    /**
     * @tc.name   testServiceLifecycle0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0500
     * @tc.desc   Verify complete lifecycle from created to destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceLifecycle0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await manager.create('fullService')
      await manager.initialize('fullService')
      await manager.start('fullService')
      await manager.stop('fullService')
      const result: boolean = await manager.destroy('fullService')
      expect(result).assertTrue()
      expect(manager.getService('fullService') === undefined).assertTrue()
    })

    /**
     * @tc.name   testServiceLifecycle0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0600
     * @tc.desc   Verify invalid state transition returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceLifecycle0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await manager.create('invalidService')
      const startResult: boolean = await manager.start('invalidService')
      expect(startResult).assertFalse()

      const stopResult: boolean = await manager.stop('invalidService')
      expect(stopResult).assertFalse()
    })

    /**
     * @tc.name   testServiceLifecycle0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0700
     * @tc.desc   Verify multi-service concurrent lifecycle management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceLifecycle0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(createServiceTask, manager, `svc_${i}`))
      }
      await executeTasks(tasks)
      expect(manager.getServiceCount()).assertEqual(5)
    })

    /**
     * @tc.name   testServiceLifecycle0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0800
     * @tc.desc   Verify service counter accuracy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceLifecycle0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await manager.create('a')
      await manager.create('b')
      await manager.create('c')
      expect(manager.getServiceCount()).assertEqual(3)
    })

    /**
     * @tc.name   testServiceLifecycle0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_0900
     * @tc.desc   Verify small concurrency 3 services lifecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceLifecycle0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(createServiceTask, manager, `lc_svc_${i}`))
      }
      await executeTasks(tasks)
      expect(manager.getServiceCount()).assertEqual(3)
    })

    /**
     * @tc.name   testServiceLifecycle1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_1000
     * @tc.desc   Verify small concurrency 5 services lifecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceLifecycle1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(createServiceTask, manager, `lc_svc5_${i}`))
      }
      await executeTasks(tasks)
      expect(manager.getServiceCount()).assertEqual(5)
    })

    /**
     * @tc.name   testServiceLifecycle1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_1100
     * @tc.desc   Verify small concurrency 10 services lifecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceLifecycle1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(createServiceTask, manager, `lc_svc10_${i}`))
      }
      await executeTasks(tasks)
      expect(manager.getServiceCount()).assertEqual(10)
    })

    /**
     * @tc.name   testServiceLifecycle1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICE_LIFECYCLE_TEST_1200
     * @tc.desc   Verify service timestamp contains key info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceLifecycle1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const service: LifecycleManagedService = await manager.create('tsService')
      await manager.initialize('tsService')
      const svc: LifecycleManagedService | undefined = manager.getService('tsService')
      expect(svc !== undefined).assertTrue()
      expect(svc!.createTime_ > 0).assertTrue()
      expect(svc!.initTime_ > 0).assertTrue()
      expect(svc!.initTime_ >= svc!.createTime_).assertTrue()
    })
  })
}
