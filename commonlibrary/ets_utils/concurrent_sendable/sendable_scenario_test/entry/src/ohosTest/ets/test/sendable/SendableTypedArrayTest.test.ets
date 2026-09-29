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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections } from '@kit.ArkTS'

@Concurrent
function readTypedElement(arr: collections.Int8Array, index: number): number {
  return arr[index]
}

@Concurrent
function writeTypedElement(arr: collections.Int32Array, index: number, value: number): void {
  arr[index] = value
}

@Concurrent
function readBufferByteLength(buf: collections.ArrayBuffer): number {
  return buf.byteLength
}

@Concurrent
function sumTypedArray(arr: collections.Float32Array): number {
  let total: number = 0
  for (let i: number = 0; i < arr.length; i++) {
    total += arr[i]
  }
  return total
}

export default function SendableTypedArrayTest(): void {
  describe('SendableTypedArrayTest', (): void => {
    /**
     * @tc.name   testSendableTypedArray0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_TYPED_ARRAY_TEST_0100
     * @tc.desc   Verify collections.Int8Array stores negative and positive boundary values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableTypedArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arr: collections.Int8Array = new collections.Int8Array(4)
      arr[0] = -128
      arr[1] = 127
      arr[2] = 0
      arr[3] = 42
      expect(arr[0]).assertEqual(-128)
      expect(arr[1]).assertEqual(127)
      expect(arr[2]).assertEqual(0)
      expect(arr[3]).assertEqual(42)
      expect(arr.length).assertEqual(4)
    })

    /**
     * @tc.name   testSendableTypedArray0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_TYPED_ARRAY_TEST_0200
     * @tc.desc   Verify collections.Uint8Array stores 0 and 255 boundary values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableTypedArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arr: collections.Uint8Array = new collections.Uint8Array(3)
      arr[0] = 0
      arr[1] = 255
      arr[2] = 128
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(255)
      expect(arr[2]).assertEqual(128)
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.name   testSendableTypedArray0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_TYPED_ARRAY_TEST_0300
     * @tc.desc   Verify collections.Float32Array stores fractional values and NaN correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableTypedArray0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: collections.Float32Array = new collections.Float32Array(3)
      arr[0] = 0.5
      arr[1] = -2.75
      arr[2] = NaN
      expect(arr[0]).assertEqual(0.5)
      expect(arr[1]).assertEqual(-2.75)
      expect(Number.isNaN(arr[2])).assertTrue()
    })

    /**
     * @tc.name   testSendableTypedArray0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_TYPED_ARRAY_TEST_0400
     * @tc.desc   Verify collections.Uint32Array stores unsigned 32-bit boundary values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableTypedArray0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: collections.Uint32Array = new collections.Uint32Array(3)
      arr[0] = 0
      arr[1] = 4294967295
      arr[2] = 2147483648
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(4294967295)
      expect(arr[2]).assertEqual(2147483648)
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.name   testSendableTypedArray0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_TYPED_ARRAY_TEST_0500
     * @tc.desc   Verify collections.ArrayBuffer byteLength and cross-thread read via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableTypedArray0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const buf: collections.ArrayBuffer = new collections.ArrayBuffer(32)
        expect(buf.byteLength).assertEqual(32)
        const task: taskpool.Task = new taskpool.Task(readBufferByteLength, buf)
        const result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(32)
      } catch (error) {
        console.error("testSendableTypedArray0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableTypedArray0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_TYPED_ARRAY_TEST_0600
     * @tc.desc   Verify Int8Array element is readable inside TaskPool concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableTypedArray0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const arr: collections.Int8Array = new collections.Int8Array(8)
        arr[3] = -7
        const task: taskpool.Task = new taskpool.Task(readTypedElement, arr, 3)
        const result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(-7)
      } catch (error) {
        console.error("testSendableTypedArray0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableTypedArray0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_TYPED_ARRAY_TEST_0700
     * @tc.desc   Verify Int32Array mutation inside TaskPool is visible to main thread by shared reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableTypedArray0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const arr: collections.Int32Array = new collections.Int32Array(4)
        const task: taskpool.Task = new taskpool.Task(writeTypedElement, arr, 2, 12345)
        await taskpool.execute(task)
        expect(arr[2]).assertEqual(12345)
        expect(arr[0]).assertEqual(0)
      } catch (error) {
        console.error("testSendableTypedArray0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableTypedArray0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_TYPED_ARRAY_TEST_0800
     * @tc.desc   Verify Float32Array slice returns independent copy and TaskPool sums original correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableTypedArray0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const arr: collections.Float32Array = new collections.Float32Array(5)
        for (let i: number = 0; i < 5; i++) {
          arr[i] = i + 1
        }
        const part: collections.Float32Array = arr.slice(1, 4)
        expect(part.length).assertEqual(3)
        expect(part[0]).assertEqual(2)
        expect(part[2]).assertEqual(4)
        part[0] = 100
        expect(arr[1]).assertEqual(2)
        const task: taskpool.Task = new taskpool.Task(sumTypedArray, arr)
        const result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(15)
      } catch (error) {
        console.error("testSendableTypedArray0800 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
