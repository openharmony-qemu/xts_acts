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
class MetricReport {
  public name: string = ''
  public value: number = 0
  public timestamp: number = 0
  public metricType: string = ''
}

@Sendable
class MetricsAggregator {
  private reports_: collections.Array<MetricReport>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(reports_: collections.Array<MetricReport>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.reports_ = reports_
    this.lock_ = lock_
  }

  private reportCount_: number = 0

  async sendMetric(name: string, value: number, metricType: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const report: MetricReport = new MetricReport()
      report.name = name
      report.value = value
      report.timestamp = Date.now()
      report.metricType = metricType
      this.reports_.push(report)
      this.reportCount_++
    })
  }

  async sendMetricWithTags(name: string, value: number, metricType: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      const report: MetricReport = new MetricReport()
      report.name = name
      report.value = value
      report.timestamp = Date.now()
      report.metricType = metricType
      this.reports_.push(report)
      this.reportCount_++
    })
  }

  getReportCount(): number {
    return this.reportCount_
  }

  getReports(): collections.Array<MetricReport> {
    return this.reports_
  }

  async clearReports(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      while (this.reports_.length > 0) { this.reports_.pop() }
      this.reportCount_ = 0
    })
  }

  getMetricType(index: number): string {
    if (index < this.reports_.length) {
      return this.reports_[index].metricType
    }
    return ''
  }
}

@Sendable
class Histogram {
  public boundaries_: collections.Array<number>

  public buckets_: collections.Map<number, number>

  public observations_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(boundaries: number[], boundaries_: collections.Array<number>, buckets_: collections.Map<number, number>, observations_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.boundaries_ = boundaries_
    this.buckets_ = buckets_
    this.observations_ = observations_
    this.lock_ = lock_

    for (let i = 0; i < boundaries.length; i++) {
      this.boundaries_.push(boundaries[i])
      this.buckets_.set(boundaries[i], 0)
    }
  }

  observe(value: number): void {
    this.observations_.push(value)
    for (let i = 0; i < this.boundaries_.length; i++) {
      if (value <= this.boundaries_[i]) {
        const currentCount: number = this.buckets_.get(this.boundaries_[i]) ?? 0
        this.buckets_.set(this.boundaries_[i], currentCount + 1)
      }
    }
  }

  getBucketCount(): number {
    return this.buckets_.size
  }

  getBucketValue(boundary: number): number {
    return this.buckets_.get(boundary) ?? 0
  }
}

@Sendable
class HistogramManager {
  public histograms_: collections.Map<string, Histogram>

  public lock_: ArkTSUtils.locks.AsyncLock

  public emptyBoundariesPool_: collections.Array<collections.Array<number>>

  public emptyBucketsPool_: collections.Array<collections.Map<number, number>>

  public emptyObservationsPool_: collections.Array<collections.Array<number>>

  constructor(histograms_: collections.Map<string, Histogram>, lock_: ArkTSUtils.locks.AsyncLock, emptyBoundariesPool_: collections.Array<collections.Array<number>>, emptyBucketsPool_: collections.Array<collections.Map<number, number>>, emptyObservationsPool_: collections.Array<collections.Array<number>>) {
    this.histograms_ = histograms_
    this.lock_ = lock_
    this.emptyBoundariesPool_ = emptyBoundariesPool_
    this.emptyBucketsPool_ = emptyBucketsPool_
    this.emptyObservationsPool_ = emptyObservationsPool_
  }


  async createHistogram(name: string, boundaries: number[]): Promise<Histogram> {
    return await this.lock_.lockAsync((): Histogram => {
      if (!this.histograms_.has(name)) {
        const histogram: Histogram = new Histogram(boundaries, this.emptyBoundariesPool_.pop()!, this.emptyBucketsPool_.pop()!, this.emptyObservationsPool_.pop()!, this.lock_)
        this.histograms_.set(name, histogram)
      }
      return this.histograms_.get(name)!
    })
  }
}

@Concurrent
async function sendMetricTask(aggregator: MetricsAggregator, name: string, value: number, metricType: string): Promise<void> {
  await aggregator.sendMetric(name, value, metricType)
}

function executeTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function MetricsAggregationTest(): void {
  describe('MetricsAggregationTest', (): void => {
    let aggregator: MetricsAggregator = new MetricsAggregator(new collections.Array<MetricReport>(), new ArkTSUtils.locks.AsyncLock())
    const emptyBoundariesPool: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>()
    const emptyBucketsPool: collections.Array<collections.Map<number, number>> = new collections.Array<collections.Map<number, number>>()
    const emptyObservationsPool: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>()
    for (let i = 0; i < 20; i++) {
      emptyBoundariesPool.push(new collections.Array<number>())
      emptyBucketsPool.push(new collections.Map<number, number>())
      emptyObservationsPool.push(new collections.Array<number>())
    }
    const histogramManager: HistogramManager = new HistogramManager(new collections.Map<string, Histogram>(), new ArkTSUtils.locks.AsyncLock(), emptyBoundariesPool, emptyBucketsPool, emptyObservationsPool)

    beforeEach(async (): Promise<void> => {
      aggregator = new MetricsAggregator(new collections.Array<MetricReport>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testMetricsAggregation0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0100
     * @tc.desc   Verify basic metric sending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsAggregation0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await aggregator.sendMetric('cpu_usage', 85.5, 'gauge')
      expect(aggregator.getReportCount()).assertEqual(1)

      const reports: collections.Array<MetricReport> = aggregator.getReports()
      expect(reports[0].name).assertEqual('cpu_usage')
      expect(reports[0].value).assertEqual(85.5)
    })

    /**
     * @tc.name   testMetricsAggregation0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0200
     * @tc.desc   Verify metric sending with tags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsAggregation0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await aggregator.sendMetricWithTags('request_count', 100, 'counter')
      expect(aggregator.getReportCount()).assertEqual(1)

      const reports: collections.Array<MetricReport> = aggregator.getReports()
      expect(reports[0].metricType).assertEqual('counter')
    })

    /**
     * @tc.name   testMetricsAggregation0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0300
     * @tc.desc   Verify multi-metric sending with Promise.all waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsAggregation0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      tasks.push(new taskpool.Task(sendMetricTask, aggregator, 'metric_a', 10, 'counter'))
      tasks.push(new taskpool.Task(sendMetricTask, aggregator, 'metric_b', 20, 'gauge'))
      tasks.push(new taskpool.Task(sendMetricTask, aggregator, 'metric_c', 30, 'histogram'))

      await executeTasks(tasks)
      expect(aggregator.getReportCount()).assertEqual(3)
    })

    /**
     * @tc.name   testMetricsAggregation0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0400
     * @tc.desc   Verify metric timestamp contains key info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsAggregation0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const beforeTime: number = Date.now()
      await aggregator.sendMetric('latency', 50, 'histogram')
      const afterTime: number = Date.now()

      const reports: collections.Array<MetricReport> = aggregator.getReports()
      expect(reports[0].timestamp >= beforeTime).assertTrue()
      expect(reports[0].timestamp <= afterTime).assertTrue()
    })

    /**
     * @tc.name   testMetricsAggregation0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0500
     * @tc.desc   Verify metric type assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsAggregation0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await aggregator.sendMetric('req_rate', 99.9, 'gauge')
      expect(aggregator.getMetricType(0)).assertEqual('gauge')
    })

    /**
     * @tc.name   testMetricsAggregation0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0600
     * @tc.desc   Verify concurrent metric sending with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsAggregation0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(sendMetricTask, aggregator, `metric_${i}`, i * 10, 'counter'))
      }
      await executeTasks(tasks)
      expect(aggregator.getReportCount()).assertEqual(5)
    })

    /**
     * @tc.name   testMetricsAggregation0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0700
     * @tc.desc   Verify small concurrency 3 metric reports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsAggregation0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(sendMetricTask, aggregator, `r3_${i}`, i, 'counter'))
      }
      await executeTasks(tasks)
      expect(aggregator.getReportCount()).assertEqual(3)
    })

    /**
     * @tc.name   testMetricsAggregation0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0800
     * @tc.desc   Verify small concurrency 5 metric reports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsAggregation0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(sendMetricTask, aggregator, `r5_${i}`, i, 'gauge'))
      }
      await executeTasks(tasks)
      expect(aggregator.getReportCount()).assertEqual(5)
    })

    /**
     * @tc.name   testMetricsAggregation0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_0900
     * @tc.desc   Verify small concurrency 10 metric reports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsAggregation0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(sendMetricTask, aggregator, `r10_${i}`, i, 'histogram'))
      }
      await executeTasks(tasks)
      expect(aggregator.getReportCount()).assertEqual(10)
    })

    /**
     * @tc.name   testMetricsAggregation1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_1000
     * @tc.desc   Verify metric report queue with collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMetricsAggregation1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await aggregator.sendMetric('m1', 1, 'counter')
      await aggregator.sendMetric('m2', 2, 'gauge')
      await aggregator.sendMetric('m3', 3, 'histogram')

      const reports: collections.Array<MetricReport> = aggregator.getReports()
      expect(reports.length).assertEqual(3)
      expect(reports[0].name).assertEqual('m1')
      expect(reports[1].name).assertEqual('m2')
      expect(reports[2].name).assertEqual('m3')
    })

    /**
     * @tc.name   testMetricsAggregation1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_1100
     * @tc.desc   Verify clear reports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsAggregation1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await aggregator.sendMetric('temp', 1, 'counter')
      expect(aggregator.getReportCount()).assertEqual(1)

      await aggregator.clearReports()
      expect(aggregator.getReportCount()).assertEqual(0)
      expect(aggregator.getReports().length).assertEqual(0)
    })

    /**
     * @tc.name   testMetricsAggregation1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_1200
     * @tc.desc   Verify Histogram multi-bucket boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsAggregation1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const boundaries: number[] = [1, 5, 10, 50, 100, 500]
      const histogram: Histogram = await histogramManager.createHistogram('multi_bucket', boundaries)

      expect(histogram.getBucketCount()).assertEqual(6)
      histogram.observe(3)
      histogram.observe(25)
      histogram.observe(200)

      expect(histogram.getBucketValue(5)).assertEqual(1)
      expect(histogram.getBucketValue(50)).assertEqual(2)
      expect(histogram.getBucketValue(500)).assertEqual(3)
    })

    /**
     * @tc.name   testMetricsAggregation1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_METRICS_AGGREGATION_TEST_1300
     * @tc.desc   Verify clear reports queue with getReports length check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMetricsAggregation1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await aggregator.sendMetric('clear_test', 100, 'counter')
      await aggregator.sendMetric('clear_test2', 200, 'gauge')

      await aggregator.clearReports()
      expect(aggregator.getReportCount()).assertEqual(0)
      expect(aggregator.getReports().length).assertEqual(0)
    })
  })
}
