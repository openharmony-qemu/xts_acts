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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class IRResultCollector {
  public total_: number = 0
  public completed_: number = 0
  public failed_: number = 0
  public startTime_: number = 0
  public results_: collections.Map<number, string>

  constructor(results_: collections.Map<number, string>) {
    this.results_ = results_
  }

  public count_: number = 0

  getIRStats(): number[] {
    return [this.total_, this.completed_, this.failed_, this.startTime_]
  }
}

@Sendable
class LargeResultCollector {
  public results_: collections.Map<number, string>

  constructor(results_: collections.Map<number, string>) {
    this.results_ = results_
  }

}

@Sendable
class IRConsistentCollector {
  public results_: collections.Map<number, number>

  public count_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(results_: collections.Map<number, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.results_ = results_
    this.lock_ = lock_
  }


  async addResult(id: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.results_.set(id, id)
      this.count_++
    })
  }
}

@Sendable
class StatsCollector {
  public successCount_: number = 0
  public failCount_: number = 0

  incrementSuccess(): number {
    this.successCount_++
    return this.successCount_
  }

  getSuccessCount(): number {
    return this.successCount_
  }
}

@Sendable
class ArrayResultCollector {
  public results_: collections.Array<number>

  constructor(results_: collections.Array<number>) {
    this.results_ = results_
  }

}

@Sendable
class SharedResultCollector {
  public total_: number = 0
  public completed_: number = 0
}

@Sendable
class StableResultCollector {
  public results_: collections.Map<number, number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(results_: collections.Map<number, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.results_ = results_
    this.lock_ = lock_
  }


  async addResult(id: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.results_.set(id, id)
    })
  }
}

@Sendable
class BoundaryCollector {
  public results_: collections.Map<string, number>

  constructor(results_: collections.Map<string, number>) {
    this.results_ = results_
  }

}

@Sendable
class CrossThreadCollector {
  public total_: number = 100
  public completed_: number = 0
}

@Concurrent
function readTotalFromCollector(c: CrossThreadCollector): number {
  return c.total_
}

@Sendable
class TimestampCollector {
  public startTime_: number = Date.now()
  public endTime_: number = 0

  getStartTime(): number {
    return this.startTime_
  }
}

@Concurrent
function computeResult(id: number): number {
  return id
}

export default function BuiltinsResultCollectIRTest(): void {
  describe('BuiltinsResultCollectIRTest', (): void => {
    /**
     * @tc.name   testResultCollectIR0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0100
     * @tc.desc   Verify testResultCollectIR0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResultCollectIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const collector: IRResultCollector = new IRResultCollector(new collections.Map<number, string>())
      collector.total_ = 100
      const stats: number[] = collector.getIRStats()
      expect(stats[0]).assertEqual(100)
    })

    /**
     * @tc.name   testResultCollectIR0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0200
     * @tc.desc   Verify testResultCollectIR0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResultCollectIR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const collector: LargeResultCollector = new LargeResultCollector(new collections.Map<number, string>())
      for (let i = 0; i < 1025; i++) {
        collector.results_.set(i, `result_${i}`)
      }
      expect(collector.results_.size).assertEqual(1025)
    })

    /**
     * @tc.name   testResultCollectIR0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0300
     * @tc.desc   Verify testResultCollectIR0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResultCollectIR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const collector: IRConsistentCollector = new IRConsistentCollector(new collections.Map<number, number>(), new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(computeResult, i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addResult(results[i] as number)
      }
      expect(collector.count_).assertEqual(100)
    })

    /**
     * @tc.name   testResultCollectIR0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0400
     * @tc.desc   Verify testResultCollectIR0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResultCollectIR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const collector: StatsCollector = new StatsCollector()
      for (let i = 0; i < 50; i++) {
        collector.incrementSuccess()
      }
      expect(collector.getSuccessCount()).assertEqual(50)
    })

    /**
     * @tc.name   testResultCollectIR0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0500
     * @tc.desc   Verify testResultCollectIR0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResultCollectIR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const collector: ArrayResultCollector = new ArrayResultCollector(new collections.Array<number>())
      for (let i = 0; i < 100; i++) {
        collector.results_.push(i)
      }
      expect(collector.results_.length).assertEqual(100)
    })

    /**
     * @tc.name   testResultCollectIR0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0600
     * @tc.desc   Verify testResultCollectIR0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResultCollectIR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const collector1: SharedResultCollector = new SharedResultCollector()
      const collector2: SharedResultCollector = new SharedResultCollector()
      expect(collector1.total_).assertEqual(0)
      expect(collector2.total_).assertEqual(0)
      expect(collector1.total_).assertEqual(collector2.total_)
    })

    /**
     * @tc.name   testResultCollectIR0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0700
     * @tc.desc   Verify testResultCollectIR0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResultCollectIR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const collector: StableResultCollector = new StableResultCollector(new collections.Map<number, number>(), new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 256; i++) {
        tasks.push(new taskpool.Task(computeResult, i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.addResult(results[i] as number)
      }
      expect(collector.results_.size).assertEqual(256)
    })

    /**
     * @tc.name   testResultCollectIR0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0800
     * @tc.desc   Verify testResultCollectIR0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResultCollectIR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const collector: BoundaryCollector = new BoundaryCollector(new collections.Map<string, number>())
      for (let i = 0; i < 1024; i++) {
        collector.results_.set(`result_${i}`, i)
      }
      expect(collector.results_.size).assertEqual(1024)
    })

    /**
     * @tc.name   testResultCollectIR0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_0900
     * @tc.desc   Verify testResultCollectIR0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResultCollectIR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const collector: BoundaryCollector = new BoundaryCollector(new collections.Map<string, number>())
      for (let i = 0; i < 1025; i++) {
        collector.results_.set(`result_${i}`, i)
      }
      expect(collector.results_.size).assertEqual(1025)
      expect(collector.results_.get('result_0')).assertEqual(0)
      expect(collector.results_.get('result_1024')).assertEqual(1024)
    })

    /**
     * @tc.name   testResultCollectIR1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_1000
     * @tc.desc   Verify testResultCollectIR1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResultCollectIR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const collector: CrossThreadCollector = new CrossThreadCollector()
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readTotalFromCollector, collector))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(100)
      }
    })

    /**
     * @tc.name   testResultCollectIR1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RESULTCOLLECTIR_TEST_1100
     * @tc.desc   Verify testResultCollectIR1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResultCollectIR1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const collector: TimestampCollector = new TimestampCollector()
      const start: number = collector.getStartTime()
      expect(start > 0).assertTrue()
    })
  })
}
