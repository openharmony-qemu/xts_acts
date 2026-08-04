/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ResourceRefCounter {
  public resourceId_: string = ''
  public refCount_: number = 0
  public holders_: collections.Array<string>


  constructor(id: string, holders_: collections.Array<string>) {
    this.holders_ = holders_

    this.resourceId_ = id
  }

  acquire(holderId: string): number {
    this.refCount_++
    this.holders_.push(holderId)
    return this.refCount_
  }

  release(holderId: string): number {
    if (this.refCount_ > 0) {
      this.refCount_--
      const index: number = this.holders_.indexOf(holderId)
      if (index >= 0) {
        this.holders_[index] = ''
      }
    }
    return this.refCount_
  }

  getRefCount(): number {
    return this.refCount_
  }

  isReferenced(): boolean {
    return this.refCount_ > 0
  }

  canRelease(): boolean {
    return this.refCount_ === 0
  }

  getResourceId(): string {
    return this.resourceId_
  }

  getHoldersCount(): number {
    return this.holders_.length
  }
}

@Concurrent
function acquireResource(refCounter: ResourceRefCounter, holderId: string): number {
  refCounter.refCount_++
  refCounter.holders_.push(holderId)
  return refCounter.refCount_
}

@Concurrent
function releaseResource(refCounter: ResourceRefCounter, holderId: string): number {
  if (refCounter.refCount_ > 0) {
    refCounter.refCount_--
  }
  return refCounter.refCount_
}

export default function BuiltinsSharedCounterResourceRefTest(): void {
  describe('BuiltinsSharedCounterResourceRefTest', (): void => {
    let refCounter: ResourceRefCounter

    beforeEach((): void => {
      refCounter = new ResourceRefCounter('test_resource', new collections.Array<string>())
    })
    /**
     * @tc.name   testSharedCounterResourceRef0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0100
     * @tc.desc   Verify testSharedCounterResourceRef0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterResourceRef0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(refCounter.getRefCount()).assertEqual(0)
      expect(refCounter.isReferenced()).assertFalse()
    })

    /**
     * @tc.name   testSharedCounterResourceRef0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0200
     * @tc.desc   Verify testSharedCounterResourceRef0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterResourceRef0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const count: number = refCounter.acquire('holder_1')
      expect(count).assertEqual(1)
      expect(refCounter.isReferenced()).assertTrue()
    })

    /**
     * @tc.name   testSharedCounterResourceRef0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0300
     * @tc.desc   Verify testSharedCounterResourceRef0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterResourceRef0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      refCounter.acquire('holder_1')
      const count: number = refCounter.release('holder_1')
      expect(count).assertEqual(0)
      expect(refCounter.canRelease()).assertTrue()
    })

    /**
     * @tc.name   testSharedCounterResourceRef0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0400
     * @tc.desc   Verify testSharedCounterResourceRef0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterResourceRef0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      refCounter.acquire('holder_1')
      refCounter.acquire('holder_2')
      refCounter.acquire('holder_3')
      expect(refCounter.getRefCount()).assertEqual(3)
    })

    /**
     * @tc.name   testSharedCounterResourceRef0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0500
     * @tc.desc   Verify testSharedCounterResourceRef0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterResourceRef0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      refCounter.acquire('holder_1')
      refCounter.acquire('holder_2')
      refCounter.release('holder_1')
      refCounter.release('holder_2')
      expect(refCounter.getRefCount()).assertEqual(0)
      expect(refCounter.canRelease()).assertTrue()
    })

    /**
     * @tc.name   testSharedCounterResourceRef0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0600
     * @tc.desc   Verify testSharedCounterResourceRef0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedCounterResourceRef0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 10; i++) {
        refCounter.acquire(`holder_${i}`)
      }
      expect(refCounter.getRefCount()).assertEqual(10)
    })

    /**
     * @tc.name   testSharedCounterResourceRef0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0700
     * @tc.desc   Verify testSharedCounterResourceRef0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedCounterResourceRef0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 10; i++) {
        refCounter.acquire(`holder_${i}`)
      }
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(releaseResource, refCounter, `holder_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(refCounter.getRefCount()).assertLargerOrEqual(0)
    })

    /**
     * @tc.name   testSharedCounterResourceRef0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0800
     * @tc.desc   Verify testSharedCounterResourceRef0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedCounterResourceRef0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 5; i++) {
        refCounter.acquire(`holder_${i}`)
      }
      expect(refCounter.getRefCount()).assertEqual(5)
      for (let i = 0; i < 3; i++) {
        refCounter.release(`holder_${i}`)
      }
      expect(refCounter.getRefCount()).assertEqual(2)
    })

    /**
     * @tc.name   testSharedCounterResourceRef0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_0900
     * @tc.desc   Verify testSharedCounterResourceRef0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterResourceRef0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      refCounter.release('non_exist')
      expect(refCounter.getRefCount()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedCounterResourceRef1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_1000
     * @tc.desc   Verify testSharedCounterResourceRef1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterResourceRef1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(refCounter.getResourceId()).assertEqual('test_resource')
    })

    /**
     * @tc.name   testSharedCounterResourceRef1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERRESOURCEREF_TEST_1100
     * @tc.desc   Verify testSharedCounterResourceRef1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedCounterResourceRef1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 15; i++) {
        refCounter.acquire(`holder_${i}`)
      }
      for (let i = 0; i < 5; i++) {
        refCounter.release(`holder_${i}`)
      }
      expect(refCounter.getRefCount()).assertEqual(10)
    })
  })
}
