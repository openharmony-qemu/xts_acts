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
class MetricsData {
  public name: string = ''
  public value: number = 0
  public timestamp: number = 0
  public tagKeys_: collections.Array<string>
  public tagValues_: collections.Array<string>

  constructor(tagKeys_: collections.Array<string>, tagValues_: collections.Array<string>) {
    this.tagKeys_ = tagKeys_
    this.tagValues_ = tagValues_
  }

  setTag(key: string, value: string): void {
    for (let i = 0; i < this.tagKeys_.length; i++) {
      if (this.tagKeys_[i] === key) {
        this.tagValues_[i] = value
        return
      }
    }
    this.tagKeys_.push(key)
    this.tagValues_.push(value)
  }

  getTag(key: string): string | undefined {
    for (let i = 0; i < this.tagKeys_.length; i++) {
      if (this.tagKeys_[i] === key) {
        return this.tagValues_[i]
      }
    }
    return undefined
  }
}

@Sendable
class MetricsCollector {
  public metrics_: collections.Map<string, MetricsData>

  public lock_: ArkTSUtils.locks.AsyncLock

  public emptyTagKeysPool_: collections.Array<collections.Array<string>>

  public emptyTagValuesPool_: collections.Array<collections.Array<string>>

  constructor(metrics_: collections.Map<string, MetricsData>, lock_: ArkTSUtils.locks.AsyncLock, emptyTagKeysPool_: collections.Array<collections.Array<string>>, emptyTagValuesPool_: collections.Array<collections.Array<string>>) {
    this.metrics_ = metrics_
    this.lock_ = lock_
    this.emptyTagKeysPool_ = emptyTagKeysPool_
    this.emptyTagValuesPool_ = emptyTagValuesPool_
  }

  public recordCount_: number = 0

  async record(name: string, value: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const data: MetricsData = new MetricsData(this.emptyTagKeysPool_.pop()!, this.emptyTagValuesPool_.pop()!)
      data.name = name
      data.value = value
      data.timestamp = Date.now()
      this.metrics_.set(name, data)
      this.recordCount_++
    })
  }

  async increment(name: string, delta: number): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const existing: MetricsData | undefined = this.metrics_.get(name)
      if (existing !== undefined) {
        existing.value += delta
        existing.timestamp = Date.now()
        this.recordCount_++
        return existing.value
      }
      const data: MetricsData = new MetricsData(this.emptyTagKeysPool_.pop()!, this.emptyTagValuesPool_.pop()!)
      data.name = name
      data.value = delta
      data.timestamp = Date.now()
      this.metrics_.set(name, data)
      this.recordCount_++
      return delta
    })
  }

  getMetric(name: string): MetricsData | undefined {
    return this.metrics_.get(name)
  }

  getRecordCount(): number {
    return this.recordCount_
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.metrics_.clear()
      this.recordCount_ = 0
    })
  }

  getAllMetrics(): collections.Map<string, MetricsData> {
    return this.metrics_
  }
}

@Concurrent
async function recordMetricTask(collector: MetricsCollector, name: string, value: number): Promise<void> {
  await collector.record(name, value)
}

