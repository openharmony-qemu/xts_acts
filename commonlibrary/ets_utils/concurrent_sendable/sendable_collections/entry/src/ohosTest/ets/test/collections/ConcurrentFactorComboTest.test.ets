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

// ===== @Sendable Classes =====

@Sendable
class FactorCounter {
  count: number = 0
}

// ===== @Concurrent Functions =====

@Concurrent
function factorArrayPushFunc(arr: collections.Array<number>, value: number): number {
  arr.push(value)
  return arr.length
}

@Concurrent
function factorMapSetFunc(map: collections.Map<string, number>, key: string, value: number): number {
  map.set(key, value)
  return map.size
}

@Concurrent
function factorSetAddFunc(set: collections.Set<number>, value: number): number {
  set.add(value)
  return set.size
}

@Concurrent
function factorForEachSumFunc(arr: collections.Array<number>): number {
  let total: number = 0
  arr.forEach((v: number) => {
    total += v
  })
  return total
}

@Concurrent
function factorReadFunc(arr: collections.Array<number>, index: number): number {
  return arr[index]
}

@Concurrent
function factorBatchPushFunc(arr: collections.Array<number>, count: number): number {
  for (let i = 0; i < count; i++) {
    arr.push(i)
  }
  return arr.length
}

@Concurrent
function factorProcessFunc(arr: collections.Array<number>, start: number, end: number): number {
  let sum: number = 0
  for (let i = start; i < end; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function factorTypedArrayFunc(buffer: collections.ArrayBuffer, size: number): number {
  let view = new collections.Uint8Array(buffer)
  for (let i = 0; i < size; i++) {
    view[i] = i % 256
  }
  return view[0]
}

@Concurrent
function factorFloatFunc(buffer: collections.ArrayBuffer, size: number): number {
  let view = new collections.Float32Array(buffer)
  for (let i = 0; i < size; i++) {
    view[i] = i * 1.5
  }
  return view[0]
}

export default function ConcurrentFactorComboTest(): void {
  describe('ConcurrentFactorComboTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Concurrency Levels (0100-0500) =====

    /**
     * @tc.name   ConcurrentFactorComboTest0100
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0100
     * @tc.desc   Verify single TaskPool baseline with Array push and result validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      let task = new taskpool.Task(factorArrayPushFunc, arr, 42)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(1)
      expect(arr[0]).assertEqual(42)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest0200
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0200
     * @tc.desc   Verify 5 concurrent TaskPool push tasks on same Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(factorArrayPushFunc, arr, i))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        expect(arr.length).assertEqual(5)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   ConcurrentFactorComboTest0300
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0300
     * @tc.desc   Verify 10 concurrent TaskPool get operations on pre-populated Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      for (let i = 0; i < 10; i++) {
        arr.push(i * 10)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(factorReadFunc, arr, i))
      }
      let promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      let results = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i * 10)
      }
    })

    /**
     * @tc.name   ConcurrentFactorComboTest0400
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0400
     * @tc.desc   Verify 50 concurrent TaskPool forEach operations on shared Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      for (let i = 0; i < 100; i++) {
        arr.push(i)
      }
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 50; i++) {
        tasks.push(new taskpool.Task(factorForEachSumFunc, arr))
      }
      let promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      let results = await Promise.all(promises)
      let expectedSum: number = 4950
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(expectedSum)
      }
    })

    /**
     * @tc.name   ConcurrentFactorComboTest0500
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0500
     * @tc.desc   Verify 100 concurrent TaskPool set operations on same Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 100; i++) {
          tasks.push(new taskpool.Task(factorMapSetFunc, map, 'k' + i.toString(), i))
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

    // ===== Async Task Combinations (0600-1100) =====

    /**
     * @tc.name   ConcurrentFactorComboTest0600
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0600
     * @tc.desc   Verify sequential push-pop-push execution chain on Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      let t1 = new taskpool.Task(factorArrayPushFunc, arr, 10)
      await taskpool.execute(t1)
      expect(arr.length).assertEqual(1)
      let popped = arr.pop()
      expect(popped).assertEqual(10)
      expect(arr.length).assertEqual(0)
      let t2 = new taskpool.Task(factorArrayPushFunc, arr, 20)
      await taskpool.execute(t2)
      expect(arr.length).assertEqual(1)
      expect(arr[0]).assertEqual(20)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest0700
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0700
     * @tc.desc   Verify Promise.all parallel execution with 3 concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr1 = new collections.Array<number>()
      let arr2 = new collections.Array<number>()
      let arr3 = new collections.Array<number>()
      let t1 = new taskpool.Task(factorArrayPushFunc, arr1, 1)
      let t2 = new taskpool.Task(factorArrayPushFunc, arr2, 2)
      let t3 = new taskpool.Task(factorArrayPushFunc, arr3, 3)
      let p1 = taskpool.execute(t1)
      let p2 = taskpool.execute(t2)
      let p3 = taskpool.execute(t3)
      let results = await Promise.all([p1, p2, p3])
      expect(results[0] as number).assertEqual(1)
      expect(results[1] as number).assertEqual(1)
      expect(results[2] as number).assertEqual(1)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest0800
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0800
     * @tc.desc   Verify Promise.all with 20 concurrent tasks and result validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 20; i++) {
          tasks.push(new taskpool.Task(factorArrayPushFunc, arr, i))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        let results = await Promise.all(promises)
        expect(results.length).assertEqual(20)
        expect(arr.length).assertEqual(20)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   ConcurrentFactorComboTest0900
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_0900
     * @tc.desc   Verify dependent set-get-delete chain on Map via sequential TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      let t1 = new taskpool.Task(factorMapSetFunc, map, 'dep1', 100)
      await taskpool.execute(t1)
      expect(map.has('dep1')).assertTrue()
      expect(map.get('dep1')).assertEqual(100)
      map.delete('dep1')
      expect(map.has('dep1')).assertFalse()
      let t2 = new taskpool.Task(factorMapSetFunc, map, 'dep2', 200)
      await taskpool.execute(t2)
      expect(map.size).assertEqual(1)
      expect(map.get('dep2')).assertEqual(200)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest1000
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1000
     * @tc.desc   Verify delayed push with setTimeout wrapping TaskPool execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          let task = new taskpool.Task(factorArrayPushFunc, arr, 999)
          taskpool.execute(task).then(() => {
            resolve()
          })
        }, 500)
      })
      expect(arr.length).assertEqual(1)
      expect(arr[0]).assertEqual(999)
    })

    // ===== Nested Scenarios (1200-1500) =====

    /**
     * @tc.name   ConcurrentFactorComboTest1100
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1100
     * @tc.desc   Verify forEach on 100-element Array via TaskPool returns correct sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      for (let i = 0; i < 100; i++) {
        arr.push(i + 1)
      }
      let task = new taskpool.Task(factorForEachSumFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(5050)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest1200
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1200
     * @tc.desc   Verify nested Array-Map forEach with 2-level iteration computing cross products
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentFactorComboTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      let map = new collections.Map<string, number>()
      map.set('a', 10)
      map.set('b', 20)
      let results = new collections.Array<number>()
      arr.forEach((a: number) => {
        map.forEach((v: number) => {
          results.push(a * v)
        })
      })
      expect(results.length).assertEqual(6)
      expect(results[0]).assertEqual(10)
      expect(results[5]).assertEqual(60)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest1300
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1300
     * @tc.desc   Verify nested Array-Set forEach with deduplication and cross combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentFactorComboTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      let set = new collections.Set<number>()
      set.add(10)
      set.add(20)
      let combos = new collections.Array<number>()
      arr.forEach((a: number) => {
        set.forEach((s: number) => {
          combos.push(a + s)
        })
      })
      expect(combos.length).assertEqual(6)
      expect(combos[0]).assertEqual(11)
      expect(combos[5]).assertEqual(23)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest1400
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1400
     * @tc.desc   Verify 3-level nested iteration with Array Map and Set containers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentFactorComboTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2)
      let map = new collections.Map<string, number>()
      map.set('x', 10)
      let set = new collections.Set<number>()
      set.add(100)
      set.add(200)
      let total: number = 0
      arr.forEach((a: number) => {
        map.forEach((mv: number) => {
          set.forEach((sv: number) => {
            total += a + mv + sv
          })
        })
      })
      expect(total).assertEqual(646)
    })

    // ===== Data Scale (1600-1900) =====

    /**
     * @tc.name   ConcurrentFactorComboTest1500
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1500
     * @tc.desc   Verify 1K element Array with forEach sum via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      for (let i = 1; i <= 1000; i++) {
        arr.push(i)
      }
      let task = new taskpool.Task(factorForEachSumFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(500500)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest1600
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1600
     * @tc.desc   Verify Uint8Array with 1K data scale via TaskPool write and read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let task = new taskpool.Task(factorTypedArrayFunc, buffer, 1024)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(0)
      let view = new collections.Uint8Array(buffer)
      expect(view[1]).assertEqual(1)
      expect(view[255]).assertEqual(255)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest1700
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1700
     * @tc.desc   Verify Float32Array precision with 100 elements via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(400)
      let task = new taskpool.Task(factorFloatFunc, buffer, 100)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(0)
      let view = new collections.Float32Array(buffer)
      expect(view[1]).assertEqual(1.5)
      expect(view[2]).assertEqual(3.0)
    })

    // ===== Mixed Concurrent Factor Matrix (2000-2300) =====

    /**
     * @tc.name   ConcurrentFactorComboTest1800
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1800
     * @tc.desc   Verify 50 concurrent batch push operations on separate Arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      let task = new taskpool.Task(factorBatchPushFunc, arr, 50)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(50)
      expect(arr.length).assertEqual(50)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest1900
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_1900
     * @tc.desc   Verify ArrayBuffer shared between multiple TypedArray views concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let task1 = new taskpool.Task(factorTypedArrayFunc, buffer, 512)
      let p1 = taskpool.execute(task1)
      await p1
      let view = new collections.Uint8Array(buffer)
      expect(view[0]).assertEqual(0)
      expect(view[1]).assertEqual(1)
      expect(view[255]).assertEqual(255)
    })

    /**
     * @tc.name   ConcurrentFactorComboTest2000
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_2000
     * @tc.desc   Verify Map and Set combination with concurrent set operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      let set = new collections.Set<number>()
      try {
        let mapTasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          mapTasks.push(new taskpool.Task(factorMapSetFunc, map, 'key' + i.toString(), i))
        }
        let setTasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          setTasks.push(new taskpool.Task(factorSetAddFunc, set, i))
        }
        let allPromises: Promise<Object>[] = []
        for (let i = 0; i < mapTasks.length; i++) {
          allPromises.push(taskpool.execute(mapTasks[i]))
        }
        for (let i = 0; i < setTasks.length; i++) {
          allPromises.push(taskpool.execute(setTasks[i]))
        }
        await Promise.all(allPromises)
        expect(map.size).assertEqual(10)
        expect(set.size).assertEqual(10)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   ConcurrentFactorComboTest2100
     * @tc.number SUB_CONCURRENT_FACTOR_COMBO_TEST_2100
     * @tc.desc   Verify chunk processing with Array split into 5 segments via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentFactorComboTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      for (let i = 0; i < 1000; i++) {
        arr.push(i)
      }
      let chunkSize: number = 200
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(factorProcessFunc, arr, i * chunkSize, (i + 1) * chunkSize))
      }
      let promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      let results = await Promise.all(promises)
      let totalSum: number = 0
      for (let i = 0; i < results.length; i++) {
        totalSum += results[i] as number
      }
      expect(totalSum).assertEqual(499500)
    })
  })
}
