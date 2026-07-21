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
import { collections, taskpool, ArkTSUtils } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';

@Concurrent
async function safePush(lock: ArkTSUtils.locks.AsyncLock,
  arr: collections.Array<number>, value: number): Promise<number> {
  let result: number = await lock.lockAsync(() => {
    arr.push(value)
    return arr.length
  })
  return result
}

@Concurrent
function modifyArray(arr: collections.Array<number>): number {
  arr.push(100)
  return arr.length
}

export default function CollectionsTest(): void {
  describe('CollectionsTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    // ======================== Array Tests ========================

    /**
     * @tc.name   CollectionsTest0100
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0100
     * @tc.desc   Verify Array.create creates array with specified length and initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Array<number> = collections.Array.create<number>(5, 0)
      expect(arr.length).assertEqual(5)
      for (let i: number = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(0)
      }
    })

    /**
     * @tc.name   CollectionsTest0200
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0200
     * @tc.desc   Verify Array constructor with element arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
      expect(arr[2]).assertEqual(30)
    })

    /**
     * @tc.name   CollectionsTest0300
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0300
     * @tc.desc   Verify Array.from converts native array to collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let nativeArr: number[] = [1, 2, 3, 4, 5]
      let arr: collections.Array<number> = collections.Array.from<number>(nativeArr)
      expect(arr.length).assertEqual(5)
      expect(arr[2]).assertEqual(3)
      expect(arr[4]).assertEqual(5)
    })

    /**
     * @tc.name   CollectionsTest0400
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0400
     * @tc.desc   Verify Array.isArray distinguishes collections.Array from native array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arktsArr: collections.Array<number> = new collections.Array<number>(1, 2, 3)
      let nativeArr: number[] = [1, 2, 3]
      expect(collections.Array.isArray(arktsArr)).assertTrue()
      expect(collections.Array.isArray(nativeArr)).assertFalse()
    })

    /**
     * @tc.name   CollectionsTest0500
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0500
     * @tc.desc   Verify Array push, pop, shift, unshift, splice operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3)

      arr.push(4)
      expect(arr.length).assertEqual(4)
      expect(arr[3]).assertEqual(4)

      let popped: number = arr.pop() as number
      expect(popped).assertEqual(4)
      expect(arr.length).assertEqual(3)

      arr.unshift(0)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(0)

      let shifted: number = arr.shift() as number
      expect(shifted).assertEqual(0)
      expect(arr.length).assertEqual(3)

      arr.splice(1, 1, 5, 6)
      expect(arr.length).assertEqual(4)
      expect(arr[1]).assertEqual(5)
      expect(arr[2]).assertEqual(6)
    })

    /**
     * @tc.name   CollectionsTest0600
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0600
     * @tc.desc   Verify Array forEach, map, filter, reduce traversal methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5)

      let forEachSum: number = 0
      arr.forEach((value: number) => {
        forEachSum += value
      })
      expect(forEachSum).assertEqual(15)

      let mapped: collections.Array<number> = arr.map((value: number) => value * 2)
      expect(mapped[0]).assertEqual(2)
      expect(mapped[4]).assertEqual(10)

      let filtered: collections.Array<number> = arr.filter((value: number) => value > 2)
      expect(filtered.length).assertEqual(3)

      let reduced: number = arr.reduce((acc: number, value: number) => acc + value, 0)
      expect(reduced).assertEqual(15)
    })

    /**
     * @tc.name   CollectionsTest0700
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0700
     * @tc.desc   Verify Array fail-fast throws exception when modified during traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3)
      let caughtError: boolean = false
      try {
        arr.forEach((value: number) => {
          arr.push(value + 10)
        })
        expect().assertFail()
      } catch (e) {
        caughtError = true
        let err: BusinessError = e as BusinessError
        expect(typeof err.code).assertEqual('number')
        expect(err.code).assertEqual(10200201)
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   CollectionsTest0800
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0800
     * @tc.desc   Verify Array cross-thread reference passing via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3)
      let result = await taskpool.execute(new taskpool.Task(modifyArray, arr))
      expect(result as number).assertEqual(4)
      expect(arr.length).assertEqual(4)
      expect(arr[3]).assertEqual(100)
    })

    /**
     * @tc.name   CollectionsTest0900
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_0900
     * @tc.desc   Verify Array with AsyncLock for thread-safe concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let arr: collections.Array<number> = new collections.Array<number>()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(safePush, lock, arr, i)))
      }
      await Promise.all(promises)
      expect(arr.length).assertEqual(10)
    })

    // ======================== Map Tests ========================

    /**
     * @tc.name   CollectionsTest1000
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1000
     * @tc.desc   Verify Map constructor creates empty map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let map: collections.Map<string, number> = new collections.Map<string, number>()
      expect(map.size).assertEqual(0)
    })

    /**
     * @tc.name   CollectionsTest1100
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1100
     * @tc.desc   Verify Map set and get operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let map: collections.Map<string, number> = new collections.Map<string, number>()
      map.set('one', 1)
      map.set('two', 2)
      expect(map.get('one')).assertEqual(1)
      expect(map.get('two')).assertEqual(2)
    })

    /**
     * @tc.name   CollectionsTest1200
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1200
     * @tc.desc   Verify Map has, delete, and clear operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let map: collections.Map<string, number> = new collections.Map<string, number>()
      map.set('one', 1)
      map.set('two', 2)

      expect(map.has('one')).assertTrue()
      expect(map.has('three')).assertFalse()

      map.delete('one')
      expect(map.has('one')).assertFalse()
      expect(map.size).assertEqual(1)

      map.clear()
      expect(map.size).assertEqual(0)
    })

    // ======================== Set Tests ========================

    /**
     * @tc.name   CollectionsTest1300
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1300
     * @tc.desc   Verify Set constructor with elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let set: collections.Set<number> = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
    })

    /**
     * @tc.name   CollectionsTest1400
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1400
     * @tc.desc   Verify Set add, has, delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let set: collections.Set<string> = new collections.Set<string>()
      set.add('one')
      set.add('two')

      expect(set.has('one')).assertTrue()
      expect(set.has('three')).assertFalse()

      set.delete('one')
      expect(set.has('one')).assertFalse()
      expect(set.size).assertEqual(1)
    })

    /**
     * @tc.name   CollectionsTest1500
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1500
     * @tc.desc   Verify Set handles duplicate elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let set: collections.Set<number> = new collections.Set<number>()
      set.add(1)
      set.add(1)
      set.add(2)
      expect(set.size).assertEqual(2)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
    })

    // ======================== TypedArray Tests ========================

    /**
     * @tc.name   CollectionsTest1600
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1600
     * @tc.desc   Verify TypedArray constructors for Int8Array, Uint16Array, Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let int8Arr: collections.Int8Array = new collections.Int8Array(5)
      expect(int8Arr.length).assertEqual(5)
      expect(int8Arr.byteLength).assertEqual(5)

      let uint16Arr: collections.Uint16Array = new collections.Uint16Array([1, 2, 3])
      expect(uint16Arr.length).assertEqual(3)
      expect(uint16Arr.byteLength).assertEqual(6)

      let int32Arr: collections.Int32Array = new collections.Int32Array(4)
      expect(int32Arr.length).assertEqual(4)
      expect(int32Arr.byteLength).assertEqual(16)
    })

    /**
     * @tc.name   CollectionsTest1700
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1700
     * @tc.desc   Verify TypedArray buffer property returns underlying ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Int32Array = new collections.Int32Array(4)
      let buffer: collections.ArrayBuffer = arr.buffer
      expect(buffer.byteLength).assertEqual(16)
    })

    /**
     * @tc.name   CollectionsTest1800
     * @tc.number SUB_ARKTS_UTILS_COLLECTIONS_TEST_1800
     * @tc.desc   Verify TypedArray type boundary values and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CollectionsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let uint8Arr: collections.Uint8Array = new collections.Uint8Array(1)
      uint8Arr[0] = 255
      expect(uint8Arr[0]).assertEqual(255)

      uint8Arr[0] = 256
      expect(uint8Arr[0]).assertEqual(0)

      let int8Arr: collections.Int8Array = new collections.Int8Array(1)
      int8Arr[0] = 127
      expect(int8Arr[0]).assertEqual(127)

      int8Arr[0] = 128
      expect(int8Arr[0]).assertEqual(-128)
    })
  })
}
