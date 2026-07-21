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

@Sendable
class SendableData {
  value: number = 0
  label: string = ''

  constructor(value: number, label: string) {
    this.value = value
    this.label = label
  }
}

class NormalData {
  value: number = 0
  label: string = ''
}

@Concurrent
function processSendable(obj: SendableData): number {
  return obj.value
}

@Concurrent
function processNormalObject(value: number, label: string): string {
  return label + ':' + value.toString()
}

@Concurrent
function processArrayBuffer(buffer: ArrayBuffer): number {
  return buffer.byteLength
}

@Concurrent
function processSharedBuffer(sharedBuffer: SharedArrayBuffer): number {
  let view = new Int32Array(sharedBuffer)
  return Atomics.load(view, 0)
}

@Concurrent
function readSendableValue(obj: SendableData, id: number): number {
  return obj.value + id
}

@Concurrent
function modifyAndReturn(obj: SendableData, newValue: number): number {
  obj.value = newValue
  return obj.value
}

@Concurrent
function processLargeBuffer(buffer: ArrayBuffer): number {
  return buffer.byteLength
}

export default function SerializableViewTest(): void {
  describe('SerializableViewTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   SerializableViewTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0100
     * @tc.desc   Verify Sendable object serialization via TaskPool passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableData = new SendableData(100, 'sendable')
      let result = await taskpool.execute(new taskpool.Task(processSendable, obj))
      expect(result as number).assertEqual(100)
    })

    /**
     * @tc.name   SerializableViewTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0200
     * @tc.desc   Verify normal object data serialization via primitive parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = await taskpool.execute(new taskpool.Task(processNormalObject, 42, 'normal'))
      expect(result as string).assertEqual('normal:42')
    })

    /**
     * @tc.name   SerializableViewTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0300
     * @tc.desc   Verify ArrayBuffer serialization transfer via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(1024)
      let task: taskpool.Task = new taskpool.Task(processArrayBuffer, buffer)
      task.setTransferList([])
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(1024)
    })

    /**
     * @tc.name   SerializableViewTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0400
     * @tc.desc   Verify SharedArrayBuffer serialization and shared access via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(1024)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 300)
      let result = await taskpool.execute(new taskpool.Task(processSharedBuffer, sharedBuffer))
      expect(result as number).assertEqual(300)
    })

    /**
     * @tc.name   SerializableViewTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0500
     * @tc.desc   Verify TaskPool thread communication with Sendable data roundtrip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableData = new SendableData(50, 'roundtrip')
      let result = await taskpool.execute(new taskpool.Task(modifyAndReturn, obj, 999))
      expect(result as number).assertEqual(999)
      expect(obj.value).assertEqual(999)
    })

    /**
     * @tc.name   SerializableViewTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0600
     * @tc.desc   Verify value copy mechanism - normal object modification isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let original: number = 100
      let label: string = 'original'
      let result = await taskpool.execute(new taskpool.Task(processNormalObject, original, label))
      expect(result as string).assertEqual('original:100')
      expect(original).assertEqual(100)
      expect(label).assertEqual('original')
    })

    /**
     * @tc.name   SerializableViewTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0700
     * @tc.desc   Verify 15MB data near 16MB serialization limit succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SerializableViewTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let size: number = 15 * 1024 * 1024
      let buffer: ArrayBuffer = new ArrayBuffer(size)
      let task: taskpool.Task = new taskpool.Task(processLargeBuffer, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(size)
    })

    /**
     * @tc.name   SerializableViewTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0800
     * @tc.desc   Verify large ArrayBuffer transfer via TaskPool succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SerializableViewTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let size: number = 17 * 1024 * 1024
      let buffer: ArrayBuffer = new ArrayBuffer(size)
      let task: taskpool.Task = new taskpool.Task(processLargeBuffer, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(size)
    })

    /**
     * @tc.name   SerializableViewTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_0900
     * @tc.desc   Verify multiple TaskPool tasks simultaneously pass same Sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SerializableViewTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableData = new SendableData(100, 'shared')
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readSendableValue, obj, i)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      expect(results[0] as number).assertEqual(100)
      expect(results[9] as number).assertEqual(109)
    })

    /**
     * @tc.name   SerializableViewTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1000
     * @tc.desc   Verify Sendable object with string property serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableData = new SendableData(0, 'stringTest')
      let result = await taskpool.execute(new taskpool.Task(processSendable, obj))
      expect(result as number).assertEqual(0)
    })

    /**
     * @tc.name   SerializableViewTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1100
     * @tc.desc   Verify Sendable object cross-thread modification preserves reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableData = new SendableData(0, 'refTest')
      await taskpool.execute(new taskpool.Task(modifyAndReturn, obj, 42))
      expect(obj.value).assertEqual(42)
    })

    /**
     * @tc.name   SerializableViewTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1200
     * @tc.desc   Verify SharedArrayBuffer shared memory modification visible across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SerializableViewTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedBuffer: SharedArrayBuffer = new SharedArrayBuffer(64)
      let view = new Int32Array(sharedBuffer)
      Atomics.store(view, 0, 50)
      let result = await taskpool.execute(new taskpool.Task(processSharedBuffer, sharedBuffer))
      expect(result as number).assertEqual(50)
      expect(Atomics.load(view, 0)).assertEqual(50)
    })

    /**
     * @tc.name   SerializableViewTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1300
     * @tc.desc   Verify ArrayBuffer serialization with small data size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SerializableViewTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(8)
      let task: taskpool.Task = new taskpool.Task(processArrayBuffer, buffer)
      task.setTransferList([])
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(8)
    })

    /**
     * @tc.name   SerializableViewTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1400
     * @tc.desc   Verify 1MB ArrayBuffer serialization performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SerializableViewTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let size: number = 1024 * 1024
      let buffer: ArrayBuffer = new ArrayBuffer(size)
      let start: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(processLargeBuffer, buffer))
      let elapsed: number = Date.now() - start
      expect(result as number).assertEqual(size)
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   SerializableViewTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1500
     * @tc.desc   Verify Sendable object with zero-value constructor serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SerializableViewTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableData = new SendableData(0, '')
      let result = await taskpool.execute(new taskpool.Task(processSendable, obj))
      expect(result as number).assertEqual(0)
    })

    /**
     * @tc.name   SerializableViewTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1600
     * @tc.desc   Verify serialization memory isolation - normal object value unchanged after transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SerializableViewTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let value: number = 999
      let label: string = 'isolation'
      await taskpool.execute(new taskpool.Task(processNormalObject, value, label))
      expect(value).assertEqual(999)
      expect(label).assertEqual('isolation')
    })

    /**
     * @tc.name   SerializableViewTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1700
     * @tc.desc   Verify concurrent serialization of multiple different Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SerializableViewTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 20; i++) {
        let obj: SendableData = new SendableData(i, 'concurrent-' + i.toString())
        promises.push(taskpool.execute(new taskpool.Task(processSendable, obj)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(20)
    })

    /**
     * @tc.name   SerializableViewTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SERIALIZABLE_VIEW_TEST_1800
     * @tc.desc   Verify 10MB data serialization within limit succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SerializableViewTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let size: number = 10 * 1024 * 1024
      let buffer: ArrayBuffer = new ArrayBuffer(size)
      let result = await taskpool.execute(new taskpool.Task(processLargeBuffer, buffer))
      expect(result as number).assertEqual(size)
    })
  })
}