@Concurrent
async function incrementMetricTask(collector: MetricsCollector, name: string, delta: number): Promise<void> {
  await collector.increment(name, delta)
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function MetricsCollectorTest(): void {
  describe('MetricsCollectorTest', (): void => {
    const emptyTagKeysPool: collections.Array<collections.Array<string>> = new collections.Array<collections.Array<string>>()
    const emptyTagValuesPool: collections.Array<collections.Array<string>> = new collections.Array<collections.Array<string>>()
    for (let i = 0; i < 50; i++) {
      emptyTagKeysPool.push(new collections.Array<string>())
      emptyTagValuesPool.push(new collections.Array<string>())
    }
    const collector: MetricsCollector = new MetricsCollector(new collections.Map<string, MetricsData>(), new ArkTSUtils.locks.AsyncLock(), emptyTagKeysPool, emptyTagValuesPool)

    beforeEach(async (): Promise<void> => {
      await collector.reset()
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testMetricsCollector0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0100
     * @tc.desc   Verify testMetricsCollector0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsCollector0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await collector.record('cpu_usage', 75)
        const metric: MetricsData | undefined = collector.getMetric('cpu_usage')

        expect(metric !== undefined).assertTrue()
        expect(metric!.value).assertEqual(75)
        expect(metric!.name).assertEqual('cpu_usage')
      } catch (error) {
        console.error("testMetricsCollector0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0200
     * @tc.desc   Verify testMetricsCollector0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsCollector0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await collector.record('request_count', 10)
        const result: number = await collector.increment('request_count', 5)

        expect(result).assertEqual(15)
        expect(collector.getMetric('request_count')!.value).assertEqual(15)
      } catch (error) {
        console.error("testMetricsCollector0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0300
     * @tc.desc   Verify testMetricsCollector0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMetricsCollector0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const result: number = await collector.increment('new_metric', 100)

        expect(result).assertEqual(100)
        expect(collector.getMetric('new_metric')!.value).assertEqual(100)
      } catch (error) {
        console.error("testMetricsCollector0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0400
     * @tc.desc   Verify testMetricsCollector0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsCollector0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const metricNames: string[] = ['metricA', 'metricB', 'metricC']
        const tasks: taskpool.Task[] = metricNames.map((name: string): taskpool.Task =>
          new taskpool.Task(recordMetricTask, collector, name, 50)
        )
        await executeTasksGetObjects(tasks)

        expect(collector.getRecordCount()).assertEqual(3)
        expect(collector.getMetric('metricA')!.value).assertEqual(50)
      } catch (error) {
        console.error("testMetricsCollector0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0500
     * @tc.desc   Verify testMetricsCollector0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsCollector0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await collector.record('counter', 0)

        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(incrementMetricTask, collector, 'counter', 1))
        }
        const results: Object[] = await executeTasksGetObjects(tasks)

        expect(collector.getMetric('counter')!.value).assertEqual(10)
      } catch (error) {
        console.error("testMetricsCollector0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0600
     * @tc.desc   Verify testMetricsCollector0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsCollector0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const beforeTime: number = Date.now()
        await collector.record('time_metric', 42)
        const afterTime: number = Date.now()

        const metric: MetricsData | undefined = collector.getMetric('time_metric')
        expect(metric!.timestamp >= beforeTime).assertTrue()
        expect(metric!.timestamp <= afterTime).assertTrue()
      } catch (error) {
        console.error("testMetricsCollector0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0700
     * @tc.desc   Verify testMetricsCollector0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsCollector0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await collector.record('tagged_metric', 88)

        const metric: MetricsData | undefined = collector.getMetric('tagged_metric')
        await collector.lock_.lockAsync((): void => {
          metric!.setTag('env', 'production')
          metric!.setTag('region', 'us-east')
        })

        expect(metric!.getTag('env')).assertEqual('production')
        expect(metric!.getTag('region')).assertEqual('us-east')
      } catch (error) {
        console.error("testMetricsCollector0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0800
     * @tc.desc   Verify testMetricsCollector0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsCollector0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await collector.record('temp_metric', 100)
        await collector.record('temp_metric2', 200)

        await collector.reset()

        expect(collector.getMetric('temp_metric') === undefined).assertTrue()
        expect(collector.getMetric('temp_metric2') === undefined).assertTrue()
        expect(collector.getRecordCount()).assertEqual(0)
      } catch (error) {
        console.error("testMetricsCollector0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_0900
     * @tc.desc   Verify testMetricsCollector0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsCollector0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 3; i++) {
          tasks.push(new taskpool.Task(recordMetricTask, collector, `metric_${i}`, i * 10))
        }
        await executeTasksGetObjects(tasks)

        expect(collector.getRecordCount()).assertEqual(3)
      } catch (error) {
        console.error("testMetricsCollector0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_1000
     * @tc.desc   Verify testMetricsCollector1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsCollector1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(recordMetricTask, collector, `metric_${i}`, i * 10))
        }
        await executeTasksGetObjects(tasks)

        expect(collector.getRecordCount()).assertEqual(5)
      } catch (error) {
        console.error("testMetricsCollector1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_1100
     * @tc.desc   Verify testMetricsCollector1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsCollector1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(recordMetricTask, collector, `metric_${i}`, i * 10))
        }
        await executeTasksGetObjects(tasks)

        expect(collector.getRecordCount()).assertEqual(10)
      } catch (error) {
        console.error("testMetricsCollector1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_1200
     * @tc.desc   Verify testMetricsCollector1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMetricsCollector1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await collector.record('overwrite_metric', 10)
        await collector.record('overwrite_metric', 20)

        expect(collector.getMetric('overwrite_metric')!.value).assertEqual(20)
      } catch (error) {
        console.error("testMetricsCollector1200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testMetricsCollector1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICSCOLLECTOR_TEST_1300
     * @tc.desc   Verify testMetricsCollector1300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsCollector1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await collector.record('metric1', 1)
        await collector.record('metric2', 2)
        await collector.increment('metric1', 3)

        expect(collector.getRecordCount()).assertEqual(3)
      } catch (error) {
        console.error("testMetricsCollector1300 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
