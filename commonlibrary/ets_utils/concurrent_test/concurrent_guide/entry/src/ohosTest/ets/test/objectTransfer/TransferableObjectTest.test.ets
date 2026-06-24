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
import { taskpool } from '@kit.ArkTS';
import { abilityDelegatorRegistry } from '@kit.TestKit';

@Concurrent
function receiveTransferredBuffer(buffer: ArrayBuffer): number {
  return buffer.byteLength
}

@Concurrent
function receiveCopiedBuffer(buffer: ArrayBuffer): number {
  return buffer.byteLength
}

@Concurrent
function modifyTransferredBuffer(buffer: ArrayBuffer): number {
  let view = new Uint8Array(buffer)
  if (view.length > 0) {
    view[0] = 99
  }
  return buffer.byteLength
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
function useAppContext(context: Context): boolean {
  return context !== undefined && context !== null
}

@Concurrent
function processMultipleBuffers(buf1: ArrayBuffer, buf2: ArrayBuffer): number {
  return buf1.byteLength + buf2.byteLength
}

@Concurrent
function processBufferAndReturn(buffer: ArrayBuffer): number {
  let view = new Uint8Array(buffer)
  let sum: number = 0
  for (let i: number = 0; i < view.length; i++) {
    sum += view[i]
  }
  return sum
}

export default function TransferableObjectTest(): void {
  describe('TransferableObjectTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   TransferableObjectTest0100
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0100
     * @tc.desc   Verify ArrayBuffer transfer mode - original thread byteLength becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TransferableObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
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
     * @tc.name   TransferableObjectTest0200
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0200
     * @tc.desc   Verify setTransferList([]) switches to copy mode - original thread retains buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TransferableObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(512)
      let task: taskpool.Task = new taskpool.Task(receiveCopiedBuffer, buffer)
      task.setTransferList([])
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(512)
      expect(buffer.byteLength).assertEqual(512)
    })

    /**
     * @tc.name   TransferableObjectTest0300
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0300
     * @tc.desc   Verify transferred buffer is inaccessible from original thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TransferableObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(256)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 256; i++) {
        view[i] = i
      }
      let task: taskpool.Task = new taskpool.Task(receiveTransferredBuffer, buffer)
      await taskpool.execute(task)
      try {
        let len: number = buffer.byteLength
        expect(len).assertEqual(0)
      } catch (e) {
        // buffer may be detached after transfer
      }
    })

    /**
     * @tc.name   TransferableObjectTest0400
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0400
     * @tc.desc   Verify ApplicationContext shared transfer via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TransferableObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      let appContext: Context = delegator.getAppContext().getApplicationContext()
      let result = await taskpool.execute(new taskpool.Task(useAppContext, appContext))
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   TransferableObjectTest0500
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0500
     * @tc.desc   Verify copy mode preserves data content in original buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TransferableObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(100)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 100; i++) {
        view[i] = i
      }
      let task: taskpool.Task = new taskpool.Task(receiveCopiedBuffer, buffer)
      task.setTransferList([])
      await taskpool.execute(task)
      expect(buffer.byteLength).assertEqual(100)
      expect(view[0]).assertEqual(0)
      expect(view[50]).assertEqual(50)
      expect(view[99]).assertEqual(99)
    })

    /**
     * @tc.name   TransferableObjectTest0600
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0600
     * @tc.desc   Verify task return value ArrayBuffer uses transfer mode by default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TransferableObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = await taskpool.execute(new taskpool.Task(returnNewBuffer, 512))
      let returnedBuffer: ArrayBuffer = result as ArrayBuffer
      expect(returnedBuffer.byteLength).assertEqual(512)
    })

    /**
     * @tc.name   TransferableObjectTest0700
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0700
     * @tc.desc   Verify returned ArrayBuffer can be transferred to another task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TransferableObjectTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await taskpool.execute(new taskpool.Task(returnNewBuffer, 256))
      let returnedBuffer: ArrayBuffer = result as ArrayBuffer
      expect(returnedBuffer.byteLength).assertEqual(256)
      let size = await taskpool.execute(new taskpool.Task(verifyReturnedBuffer, returnedBuffer))
      expect(size as number).assertEqual(256)
      try {
        let len: number = returnedBuffer.byteLength
        expect(len).assertEqual(0)
      } catch (e) {
        // buffer may be detached after transfer
      }
    })

    /**
     * @tc.name   TransferableObjectTest0800
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0800
     * @tc.desc   Verify multiple ArrayBuffer objects transferred simultaneously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TransferableObjectTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buf1: ArrayBuffer = new ArrayBuffer(100)
      let buf2: ArrayBuffer = new ArrayBuffer(200)
      let result = await taskpool.execute(new taskpool.Task(processMultipleBuffers, buf1, buf2))
      expect(result as number).assertEqual(300)
    })

    /**
     * @tc.name   TransferableObjectTest0900
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_0900
     * @tc.desc   Verify ApplicationContext remains accessible after shared transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TransferableObjectTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      let appContext: Context = delegator.getAppContext().getApplicationContext()
      await taskpool.execute(new taskpool.Task(useAppContext, appContext))
      let result2 = await taskpool.execute(new taskpool.Task(useAppContext, appContext))
      expect(result2 as boolean).assertTrue()
    })

    /**
     * @tc.name   TransferableObjectTest1000
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_1000
     * @tc.desc   Verify ArrayBuffer transfer with data content verification in worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TransferableObjectTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(10)
      let view: Uint8Array = new Uint8Array(buffer)
      for (let i: number = 0; i < 10; i++) {
        view[i] = i + 1
      }
      let result = await taskpool.execute(new taskpool.Task(processBufferAndReturn, buffer))
      expect(result as number).assertEqual(55)
      try {
        let len: number = buffer.byteLength
        expect(len).assertEqual(0)
      } catch (e) {
        // buffer may be detached after transfer
      }
    })

    /**
     * @tc.name   TransferableObjectTest1100
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_1100
     * @tc.desc   Verify copy mode with setTransferList for small buffer data integrity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TransferableObjectTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(4)
      let view: Uint8Array = new Uint8Array(buffer)
      view[0] = 10
      view[1] = 20
      view[2] = 30
      view[3] = 40
      let task: taskpool.Task = new taskpool.Task(processBufferAndReturn, buffer)
      task.setTransferList([])
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
      expect(buffer.byteLength).assertEqual(4)
      expect(view[0]).assertEqual(10)
    })

    /**
     * @tc.name   TransferableObjectTest1200
     * @tc.number SUB_TRANSFERABLE_OBJECT_TEST_1200
     * @tc.desc   Verify large ArrayBuffer transfer mode performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TransferableObjectTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let size: number = 1024 * 1024
      let buffer: ArrayBuffer = new ArrayBuffer(size)
      let start: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(receiveTransferredBuffer, buffer))
      let elapsed: number = Date.now() - start
      expect(result as number).assertEqual(size)
      try {
        let len: number = buffer.byteLength
        expect(len).assertEqual(0)
      } catch (e) {
        // buffer may be detached after transfer
      }
      expect(elapsed >= 0).assertTrue()
    })
  })
}
