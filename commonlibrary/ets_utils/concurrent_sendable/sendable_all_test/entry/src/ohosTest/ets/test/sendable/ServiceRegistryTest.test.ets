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
class ServiceInfo {
  public name: string = ''
  public version: string = ''
  public status: string = 'active'
  public endpoints: collections.Array<string>

  constructor(endpoints: collections.Array<string>) {
    this.endpoints = endpoints
  }

}

@Sendable
class GlobalServiceRegistry {
  public services_: collections.Map<string, ServiceInfo>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(services_: collections.Map<string, ServiceInfo>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.services_ = services_
    this.lock_ = lock_
  }

  public registrationCount_: number = 0

  async register(name: string, service: ServiceInfo): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.services_.set(name, service)
      this.registrationCount_++
    })
  }

  discover(name: string): ServiceInfo | undefined {
    return this.services_.get(name)
  }

  getRegistrationCount(): number {
    return this.registrationCount_
  }

  async unregister(name: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const existed: boolean = this.services_.has(name)
      this.services_.delete(name)
      return existed
    })
  }

  getAllServices(): collections.Map<string, ServiceInfo> {
    return this.services_
  }
}

@Concurrent
async function registerServiceTask(registry: GlobalServiceRegistry, service: ServiceInfo): Promise<void> {
  await registry.register(service.name, service)
}

@Concurrent
function queryServiceTask(registry: GlobalServiceRegistry, name: string): boolean {
  return registry.discover(name) !== undefined
}

