/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class BoundaryPropertyClass {
  public properties: collections.Map<string, number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(properties: collections.Map<string, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.properties = properties
    this.lock_ = lock_
  }


  async setProperty(key: string, value: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.properties.set(key, value)
    })
  }

  async getProperty(key: string): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => this.properties.get(key))
  }

  async getPropertyCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.properties.size)
  }
}

@Sendable
class HighPropertyObject {
  public props: collections.Map<string, number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(props: collections.Map<string, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.props = props
    this.lock_ = lock_
  }


  async incrementProp(key: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const current: number | undefined = this.props.get(key)
      const val: number = current !== undefined ? current : 0
      this.props.set(key, val + 1)
      return val + 1
    })
  }

  async getProp(key: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      const v: number | undefined = this.props.get(key)
      return v !== undefined ? v : 0
    })
  }
}

@Sendable
class TransferableObject {
  public props: collections.Map<string, number>

  constructor(props: collections.Map<string, number>) {
    this.props = props
  }


  setAllProps(count: number): void {
    for (let i = 0; i < count; i++) {
      this.props.set(`key_${i}`, i)
    }
  }

  getPropertyCount(): number {
    return this.props.size
  }
}

@Concurrent
async function setPropertyTask(obj: BoundaryPropertyClass, key: string, value: number): Promise<void> {
  await obj.setProperty(key, value)
}

@Concurrent
async function getPropertyTask(obj: BoundaryPropertyClass, key: string): Promise<number | undefined> {
  return await obj.getProperty(key)
}

@Concurrent
async function concurrentIncrement(o: HighPropertyObject, k: string): Promise<void> {
  await o.incrementProp(k)
}

@Concurrent
function receiveAndCount(o: TransferableObject): number {
  return o.getPropertyCount()
}

@Concurrent
function readArrayLength(arr: collections.Array<number>): number {
  return arr.length
}

@Concurrent
function readMapSize(m: collections.Map<string, number>): number {
  return m.size
}

@Concurrent
function readSetSize(s: collections.Set<number>): number {
  return s.size
}

