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
import { taskpool, collections } from '@kit.ArkTS';

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
class NumericData {
  public numA_: number = 0
  public numB_: number = 0
  public numC_: number = 0
}

function sendableArrayOp(arr: collections.Array<number>): number {
  'use concurrent'
  arr.push(100)
  return arr.length
}

function sendableMapOp(map: collections.Map<string, number>): number {
  'use concurrent'
  map.set('result', 42)
  return map.size
}

function sendableSetOp(set: collections.Set<number>): number {
  'use concurrent'
  set.add(99)
  return set.size
}

function sendableBitVectorOp(bv: collections.BitVector): number {
  'use concurrent'
  bv.push(1)
  return bv.length
}

function sendableReadValue(instance: CustomSendable): number {
  'use concurrent'
  return instance.value_
}

function sendableModifyValue(instance: CustomSendable, val: number): number {
  'use concurrent'
  instance.value_ = val
  return instance.value_
}

function sendableReturnArray(): collections.Array<number> {
  'use concurrent'
  let arr = new collections.Array<number>()
  arr.push(1); arr.push(2); arr.push(3)
  return arr
}

function sendableReturnNumber(): number {
  'use concurrent'
  return 42
}

function sendableReturnString(): string {
  'use concurrent'
  return 'hello'
}

function sendableWithNumberParam(n: number): number {
  'use concurrent'
  return n * 2
}

function sendableWithStringParam(s: string): number {
  'use concurrent'
  return s.length
}

function sendableWithBooleanParam(b: boolean): number {
  'use concurrent'
  return b ? 1 : 0
}

function sendableReturnBoolean(val: number): boolean {
  'use concurrent'
  return val > 0
}

function sendableReturnMap(): collections.Map<string, number> {
  'use concurrent'
  let map = new collections.Map<string, number>()
  map.set('a', 1)
  map.set('b', 2)
  return map
}

function sendableWithArrayBuffer(ab: ArrayBuffer): number {
  'use concurrent'
  return ab.byteLength
}

function sendableSquare(n: number): number {
  'use concurrent'
  return n * n
}

function readNumericData(c: NumericData): number {
  'use concurrent'
  return c.numA_ + c.numB_ + c.numC_
}

function readOuterValue(outer: CustomSendable): number {
  'use concurrent'
  return outer.getValue()
}

