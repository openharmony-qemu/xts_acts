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
class MultiStageProgress {
  public stages_: collections.Map<string, number>

  public currentStage_: string = ''
  public totalStages_: number = 0
  public completedStages_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(stages_: collections.Map<string, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.stages_ = stages_
    this.lock_ = lock_
  }


  async setStages(stages: collections.Array<string>): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.stages_.clear()
      for (let i: number = 0; i < stages.length; i++) {
        this.stages_.set(stages[i], 0)
      }
      this.totalStages_ = stages.length
      this.completedStages_ = 0
      if (stages.length > 0) {
        this.currentStage_ = stages[0]
      }
    })
  }

  async updateStageProgress(stageName: string, progress: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      if (this.stages_.has(stageName)) {
        this.stages_.set(stageName, progress)
      }
    })
  }

  async completeStage(stageName: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      if (this.stages_.has(stageName)) {
        this.stages_.set(stageName, 100)
        this.completedStages_++
      }
    })
  }

  async getStageProgress(stageName: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      return this.stages_.get(stageName) ?? 0
    })
  }

  async getTotalProgress(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      if (this.totalStages_ === 0) return 0
      let totalProgress: number = 0
      this.stages_.forEach((value: number) => {
        totalProgress += value
      })
      return Math.floor(totalProgress / this.totalStages_)
    })
  }

  async getCurrentStage(): Promise<string> {
    return await this.lock_.lockAsync((): string => this.currentStage_)
  }

  async getCompletedStages(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.completedStages_)
  }

  async isAllCompleted(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.completedStages_ >= this.totalStages_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.stages_.clear()
      this.currentStage_ = ''
      this.totalStages_ = 0
      this.completedStages_ = 0
    })
  }
}

export default function MultiStageProgressTest(): void {
  describe('MultiStageProgressTest', () => {
    let progress: MultiStageProgress

    beforeEach(async (): Promise<void> => {
      progress = new MultiStageProgress(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await progress.reset()
    })

    /**
     * @tc.name   testMultiStageProgress0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0100
     * @tc.desc   Verify testMultiStageProgress0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultiStageProgress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      stages.push('complete')
      await progress.setStages(stages)
      expect(await progress.getCompletedStages()).assertEqual(0)
      expect(await progress.getCurrentStage()).assertEqual('init')
    })

    /**
     * @tc.name   testMultiStageProgress0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0200
     * @tc.desc   Verify testMultiStageProgress0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultiStageProgress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      await progress.setStages(stages)
      await progress.updateStageProgress('init', 50)
      expect(await progress.getStageProgress('init')).assertEqual(50)
      expect(await progress.getTotalProgress()).assertEqual(50)
    })

    /**
     * @tc.name   testMultiStageProgress0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0300
     * @tc.desc   Verify testMultiStageProgress0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultiStageProgress0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      await progress.setStages(stages)
      await progress.completeStage('init')
      expect(await progress.getStageProgress('init')).assertEqual(100)
      expect(await progress.getCompletedStages()).assertEqual(1)
    })

    /**
     * @tc.name   testMultiStageProgress0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0400
     * @tc.desc   Verify testMultiStageProgress0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultiStageProgress0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      stages.push('complete')
      await progress.setStages(stages)
      await progress.completeStage('init')
      await progress.completeStage('process')
      await progress.completeStage('complete')
      expect(await progress.isAllCompleted()).assertTrue()
      expect(await progress.getTotalProgress()).assertEqual(100)
    })

    /**
     * @tc.name   testMultiStageProgress0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0500
     * @tc.desc   Verify testMultiStageProgress0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiStageProgress0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      stages.push('complete')
      await progress.setStages(stages)
      await progress.completeStage('init')
      await progress.updateStageProgress('process', 50)
      expect(await progress.getTotalProgress()).assertEqual(50)
    })

    /**
     * @tc.name   testMultiStageProgress0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0600
     * @tc.desc   Verify testMultiStageProgress0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiStageProgress0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      await progress.setStages(stages)
      await progress.updateStageProgress('init', 100)
      expect(await progress.getStageProgress('init')).assertEqual(100)
    })

    /**
     * @tc.name   testMultiStageProgress0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0700
     * @tc.desc   Verify testMultiStageProgress0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiStageProgress0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      await progress.setStages(stages)
      await progress.updateStageProgress('unknown', 50)
      expect(await progress.getStageProgress('unknown')).assertEqual(0)
    })

    /**
     * @tc.name   testMultiStageProgress0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0800
     * @tc.desc   Verify testMultiStageProgress0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMultiStageProgress0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      stages.push('complete')
      await progress.setStages(stages)
      const promises: Promise<void>[] = []
      promises.push(progress.completeStage('init'))
      promises.push(progress.completeStage('process'))
      promises.push(progress.completeStage('complete'))
      await Promise.all(promises)
      expect(await progress.getCompletedStages()).assertEqual(3)
      expect(await progress.isAllCompleted()).assertTrue()
    })

    /**
     * @tc.name   testMultiStageProgress0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_0900
     * @tc.desc   Verify testMultiStageProgress0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiStageProgress0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      await progress.setStages(stages)
      await progress.completeStage('init')
      await progress.completeStage('process')
      expect(await progress.isAllCompleted()).assertTrue()
      await progress.reset()
      expect(await progress.getCompletedStages()).assertEqual(0)
    })

    /**
     * @tc.name   testMultiStageProgress1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_1000
     * @tc.desc   Verify testMultiStageProgress1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiStageProgress1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      stages.push('process')
      await progress.setStages(stages)
      await progress.completeStage('init')
      await progress.updateStageProgress('process', 30)
      expect(await progress.getTotalProgress()).assertEqual(65)
    })

    /**
     * @tc.name   testMultiStageProgress1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_1100
     * @tc.desc   Verify testMultiStageProgress1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiStageProgress1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stages: collections.Array<string> = new collections.Array<string>()
      stages.push('init')
      await progress.setStages(stages)
      await progress.updateStageProgress('init', 150)
      expect(await progress.getStageProgress('init')).assertEqual(150)
    })

    /**
     * @tc.name   testMultiStageProgress1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTISTAGEPROGRESS_TEST_1200
     * @tc.desc   Verify testMultiStageProgress1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiStageProgress1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const emptyStages: collections.Array<string> = new collections.Array<string>()
      await progress.setStages(emptyStages)
      expect(await progress.getTotalProgress()).assertEqual(0)
      expect(await progress.isAllCompleted()).assertTrue()
    })
  })
}
