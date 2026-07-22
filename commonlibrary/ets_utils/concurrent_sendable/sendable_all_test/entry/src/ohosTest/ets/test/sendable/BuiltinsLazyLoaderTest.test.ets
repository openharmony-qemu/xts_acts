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
class SharedLazyLoader {
  private value_: string = ''
  private loaded_: boolean = false
  private loading_: boolean = false
  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async load(): Promise<string> {
    return await this.lock_.lockAsync(async (): Promise<string> => {
      if (this.loaded_) {
        return this.value_
      }
      if (this.loading_) {
        return ''
      }
      this.loading_ = true
      this.value_ = 'loaded_value'
      this.loaded_ = true
      this.loading_ = false
      return this.value_
    })
  }

  isLoaded(): boolean {
    return this.loaded_
  }

  getValue(): string {
    return this.value_
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.value_ = ''
      this.loaded_ = false
      this.loading_ = false
    })
  }
}

@Concurrent
async function lazyLoadTask(loader: SharedLazyLoader): Promise<void> {
  await loader.load()
}

export default function BuiltinsLazyLoaderTest(): void {
  describe('BuiltinsLazyLoaderTest', (): void => {
    const loader: SharedLazyLoader = new SharedLazyLoader(new ArkTSUtils.locks.AsyncLock())

    beforeEach(async (): Promise<void> => {
      await loader.reset()
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testLazyLoader0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0100
     * @tc.desc   Verify basic lazy loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLazyLoader0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      expect(loader.isLoaded()).assertFalse()

      const value: string = await loader.load()

      expect(value).assertEqual('loaded_value')
      expect(loader.isLoaded()).assertTrue()
    })

    /**
     * @tc.name   testLazyLoader0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0200
     * @tc.desc   Verify lazy loading only loads once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLazyLoader0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const value1: string = await loader.load()
      const value2: string = await loader.load()

      expect(value1).assertEqual('loaded_value')
      expect(value2).assertEqual('loaded_value')
      expect(loader.isLoaded()).assertTrue()
    })

    /**
     * @tc.name   testLazyLoader0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0300
     * @tc.desc   Verify lazy loader reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLazyLoader0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await loader.load()
      expect(loader.isLoaded()).assertTrue()

      await loader.reset()
      expect(loader.isLoaded()).assertFalse()
      expect(loader.getValue()).assertEqual('')
    })

    /**
     * @tc.name   testLazyLoader0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0400
     * @tc.desc   Verify concurrent lazy loading with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLazyLoader0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(lazyLoadTask, loader))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(loader.isLoaded()).assertTrue()
    })

    /**
     * @tc.name   testLazyLoader0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0500
     * @tc.desc   Verify small concurrency 3 lazy loading tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLazyLoader0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(lazyLoadTask, loader))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(loader.isLoaded()).assertTrue()
    })

    /**
     * @tc.name   testLazyLoader0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0600
     * @tc.desc   Verify small concurrency 10 lazy loading tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLazyLoader0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(lazyLoadTask, loader))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(loader.isLoaded()).assertTrue()
    })

    /**
     * @tc.name   testLazyLoader0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0700
     * @tc.desc   Verify getValue before loading returns empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLazyLoader0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(loader.getValue()).assertEqual('')
      expect(loader.isLoaded()).assertFalse()
    })

    /**
     * @tc.name   testLazyLoader0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0800
     * @tc.desc   Verify getValue after loading returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLazyLoader0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await loader.load()
      expect(loader.getValue()).assertEqual('loaded_value')
    })

    /**
     * @tc.name   testLazyLoader0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_LAZY_LOADER_TEST_0900
     * @tc.desc   Verify load after reset works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLazyLoader0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await loader.load()
      await loader.reset()

      expect(loader.isLoaded()).assertFalse()

      const value: string = await loader.load()
      expect(value).assertEqual('loaded_value')
      expect(loader.isLoaded()).assertTrue()
    })
  })
}
