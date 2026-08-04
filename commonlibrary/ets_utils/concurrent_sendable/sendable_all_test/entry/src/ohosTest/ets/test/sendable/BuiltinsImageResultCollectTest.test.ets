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
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ImageResultCollector {
  public successResults_: collections.Array<string>

  public failedResults_: collections.Array<string>

  public resultMap_: collections.Map<number, string>

  public successIds_: collections.Array<number>

  public failedIds_: collections.Array<number>

  public processingTimes_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(successResults_: collections.Array<string>, failedResults_: collections.Array<string>, resultMap_: collections.Map<number, string>, successIds_: collections.Array<number>, failedIds_: collections.Array<number>, processingTimes_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.successResults_ = successResults_
    this.failedResults_ = failedResults_
    this.resultMap_ = resultMap_
    this.successIds_ = successIds_
    this.failedIds_ = failedIds_
    this.processingTimes_ = processingTimes_
    this.lock_ = lock_
  }


  async addSuccessResult(imageId: number, result: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.successResults_.push(result)
      this.successIds_.push(imageId)
      this.resultMap_.set(imageId, result)
    })
  }

  async addFailedResult(imageId: number, errorMsg: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.failedResults_.push(errorMsg)
      this.failedIds_.push(imageId)
      this.resultMap_.set(imageId, `error:${errorMsg}`)
    })
  }

  async addThumbnailResult(imageId: number, thumbnail: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.resultMap_.set(imageId, thumbnail)
    })
  }

  async addProcessingTime(time: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.processingTimes_.push(time)
    })
  }

  getSuccessCount(): number {
    return this.successResults_.length
  }

  getFailedCount(): number {
    return this.failedResults_.length
  }

  getResultByImageId(imageId: number): string | undefined {
    return this.resultMap_.get(imageId)
  }

  getTotalCount(): number {
    return this.successResults_.length + this.failedResults_.length
  }

  getSuccessIds(): collections.Array<number> {
    return this.successIds_
  }

  getFailedIds(): collections.Array<number> {
    return this.failedIds_
  }

  getTotalProcessingTime(): number {
    let total: number = 0
    for (let i = 0; i < this.processingTimes_.length; i++) {
      total += this.processingTimes_[i]
    }
    return total
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.successResults_.length > 0) { this.successResults_.pop() }
      while (this.failedResults_.length > 0) { this.failedResults_.pop() }
      this.resultMap_.clear()
      while (this.successIds_.length > 0) { this.successIds_.pop() }
      while (this.failedIds_.length > 0) { this.failedIds_.pop() }
      while (this.processingTimes_.length > 0) { this.processingTimes_.pop() }
    })
  }
}

@Concurrent
function processImage(imageId: number, shouldFail: boolean): string {
  if (shouldFail) {
    return 'FAIL'
  }
  return `processed_image_${imageId}`
}

@Concurrent
function processThumbnail(imageId: number): string {
  return `thumbnail_${imageId}`
}

