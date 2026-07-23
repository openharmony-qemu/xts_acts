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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import Utils from '../utils'

@Sendable
class InventoryCounter {
  public stock_: number = 0
  public sold_: number = 0

  setStock(total: number): void {
    this.stock_ = total
    this.sold_ = 0
  }

  getStock(): number {
    return this.stock_
  }

  getSold(): number {
    return this.sold_
  }

  purchase(quantity: number): boolean {
    if (this.stock_ >= quantity) {
      this.stock_ -= quantity
      this.sold_ += quantity
      return true
    }
    return false
  }

  refund(quantity: number): void {
    this.stock_ += quantity
    this.sold_ -= quantity
  }

  isInStock(): boolean {
    return this.stock_ > 0
  }

  reset(): void {
    this.stock_ = 0
    this.sold_ = 0
  }
}

@Concurrent
function purchaseOne(inventory: InventoryCounter): boolean {
  if (inventory.stock_ > 0) {
    inventory.stock_--
    inventory.sold_++
    return true
  }
  return false
}

@Concurrent
function purchaseQuantity(inventory: InventoryCounter, quantity: number): boolean {
  if (inventory.stock_ >= quantity) {
    inventory.stock_ -= quantity
    inventory.sold_ += quantity
    return true
  }
  return false
}

export default function BuiltinsSharedCounterInventoryTest(): void {
  describe('BuiltinsSharedCounterInventoryTest', (): void => {
    let inventory: InventoryCounter

    beforeEach((): void => {
      inventory = new InventoryCounter()
    })
    /** @tc.level  LEVEL0 */
    it('testSharedCounterInventory0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      inventory.setStock(100)
      expect(inventory.getStock()).assertEqual(100)
      expect(inventory.getSold()).assertEqual(0)
    })

    /** @tc.level  LEVEL0 */
    it('testSharedCounterInventory0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      inventory.setStock(10)
      const success: boolean = inventory.purchase(1)
      expect(success).assertTrue()
      expect(inventory.getStock()).assertEqual(9)
      expect(inventory.getSold()).assertEqual(1)
    })

    /** @tc.level  LEVEL0 */
    it('testSharedCounterInventory0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      inventory.setStock(5)
      const success: boolean = inventory.purchase(10)
      expect(success).assertFalse()
      expect(inventory.getStock()).assertEqual(5)
    })

    /** @tc.level  LEVEL0 */
    it('testSharedCounterInventory0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      inventory.setStock(10)
      inventory.purchase(3)
      inventory.refund(3)
      expect(inventory.getStock()).assertEqual(10)
      expect(inventory.getSold()).assertEqual(0)
    })

    /** @tc.level  LEVEL2 */
    it('testSharedCounterInventory0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      inventory.setStock(5)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(purchaseOne, inventory))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i] as boolean) {
          successCount++
        }
      }
      expect(successCount).assertLargerOrEqual(1)
      expect(inventory.getStock()).assertLargerOrEqual(0)
      expect(inventory.getSold()).assertLargerOrEqual(1)
    })

    /** @tc.level  LEVEL2 */
    it('testSharedCounterInventory0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      inventory.setStock(0)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(purchaseOne, inventory))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i] as boolean) {
          successCount++
        }
      }
      expect(successCount).assertEqual(0)
      expect(inventory.getStock()).assertEqual(0)
    })

    /** @tc.level  LEVEL2 */
    it('testSharedCounterInventory0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      inventory.setStock(50)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(purchaseOne, inventory))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i] as boolean) {
          successCount++
        }
      }
      expect(successCount).assertLargerOrEqual(1)
      expect(inventory.getStock()).assertLargerOrEqual(0)
      expect(inventory.getSold()).assertLargerOrEqual(1)
    })

    /** @tc.level  LEVEL2 */
    it('testSharedCounterInventory0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      inventory.setStock(100)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(purchaseQuantity, inventory, 10))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      let successCount: number = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i] as boolean) {
          successCount++
        }
      }
      expect(successCount).assertLargerOrEqual(1)
      expect(inventory.getStock()).assertLargerOrEqual(0)
    })

    /** @tc.level  LEVEL0 */
    it('testSharedCounterInventory0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      inventory.setStock(10)
      expect(inventory.isInStock()).assertTrue()
      inventory.purchase(10)
      expect(inventory.isInStock()).assertFalse()
    })

    /** @tc.level  LEVEL0 */
    it('testSharedCounterInventory1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      inventory.setStock(10)
      inventory.purchase(5)
      inventory.setStock(20)
      expect(inventory.getStock()).assertEqual(20)
    })
  })
}
