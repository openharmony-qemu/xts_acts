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
class ConcurrentCounter {
  count: number = 0
}

// ===== @Concurrent Functions =====

@Concurrent
function pushToArrayFunc(arr: collections.Array<number>, value: number): number {
  arr.push(value)
  return arr.length
}

@Concurrent
function setToMapFunc(map: collections.Map<string, number>, key: string, value: number): number {
  map.set(key, value)
  return map.size
}

@Concurrent
function addToSetFunc(set: collections.Set<number>, value: number): number {
  set.add(value)
  return set.size
}

@Concurrent
function concurrentPushFunc(arr: collections.Array<number>): void {
  arr.push(1)
}

@Concurrent
function batchPushFunc(arr: collections.Array<number>, count: number): number {
  for (let i = 0; i < count; i++) {
    arr.push(i)
  }
  return arr.length
}

@Concurrent
function sequentialPushFunc(arr: collections.Array<number>, value: number): number {
  arr.push(value)
  return arr.length
}

@Concurrent
function mapSetGetDeleteFunc(map: collections.Map<string, number>, key: string, value: number): boolean {
  map.set(key, value)
  let found: boolean = map.has(key)
  map.delete(key)
  return found
}

@Concurrent
function nestedForEachFunc(arr: collections.Array<number>): number {
  let total: number = 0
  arr.forEach((v: number) => {
    total += v
  })
  return total
}

@Concurrent
function gcArrayFunc(arr: collections.Array<number>): number {
  for (let i = 0; i < 1000; i++) {
    arr.push(i)
    if (i % 100 === 0) {
      arr.pop()
    }
  }
  return arr.length
}

@Concurrent
function readTypedArrayFunc(buffer: collections.ArrayBuffer): number {
  let view = new collections.Int8Array(buffer)
  return view[0]
}

@Concurrent
function processChunkFunc(arr: collections.Array<number>, start: number, end: number): number {
  let sum: number = 0
  for (let i = start; i < end; i++) {
    sum += arr[i]
  }
  return sum
}

