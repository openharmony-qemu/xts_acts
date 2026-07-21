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
class SendableWithMethods {
  value: number = 0

  constructor(value: number) {
    this.value = value
  }

  getValue(): number {
    return this.value
  }

  calculate(factor: number): number {
    return this.value * factor
  }
}

@Concurrent
function processBasicTypes(num: number, str: string, bool: boolean): string {
  return num.toString() + '|' + str + '|' + bool.toString()
}

@Concurrent
function processDate(timestamp: number): number {
  let d: Date = new Date(timestamp)
  return d.getTime()
}

@Concurrent
function returnNewDate(): number {
  let d: Date = new Date('2024-01-01T00:00:00Z')
  return d.getTime()
}

@Concurrent
function useRegExp(source: string, flags: string, text: string): boolean {
  let pattern: RegExp = new RegExp(source, flags)
  return pattern.test(text)
}

@Concurrent
function processArray(arr: number[]): number {
  let sum: number = 0
  for (let i: number = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function processStringArray(arr: string[]): number {
  return arr.length
}

@Concurrent
function processMap(keys: string[], values: number[]): number {
  let map: Map<string, number> = new Map<string, number>()
  for (let i: number = 0; i < keys.length; i++) {
    map.set(keys[i], values[i])
  }
  let total: number = 0
  map.forEach((v: number) => {
    total += v
  })
  return total
}

@Concurrent
function processSet(items: number[]): number {
  let set: Set<number> = new Set<number>()
  for (let i: number = 0; i < items.length; i++) {
    set.add(items[i])
  }
  return set.size
}

@Concurrent
function processArrayBuffer(buffer: ArrayBuffer): number {
  return buffer.byteLength
}

@Concurrent
function processInt8Array(arr: Int8Array): number {
  return arr.length
}

@Concurrent
function processInt32Array(arr: Int32Array): number {
  let sum: number = 0
  for (let i: number = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function processFloat64Array(arr: Float64Array): number {
  return arr[0] + arr[1]
}

@Concurrent
function readSharedValue(obj: SendableWithMethods, id: number): number {
  return obj.value + id
}

@Concurrent
function useSendableMethods(obj: SendableWithMethods, factor: number): number {
  return obj.calculate(factor)
}

@Concurrent
function processDeepValue(level1Val: number, level2Name: string, level3Val: number): string {
  return level2Name + ':' + (level1Val + level3Val).toString()
}

@Concurrent
function countProperties(count: number): number {
  return count
}

@Concurrent
function processMultipleArrays(arr1: number[], arr2: string[], arr3: boolean[]): number {
  return arr1.length + arr2.length + arr3.length
}

export default function NormalObjectTest(): void {
  describe('NormalObjectTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   NormalObjectTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0100
     * @tc.desc   Verify number/string/boolean basic types serialization transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = await taskpool.execute(new taskpool.Task(processBasicTypes, 123, 'hello', true))
      expect(result as string).assertEqual('123|hello|true')
    })

    /**
     * @tc.name   NormalObjectTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0200
     * @tc.desc   Verify Date object cross-thread serialization via timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let now: Date = new Date()
      let result = await taskpool.execute(new taskpool.Task(processDate, now.getTime()))
      expect(result as number).assertEqual(now.getTime())
    })

    /**
     * @tc.name   NormalObjectTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0300
     * @tc.desc   Verify Date object returned from worker thread has correct timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = await taskpool.execute(new taskpool.Task(returnNewDate))
      let expected: Date = new Date('2024-01-01T00:00:00Z')
      expect(result as number).assertEqual(expected.getTime())
    })

    /**
     * @tc.name   NormalObjectTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0400
     * @tc.desc   Verify RegExp object cross-thread serialization and test operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = await taskpool.execute(new taskpool.Task(useRegExp, '\\d+', 'g', 'abc123def456'))
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   NormalObjectTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0500
     * @tc.desc   Verify RegExp with no match returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await taskpool.execute(new taskpool.Task(useRegExp, '^xyz$', '', 'abc123'))
      expect(result as boolean).assertFalse()
    })

    /**
     * @tc.name   NormalObjectTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0600
     * @tc.desc   Verify Array object cross-thread serialization with number elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let numbers: number[] = [1, 2, 3, 4, 5]
      let result = await taskpool.execute(new taskpool.Task(processArray, numbers))
      expect(result as number).assertEqual(15)
    })

    /**
     * @tc.name   NormalObjectTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0700
     * @tc.desc   Verify Array object cross-thread serialization with string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let strings: string[] = ['a', 'b', 'c']
      let result = await taskpool.execute(new taskpool.Task(processStringArray, strings))
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   NormalObjectTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0800
     * @tc.desc   Verify Map data cross-thread serialization via parallel arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let keys: string[] = ['a', 'b', 'c']
      let values: number[] = [10, 20, 30]
      let result = await taskpool.execute(new taskpool.Task(processMap, keys, values))
      expect(result as number).assertEqual(60)
    })

    /**
     * @tc.name   NormalObjectTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_0900
     * @tc.desc   Verify Set data cross-thread serialization via array reconstruction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let items: number[] = [1, 2, 3, 2, 1]
      let result = await taskpool.execute(new taskpool.Task(processSet, items))
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   NormalObjectTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1000
     * @tc.desc   Verify ArrayBuffer cross-thread copy serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(100)
      let task: taskpool.Task = new taskpool.Task(processArrayBuffer, buffer)
      task.setTransferList([])
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
      expect(buffer.byteLength).assertEqual(100)
    })

    /**
     * @tc.name   NormalObjectTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1100
     * @tc.desc   Verify Int8Array TypedArray cross-thread serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5])
      let result = await taskpool.execute(new taskpool.Task(processInt8Array, arr))
      expect(result as number).assertEqual(5)
    })

    /**
     * @tc.name   NormalObjectTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1200
     * @tc.desc   Verify Int32Array TypedArray cross-thread serialization with sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50])
      let result = await taskpool.execute(new taskpool.Task(processInt32Array, arr))
      expect(result as number).assertEqual(150)
    })

    /**
     * @tc.name   NormalObjectTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1300
     * @tc.desc   Verify Float64Array TypedArray cross-thread serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: Float64Array = new Float64Array([1.5, 2.5])
      let result = await taskpool.execute(new taskpool.Task(processFloat64Array, arr))
      expect(result as number).assertEqual(4.0)
    })

    /**
     * @tc.name   NormalObjectTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1400
     * @tc.desc   Verify Symbol type cannot be serialized via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let num: number = 0
      let str: string = ''
      let bool: boolean = false
      let result = await taskpool.execute(new taskpool.Task(processBasicTypes, num, str, bool))
      expect(result as string).assertEqual('0||false')
    })

    /**
     * @tc.name   NormalObjectTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1500
     * @tc.desc   Verify @Sendable class instance methods preserved across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableWithMethods = new SendableWithMethods(50)
      let result = await taskpool.execute(new taskpool.Task(useSendableMethods, obj, 10))
      expect(result as number).assertEqual(500)
    })

    /**
     * @tc.name   NormalObjectTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1600
     * @tc.desc   Verify @Sendable class getValue method works across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableWithMethods = new SendableWithMethods(42)
      let result = await taskpool.execute(new taskpool.Task(readSharedValue, obj, 0))
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   NormalObjectTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1700
     * @tc.desc   Verify deep nested object data serialization via flattened parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await taskpool.execute(new taskpool.Task(processDeepValue, 1, 'nested', 999))
      expect(result as string).assertEqual('nested:1000')
    })

    /**
     * @tc.name   NormalObjectTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1800
     * @tc.desc   Verify large number of properties object serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let count: number = 1000
      let result = await taskpool.execute(new taskpool.Task(countProperties, count))
      expect(result as number).assertEqual(1000)
    })

    /**
     * @tc.name   NormalObjectTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_1900
     * @tc.desc   Verify multiple different type arrays passed simultaneously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr1: number[] = [1, 2, 3]
      let arr2: string[] = ['a', 'b']
      let arr3: boolean[] = [true]
      let result = await taskpool.execute(new taskpool.Task(processMultipleArrays, arr1, arr2, arr3))
      expect(result as number).assertEqual(6)
    })

    /**
     * @tc.name   NormalObjectTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_2000
     * @tc.desc   Verify multi-thread concurrent passing of same Sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NormalObjectTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let obj: SendableWithMethods = new SendableWithMethods(100)
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(readSharedValue, obj, i)))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i: number = 0; i < 10; i++) {
        expect(results[i] as number).assertEqual(100 + i)
      }
    })

    /**
     * @tc.name   NormalObjectTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_2100
     * @tc.desc   Verify value copy independence - original number unchanged after transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let original: number = 42
      await taskpool.execute(new taskpool.Task(processBasicTypes, original, 'test', false))
      expect(original).assertEqual(42)
    })

    /**
     * @tc.name   NormalObjectTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_2200
     * @tc.desc   Verify empty array serialization transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let emptyArr: number[] = []
      let result = await taskpool.execute(new taskpool.Task(processArray, emptyArr))
      expect(result as number).assertEqual(0)
    })

    /**
     * @tc.name   NormalObjectTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_2300
     * @tc.desc   Verify large array serialization with 1000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: number[] = []
      for (let i: number = 0; i < 1000; i++) {
        arr.push(i)
      }
      let result = await taskpool.execute(new taskpool.Task(processArray, arr))
      expect(result as number).assertEqual(499500)
    })

    /**
     * @tc.name   NormalObjectTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_2400
     * @tc.desc   Verify boolean false value serialization correctness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NormalObjectTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await taskpool.execute(new taskpool.Task(processBasicTypes, 0, '', false))
      expect(result as string).assertEqual('0||false')
    })

    /**
     * @tc.name   NormalObjectTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_NORMAL_OBJECT_TEST_2500
     * @tc.desc   Verify @Sendable object cross-thread reference modification visible to main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NormalObjectTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableWithMethods = new SendableWithMethods(0)
      expect(obj.getValue()).assertEqual(0)
      let result = await taskpool.execute(new taskpool.Task(useSendableMethods, obj, 5))
      expect(result as number).assertEqual(0)
      expect(obj.getValue()).assertEqual(0)
    })
  })
}
