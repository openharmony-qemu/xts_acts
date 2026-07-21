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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';

@Concurrent
function processUint8ArrayLength(arr: Uint8Array): number {
  return arr.length
}

@Concurrent
function processUint8ArraySum(arr: Uint8Array): number {
  let sum: number = 0
  for (let i: number = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function processArrayBufferLength(buf: ArrayBuffer): number {
  return buf.byteLength
}

@Concurrent
function processInt32ArraySum(arr: Int32Array): number {
  let sum: number = 0
  for (let i: number = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function processFloat32ArraySum(arr: Float32Array): number {
  let sum: number = 0
  for (let i: number = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function modifyAndReturnBuffer(buf: ArrayBuffer): number {
  let view = new Uint8Array(buf)
  if (view.length > 0) {
    view[0] = 99
  }
  return buf.byteLength
}

export default function BufferTest(): void {
  describe('BufferTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   BufferTest0100
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0100
     * @tc.desc   Verify Uint8Array creation and cross-thread transfer with length verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BufferTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Uint8Array = new Uint8Array(256)
      for (let i: number = 0; i < 256; i++) {
        arr[i] = i
      }
      let result = await taskpool.execute(new taskpool.Task(processUint8ArrayLength, arr))
      expect(result as number).assertEqual(256)
    })

    /**
     * @tc.name   BufferTest0200
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0200
     * @tc.desc   Verify Uint8Array cross-thread data sum verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BufferTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Uint8Array = new Uint8Array(10)
      for (let i: number = 0; i < 10; i++) {
        arr[i] = i + 1
      }
      let result = await taskpool.execute(new taskpool.Task(processUint8ArraySum, arr))
      expect(result as number).assertEqual(55)
    })

    /**
     * @tc.name   BufferTest0300
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0300
     * @tc.desc   Verify Uint8Array index read/write operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BufferTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Uint8Array = new Uint8Array(100)
      for (let i: number = 0; i < 100; i++) {
        arr[i] = (i * 3) % 256
      }
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(3)
      expect(arr[50]).assertEqual(150)
      arr[0] = 255
      expect(arr[0]).assertEqual(255)
    })

    /**
     * @tc.name   BufferTest0400
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0400
     * @tc.desc   Verify ArrayBuffer cross-thread transfer with byteLength verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BufferTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buf: ArrayBuffer = new ArrayBuffer(512)
      let result = await taskpool.execute(new taskpool.Task(processArrayBufferLength, buf))
      expect(result as number).assertEqual(512)
    })

    /**
     * @tc.name   BufferTest0500
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0500
     * @tc.desc   Verify Int32Array cross-thread transfer with sum verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BufferTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50])
      let result = await taskpool.execute(new taskpool.Task(processInt32ArraySum, arr))
      expect(result as number).assertEqual(150)
    })

    /**
     * @tc.name   BufferTest0600
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0600
     * @tc.desc   Verify Float32Array cross-thread transfer with sum verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BufferTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Float32Array = new Float32Array([1.5, 2.5, 3.5, 4.5])
      let result = await taskpool.execute(new taskpool.Task(processFloat32ArraySum, arr))
      expect(result as number).assertEqual(12.0)
    })

    /**
     * @tc.name   BufferTest0700
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0700
     * @tc.desc   Verify Uint8Array with all bytes set to max value 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: Uint8Array = new Uint8Array(100)
      for (let i: number = 0; i < 100; i++) {
        arr[i] = 255
      }
      let result = await taskpool.execute(new taskpool.Task(processUint8ArraySum, arr))
      expect(result as number).assertEqual(25500)
    })

    /**
     * @tc.name   BufferTest0800
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0800
     * @tc.desc   Verify Uint8Array with zero-filled data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BufferTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Uint8Array = new Uint8Array(64)
      expect(arr[0]).assertEqual(0)
      expect(arr[63]).assertEqual(0)
      let result = await taskpool.execute(new taskpool.Task(processUint8ArraySum, arr))
      expect(result as number).assertEqual(0)
    })

    /**
     * @tc.name   BufferTest0900
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_0900
     * @tc.desc   Verify large capacity Uint8Array creation and cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let size: number = 1024 * 1024
      let arr: Uint8Array = new Uint8Array(size)
      arr[0] = 100
      arr[size - 1] = 200
      let result = await taskpool.execute(new taskpool.Task(processUint8ArrayLength, arr))
      expect(result as number).assertEqual(size)
    })

    /**
     * @tc.name   BufferTest1000
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1000
     * @tc.desc   Verify Uint8Array data pattern preservation after cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: Uint8Array = new Uint8Array(16)
      for (let i: number = 0; i < 16; i++) {
        arr[i] = i * 16
      }
      let result = await taskpool.execute(new taskpool.Task(processUint8ArraySum, arr))
      let expectedSum: number = 0
      for (let i: number = 0; i < 16; i++) {
        expectedSum += i * 16
      }
      expect(result as number).assertEqual(expectedSum)
    })

    /**
     * @tc.name   BufferTest1100
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1100
     * @tc.desc   Verify Uint8Array with single element cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: Uint8Array = new Uint8Array([42])
      let result = await taskpool.execute(new taskpool.Task(processUint8ArraySum, arr))
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   BufferTest1200
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1200
     * @tc.desc   Verify multiple Uint8Array objects passed simultaneously via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BufferTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 5; i++) {
        let arr: Uint8Array = new Uint8Array(100 * (i + 1))
        promises.push(taskpool.execute(new taskpool.Task(processUint8ArrayLength, arr)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      expect(results[0] as number).assertEqual(100)
      expect(results[4] as number).assertEqual(500)
    })

    /**
     * @tc.name   BufferTest1300
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1300
     * @tc.desc   Verify Uint8Array with alternating byte pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: Uint8Array = new Uint8Array(100)
      for (let i: number = 0; i < 100; i++) {
        arr[i] = i % 2 === 0 ? 0xAA : 0x55
      }
      expect(arr[0]).assertEqual(0xAA)
      expect(arr[1]).assertEqual(0x55)
      expect(arr[2]).assertEqual(0xAA)
    })

    /**
     * @tc.name   BufferTest1400
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1400
     * @tc.desc   Verify Uint8Array read/write performance with large buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('BufferTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let size: number = 1024 * 1024
      let arr: Uint8Array = new Uint8Array(size)
      let start: number = Date.now()
      for (let i: number = 0; i < 1000; i++) {
        arr[i] = i % 256
      }
      for (let i: number = 0; i < 1000; i++) {
        let val: number = arr[i]
      }
      let elapsed: number = Date.now() - start
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   BufferTest1500
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1500
     * @tc.desc   Verify Uint8Array sequential byte pattern cross-thread verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: Uint8Array = new Uint8Array(256)
      for (let i: number = 0; i < 256; i++) {
        arr[i] = i
      }
      let result = await taskpool.execute(new taskpool.Task(processUint8ArraySum, arr))
      expect(result as number).assertEqual(32640)
    })

    /**
     * @tc.name   BufferTest1600
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1600
     * @tc.desc   Verify ArrayBuffer shares memory with Uint8Array view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buf: ArrayBuffer = new ArrayBuffer(10)
      let arr: Uint8Array = new Uint8Array(buf)
      arr[0] = 42
      let view: Uint8Array = new Uint8Array(buf)
      expect(view[0]).assertEqual(42)
      view[1] = 99
      expect(arr[1]).assertEqual(99)
    })

    /**
     * @tc.name   BufferTest1700
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1700
     * @tc.desc   Verify ArrayBuffer cross-thread large data transfer performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('BufferTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let size: number = 1024 * 1024
      let buf: ArrayBuffer = new ArrayBuffer(size)
      let start: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(processArrayBufferLength, buf))
      let elapsed: number = Date.now() - start
      expect(result as number).assertEqual(size)
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   BufferTest1800
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1800
     * @tc.desc   Verify Uint8Array.subarray creates view sharing same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5])
      let sub: Uint8Array = arr.subarray(1, 4)
      expect(sub.length).assertEqual(3)
      expect(sub[0]).assertEqual(2)
      expect(sub[2]).assertEqual(4)
      sub[0] = 99
      expect(arr[1]).assertEqual(99)
    })

    /**
     * @tc.name   BufferTest1900
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_1900
     * @tc.desc   Verify Uint8Array.slice creates independent copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5])
      let sliced: Uint8Array = arr.slice(1, 4)
      expect(sliced.length).assertEqual(3)
      expect(sliced[0]).assertEqual(2)
      sliced[0] = 99
      expect(arr[1]).assertEqual(2)
    })

    /**
     * @tc.name   BufferTest2000
     * @tc.number SUB_OBJECT_TRANSFER_BUFFER_TEST_2000
     * @tc.desc   Verify Int32Array with negative values cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BufferTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: Int32Array = new Int32Array([-10, -20, 30, 40, -50])
      let result = await taskpool.execute(new taskpool.Task(processInt32ArraySum, arr))
      expect(result as number).assertEqual(-10)
    })
  })
}
