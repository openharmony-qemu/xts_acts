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
import { taskpool } from '@kit.ArkTS';

@Sendable
class SharedCounter {
  counter: number = 0
}

@Sendable
class TaskData {
  value: number = 0
}

@Concurrent
function processArrayBuffer(buffer: ArrayBuffer): number {
  let view: Int32Array = new Int32Array(buffer)
  return view[0] + view[1]
}

@Concurrent
function modifySharedBuffer(buffer: SharedArrayBuffer): number {
  let view: Int32Array = new Int32Array(buffer)
  Atomics.add(view, 0, 1)
  return Atomics.load(view, 0)
}

@Concurrent
function incrementShared(obj: SharedCounter): number {
  obj.counter++
  return obj.counter
}

@Concurrent
function taskA(data: TaskData): number {
  data.value = 100
  return data.value
}

@Concurrent
function taskB(data: TaskData): number {
  return data.value + 50
}

@Concurrent
function basicTypesTask(num: number, str: string, bool: boolean): string {
  return num.toString() + '-' + str + '-' + bool.toString()
}

@Concurrent
function arrayProcessTask(data: number[]): number {
  let sum: number = 0
  for (let i: number = 0; i < data.length; i++) {
    sum += data[i]
  }
  return sum
}

@Concurrent
function cloneCheckTask(name: string, value: number): string {
  return name + ':' + value.toString()
}

export default function InterthreadCommunicationTest(): void {
  describe('InterthreadCommunicationTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   InterthreadCommunicationTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_COMMUNICATION_TEST_0100
     * @tc.desc   Verify Structured Clone algorithm with object serialization across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadCommunicationTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(cloneCheckTask, 'test', 42)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('test:42')
    })

    /**
     * @tc.name   InterthreadCommunicationTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_COMMUNICATION_TEST_0200
     * @tc.desc   Verify ArrayBuffer cross-thread transfer behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadCommunicationTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer: ArrayBuffer = new ArrayBuffer(8)
      let view: Int32Array = new Int32Array(buffer)
      view[0] = 10
      view[1] = 20
      let task: taskpool.Task = new taskpool.Task(processArrayBuffer, buffer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(30)
    })

    /**
     * @tc.name   InterthreadCommunicationTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_COMMUNICATION_TEST_0300
     * @tc.desc   Verify SharedArrayBuffer cross-thread shared access with atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InterthreadCommunicationTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: SharedArrayBuffer = new SharedArrayBuffer(4)
      let view: Int32Array = new Int32Array(buffer)
      Atomics.store(view, 0, 0)

      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(modifySharedBuffer, buffer)))
      }
      await Promise.all(promises)
      expect(Atomics.load(view, 0)).assertEqual(10)
    })

    /**
     * @tc.name   InterthreadCommunicationTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_COMMUNICATION_TEST_0400
     * @tc.desc   Verify Sendable object cross-thread sharing with concurrent modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadCommunicationTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedObj1: SharedCounter = new SharedCounter()
      let r1 = await taskpool.execute(new taskpool.Task(incrementShared, sharedObj1)) as number
      expect(r1).assertEqual(1)
      let sharedObj2: SharedCounter = new SharedCounter()
      sharedObj2.counter = 9
      let r2 = await taskpool.execute(new taskpool.Task(incrementShared, sharedObj2)) as number
      expect(r2).assertEqual(10)
    })

    /**
     * @tc.name   InterthreadCommunicationTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_COMMUNICATION_TEST_0500
     * @tc.desc   Verify TaskPool cross-task Sendable object passing between sequential tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadCommunicationTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedData: TaskData = new TaskData()
      let result1 = await taskpool.execute(new taskpool.Task(taskA, sharedData))
      expect(result1 as number).assertEqual(100)

      let result2 = await taskpool.execute(new taskpool.Task(taskB, sharedData))
      expect(result2 as number).assertEqual(150)
    })

    /**
     * @tc.name   InterthreadCommunicationTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_COMMUNICATION_TEST_0600
     * @tc.desc   Verify basic types (number, string, boolean) transfer across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InterthreadCommunicationTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(basicTypesTask, 42, 'test', true)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('42-test-true')
    })

    /**
     * @tc.name   InterthreadCommunicationTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_INTERTHREAD_COMMUNICATION_TEST_0700
     * @tc.desc   Verify array serialization and deserialization across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('InterthreadCommunicationTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let inputData: number[] = [10, 20, 30, 40, 50]
      let task: taskpool.Task = new taskpool.Task(arrayProcessTask, inputData)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(150)
    })
  })
}
