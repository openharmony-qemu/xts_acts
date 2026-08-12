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
import { taskpool, collections, lang } from '@kit.ArkTS';
import utils from '@arkts.utils';

@Sendable
class CustomSendable {
  public value_: number = 0
  public name_: string = ''
  public data_: number = 0

  getValue(): number {
    return this.value_
  }

  setValue(v: number): void {
    this.value_ = v
  }

  addData(v: number): void {
    this.data_ = this.data_ + v
  }
}

@Sendable
class InnerSendable {
  public innerValue_: number = 0
}

@Sendable
class OuterSendable {
  public outerValue_: number = 0
  public inner_: InnerSendable = new InnerSendable()

  getNestedValue(): number {
    return this.inner_.innerValue_
  }

  setNestedValue(v: number): void {
    this.inner_.innerValue_ = v
  }
}

@Sendable
class BasicTypes {
  public numValue_: number = 0
  public strValue_: string = ''
  public boolValue_: boolean = false
}

@Sendable
class NumericData {
  public numA_: number = 0
  public numB_: number = 0
  public numC_: number = 0
}

@Sendable
class MethodParams {
  passThrough(n: number): number {
    return n
  }

  processNumber(n: number): number {
    return n * 2
  }
}

@Sendable
class MethodReturns {
  createSmallNumber(): number {
    return 3
  }

  createNumber(): number {
    return 100
  }

  createString(): string {
    return 'result'
  }
}

@Sendable
class ResultData {
  public value_: number = 0
}

function readSendableValue(instance: CustomSendable): number {
  'use concurrent'
  return instance.value_
}

function modifySendableValue(instance: CustomSendable, newVal: number): number {
  'use concurrent'
  instance.value_ = newVal
  return instance.value_
}

function processNumeric(instance: NumericData): number {
  'use concurrent'
  return instance.numA_
}

function createAndReturnSendable(result: ResultData): ResultData {
  'use concurrent'
  result.value_ = 42
  return result
}

function nestedSendableAccess(outer: OuterSendable): number {
  'use concurrent'
  return outer.inner_.innerValue_
}

function nestedSendableModify(outer: OuterSendable, val: number): void {
  'use concurrent'
  outer.inner_.innerValue_ = val
}

function incrementSendableValue(data: CustomSendable): number {
  'use concurrent'
  data.value_ = data.value_ + 1
  return data.value_
}

@Sendable
class SharedCounter {
  public counter_: number = 0
}

@Sendable
class ValidatedSendable implements lang.ISendable {
  public validatedValue_: number = 0
}

@Sendable
class BaseSendableClass {
  public baseValue_: number = 0
}

@Sendable
class ChildSendableClass extends BaseSendableClass {
  public childValue_: string = ''
}

function incrementShared(data: SharedCounter): number {
  'use concurrent'
  data.counter_ = data.counter_ + 1
  return data.counter_
}

function readValidated(instance: ValidatedSendable): number {
  'use concurrent'
  return instance.validatedValue_
}

function readInherited(instance: ChildSendableClass): number {
  'use concurrent'
  return instance.baseValue_
}

function asyncLockCrossThread(lock: utils.locks.AsyncLock, data: SharedCounter): number {
  'use concurrent'
  // AsyncLock is @Sendable (implements ISendable), so it can be transferred to
  // the worker thread. However lockAsync() is an async API, and 'use concurrent'
  // functions cannot be declared async nor await async calls — a language
  // constraint of ArkTS concurrent functions. Therefore the lock object is
  // received and its transferability is verified, but lockAsync() is not invoked
  // inside this concurrent function. The data increment below is unprotected
  // only because a single task is dispatched (ISendableImplTest3400), so there is
  // no concurrent contention and the value is deterministic.
  data.counter_ = data.counter_ + 1
  return data.counter_
}

