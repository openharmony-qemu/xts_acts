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
class SendableEvent {
  public type_: string = ''
  public data_: string = ''
  public timestamp_: number = 0

  constructor(type: string, data: string) {
    this.type_ = type
    this.data_ = data
    this.timestamp_ = Date.now()
  }
}

@Sendable
class SendableEventBus {
  public subscribers_: collections.Map<string, string>
  public eventQueue_: collections.Array<SendableEvent>

  public publishCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(eventQueue_: collections.Array<SendableEvent>, lock_: ArkTSUtils.locks.AsyncLock, subscribers_: collections.Map<string, string>) {
    this.subscribers_ = subscribers_
    this.eventQueue_ = eventQueue_
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

  async unsubscribe(eventType: string, handlerId: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing !== undefined && existing !== null && existing !== '') {
        const parts: string[] = existing.split(',')
        const filtered: string[] = []
        for (let i: number = 0; i < parts.length; i++) {
          if (parts[i] !== handlerId) {
            filtered.push(parts[i])
          }
        }
        this.subscribers_.set(eventType, filtered.join(','))
      }
    })
  }

  async publish(eventType: string, data: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const event: SendableEvent = new SendableEvent(eventType, data)
      this.eventQueue_.push(event)
      this.publishCount_++
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') {
        return 0
      }
      return existing.split(',').length
    })
  }

  async getSubscriberCount(eventType: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const existing: string | undefined = this.subscribers_.get(eventType)
      if (existing === undefined || existing === null || existing === '') {
        return 0
      }
      return existing.split(',').length
    })
  }

  async getQueueLength(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.eventQueue_.length)
  }

  async getPublishCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.publishCount_)
  }

  async clearQueue(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.eventQueue_.length > 0) { this.eventQueue_.pop() }
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.subscribers_.clear()
      while (this.eventQueue_.length > 0) { this.eventQueue_.pop() }
      this.publishCount_ = 0
    })
  }
}

export default function BuiltinsEventSubscribeTest(): void {
  describe('BuiltinsEventSubscribeTest', () => {
    let bus: SendableEventBus

    beforeEach(async (): Promise<void> => {
      bus = new SendableEventBus(new collections.Array<SendableEvent>(), new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())
    })

    afterEach(async (): Promise<void> => {
      await bus.reset()
    })

    it('BuiltinsEventSubscribeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.subscribe('click', 'handler_1')
      expect(await bus.getSubscriberCount('click')).assertEqual(1)
    })

    it('BuiltinsEventSubscribeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.subscribe('click', 'handler_1')
      await bus.subscribe('click', 'handler_2')
      expect(await bus.getSubscriberCount('click')).assertEqual(2)
    })

    it('BuiltinsEventSubscribeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.subscribe('click', 'handler_1')
      await bus.unsubscribe('click', 'handler_1')
      expect(await bus.getSubscriberCount('click')).assertEqual(0)
    })

    it('BuiltinsEventSubscribeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.subscribe('click', 'handler_1')
      await bus.subscribe('click', 'handler_2')
      await bus.unsubscribe('click', 'handler_1')
      expect(await bus.getSubscriberCount('click')).assertEqual(1)
    })

    it('BuiltinsEventSubscribeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(await bus.getSubscriberCount('unknown')).assertEqual(0)
    })

    it('BuiltinsEventSubscribeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await bus.subscribe('click', 'handler_1')
      await bus.subscribe('hover', 'handler_2')
      expect(await bus.getSubscriberCount('click')).assertEqual(1)
      expect(await bus.getSubscriberCount('hover')).assertEqual(1)
    })

    it('BuiltinsEventSubscribeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.unsubscribe('click', 'handler_1')
      expect(await bus.getSubscriberCount('click')).assertEqual(0)
    })

    it('BuiltinsEventSubscribeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises: Promise<void>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(bus.subscribe('click', `handler_${i}`))
      }
      await Promise.all(promises)
      expect(await bus.getSubscriberCount('click')).assertEqual(10)
    })

    it('BuiltinsEventSubscribeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i: number = 0; i < 5; i++) {
        await bus.subscribe('click', `handler_${i}`)
      }
      await bus.reset()
      expect(await bus.getSubscriberCount('click')).assertEqual(0)
    })

    it('BuiltinsEventSubscribeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await bus.subscribe('click', 'handler_1')
      await bus.subscribe('click', 'handler_1')
      expect(await bus.getSubscriberCount('click')).assertEqual(2)
    })
  })
}