@Concurrent
function verifySingletonTask(reg: GlobalServiceRegistry): boolean {
  const discovered: ServiceInfo | undefined = reg.discover('singletonService')
  return discovered !== undefined
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function ServiceRegistryTest(): void {
  describe('ServiceRegistryTest', (): void => {
    const registry: GlobalServiceRegistry = new GlobalServiceRegistry(new collections.Map<string, ServiceInfo>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach(async (): Promise<void> => {
      await registry.lock_.lockAsync((): void => {
        registry.getAllServices().clear()
        registry.registrationCount_ = 0
      })
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testServiceRegistry0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0100
     * @tc.desc   Verify testServiceRegistry0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceRegistry0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'userService'
        service.version = '1.0.0'
        service.endpoints.push('http://localhost:8080')

        await registry.register('userService', service)
        const discovered: ServiceInfo | undefined = registry.discover('userService')

        expect(discovered !== undefined).assertTrue()
        expect(discovered!.name).assertEqual('userService')
        expect(discovered!.version).assertEqual('1.0.0')
      } catch (error) {
        console.error("testServiceRegistry0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0200
     * @tc.desc   Verify testServiceRegistry0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceRegistry0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const serviceNames: string[] = ['serviceA', 'serviceB', 'serviceC']
        const services: ServiceInfo[] = []
        for (let i = 0; i < serviceNames.length; i++) {
          const svc: ServiceInfo = new ServiceInfo(new collections.Array<string>())
          svc.name = serviceNames[i]
          svc.version = '1.0.0'
          services.push(svc)
        }
        const tasks: taskpool.Task[] = services.map((svc: ServiceInfo): taskpool.Task =>
          new taskpool.Task(registerServiceTask, registry, svc)
        )
        await executeTasksGetObjects(tasks)

        expect(registry.getRegistrationCount()).assertEqual(3)
        expect(registry.discover('serviceA') !== undefined).assertTrue()
        expect(registry.discover('serviceB') !== undefined).assertTrue()
        expect(registry.discover('serviceC') !== undefined).assertTrue()
      } catch (error) {
        console.error("testServiceRegistry0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0300
     * @tc.desc   Verify testServiceRegistry0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceRegistry0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'orderService'
        await registry.register('orderService', service)

        const discovered: ServiceInfo | undefined = registry.discover('orderService')
        expect(discovered !== undefined).assertTrue()
        expect(discovered!.name).assertEqual('orderService')
      } catch (error) {
        console.error("testServiceRegistry0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0400
     * @tc.desc   Verify testServiceRegistry0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testServiceRegistry0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const discovered: ServiceInfo | undefined = registry.discover('nonexistentService')
      expect(discovered === undefined).assertTrue()
    })

    /**
     * @tc.name   testServiceRegistry0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0500
     * @tc.desc   Verify testServiceRegistry0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceRegistry0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'tempService'
        await registry.register('tempService', service)

        const result: boolean = await registry.unregister('tempService')
        expect(result).assertTrue()
        expect(registry.discover('tempService') === undefined).assertTrue()
      } catch (error) {
        console.error("testServiceRegistry0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0600
     * @tc.desc   Verify testServiceRegistry0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testServiceRegistry0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const result: boolean = await registry.unregister('nonexistentService')
        expect(result).assertFalse()
      } catch (error) {
        console.error("testServiceRegistry0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0700
     * @tc.desc   Verify testServiceRegistry0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceRegistry0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'paymentService'
        service.status = 'active'
        await registry.register('paymentService', service)

        const discovered: ServiceInfo | undefined = registry.discover('paymentService')
        await registry.lock_.lockAsync((): void => {
          discovered!.status = 'inactive'
        })

        expect(registry.discover('paymentService')!.status).assertEqual('inactive')
      } catch (error) {
        console.error("testServiceRegistry0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0800
     * @tc.desc   Verify testServiceRegistry0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceRegistry0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'sharedService'
        await registry.register('sharedService', service)

        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(queryServiceTask, registry, 'sharedService'))
        }
        const results: Object[] = await executeTasksGetObjects(tasks)
        const boolResults: boolean[] = results.map((r: Object): boolean => r as boolean)

        expect(boolResults.every((r: boolean): boolean => r === true)).assertTrue()
      } catch (error) {
        console.error("testServiceRegistry0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_0900
     * @tc.desc   Verify testServiceRegistry0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceRegistry0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'apiService'
        service.endpoints.push('http://localhost:8081')
        service.endpoints.push('http://localhost:8082')
        await registry.register('apiService', service)

        const discovered: ServiceInfo | undefined = registry.discover('apiService')
        expect(discovered!.endpoints.length).assertEqual(2)
      } catch (error) {
        console.error("testServiceRegistry0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_1000
     * @tc.desc   Verify testServiceRegistry1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceRegistry1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'configService'
        service.version = '2.0.1'
        await registry.register('configService', service)

        const discovered: ServiceInfo | undefined = registry.discover('configService')
        expect(discovered!.version).assertEqual('2.0.1')
      } catch (error) {
        console.error("testServiceRegistry1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_1100
     * @tc.desc   Verify testServiceRegistry1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceRegistry1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const serviceNames: string[] = ['svc1', 'svc2', 'svc3']
        const services: ServiceInfo[] = []
        for (let i = 0; i < serviceNames.length; i++) {
          const svc: ServiceInfo = new ServiceInfo(new collections.Array<string>())
          svc.name = serviceNames[i]
          services.push(svc)
        }
        const tasks: taskpool.Task[] = services.map((svc: ServiceInfo): taskpool.Task =>
          new taskpool.Task(registerServiceTask, registry, svc)
        )
        await executeTasksGetObjects(tasks)

        expect(registry.getRegistrationCount()).assertEqual(3)
      } catch (error) {
        console.error("testServiceRegistry1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_1200
     * @tc.desc   Verify testServiceRegistry1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceRegistry1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const serviceNames: string[] = ['svcA', 'svcB', 'svcC', 'svcD', 'svcE']
        const services: ServiceInfo[] = []
        for (let i = 0; i < serviceNames.length; i++) {
          const svc: ServiceInfo = new ServiceInfo(new collections.Array<string>())
          svc.name = serviceNames[i]
          services.push(svc)
        }
        const tasks: taskpool.Task[] = services.map((svc: ServiceInfo): taskpool.Task =>
          new taskpool.Task(registerServiceTask, registry, svc)
        )
        await executeTasksGetObjects(tasks)

        expect(registry.getRegistrationCount()).assertEqual(5)
      } catch (error) {
        console.error("testServiceRegistry1200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_1300
     * @tc.desc   Verify testServiceRegistry1300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceRegistry1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const services: ServiceInfo[] = []
        for (let i: number = 0; i < 10; i++) {
          const svc: ServiceInfo = new ServiceInfo(new collections.Array<string>())
          svc.name = `service${i}`
          services.push(svc)
        }
        const tasks: taskpool.Task[] = services.map((svc: ServiceInfo): taskpool.Task =>
          new taskpool.Task(registerServiceTask, registry, svc)
        )
        await executeTasksGetObjects(tasks)

        expect(registry.getRegistrationCount()).assertEqual(10)
      } catch (error) {
        console.error("testServiceRegistry1300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_1400
     * @tc.desc   Verify testServiceRegistry1400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testServiceRegistry1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'singletonService'
        await registry.register('singletonService', service)

        const task: taskpool.Task = new taskpool.Task(verifySingletonTask, registry)
        const result: Object = await taskpool.execute(task)
        expect(result as boolean).assertTrue()
      } catch (error) {
        console.error("testServiceRegistry1400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testServiceRegistry1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERVICEREGISTRY_TEST_1500
     * @tc.desc   Verify testServiceRegistry1500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testServiceRegistry1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const service: ServiceInfo = new ServiceInfo(new collections.Array<string>())
        service.name = 'lifecycleService'
        service.status = 'created'
        await registry.register('lifecycleService', service)

        expect(registry.discover('lifecycleService')!.status).assertEqual('created')

        await registry.lock_.lockAsync((): void => {
          registry.discover('lifecycleService')!.status = 'running'
        })
        expect(registry.discover('lifecycleService')!.status).assertEqual('running')

        await registry.unregister('lifecycleService')
        expect(registry.discover('lifecycleService') === undefined).assertTrue()
      } catch (error) {
        console.error("testServiceRegistry1500 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
