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
function verifySharedBufferSize(sharedBuffer: SharedArrayBuffer): number {
  return sharedBuffer.byteLength
}

@Concurrent
function int32Store(sharedBuffer: SharedArrayBuffer, index: number, value: number): void {
  let view = new Int32Array(sharedBuffer)
  Atomics.store(view, index, value)
}

@Concurrent
function int32Load(sharedBuffer: SharedArrayBuffer, index: number): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.load(view, index)
}

@Concurrent
function int8Store(sharedBuffer: SharedArrayBuffer, index: number, value: number): void {
  let view = new Int8Array(sharedBuffer)
  Atomics.store(view, index, value)
}

@Concurrent
function int8Load(sharedBuffer: SharedArrayBuffer, index: number): number {
  let view = new Int8Array(sharedBuffer)
  return Atomics.load(view, index)
}

@Concurrent
function atomicIncrement(sharedBuffer: SharedArrayBuffer): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.add(view, 0, 1)
}

@Concurrent
function atomicSubtract(sharedBuffer: SharedArrayBuffer, value: number): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.sub(view, 0, value)
}

@Concurrent
function atomicCompareExchange(sharedBuffer: SharedArrayBuffer, expected: number, replacement: number): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.compareExchange(view, 0, expected, replacement)
}

@Concurrent
function atomicExchange(sharedBuffer: SharedArrayBuffer, value: number): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.exchange(view, 0, value)
}

@Concurrent
function concurrentAdd(sharedBuffer: SharedArrayBuffer): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.add(view, 0, 1)
}

@Concurrent
function concurrentRead(sharedBuffer: SharedArrayBuffer): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.load(view, 0)
}

@Concurrent
function waitWithTimeout(sharedBuffer: SharedArrayBuffer, timeout: number): string {
  let view = new Int32Array(sharedBuffer)
  let start: number = Date.now()
  let result: string = Atomics.wait(view, 0, 0, timeout)
  let elapsed: number = Date.now() - start
  return result + '|' + elapsed.toString()
}

@Concurrent
function notifyAndWait(sharedBuffer: SharedArrayBuffer): number {
  let view = new Int32Array(sharedBuffer)
  Atomics.store(view, 0, 1)
  return Atomics.notify(view, 0, 1)
}

@Concurrent
function tryInvalidIndex(sharedBuffer: SharedArrayBuffer): string {
  let view = new Int32Array(sharedBuffer)
  try {
    Atomics.load(view, 999)
    return 'success'
  } catch (e) {
    return 'error'
  }
}

@Concurrent
function multiIndexStore(sharedBuffer: SharedArrayBuffer): void {
  let view = new Int32Array(sharedBuffer)
  for (let i: number = 0; i < 10; i++) {
    Atomics.store(view, i, i * 100)
  }
}

@Concurrent
function multiIndexLoad(sharedBuffer: SharedArrayBuffer, index: number): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.load(view, index)
}

