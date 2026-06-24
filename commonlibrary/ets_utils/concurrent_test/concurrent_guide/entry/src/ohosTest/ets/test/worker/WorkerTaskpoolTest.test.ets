/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { worker, ErrorEvent, MessageEvents } from '@kit.ArkTS';

export default function WorkerTaskpoolTest(): void {
  describe('WorkerTaskpoolTest', (): void => {
    let currentWorker: worker.ThreadWorker | null = null

    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      if (currentWorker !== null) {
        currentWorker.terminate()
        currentWorker = null
      }
    })
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   WorkerTaskpoolTest0100
     * @tc.number SUB_WORKER_TASKPOOL_TEST_0100
     * @tc.desc   Verify Worker creates TaskPool task and returns computed result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerTaskpoolTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskpoolWorker.ets')
      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'compute_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'taskpool_compute', value: 10 })
      })
      expect(result).assertEqual(100)
    })

    /**
     * @tc.name   WorkerTaskpoolTest0200
     * @tc.number SUB_WORKER_TASKPOOL_TEST_0200
     * @tc.desc   Verify Worker waits for TaskPool async result using await pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerTaskpoolTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskpoolWorker.ets')
      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'compute_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'taskpool_compute', value: 25 })
      })
      expect(result).assertEqual(625)
    })

    /**
     * @tc.name   WorkerTaskpoolTest0300
     * @tc.number SUB_WORKER_TASKPOOL_TEST_0300
     * @tc.desc   Verify Worker propagates TaskPool result back to host thread via postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerTaskpoolTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskpoolWorker.ets')
      let resultType: string = ''
      let resultValue: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          resultType = data['type'] as string
          if (resultType === 'compute_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'taskpool_compute', value: 7 })
      })
      expect(resultType).assertEqual('compute_result')
      expect(resultValue).assertEqual(49)
    })

    /**
     * @tc.name   WorkerTaskpoolTest0400
     * @tc.number SUB_WORKER_TASKPOOL_TEST_0400
     * @tc.desc   Verify Worker creates multiple concurrent TaskPool tasks and returns all results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerTaskpoolTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/MultiTaskpoolWorker.ets')
      let results: number[] = []
      let taskCount: number = 5
      await new Promise<void>((resolve: () => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'result') {
            results.push(data['value'] as number)
          } else if ((data['type'] as string) === 'all_done') {
            resolve()
          }
        }
        currentWorker!.postMessage({ type: 'create_multiple', count: taskCount })
      })
      expect(results.length).assertEqual(taskCount)
      for (let i: number = 0; i < taskCount; i++) {
        let expected: number = i * 10
        let found: boolean = false
        for (let j: number = 0; j < results.length; j++) {
          if (results[j] === expected) {
            found = true
            break
          }
        }
        expect(found).assertTrue()
      }
    })

    /**
     * @tc.name   WorkerTaskpoolTest0500
     * @tc.number SUB_WORKER_TASKPOOL_TEST_0500
     * @tc.desc   Verify Worker handles large computation TaskPool task correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerTaskpoolTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskpoolWorker.ets')
      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'compute_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'taskpool_large', n: 100000 })
      })
      expect(result).assertEqual(4999950000)
    })

    /**
     * @tc.name   WorkerTaskpoolTest0600
     * @tc.number SUB_WORKER_TASKPOOL_TEST_0600
     * @tc.desc   Verify Worker and TaskPool thread execute concurrently without blocking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerTaskpoolTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskpoolWorker.ets')
      let result1: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'compute_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'taskpool_compute', value: 3 })
      })
      expect(result1).assertEqual(9)
      let result2: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'compute_result') {
            resolve(data['value'] as number)
          }
        }
        currentWorker!.postMessage({ type: 'taskpool_compute', value: 12 })
      })
      expect(result2).assertEqual(144)
    })

    /**
     * @tc.name   WorkerTaskpoolTest0700
     * @tc.number SUB_WORKER_TASKPOOL_TEST_0700
     * @tc.desc   Verify multiple Workers each create TaskPool tasks independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WorkerTaskpoolTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskpoolWorker.ets')
      let worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskpoolWorker.ets')
      let results: number[] = []
      await new Promise<void>((resolve: () => void) => {
        let count: number = 0
        worker1.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'compute_result') {
            results.push(data['value'] as number)
            count++
            if (count >= 2) {
              resolve()
            }
          }
        }
        worker2.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'compute_result') {
            results.push(data['value'] as number)
            count++
            if (count >= 2) {
              resolve()
            }
          }
        }
        worker1.postMessage({ type: 'taskpool_compute', value: 5 })
        worker2.postMessage({ type: 'taskpool_compute', value: 8 })
      })
      expect(results.length).assertEqual(2)
      let has25: boolean = false
      let has64: boolean = false
      for (let i: number = 0; i < results.length; i++) {
        if (results[i] === 25) {
          has25 = true
        }
        if (results[i] === 64) {
          has64 = true
        }
      }
      expect(has25).assertTrue()
      expect(has64).assertTrue()
      let exit1: Promise<void> = new Promise<void>((resolve: Function) => {
        worker1.onexit = (code: number): void => { resolve() }
      })
      let exit2: Promise<void> = new Promise<void>((resolve: Function) => {
        worker2.onexit = (code: number): void => { resolve() }
      })
      worker1.terminate()
      worker2.terminate()
      await Promise.all([exit1, exit2])
    })

    /**
     * @tc.name   WorkerTaskpoolTest0800
     * @tc.number SUB_WORKER_TASKPOOL_TEST_0800
     * @tc.desc   Verify Worker handles TaskPool task execution failure gracefully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('WorkerTaskpoolTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/TaskpoolWorker.ets')
      let errorMsg: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let data = e.data as Record<string, Object>
          if ((data['type'] as string) === 'compute_error') {
            resolve(data['message'] as string)
          }
        }
        currentWorker!.postMessage({ type: 'taskpool_fail' })
      })
      expect(errorMsg.length > 0).assertTrue()
    })
  })
}
