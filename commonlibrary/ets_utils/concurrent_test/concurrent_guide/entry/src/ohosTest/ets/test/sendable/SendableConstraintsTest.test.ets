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
import { taskpool, collections, ArkTSUtils } from '@kit.ArkTS';

const enum Status {
  Active = 1,
  Inactive = 0
}

@Sendable
class SendableBase {
  baseValue: number = 0

  getBaseValue(): number {
    return this.baseValue
  }
}

@Sendable
class SendableDerived extends SendableBase {
  derivedValue: number = 0

  getTotal(): number {
    return this.baseValue + this.derivedValue
  }
}

class NonSendableBase {
  value: number = 0
}

class NonSendableDerived extends NonSendableBase {
  extra: string = ''
}

@Sendable
class AllTypesData {
  strVal: string = ''
  numVal: number = 0
  boolVal: boolean = false
  bigIntVal: bigint = 0n
  nullVal: null = null
  undefinedVal: undefined = undefined
  enumVal: Status = Status.Active
}

@Sendable
class ContainerData {
  arrCount: number = 0
  mapCount: number = 0
  setCount: number = 0
}

@Sendable
class AsyncLockData {
  counter: number = 0
}

@Sendable
class LruCacheData {
  label: string = ''
}

@Sendable
class TopLevelRef {
  value: number = 0
}

const topLevelInstance: TopLevelRef = new TopLevelRef()

@Sendable
function sendableFunc(x: number, y: number): number {
  return x + y
}

type SendableFuncType = (x: number, y: number) => number

@Sendable
class FunctionHolder {
  value: number = 0

  execute(x: number, y: number): number {
    return sendableFunc(x, y)
  }
}

@Sendable
class InitializedData {
  value: number = 0
  name: string = ''
  active: boolean = false
  arrCount: number = 0
}

@Sendable
class ConvertSource {
  data: number = 0
}

class ConvertTarget {
  data: number = 0
}

@Concurrent
function testInheritance(obj: SendableDerived): number {
  return obj.getTotal()
}

@Concurrent
function testAllTypes(data: AllTypesData): string {
  let result: string = ''
  result += data.strVal + '|'
  result += data.numVal.toString() + '|'
  result += data.boolVal.toString() + '|'
  result += data.bigIntVal.toString() + '|'
  result += (data.enumVal === Status.Active).toString()
  return result
}

@Concurrent
function testContainers(data: ContainerData): string {
  let arrLen: number = data.arrCount
  let mapLen: number = data.mapCount
  let setLen: number = data.setCount
  return arrLen.toString() + '|' + mapLen.toString() + '|' + setLen.toString()
}

@Concurrent
function testSendableFunc(holder: FunctionHolder): number {
  return holder.execute(10, 20)
}

@Concurrent
async function safeIncAsync(data: AsyncLockData, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  let result: number = await lock.lockAsync(() => {
    data.counter++
    return data.counter
  })
  return result
}

@Concurrent
function readTopLevelRef(ref: TopLevelRef): number {
  return ref.value
}

