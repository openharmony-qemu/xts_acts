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
class ServiceHealth {
  public name: string = ''
  public status: string = 'unknown'
  public lastCheckTime: number = 0
  public errorCount: number = 0
  public responseTime: number = 0
}

@Sendable
class ServiceMonitor {
  public healthMap_: collections.Map<string, ServiceHealth>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(healthMap_: collections.Map<string, ServiceHealth>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.healthMap_ = healthMap_
    this.lock_ = lock_
  }

  public checkCount_: number = 0

  async registerHealthCheck(name: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const health: ServiceHealth = new ServiceHealth()
      health.name = name
      health.status = 'unknown'
      health.lastCheckTime = Date.now()
      this.healthMap_.set(name, health)
    })
  }

  async updateHealth(name: string, status: string, responseTime: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const health: ServiceHealth | undefined = this.healthMap_.get(name)
      if (health !== undefined) {
        health.status = status
        health.lastCheckTime = Date.now()
        health.responseTime = responseTime
        if (status === 'unhealthy') {
          health.errorCount++
        }
        this.checkCount_++
      }
    })
  }

  getHealth(name: string): ServiceHealth | undefined {
    return this.healthMap_.get(name)
  }

  getCheckCount(): number {
    return this.checkCount_
  }

  getAllHealth(): collections.Map<string, ServiceHealth> {
    return this.healthMap_
  }
}

@Concurrent
async function healthCheckTask(monitor: ServiceMonitor, name: string, status: string): Promise<void> {
  await monitor.updateHealth(name, status, Math.floor(Math.random() * 100))
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsServiceMonitorTest(): void {
  describe('BuiltinsServiceMonitorTest', (): void => {
    const serviceMonitor: ServiceMonitor = new ServiceMonitor(new collections.Map<string, ServiceHealth>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach(async (): Promise<void> => {
      await serviceMonitor.lock_.lockAsync((): void => {
        serviceMonitor.getAllHealth().clear()
        serviceMonitor.checkCount_ = 0
      })
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    it('testServiceMonitor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await serviceMonitor.registerHealthCheck('apiService')

      const health: ServiceHealth | undefined = serviceMonitor.getHealth('apiService')
      expect(health !== undefined).assertTrue()
      expect(health!.status).assertEqual('unknown')
    })

    it('testServiceMonitor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await serviceMonitor.registerHealthCheck('webService')
      await serviceMonitor.updateHealth('webService', 'healthy', 50)

      const health: ServiceHealth | undefined = serviceMonitor.getHealth('webService')
      expect(health!.status).assertEqual('healthy')
      expect(health!.responseTime).assertEqual(50)
    })

    it('testServiceMonitor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await serviceMonitor.registerHealthCheck('dbService')
      await serviceMonitor.updateHealth('dbService', 'unhealthy', 200)

      const health: ServiceHealth | undefined = serviceMonitor.getHealth('dbService')
      expect(health!.status).assertEqual('unhealthy')
      expect(health!.errorCount).assertEqual(1)
    })

    it('testServiceMonitor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await serviceMonitor.registerHealthCheck('cacheService')
      await serviceMonitor.updateHealth('cacheService', 'degraded', 150)

      const health: ServiceHealth | undefined = serviceMonitor.getHealth('cacheService')
      expect(health!.status).assertEqual('degraded')
    })

    it('testServiceMonitor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await serviceMonitor.registerHealthCheck('errorSvc')

      await serviceMonitor.updateHealth('errorSvc', 'unhealthy', 100)
      await serviceMonitor.updateHealth('errorSvc', 'unhealthy', 100)
      await serviceMonitor.updateHealth('errorSvc', 'healthy', 30)

      const health: ServiceHealth | undefined = serviceMonitor.getHealth('errorSvc')
      expect(health!.errorCount).assertEqual(2)
    })

    it('testServiceMonitor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await serviceMonitor.registerHealthCheck('timeSvc')
      await serviceMonitor.updateHealth('timeSvc', 'healthy', 75)

      const health: ServiceHealth | undefined = serviceMonitor.getHealth('timeSvc')
      expect(health!.responseTime).assertEqual(75)
    })

    it('testServiceMonitor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await serviceMonitor.registerHealthCheck('timeCheckSvc')
      const beforeTime: number = Date.now()
      await serviceMonitor.updateHealth('timeCheckSvc', 'healthy', 30)
      const afterTime: number = Date.now()

      const health: ServiceHealth | undefined = serviceMonitor.getHealth('timeCheckSvc')
      expect(health!.lastCheckTime >= beforeTime).assertTrue()
      expect(health!.lastCheckTime <= afterTime).assertTrue()
    })

    it('testServiceMonitor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await serviceMonitor.registerHealthCheck('concurrentSvc')

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(healthCheckTask, serviceMonitor, 'concurrentSvc', 'healthy'))
      }
      await executeTasksGetObjects(tasks)

      expect(serviceMonitor.getCheckCount()).assertEqual(5)
    })

    it('testServiceMonitor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const services: string[] = ['monitor1', 'monitor2', 'monitor3']
      for (const svc of services) {
        await serviceMonitor.registerHealthCheck(svc)
      }

      const tasks: taskpool.Task[] = services.map((svc: string): taskpool.Task =>
        new taskpool.Task(healthCheckTask, serviceMonitor, svc, 'healthy')
      )
      await executeTasksGetObjects(tasks)

      expect(serviceMonitor.getCheckCount()).assertEqual(3)
    })

    it('testServiceMonitor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const services: string[] = []
      for (let i: number = 0; i < 5; i++) {
        services.push(`monitorSvc${i}`)
      }
      for (const svc of services) {
        await serviceMonitor.registerHealthCheck(svc)
      }

      const tasks: taskpool.Task[] = services.map((svc: string): taskpool.Task =>
        new taskpool.Task(healthCheckTask, serviceMonitor, svc, 'healthy')
      )
      await executeTasksGetObjects(tasks)

      expect(serviceMonitor.getCheckCount()).assertEqual(5)
    })

    it('testServiceMonitor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const services: string[] = []
      for (let i: number = 0; i < 10; i++) {
        services.push(`monitorSvc${i}`)
      }
      for (const svc of services) {
        await serviceMonitor.registerHealthCheck(svc)
      }

      const promises: Promise<void>[] = services.map((svc: string): Promise<void> =>
        serviceMonitor.updateHealth(svc, 'healthy', Math.floor(Math.random() * 100))
      )
      await Promise.all(promises)

      expect(serviceMonitor.getCheckCount()).assertEqual(10)
    })

    it('testServiceMonitor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const health: ServiceHealth | undefined = serviceMonitor.getHealth('nonexistent')
      expect(health === undefined).assertTrue()
    })
  })
}