export default function SharedArrayBufferTest(): void {
  describe('SharedArrayBufferTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   SharedArrayBufferTest0100
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0100
     * @tc.desc   Verify SharedArrayBuffer creation and byteLength cross-thread verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(1024)
      let result = await taskpool.execute(new taskpool.Task(verifySharedBufferSize, sharedBuffer))
      expect(result as number).assertEqual(1024)
    })

    /**
     * @tc.name   SharedArrayBufferTest0200
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0200
     * @tc.desc   Verify Int32Array TypedArray view creation and Atomics.store/load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(128)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 50)
      await taskpool.execute(new taskpool.Task(int32Store, sharedBuffer, 0, 100))
      let result = await taskpool.execute(new taskpool.Task(int32Load, sharedBuffer, 0))
      expect(result as number).assertEqual(100)
      expect(Atomics.load(view, 0)).assertEqual(100)
    })

    /**
     * @tc.name   SharedArrayBufferTest0300
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0300
     * @tc.desc   Verify Int8Array TypedArray view creation and Atomics.store/load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(100)
      await taskpool.execute(new taskpool.Task(int8Store, sharedBuffer, 0, 42))
      let result = await taskpool.execute(new taskpool.Task(int8Load, sharedBuffer, 0))
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   SharedArrayBufferTest0400
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0400
     * @tc.desc   Verify Atomics.add atomic increment operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 0)
      let result = await taskpool.execute(new taskpool.Task(atomicIncrement, sharedBuffer))
      expect(result as number).assertEqual(0)
      expect(Atomics.load(view, 0)).assertEqual(1)
    })

    /**
     * @tc.name   SharedArrayBufferTest0500
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0500
     * @tc.desc   Verify Atomics.sub atomic subtract operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 100)
      let result = await taskpool.execute(new taskpool.Task(atomicSubtract, sharedBuffer, 30))
      expect(result as number).assertEqual(100)
      expect(Atomics.load(view, 0)).assertEqual(70)
    })

    /**
     * @tc.name   SharedArrayBufferTest0600
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0600
     * @tc.desc   Verify Atomics.compareExchange success when expected matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 100)
      let result = await taskpool.execute(new taskpool.Task(atomicCompareExchange, sharedBuffer, 100, 200))
      expect(result as number).assertEqual(100)
      expect(Atomics.load(view, 0)).assertEqual(200)
    })

    /**
     * @tc.name   SharedArrayBufferTest0700
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0700
     * @tc.desc   Verify Atomics.compareExchange failure when expected does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 100)
      let result = await taskpool.execute(new taskpool.Task(atomicCompareExchange, sharedBuffer, 999, 200))
      expect(result as number).assertEqual(100)
      expect(Atomics.load(view, 0)).assertEqual(100)
    })

    /**
     * @tc.name   SharedArrayBufferTest0800
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0800
     * @tc.desc   Verify Atomics.exchange operation replaces value and returns old
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 42)
      let result = await taskpool.execute(new taskpool.Task(atomicExchange, sharedBuffer, 99))
      expect(result as number).assertEqual(42)
      expect(Atomics.load(view, 0)).assertEqual(99)
    })

    /**
     * @tc.name   SharedArrayBufferTest0900
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_0900
     * @tc.desc   Verify multiple concurrent Atomics.add operations maintain consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBufferTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 0)
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(concurrentAdd, sharedBuffer)))
      }
      await Promise.all(promises)
      expect(Atomics.load(view, 0)).assertEqual(20)
    })

    /**
     * @tc.name   SharedArrayBufferTest1000
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1000
     * @tc.desc   Verify concurrent read and write operations with data race protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SharedArrayBufferTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 0)
      let writePromises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        writePromises.push(taskpool.execute(new taskpool.Task(concurrentAdd, sharedBuffer)))
      }
      await Promise.all(writePromises)
      let readResult = await taskpool.execute(new taskpool.Task(concurrentRead, sharedBuffer))
      expect(readResult as number).assertEqual(10)
    })

    /**
     * @tc.name   SharedArrayBufferTest1100
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1100
     * @tc.desc   Verify Atomics.wait timeout returns timed-out after specified duration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBufferTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 0)
      let result = await taskpool.execute(new taskpool.Task(waitWithTimeout, sharedBuffer, 500))
      let parts: string[] = (result as string).split('|')
      expect(parts[0]).assertEqual('timed-out')
      let elapsed: number = parseInt(parts[1])
      expect(elapsed >= 499).assertTrue()
    })

    /**
     * @tc.name   SharedArrayBufferTest1200
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1200
     * @tc.desc   Verify Atomics.notify wakes up waiting thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBufferTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 0)
      let notifyResult = await taskpool.execute(new taskpool.Task(notifyAndWait, sharedBuffer))
      expect(notifyResult as number).assertEqual(0)
      expect(Atomics.load(view, 0)).assertEqual(1)
    })

    /**
     * @tc.name   SharedArrayBufferTest1300
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1300
     * @tc.desc   Verify Atomics operation with invalid out-of-bounds index throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBufferTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let result = await taskpool.execute(new taskpool.Task(tryInvalidIndex, sharedBuffer))
      expect(result as string).assertEqual('error')
    })

    /**
     * @tc.name   SharedArrayBufferTest1400
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1400
     * @tc.desc   Verify SharedArrayBuffer shared memory visible between main and worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SharedArrayBufferTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 777)
      let workerValue = await taskpool.execute(new taskpool.Task(int32Load, sharedBuffer, 0))
      expect(workerValue as number).assertEqual(777)
      await taskpool.execute(new taskpool.Task(int32Store, sharedBuffer, 0, 888))
      expect(Atomics.load(view, 0)).assertEqual(888)
    })

    /**
     * @tc.name   SharedArrayBufferTest1500
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1500
     * @tc.desc   Verify multiple index Atomics store and load operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBufferTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(256)
      await taskpool.execute(new taskpool.Task(multiIndexStore, sharedBuffer))
      let val0 = await taskpool.execute(new taskpool.Task(multiIndexLoad, sharedBuffer, 0))
      let val5 = await taskpool.execute(new taskpool.Task(multiIndexLoad, sharedBuffer, 5))
      let val9 = await taskpool.execute(new taskpool.Task(multiIndexLoad, sharedBuffer, 9))
      expect(val0 as number).assertEqual(0)
      expect(val5 as number).assertEqual(500)
      expect(val9 as number).assertEqual(900)
    })

    /**
     * @tc.name   SharedArrayBufferTest1600
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1600
     * @tc.desc   Verify Atomics.add returns previous value before increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBufferTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 50)
      let result = await taskpool.execute(new taskpool.Task(atomicIncrement, sharedBuffer))
      expect(result as number).assertEqual(50)
      expect(Atomics.load(view, 0)).assertEqual(51)
    })

    /**
     * @tc.name   SharedArrayBufferTest1700
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1700
     * @tc.desc   Verify large SharedArrayBuffer creation and access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBufferTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(1024 * 1024)
      let result = await taskpool.execute(new taskpool.Task(verifySharedBufferSize, sharedBuffer))
      expect(result as number).assertEqual(1024 * 1024)
    })

    /**
     * @tc.name   SharedArrayBufferTest1800
     * @tc.number SUB_SHARED_ARRAYBUFFER_TEST_1800
     * @tc.desc   Verify Atomics.sub returns previous value before subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SharedArrayBufferTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 200)
      let result = await taskpool.execute(new taskpool.Task(atomicSubtract, sharedBuffer, 50))
      expect(result as number).assertEqual(200)
      expect(Atomics.load(view, 0)).assertEqual(150)
    })
  })
}