export default function BuiltinsImageResultCollectTest(): void {
  describe('BuiltinsImageResultCollectTest', (): void => {
    let collector: ImageResultCollector

    beforeEach((): void => {
      collector = new ImageResultCollector(new collections.Array<string>(), new collections.Array<string>(), new collections.Map<number, string>(), new collections.Array<number>(), new collections.Array<number>(), new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testImageResultCollect0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0100
     * @tc.desc   Verify testImageResultCollect0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageResultCollect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addSuccessResult(1, 'processed_image_1')
      expect(collector.getSuccessCount()).assertEqual(1)
      const result: string | undefined = collector.getResultByImageId(1)
      expect(result).assertEqual('processed_image_1')
    })

    /**
     * @tc.name   testImageResultCollect0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0200
     * @tc.desc   Verify testImageResultCollect0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageResultCollect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addFailedResult(1, 'processing_error')
      expect(collector.getFailedCount()).assertEqual(1)
      const result: string | undefined = collector.getResultByImageId(1)
      expect(result).assertEqual('error:processing_error')
    })

    /**
     * @tc.name   testImageResultCollect0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0300
     * @tc.desc   Verify testImageResultCollect0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageResultCollect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addThumbnailResult(1, 'thumbnail_1')
      const result: string | undefined = collector.getResultByImageId(1)
      expect(result).assertEqual('thumbnail_1')
    })

    /**
     * @tc.name   testImageResultCollect0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0400
     * @tc.desc   Verify testImageResultCollect0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageResultCollect0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(processImage, i, false))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addSuccessResult(i, results[i] as string)
        await collector.addProcessingTime(10)
      }
      expect(collector.getSuccessCount()).assertEqual(5)
    })

    /**
     * @tc.name   testImageResultCollect0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0500
     * @tc.desc   Verify testImageResultCollect0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageResultCollect0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addSuccessResult(1, 'processed_image_1')
      await collector.addSuccessResult(2, 'processed_image_2')
      await collector.addSuccessResult(3, 'processed_image_3')
      expect(collector.getResultByImageId(1)).assertEqual('processed_image_1')
      expect(collector.getResultByImageId(2)).assertEqual('processed_image_2')
      expect(collector.getResultByImageId(3)).assertEqual('processed_image_3')
    })

    /**
     * @tc.name   testImageResultCollect0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0600
     * @tc.desc   Verify testImageResultCollect0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageResultCollect0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collector.addSuccessResult(1, 'processed_image_1')
      const result: string | undefined = collector.getResultByImageId(999)
      expect(result === undefined).assertTrue()
    })

    /**
     * @tc.name   testImageResultCollect0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0700
     * @tc.desc   Verify testImageResultCollect0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageResultCollect0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const successTasks: taskpool.Task[] = []
      const failTasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        successTasks.push(new taskpool.Task(processImage, i * 2, false))
        failTasks.push(new taskpool.Task(processImage, i * 2 + 1, true))
      }
      const successPromises: Promise<Object>[] = []
      const failPromises: Promise<Object>[] = []
      for (let i = 0; i < successTasks.length; i++) {
        successPromises.push(taskpool.execute(successTasks[i]))
      }
      for (let i = 0; i < failTasks.length; i++) {
        failPromises.push(taskpool.execute(failTasks[i]))
      }
      const successResults: Object[] = await Promise.all(successPromises)
      const failResults: Object[] = await Promise.all(failPromises)
      for (let i = 0; i < successResults.length; i++) {
        await collector.addSuccessResult(i * 2, successResults[i] as string)
      }
      for (let i = 0; i < failResults.length; i++) {
        await collector.addFailedResult(i * 2 + 1, 'processing_error')
      }
      expect(collector.getSuccessCount()).assertEqual(3)
      expect(collector.getFailedCount()).assertEqual(3)
    })

    /**
     * @tc.name   testImageResultCollect0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0800
     * @tc.desc   Verify testImageResultCollect0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageResultCollect0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      for (let i = 0; i < 5; i++) {
        await collector.addSuccessResult(i, `processed_image_${i}`)
      }
      expect(collector.getSuccessCount()).assertEqual(5)
    })

    /**
     * @tc.name   testImageResultCollect0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_0900
     * @tc.desc   Verify testImageResultCollect0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageResultCollect0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      for (let i = 0; i < 3; i++) {
        await collector.addFailedResult(i, 'timeout_error')
      }
      expect(collector.getFailedCount()).assertEqual(3)
    })

    /**
     * @tc.name   testImageResultCollect1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_1000
     * @tc.desc   Verify testImageResultCollect1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageResultCollect1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collector.addProcessingTime(10)
      await collector.addProcessingTime(20)
      await collector.addProcessingTime(30)
      expect(collector.getTotalProcessingTime()).assertEqual(60)
    })

    /**
     * @tc.name   testImageResultCollect1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_1100
     * @tc.desc   Verify testImageResultCollect1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageResultCollect1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(processImage, i, false))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addSuccessResult(i, results[i] as string)
        await collector.addProcessingTime(10)
      }
      expect(collector.getTotalProcessingTime()).assertEqual(50)
    })

    /**
     * @tc.name   testImageResultCollect1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_1200
     * @tc.desc   Verify testImageResultCollect1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageResultCollect1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collector.addSuccessResult(1, 'ok_1')
      await collector.addSuccessResult(2, 'ok_2')
      await collector.addFailedResult(3, 'error_3')
      await collector.addFailedResult(4, 'error_4')
      const successIds: collections.Array<number> = collector.getSuccessIds()
      const failedIds: collections.Array<number> = collector.getFailedIds()
      expect(successIds.length).assertEqual(2)
      expect(failedIds.length).assertEqual(2)
    })

    /**
     * @tc.name   testImageResultCollect1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_IMAGERESULTCOLLECT_TEST_1300
     * @tc.desc   Verify testImageResultCollect1300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testImageResultCollect1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const successTasks: taskpool.Task[] = []
      const failTasks: taskpool.Task[] = []
      for (let i = 0; i < 8; i++) {
        successTasks.push(new taskpool.Task(processImage, i, false))
      }
      for (let i = 8; i < 10; i++) {
        failTasks.push(new taskpool.Task(processImage, i, true))
      }
      const successPromises: Promise<Object>[] = []
      const failPromises: Promise<Object>[] = []
      for (let i = 0; i < successTasks.length; i++) {
        successPromises.push(taskpool.execute(successTasks[i]))
      }
      for (let i = 0; i < failTasks.length; i++) {
        failPromises.push(taskpool.execute(failTasks[i]))
      }
      const successResults: Object[] = await Promise.all(successPromises)
      const failResults: Object[] = await Promise.all(failPromises)
      for (let i = 0; i < successResults.length; i++) {
        await collector.addSuccessResult(i, successResults[i] as string)
      }
      for (let i = 0; i < failResults.length; i++) {
        await collector.addFailedResult(8 + i, 'processing_error')
      }
      expect(collector.getTotalCount()).assertEqual(10)
      expect(collector.getSuccessCount()).assertEqual(8)
      expect(collector.getFailedCount()).assertEqual(2)
    })
  })
}
