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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool, collections } from '@kit.ArkTS';
import { ComplexData } from './TaskpoolSharedData';

@Concurrent
function sendDataStringTask(): number {
  taskpool.Task.sendData('hello from task')
  return 100
}

@Concurrent
function sendDataMultiTask(): number {
  taskpool.Task.sendData(10)
  taskpool.Task.sendData(20)
  taskpool.Task.sendData(30)
  return 60
}

@Concurrent
function sendDataProgressTask(): number {
  taskpool.Task.sendData(25)
  taskpool.Task.sendData(50)
  taskpool.Task.sendData(75)
  taskpool.Task.sendData(100)
  return 200
}

@Concurrent
function sendDataComplexTask(data: ComplexData): number {
  taskpool.Task.sendData(data)
  return 999
}

@Concurrent
function sendDataNumberTask(): number {
  taskpool.Task.sendData(42)
  taskpool.Task.sendData(3.14)
  return 100
}

@Concurrent
function sendDataBoolTask(): number {
  taskpool.Task.sendData(true)
  taskpool.Task.sendData(false)
  return 50
}

@Concurrent
function sendDataNullTask(): number {
  taskpool.Task.sendData(null)
  return 30
}

@Concurrent
function sendDataUndefinedTask(): number {
  taskpool.Task.sendData(undefined)
  return 40
}

@Concurrent
function sendDataMultiNotifyTask(taskId: number): number {
  taskpool.Task.sendData(taskId * 10)
  taskpool.Task.sendData(taskId * 20)
  return taskId * 100
}

@Concurrent
function sendDataArrayTask(): number {
  let arr = new collections.Array<number>()
  arr.push(1, 2, 3, 4, 5)
  taskpool.Task.sendData(arr)
  return 55
}

@Concurrent
function sendDataBatchTask(count: number): number {
  for (let i: number = 0; i < count; i++) {
    taskpool.Task.sendData(i)
  }
  return count
}

@Concurrent
function sendDataEmptyStringTask(): number {
  taskpool.Task.sendData('')
  return 10
}

