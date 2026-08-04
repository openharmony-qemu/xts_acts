/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';

@Concurrent
function timeConsumingTask(n: number): number {
  let sum: number = 0
  for (let i: number = 0; i < n; i++) {
    sum += i * i
  }
  return sum
}

@Concurrent
function cpuIntensiveCalculation(data: number[]): number {
  let result: number = 0
  for (let i: number = 0; i < data.length; i++) {
    result += Math.sqrt(data[i]) * Math.sin(data[i])
  }
  return result
}

@Concurrent
function parallelSumTask(data: number[]): number {
  let sum: number = 0
  for (let i: number = 0; i < data.length; i++) {
    sum += data[i]
  }
  return sum
}

export default function MultithreadDevelopTest(): void {
  describe('MultithreadDevelopTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   MultithreadDevelopTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREAD_DEVELOP_TEST_0100
     * @tc.desc   Verify TaskPool handles time-consuming computation tasks correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MultithreadDevelopTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(timeConsumingTask, 100000)
      let result = await taskpool.execute(task)
      expect(result as number > 0).assertTrue()
    })

    /**
     * @tc.name   MultithreadDevelopTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREAD_DEVELOP_TEST_0200
     * @tc.desc   Verify TaskPool handles CPU-intensive tasks with data chunking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MultithreadDevelopTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: number[] = []
      for (let i: number = 1; i <= 10000; i++) {
        data.push(i)
      }
      let promises: Promise<Object>[] = []
      let chunkSize: number = 2500
      for (let i: number = 0; i < 4; i++) {
        let chunk: number[] = data.slice(i * chunkSize, (i + 1) * chunkSize)
        promises.push(taskpool.execute(new taskpool.Task(cpuIntensiveCalculation, chunk)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(4)
      for (let i: number = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('number')
      }
    })

    /**
     * @tc.name   MultithreadDevelopTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MULTITHREAD_DEVELOP_TEST_0300
     * @tc.desc   Verify parallel computation correctness by comparing sequential and parallel results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MultithreadDevelopTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: number[] = []
      for (let i: number = 1; i <= 1000; i++) {
        data.push(i)
      }

      let sequentialSum: number = 0
      for (let i: number = 0; i < data.length; i++) {
        sequentialSum += data[i]
      }

      let half: number = Math.floor(data.length / 2)
      let chunk1: number[] = data.slice(0, half)
      let chunk2: number[] = data.slice(half)
      let p1: Promise<Object> = taskpool.execute(new taskpool.Task(parallelSumTask, chunk1))
      let p2: Promise<Object> = taskpool.execute(new taskpool.Task(parallelSumTask, chunk2))
      let results: Object[] = await Promise.all([p1, p2])
      let parallelSum: number = (results[0] as number) + (results[1] as number)
      expect(parallelSum).assertEqual(sequentialSum)
    })
  })
}
