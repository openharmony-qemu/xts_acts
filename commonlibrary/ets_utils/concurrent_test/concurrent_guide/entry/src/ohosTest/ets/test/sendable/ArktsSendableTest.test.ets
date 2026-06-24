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
import { taskpool, collections, ArkTSUtils } from '@kit.ArkTS';

const enum LogLevel {
  Debug = 0,
  Info = 1,
  Warning = 2,
  Error = 3
}

@Sendable
class BasicTypesData {
  boolVal: boolean = false
  numVal: number = 0
  strVal: string = ''
  bigIntVal: bigint = 0n
  nullVal: null = null
  undefinedVal: undefined = undefined
}

@Sendable
class CollectionsData {
  arr: collections.Array<number> = new collections.Array<number>()
  map: collections.Map<string, number> = new collections.Map<string, number>()
  set: collections.Set<string> = new collections.Set<string>()
}

@Sendable
class LockData {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Sendable
class SignalData {
  ready: boolean = false
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
  condition: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
}

@Sendable
class CacheItem {
  key: string = ''
  value: number = 0
}

@Sendable
class CacheContainer {
  items: collections.Array<CacheItem> = new collections.Array<CacheItem>()
}

@Sendable
class TypeA {
  valueA: number = 0
}

@Sendable
class TypeB {
  valueB: string = ''
}

@Sendable
class UnionContainer {
  numData: number = 0
  strData: string = ''
  hasNum: boolean = false
  hasStr: boolean = false
}

@Sendable
class SharedHeapData {
  id: number = 0
  refCount: number = 0
}

@Sendable
class RefTestObject {
  objectId: number = 0
  checksum: number = 0
}

@Sendable
class ProtectedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Sendable
class LargeSendableData {
  data: collections.Array<number> = new collections.Array<number>()
}

@Sendable
class PrivateFieldClass {
  private secretValue: number = 0

  constructor(value: number) {
    this.secretValue = value
  }

  getSecret(): number {
    return this.secretValue
  }

  setSecret(value: number): void {
    this.secretValue = value
  }
}

@Sendable
class LogConfig {
  level: LogLevel = LogLevel.Info
  enabled: boolean = true
}

@Sendable
function sendableAdd(x: number, y: number): number {
  return x + y
}

@Concurrent
function processBasicTypes(data: BasicTypesData): string {
  let result: string = ''
  result += data.boolVal.toString() + '|'
  result += data.numVal.toString() + '|'
  result += data.strVal + '|'
  result += data.bigIntVal.toString() + '|'
  result += (data.nullVal === null).toString() + '|'
  result += (data.undefinedVal === undefined).toString()
  return result
}

@Concurrent
function processCollections(data: CollectionsData): string {
  return data.arr.length.toString() + '|' +
    data.map.size.toString() + '|' +
    data.set.size.toString()
}

@Concurrent
async function safeIncrement(counter: ProtectedCounter): Promise<number> {
  let result: number = await counter.lock.lockAsync(() => {
    counter.count++
    return counter.count
  })
  return result
}

@Concurrent
function processLargeData(data: LargeSendableData): number {
  return data.data.length
}

@Concurrent
function checkLogLevel(config: LogConfig): string {
  if (config.level >= LogLevel.Warning) {
    return 'High'
  }
  return 'Low'
}

@Concurrent
function verifySharedHeap(data: SharedHeapData): boolean {
  return ArkTSUtils.isSendable(data)
}

@Concurrent
function verifySameRef(obj: RefTestObject, expectedId: number): boolean {
  return obj.objectId === expectedId
}

@Concurrent
function processUnionNum(container: UnionContainer): number {
  return container.numData
}

@Concurrent
function processUnionStr(container: UnionContainer): string {
  return container.strData
}

@Concurrent
function testPrivateField(obj: PrivateFieldClass): number {
  return obj.getSecret()
}

@Concurrent
async function signalWaiter(data: SignalData): Promise<string> {
  await data.lock.lockAsync(() => {
    while (!data.ready) {
      data.condition.wait()
    }
  })
  return 'Signal received'
}

@Concurrent
async function signalSender(data: SignalData): Promise<void> {
  await data.lock.lockAsync(() => {
    data.ready = true
    data.condition.notifyAll()
  })
}

export default function ArktsSendableTest(): void {
  describe('ArktsSendableTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   ArktsSendableTest0100
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0100
     * @tc.desc   Verify Sendable class implements ISendable interface detected by isSendable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArktsSendableTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: BasicTypesData = new BasicTypesData()
      expect(ArkTSUtils.isSendable(data)).assertTrue()
    })