export default function BuiltinsDictModeTriggerTest(): void {
  describe('BuiltinsDictModeTriggerTest', (): void => {
    /**
     * @tc.name   testDictModeTrigger0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0100
     * @tc.desc   Verify property access correctness with 100 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 100; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(100)
      for (let i = 0; i < 100; i += 10) {
        expect(await testObj.getProperty(`prop_${i}`)).assertEqual(i)
      }
    })

    /**
     * @tc.name   testDictModeTrigger0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0200
     * @tc.desc   Verify concurrent read with 512 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 512; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(512)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(getPropertyTask, testObj, `prop_${i * 50}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < 10; i++) {
        expect(results[i] as number).assertEqual(i * 50)
      }
    })

    /**
     * @tc.name   testDictModeTrigger0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0300
     * @tc.desc   Verify boundary value with 1024 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1024; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(1024)
      expect(await testObj.getProperty('prop_1023')).assertEqual(1023)
      expect(await testObj.getProperty('prop_1022')).assertEqual(1022)
    })

    /**
     * @tc.name   testDictModeTrigger0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0400
     * @tc.desc   Verify dictionary mode trigger with 1025 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(1025)
      expect(await testObj.getProperty('prop_1024')).assertEqual(1024)
      expect(await testObj.getProperty('prop_0')).assertEqual(0)
      expect(await testObj.getProperty('prop_512')).assertEqual(512)
    })

    /**
     * @tc.name   testDictModeTrigger0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0500
     * @tc.desc   Verify concurrent access with 2048 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      const batchSize: number = 256
      for (let batch = 0; batch < 8; batch++) {
        const tasks: taskpool.Task[] = []
        for (let i = batch * batchSize; i < (batch + 1) * batchSize; i++) {
          tasks.push(new taskpool.Task(setPropertyTask, testObj, `prop_${i}`, i))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
      }
      expect(await testObj.getPropertyCount()).assertEqual(2048)
      expect(await testObj.getProperty('prop_2047')).assertEqual(2047)
    })

    /**
     * @tc.name   testDictModeTrigger0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0600
     * @tc.desc   Verify extreme property count with 4096 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 4096; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(4096)
      const samples: number[] = [0, 1024, 2048, 3072, 4095]
      for (let idx = 0; idx < samples.length; idx++) {
        expect(await testObj.getProperty(`prop_${samples[idx]}`)).assertEqual(samples[idx])
      }
    })

    /**
     * @tc.name   testDictModeTrigger0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0700
     * @tc.desc   Verify SendableArray with 1024 elements at boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr: collections.Array<number> = new collections.Array<number>()
      for (let i = 0; i < 1024; i++) {
        arr.push(i)
      }
      expect(arr.length).assertEqual(1024)
      expect(arr[1023]).assertEqual(1023)
    })

    /**
     * @tc.name   testDictModeTrigger0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0800
     * @tc.desc   Verify SendableArray with 1025 elements exceeding boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr: collections.Array<number> = new collections.Array<number>()
      for (let i = 0; i < 1025; i++) {
        arr.push(i)
      }
      expect(arr.length).assertEqual(1025)
      expect(arr[1024]).assertEqual(1024)
    })

    /**
     * @tc.name   testDictModeTrigger0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0900
     * @tc.desc   Verify SendableMap with 1024 key-value pairs at boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map: collections.Map<string, number> = new collections.Map<string, number>()
      for (let i = 0; i < 1024; i++) {
        map.set(`key_${i}`, i)
      }
      expect(map.size).assertEqual(1024)
      expect(map.get('key_1023')).assertEqual(1023)
    })

    /**
     * @tc.name   testDictModeTrigger1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1000
     * @tc.desc   Verify SendableMap with 1025 key-value pairs exceeding boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map: collections.Map<string, number> = new collections.Map<string, number>()
      for (let i = 0; i < 1025; i++) {
        map.set(`key_${i}`, i)
      }
      expect(map.size).assertEqual(1025)
      expect(map.get('key_1024')).assertEqual(1024)
    })

    /**
     * @tc.name   testDictModeTrigger1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1100
     * @tc.desc   Verify SendableSet with 1024 elements at boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const set: collections.Set<number> = new collections.Set<number>()
      for (let i = 0; i < 1024; i++) {
        set.add(i)
      }
      expect(set.size).assertEqual(1024)
      expect(set.has(1023)).assertTrue()
    })

    /**
     * @tc.name   testDictModeTrigger1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1200
     * @tc.desc   Verify SendableSet with 1025 elements exceeding boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const set: collections.Set<number> = new collections.Set<number>()
      for (let i = 0; i < 1025; i++) {
        set.add(i)
      }
      expect(set.size).assertEqual(1025)
      expect(set.has(1024)).assertTrue()
    })

    /**
     * @tc.name   testDictModeTrigger1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1300
     * @tc.desc   Verify concurrent read/write on 1025-property object with AsyncLock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj: HighPropertyObject = new HighPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await obj.incrementProp(`prop_${i}`)
      }
      const tasks: taskpool.Task[] = []
      for (let round = 0; round < 3; round++) {
        for (let i = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(concurrentIncrement, obj, `prop_${i}`))
        }
      }
      const batchSize: number = 30
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      const samples: number[] = [0, 5, 9]
      for (let idx = 0; idx < samples.length; idx++) {
        expect(await obj.getProp(`prop_${samples[idx]}`)).assertEqual(4)
      }
    })

    /**
     * @tc.name   testDictModeTrigger1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1400
     * @tc.desc   Verify property search in dictionary mode with 1025 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getProperty('prop_0')).assertEqual(0)
      expect(await testObj.getProperty('prop_512')).assertEqual(512)
      expect(await testObj.getProperty('prop_1024')).assertEqual(1024)
      expect(await testObj.getProperty('nonexistent') === undefined).assertTrue()
    })

    /**
     * @tc.name   testDictModeTrigger1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1500
     * @tc.desc   Verify cross-thread transfer of 1025-property object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const obj: TransferableObject = new TransferableObject(new collections.Map<string, number>())
      obj.setAllProps(1025)
      const task: taskpool.Task = new taskpool.Task(receiveAndCount, obj)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(1025)
    })

    /**
     * @tc.name   testDictModeTrigger1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1600
     * @tc.desc   Verify large array traversal with 4096 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Array<number> = new collections.Array<number>()
      for (let i = 0; i < 4096; i++) {
        arr.push(i)
      }
      let sum: number = 0
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i]
      }
      expect(sum).assertEqual(4095 * 4096 / 2)
    })

    /**
     * @tc.name   testDictModeTrigger1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1700
     * @tc.desc   Verify large Map deletion with 4096 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map: collections.Map<string, number> = new collections.Map<string, number>()
      for (let i = 0; i < 4096; i++) {
        map.set(`key_${i}`, i)
      }
      expect(map.size).assertEqual(4096)
      for (let i = 0; i < 1024; i++) {
        map.delete(`key_${i}`)
      }
      expect(map.size).assertEqual(3072)
      expect(map.get('key_0') === undefined).assertTrue()
      expect(map.get('key_1024')).assertEqual(1024)
    })

    /**
     * @tc.name   testDictModeTrigger1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1800
     * @tc.desc   Verify cross-thread read of large Array with 2048 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Array<number> = new collections.Array<number>()
      for (let i = 0; i < 2048; i++) {
        arr.push(i)
      }
      const task: taskpool.Task = new taskpool.Task(readArrayLength, arr)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(2048)
    })
  })
}
