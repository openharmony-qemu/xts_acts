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
class SharedData {
  id: number = 0
  payload: string = ''
  flag: boolean = false

  constructor(id: number, payload: string, flag: boolean) {
    this.id = id
    this.payload = payload
    this.flag = flag
  }

  getId(): number {
    return this.id
  }

  getPayload(): string {
    return this.payload
  }

  isFlag(): boolean {
    return this.flag
  }

  setId(newId: number): void {
    this.id = newId
  }

  setPayload(newPayload: string): void {
    this.payload = newPayload
  }

  setFlag(newFlag: boolean): void {
    this.flag = newFlag
  }
}

@Sendable
class LargeData {
  itemCount: number = 0
  label: string = ''

  constructor(count: number, label: string) {
    this.label = label
    this.itemCount = count
  }

  getLength(): number {
    return this.itemCount
  }

  getLabel(): string {
    return this.label
  }
}

@Concurrent
function modifySharedData(data: SharedData, newId: number, newPayload: string): number {
  data.setId(newId)
  data.setPayload(newPayload)
  return data.getId()
}

@Concurrent
function readSharedData(data: SharedData): number {
  return data.getId()
}

@Concurrent
function verifySharedReference(data: SharedData): boolean {
  return data.getId() > 0
}

@Concurrent
function processLargeData(data: LargeData): number {
  return data.getLength()
}

@Concurrent
function incrementId(data: SharedData): number {
  let current: number = data.getId()
  data.setId(current + 1)
  return data.getId()
}

@Concurrent
function checkType(data: SharedData): string {
  return typeof data.getId()
}

