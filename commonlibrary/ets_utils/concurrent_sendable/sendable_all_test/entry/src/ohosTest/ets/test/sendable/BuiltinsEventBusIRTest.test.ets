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
class IREventBus {
  public subscribers_: collections.Map<string, string>
  public eventCount_: number = 0
  public accessCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock, subscribers_: collections.Map<string, string>) {
    this.subscribers_ = subscribers_
    this.lock_ = lock_
  }


  async subscribe(eventType: string, handlerId: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null) {
        this.subscribers_.set(eventType, handlerId)
      } else {
        this.subscribers_.set(eventType, existing + ',' + handlerId)
      }
    })
  }

  async publish(eventType: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.eventCount_++
      this.accessCount_++
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') return 0
      return existing.split(',').length
    })
  }

  async getEventCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.eventCount_)
  }

  async getAccessCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.accessCount_)
  }

  async getSubscriberCount(eventType: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.accessCount_++
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') return 0
      return existing.split(',').length
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.subscribers_.clear()
      this.eventCount_ = 0
      this.accessCount_ = 0
    })
  }
}

@Sendable
class IRFieldBus {
  public field1_: number = 0
  public field2_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async updateFields(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.field1_++
      this.field2_ += 2
    })
  }

  async getField1(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.field1_)
  }

  async getField2(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.field2_)
  }
}

@Concurrent
async function irPublishTask(bus: IREventBus, eventType: string): Promise<number> {
  return await bus.lock_.lockAsync((): number => {
    bus.eventCount_++
    bus.accessCount_++
    const existing: string | undefined = bus.subscribers_.get(eventType)
    if (existing === undefined || existing === null || existing === '') return 0
    return existing.split(',').length

  })
}

@Concurrent
async function irFieldUpdateTask(bus: IRFieldBus): Promise<void> {
  return await bus.lock_.lockAsync((): void => {
    bus.field1_++
    bus.field2_ += 2

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsEventBusIRTest(): void {
  describe('BuiltinsEventBusIRTest', () => {
    it('BuiltinsEventBusIRTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const bus: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      await bus.subscribe('click', 'handler_1')
      const count: number = await bus.getSubscriberCount('click')
      expect(count).assertEqual(1)
    })

    it('BuiltinsEventBusIRTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const bus: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      await bus.subscribe('click', 'handler_1')
      const result: number = await bus.publish('click')
      expect(result).assertEqual(1)
      expect(await bus.getEventCount()).assertEqual(1)
    })

    it('BuiltinsEventBusIRTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bus: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      await bus.subscribe('click', 'handler_1')
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(irPublishTask, bus, 'click'))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getEventCount() >= 10).assertTrue()
    })

    it('BuiltinsEventBusIRTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const bus: IRFieldBus = new IRFieldBus(new ArkTSUtils.locks.AsyncLock())
      await bus.updateFields()
      expect(await bus.getField1()).assertEqual(1)
      expect(await bus.getField2()).assertEqual(2)
    })

    it('BuiltinsEventBusIRTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bus: IRFieldBus = new IRFieldBus(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(irFieldUpdateTask, bus))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getField1()).assertEqual(5)
      expect(await bus.getField2()).assertEqual(10)
    })

    it('BuiltinsEventBusIRTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const bus1: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      const bus2: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      await bus1.subscribe('click', 'handler_1')
      await bus2.subscribe('click', 'handler_1')
      expect(await bus1.getSubscriberCount('click')).assertEqual(1)
      expect(await bus2.getSubscriberCount('click')).assertEqual(1)
    })

    it('BuiltinsEventBusIRTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const bus: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      await bus.subscribe('click', 'handler_1')
      for (let i: number = 0; i < 5; i++) {
        await bus.publish('click')
      }
      expect(await bus.getEventCount()).assertEqual(5)
    })

    it('BuiltinsEventBusIRTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const bus: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      await bus.subscribe('click', 'handler_1')
      const before: number = await bus.getAccessCount()
      await bus.getSubscriberCount('click')
      const after: number = await bus.getAccessCount()
      expect(after > before).assertTrue()
    })

    it('BuiltinsEventBusIRTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bus: IRFieldBus = new IRFieldBus(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(irFieldUpdateTask, bus))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getField1()).assertEqual(10)
      expect(await bus.getField2()).assertEqual(20)
    })

    it('BuiltinsEventBusIRTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const bus: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      await bus.subscribe('click', 'handler_1')
      await bus.publish('click')
      await bus.reset()
      expect(await bus.getEventCount()).assertEqual(0)
    })

    it('BuiltinsEventBusIRTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const bus: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      await bus.subscribe('click', 'handler_1')
      await bus.subscribe('hover', 'handler_2')
      const c1: number = await bus.getSubscriberCount('click')
      const c2: number = await bus.getSubscriberCount('hover')
      expect(c1).assertEqual(1)
      expect(c2).assertEqual(1)
    })

    it('BuiltinsEventBusIRTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bus: IREventBus = new IREventBus(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
      for (let i: number = 0; i < 5; i++) {
        await bus.subscribe('click', `handler_${i}`)
      }
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(irPublishTask, bus, 'click'))
      }
      await executeTasksGetObjects(tasks)
      expect(await bus.getEventCount() >= 5).assertTrue()
    })
  })
}
