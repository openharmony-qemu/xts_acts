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
import { collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class IRCounter {
  public count_: number = 0
  public threshold_: number = 100
  public status_: number = 0
  public version_: number = 1
  public metrics_: collections.Map<string, number>

  constructor(metrics_: collections.Map<string, number>) {
    this.metrics_ = metrics_
  }


  getCount(): number {
    return this.count_
  }

  increment(): number {
    this.count_++
    return this.count_
  }

  getIRProperties(): number[] {
    return [this.count_, this.threshold_, this.status_, this.version_]
  }

  addMetric(key: string, value: number): void {
    this.metrics_.set(key, value)
  }

  getMetric(key: string): number | undefined {
    return this.metrics_.get(key)
  }

  getMetricCount(): number {
    return this.metrics_.size
  }
}

@Concurrent
function readIRCount(c: IRCounter): number {
  return c.count_
}

@Concurrent
function incrementIRCount(c: IRCounter): number {
  c.count_++
  return c.count_
}

export default function BuiltinsSharedCounterIRTest(): void {
  describe('BuiltinsSharedCounterIRTest', (): void => {
    let counter: IRCounter

    beforeEach((): void => {
      counter = new IRCounter(new collections.Map<string, number>())
    })
    it('testSharedCounterIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      counter.count_ = 10
      counter.threshold_ = 50
      counter.status_ = 1
      const props: number[] = counter.getIRProperties()
      expect(props[0]).assertEqual(10)
      expect(props[1]).assertEqual(50)
      expect(props[2]).assertEqual(1)
    })

    it('testSharedCounterIR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      for (let i = 0; i < 100; i++) {
        counter.increment()
      }
      expect(counter.getCount()).assertEqual(100)
    })

    it('testSharedCounterIR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter1: IRCounter = new IRCounter(new collections.Map<string, number>())
      const counter2: IRCounter = new IRCounter(new collections.Map<string, number>())
      counter1.increment()
      counter2.increment()
      expect(counter1.getCount()).assertEqual(1)
      expect(counter2.getCount()).assertEqual(1)
    })

    it('testSharedCounterIR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.count_ = 100
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readIRCount, counter))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertLargerOrEqual(0)
      }
    })

    it('testSharedCounterIR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 1025; i++) {
        counter.addMetric(`metric_${i}`, i)
      }
      expect(counter.getMetricCount()).assertEqual(1025)
      expect(counter.getMetric('metric_0')).assertEqual(0)
      expect(counter.getMetric('metric_1024')).assertEqual(1024)
    })

    it('testSharedCounterIR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.count_ = 50
      for (let i = 0; i < 1025; i++) {
        counter.addMetric(`m_${i}`, i)
      }
      expect(counter.getCount()).assertEqual(50)
      expect(counter.getMetric('m_1024')).assertEqual(1024)
    })

    it('testSharedCounterIR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      counter.increment()
      expect(counter.getCount()).assertEqual(1)
      counter.count_ = 999
      expect(counter.getCount()).assertEqual(999)
    })

    it('testSharedCounterIR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(incrementIRCount, counter))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(counter.getCount()).assertLargerOrEqual(1)
    })

    it('testSharedCounterIR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = Date.now()
      for (let i = 0; i < 1000; i++) {
        counter.increment()
      }
      const end: number = Date.now()
      expect(counter.getCount()).assertEqual(1000)
      expect(end - start).assertLargerOrEqual(0)
    })

    it('testSharedCounterIR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const props: number[] = counter.getIRProperties()
      expect(props.length).assertEqual(4)
      for (let i = 0; i < 4; i++) {
        expect(props[i]).assertLargerOrEqual(0)
      }
    })

    it('testSharedCounterIR1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 1025; i++) {
        counter.addMetric(`perf_${i}`, i)
      }
      const samples: number[] = [0, 512, 1024]
      for (let idx = 0; idx < samples.length; idx++) {
        expect(counter.getMetric(`perf_${samples[idx]}`)).assertEqual(samples[idx])
      }
    })

    it('testSharedCounterIR1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      counter.count_ = 1000
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 1000; i++) {
        tasks.push(new taskpool.Task(readIRCount, counter))
      }
      const batchSize: number = 100
      for (let batch = 0; batch < 10; batch++) {
        const batchTasks: taskpool.Task[] = tasks.slice(batch * batchSize, (batch + 1) * batchSize)
        const promises: Promise<Object>[] = []
        for (let i = 0; i < batchTasks.length; i++) {
          promises.push(taskpool.execute(batchTasks[i]))
        }
        await Promise.all(promises)
      }
      expect(counter.getCount()).assertLargerOrEqual(1)
    })
  })
}
