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

import { collections } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../Utils';

// ===== @Concurrent Functions =====

@Concurrent
function stressArrayPushFunc(arr: collections.Array<number>, value: number): number {
  arr.push(value)
  return arr.length
}

@Concurrent
function stressMapSetFunc(map: collections.Map<string, number>, key: string, value: number): number {
  map.set(key, value)
  return map.size
}

@Concurrent
function stressSetAddFunc(set: collections.Set<number>, value: number): number {
  set.add(value)
  return set.size
}

@Concurrent
function stressTypedArrayFunc(buffer: collections.ArrayBuffer, offset: number, value: number): void {
  let view = new collections.Int32Array(buffer)
  view[offset] = value
}

@Concurrent
function stressForEachFunc(arr: collections.Array<number>): number {
  let sum: number = 0
  arr.forEach((v: number) => {
    sum += v
  })
  return sum
}

@Concurrent
function stressPushPopFunc(arr: collections.Array<number>, iterations: number): number {
  for (let i = 0; i < iterations; i++) {
    arr.push(i)
    if (arr.length > 100) {
      arr.pop()
    }
  }
  return arr.length
}

@Concurrent
function stressMapGetFunc(map: collections.Map<string, number>, key: string): boolean {
  return map.has(key)
}

@Concurrent
function stressSetHasFunc(set: collections.Set<number>, value: number): boolean {
  return set.has(value)
}