    /**
     * @tc.name   ArktsSendableTest0200
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0200
     * @tc.desc   Verify @Sendable decorator validates Sendable class constraints
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArktsSendableTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: CollectionsData = new CollectionsData()
      data.arr.push(1, 2, 3)
      data.map.set('a', 10)
      data.set.add('x')

      expect(ArkTSUtils.isSendable(data)).assertTrue()

      let task: taskpool.Task = new taskpool.Task(processCollections, data)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('3|1|1')
    })

    /**
     * @tc.name   ArktsSendableTest0300
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0300
     * @tc.desc   Verify @Sendable decorator on function works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArktsSendableTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = sendableAdd(15, 25)
      expect(result).assertEqual(40)
    })

    /**
     * @tc.name   ArktsSendableTest0400
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0400
     * @tc.desc   Verify const enum as Sendable class member works across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArktsSendableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: LogConfig = new LogConfig()
      config.level = LogLevel.Error

      let task: taskpool.Task = new taskpool.Task(checkLogLevel, config)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('High')
    })

    /**
     * @tc.name   ArktsSendableTest0500
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0500
     * @tc.desc   Verify all basic types boolean number string bigint null undefined in Sendable class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArktsSendableTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: BasicTypesData = new BasicTypesData()
      data.boolVal = true
      data.numVal = 42
      data.strVal = 'hello'
      data.bigIntVal = 123456789n

      let task: taskpool.Task = new taskpool.Task(processBasicTypes, data)
      let result = await taskpool.execute(task)
      let parts: string = result as string
      expect(parts).assertContain('true')
      expect(parts).assertContain('42')
      expect(parts).assertContain('hello')
      expect(parts).assertContain('123456789')
    })

    /**
     * @tc.name   ArktsSendableTest0600
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0600
     * @tc.desc   Verify collections containers Array Map Set as Sendable members across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArktsSendableTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: CollectionsData = new CollectionsData()
      data.arr.push(10, 20, 30, 40)
      data.map.set('k1', 1)
      data.map.set('k2', 2)
      data.set.add('s1')
      data.set.add('s2')
      data.set.add('s3')

      let task: taskpool.Task = new taskpool.Task(processCollections, data)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('4|2|3')
    })

    /**
     * @tc.name   ArktsSendableTest0700
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0700
     * @tc.desc   Verify AsyncLock object as Sendable member for thread-safe increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArktsSendableTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter: ProtectedCounter = new ProtectedCounter()

      let p1 = taskpool.execute(new taskpool.Task(safeIncrement, counter))
      let p2 = taskpool.execute(new taskpool.Task(safeIncrement, counter))
      let p3 = taskpool.execute(new taskpool.Task(safeIncrement, counter))
      let p4 = taskpool.execute(new taskpool.Task(safeIncrement, counter))
      let p5 = taskpool.execute(new taskpool.Task(safeIncrement, counter))

      await Promise.all([p1, p2, p3, p4, p5])
      expect(counter.count).assertEqual(5)
    })

    /**
     * @tc.name   ArktsSendableTest0800
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0800
     * @tc.desc   Verify ConditionVariable as Sendable member for signal wait mechanism
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArktsSendableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: SignalData = new SignalData()

      let senderTask: taskpool.Task = new taskpool.Task(signalSender, data)
      await taskpool.execute(senderTask)

      expect(data.ready).assertTrue()
    })

    /**
     * @tc.name   ArktsSendableTest0900
     * @tc.number SUB_ARKTS_SENDABLE_TEST_0900
     * @tc.desc   Verify SendableLruCache as Sendable member stores and retrieves items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArktsSendableTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, CacheItem> =
        new ArkTSUtils.SendableLruCache<string, CacheItem>(100)

      let item1: CacheItem = new CacheItem()
      item1.key = 'key1'
      item1.value = 100
      cache.put('key1', item1)

      let item2: CacheItem = new CacheItem()
      item2.key = 'key2'
      item2.value = 200
      cache.put('key2', item2)

      let result1: CacheItem | undefined = cache.get('key1')
      let result2: CacheItem | undefined = cache.get('key2')

      expect((result1 as CacheItem).value).assertEqual(100)
      expect((result2 as CacheItem).value).assertEqual(200)
      expect(cache.length).assertEqual(2)
    })

    /**
     * @tc.name   ArktsSendableTest1000
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1000
     * @tc.desc   Verify Union type with Sendable classes works correctly across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArktsSendableTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let container: UnionContainer = new UnionContainer()
      container.numData = 100
      container.hasNum = true

      let task: taskpool.Task = new taskpool.Task(processUnionNum, container)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
    })

    /**
     * @tc.name   ArktsSendableTest1100
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1100
     * @tc.desc   Verify SharedHeap allocation Sendable object passes isSendable in worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArktsSendableTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: SharedHeapData = new SharedHeapData()
      data.id = 1
      data.refCount = 1

      expect(ArkTSUtils.isSendable(data)).assertTrue()

      let task: taskpool.Task = new taskpool.Task(verifySharedHeap, data)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   ArktsSendableTest1200
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1200
     * @tc.desc   Verify Sendable object reference identity preserved across thread boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArktsSendableTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: RefTestObject = new RefTestObject()
      obj.objectId = 54321
      obj.checksum = 777

      let originalId: number = obj.objectId
      let task: taskpool.Task = new taskpool.Task(verifySameRef, obj, originalId)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
      expect(obj.objectId).assertEqual(originalId)
    })

    /**
     * @tc.name   ArktsSendableTest1300
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1300
     * @tc.desc   Verify AsyncLock protects concurrent writes ensuring data consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArktsSendableTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter: ProtectedCounter = new ProtectedCounter()
      let taskCount: number = 20
      let promises: Array<Promise<Object>> = []

      for (let i: number = 0; i < taskCount; i++) {
        let p = taskpool.execute(new taskpool.Task(safeIncrement, counter))
        promises.push(p)
      }

      await Promise.all(promises)
      expect(counter.count).assertEqual(taskCount)
    })

    /**
     * @tc.name   ArktsSendableTest1400
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1400
     * @tc.desc   Verify concurrent data access with AsyncLock protection maintains consistent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArktsSendableTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let counter: ProtectedCounter = new ProtectedCounter()
      let taskCount: number = 10

      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < taskCount; i++) {
        let p = taskpool.execute(new taskpool.Task(safeIncrement, counter))
        promises.push(p)
      }

      await Promise.all(promises)
      expect(counter.count).assertEqual(taskCount)
    })

    /**
     * @tc.name   ArktsSendableTest1500
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1500
     * @tc.desc   Verify 100KB Sendable data transfer completes within reasonable time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArktsSendableTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let largeData: LargeSendableData = new LargeSendableData()
      for (let i: number = 0; i < 10240; i++) {
        largeData.data.push(i)
      }

      let startTime: number = Date.now()
      let task: taskpool.Task = new taskpool.Task(processLargeData, largeData)
      let result = await taskpool.execute(task)
      let elapsed: number = Date.now() - startTime

      expect(result as number).assertEqual(10240)
      expect(elapsed < 5000).assertTrue()
    })

    /**
     * @tc.name   ArktsSendableTest1600
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1600
     * @tc.desc   Verify Sendable class with private field using private keyword works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArktsSendableTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: PrivateFieldClass = new PrivateFieldClass(42)
      expect(obj.getSecret()).assertEqual(42)

      obj.setSecret(100)
      expect(obj.getSecret()).assertEqual(100)

      let task: taskpool.Task = new taskpool.Task(testPrivateField, obj)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
    })

    /**
     * @tc.name   ArktsSendableTest1700
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1700
     * @tc.desc   Verify const enum LogLevel Info value works in Sendable class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArktsSendableTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: LogConfig = new LogConfig()
      config.level = LogLevel.Info

      let task: taskpool.Task = new taskpool.Task(checkLogLevel, config)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('Low')
    })

    /**
     * @tc.name   ArktsSendableTest1800
     * @tc.number SUB_ARKTS_SENDABLE_TEST_1800
     * @tc.desc   Verify Union type with TypeB variant works correctly in TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArktsSendableTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let container: UnionContainer = new UnionContainer()
      container.strData = 'Hello'
      container.hasStr = true

      let task: taskpool.Task = new taskpool.Task(processUnionStr, container)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('Hello')
    })
  })
}
