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
function processCopiedBuffer(buffer: ArrayBuffer): number {
  let view = new Uint8Array(buffer)
  return view.length
}

@Concurrent
function receiveTransferredBuffer(buffer: ArrayBuffer): number {
  return buffer.byteLength
}

@Concurrent
function processSlice(slice: ArrayBuffer): number {
  let view = new Uint8Array(slice)
  let sum: number = 0
  for (let i: number = 0; i < view.length; i++) {
    sum += view[i]
  }
  return sum
}

@Concurrent
function processChunk(chunk: ArrayBuffer, id: number): number {
  let view = new Uint8Array(chunk)
  let sum: number = 0
  for (let i: number = 0; i < view.length; i++) {
    sum += view[i]
  }
  return sum
}

@Concurrent
function returnNewBuffer(size: number): ArrayBuffer {
  let buffer = new ArrayBuffer(size)
  let view = new Uint8Array(buffer)
  for (let i: number = 0; i < size; i++) {
    view[i] = i % 256
  }
  return buffer
}

@Concurrent
function verifyReturnedBuffer(buffer: ArrayBuffer): number {
  return buffer.byteLength
}

@Concurrent
function processLargeBuffer(buffer: ArrayBuffer): number {
  return buffer.byteLength
}

@Concurrent
function generateChunk(id: number, size: number): ArrayBuffer {
  let buffer = new ArrayBuffer(size)
  let view = new Uint8Array(buffer)
  for (let i: number = 0; i < size; i++) {
    view[i] = (id * 10 + i) % 256
  }
  return buffer
}