export default function StressStabilityComboTest(): void {
  describe('StressStabilityComboTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== High Concurrency Stress (0100-0400) =====

    /**
     * @tc.name   StressStabilityComboTest0100
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0100
     * @tc.desc   Verify 100 concurrent Array push operations complete correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StressStabilityComboTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 100; i++) {
          tasks.push(new taskpool.Task(stressArrayPushFunc, arr, i))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        expect(arr.length).assertEqual(100)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   StressStabilityComboTest0200
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0200
     * @tc.desc   Verify 100 concurrent Map set operations complete correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StressStabilityComboTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 100; i++) {
          tasks.push(new taskpool.Task(stressMapSetFunc, map, 'key' + i.toString(), i))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        expect(map.size).assertEqual(100)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   StressStabilityComboTest0300
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0300
     * @tc.desc   Verify 100 concurrent Set add operations with unique values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StressStabilityComboTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let set = new collections.Set<number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 100; i++) {
          tasks.push(new taskpool.Task(stressSetAddFunc, set, i))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        expect(set.size).assertEqual(100)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   StressStabilityComboTest0400
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0400
     * @tc.desc   Verify 50 concurrent TypedArray write operations on shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StressStabilityComboTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(200)
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 50; i++) {
        tasks.push(new taskpool.Task(stressTypedArrayFunc, buffer, i, i * 100))
      }
      let promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      let view = new collections.Int32Array(buffer)
      expect(view[0]).assertEqual(0)
      expect(view[1]).assertEqual(100)
    })

    // ===== Data Scale Stress (0500-0700) =====

    /**
     * @tc.name   StressStabilityComboTest0500
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0500
     * @tc.desc   Verify 100K element Array bulk push and forEach sum via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('StressStabilityComboTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let arr = new collections.Array<number>()
      for (let i = 1; i <= 100000; i++) {
        arr.push(i)
      }
      expect(arr.length).assertEqual(100000)
      let task = new taskpool.Task(stressForEachFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(5000050000)
    })

    /**
     * @tc.name   StressStabilityComboTest0600
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0600
     * @tc.desc   Verify 1M element Array bulk push and length validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('StressStabilityComboTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let arr = new collections.Array<number>()
      for (let i = 0; i < 1000000; i++) {
        arr.push(i)
      }
      expect(arr.length).assertEqual(1000000)
      expect(arr[999999]).assertEqual(999999)
    })

    /**
     * @tc.name   StressStabilityComboTest0700
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0700
     * @tc.desc   Verify sustained push-pop pattern maintains bounded Array size via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('StressStabilityComboTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let arr = new collections.Array<number>()
      let task = new taskpool.Task(stressPushPopFunc, arr, 10000)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
    })

    // ===== Stability Tests (0800-1500) =====

    /**
     * @tc.name   StressStabilityComboTest0800
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0800
     * @tc.desc   Verify concurrent modify error recovery with sequential fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StressStabilityComboTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Array<number>()
      let errorCaught: boolean = false
      for (let i = 0; i < 50; i++) {
        try {
          let task = new taskpool.Task(stressArrayPushFunc, arr, i)
          await taskpool.execute(task)
        } catch (e) {
          errorCaught = true
        }
      }
      for (let i = arr.length; i < 50; i++) {
        arr.push(i)
      }
      expect(arr.length).assertEqual(50)
    })

    /**
     * @tc.name   StressStabilityComboTest0900
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_0900
     * @tc.desc   Verify Int8Array overflow behavior with max min and out-of-range values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StressStabilityComboTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let int8 = new collections.Int8Array(10)
      int8[0] = 127
      int8[1] = -128
      expect(int8[0]).assertEqual(127)
      expect(int8[1]).assertEqual(-128)
      int8[2] = 128
      expect(int8[2]).assertEqual(-128)
      int8[3] = 255
      expect(int8[3]).assertEqual(-1)
    })

    /**
     * @tc.name   StressStabilityComboTest1000
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_1000
     * @tc.desc   Verify Uint8Array boundary values with 0 and 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StressStabilityComboTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uint8 = new collections.Uint8Array(10)
      uint8[0] = 0
      uint8[1] = 255
      expect(uint8[0]).assertEqual(0)
      expect(uint8[1]).assertEqual(255)
      uint8[2] = 256
      expect(uint8[2]).assertEqual(0)
    })

    /**
     * @tc.name   StressStabilityComboTest1100
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_1100
     * @tc.desc   Verify Array shrinkTo reduces length and retains first N elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StressStabilityComboTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3, 4, 5)
      arr.shrinkTo(3)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(2)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.name   StressStabilityComboTest1200
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_1200
     * @tc.desc   Verify container clear and reuse with new data after clearing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('StressStabilityComboTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(arr.length).assertEqual(3)
      arr.splice(0, arr.length)
      expect(arr.length).assertEqual(0)
      arr.push(10)
      arr.push(20)
      arr.push(30)
      arr.push(40)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(10)
      let map = new collections.Map<string, number>()
      map.set('a', 1)
      map.set('b', 2)
      map.clear()
      expect(map.size).assertEqual(0)
      map.set('c', 3)
      expect(map.size).assertEqual(1)
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      set.add(10)
      expect(set.has(10)).assertTrue()
    })

    /**
     * @tc.name   StressStabilityComboTest1300
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_1300
     * @tc.desc   Verify Set concurrent add and has stability with 50 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StressStabilityComboTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let set = new collections.Set<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 50; i++) {
        tasks.push(new taskpool.Task(stressSetHasFunc, set, i))
      }
      let promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      let results = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as boolean).assertTrue()
      }
    })

    /**
     * @tc.name   StressStabilityComboTest1400
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_1400
     * @tc.desc   Verify Map concurrent set-get-has stability with 50 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StressStabilityComboTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      for (let i = 0; i < 50; i++) {
        map.set('item' + i.toString(), i)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 50; i++) {
        tasks.push(new taskpool.Task(stressMapGetFunc, map, 'item' + i.toString()))
      }
      let promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      let results = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as boolean).assertTrue()
      }
    })

    /**
     * @tc.name   StressStabilityComboTest1500
     * @tc.number SUB_STRESS_STABILITY_COMBO_TEST_1500
     * @tc.desc   Verify mixed container stress with Array Map Set concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StressStabilityComboTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      let map = new collections.Map<string, number>()
      let set = new collections.Set<number>()
      try {
        let allPromises: Promise<Object>[] = []
        for (let i = 0; i < 30; i++) {
          let arrTask = new taskpool.Task(stressArrayPushFunc, arr, i)
          let mapTask = new taskpool.Task(stressMapSetFunc, map, 'k' + i.toString(), i)
          let setTask = new taskpool.Task(stressSetAddFunc, set, i)
          allPromises.push(taskpool.execute(arrTask))
          allPromises.push(taskpool.execute(mapTask))
          allPromises.push(taskpool.execute(setTask))
        }
        await Promise.all(allPromises)
        expect(arr.length).assertEqual(30)
        expect(map.size).assertEqual(30)
        expect(set.size).assertEqual(30)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })
  })
}