export default function ContainerComboTest(): void {
  describe('ContainerComboTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Container Combination Tests (0100-0300) =====

    /**
     * @tc.name   ContainerComboTest0100
     * @tc.number SUB_CONTAINER_COMBO_TEST_0100
     * @tc.desc   Verify Array to Map conversion by iterating key-value pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerComboTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keys = new collections.Array<string>('a', 'b', 'c')
      let values = new collections.Array<number>(1, 2, 3)
      let map = new collections.Map<string, number>()
      for (let i = 0; i < keys.length; i++) {
        map.set(keys[i], values[i])
      }
      expect(map.size).assertEqual(3)
      expect(map.get('a')).assertEqual(1)
      expect(map.get('b')).assertEqual(2)
      expect(map.get('c')).assertEqual(3)
    })

    /**
     * @tc.name   ContainerComboTest0200
     * @tc.number SUB_CONTAINER_COMBO_TEST_0200
     * @tc.desc   Verify Array deduplication via Set with duplicate elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerComboTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 2, 3, 3, 3)
      let set = new collections.Set<number>()
      for (let i = 0; i < arr.length; i++) {
        set.add(arr[i])
      }
      expect(set.size).assertEqual(3)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      expect(set.has(3)).assertTrue()
    })

    /**
     * @tc.name   ContainerComboTest0300
     * @tc.number SUB_CONTAINER_COMBO_TEST_0300
     * @tc.desc   Verify Map key extraction to Set via forEach iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerComboTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new collections.Map<string, number>()
      map.set('a', 1)
      map.set('b', 2)
      map.set('c', 3)
      let keySet = new collections.Set<string>()
      map.forEach((v: number, k: string) => {
        keySet.add(k)
      })
      expect(keySet.size).assertEqual(3)
      expect(keySet.has('a')).assertTrue()
      expect(keySet.has('b')).assertTrue()
      expect(keySet.has('c')).assertTrue()
    })

    // ===== Concurrent Container Operations (0400-0900) =====

    /**
     * @tc.name   ContainerComboTest0400
     * @tc.number SUB_CONTAINER_COMBO_TEST_0400
     * @tc.desc   Verify single TaskPool push operation on collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(1, 2, 3)
      let task = new taskpool.Task(pushToArrayFunc, arr, 100)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(4)
      expect(arr.length).assertEqual(4)
      expect(arr[3]).assertEqual(100)
    })

    /**
     * @tc.name   ContainerComboTest0500
     * @tc.number SUB_CONTAINER_COMBO_TEST_0500
     * @tc.desc   Verify 5 concurrent TaskPool push operations on same Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(pushToArrayFunc, arr, i * 10))
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
     * @tc.name   ContainerComboTest0600
     * @tc.number SUB_CONTAINER_COMBO_TEST_0600
     * @tc.desc   Verify 10 concurrent TaskPool set operations on same Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map = new collections.Map<string, number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(setToMapFunc, map, 'key' + i.toString(), i * 100))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        expect(map.size).assertEqual(10)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   ContainerComboTest0700
     * @tc.number SUB_CONTAINER_COMBO_TEST_0700
     * @tc.desc   Verify 50 concurrent TaskPool add operations on same Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let set = new collections.Set<number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 50; i++) {
          tasks.push(new taskpool.Task(addToSetFunc, set, i))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        expect(set.size).assertEqual(50)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    /**
     * @tc.name   ContainerComboTest0800
     * @tc.number SUB_CONTAINER_COMBO_TEST_0800
     * @tc.desc   Verify 100 concurrent TaskPool map operations for high concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 100; i++) {
          tasks.push(new taskpool.Task(pushToArrayFunc, arr, i))
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
     * @tc.name   ContainerComboTest0900
     * @tc.number SUB_CONTAINER_COMBO_TEST_0900
     * @tc.desc   Verify sequential push-pop-push dependency chain on Array via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      let task1 = new taskpool.Task(sequentialPushFunc, arr, 10)
      let r1 = await taskpool.execute(task1)
      expect(r1 as number).assertEqual(1)
      let popped = arr.pop()
      expect(popped).assertEqual(10)
      let task2 = new taskpool.Task(sequentialPushFunc, arr, 20)
      let r2 = await taskpool.execute(task2)
      expect(r2 as number).assertEqual(1)
      expect(arr[0]).assertEqual(20)
    })

    // ===== Async Task Combinations (1000-1100) =====

    /**
     * @tc.name   ContainerComboTest1000
     * @tc.number SUB_CONTAINER_COMBO_TEST_1000
     * @tc.desc   Verify Promise.all parallel execution with two Map set-get-delete tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let map1 = new collections.Map<string, number>()
      let map2 = new collections.Map<string, number>()
      let task1 = new taskpool.Task(mapSetGetDeleteFunc, map1, 'key1', 100)
      let task2 = new taskpool.Task(mapSetGetDeleteFunc, map2, 'key2', 200)
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      let results = await Promise.all([p1, p2])
      expect(results[0] as boolean).assertTrue()
      expect(results[1] as boolean).assertTrue()
    })

    /**
     * @tc.name   ContainerComboTest1100
     * @tc.number SUB_CONTAINER_COMBO_TEST_1100
     * @tc.desc   Verify Promise.all with 10 parallel Set add tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let set = new collections.Set<number>()
      try {
        let tasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(addToSetFunc, set, i * 100))
        }
        let promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        let results = await Promise.all(promises)
        expect(results.length).assertEqual(10)
        expect(set.size).assertEqual(10)
      } catch (e) {
        expect(e.message).assertContain('Concurrent modification')
      }
    })

    // ===== Nested Scenarios (1200-1400) =====

    /**
     * @tc.name   ContainerComboTest1200
     * @tc.number SUB_CONTAINER_COMBO_TEST_1200
     * @tc.desc   Verify nested Array forEach with 2-level iteration and sum computation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerComboTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let outer = new collections.Array<number>(1, 2, 3)
      let inner = new collections.Array<number>(10, 20, 30)
      let totalSum: number = 0
      outer.forEach((ov: number) => {
        inner.forEach((iv: number) => {
          totalSum += ov * iv
        })
      })
      expect(totalSum).assertEqual(360)
    })

    /**
     * @tc.name   ContainerComboTest1300
     * @tc.number SUB_CONTAINER_COMBO_TEST_1300
     * @tc.desc   Verify 3-level nested iteration with Array Map and Set containers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerComboTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2)
      let map = new collections.Map<string, number>()
      map.set('x', 10)
      map.set('y', 20)
      let set = new collections.Set<number>()
      set.add(100)
      set.add(200)
      let total: number = 0
      arr.forEach((a: number) => {
        map.forEach((mv: number, mk: string) => {
          set.forEach((sv: number) => {
            total += a + mv + sv
          })
        })
      })
      expect(total).assertEqual(1332)
    })

    /**
     * @tc.name   ContainerComboTest1400
     * @tc.number SUB_CONTAINER_COMBO_TEST_1400
     * @tc.desc   Verify nested forEach on two Maps collecting combined key-value results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerComboTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map1 = new collections.Map<string, number>()
      map1.set('a', 1)
      map1.set('b', 2)
      let map2 = new collections.Map<string, number>()
      map2.set('x', 10)
      map2.set('y', 20)
      let results = new collections.Array<number>()
      map1.forEach((v1: number, k1: string) => {
        map2.forEach((v2: number, k2: string) => {
          results.push(v1 * v2)
        })
      })
      expect(results.length).assertEqual(4)
    })

    // ===== Special Combinations (1500-1700) =====

    /**
     * @tc.name   ContainerComboTest1500
     * @tc.number SUB_CONTAINER_COMBO_TEST_1500
     * @tc.desc   Verify batch push with 50 elements via single TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      let task = new taskpool.Task(batchPushFunc, arr, 50)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(50)
      expect(arr.length).assertEqual(50)
    })

    /**
     * @tc.name   ContainerComboTest1600
     * @tc.number SUB_CONTAINER_COMBO_TEST_1600
     * @tc.desc   Verify GC stress with push and pop pattern on Array via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerComboTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>()
      let task = new taskpool.Task(gcArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(990)
    })

    /**
     * @tc.name   ContainerComboTest1700
     * @tc.number SUB_CONTAINER_COMBO_TEST_1700
     * @tc.desc   Verify TypedArray and ArrayBuffer shared view with Int8 and Uint8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerComboTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let int8View = new collections.Int8Array(buffer)
      let uint8View = new collections.Uint8Array(buffer)
      int8View[0] = -1
      expect(uint8View[0]).assertEqual(255)
      int8View[1] = 127
      expect(uint8View[1]).assertEqual(127)
    })
  })
}