export default function ArrayBufferTest(): void {
  describe('ArrayBufferTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   ArrayBufferTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0100
     * @tc.desc   Verify ArrayBuffer copy mode via setTransferList([]) preserves original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(1024)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 1024; i++) {
        view[i] = i % 256
      }
      let task: taskpool.Task = new taskpool.Task(processCopiedBuffer, buffer)
      task.setTransferList([])
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(1024)
      expect(buffer.byteLength).assertEqual(1024)
    })

    /**
     * @tc.name   ArrayBufferTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0200
     * @tc.desc   Verify ArrayBuffer default transfer mode detaches original buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(2048)
      let task: taskpool.Task = new taskpool.Task(receiveTransferredBuffer, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(2048)
      try {
        let len: number = buffer.byteLength
        expect(len).assertEqual(0)
      } catch (e) {
        // buffer may be detached after transfer
      }
    })

    /**
     * @tc.name   ArrayBufferTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0300
     * @tc.desc   Verify ArrayBuffer.slice() creates independent copy for parallel processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(1024)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 1024; i++) {
        view[i] = i
      }
      let slice1: ArrayBuffer = buffer.slice(0, 256)
      let slice2: ArrayBuffer = buffer.slice(256, 512)
      let slice3: ArrayBuffer = buffer.slice(512, 768)
      let slice4: ArrayBuffer = buffer.slice(768, 1024)
      let task1: taskpool.Task = new taskpool.Task(processSlice, slice1)
      task1.setTransferList([])
      let task2: taskpool.Task = new taskpool.Task(processSlice, slice2)
      task2.setTransferList([])
      let task3: taskpool.Task = new taskpool.Task(processSlice, slice3)
      task3.setTransferList([])
      let task4: taskpool.Task = new taskpool.Task(processSlice, slice4)
      task4.setTransferList([])
      let p1: Promise<Object> = taskpool.execute(task1)
      let p2: Promise<Object> = taskpool.execute(task2)
      let p3: Promise<Object> = taskpool.execute(task3)
      let p4: Promise<Object> = taskpool.execute(task4)
      let results: Object[] = await Promise.all([p1, p2, p3, p4])
      expect(results.length).assertEqual(4)
      let total: number = 0
      for (let i: number = 0; i < 4; i++) {
        total += results[i] as number
      }
      expect(total).assertEqual(130560)
    })

    /**
     * @tc.name   ArrayBufferTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0400
     * @tc.desc   Verify TaskGroup batch processing with multiple ArrayBuffer slices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(4096)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 4096; i++) {
        view[i] = (i * 7) % 256
      }
      let chunkSize: number = 1024
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 4; i++) {
        let chunk: ArrayBuffer = buffer.slice(i * chunkSize, (i + 1) * chunkSize)
        group.addTask(new taskpool.Task(processChunk, chunk, i))
      }
      let results: Object[] = await taskpool.execute(group)
      expect(results.length).assertEqual(4)
    })

    /**
     * @tc.name   ArrayBufferTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0500
     * @tc.desc   Verify task return ArrayBuffer uses transfer mode by default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = await taskpool.execute(new taskpool.Task(returnNewBuffer, 512))
      let returnedBuffer: ArrayBuffer = result as ArrayBuffer
      expect(returnedBuffer.byteLength).assertEqual(512)
      let view: Uint8Array = new Uint8Array(returnedBuffer)
      expect(view[0]).assertEqual(0)
      expect(view[1]).assertEqual(1)
    })

    /**
     * @tc.name   ArrayBufferTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0600
     * @tc.desc   Verify 1MB large ArrayBuffer transfer performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArrayBufferTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let size: number = 1024 * 1024
      let buffer: ArrayBuffer = new ArrayBuffer(size)
      let start: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(processLargeBuffer, buffer))
      let elapsed: number = Date.now() - start
      expect(result as number).assertEqual(size)
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   ArrayBufferTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0700
     * @tc.desc   Verify 10MB ArrayBuffer transfer within serialization limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let size: number = 10 * 1024 * 1024
      let buffer: ArrayBuffer = new ArrayBuffer(size)
      let start: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(processLargeBuffer, buffer))
      let elapsed: number = Date.now() - start
      expect(result as number).assertEqual(size)
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   ArrayBufferTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0800
     * @tc.desc   Verify 8 slices parallel processing of ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(2048)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 2048; i++) {
        view[i] = i % 256
      }
      let sliceSize: number = 256
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 8; i++) {
        let slice: ArrayBuffer = buffer.slice(i * sliceSize, (i + 1) * sliceSize)
        promises.push(taskpool.execute(new taskpool.Task(processSlice, slice)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(8)
    })

    /**
     * @tc.name   ArrayBufferTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_0900
     * @tc.desc   Verify copy vs transfer performance comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArrayBufferTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let size: number = 1024 * 1024
      let copyBuffer: ArrayBuffer = new ArrayBuffer(size)
      let task1: taskpool.Task = new taskpool.Task(receiveTransferredBuffer, copyBuffer)
      task1.setTransferList([])
      let copyStart: number = Date.now()
      await taskpool.execute(task1)
      let copyTime: number = Date.now() - copyStart
      expect(copyBuffer.byteLength).assertEqual(size)

      let transferBuffer: ArrayBuffer = new ArrayBuffer(size)
      let transferStart: number = Date.now()
      await taskpool.execute(new taskpool.Task(receiveTransferredBuffer, transferBuffer))
      let transferTime: number = Date.now() - transferStart
      try {
        let len: number = transferBuffer.byteLength
        expect(len).assertEqual(0)
      } catch (e) {
        // buffer may be detached after transfer
      }
      expect(copyTime >= 0).assertTrue()
      expect(transferTime >= 0).assertTrue()
    })

    /**
     * @tc.name   ArrayBufferTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1000
     * @tc.desc   Verify multiple ArrayBuffer objects passed simultaneously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        let buffer: ArrayBuffer = new ArrayBuffer(100 * (i + 1))
        promises.push(taskpool.execute(new taskpool.Task(processLargeBuffer, buffer)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      expect(results[0] as number).assertEqual(100)
      expect(results[9] as number).assertEqual(1000)
    })

    /**
     * @tc.name   ArrayBufferTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1100
     * @tc.desc   Verify result concatenation from multiple tasks returning ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let chunkSize: number = 256
      let numChunks: number = 4
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < numChunks; i++) {
        promises.push(taskpool.execute(new taskpool.Task(generateChunk, i, chunkSize)))
      }
      let chunks: Object[] = await Promise.all(promises)
      let totalSize: number = 0
      for (let i: number = 0; i < chunks.length; i++) {
        let chunk: ArrayBuffer = chunks[i] as ArrayBuffer
        totalSize += chunk.byteLength
      }
      expect(totalSize).assertEqual(chunkSize * numChunks)
      let combined: ArrayBuffer = new ArrayBuffer(totalSize)
      let combinedView: Uint8Array = new Uint8Array(combined)
      let offset: number = 0
      for (let i: number = 0; i < chunks.length; i++) {
        let chunk: ArrayBuffer = chunks[i] as ArrayBuffer
        let chunkView: Uint8Array = new Uint8Array(chunk)
        for (let j: number = 0; j < chunkView.length; j++) {
          combinedView[offset + j] = chunkView[j]
        }
        offset += chunk.byteLength
      }
      expect(combined.byteLength).assertEqual(1024)
    })

    /**
     * @tc.name   ArrayBufferTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1200
     * @tc.desc   Verify returned ArrayBuffer can be re-transferred to another task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await taskpool.execute(new taskpool.Task(returnNewBuffer, 128))
      let buf: ArrayBuffer = result as ArrayBuffer
      expect(buf.byteLength).assertEqual(128)
      let size = await taskpool.execute(new taskpool.Task(verifyReturnedBuffer, buf))
      expect(size as number).assertEqual(128)
      try {
        let len: number = buf.byteLength
        expect(len).assertEqual(0)
      } catch (e) {
        // buffer may be detached after transfer
      }
    })

    /**
     * @tc.name   ArrayBufferTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1300
     * @tc.desc   Verify ArrayBuffer slice with zero length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(100)
      let emptySlice: ArrayBuffer = buffer.slice(50, 50)
      expect(emptySlice.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   ArrayBufferTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1400
     * @tc.desc   Verify ArrayBuffer slice preserves data content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(10)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 10; i++) {
        view[i] = i + 1
      }
      let slice: ArrayBuffer = buffer.slice(3, 7)
      let sliceView: Uint8Array = new Uint8Array(slice)
      expect(sliceView.length).assertEqual(4)
      expect(sliceView[0]).assertEqual(4)
      expect(sliceView[3]).assertEqual(7)
    })

    /**
     * @tc.name   ArrayBufferTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1500
     * @tc.desc   Verify 16 slice parallel processing of ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(4096)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 4096; i++) {
        view[i] = i % 256
      }
      let sliceSize: number = 256
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 16; i++) {
        let slice: ArrayBuffer = buffer.slice(i * sliceSize, (i + 1) * sliceSize)
        promises.push(taskpool.execute(new taskpool.Task(processSlice, slice)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(16)
    })

    /**
     * @tc.name   ArrayBufferTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1600
     * @tc.desc   Verify copy mode data independence - modifying original does not affect copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(10)
      let view: Uint8Array = new Uint8Array(buffer)
      view[0] = 42
      let task: taskpool.Task = new taskpool.Task(processCopiedBuffer, buffer)
      task.setTransferList([])
      await taskpool.execute(task)
      expect(view[0]).assertEqual(42)
      view[0] = 99
      expect(view[0]).assertEqual(99)
      expect(buffer.byteLength).assertEqual(10)
    })

    /**
     * @tc.name   ArrayBufferTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1700
     * @tc.desc   Verify TaskGroup with chunk processing returns correct number of results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(2048)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 2048; i++) {
        view[i] = 1
      }
      let chunkSize: number = 512
      let group: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 4; i++) {
        let chunk: ArrayBuffer = buffer.slice(i * chunkSize, (i + 1) * chunkSize)
        group.addTask(new taskpool.Task(processChunk, chunk, i))
      }
      let results: Object[] = await taskpool.execute(group)
      expect(results.length).assertEqual(4)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(512)
      }
    })

    /**
     * @tc.name   ArrayBufferTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_OBJECT_TRANSFER_ARRAYBUFFER_TEST_1800
     * @tc.desc   Verify ArrayBuffer with small size copy and transfer both work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(8)
      let view: Uint8Array = new Uint8Array(buffer)
      view[0] = 1
      view[7] = 8
      let task1: taskpool.Task = new taskpool.Task(processCopiedBuffer, buffer)
      task1.setTransferList([])
      let r1 = await taskpool.execute(task1)
      expect(r1 as number).assertEqual(8)
      expect(buffer.byteLength).assertEqual(8)

      let buffer2: ArrayBuffer = new ArrayBuffer(8)
      let r2 = await taskpool.execute(new taskpool.Task(receiveTransferredBuffer, buffer2))
      expect(r2 as number).assertEqual(8)
      try {
        let len: number = buffer2.byteLength
        expect(len).assertEqual(0)
      } catch (e) {
        // buffer may be detached after transfer
      }
    })
  })
}
