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
function processBufferFunc(buffer: collections.ArrayBuffer): number {
  return buffer.byteLength
}

@Concurrent
function readBufferAtOffsetFunc(buffer: collections.ArrayBuffer, offset: number): number {
  let view = new collections.Int8Array(buffer)
  return view[offset]
}

@Concurrent
function sliceBufferFunc(buffer: collections.ArrayBuffer): collections.ArrayBuffer {
  return buffer.slice(0, 512)
}

@Concurrent
function modifyInt32Func(buffer: collections.ArrayBuffer): void {
  let view = new collections.Int32Array(buffer)
  view[0] = 12345
}

@Sendable
class CustomArrayBuffer extends collections.ArrayBuffer {
  constructor(byteLength: number) {
    super(byteLength)
  }

  getHalfLength(): number {
    return this.byteLength / 2
  }
}

export default function ArrayBufferTest(): void {
  describe('ArrayBufferTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   ArrayBufferTest0100
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0100
     * @tc.desc   Verify constructor with required byteLength parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      expect(buffer.byteLength).assertEqual(1024)
    })

    /**
     * @tc.name   ArrayBufferTest0200
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0200
     * @tc.desc   Verify constructor with normal number values 0, 1, 1024, 1MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer1 = new collections.ArrayBuffer(0)
      expect(buffer1.byteLength).assertEqual(0)
      let buffer2 = new collections.ArrayBuffer(1)
      expect(buffer2.byteLength).assertEqual(1)
      let buffer3 = new collections.ArrayBuffer(1024)
      expect(buffer3.byteLength).assertEqual(1024)
      let buffer4 = new collections.ArrayBuffer(1024 * 1024)
      expect(buffer4.byteLength).assertEqual(1024 * 1024)
    })

    /**
     * @tc.name   ArrayBufferTest0300
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0300
     * @tc.desc   Verify constructor with boundary values 0 and 2147483647
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let zeroBuffer = new collections.ArrayBuffer(0)
      expect(zeroBuffer.byteLength).assertEqual(0)
      let largeBuffer = new collections.ArrayBuffer(1024 * 1024 * 100)
      expect(largeBuffer.byteLength).assertEqual(1024 * 1024 * 100)
    })

    /**
     * @tc.name   ArrayBufferTest0400
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0400
     * @tc.desc   Verify constructor with float value 10.5 truncates to integer 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(10.5)
      expect(buffer.byteLength).assertEqual(10)
    })

    /**
     * @tc.name   ArrayBufferTest0500
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0500
     * @tc.desc   Verify constructor with negative value -1 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let buffer = new collections.ArrayBuffer(-1)
        expect().assertFail()
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   ArrayBufferTest0600
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0600
     * @tc.desc   Verify constructor with NaN truncates to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(NaN)
      expect(buffer.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   ArrayBufferTest0700
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0700
     * @tc.desc   Verify constructor with Infinity throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let buffer = new collections.ArrayBuffer(Infinity)
        expect().assertFail()
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   ArrayBufferTest0800
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0800
     * @tc.desc   Verify slice with only begin parameter slices from begin to end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let sliced = buffer.slice(512)
      expect(sliced.byteLength).assertEqual(512)
    })

    /**
     * @tc.name   ArrayBufferTest0900
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_0900
     * @tc.desc   Verify slice with begin and end parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let sliced = buffer.slice(100, 500)
      expect(sliced.byteLength).assertEqual(400)
    })

    /**
     * @tc.name   ArrayBufferTest1000
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1000
     * @tc.desc   Verify slice from 0 copies entire buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let sliced = buffer.slice(0)
      expect(sliced.byteLength).assertEqual(1024)
      expect(sliced !== buffer).assertTrue()
    })

    /**
     * @tc.name   ArrayBufferTest1100
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1100
     * @tc.desc   Verify slice with negative begin calculates from end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let sliced = buffer.slice(-100)
      expect(sliced.byteLength).assertEqual(100)
    })

    /**
     * @tc.name   ArrayBufferTest1200
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1200
     * @tc.desc   Verify slice with begin beyond range returns empty buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let s1 = buffer.slice(1024)
      expect(s1.byteLength).assertEqual(0)
      let s2 = buffer.slice(2000)
      expect(s2.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   ArrayBufferTest1300
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1300
     * @tc.desc   Verify slice with negative end calculates from end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let sliced = buffer.slice(0, -100)
      expect(sliced.byteLength).assertEqual(924)
    })

    /**
     * @tc.name   ArrayBufferTest1400
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1400
     * @tc.desc   Verify slice with end beyond range clamps to buffer length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let s1 = buffer.slice(0, 2000)
      expect(s1.byteLength).assertEqual(1024)
    })

    /**
     * @tc.name   ArrayBufferTest1500
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1500
     * @tc.desc   Verify slice with end less than begin returns empty buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let sliced = buffer.slice(500, 100)
      expect(sliced.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   ArrayBufferTest1600
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1600
     * @tc.desc   Verify slice returns new ArrayBuffer instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let sliced = buffer.slice(100, 500)
      expect(sliced !== buffer).assertTrue()
      expect(sliced instanceof collections.ArrayBuffer).assertTrue()
      expect(sliced.byteLength).assertEqual(400)
    })

    /**
     * @tc.name   ArrayBufferTest1700
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1700
     * @tc.desc   Verify slice copies data correctly via Int8Array view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(8)
      let int8View = new collections.Int8Array(buffer)
      int8View[0] = 10
      int8View[1] = 20
      let sliced = buffer.slice(0, 4)
      let slicedView = new collections.Int8Array(sliced)
      expect(slicedView[0]).assertEqual(10)
      expect(slicedView[1]).assertEqual(20)
    })

    /**
     * @tc.name   ArrayBufferTest1800
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1800
     * @tc.desc   Verify empty buffer slice returns zero-length buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(0)
      let sliced = buffer.slice(0)
      expect(sliced.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   ArrayBufferTest1900
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_1900
     * @tc.desc   Verify TaskPool passes ArrayBuffer and reads byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let task = new taskpool.Task(processBufferFunc, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(1024)
    })

    /**
     * @tc.name   ArrayBufferTest2000
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2000
     * @tc.desc   Verify multiple TaskPool tasks share same ArrayBuffer data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let view = new collections.Int8Array(buffer)
      view[0] = 100
      view[512] = -56
      let task1 = new taskpool.Task(readBufferAtOffsetFunc, buffer, 0)
      let task2 = new taskpool.Task(readBufferAtOffsetFunc, buffer, 512)
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      let results = await Promise.all([p1, p2])
      expect(results[0] as number).assertEqual(100)
      expect(results[1] as number).assertEqual(-56)
    })

    /**
     * @tc.name   ArrayBufferTest2100
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2100
     * @tc.desc   Verify multiple TypedArray views share same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(16)
      let int8View = new collections.Int8Array(buffer)
      let int32View = new collections.Int32Array(buffer)
      int32View[0] = 0x12345678
      expect(int8View[0]).assertEqual(0x78)
      expect(int8View[1]).assertEqual(0x56)
      expect(int8View[2]).assertEqual(0x34)
      expect(int8View[3]).assertEqual(0x12)
    })

    /**
     * @tc.name   ArrayBufferTest2200
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2200
     * @tc.desc   Verify cross-thread TypedArray modification via TaskPool is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(16)
      let view = new collections.Int32Array(buffer)
      view[0] = 0
      let task = new taskpool.Task(modifyInt32Func, buffer)
      await taskpool.execute(task)
      expect(view[0]).assertEqual(12345)
    })

    /**
     * @tc.name   ArrayBufferTest2300
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2300
     * @tc.desc   Verify concurrent slice from two TaskPool tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let task1 = new taskpool.Task(sliceBufferFunc, buffer)
      let task2 = new taskpool.Task(sliceBufferFunc, buffer)
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      let results = await Promise.all([p1, p2])
      expect((results[0] as collections.ArrayBuffer).byteLength).assertEqual(512)
      expect((results[1] as collections.ArrayBuffer).byteLength).assertEqual(512)
    })

    /**
     * @tc.name   ArrayBufferTest2400
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2400
     * @tc.desc   Verify multiple concurrent slice tasks with loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(sliceBufferFunc, buffer))
      }
      let promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      let results = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect((results[i] as collections.ArrayBuffer).byteLength).assertEqual(512)
      }
    })

    /**
     * @tc.name   ArrayBufferTest2500
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2500
     * @tc.desc   Verify TaskPool passes empty ArrayBuffer correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let buffer = new collections.ArrayBuffer(0)
      let task = new taskpool.Task(processBufferFunc, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(0)
    })

    /**
     * @tc.name   ArrayBufferTest2600
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2600
     * @tc.desc   Verify custom class extends collections.ArrayBuffer with @Sendable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayBufferTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let myBuffer = new CustomArrayBuffer(1024)
      expect(myBuffer.byteLength).assertEqual(1024)
      expect(myBuffer.getHalfLength()).assertEqual(512)
      expect(myBuffer instanceof collections.ArrayBuffer).assertTrue()
    })

    /**
     * @tc.name   ArrayBufferTest2700
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2700
     * @tc.desc   Verify instanceof check for collections.ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      expect(buffer instanceof collections.ArrayBuffer).assertTrue()
    })

    /**
     * @tc.name   ArrayBufferTest2800
     * @tc.number SUB_COLLECTIONS_ARRAYBUFFER_TEST_2800
     * @tc.desc   Verify typeof returns object for collections.ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayBufferTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(1024)
      expect(typeof buffer).assertEqual('object')
    })
  })
}