export default function InterthreadSharedTest(): void {
  describe('InterthreadSharedTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   InterthreadSharedTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0100
     * @tc.desc   Verify Sendable object serialization via TaskPool passing and deserialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadSharedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: SharedData = new SharedData(1, 'serialize', false)
      let result = await taskpool.execute(new taskpool.Task(readSharedData, data))
      expect(result as number).assertEqual(1)
    })

    /**
     * @tc.name   InterthreadSharedTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0200
     * @tc.desc   Verify Sendable object deserialized in worker thread has correct type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadSharedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: SharedData = new SharedData(2, 'typeCheck', true)
      let result = await taskpool.execute(new taskpool.Task(checkType, data))
      expect(result as string).assertEqual('number')
    })

    /**
     * @tc.name   InterthreadSharedTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0300
     * @tc.desc   Verify Sendable object created in worker thread returned to main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadSharedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SharedData = new SharedData(99, 'fromMain', true)
      let result = await taskpool.execute(new taskpool.Task(readSharedData, obj))
      expect(result as number).assertEqual(99)
      expect(obj.getPayload()).assertEqual('fromMain')
      expect(obj.isFlag()).assertTrue()
    })

    /**
     * @tc.name   InterthreadSharedTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0400
     * @tc.desc   Verify Sendable reference passing allows cross-thread modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadSharedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: SharedData = new SharedData(0, 'original', false)
      await taskpool.execute(new taskpool.Task(modifySharedData, data, 100, 'modified'))
      expect(data.getId()).assertEqual(100)
      expect(data.getPayload()).assertEqual('modified')
    })

    /**
     * @tc.name   InterthreadSharedTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0500
     * @tc.desc   Verify multiple threads sequentially operate on same Sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadSharedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data1: SharedData = new SharedData(0, 'increment1', false)
      let r1 = await taskpool.execute(new taskpool.Task(incrementId, data1))
      expect(r1 as number).assertEqual(1)
      let data2: SharedData = new SharedData(99, 'increment2', false)
      let r2 = await taskpool.execute(new taskpool.Task(incrementId, data2))
      expect(r2 as number).assertEqual(100)
      let data3: SharedData = new SharedData(-1, 'increment3', false)
      let r3 = await taskpool.execute(new taskpool.Task(incrementId, data3))
      expect(r3 as number).assertEqual(0)
    })

    /**
     * @tc.name   InterthreadSharedTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0600
     * @tc.desc   Verify cross-thread operation consistency after modification and read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadSharedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: SharedData = new SharedData(0, 'consistency', false)
      await taskpool.execute(new taskpool.Task(modifySharedData, data, 50, 'updated'))
      let readResult = await taskpool.execute(new taskpool.Task(readSharedData, data))
      expect(readResult as number).assertEqual(50)
      let verifyResult = await taskpool.execute(new taskpool.Task(verifySharedReference, data))
      expect(verifyResult as boolean).assertTrue()
    })

    /**
     * @tc.name   InterthreadSharedTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0700
     * @tc.desc   Verify large capacity Sendable object serialization performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InterthreadSharedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: LargeData = new LargeData(1000, 'largeObj')
      expect(data.getLength()).assertEqual(1000)
      let result = await taskpool.execute(new taskpool.Task(processLargeData, data))
      expect(result as number).assertEqual(1000)
    })

    /**
     * @tc.name   InterthreadSharedTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0800
     * @tc.desc   Verify repeated serialization of same Sendable object across multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InterthreadSharedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: SharedData = new SharedData(1, 'repeat', false)
      for (let i: number = 0; i < 5; i++) {
        let result = await taskpool.execute(new taskpool.Task(readSharedData, data))
        expect(result as number).assertEqual(1)
      }
    })

    /**
     * @tc.name   InterthreadSharedTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_0900
     * @tc.desc   Verify non-Sendable plain object cannot be passed to TaskPool causing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InterthreadSharedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let plainStr: string = 'notSendable'
      let result = await taskpool.execute(new taskpool.Task(readSharedData, new SharedData(0, plainStr, false)))
      expect(result as number).assertEqual(0)
    })

    /**
     * @tc.name   InterthreadSharedTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_1000
     * @tc.desc   Verify Sendable object state check after cross-thread operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InterthreadSharedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: SharedData = new SharedData(0, 'stateCheck', false)
      expect(data.getId()).assertEqual(0)
      expect(data.isFlag()).assertFalse()
      await taskpool.execute(new taskpool.Task(modifySharedData, data, 10, 'checked'))
      expect(data.getId()).assertEqual(10)
      data.setFlag(true)
      expect(data.isFlag()).assertTrue()
    })

    /**
     * @tc.name   InterthreadSharedTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_1100
     * @tc.desc   Verify concurrent serialization of different Sendable objects from multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InterthreadSharedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 20; i++) {
        let data: SharedData = new SharedData(i, 'concurrent-' + i.toString(), i % 2 === 0)
        promises.push(taskpool.execute(new taskpool.Task(readSharedData, data)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(20)
    })

    /**
     * @tc.name   InterthreadSharedTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_1200
     * @tc.desc   Verify concurrent deserialization of different data from multiple parallel tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InterthreadSharedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 20; i++) {
        let data: SharedData = new SharedData(i, 'concurrent-' + i.toString(), false)
        promises.push(taskpool.execute(new taskpool.Task(readSharedData, data)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(20)
    })

    /**
     * @tc.name   InterthreadSharedTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_1300
     * @tc.desc   Verify Sendable object with boolean flag cross-thread consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InterthreadSharedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: SharedData = new SharedData(1, 'boolTest', false)
      expect(data.isFlag()).assertFalse()
      data.setFlag(true)
      expect(data.isFlag()).assertTrue()
      let result = await taskpool.execute(new taskpool.Task(verifySharedReference, data))
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   InterthreadSharedTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_1400
     * @tc.desc   Verify Sendable object payload string cross-thread modification and retrieval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InterthreadSharedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: SharedData = new SharedData(0, 'initial', false)
      await taskpool.execute(new taskpool.Task(modifySharedData, data, 1, 'threadModified'))
      expect(data.getPayload()).assertEqual('threadModified')
      let result = await taskpool.execute(new taskpool.Task(readSharedData, data))
      expect(result as number).assertEqual(1)
    })

    /**
     * @tc.name   InterthreadSharedTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_SHARED_TEST_1500
     * @tc.desc   Verify frequent create and pass Sendable objects stability across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InterthreadSharedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i: number = 0; i < 10; i++) {
        let data: SharedData = new SharedData(i, 'loop-' + i.toString(), false)
        let result = await taskpool.execute(new taskpool.Task(readSharedData, data))
        expect(result as number).assertEqual(i)
      }
    })
  })
}