export default function TaskpoolCommunicationTest(): void {
  describe('TaskpoolCommunicationTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   TaskpoolCommunicationTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0100
     * @tc.desc   Verify Task.sendData sends string data from worker thread received by onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCommunicationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let receivedData = new collections.Array<string>()
      let task: taskpool.Task = new taskpool.Task(sendDataStringTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedData.push(data as string)
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
      await dataPromise
      expect(receivedData.length).assertLargerOrEqual(1)
      expect(receivedData[0]).assertEqual('hello from task')
    })

    /**
     * @tc.name   TaskpoolCommunicationTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0200
     * @tc.desc   Verify onReceiveData callback receives all multiple sendData messages in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCommunicationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let receivedValues = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(sendDataMultiTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedValues.push(data as number)
          if (receivedValues.length >= 3) {
            resolve()
          }
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(60)
      await dataPromise
      expect(receivedValues.length).assertEqual(3)
      expect(receivedValues[0]).assertEqual(10)
      expect(receivedValues[1]).assertEqual(20)
      expect(receivedValues[2]).assertEqual(30)
    })

    /**
     * @tc.name   TaskpoolCommunicationTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0300
     * @tc.desc   Verify real-time progress notification with 4 sequential sendData calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let progressData = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(sendDataProgressTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          progressData.push(data as number)
          if (progressData.length >= 4) {
            resolve()
          }
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(200)
      await dataPromise
      expect(progressData.length).assertEqual(4)
      expect(progressData[0]).assertEqual(25)
      expect(progressData[1]).assertEqual(50)
      expect(progressData[2]).assertEqual(75)
      expect(progressData[3]).assertEqual(100)
    })

    /**
     * @tc.name   TaskpoolCommunicationTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0400
     * @tc.desc   Verify sendData transfers complex Sendable object with nested collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedObj = new collections.Array<ComplexData>()
      let data: ComplexData = new ComplexData()
      data.id = 1
      data.name = 'test'
      data.valueCount = 3
      let task: taskpool.Task = new taskpool.Task(sendDataComplexTask, data)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((d: Object): void => {
          receivedObj.push(d as ComplexData)
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(999)
      await dataPromise
      expect(receivedObj.length).assertLargerOrEqual(1)
      expect(receivedObj[0].id).assertEqual(1)
      expect(receivedObj[0].name).assertEqual('test')
      expect(receivedObj[0].valueCount).assertEqual(3)
    })

    /**
     * @tc.name   TaskpoolCommunicationTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0500
     * @tc.desc   Verify sendData transfers number types including integer and float correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedNumbers = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(sendDataNumberTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedNumbers.push(data as number)
          if (receivedNumbers.length >= 2) {
            resolve()
          }
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
      await dataPromise
      expect(receivedNumbers.length).assertEqual(2)
      expect(receivedNumbers[0]).assertEqual(42)
      expect(receivedNumbers[1]).assertEqual(3.14)
    })

    /**
     * @tc.name   TaskpoolCommunicationTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0600
     * @tc.desc   Verify sendData transfers boolean values true and false correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedBools = new collections.Array<boolean>()
      let task: taskpool.Task = new taskpool.Task(sendDataBoolTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedBools.push(data as boolean)
          if (receivedBools.length >= 2) {
            resolve()
          }
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(50)
      await dataPromise
      expect(receivedBools.length).assertEqual(2)
      expect(receivedBools[0]).assertTrue()
      expect(receivedBools[1]).assertFalse()
    })

    /**
     * @tc.name   TaskpoolCommunicationTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0700
     * @tc.desc   Verify sendData with null value is received correctly by onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataNullTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedCount++
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(30)
      await dataPromise
      expect(receivedCount).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   TaskpoolCommunicationTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0800
     * @tc.desc   Verify sendData with undefined value is received by onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataUndefinedTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedCount++
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(40)
      await dataPromise
      expect(receivedCount).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   TaskpoolCommunicationTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_0900
     * @tc.desc   Verify multiple tasks with sendData correctly route messages to respective onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task1Data = new collections.Array<number>()
      let task2Data = new collections.Array<number>()

      let task1: taskpool.Task = new taskpool.Task(sendDataMultiNotifyTask, 1)
      let task1Promise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task1.onReceiveData((data: Object): void => {
          task1Data.push(data as number)
          if (task1Data.length >= 2) {
            resolve()
          }
        })
      })

      let task2: taskpool.Task = new taskpool.Task(sendDataMultiNotifyTask, 2)
      let task2Promise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task2.onReceiveData((data: Object): void => {
          task2Data.push(data as number)
          if (task2Data.length >= 2) {
            resolve()
          }
        })
      })

      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      let results: Array<Object> = await Promise.all([p1, p2])

      expect(results[0] as number).assertEqual(100)
      expect(results[1] as number).assertEqual(200)

      await Promise.all([task1Promise, task2Promise])
      expect(task1Data.length).assertEqual(2)
      expect(task1Data[0]).assertEqual(10)
      expect(task1Data[1]).assertEqual(20)
      expect(task2Data.length).assertEqual(2)
      expect(task2Data[0]).assertEqual(20)
      expect(task2Data[1]).assertEqual(40)
    })

    /**
     * @tc.name   TaskpoolCommunicationTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_1000
     * @tc.desc   Verify sendData transfers collections.Array data structure correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedArrays = new collections.Array<collections.Array<number>>()
      let task: taskpool.Task = new taskpool.Task(sendDataArrayTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedArrays.push(data as collections.Array<number>)
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(55)
      await dataPromise
      expect(receivedArrays.length).assertLargerOrEqual(1)
      expect(receivedArrays[0].length).assertEqual(5)
      expect(receivedArrays[0][0]).assertEqual(1)
      expect(receivedArrays[0][4]).assertEqual(5)
    })

    /**
     * @tc.name   TaskpoolCommunicationTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_1100
     * @tc.desc   Verify batch sendData with 10 messages all received by onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCommunicationTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let receivedBatch = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(sendDataBatchTask, 10)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedBatch.push(data as number)
          if (receivedBatch.length >= 10) {
            resolve()
          }
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10)
      await dataPromise
      expect(receivedBatch.length).assertEqual(10)
      for (let i: number = 0; i < receivedBatch.length; i++) {
        expect(receivedBatch[i]).assertEqual(i)
      }
    })

    /**
     * @tc.name   TaskpoolCommunicationTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_COMMUNICATION_TEST_1200
     * @tc.desc   Verify sendData with empty string is received correctly by host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCommunicationTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedStrings = new collections.Array<string>()
      let task: taskpool.Task = new taskpool.Task(sendDataEmptyStringTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedStrings.push(data as string)
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10)
      await dataPromise
      expect(receivedStrings.length).assertLargerOrEqual(1)
      expect(receivedStrings[0]).assertEqual('')
    })
  })
}
