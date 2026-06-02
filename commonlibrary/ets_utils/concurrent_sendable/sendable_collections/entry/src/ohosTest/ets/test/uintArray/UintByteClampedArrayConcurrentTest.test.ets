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

@Concurrent
function processClampedArrayFunc(arr: collections.Uint8ClampedArray): number {
  return arr.length
}

@Concurrent
function modifyClampedArrayFunc(arr: collections.Uint8ClampedArray): void {
  arr[0] = 200
}

@Concurrent
function sumClampedArrayFunc(arr: collections.Uint8ClampedArray): number {
  let sum: number = 0
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i] as number
  }
  return sum
}

@Concurrent
function readClampedAtFunc(arr: collections.Uint8ClampedArray, index: number): number {
  return arr[index] as number
}

@Concurrent
function createClampedInTaskFunc(): number {
  let arr = new collections.Uint8ClampedArray(5)
  arr[0] = 100
  arr[1] = 200
  return arr.length
}

@Concurrent
function clampValuesInTaskFunc(): number {
  let src: number[] = [256, -1, 300]
  let arr = new collections.Uint8ClampedArray(src)
  return arr[0] as number
}

@Sendable
class CustomUintByteClampedArray extends collections.Uint8ClampedArray {
  constructor(length: number) {
    super(length)
  }

  sumAll(): number {
    let s: number = 0
    this.forEach((v: number) => { s += v })
    return s
  }
}

interface IProcessable {
  process(): number
}

@Sendable
class ProcessableClampedArray extends collections.Uint8ClampedArray implements IProcessable {
  constructor(length: number) {
    super(length)
  }

  process(): number {
    let s: number = 0
    this.forEach((v: number) => { s += v })
    return s
  }
}

export default function UintByteClampedArrayConcurrentTest(): void {
  describe('UintByteClampedArrayConcurrentTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ==================== Concurrent Tests ====================

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0100
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0100
     * @tc.desc   Verify TaskPool passes UintByteClampedArray and returns correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayConcurrentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      let task = new taskpool.Task(processClampedArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0200
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0200
     * @tc.desc   Verify TaskPool modifies UintByteClampedArray via reference sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayConcurrentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      let task = new taskpool.Task(modifyClampedArrayFunc, arr)
      await taskpool.execute(task)
      expect(arr[0]).assertEqual(200)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0300
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0300
     * @tc.desc   Verify TaskPool sum calculation with UintByteClampedArray data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayConcurrentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      let task = new taskpool.Task(sumClampedArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(15)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0400
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0400
     * @tc.desc   Verify UintByteClampedArray with boundary values passed through TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayConcurrentTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [0, 255, 128, 1, 100]
      let arr = new collections.Uint8ClampedArray(src)
      let task = new taskpool.Task(sumClampedArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(484)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0500
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0500
     * @tc.desc   Verify concurrent read from multiple TaskPool tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UintByteClampedArrayConcurrentTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [10, 20, 30, 40, 50]
      let arr = new collections.Uint8ClampedArray(src)
      let p0 = taskpool.execute(new taskpool.Task(readClampedAtFunc, arr, 0))
      let p1 = taskpool.execute(new taskpool.Task(readClampedAtFunc, arr, 1))
      let p2 = taskpool.execute(new taskpool.Task(readClampedAtFunc, arr, 2))
      let p3 = taskpool.execute(new taskpool.Task(readClampedAtFunc, arr, 3))
      let p4 = taskpool.execute(new taskpool.Task(readClampedAtFunc, arr, 4))
      let results = await Promise.all([p0, p1, p2, p3, p4])
      expect(results[0] as number).assertEqual(10)
      expect(results[1] as number).assertEqual(20)
      expect(results[2] as number).assertEqual(30)
      expect(results[3] as number).assertEqual(40)
      expect(results[4] as number).assertEqual(50)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0600
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0600
     * @tc.desc   Verify concurrent boundary value clamping via TaskPool read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UintByteClampedArrayConcurrentTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [256, -1, 300, -100]
      let arr = new collections.Uint8ClampedArray(src)
      let task = new taskpool.Task(readClampedAtFunc, arr, 0)
      let r0 = await taskpool.execute(task)
      expect(r0 as number).assertEqual(255)
      let task2 = new taskpool.Task(readClampedAtFunc, arr, 1)
      let r1 = await taskpool.execute(task2)
      expect(r1 as number).assertEqual(0)
      let task3 = new taskpool.Task(readClampedAtFunc, arr, 2)
      let r2 = await taskpool.execute(task3)
      expect(r2 as number).assertEqual(255)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0700
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0700
     * @tc.desc   Verify creating UintByteClampedArray inside TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayConcurrentTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task = new taskpool.Task(createClampedInTaskFunc)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(5)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0800
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0800
     * @tc.desc   Verify clamping behavior inside TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayConcurrentTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task = new taskpool.Task(clampValuesInTaskFunc)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(255)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest0900
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_0900
     * @tc.desc   Verify concurrent write via TaskPool modifies clamped array correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UintByteClampedArrayConcurrentTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [0, 0, 0, 0, 0]
      let arr = new collections.Uint8ClampedArray(src)
      let task1 = new taskpool.Task(modifyClampedArrayFunc, arr)
      await taskpool.execute(task1)
      expect(arr[0]).assertEqual(200)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest1000
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_1000
     * @tc.desc   Verify large array data integrity through TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UintByteClampedArrayConcurrentTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Uint8ClampedArray(100)
      for (let i = 0; i < 100; i++) {
        arr[i] = i
      }
      let task = new taskpool.Task(sumClampedArrayFunc, arr)
      let result = await taskpool.execute(task)
      let expected: number = 0
      for (let i = 0; i < 100; i++) {
        expected += i
      }
      expect(result as number).assertEqual(expected)
    })

    // ==================== Inheritance Tests ====================

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest1100
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_1100
     * @tc.desc   Verify custom subclass extends UintByteClampedArray with sumAll method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayConcurrentTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomUintByteClampedArray(5)
      arr[0] = 1
      arr[1] = 2
      arr[2] = 3
      arr[3] = 4
      arr[4] = 5
      expect(arr.sumAll()).assertEqual(15)
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest1200
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_1200
     * @tc.desc   Verify custom subclass clamps out-of-range values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayConcurrentTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new CustomUintByteClampedArray(3)
      arr[0] = 300
      arr[1] = -10
      arr[2] = 128
      expect(arr[0]).assertEqual(255)
      expect(arr[1]).assertEqual(0)
      expect(arr[2]).assertEqual(128)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest1300
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_1300
     * @tc.desc   Verify instanceof check for custom subclass and parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayConcurrentTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomUintByteClampedArray(3)
      expect(arr instanceof CustomUintByteClampedArray).assertTrue()
      expect(arr instanceof collections.Uint8ClampedArray).assertTrue()
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest1400
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_1400
     * @tc.desc   Verify interface implementation with process method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayConcurrentTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new ProcessableClampedArray(3)
      arr[0] = 10
      arr[1] = 20
      arr[2] = 30
      let result: number = arr.process()
      expect(result).assertEqual(60)
    })

    /**
     * @tc.name   UintByteClampedArrayConcurrentTest1500
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_CONCURRENT_TEST_1500
     * @tc.desc   Verify interface implementation also clamps values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayConcurrentTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new ProcessableClampedArray(3)
      arr[0] = 300
      arr[1] = -5
      arr[2] = 128
      expect(arr[0]).assertEqual(255)
      expect(arr[1]).assertEqual(0)
      expect(arr[2]).assertEqual(128)
    })
  })
}
