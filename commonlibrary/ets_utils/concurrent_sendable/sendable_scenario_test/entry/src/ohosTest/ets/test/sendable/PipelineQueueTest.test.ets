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
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class PipelineStageQueue {
  public stage1Queue_: collections.Array<number>

  public stage2Queue_: collections.Array<number>

  public stage3Queue_: collections.Array<number>

  public outputQueue_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(stage1Queue_: collections.Array<number>, stage2Queue_: collections.Array<number>, stage3Queue_: collections.Array<number>, outputQueue_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.stage1Queue_ = stage1Queue_
    this.stage2Queue_ = stage2Queue_
    this.stage3Queue_ = stage3Queue_
    this.outputQueue_ = outputQueue_
    this.lock_ = lock_
  }


  async inputStage1(data: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.stage1Queue_.push(data)
    })
  }

  async processStage1(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.stage1Queue_.length > 0) {
        const data: number = this.stage1Queue_[0]
        this.stage1Queue_.splice(0, 1)
        this.stage2Queue_.push(data * 2)
      }
    })
  }

  async processStage2(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.stage2Queue_.length > 0) {
        const data: number = this.stage2Queue_[0]
        this.stage2Queue_.splice(0, 1)
        this.stage3Queue_.push(data + 10)
      }
    })
  }

  async processStage3(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.stage3Queue_.length > 0) {
        const data: number = this.stage3Queue_[0]
        this.stage3Queue_.splice(0, 1)
        this.outputQueue_.push(data)
      }
    })
  }

  async getStage1Size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.stage1Queue_.length)
  }

  async getStage2Size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.stage2Queue_.length)
  }

  async getStage3Size(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.stage3Queue_.length)
  }

  async getOutputSize(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.outputQueue_.length)
  }

  async getOutputData(): Promise<number[]> {
    return await this.lock_.lockAsync((): number[] => {
      const result: number[] = []
      for (let i = 0; i < this.outputQueue_.length; i++) {
        result.push(this.outputQueue_[i])
      }
      return result
    })
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.stage1Queue_.length > 0) { this.stage1Queue_.pop() }
      while (this.stage2Queue_.length > 0) { this.stage2Queue_.pop() }
      while (this.stage3Queue_.length > 0) { this.stage3Queue_.pop() }
      while (this.outputQueue_.length > 0) { this.outputQueue_.pop() }
    })
  }
}

@Concurrent
async function stage1Processor(queue: PipelineStageQueue): Promise<void> {
  return await queue.lock_.lockAsync((): void => {
    while (queue.stage1Queue_.length > 0) {
      const data: number = queue.stage1Queue_[0]
      queue.stage1Queue_.splice(0, 1)
      queue.stage2Queue_.push(data * 2)
    }

  })
}

@Concurrent
async function stage2Processor(queue: PipelineStageQueue): Promise<void> {
  return await queue.lock_.lockAsync((): void => {
    while (queue.stage2Queue_.length > 0) {
      const data: number = queue.stage2Queue_[0]
      queue.stage2Queue_.splice(0, 1)
      queue.stage3Queue_.push(data + 10)
    }

  })
}

@Concurrent
async function stage3Processor(queue: PipelineStageQueue): Promise<void> {
  return await queue.lock_.lockAsync((): void => {
    while (queue.stage3Queue_.length > 0) {
      const data: number = queue.stage3Queue_[0]
      queue.stage3Queue_.splice(0, 1)
      queue.outputQueue_.push(data)
    }

  })
}

export default function PipelineQueueTest(): void {
  describe('PipelineQueueTest', (): void => {
    let pipeline: PipelineStageQueue

    beforeEach((): void => {
      pipeline = new PipelineStageQueue(new collections.Array<number>(), new collections.Array<number>(), new collections.Array<number>(), new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testPipelineQueue0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PIPELINEQUEUE_TEST_0100
     * @tc.desc   Verify testPipelineQueue0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipelineQueue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await pipeline.inputStage1(5)
        expect(await pipeline.getStage1Size()).assertEqual(1)

        await pipeline.processStage1()
        expect(await pipeline.getStage1Size()).assertEqual(0)
        expect(await pipeline.getStage2Size()).assertEqual(1)

        await pipeline.processStage2()
        expect(await pipeline.getStage2Size()).assertEqual(0)
        expect(await pipeline.getStage3Size()).assertEqual(1)

        await pipeline.processStage3()
        expect(await pipeline.getStage3Size()).assertEqual(0)
        expect(await pipeline.getOutputSize()).assertEqual(1)

        const output: number[] = await pipeline.getOutputData()
        expect(output[0]).assertEqual(20)
      } catch (error) {
        console.error("testPipelineQueue0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testPipelineQueue0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PIPELINEQUEUE_TEST_0200
     * @tc.desc   Verify testPipelineQueue0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPipelineQueue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await pipeline.inputStage1(10)
        await pipeline.processStage1()
        await pipeline.processStage2()
        await pipeline.processStage3()

        const output: number[] = await pipeline.getOutputData()
        expect(output[0]).assertEqual(30)
      } catch (error) {
        console.error("testPipelineQueue0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testPipelineQueue0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PIPELINEQUEUE_TEST_0300
     * @tc.desc   Verify testPipelineQueue0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPipelineQueue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const promises: Promise<void>[] = []
        for (let i = 0; i < 10; i++) {
          promises.push(pipeline.inputStage1(i))
        }
        await Promise.all(promises)

        expect(await pipeline.getStage1Size()).assertEqual(10)

        await pipeline.processStage1()
        expect(await pipeline.getStage2Size()).assertEqual(10)

        await pipeline.processStage2()
        expect(await pipeline.getStage3Size()).assertEqual(10)

        await pipeline.processStage3()
        expect(await pipeline.getOutputSize()).assertEqual(10)
      } catch (error) {
        console.error("testPipelineQueue0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testPipelineQueue0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PIPELINEQUEUE_TEST_0400
     * @tc.desc   Verify testPipelineQueue0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPipelineQueue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 5; i++) {
          await pipeline.inputStage1(i)
        }

        const task1: taskpool.Task = new taskpool.Task(stage1Processor, pipeline)
        await taskpool.execute(task1)
        expect(await pipeline.getStage2Size()).assertEqual(5)

        const task2: taskpool.Task = new taskpool.Task(stage2Processor, pipeline)
        await taskpool.execute(task2)
        expect(await pipeline.getStage3Size()).assertEqual(5)

        const task3: taskpool.Task = new taskpool.Task(stage3Processor, pipeline)
        await taskpool.execute(task3)
        expect(await pipeline.getOutputSize()).assertEqual(5)
      } catch (error) {
        console.error("testPipelineQueue0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testPipelineQueue0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PIPELINEQUEUE_TEST_0500
     * @tc.desc   Verify testPipelineQueue0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPipelineQueue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        for (let i = 0; i < 5; i++) {
          await pipeline.inputStage1(i)
        }

        await pipeline.processStage1()
        await pipeline.processStage2()
        await pipeline.processStage3()

        const output: number[] = await pipeline.getOutputData()
        for (let i = 0; i < 5; i++) {
          expect(output[i]).assertEqual(i * 2 + 10)
        }
      } catch (error) {
        console.error("testPipelineQueue0500 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
