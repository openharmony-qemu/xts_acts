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
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ImageCacheManager {
  public cache_: ArkTSUtils.SendableLruCache<string, string>
  public capacity_: number = 50
  public sizeInfo_: collections.Map<string, string>

  public hitCount_: number = 0
  public missCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(sizeInfo_: collections.Map<string, string>, lock_: ArkTSUtils.locks.AsyncLock, cache_: ArkTSUtils.SendableLruCache<string, string>) {
    this.cache_ = cache_
    this.sizeInfo_ = sizeInfo_
    this.lock_ = lock_
  }


  async setImage(url: string, data: string, sizeInfo: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.cache_.put(url, data)
      this.sizeInfo_.set(url, sizeInfo)
    })
  }

  async getImage(url: string): Promise<string | undefined> {
    let value: string | undefined = undefined
    await this.lock_.lockAsync((): void => {
      value = this.cache_.get(url)
      if (value !== undefined) {
        this.hitCount_++
      } else {
        this.missCount_++
      }
    })
    return value
  }

  hasImage(url: string): boolean {
    return this.cache_.contains(url)
  }

  removeImage(url: string): void {
    this.cache_.remove(url)
    this.sizeInfo_.delete(url)
  }

  clear(): void {
    this.cache_.clear()
    this.sizeInfo_.clear()
    this.hitCount_ = 0
    this.missCount_ = 0
  }

  length(): number {
    return this.cache_.length
  }

  capacity(): number {
    return this.capacity_
  }

  getSizeInfo(url: string): string | undefined {
    return this.sizeInfo_.get(url)
  }

  getHitCount(): number {
    return this.hitCount_
  }

  getMissCount(): number {
    return this.missCount_
  }
}

@Concurrent
function concurrentLoadImage(url: string, data: string): string {
  return data
}

export default function ImageCacheTest(): void {
  describe('ImageCacheTest', (): void => {
    let cache: ImageCacheManager

    beforeEach((): void => {
      const sizeInfoArg: collections.Map<string, string> = new collections.Map<string, string>()
      const lockArg: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(50)
      cache = new ImageCacheManager(sizeInfoArg, lockArg, cacheArg)
    })
    /**
     * @tc.name   testImageCache0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0100
     * @tc.desc   Verify testImageCache0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageCache0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.setImage('https://img.example.com/photo1.jpg', 'image_data_1', '1920x1080')
      let value: string | undefined = await cache.getImage('https://img.example.com/photo1.jpg')
      expect(value).assertEqual('image_data_1')
    })

    /**
     * @tc.name   testImageCache0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0200
     * @tc.desc   Verify testImageCache0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageCache0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.setImage('img_1', 'binary_data_1', '800x600')
      await cache.setImage('img_2', 'binary_data_2', '1024x768')
      expect(await cache.getImage('img_1')).assertEqual('binary_data_1')
      expect(await cache.getImage('img_2')).assertEqual('binary_data_2')
    })

    /**
     * @tc.name   testImageCache0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0300
     * @tc.desc   Verify testImageCache0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageCache0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.setImage('img_1', 'data_1', '100x100')
      expect(cache.hasImage('img_1')).assertTrue()
      expect(cache.hasImage('img_nonexistent')).assertFalse()
    })

    /**
     * @tc.name   testImageCache0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0400
     * @tc.desc   Verify testImageCache0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageCache0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(cache.capacity()).assertEqual(50)
    })

    /**
     * @tc.name   testImageCache0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0500
     * @tc.desc   Verify testImageCache0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageCache0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const smallLru: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(3)
      smallLru.put('img_1', 'large_data_1')
      smallLru.put('img_2', 'large_data_2')
      smallLru.put('img_3', 'large_data_3')
      smallLru.put('img_4', 'large_data_4')
      expect(smallLru.contains('img_1')).assertFalse()
      expect(smallLru.length).assertEqual(3)
    })

    /**
     * @tc.name   testImageCache0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0600
     * @tc.desc   Verify testImageCache0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageCache0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 20; i++) {
        await cache.setImage(`preload_${i}`, `data_${i}`, `${i * 10}x${i * 10}`)
      }
      expect(cache.length()).assertEqual(20)
      for (let i = 0; i < 20; i++) {
        expect(cache.hasImage(`preload_${i}`)).assertTrue()
      }
    })

    /**
     * @tc.name   testImageCache0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0700
     * @tc.desc   Verify testImageCache0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageCache0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentLoadImage, `img_${i}`, `data_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await cache.setImage(`img_${i}`, results[i] as string, '100x100')
      }
      expect(cache.length()).assertEqual(5)
    })

    /**
     * @tc.name   testImageCache0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0800
     * @tc.desc   Verify testImageCache0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageCache0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(concurrentLoadImage, `concurrent_${i}`, `cdata_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await cache.setImage(`concurrent_${i}`, results[i] as string, '100x100')
      }
      for (let i = 0; i < 10; i++) {
        expect(cache.hasImage(`concurrent_${i}`)).assertTrue()
      }
    })

    /**
     * @tc.name   testImageCache0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_0900
     * @tc.desc   Verify testImageCache0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageCache0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.setImage('img_1', 'old_data', '100x100')
      await cache.setImage('img_1', 'new_data', '200x200')
      expect(await cache.getImage('img_1')).assertEqual('new_data')
    })

    /**
     * @tc.name   testImageCache1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_1000
     * @tc.desc   Verify testImageCache1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageCache1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await cache.setImage('img_1', 'data_1', '100x100')
      const sizeInfo: string | undefined = cache.getSizeInfo('img_1')
      expect(sizeInfo).assertEqual('100x100')
    })

    /**
     * @tc.name   testImageCache1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGECACHE_TEST_1100
     * @tc.desc   Verify testImageCache1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageCache1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.setImage('img_1', 'data_1', '100x100')
      await cache.setImage('img_2', 'data_2', '200x200')
      cache.clear()
      expect(cache.length()).assertEqual(0)
    })
  })
}
