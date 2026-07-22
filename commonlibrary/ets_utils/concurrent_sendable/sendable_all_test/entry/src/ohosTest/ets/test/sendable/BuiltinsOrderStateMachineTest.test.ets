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

const enum OrderState {
  CREATED = 0,
  PENDING_PAYMENT = 1,
  PAID = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5,
  REFUNDED = 6
}

@Sendable
class OrderTransitionRecord {
  public from_: number = 0
  public to_: number = 0
  public reason_: string = ''

  constructor(from: number, to: number, reason: string) {
    this.from_ = from
    this.to_ = to
    this.reason_ = reason
  }
}

@Sendable
class OrderTransitionRule {
  public from_: number = 0
  public to_: number = 0

  constructor(from: number, to: number) {
    this.from_ = from
    this.to_ = to
  }
}

@Sendable
class OrderStateMachine {
  public currentState_: number = OrderState.CREATED
  public previousState_: number = -1
  public lock_: ArkTSUtils.locks.AsyncLock

  public history_: collections.Array<OrderTransitionRecord>

  public rules_: collections.Array<OrderTransitionRule>


  constructor(lock_: ArkTSUtils.locks.AsyncLock, history_: collections.Array<OrderTransitionRecord>, rules_: collections.Array<OrderTransitionRule>) {
    this.lock_ = lock_
    this.history_ = history_
    this.rules_ = rules_

    this.currentState_ = OrderState.CREATED
  }

  async setupRules(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.rules_.push(new OrderTransitionRule(OrderState.CREATED, OrderState.PENDING_PAYMENT))
      this.rules_.push(new OrderTransitionRule(OrderState.PENDING_PAYMENT, OrderState.PAID))
      this.rules_.push(new OrderTransitionRule(OrderState.PENDING_PAYMENT, OrderState.CANCELLED))
      this.rules_.push(new OrderTransitionRule(OrderState.PAID, OrderState.SHIPPED))
      this.rules_.push(new OrderTransitionRule(OrderState.PAID, OrderState.REFUNDED))
      this.rules_.push(new OrderTransitionRule(OrderState.SHIPPED, OrderState.DELIVERED))
      this.rules_.push(new OrderTransitionRule(OrderState.DELIVERED, OrderState.REFUNDED))
    })
  }

  async getCurrentState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.currentState_)
  }

  async getPreviousState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.previousState_)
  }

  async transition(toState: number, reason: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      let allowed: boolean = false
      for (let i: number = 0; i < this.rules_.length; i++) {
        const rule: OrderTransitionRule = this.rules_[i]
        if (rule.from_ === this.currentState_ && rule.to_ === toState) {
          allowed = true
          break
        }
      }
      if (!allowed) {
        return false
      }
      this.history_.push(new OrderTransitionRecord(this.currentState_, toState, reason))
      this.previousState_ = this.currentState_
      this.currentState_ = toState
      return true
    })
  }

  async getHistoryCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.history_.length)
  }

  async getLastTransition(): Promise<OrderTransitionRecord | null> {
    return await this.lock_.lockAsync((): OrderTransitionRecord | null => {
      if (this.history_.length > 0) {
        return this.history_[this.history_.length - 1]
      }
      return null
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.currentState_ = OrderState.CREATED
      this.previousState_ = -1
      while (this.history_.length > 0) { this.history_.pop() }
    })
  }
}

@Concurrent
function readOrderStateTask(sm: OrderStateMachine): number {
  return sm.currentState_
}