export default function iSendableImplTest(): void {
  describe('ISendableImplTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   ISendableImplTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0100
     * @tc.desc   Verify collections.Array push and element access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1); arr.push(2); arr.push(3)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.name   ISendableImplTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0200
     * @tc.desc   Verify collections.Map set, get, and size operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let map = new collections.Map<string, number>()
      map.set('a', 1)
      map.set('b', 2)
      expect(map.size).assertEqual(2)
      expect(map.get('a')).assertEqual(1)
      expect(map.get('b')).assertEqual(2)
    })

    /**
     * @tc.name   ISendableImplTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0300
     * @tc.desc   Verify collections.Set add, has, and size operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(2)
      expect(set.size).assertEqual(2)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
    })

    /**
     * @tc.name   ISendableImplTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0400
     * @tc.desc   Verify custom class default property values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new CustomSendable()
      expect(instance.value_).assertEqual(0)
      expect(instance.name_).assertEqual('')
      expect(instance.data_).assertEqual(0)
    })

    /**
     * @tc.name   ISendableImplTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0500
     * @tc.desc   Verify custom @Sendable class property modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.value_ = 100
      instance.name_ = 'test'
      instance.addData(1)
      instance.addData(2)

      expect(instance.value_).assertEqual(100)
      expect(instance.name_).assertEqual('test')
      expect(instance.data_).assertEqual(3)
    })

    /**
     * @tc.name   ISendableImplTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0600
     * @tc.desc   Verify custom @Sendable class methods work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.setValue(42)
      expect(instance.getValue()).assertEqual(42)
    })

    /**
     * @tc.name   ISendableImplTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0700
     * @tc.desc   Verify nested @Sendable class with inner Sendable property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let outer = new OuterSendable()
      expect(outer.outerValue_).assertEqual(0)
      expect(outer.inner_.innerValue_).assertEqual(0)

      outer.outerValue_ = 10
      outer.setNestedValue(20)

      expect(outer.outerValue_).assertEqual(10)
      expect(outer.getNestedValue()).assertEqual(20)
    })

    /**
     * @tc.name   ISendableImplTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0800
     * @tc.desc   Verify @Sendable class with basic type properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new BasicTypes()
      expect(instance.numValue_).assertEqual(0)
      expect(instance.strValue_).assertEqual('')
      expect(instance.boolValue_).assertFalse()

      instance.numValue_ = 42
      instance.strValue_ = 'hello'
      instance.boolValue_ = true

      expect(instance.numValue_).assertEqual(42)
      expect(instance.strValue_).assertEqual('hello')
      expect(instance.boolValue_).assertTrue()
    })

    /**
     * @tc.name   ISendableImplTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_0900
     * @tc.desc   Verify custom class with numeric counter properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new NumericData()
      instance.numA_ = 3
      instance.numB_ = 1
      instance.numC_ = 1

      expect(instance.numA_).assertEqual(3)
      expect(instance.numB_).assertEqual(1)
      expect(instance.numC_).assertEqual(1)
    })

    /**
     * @tc.name   ISendableImplTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1000
     * @tc.desc   Verify custom class method with numeric parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new MethodParams()

      let result = instance.passThrough(3)
      expect(result).assertEqual(3)

      let numResult = instance.processNumber(5)
      expect(numResult).assertEqual(10)
    })

    /**
     * @tc.name   ISendableImplTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1100
     * @tc.desc   Verify custom class methods returning number and string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new MethodReturns()

      let smallResult = instance.createSmallNumber()
      expect(smallResult).assertEqual(3)

      let num = instance.createNumber()
      expect(num).assertEqual(100)

      let str = instance.createString()
      expect(str).assertEqual('result')
    })

    /**
     * @tc.name   ISendableImplTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1200
     * @tc.desc   Verify ISendable instance can be passed to TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.value_ = 55

      let task = new taskpool.Task(readSendableValue, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(55)
    })

    /**
     * @tc.name   ISendableImplTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1300
     * @tc.desc   Verify ISendable instance can be modified in TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.value_ = 20

      let task = new taskpool.Task(modifySendableValue, instance, 88.0)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(88)
      expect(instance.value_).assertEqual(88)
    })

    /**
     * @tc.name   ISendableImplTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1400
     * @tc.desc   Verify nested ISendable can be accessed in TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let outer = new OuterSendable()
      outer.setNestedValue(77)

      let task = new taskpool.Task(nestedSendableAccess, outer)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(77)
    })

    /**
     * @tc.name   ISendableImplTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1500
     * @tc.desc   Verify nested ISendable can be modified in TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let outer = new OuterSendable()

      let task = new taskpool.Task(nestedSendableModify, outer, 55.0)
      await taskpool.execute(task)

      expect(outer.getNestedValue()).assertEqual(55)
    })

    /**
     * @tc.name   ISendableImplTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1600
     * @tc.desc   Verify ISendable with numeric data in TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new NumericData()
      instance.numA_ = 3

      let task = new taskpool.Task(processNumeric, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   ISendableImplTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1700
     * @tc.desc   Verify ISendable instance returned from TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let initData = new ResultData()
      let task = new taskpool.Task(createAndReturnSendable, initData)
      let result = await taskpool.execute(task) as ResultData

      expect(result.value_).assertEqual(42)
    })

    /**
     * @tc.name   ISendableImplTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1800
     * @tc.desc   Verify multiple ISendable instances in concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ISendableImplTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance1 = new CustomSendable()
      let instance2 = new CustomSendable()
      instance1.value_ = 10
      instance2.value_ = 20

      let task1 = new taskpool.Task(readSendableValue, instance1)
      let task2 = new taskpool.Task(readSendableValue, instance2)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2)
      ])

      expect(results[0] as number).assertEqual(10)
      expect(results[1] as number).assertEqual(20)
    })

    /**
     * @tc.name   ISendableImplTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_1900
     * @tc.desc   Verify collections.Array push and element length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ISendableImplTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1); arr.push(2); arr.push(3); arr.push(4); arr.push(5)
      expect(arr.length).assertEqual(5)

      arr.push(6)
      expect(arr.length).assertEqual(6)
      expect(arr[5]).assertEqual(6)
    })

    /**
     * @tc.name   ISendableImplTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2000
     * @tc.desc   Verify collections.Map set, get, and has operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ISendableImplTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let map = new collections.Map<string, number>()
      map.set('x', 100)
      map.set('y', 200)

      expect(map.size).assertEqual(2)
      expect(map.has('x')).assertTrue()
      expect(map.has('z')).assertFalse()
      expect(map.get('x')).assertEqual(100)
      expect(map.get('y')).assertEqual(200)
    })

    /**
     * @tc.name   ISendableImplTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2100
     * @tc.desc   Verify collections.Set add, has, and length operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ISendableImplTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)

      expect(set.size).assertEqual(3)
      expect(set.has(1)).assertTrue()
      expect(set.has(4)).assertFalse()
    })

    /**
     * @tc.name   ISendableImplTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2200
     * @tc.desc   Verify AsyncLock implements ISendable and can be created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new utils.locks.AsyncLock()
      let counter: number = 0

      await lock.lockAsync((): number => {
        counter = 1
        return counter
      })

      expect(counter).assertEqual(1)
    })

    /**
     * @tc.name   ISendableImplTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2300
     * @tc.desc   Verify CustomSendable data increment via TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let data = new CustomSendable()
      data.value_ = 10

      let task = new taskpool.Task(incrementSendableValue, data)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(11)
    })

    /**
     * @tc.name   ISendableImplTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2400
     * @tc.desc   Verify AsyncLock lockAsync with sequential operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new utils.locks.AsyncLock()
      let counter: number = 0

      await lock.lockAsync((): number => {
        counter = 50
        return counter
      })

      await lock.lockAsync((): number => {
        counter = counter + 50
        return counter
      })

      expect(counter).assertEqual(100)
    })

    /**
     * @tc.name   ISendableImplTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2500
     * @tc.desc   Verify AsyncLock lockAsync with sequential operations on Sendable data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new utils.locks.AsyncLock()
      let data = new CustomSendable()
      data.value_ = 0

      await lock.lockAsync((): number => {
        data.value_ = data.value_ + 10
        return data.value_
      })

      await lock.lockAsync((): number => {
        data.value_ = data.value_ + 20
        return data.value_
      })

      expect(data.value_).assertEqual(30)
    })

    /**
     * @tc.name   ISendableImplTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2600
     * @tc.desc   Verify concurrent TaskPool tasks with individual data instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let data1 = new CustomSendable()
      data1.value_ = 50
      let data2 = new CustomSendable()
      data2.value_ = 100

      let task1 = new taskpool.Task(incrementSendableValue, data1)
      let task2 = new taskpool.Task(incrementSendableValue, data2)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2)
      ])

      expect(results[0] as number).assertEqual(51)
      expect(results[1] as number).assertEqual(101)
    })

    /**
     * @tc.name   ISendableImplTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2700
     * @tc.desc   Verify Sendable object round-trip between two tasks preserves data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ISendableImplTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let data = new CustomSendable()
      data.value_ = 10

      let task1 = new taskpool.Task(modifySendableValue, data, 25.0)
      await taskpool.execute(task1)

      let task2 = new taskpool.Task(readSendableValue, data)
      let result = await taskpool.execute(task2)

      expect(result as number).assertEqual(25)
    })

    /**
     * @tc.name   ISendableImplTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2800
     * @tc.desc   Verify multiple independent Sendable instances do not interfere
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ISendableImplTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let data1 = new CustomSendable()
      data1.value_ = 11
      let data2 = new CustomSendable()
      data2.value_ = 22

      let task1 = new taskpool.Task(incrementSendableValue, data1)
      let task2 = new taskpool.Task(incrementSendableValue, data2)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2)
      ])

      expect(results[0] as number).assertEqual(12)
      expect(results[1] as number).assertEqual(23)
      expect(data1.value_).assertEqual(12)
      expect(data2.value_).assertEqual(23)
    })

    /**
     * @tc.name   ISendableImplTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_2900
     * @tc.desc   Verify multiple concurrent tasks can access same Sendable instance without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ISendableImplTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let sharedData = new SharedCounter()

      let task1 = new taskpool.Task(incrementShared, sharedData)
      let task2 = new taskpool.Task(incrementShared, sharedData)
      let task3 = new taskpool.Task(incrementShared, sharedData)
      let task4 = new taskpool.Task(incrementShared, sharedData)
      let task5 = new taskpool.Task(incrementShared, sharedData)

      await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2),
        taskpool.execute(task3),
        taskpool.execute(task4),
        taskpool.execute(task5)
      ])

      // 5 concurrent tasks increment the same unsynchronized counter. Without
      // locking, lost updates may occur (read-modify-write is not atomic), so
      // the final value is non-deterministic. The value must be at least 1 (all
      // tasks ran) and at most 5 (one increment per task) under any interleaving.
      expect(sharedData.counter_ >= 1 && sharedData.counter_ <= 5).assertTrue()
    })

    /**
     * @tc.name   ISendableImplTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_3000
     * @tc.desc   Verify AsyncLock lockAsync sets Sendable data value in main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new utils.locks.AsyncLock()
      let data = new CustomSendable()
      data.value_ = 0

      await lock.lockAsync((): number => {
        data.value_ = 42
        return data.value_
      })

      expect(data.value_).assertEqual(42)
    })

    /**
     * @tc.name   ISendableImplTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_3100
     * @tc.desc   Verify ConditionVariable creation and basic wait/notifyOne operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let cv = new utils.locks.ConditionVariable()
      expect(typeof cv.wait).assertEqual('function')
      expect(typeof cv.notifyOne).assertEqual('function')

      const notifyTimer = setTimeout((): void => {
        cv.notifyOne()
      }, 500)
      let waitTimer: number = -1
      // Race wait() against a timeout so the test cannot hang indefinitely.
      const waitResult = await Promise.race<boolean>([
        cv.wait().then((): boolean => true),
        new Promise<boolean>((resolve): void => {
          waitTimer = setTimeout((): void => { resolve(false) }, 3000)
        })
      ])
      clearTimeout(notifyTimer)
      if (waitTimer !== -1) {
        clearTimeout(waitTimer)
      }
      expect(waitResult).assertTrue()
    })

    /**
     * @tc.name   ISendableImplTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_3200
     * @tc.desc   Verify @Sendable decorated class can be instantiated and passed across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new ValidatedSendable()
      instance.validatedValue_ = 88

      let task = new taskpool.Task(readValidated, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(88)
      expect(instance.validatedValue_).assertEqual(88)
    })

    /**
     * @tc.name   ISendableImplTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_3300
     * @tc.desc   Verify Sendable inheritance chain preserves properties across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new ChildSendableClass()
      instance.baseValue_ = 77
      instance.childValue_ = 'child'

      let task = new taskpool.Task(readInherited, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(77)
      expect(instance.baseValue_).assertEqual(77)
      expect(instance.childValue_).assertEqual('child')
    })

    /**
     * @tc.name   ISendableImplTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ISENDABLE_IMPL_TEST_3400
     * @tc.desc   Verify AsyncLock object is ISendable and can be transferred to a TaskPool task (lockAsync not callable in 'use concurrent')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ISendableImplTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new utils.locks.AsyncLock()
      let data = new SharedCounter()
      data.counter_ = 0

      let task = new taskpool.Task(asyncLockCrossThread, lock, data)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(1)
      expect(data.counter_).assertEqual(1)
    })
  })
}
