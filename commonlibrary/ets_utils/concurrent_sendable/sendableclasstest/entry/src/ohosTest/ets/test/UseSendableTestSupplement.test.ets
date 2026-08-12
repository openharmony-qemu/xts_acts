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
import { taskpool, collections, worker, lang, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import utils from '@arkts.utils';
import { SharedSendableData } from './SendableSharedData';
import { sendableFuncInTsConsumer } from './SendableTsFuncConsumer';

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
class ResultData {
  public value_: number = 0
}

function returnSendableSet(): collections.Set<number> {
  'use concurrent'
  let set = new collections.Set<number>()
  set.add(1); set.add(2); set.add(3)
  return set
}

function returnSendableClass(result: ResultData): ResultData {
  'use concurrent'
  result.value_ = 100
  return result
}

function readNestedSendable(outer: OuterSendable): number {
  'use concurrent'
  return outer.inner_.innerValue_
}

function modifyNestedSendable(outer: OuterSendable, val: number): void {
  'use concurrent'
  outer.inner_.innerValue_ = val
}

function readSendableValue(instance: CustomSendable): number {
  'use concurrent'
  return instance.value_
}

function modifySendableValue(instance: CustomSendable, val: number): number {
  'use concurrent'
  instance.value_ = val
  return instance.value_
}

function arraySum(arr: collections.Array<number>): number {
  'use concurrent'
  let sum: number = 0
  for (let i = 0; i < arr.length; i++) {
    sum = sum + arr[i]
  }
  return sum
}

function mapCount(map: collections.Map<string, number>): number {
  'use concurrent'
  return map.size
}

function setDeleteOp(set: collections.Set<number>): number {
  'use concurrent'
  set.delete(2)
  return set.size
}

function callSendableMethod(instance: CustomSendable): number {
  'use concurrent'
  instance.setValue(50)
  instance.addData(10)
  return instance.getValue()
}

function sendableClassReturnWithProp(result: ResultData): ResultData {
  'use concurrent'
  result.value_ = 77
  return result
}

function sendableFuncWithLeadingBlankLine(): number {

  'use concurrent'
  return 42
}

function sendableFuncWithInnerLambda(): number {
  'use concurrent'
  let inner = (): number => 50
  return inner() + 50
}

@Sendable
class ExplicitSendable implements lang.ISendable {
  public value_: number = 0
  public name_: string = ''
}

@Sendable
class ContainerSendable {
  public arr_: collections.Array<number> = new collections.Array<number>()
  public map_: collections.Map<string, number> = new collections.Map<string, number>()
  public set_: collections.Set<number> = new collections.Set<number>()
}

@Sendable
class InstanceMethodSendable {
  public ownVar_: number = 10

  getOwnValue(): number {
    return this.ownVar_
  }

  setOwnValue(v: number): void {
    this.ownVar_ = v
  }
}

@Sendable
class BigIntSendable {
  public bigValue_: bigint = BigInt(0)
}

interface ICounter {
  increment(): void
  getCount(): number
}

@Sendable
class MultiInterfaceSendable implements ICounter {
  public count_: number = 0

  increment(): void {
    this.count_ = this.count_ + 1
  }

  getCount(): number {
    return this.count_
  }
}

function readBig(data: BigIntSendable): bigint {
  'use concurrent'
  return data.bigValue_
}

function readInstanceOwnValue(instance: InstanceMethodSendable): number {
  'use concurrent'
  return instance.getOwnValue()
}

function readMultiCount(instance: MultiInterfaceSendable): number {
  'use concurrent'
  return instance.getCount()
}

export default function useSendableTestSupplement(): void {
  describe('UseSendableTestSupplement', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   UseSendableTestSupplement0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0100
     * @tc.desc   Verify concurrent function returning collections.Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(returnSendableSet)
      let result = await taskpool.execute(task) as collections.Set<number>

      expect(result.size).assertEqual(3)
      expect(result.has(1)).assertTrue()
      expect(result.has(2)).assertTrue()
      expect(result.has(3)).assertTrue()
    })

    /**
     * @tc.name   UseSendableTestSupplement0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0200
     * @tc.desc   Verify concurrent function returning @Sendable class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let initData = new ResultData()
      let task = new taskpool.Task(returnSendableClass, initData)
      let result = await taskpool.execute(task) as ResultData

      expect(result.value_).assertEqual(100)
    })

    /**
     * @tc.name   UseSendableTestSupplement0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0300
     * @tc.desc   Verify nested @Sendable class parameter in concurrent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let outer = new OuterSendable()
      outer.setNestedValue(99)

      let task = new taskpool.Task(readNestedSendable, outer)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(99)
    })

    /**
     * @tc.name   UseSendableTestSupplement0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0400
     * @tc.desc   Verify nested @Sendable class modification in concurrent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let outer = new OuterSendable()

      let task = new taskpool.Task(modifyNestedSendable, outer, 66.0)
      await taskpool.execute(task)

      expect(outer.getNestedValue()).assertEqual(66)
    })

    /**
     * @tc.name   UseSendableTestSupplement0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0500
     * @tc.desc   Verify Sendable object round-trip between two concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTestSupplement0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.value_ = 5

      let task1 = new taskpool.Task(modifySendableValue, instance, 30.0)
      await taskpool.execute(task1)

      let task2 = new taskpool.Task(readSendableValue, instance)
      let result = await taskpool.execute(task2)

      expect(result as number).assertEqual(30)
      expect(instance.value_).assertEqual(30)
    })

    /**
     * @tc.name   UseSendableTestSupplement0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0600
     * @tc.desc   Verify AsyncLock sequential operations on Sendable data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new utils.locks.AsyncLock()
      let data = new CustomSendable()
      data.value_ = 0

      await lock.lockAsync((): number => {
        data.value_ = data.value_ + 15
        return data.value_
      })

      await lock.lockAsync((): number => {
        data.value_ = data.value_ + 35
        return data.value_
      })

      expect(data.value_).assertEqual(50)
    })

    /**
     * @tc.name   UseSendableTestSupplement0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0700
     * @tc.desc   Verify concurrent function computing sum of collections.Array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1); arr.push(2); arr.push(3); arr.push(4); arr.push(5)

      let task = new taskpool.Task(arraySum, arr)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(15)
    })

    /**
     * @tc.name   UseSendableTestSupplement0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0800
     * @tc.desc   Verify concurrent function counting entries in collections.Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let map = new collections.Map<string, number>()
      map.set('a', 10)
      map.set('b', 20)
      map.set('c', 30)

      let task = new taskpool.Task(mapCount, map)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   UseSendableTestSupplement0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_0900
     * @tc.desc   Verify concurrent function deleting element from collections.Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let set = new collections.Set<number>()
      set.add(1); set.add(2); set.add(3)

      let task = new taskpool.Task(setDeleteOp, set)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(2)
      expect(set.has(2)).assertFalse()
    })

    /**
     * @tc.name   UseSendableTestSupplement1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1000
     * @tc.desc   Verify multiple Sendable instances with different values in concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTestSupplement1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance1 = new CustomSendable()
      instance1.value_ = 100
      let instance2 = new CustomSendable()
      instance2.value_ = 200
      let instance3 = new CustomSendable()
      instance3.value_ = 300

      let task1 = new taskpool.Task(readSendableValue, instance1)
      let task2 = new taskpool.Task(readSendableValue, instance2)
      let task3 = new taskpool.Task(readSendableValue, instance3)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2),
        taskpool.execute(task3)
      ])

      expect(results[0] as number).assertEqual(100)
      expect(results[1] as number).assertEqual(200)
      expect(results[2] as number).assertEqual(300)
    })

    /**
     * @tc.name   UseSendableTestSupplement1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1100
     * @tc.desc   Verify AsyncLock with Sendable data accumulation across three locks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTestSupplement1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
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

      await lock.lockAsync((): number => {
        data.value_ = data.value_ + 30
        return data.value_
      })

      expect(data.value_).assertEqual(60)
    })

    /**
     * @tc.name   UseSendableTestSupplement1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1200
     * @tc.desc   Verify @Sendable class method calls within concurrent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new CustomSendable()

      let task = new taskpool.Task(callSendableMethod, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(50)
      expect(instance.data_).assertEqual(10)
    })

    /**
     * @tc.name   UseSendableTestSupplement1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1300
     * @tc.desc   Verify Sendable data isolation between concurrent tasks modifying different instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTestSupplement1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance1 = new CustomSendable()
      instance1.value_ = 0
      let instance2 = new CustomSendable()
      instance2.value_ = 0

      let task1 = new taskpool.Task(modifySendableValue, instance1, 111.0)
      let task2 = new taskpool.Task(modifySendableValue, instance2, 222.0)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2)
      ])

      expect(results[0] as number).assertEqual(111)
      expect(results[1] as number).assertEqual(222)
      expect(instance1.value_).assertEqual(111)
      expect(instance2.value_).assertEqual(222)
    })

    /**
     * @tc.name   UseSendableTestSupplement1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1400
     * @tc.desc   Verify @Sendable class return from concurrent task with property verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let initData = new ResultData()
      let task = new taskpool.Task(sendableClassReturnWithProp, initData)
      let result = await taskpool.execute(task) as ResultData

      expect(result.value_).assertEqual(77)
    })

    /**
     * @tc.name   UseSendableTestSupplement1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1500
     * @tc.desc   Verify nested @Sendable class round-trip between modify and read tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTestSupplement1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let outer = new OuterSendable()
      outer.setNestedValue(10)

      let task1 = new taskpool.Task(modifyNestedSendable, outer, 88.0)
      await taskpool.execute(task1)

      let task2 = new taskpool.Task(readNestedSendable, outer)
      let result = await taskpool.execute(task2)

      expect(result as number).assertEqual(88)
      expect(outer.getNestedValue()).assertEqual(88)
    })

    /**
     * @tc.name   UseSendableTestSupplement1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1600
     * @tc.desc   Verify class with explicit implements ISendable keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new ExplicitSendable()
      expect(instance.value_).assertEqual(0)
      expect(instance.name_).assertEqual('')

      instance.value_ = 42
      instance.name_ = 'explicit'

      expect(instance.value_).assertEqual(42)
      expect(instance.name_).assertEqual('explicit')
    })

    /**
     * @tc.name   UseSendableTestSupplement1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1700
     * @tc.desc   Verify collections.Array/Map/Set as @Sendable class properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let container = new ContainerSendable()

      container.arr_.push(1)
      container.arr_.push(2)
      container.arr_.push(3)
      container.map_.set('x', 10)
      container.map_.set('y', 20)
      container.set_.add(100)
      container.set_.add(200)

      expect(container.arr_.length).assertEqual(3)
      expect(container.arr_[0]).assertEqual(1)
      expect(container.arr_[2]).assertEqual(3)
      expect(container.map_.size).assertEqual(2)
      expect(container.map_.get('x')).assertEqual(10)
      expect(container.map_.get('y')).assertEqual(20)
      expect(container.set_.size).assertEqual(2)
      expect(container.set_.has(100)).assertTrue()
    })

    /**
     * @tc.name   UseSendableTestSupplement1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1800
     * @tc.desc   Verify instance methods access own properties via this keyword
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new InstanceMethodSendable()

      expect(instance.getOwnValue()).assertEqual(10)

      instance.setOwnValue(99)
      expect(instance.getOwnValue()).assertEqual(99)

      let task = new taskpool.Task(readInstanceOwnValue, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(99)
    })

    /**
     * @tc.name   UseSendableTestSupplement1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_1900
     * @tc.desc   Verify bigint as @Sendable class property type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new BigIntSendable()
      expect(instance.bigValue_).assertEqual(BigInt(0))

      instance.bigValue_ = BigInt(999)

      let task = new taskpool.Task(readBig, instance)
      let result = await taskpool.execute(task)

      expect(result as bigint).assertEqual(BigInt(999))
    })

    /**
     * @tc.name   UseSendableTestSupplement2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_2000
     * @tc.desc   Verify @Sendable class implementing custom interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new MultiInterfaceSendable()

      instance.increment()
      instance.increment()

      expect(instance.getCount()).assertEqual(2)

      let task = new taskpool.Task(readMultiCount, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(2)
    })

    /**
     * @tc.name   UseSendableTestSupplement2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_2100
     * @tc.desc   Verify custom Sendable object passed to worker via postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTestSupplement2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance = new SharedSendableData()
      instance.value_ = 100

      let receivedValue: number = -1
      let myWorker = new worker.ThreadWorker('../workers/SendablePassWorker.ets')
      let timeoutId: number = -1
      try {
        await Promise.race([
          new Promise<void>((resolve, reject) => {
            myWorker.onmessage = (e: MessageEvents): void => {
              receivedValue = e.data as number
              resolve()
            }
            myWorker.onerror = (e: ErrorEvent): void => {
              reject(e)
            }
            myWorker.postMessage(instance)
          }),
          new Promise<void>((resolve, reject) => {
            timeoutId = setTimeout((): void => {
              reject(new Error('UseSendableTestSupplement2100: worker reply timeout'))
            }, 5000)
          })
        ])
      } finally {
        if (timeoutId !== -1) {
          clearTimeout(timeoutId)
        }
        myWorker.terminate()
      }

      expect(receivedValue).assertEqual(100)
    })

    /**
     * @tc.name   UseSendableTestSupplement2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_2200
     * @tc.desc   Verify 'use concurrent' directive preceded by a blank line still applies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableFuncWithLeadingBlankLine)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   UseSendableTestSupplement2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_2300
     * @tc.desc   Verify sendable function can define and call an inner lambda
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableFuncWithInnerLambda)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(100)
    })

    /**
     * @tc.name   UseSendableTestSupplement2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_2400
     * @tc.desc   Verify sendable function imported across .ts files and executed by TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableFuncInTsConsumer)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(150)
    })

    /**
     * @tc.name   UseSendableTestSupplement2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_SUPPLEMENT_2500
     * @tc.desc   Verify 10 concurrent TaskPool executions of the same .ts sendable function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTestSupplement2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let promises: Promise<Object>[] = []
      for (let i = 0; i < 10; i++) {
        let task = new taskpool.Task(sendableFuncInTsConsumer)
        promises.push(taskpool.execute(task))
      }

      let results = await Promise.all(promises)

      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(150)
      }
    })
  })
}