export default function BuiltinsOrderStateMachineTest(): void {
  describe('BuiltinsOrderStateMachineTest', () => {
    let orderSM: OrderStateMachine

    beforeEach(async (): Promise<void> => {
      orderSM = new OrderStateMachine(new ArkTSUtils.locks.AsyncLock(), new collections.Array<OrderTransitionRecord>(), new collections.Array<OrderTransitionRule>())
      await orderSM.setupRules()
    })

    afterEach(async (): Promise<void> => {
      await orderSM.reset()
    })

    it('BuiltinsOrderStateMachineTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await orderSM.getCurrentState()).assertEqual(OrderState.CREATED)
      expect(await orderSM.getHistoryCount()).assertEqual(0)
    })

    it('BuiltinsOrderStateMachineTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: boolean = await orderSM.transition(OrderState.PENDING_PAYMENT, 'submit order')
      expect(result).assertTrue()
      expect(await orderSM.getCurrentState()).assertEqual(OrderState.PENDING_PAYMENT)
      expect(await orderSM.getPreviousState()).assertEqual(OrderState.CREATED)
      expect(await orderSM.getHistoryCount()).assertEqual(1)
    })

    it('BuiltinsOrderStateMachineTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await orderSM.transition(OrderState.PENDING_PAYMENT, 'submit')).assertTrue()
      expect(await orderSM.transition(OrderState.PAID, 'pay')).assertTrue()
      expect(await orderSM.transition(OrderState.SHIPPED, 'ship')).assertTrue()
      expect(await orderSM.transition(OrderState.DELIVERED, 'deliver')).assertTrue()
      expect(await orderSM.getCurrentState()).assertEqual(OrderState.DELIVERED)
      expect(await orderSM.getHistoryCount()).assertEqual(4)
    })

    it('BuiltinsOrderStateMachineTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await orderSM.transition(OrderState.PENDING_PAYMENT, 'submit')
      const result: boolean = await orderSM.transition(OrderState.CANCELLED, 'user cancel')
      expect(result).assertTrue()
      expect(await orderSM.getCurrentState()).assertEqual(OrderState.CANCELLED)
      expect(await orderSM.getHistoryCount()).assertEqual(2)
    })

    it('BuiltinsOrderStateMachineTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await orderSM.transition(OrderState.PENDING_PAYMENT, 'submit')
      await orderSM.transition(OrderState.PAID, 'pay')
      const result: boolean = await orderSM.transition(OrderState.REFUNDED, 'refund request')
      expect(result).assertTrue()
      expect(await orderSM.getCurrentState()).assertEqual(OrderState.REFUNDED)
    })

    it('BuiltinsOrderStateMachineTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result: boolean = await orderSM.transition(OrderState.PAID, 'skip payment')
      expect(result).assertFalse()
      expect(await orderSM.getCurrentState()).assertEqual(OrderState.CREATED)
    })

    it('BuiltinsOrderStateMachineTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await orderSM.transition(OrderState.PENDING_PAYMENT, 'submit')
      await orderSM.transition(OrderState.PAID, 'pay')
      await orderSM.transition(OrderState.SHIPPED, 'ship')
      await orderSM.transition(OrderState.DELIVERED, 'deliver')
      const result: boolean = await orderSM.transition(OrderState.SHIPPED, 'reverse')
      expect(result).assertFalse()
      expect(await orderSM.getCurrentState()).assertEqual(OrderState.DELIVERED)
    })

    it('BuiltinsOrderStateMachineTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await orderSM.transition(OrderState.PENDING_PAYMENT, 'submit')
      await orderSM.transition(OrderState.CANCELLED, 'cancel')
      const result: boolean = await orderSM.transition(OrderState.PAID, 'try pay')
      expect(result).assertFalse()
      expect(await orderSM.getCurrentState()).assertEqual(OrderState.CANCELLED)
    })

    it('BuiltinsOrderStateMachineTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await orderSM.transition(OrderState.PENDING_PAYMENT, 'submit')
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readOrderStateTask, orderSM))
      }
      const promises: Promise<Object>[] = []
      for (let i: number = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(OrderState.PENDING_PAYMENT)
      }
    })

    it('BuiltinsOrderStateMachineTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await orderSM.transition(OrderState.PENDING_PAYMENT, 'user submit order')
      await orderSM.transition(OrderState.PAID, 'alipay payment')
      await orderSM.transition(OrderState.SHIPPED, 'fedex shipping')
      const lastTransition: OrderTransitionRecord | null = await orderSM.getLastTransition()
      expect(lastTransition !== null && lastTransition !== undefined).assertTrue()
      if (lastTransition !== null) {
        expect(lastTransition.reason_).assertEqual('fedex shipping')
        expect(lastTransition.from_).assertEqual(OrderState.PAID)
        expect(lastTransition.to_).assertEqual(OrderState.SHIPPED)
      }
    })

    it('BuiltinsOrderStateMachineTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await orderSM.transition(OrderState.PENDING_PAYMENT, 'step1')
      await orderSM.transition(OrderState.PAID, 'step2')
      await orderSM.transition(OrderState.SHIPPED, 'step3')
      await orderSM.transition(OrderState.DELIVERED, 'step4')
      expect(await orderSM.getHistoryCount()).assertEqual(4)
    })
  })
}