export default function useSendableTest(): void {
  describe('UseSendableTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   UseSendableTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0100
     * @tc.desc   Verify concurrent function with collections.Array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1); arr.push(2); arr.push(3)

      let task = new taskpool.Task(sendableArrayOp, arr)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(4)
    })

    /**
     * @tc.name   UseSendableTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0200
     * @tc.desc   Verify concurrent function with collections.Map parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let map = new collections.Map<string, number>()
      map.set('a', 1)

      let task = new taskpool.Task(sendableMapOp, map)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(2)
    })

    /**
     * @tc.name   UseSendableTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0300
     * @tc.desc   Verify concurrent function with collections.Set parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)

      let task = new taskpool.Task(sendableSetOp, set)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   UseSendableTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0400
     * @tc.desc   Verify concurrent function with @Sendable class parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.value_ = 42

      let task = new taskpool.Task(sendableReadValue, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   UseSendableTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0500
     * @tc.desc   Verify concurrent function modifying @Sendable class property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let instance = new CustomSendable()

      let task = new taskpool.Task(sendableModifyValue, instance, 99.0)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(99)
      expect(instance.value_).assertEqual(99)
    })

    /**
     * @tc.name   UseSendableTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0600
     * @tc.desc   Verify concurrent function returning collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableReturnArray)
      let result = await taskpool.execute(task) as collections.Array<number>

      expect(result.length).assertEqual(3)
    })

    /**
     * @tc.name   UseSendableTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0700
     * @tc.desc   Verify concurrent function returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableReturnNumber)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   UseSendableTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0800
     * @tc.desc   Verify concurrent function returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableReturnString)
      let result = await taskpool.execute(task)

      expect(result as string).assertEqual('hello')
    })

    /**
     * @tc.name   UseSendableTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0900
     * @tc.desc   Verify concurrent function with number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableWithNumberParam, 21.0)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   UseSendableTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1000
     * @tc.desc   Verify concurrent function with string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableWithStringParam, 'hello')
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(5)
    })

    /**
     * @tc.name   UseSendableTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1100
     * @tc.desc   Verify concurrent function with boolean parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task1 = new taskpool.Task(sendableWithBooleanParam, true)
      let task2 = new taskpool.Task(sendableWithBooleanParam, false)

      let result1 = await taskpool.execute(task1)
      let result2 = await taskpool.execute(task2)

      expect(result1 as number).assertEqual(1)
      expect(result2 as number).assertEqual(0)
    })

    /**
     * @tc.name   UseSendableTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1200
     * @tc.desc   Verify concurrent function with NumericData object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let container = new NumericData()
      container.numA_ = 3
      container.numB_ = 1
      container.numC_ = 1

      let task = new taskpool.Task(readNumericData, container)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(5)
    })

    /**
     * @tc.name   UseSendableTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1300
     * @tc.desc   Verify multiple tasks return correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.value_ = 50

      let task1 = new taskpool.Task(sendableReadValue, instance)
      let task2 = new taskpool.Task(sendableReturnNumber)
      let task3 = new taskpool.Task(sendableWithNumberParam, 10.0)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2),
        taskpool.execute(task3)
      ])

      expect(results[0] as number).assertEqual(50)
      expect(results[1] as number).assertEqual(42)
      expect(results[2] as number).assertEqual(20)
    })

    /**
     * @tc.name   UseSendableTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1400
     * @tc.desc   Verify concurrent function with nested @Sendable class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.setValue(77)

      let task = new taskpool.Task(readOuterValue, instance)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(77)
    })

    /**
     * @tc.name   UseSendableTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1500
     * @tc.desc   Verify concurrent function returning boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task1 = new taskpool.Task(sendableReturnBoolean, 42.0)
      let task2 = new taskpool.Task(sendableReturnBoolean, -1.0)

      let result1 = await taskpool.execute(task1)
      let result2 = await taskpool.execute(task2)

      expect(result1 as boolean).assertTrue()
      expect(result2 as boolean).assertFalse()
    })

    /**
     * @tc.name   UseSendableTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1600
     * @tc.desc   Verify concurrent function returning collections.Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableReturnMap)
      let result = await taskpool.execute(task) as collections.Map<string, number>

      expect(result.size).assertEqual(2)
      expect(result.get('a')).assertEqual(1)
      expect(result.get('b')).assertEqual(2)
    })

    /**
     * @tc.name   UseSendableTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1700
     * @tc.desc   Verify concurrent function computing square of number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(sendableSquare, 8.0)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(64)
    })

    /**
     * @tc.name   UseSendableTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1800
     * @tc.desc   Verify concurrent function with ArrayBuffer parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let ab = new ArrayBuffer(16)

      let task = new taskpool.Task(sendableWithArrayBuffer, ab)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(16)
    })

    /**
     * @tc.name   UseSendableTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1900
     * @tc.desc   Verify Sendable property modification of one field does not affect reads of another field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance = new CustomSendable()
      instance.setValue(10)

      let task1 = new taskpool.Task(sendableReadValue, instance)
      let result1 = await taskpool.execute(task1)

      instance.addData(5)

      let task2 = new taskpool.Task(sendableReadValue, instance)
      let result2 = await taskpool.execute(task2)

      expect(result1 as number).assertEqual(10)
      expect(result2 as number).assertEqual(10)
      expect(instance.data_).assertEqual(5)
    })

    /**
     * @tc.name   UseSendableTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2000
     * @tc.desc   Verify two independent Sendable instances modified concurrently stay isolated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let instance1 = new CustomSendable()
      let instance2 = new CustomSendable()

      let task1 = new taskpool.Task(sendableModifyValue, instance1, 77.0)
      let task2 = new taskpool.Task(sendableModifyValue, instance2, 88.0)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2)
      ])

      expect(results[0] as number).assertEqual(77)
      expect(results[1] as number).assertEqual(88)
      expect(instance1.value_).assertEqual(77)
      expect(instance2.value_).assertEqual(88)
    })

    /**
     * @tc.name   UseSendableTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2100
     * @tc.desc   Verify concurrent function with collections.BitVector parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let bv = new collections.BitVector(0)
      bv.push(1)
      bv.push(0)
      bv.push(1)

      let task = new taskpool.Task(sendableBitVectorOp, bv)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(4)
      expect(bv.length).assertEqual(4)
    })
  })
}
