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


  async deleteProperty(key: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.properties.delete(key))
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

@Sendable
class SharedArrayWrapper {
  public arr: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(arr: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.arr = arr
    this.lock_ = lock_
  }


  async pushValue(v: number): Promise<number> {
    return await this.lock_.lockAsync((): number => this.arr.push(v))
  }

  async getLength(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.arr.length)
  }

  getValue(index: number): number {
    return this.arr[index]
  }
}

@Sendable
class SharedMapWrapper {
  public map: collections.Map<string, number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(map: collections.Map<string, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.map = map
    this.lock_ = lock_
  }


  async setKeyValue(k: string, v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.map.set(k, v)
    })
  }

  async getValue(k: string): Promise<number | undefined> {
    return await this.lock_.lockAsync((): number | undefined => this.map.get(k))
  }

  async getSize(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.map.size)
  }
}

@Sendable
class SharedSetWrapper {
  public set: collections.Set<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(set: collections.Set<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.set = set
    this.lock_ = lock_
  }


  async addValue(v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.set.add(v)
    })
  }

  async removeValue(v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.set.delete(v)
    })
  }

  async getSize(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.set.size)
  }

  async hasValue(v: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.set.has(v))
  }
}

@Sendable
class SearchableObject {
  public props: collections.Map<string, string>

  constructor(props: collections.Map<string, string>) {
    this.props = props
  }


  setProp(key: string, value: string): void {
    this.props.set(key, value)
  }