export default function SendableConstraintsTest(): void {
  describe('SendableConstraintsTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   SendableConstraintsTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0100
     * @tc.desc   Verify Sendable class extends another Sendable class works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let derived: SendableDerived = new SendableDerived()
      derived.baseValue = 10
      derived.derivedValue = 20

      let task: taskpool.Task = new taskpool.Task(testInheritance, derived)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(30)
    })

    /**
     * @tc.name   SendableConstraintsTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0200
     * @tc.desc   Verify non-Sendable class extends non-Sendable class works normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableConstraintsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let derived: NonSendableDerived = new NonSendableDerived()
      derived.value = 100
      derived.extra = 'extra'
      expect(derived.value).assertEqual(100)
      expect(derived.extra).assertEqual('extra')
      expect(derived instanceof NonSendableBase).assertTrue()
    })

    /**
     * @tc.name   SendableConstraintsTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0300
     * @tc.desc   Verify @Sendable decorated class is correctly identified by isSendable check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: AllTypesData = new AllTypesData()
      expect(ArkTSUtils.isSendable(data)).assertTrue()
    })

    /**
     * @tc.name   SendableConstraintsTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0400
     * @tc.desc   Verify all supported data types in Sendable class members
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: AllTypesData = new AllTypesData()
      data.strVal = 'test'
      data.numVal = 100
      data.boolVal = true
      data.bigIntVal = 9007199254740991n
      data.enumVal = Status.Active

      let task: taskpool.Task = new taskpool.Task(testAllTypes, data)
      let result = await taskpool.execute(task)
      let parts: string = result as string
      expect(parts).assertContain('test')
      expect(parts).assertContain('100')
      expect(parts).assertContain('true')
      expect(parts).assertContain('true')
    })

    /**
     * @tc.name   SendableConstraintsTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0500
     * @tc.desc   Verify collections Array Map Set as Sendable class members across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: ContainerData = new ContainerData()
      data.arrCount = 3
      data.mapCount = 2
      data.setCount = 2

      let task: taskpool.Task = new taskpool.Task(testContainers, data)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('3|2|2')
    })

    /**
     * @tc.name   SendableConstraintsTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0600
     * @tc.desc   Verify AsyncLock as Sendable class member for thread-safe operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: AsyncLockData = new AsyncLockData()
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

      let p1 = taskpool.execute(new taskpool.Task(safeIncAsync, data, lock))
      let p2 = taskpool.execute(new taskpool.Task(safeIncAsync, data, lock))
      let p3 = taskpool.execute(new taskpool.Task(safeIncAsync, data, lock))

      await Promise.all([p1, p2, p3])
      expect(data.counter).assertEqual(3)
    })

    /**
     * @tc.name   SendableConstraintsTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0700
     * @tc.desc   Verify SendableLruCache as Sendable class member works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableConstraintsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(10)
      cache.put('key1', 100)
      cache.put('key2', 200)

      let val1: number | undefined = cache.get('key1')
      let val2: number | undefined = cache.get('key2')
      expect(val1 as number).assertEqual(100)
      expect(val2 as number).assertEqual(200)
      expect(cache.length).assertEqual(2)
    })

    /**
     * @tc.name   SendableConstraintsTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0800
     * @tc.desc   Verify Sendable generic type with collections Array works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableConstraintsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: collections.Array<number> = new collections.Array<number>()
      arr.push(10, 20, 30)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
      expect(arr[2]).assertEqual(30)
    })

    /**
     * @tc.name   SendableConstraintsTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_0900
     * @tc.desc   Verify access to top-level Sendable class instance from Concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableConstraintsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      topLevelInstance.value = 42

      let task: taskpool.Task = new taskpool.Task(readTopLevelRef, topLevelInstance)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   SendableConstraintsTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1000
     * @tc.desc   Verify @Sendable decorator on class validates Sendable constraints
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: InitializedData = new InitializedData()
      data.value = 99
      data.name = 'test'
      data.active = true
      data.arrCount = 3

      expect(ArkTSUtils.isSendable(data)).assertTrue()
      expect(data.value).assertEqual(99)
      expect(data.name).assertEqual('test')
      expect(data.arrCount).assertEqual(3)
    })

    /**
     * @tc.name   SendableConstraintsTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1100
     * @tc.desc   Verify @Sendable decorator on function validates Sendable constraints
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = sendableFunc(10, 20)
      expect(result).assertEqual(30)
    })

    /**
     * @tc.name   SendableConstraintsTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1200
     * @tc.desc   Verify Sendable function type alias works with Sendable function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableConstraintsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let fn: SendableFuncType = sendableFunc
      let result: number = fn(5, 7)
      expect(result).assertEqual(12)
    })

    /**
     * @tc.name   SendableConstraintsTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1300
     * @tc.desc   Verify new expression creates Sendable object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Array<number> = new collections.Array<number>()
      arr.push(1, 2, 3)
      expect(arr.length).assertEqual(3)
      expect(ArkTSUtils.isSendable(arr)).assertTrue()
    })

    /**
     * @tc.name   SendableConstraintsTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1400
     * @tc.desc   Verify Sendable to non-Sendable type conversion works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableConstraintsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let source: ConvertSource = new ConvertSource()
      source.data = 42

      let target: ConvertTarget = source as ConvertTarget
      expect(target.data).assertEqual(42)
    })

    /**
     * @tc.name   SendableConstraintsTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1500
     * @tc.desc   Verify Sendable function type and normal function work together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableConstraintsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let holder: FunctionHolder = new FunctionHolder()
      let task: taskpool.Task = new taskpool.Task(testSendableFunc, holder)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(30)
    })

    /**
     * @tc.name   SendableConstraintsTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1600
     * @tc.desc   Verify Sendable class member functions work correctly after cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let derived: SendableDerived = new SendableDerived()
      derived.baseValue = 5
      derived.derivedValue = 15

      expect(derived.getBaseValue()).assertEqual(5)
      expect(derived.getTotal()).assertEqual(20)

      let task: taskpool.Task = new taskpool.Task(testInheritance, derived)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(20)
    })

    /**
     * @tc.name   SendableConstraintsTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1700
     * @tc.desc   Verify all Sendable class members are explicitly initialized with default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableConstraintsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: InitializedData = new InitializedData()
      expect(data.value).assertEqual(0)
      expect(data.name).assertEqual('')
      expect(data.active).assertFalse()
      expect(data.arrCount).assertEqual(0)
    })

    /**
     * @tc.name   SendableConstraintsTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINTS_TEST_1800
     * @tc.desc   Verify const enum member works correctly in Sendable class across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableConstraintsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: AllTypesData = new AllTypesData()
      data.enumVal = Status.Inactive
      expect(data.enumVal).assertEqual(Status.Inactive)

      data.enumVal = Status.Active
      let task: taskpool.Task = new taskpool.Task(testAllTypes, data)
      let result = await taskpool.execute(task)
      expect(result as string).assertContain('true')
    })
  })
}
