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
class NumericResultCollector {
  public values_: collections.Array<number>

  public resultMap_: collections.Map<string, number>

  public sum_: number = 0
  public count_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(values_: collections.Array<number>, resultMap_: collections.Map<string, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.values_ = values_
    this.resultMap_ = resultMap_
    this.lock_ = lock_
  }


  addValue(value: number): void {
    this.values_.push(value)
    this.sum_ += value
    this.count_++
  }

  async addShardResult(shardId: string, value: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.resultMap_.set(shardId, value)
      this.values_.push(value)
      this.sum_ += value
      this.count_++
    })
  }

  getSum(): number {
    return this.sum_
  }

  getAverage(): number {
    if (this.count_ === 0) {
      return 0
    }
    return this.sum_ / this.count_
  }

  getMax(): number {
    if (this.values_.length === 0) {
      return 0
    }
    let max: number = this.values_[0]
    for (let i = 1; i < this.values_.length; i++) {
      if (this.values_[i] > max) {
        max = this.values_[i]
      }
    }
    return max
  }

  getMin(): number {
    if (this.values_.length === 0) {
      return 0
    }
    let min: number = this.values_[0]
    for (let i = 1; i < this.values_.length; i++) {
      if (this.values_[i] < min) {
        min = this.values_[i]
      }
    }
    return min
  }

  getValues(): collections.Array<number> {
    return this.values_
  }

  getShardResult(shardId: string): number | undefined {
    return this.resultMap_.get(shardId)
  }

  getCount(): number {
    return this.count_
  }

  clear(): void {
    while (this.values_.length > 0) { this.values_.pop() }
    this.resultMap_.clear()
    this.sum_ = 0
    this.count_ = 0
  }
}

@Concurrent
function computeShard(start: number, end: number): number {
  let partialSum: number = 0
  for (let i = start; i < end; i++) {
    partialSum += i
  }
  return partialSum
}

export default function ParallelComputeResultTest(): void {
  describe('ParallelComputeResultTest', (): void => {
    let collector: NumericResultCollector

    beforeEach((): void => {
      collector = new NumericResultCollector(new collections.Array<number>(), new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testParallelComputeResult0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0100
     * @tc.desc   Verify testParallelComputeResult0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParallelComputeResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addValue(10)
      expect(collector.getCount()).assertEqual(1)
    })

    /**
     * @tc.name   testParallelComputeResult0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0200
     * @tc.desc   Verify testParallelComputeResult0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParallelComputeResult0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addValue(10)
      collector.addValue(20)
      collector.addValue(30)
      expect(collector.getSum()).assertEqual(60)
    })

    /**
     * @tc.name   testParallelComputeResult0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0300
     * @tc.desc   Verify testParallelComputeResult0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParallelComputeResult0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addValue(10)
      collector.addValue(20)
      collector.addValue(30)
      expect(collector.getAverage()).assertEqual(20)
    })

    /**
     * @tc.name   testParallelComputeResult0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0400
     * @tc.desc   Verify testParallelComputeResult0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParallelComputeResult0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addValue(5)
      collector.addValue(15)
      collector.addValue(10)
      expect(collector.getMax()).assertEqual(15)
    })

    /**
     * @tc.name   testParallelComputeResult0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0500
     * @tc.desc   Verify testParallelComputeResult0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParallelComputeResult0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addValue(5)
      collector.addValue(15)
      collector.addValue(10)
      expect(collector.getMin()).assertEqual(5)
    })

    /**
     * @tc.name   testParallelComputeResult0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0600
     * @tc.desc   Verify testParallelComputeResult0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParallelComputeResult0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tasks: taskpool.Task[] = []
      const shardSize: number = 100
      for (let i = 0; i < 4; i++) {
        const start: number = i * shardSize
        const end: number = (i + 1) * shardSize
        tasks.push(new taskpool.Task(computeShard, start, end))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addShardResult(`shard_${i}`, results[i] as number)
      }
      expect(collector.getCount()).assertEqual(4)
    })

    /**
     * @tc.name   testParallelComputeResult0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0700
     * @tc.desc   Verify testParallelComputeResult0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParallelComputeResult0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tasks: taskpool.Task[] = []
      const shardSize: number = 100
      for (let i = 0; i < 4; i++) {
        const start: number = i * shardSize
        const end: number = (i + 1) * shardSize
        tasks.push(new taskpool.Task(computeShard, start, end))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addShardResult(`shard_${i}`, results[i] as number)
      }
      const shard0: number | undefined = collector.getShardResult('shard_0')
      const shard1: number | undefined = collector.getShardResult('shard_1')
      expect(shard0 !== undefined).assertTrue()
      expect(shard1 !== undefined).assertTrue()
    })

    /**
     * @tc.name   testParallelComputeResult0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0800
     * @tc.desc   Verify testParallelComputeResult0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParallelComputeResult0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addValue(10)
      collector.addValue(20)
      collector.addValue(30)
      const values: collections.Array<number> = collector.getValues()
      expect(values.length).assertEqual(3)
      expect(values[0]).assertEqual(10)
      expect(values[1]).assertEqual(20)
      expect(values[2]).assertEqual(30)
    })

    /**
     * @tc.name   testParallelComputeResult0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_0900
     * @tc.desc   Verify testParallelComputeResult0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParallelComputeResult0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addShardResult('shard_0', 100)
      await collector.addShardResult('shard_1', 200)
      expect(collector.getShardResult('shard_0')).assertEqual(100)
      expect(collector.getShardResult('shard_1')).assertEqual(200)
    })

    /**
     * @tc.name   testParallelComputeResult1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_1000
     * @tc.desc   Verify testParallelComputeResult1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParallelComputeResult1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      const shardSize: number = 10
      for (let i = 0; i < 100; i++) {
        const start: number = i * shardSize
        const end: number = (i + 1) * shardSize
        tasks.push(new taskpool.Task(computeShard, start, end))
      }
      const batchSize: number = 50
      for (let batch = 0; batch < Math.ceil(100 / batchSize); batch++) {
        const batchTasks: taskpool.Task[] = tasks.slice(batch * batchSize, (batch + 1) * batchSize)
        const promises: Promise<Object>[] = []
        for (let i = 0; i < batchTasks.length; i++) {
          promises.push(taskpool.execute(batchTasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        for (let i = 0; i < results.length; i++) {
          const idx: number = batch * batchSize + i
          await collector.addShardResult(`shard_${idx}`, results[i] as number)
        }
      }
      expect(collector.getCount()).assertEqual(100)
    })

    /**
     * @tc.name   testParallelComputeResult1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_1100
     * @tc.desc   Verify testParallelComputeResult1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParallelComputeResult1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collector.addShardResult('shard_0', 100)
      await collector.addShardResult('shard_1', 200)
      await collector.addShardResult('shard_2', 300)
      expect(collector.getSum()).assertEqual(600)
      expect(collector.getAverage()).assertEqual(200)
    })

    /**
     * @tc.name   testParallelComputeResult1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PARALLELCOMPUTERESULT_TEST_1200
     * @tc.desc   Verify testParallelComputeResult1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParallelComputeResult1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        const start: number = i * 200
        const end: number = (i + 1) * 200
        tasks.push(new taskpool.Task(computeShard, start, end))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addShardResult(`worker_${i}`, results[i] as number)
      }
      expect(collector.getCount()).assertEqual(5)
      for (let i = 0; i < 5; i++) {
        const result: number | undefined = collector.getShardResult(`worker_${i}`)
        expect(result !== undefined).assertTrue()
      }
    })
  })
}