  findProp(prefix: string): collections.Array<string> {
    const results: collections.Array<string> = new collections.Array<string>()
    this.props.forEach((value: string, key: string): void => {
      if (key.startsWith(prefix)) {
        results.push(value)
      }
    })
    return results
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

@Concurrent
async function pushArrayValueTask(w: SharedArrayWrapper, v: number): Promise<void> {
  await w.pushValue(v)
}

@Concurrent
async function setMapValueTask(w: SharedMapWrapper, k: string, v: number): Promise<void> {
  await w.setKeyValue(k, v)
}

@Concurrent
async function setAddValueTask(w: SharedSetWrapper, v: number): Promise<void> {
  await w.addValue(v)
}

@Concurrent
async function setRemoveValueTask(w: SharedSetWrapper, v: number): Promise<void> {
  await w.removeValue(v)
}

@Concurrent
async function getMapValueTask(w: SharedMapWrapper, k: string): Promise<number | undefined> {
  return await w.getValue(k)
}

export default function DictModeTriggerTest(): void {
  describe('DictModeTriggerTest', (): void => {
    /**
     * @tc.name   testDictModeTrigger0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0100
     * @tc.desc   Verify property access correctness with 100 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 100; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(100)
      for (let i = 0; i < 100; i += 10) {
        expect(await testObj.getProperty(`prop_${i}`)).assertEqual(i)
      }
      done()
    })

    /**
     * @tc.name   testDictModeTrigger0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0200
     * @tc.desc   Verify concurrent read with 512 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
      done()
    })

    /**
     * @tc.name   testDictModeTrigger0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0300
     * @tc.desc   Verify boundary value with 1024 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1024; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(1024)
      expect(await testObj.getProperty('prop_1023')).assertEqual(1023)
      expect(await testObj.getProperty('prop_1022')).assertEqual(1022)
      done()
    })

    /**
     * @tc.name   testDictModeTrigger0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0400
     * @tc.desc   Verify dictionary mode trigger with 1025 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(1025)
      expect(await testObj.getProperty('prop_1024')).assertEqual(1024)
      expect(await testObj.getProperty('prop_0')).assertEqual(0)
      expect(await testObj.getProperty('prop_512')).assertEqual(512)
      done()
    })

    /**
     * @tc.name   testDictModeTrigger0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0500
     * @tc.desc   Verify concurrent access with 2048 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
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
      done()
    })

    /**
     * @tc.name   testDictModeTrigger0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0600
     * @tc.desc   Verify extreme property count with 4096 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 4096; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getPropertyCount()).assertEqual(4096)
      const samples: number[] = [0, 1024, 2048, 3072, 4095]
      for (let idx = 0; idx < samples.length; idx++) {
        expect(await testObj.getProperty(`prop_${samples[idx]}`)).assertEqual(samples[idx])
      }
      done()
    })

    /**
     * @tc.name   testDictModeTrigger0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_0700
     * @tc.desc   Verify SendableArray with 1024 elements at boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDictModeTrigger0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
    it('testDictModeTrigger0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
    it('testDictModeTrigger0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
    it('testDictModeTrigger1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
    it('testDictModeTrigger1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
    it('testDictModeTrigger1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
    it('testDictModeTrigger1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
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
      done()
    })

    /**
     * @tc.name   testDictModeTrigger1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1400
     * @tc.desc   Verify property search in dictionary mode with 1025 properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      expect(await testObj.getProperty('prop_0')).assertEqual(0)
      expect(await testObj.getProperty('prop_512')).assertEqual(512)
      expect(await testObj.getProperty('prop_1024')).assertEqual(1024)
      expect(await testObj.getProperty('nonexistent') === undefined).assertTrue()
      done()
    })

    /**
     * @tc.name   testDictModeTrigger1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1500
     * @tc.desc   Verify cross-thread transfer of 1025-property object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const obj: TransferableObject = new TransferableObject(new collections.Map<string, number>())
      obj.setAllProps(1025)
      const task: taskpool.Task = new taskpool.Task(receiveAndCount, obj)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(1025)
      done()
    })

    /**
     * @tc.name   testDictModeTrigger1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1600
     * @tc.desc   Verify large array traversal with 4096 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
    it('testDictModeTrigger1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
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
    it('testDictModeTrigger1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const arr: collections.Array<number> = new collections.Array<number>()
      for (let i = 0; i < 2048; i++) {
        arr.push(i)
      }
      const task: taskpool.Task = new taskpool.Task(readArrayLength, arr)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(2048)
      done()
    })

    /**
     * @tc.name   testDictModeTrigger1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_1900
     * @tc.desc   Verify adjustable property count with incremental growth across 1024 boundary on same object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      const targets: number[] = [100, 512, 1024, 1025, 2048, 4096]
      let filled: number = 0
      for (let t = 0; t < targets.length; t++) {
        for (let i = filled; i < targets[t]; i++) {
          await testObj.setProperty(`prop_${i}`, i)
        }
        filled = targets[t]
        expect(await testObj.getPropertyCount()).assertEqual(targets[t])
      }
      expect(await testObj.getProperty('prop_0')).assertEqual(0)
      expect(await testObj.getProperty('prop_1023')).assertEqual(1023)
      expect(await testObj.getProperty('prop_1024')).assertEqual(1024)
      expect(await testObj.getProperty('prop_4095')).assertEqual(4095)
      done()
    })

    /**
     * @tc.name   testDictModeTrigger2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_2000
     * @tc.desc   Verify adjustable property count with decremental shrink back across 1024 boundary on same object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 4096; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      const stages: number[] = [3072, 2048, 1025, 1024, 512, 0]
      let kept: number = 4096
      for (let s = 0; s < stages.length; s++) {
        for (let i = kept - 1; i >= stages[s]; i--) {
          await testObj.deleteProperty(`prop_${i}`)
        }
        kept = stages[s]
        expect(await testObj.getPropertyCount()).assertEqual(stages[s])
      }
      expect(await testObj.getProperty('prop_1024') === undefined).assertTrue()
      expect(await testObj.getProperty('prop_1023') === undefined).assertTrue()
      expect(await testObj.getProperty('prop_511') === undefined).assertTrue()
      done()
    })

    /**
     * @tc.name   testDictModeTrigger2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_2100
     * @tc.desc   Verify stability when property count oscillates around 1024 boundary repeatedly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const testObj: BoundaryPropertyClass = new BoundaryPropertyClass(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1023; i++) {
        await testObj.setProperty(`prop_${i}`, i)
      }
      const rounds: number = 50
      for (let round = 0; round < rounds; round++) {
        await testObj.setProperty('prop_1023', 1023)
        await testObj.setProperty('prop_1024', 1024)
        expect(await testObj.getPropertyCount()).assertEqual(1025)
        expect(await testObj.getProperty('prop_1024')).assertEqual(1024)
        await testObj.deleteProperty('prop_1024')
        await testObj.deleteProperty('prop_1023')
        expect(await testObj.getPropertyCount()).assertEqual(1023)
        expect(await testObj.getProperty('prop_1022')).assertEqual(1022)
      }
      expect(await testObj.getPropertyCount()).assertEqual(1023)
      done()
    })

    /**
     * @tc.name   testDictModeTrigger2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_2200
     * @tc.desc   Verify parameterized property count scanning from 100 to 2048 via count argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const counts: number[] = [100, 512, 1024, 1025, 2048]
      for (let c = 0; c < counts.length; c++) {
        const obj: TransferableObject = new TransferableObject(new collections.Map<string, number>())
        obj.setAllProps(counts[c])
        const task: taskpool.Task = new taskpool.Task(receiveAndCount, obj)
        const result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(counts[c])
      }
      done()
    })

    /**
     * @tc.name   testDictModeTrigger2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_2300
     * @tc.desc   Verify concurrent push of 2048 elements into SendableArray with AsyncLock in batches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const wrapper: SharedArrayWrapper = new SharedArrayWrapper(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      const total: number = 2048
      const batchSize: number = 256
      const batches: number = Math.ceil(total / batchSize)
      for (let batch = 0; batch < batches; batch++) {
        const tasks: taskpool.Task[] = []
        for (let i = batch * batchSize; i < (batch + 1) * batchSize && i < total; i++) {
          tasks.push(new taskpool.Task(pushArrayValueTask, wrapper, i))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
      }
      expect(await wrapper.getLength()).assertEqual(2048)
      const seen: boolean[] = []
      for (let i = 0; i < total; i++) {
        seen.push(false)
      }
      for (let i = 0; i < total; i++) {
        const v: number = wrapper.getValue(i)
        expect(v >= 0 && v < total).assertTrue()
        seen[v] = true
      }
      for (let i = 0; i < total; i++) {
        expect(seen[i]).assertTrue()
      }
      done()
    })

    /**
     * @tc.name   testDictModeTrigger2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_2400
     * @tc.desc   Verify concurrent write and read of 2048 key-value pairs in SendableMap with AsyncLock in batches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const wrapper: SharedMapWrapper = new SharedMapWrapper(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      const total: number = 2048
      const batchSize: number = 256
      const batches: number = Math.ceil(total / batchSize)
      for (let batch = 0; batch < batches; batch++) {
        const tasks: taskpool.Task[] = []
        for (let i = batch * batchSize; i < (batch + 1) * batchSize && i < total; i++) {
          tasks.push(new taskpool.Task(setMapValueTask, wrapper, `key_${i}`, i))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
      }
      expect(await wrapper.getSize()).assertEqual(2048)
      const readTasks: taskpool.Task[] = []
      const probeKeys: string[] = ['key_0', 'key_512', 'key_1024', 'key_1536', 'key_2047']
      const expected: number[] = [0, 512, 1024, 1536, 2047]
      for (let i = 0; i < probeKeys.length; i++) {
        readTasks.push(new taskpool.Task(getMapValueTask, wrapper, probeKeys[i]))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < readTasks.length; i++) {
        promises.push(taskpool.execute(readTasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(expected[i])
      }
      done()
    })

    /**
     * @tc.name   testDictModeTrigger2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_2500
     * @tc.desc   Verify concurrent add and remove of large SendableSet beyond 1024 with AsyncLock in batches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const wrapper: SharedSetWrapper = new SharedSetWrapper(new collections.Set<number>(), new ArkTSUtils.locks.AsyncLock())
      const total: number = 2048
      const batchSize: number = 256
      const batches: number = Math.ceil(total / batchSize)
      for (let batch = 0; batch < batches; batch++) {
        const tasks: taskpool.Task[] = []
        for (let i = batch * batchSize; i < (batch + 1) * batchSize && i < total; i++) {
          tasks.push(new taskpool.Task(setAddValueTask, wrapper, i))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
      }
      expect(await wrapper.getSize()).assertEqual(2048)
      const removeTotal: number = 1024
      const removeBatches: number = Math.ceil(removeTotal / batchSize)
      for (let batch = 0; batch < removeBatches; batch++) {
        const tasks: taskpool.Task[] = []
        for (let i = batch * batchSize * 2; i < (batch + 1) * batchSize * 2 && i < total; i += 2) {
          tasks.push(new taskpool.Task(setRemoveValueTask, wrapper, i))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
      }
      expect(await wrapper.getSize()).assertEqual(1024)
      expect(await wrapper.hasValue(0)).assertFalse()
      expect(await wrapper.hasValue(2046)).assertFalse()
      expect(await wrapper.hasValue(1)).assertTrue()
      expect(await wrapper.hasValue(2047)).assertTrue()
      done()
    })

    /**
     * @tc.name   testDictModeTrigger2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_2600
     * @tc.desc   Verify 10 rounds of concurrent increment on all 1025 properties with AsyncLock protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const obj: HighPropertyObject = new HighPropertyObject(new collections.Map<string, number>(), new ArkTSUtils.locks.AsyncLock())
      for (let i = 0; i < 1025; i++) {
        await obj.incrementProp(`prop_${i}`)
      }
      const rounds: number = 10
      const batchSize: number = 512
      const taskCount: number = rounds * 1025
      const batches: number = Math.ceil(taskCount / batchSize)
      let dispatched: number = 0
      for (let batch = 0; batch < batches; batch++) {
        const tasks: taskpool.Task[] = []
        while (dispatched < taskCount && tasks.length < batchSize) {
          const propIndex: number = dispatched % 1025
          tasks.push(new taskpool.Task(concurrentIncrement, obj, `prop_${propIndex}`))
          dispatched++
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
      }
      for (let i = 0; i < 1025; i++) {
        expect(await obj.getProp(`prop_${i}`)).assertEqual(11)
      }
      done()
    })

    /**
     * @tc.name   testDictModeTrigger2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DICT_MODE_TRIGGER_TEST_2700
     * @tc.desc   Verify prefix-based property search over 1025 properties in dictionary mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDictModeTrigger2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: SearchableObject = new SearchableObject(new collections.Map<string, string>())
      for (let i = 0; i < 1025; i++) {
        obj.setProp(`category_${Math.floor(i / 100)}_item_${i}`, `value_${i}`)
      }
      const category0: collections.Array<string> = obj.findProp('category_0_')
      expect(category0.length).assertEqual(100)
      const category10: collections.Array<string> = obj.findProp('category_10_')
      expect(category10.length).assertEqual(25)
      const none: collections.Array<string> = obj.findProp('nonexistent_')
      expect(none.length).assertEqual(0)
    })
  })
}
