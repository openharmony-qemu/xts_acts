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
import { taskpool, collections, worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import { sendableFuncInTsConsumer } from './SendableTsFuncConsumer';
import { SharedSendableData } from './SendableSharedData';
import { CustomSendable, NumericData, OuterSendable, ResultData } from './UseSendableFuncs';
import {
  sendableFuncInTsSourceDispatch, sendableFuncInTsConsumerDispatch, jsSendableFuncDispatch,
  arraySumDispatch, sendableWithNumberParamDispatch, sendableSquareDispatch,
  sendableWithStringParamDispatch, sendableWithBooleanParamDispatch, sendableReturnBooleanDispatch,
  sendableArrayOpDispatch, sendableMapOpDispatch, mapCountDispatch,
  sendableSetOpDispatch, setDeleteOpDispatch, returnSendableSetDispatch,
  sendableBitVectorOpDispatch, sendableWithArrayBufferDispatch,
  sendableReadValueDispatch, sendableModifyValueDispatch, readNumericDataDispatch,
  readNestedSendableDispatch, modifyNestedSendableDispatch,
  sendableReturnNumberDispatch, sendableReturnStringDispatch,
  sendableReturnArrayDispatch, sendableReturnMapDispatch,
  returnSendableClassDispatch, sendableClassReturnWithPropDispatch,
  sendableCorrectPositionDispatch, sendableFuncWithLeadingBlankLineDispatch,
  sendableNestedFunctionDispatch, callSendableMethodDispatch, readOuterValueDispatch,
  processSharedSendableDataDispatch
} from './UseSendableDispatchers';

interface WorkerReplyTimeout {
  timeoutPromise: Promise<void>;
  cancel: () => void;
}

function createWorkerReplyTimeout(timeoutMs: number, message: string): WorkerReplyTimeout {
  let timeoutId: number = -1;
  const timeoutPromise = new Promise<void>((resolve: () => void, reject: (reason?: Object) => void): void => {
    timeoutId = setTimeout((): void => {
      reject(new Error(message));
    }, timeoutMs);
  });
  const cancel = (): void => {
    if (timeoutId !== -1) {
      clearTimeout(timeoutId);
    }
  };
  return { timeoutPromise: timeoutPromise, cancel: cancel };
}

export default function UseSendableTest(): void {
  describe('UseSendableTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   UseSendableTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0100
     * @tc.desc   Verify sendable function defined in .ets file executed by TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1); arr.push(2); arr.push(3); arr.push(4); arr.push(5)

      let task = new taskpool.Task(arraySumDispatch, arr)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(15)
      done()
    })

    /**
     * @tc.name   UseSendableTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0200
     * @tc.desc   Verify sendable function defined in .ts file executed by TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(sendableFuncInTsSourceDispatch)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(100)
      done()
    })

    /**
     * @tc.name   UseSendableTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0300
     * @tc.desc   Verify sendable function defined in .js file executed by TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(jsSendableFuncDispatch, 21.0)
        let result = await taskpool.execute(task) as number

        expect(result).assertEqual(42)
        done()
      } catch (error) {
        console.error(`UseSendableTest0300 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0400
     * @tc.desc   Verify sendable function with number parameter returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(sendableWithNumberParamDispatch, 21.0)
        let result = await taskpool.execute(task)

        expect(result as number).assertEqual(42)

        let squareTask = new taskpool.Task(sendableSquareDispatch, 8.0)
        let squareResult = await taskpool.execute(squareTask)

        expect(squareResult as number).assertEqual(64)
        done()
      } catch (error) {
        console.error(`UseSendableTest0400 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0500
     * @tc.desc   Verify sendable function with string parameter returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(sendableWithStringParamDispatch, 'hello')
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(5)
      done()
    })

    /**
     * @tc.name   UseSendableTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0600
     * @tc.desc   Verify sendable function with boolean parameter and boolean return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task1 = new taskpool.Task(sendableWithBooleanParamDispatch, true)
        let task2 = new taskpool.Task(sendableWithBooleanParamDispatch, false)

        let result1 = await taskpool.execute(task1)
        let result2 = await taskpool.execute(task2)

        expect(result1 as number).assertEqual(1)
        expect(result2 as number).assertEqual(0)

        let boolTask1 = new taskpool.Task(sendableReturnBooleanDispatch, 42.0)
        let boolTask2 = new taskpool.Task(sendableReturnBooleanDispatch, -1.0)

        let boolResult1 = await taskpool.execute(boolTask1)
        let boolResult2 = await taskpool.execute(boolTask2)

        expect(boolResult1 as boolean).assertTrue()
        expect(boolResult2 as boolean).assertFalse()
        done()
      } catch (error) {
        console.error(`UseSendableTest0600 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0700
     * @tc.desc   Verify sendable function with collections.Array parameter modifies it in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1); arr.push(2); arr.push(3)

      let task = new taskpool.Task(sendableArrayOpDispatch, arr)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(4)
      expect(arr[3]).assertEqual(100)
      done()
    })

    /**
     * @tc.name   UseSendableTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0800
     * @tc.desc   Verify sendable function with collections.Map parameter reads and writes entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let map = new collections.Map<string, number>()
        map.set('a', 1)

        let task = new taskpool.Task(sendableMapOpDispatch, map)
        let result = await taskpool.execute(task)

        expect(result as number).assertEqual(2)
        expect(map.get('result')).assertEqual(42)

        let countMap = new collections.Map<string, number>()
        countMap.set('a', 10)
        countMap.set('b', 20)
        countMap.set('c', 30)

        let countTask = new taskpool.Task(mapCountDispatch, countMap)
        let countResult = await taskpool.execute(countTask)

        expect(countResult as number).assertEqual(3)
        done()
      } catch (error) {
        console.error(`UseSendableTest0800 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_0900
     * @tc.desc   Verify sendable function with collections.Set parameter adds and deletes elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let set = new collections.Set<number>()
        set.add(1)
        set.add(2)

        let task = new taskpool.Task(sendableSetOpDispatch, set)
        let result = await taskpool.execute(task)

        expect(result as number).assertEqual(3)
        expect(set.has(99)).assertTrue()

        let deleteSet = new collections.Set<number>()
        deleteSet.add(1); deleteSet.add(2); deleteSet.add(3)

        let deleteTask = new taskpool.Task(setDeleteOpDispatch, deleteSet)
        let deleteResult = await taskpool.execute(deleteTask)

        expect(deleteResult as number).assertEqual(2)
        expect(deleteSet.has(2)).assertFalse()

        let returnTask = new taskpool.Task(returnSendableSetDispatch)
        let returnResult = await taskpool.execute(returnTask) as collections.Set<number>

        expect(returnResult.size).assertEqual(3)
        expect(returnResult.has(1)).assertTrue()
        expect(returnResult.has(3)).assertTrue()
        done()
      } catch (error) {
        console.error(`UseSendableTest0900 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1000
     * @tc.desc   Verify sendable function with collections.BitVector parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let bv = new collections.BitVector(0)
      bv.push(1)
      bv.push(0)
      bv.push(1)

      let task = new taskpool.Task(sendableBitVectorOpDispatch, bv)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(4)
      expect(bv.length).assertEqual(4)
      done()
    })

    /**
     * @tc.name   UseSendableTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1100
     * @tc.desc   Verify sendable function with ArrayBuffer parameter returns byteLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let ab = new ArrayBuffer(16)

      let task = new taskpool.Task(sendableWithArrayBufferDispatch, ab)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(16)
      done()
    })

    // UseSendableTest1200 merges 8 sub-scenarios for failure localization:
    // 1) read: sendableReadValue reads instance.value_
    // 2) modify: sendableModifyValue writes instance.value_
    // 3) NumericData: readNumericData aggregates NumericData fields
    // 4) nested: read/modify nested Sendable via OuterSendable
    // 5) round-trip: modify then read the same instance
    // 6) isolation: host mutation does not leak into worker copy
    // 7) two-instance concurrent: modify two instances concurrently
    // 8) three-instance concurrent: read three instances concurrently
    /**
     * @tc.name   UseSendableTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1200
     * @tc.desc   Verify sendable function with @Sendable class parameter supports read, modify, nested and round-trip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let instance = new CustomSendable()
        instance.value_ = 42

        let readTask = new taskpool.Task(sendableReadValueDispatch, instance)
        let readResult = await taskpool.execute(readTask)

        expect(readResult as number).assertEqual(42)

        let modifyTask = new taskpool.Task(sendableModifyValueDispatch, instance, 99.0)
        let modifyResult = await taskpool.execute(modifyTask)

        expect(modifyResult as number).assertEqual(99)
        expect(instance.value_).assertEqual(99)

        let container = new NumericData()
        container.numA_ = 3
        container.numB_ = 1
        container.numC_ = 1

        let numericTask = new taskpool.Task(readNumericDataDispatch, container)
        let numericResult = await taskpool.execute(numericTask)

        expect(numericResult as number).assertEqual(5)

        let outer = new OuterSendable()
        outer.setNestedValue(99)

        let nestedReadTask = new taskpool.Task(readNestedSendableDispatch, outer)
        let nestedReadResult = await taskpool.execute(nestedReadTask)

        expect(nestedReadResult as number).assertEqual(99)

        let nestedModifyTask = new taskpool.Task(modifyNestedSendableDispatch, outer, 66.0)
        await taskpool.execute(nestedModifyTask)

        expect(outer.getNestedValue()).assertEqual(66)

        let roundTrip = new CustomSendable()
        roundTrip.value_ = 5

        let roundTripTask1 = new taskpool.Task(sendableModifyValueDispatch, roundTrip, 30.0)
        await taskpool.execute(roundTripTask1)

        let roundTripTask2 = new taskpool.Task(sendableReadValueDispatch, roundTrip)
        let roundTripResult = await taskpool.execute(roundTripTask2)

        expect(roundTripResult as number).assertEqual(30)
        expect(roundTrip.value_).assertEqual(30)

        let isolation = new CustomSendable()
        isolation.setValue(10)

        let isolationTask1 = new taskpool.Task(sendableReadValueDispatch, isolation)
        let isolationResult1 = await taskpool.execute(isolationTask1)

        isolation.addData(5)

        let isolationTask2 = new taskpool.Task(sendableReadValueDispatch, isolation)
        let isolationResult2 = await taskpool.execute(isolationTask2)

        expect(isolationResult1 as number).assertEqual(10)
        expect(isolationResult2 as number).assertEqual(10)
        expect(isolation.data_).assertEqual(5)

        let instance1 = new CustomSendable()
        let instance2 = new CustomSendable()

        let task1 = new taskpool.Task(sendableModifyValueDispatch, instance1, 77.0)
        let task2 = new taskpool.Task(sendableModifyValueDispatch, instance2, 88.0)

        let results = await Promise.all([
          taskpool.execute(task1),
          taskpool.execute(task2)
        ])

        expect(results[0] as number).assertEqual(77)
        expect(results[1] as number).assertEqual(88)
        expect(instance1.value_).assertEqual(77)
        expect(instance2.value_).assertEqual(88)

        let read1 = new CustomSendable()
        read1.value_ = 100
        let read2 = new CustomSendable()
        read2.value_ = 200
        let read3 = new CustomSendable()
        read3.value_ = 300

        let readTask1 = new taskpool.Task(sendableReadValueDispatch, read1)
        let readTask2 = new taskpool.Task(sendableReadValueDispatch, read2)
        let readTask3 = new taskpool.Task(sendableReadValueDispatch, read3)

        let readResults = await Promise.all([
          taskpool.execute(readTask1),
          taskpool.execute(readTask2),
          taskpool.execute(readTask3)
        ])

        expect(readResults[0] as number).assertEqual(100)
        expect(readResults[1] as number).assertEqual(200)
        expect(readResults[2] as number).assertEqual(300)
        done()
      } catch (error) {
        console.error(`UseSendableTest1200 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1300
     * @tc.desc   Verify sendable function returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(sendableReturnNumberDispatch)
      let result = await taskpool.execute(task)

      expect(result as number).assertEqual(42)
      done()
    })

    /**
     * @tc.name   UseSendableTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1400
     * @tc.desc   Verify sendable function returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(sendableReturnStringDispatch)
      let result = await taskpool.execute(task)

      expect(result as string).assertEqual('hello')
      done()
    })

    /**
     * @tc.name   UseSendableTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1500
     * @tc.desc   Verify sendable function returning collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(sendableReturnArrayDispatch)
        let result = await taskpool.execute(task) as collections.Array<number>

        expect(result.length).assertEqual(3)
        expect(result[0]).assertEqual(1)
        expect(result[2]).assertEqual(3)
        done()
      } catch (error) {
        console.error(`UseSendableTest1500 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1600
     * @tc.desc   Verify sendable function returning collections.Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(sendableReturnMapDispatch)
        let result = await taskpool.execute(task) as collections.Map<string, number>

        expect(result.size).assertEqual(2)
        expect(result.get('a')).assertEqual(1)
        expect(result.get('b')).assertEqual(2)
        done()
      } catch (error) {
        console.error(`UseSendableTest1600 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1700
     * @tc.desc   Verify sendable function returning @Sendable class instance with property verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let initData = new ResultData()

        let task = new taskpool.Task(returnSendableClassDispatch, initData)
        let result = await taskpool.execute(task) as ResultData

        expect(result.value_).assertEqual(100)

        let initData2 = new ResultData()

        let task2 = new taskpool.Task(sendableClassReturnWithPropDispatch, initData2)
        let result2 = await taskpool.execute(task2) as ResultData

        expect(result2.value_).assertEqual(77)
        done()
      } catch (error) {
        console.error(`UseSendableTest1700 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1800
     * @tc.desc   Verify 'use sendable' at first line of function body (correct position)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(sendableCorrectPositionDispatch)
      let result: Object = undefined
      try {
        result = await taskpool.execute(task)
      } catch (error) {
        console.error(`UseSendableTest1800 failed: ${error}`)
        expect().assertFail()
        done()
        return
      }

      expect(result as number).assertEqual(42)
      done()
    })

    /**
     * @tc.name   UseSendableTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_1900
     * @tc.desc   Verify 'use sendable' preceded by a blank line still applies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(sendableFuncWithLeadingBlankLineDispatch)
      try {
        let result = await taskpool.execute(task)
      } catch (cleanupError) {
        console.warn(`async await failed: ${cleanupError}`)
      }

      expect(result as number).assertEqual(42)
      done()
    })

    /**
     * @tc.name   UseSendableTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2000
     * @tc.desc   Verify nested function with 'use sendable' inside sendable function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(sendableNestedFunctionDispatch)
      try {
        let result = await taskpool.execute(task)
      } catch (error) {
        console.error(`async await failed: ${error}`)
        expect().assertFail()
      }

      expect(result as number).assertEqual(100)
      done()
    })

    /**
     * @tc.name   UseSendableTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2100
     * @tc.desc   Verify .ets file imports .ts sendable function and executes it by TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(sendableFuncInTsConsumerDispatch)
      try {
        let result = await taskpool.execute(task)
      } catch (error) {
        console.error(`async await failed: ${error}`)
        expect().assertFail()
      }

      expect(result as number).assertEqual(150)
      done()
    })

    /**
     * @tc.name   UseSendableTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2200
     * @tc.desc   Verify .ets file imports .js sendable function and executes it by TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseSendableTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1 = new taskpool.Task(jsSendableFuncDispatch, 10.0)
      let task2 = new taskpool.Task(jsSendableFuncDispatch, 20.0)
      let results: Object[] = []
      try {
        results = await Promise.all([
          taskpool.execute(task1),
          taskpool.execute(task2)
        ]) as Object[]
      } catch (error) {
        console.error(`UseSendableTest2200 failed: ${error}`)
        expect().assertFail()
        done()
        return
      }

      expect(results[0] as number).assertEqual(20)
      expect(results[1] as number).assertEqual(40)
      done()
    })

    /**
     * @tc.name   UseSendableTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2300
     * @tc.desc   Verify .ts file imports another .ts sendable function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let result = sendableFuncInTsConsumer()

      expect(result).assertEqual(150)
    })

    /**
     * @tc.name   UseSendableTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2400
     * @tc.desc   Verify @Sendable class and 'use sendable' function mixed in same file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let instance = new CustomSendable()

        let task = new taskpool.Task(callSendableMethodDispatch, instance)
        let result = await taskpool.execute(task)

        expect(result as number).assertEqual(50)
        expect(instance.data_).assertEqual(10)

        let outerInstance = new CustomSendable()
        outerInstance.setValue(77)

        let outerTask = new taskpool.Task(readOuterValueDispatch, outerInstance)
        let outerResult = await taskpool.execute(outerTask)

        expect(outerResult as number).assertEqual(77)
        done()
      } catch (error) {
        console.error(`UseSendableTest2400 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2500
     * @tc.desc   Verify cross-file mixed import of @Sendable class and 'use sendable' function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseSendableTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let shared = new SharedSendableData()
        shared.value_ = 77

        let task = new taskpool.Task(processSharedSendableDataDispatch, shared)
        let result = await taskpool.execute(task)

        expect(result as number).assertEqual(77)
        expect(shared.value_).assertEqual(77)
        done()
      } catch (error) {
        console.error(`UseSendableTest2500 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2600
     * @tc.desc   Verify .ts sendable functions executed across TaskPool threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UseSendableTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let task1 = new taskpool.Task(sendableFuncInTsSourceDispatch)
        let task2 = new taskpool.Task(sendableFuncInTsConsumerDispatch)

        let results = await Promise.all([
          taskpool.execute(task1),
          taskpool.execute(task2)
        ])

        expect(results[0] as number).assertEqual(100)
        expect(results[1] as number).assertEqual(150)
        done()
      } catch (error) {
        console.error(`UseSendableTest2600 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2700
     * @tc.desc   Verify Worker processes data through .ts sendable function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UseSendableTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let inputValue: number = 50
        let receivedValue: number = -1
        let myWorker = new worker.ThreadWorker('../workers/SendableTsFuncWorker.ets')
        const replyTimeout = createWorkerReplyTimeout(5000, 'UseSendableTest2700: worker reply timeout')
        try {
          await Promise.race([
            new Promise<void>((resolve, reject): void => {
              myWorker.onmessage = (e: MessageEvents): void => {
                receivedValue = e.data as number
                resolve()
              }
              myWorker.onerror = (e: ErrorEvent): void => {
                reject(e)
              }
              myWorker.postMessage(inputValue)
            }),
            replyTimeout.timeoutPromise
          ])
        } finally {
          replyTimeout.cancel()
          try {
            myWorker.terminate()
          } catch (e) {
            console.warn(`UseSendableTest2700 terminate failed: ${e}`)
          }
        }

        // sendableFuncInTsSource() returns 100, plus inputValue 50 = 150
        expect(receivedValue).assertEqual(150)
        done()
      } catch (error) {
        console.error(`UseSendableTest2700 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   UseSendableTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_TEST_2800
     * @tc.desc   Verify 10 concurrent TaskPool executions of .ts sendable functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UseSendableTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let promises: Promise<Object>[] = []
        for (let i = 0; i < 10; i++) {
          let task = new taskpool.Task(sendableFuncInTsConsumerDispatch)
          promises.push(taskpool.execute(task))
        }

        let results = await Promise.all(promises)

        expect(results.length).assertEqual(10)
        for (let i = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(150)
        }

        let instance = new CustomSendable()
        instance.value_ = 50

        let extraTasks = await Promise.all([
          taskpool.execute(new taskpool.Task(sendableReadValueDispatch, instance)),
          taskpool.execute(new taskpool.Task(sendableReturnNumberDispatch)),
          taskpool.execute(new taskpool.Task(sendableWithNumberParamDispatch, 10.0))
        ])

        expect(extraTasks[0] as number).assertEqual(50)
        expect(extraTasks[1] as number).assertEqual(42)
        expect(extraTasks[2] as number).assertEqual(20)
        done()
      } catch (error) {
        console.error(`UseSendableTest2800 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })
  })
}
