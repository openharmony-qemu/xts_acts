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
import { RequestType } from './SendableTestEnums'


@Sendable
class RequestCounter {
  public totalCount_: number = 0
  public successCount_: number = 0
  public failedCount_: number = 0
  public getCount_: number = 0
  public postCount_: number = 0

  recordRequest(type: number, success: boolean): void {
    this.totalCount_++
    if (success) {
      this.successCount_++
    } else {
      this.failedCount_++
    }
    if (type === RequestType.GET) {
      this.getCount_++
    } else if (type === RequestType.POST) {
      this.postCount_++
    }
  }

  getTotal(): number {
    return this.totalCount_
  }

  getSuccess(): number {
    return this.successCount_
  }

  getFailed(): number {
    return this.failedCount_
  }

  getByType(type: number): number {
    if (type === RequestType.GET) {
      return this.getCount_
    }
    if (type === RequestType.POST) {
      return this.postCount_
    }
    return 0
  }

  checkThreshold(threshold: number): boolean {
    return this.totalCount_ >= threshold
  }

  reset(): void {
    this.totalCount_ = 0
    this.successCount_ = 0
    this.failedCount_ = 0
    this.getCount_ = 0
    this.postCount_ = 0
  }
}

@Concurrent
function simulateGetRequest(counter: RequestCounter): void {
  counter.totalCount_++
  counter.successCount_++
  counter.getCount_++
}

@Concurrent
function simulatePostRequest(counter: RequestCounter): void {
  counter.totalCount_++
  counter.successCount_++
  counter.postCount_++
}

@Concurrent
function simulateFailedRequest(counter: RequestCounter): void {
  counter.totalCount_++
  counter.failedCount_++
}

export default function BuiltinsSharedCounterRequestTest(): void {
  describe('BuiltinsSharedCounterRequestTest', (): void => {
    let counter: RequestCounter

    beforeEach((): void => {
      counter = new RequestCounter()
    })
    /**
     * @tc.name   testSharedCounterRequest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0100
     * @tc.desc   Verify testSharedCounterRequest0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterRequest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      counter.recordRequest(RequestType.GET, true)
      expect(counter.getTotal()).assertEqual(1)
      expect(counter.getByType(RequestType.GET)).assertEqual(1)
    })

    /**
     * @tc.name   testSharedCounterRequest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0200
     * @tc.desc   Verify testSharedCounterRequest0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterRequest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      counter.recordRequest(RequestType.POST, true)
      expect(counter.getTotal()).assertEqual(1)
      expect(counter.getByType(RequestType.POST)).assertEqual(1)
    })

    /**
     * @tc.name   testSharedCounterRequest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0300
     * @tc.desc   Verify testSharedCounterRequest0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterRequest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      counter.recordRequest(RequestType.GET, false)
      expect(counter.getFailed()).assertEqual(1)
      expect(counter.getSuccess()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedCounterRequest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0400
     * @tc.desc   Verify testSharedCounterRequest0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedCounterRequest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 20; i++) {
        if (i % 2 === 0) {
          tasks.push(new taskpool.Task(simulateGetRequest, counter))
        } else {
          tasks.push(new taskpool.Task(simulatePostRequest, counter))
        }
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(counter.getTotal()).assertLargerOrEqual(1)
      expect(counter.getSuccess()).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   testSharedCounterRequest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0500
     * @tc.desc   Verify testSharedCounterRequest0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedCounterRequest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 50; i++) {
        if (i % 3 === 0) {
          tasks.push(new taskpool.Task(simulateFailedRequest, counter))
        } else if (i % 2 === 0) {
          tasks.push(new taskpool.Task(simulateGetRequest, counter))
        } else {
          tasks.push(new taskpool.Task(simulatePostRequest, counter))
        }
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(counter.getTotal()).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   testSharedCounterRequest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0600
     * @tc.desc   Verify testSharedCounterRequest0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedCounterRequest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(simulateGetRequest, counter))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(counter.getTotal()).assertLargerOrEqual(1)
      expect(counter.getSuccess()).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   testSharedCounterRequest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0700
     * @tc.desc   Verify testSharedCounterRequest0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterRequest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const threshold: number = 10
      for (let i = 0; i < threshold; i++) {
        counter.recordRequest(RequestType.GET, true)
      }
      expect(counter.checkThreshold(threshold)).assertTrue()
    })

    /**
     * @tc.name   testSharedCounterRequest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0800
     * @tc.desc   Verify testSharedCounterRequest0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterRequest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const threshold: number = 100
      for (let i = 0; i < 10; i++) {
        counter.recordRequest(RequestType.GET, true)
      }
      expect(counter.checkThreshold(threshold)).assertFalse()
    })

    /**
     * @tc.name   testSharedCounterRequest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_0900
     * @tc.desc   Verify testSharedCounterRequest0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedCounterRequest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 30; i++) {
        if (i % 4 === 0) {
          tasks.push(new taskpool.Task(simulateFailedRequest, counter))
        } else {
          tasks.push(new taskpool.Task(simulateGetRequest, counter))
        }
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      const total: number = counter.getTotal()
      const success: number = counter.getSuccess()
      const failed: number = counter.getFailed()
      expect(total).assertLargerOrEqual(1)
      expect(success + failed).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   testSharedCounterRequest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_1000
     * @tc.desc   Verify testSharedCounterRequest1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterRequest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      counter.recordRequest(RequestType.GET, true)
      counter.recordRequest(RequestType.POST, true)
      counter.recordRequest(RequestType.GET, false)
      expect(counter.getByType(RequestType.GET)).assertEqual(2)
      expect(counter.getByType(RequestType.POST)).assertEqual(1)
    })

    /**
     * @tc.name   testSharedCounterRequest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHAREDCOUNTERREQUEST_TEST_1100
     * @tc.desc   Verify testSharedCounterRequest1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedCounterRequest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      counter.recordRequest(RequestType.GET, true)
      counter.recordRequest(RequestType.POST, true)
      counter.recordRequest(RequestType.GET, false)
      counter.reset()
      expect(counter.getTotal()).assertEqual(0)
      expect(counter.getSuccess()).assertEqual(0)
      expect(counter.getFailed()).assertEqual(0)
    })
  })
}
