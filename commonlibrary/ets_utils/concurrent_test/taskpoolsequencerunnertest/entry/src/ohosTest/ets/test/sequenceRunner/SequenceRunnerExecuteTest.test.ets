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
import taskpool from '@ohos.taskpool';
import { ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../Utils';
import { peekSharedQueueRunner, getSameNameQueueRunner } from './SharedQueueHelper';
import { SendableData, addFunc } from './SequenceRunnerExecuteTestInner';

@Concurrent
function simpleFunc(): number {
  return 42
}

@Concurrent
function returnStringFunc(): string {
  return 'text'
}

@Concurrent
function returnNumberFunc(): number {
  return 100
}

@Concurrent
function returnArrayFunc(): number[] {
  return [1, 2, 3]
}

@Concurrent
function returnNullFunc(): number | null {
  return null
}

@Concurrent
function returnVoidFunc(): void {
}

@Concurrent
async function returnPromiseFunc(): Promise<number> {
  return 42
}

@Concurrent
function errorFunc(): number {
  throw new Error('task internal error')
}

@Concurrent
function failFunc(): number {
  throw new Error('fail')
}

@Concurrent
function successFunc(id: number): number {
  return id
}

@Concurrent
function sendDataFunc(): void {
  taskpool.Task.sendData('trigger')
}

@Concurrent
function pressureFunc(): number {
  return 1
}

@Concurrent
function identityFunc(n: number): number {
  return n
}

@Concurrent
function longDurationFunc(duration: number): number {
  const start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}

@Concurrent
async function nestedRunnerCreateFunc(counter: SharedCounter): Promise<void> {
  const nestedRunner = new taskpool.SequenceRunner()
  await counter.lock.lockAsync<void>((): void => {
    counter.count++
  })
}

// AsyncLock-protected increment (multi-worker safe, ref TaskpoolCancelGroupTest locked-counter pattern)
@Concurrent
async function concurrentRunnerCreateFunc(counter: SharedCounter): Promise<number> {
  const nestedRunner = new taskpool.SequenceRunner('concurrentExecQueue')
  await counter.lock.lockAsync<void>((): void => {
    counter.count++
  })
  return 1
}

@Concurrent
function returnSendableFunc(): SendableData {
  const data = new SendableData()
  data.value = 77
  return data
}

@Concurrent
function bigDataLengthFunc(data: number[]): number {
  return data.length
}

@Concurrent
async function nestedExecuteInTaskFunc(counter: SharedCounter): Promise<void> {
  const nestedRunner = new taskpool.SequenceRunner()
  const innerTask = new taskpool.Task(addFunc, 42, 42)
  try {
    const value = await nestedRunner.execute(innerTask)
    if (value as number === 84) {
      await counter.lock.lockAsync<void>((): void => {
        counter.count++
      })
    }
  } catch (e) {
    console.error('nestedExecuteInTaskFunc inner execute failed')
  }
}

@Concurrent
function longTaskFunc(): number {
  return 1
}

@Concurrent
function multiSendDataFunc(): void {
  taskpool.Task.sendData('data1')
  taskpool.Task.sendData('data2')
  taskpool.Task.sendData('data3')
}

@Sendable
class SharedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
function sendableParamFunc(data: SendableData): number {
  return data.value
}

export default function SequenceRunnerExecuteTest(): void {
  describe('SequenceRunnerExecuteTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0100
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0100
     * @tc.desc   Verify SequenceRunner.execute() with valid Task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(simpleFunc)
      const promise = runner.execute(task)
      try {
        const result = await promise
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0200
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0200
     * @tc.desc   Verify SequenceRunner.execute() with Task carrying parameters returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(addFunc, 10, 20)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(30)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0300
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0300
     * @tc.desc   Verify SequenceRunner.execute() with Sendable parameter Task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SequenceRunnerExecuteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const sendData = new SendableData()
      sendData.value = 100
      const task = new taskpool.Task(sendableParamFunc, sendData)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0400
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0400
     * @tc.desc   Verify SequenceRunner.execute() with two sequential tasks produce independent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task1 = new taskpool.Task(identityFunc, 100)
      const task2 = new taskpool.Task(identityFunc, 200)
      try {
        const r1 = await runner.execute(task1)
        const r2 = await runner.execute(task2)
        expect(r1 as number).assertEqual(100)
        expect(r2 as number).assertEqual(200)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0500
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0500
     * @tc.desc   Verify SequenceRunner.execute() returns Promise and await gets number result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(returnNumberFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0600
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0600
     * @tc.desc   Verify SequenceRunner.execute() returns string result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(returnStringFunc)
      try {
        const result = await runner.execute(task)
        expect(result as string).assertEqual('text')
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0700
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0700
     * @tc.desc   Verify SequenceRunner.execute() returns array result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(returnArrayFunc)
      try {
        const result = await runner.execute(task)
        const arr = result as number[]
        expect(arr.length).assertEqual(3)
        expect(arr[0] as number).assertEqual(1)
        expect(arr[1] as number).assertEqual(2)
        expect(arr[2] as number).assertEqual(3)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0800
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0800
     * @tc.desc   Verify SequenceRunner.execute() with task returning null resolves to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(returnNullFunc)
      try {
        const result = await runner.execute(task)
        expect(result === null).assertTrue()
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0900
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0900
     * @tc.desc   Verify SequenceRunner.execute() with void task resolves successfully and the serial queue continues with a subsequent valued task (void resolves as undefined per contract)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(returnVoidFunc)
      try {
        await runner.execute(task)
        const nextResult = await runner.execute(new taskpool.Task(simpleFunc))
        expect(nextResult as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1000
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1000
     * @tc.desc   Verify SequenceRunner.execute() with async task returns resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(returnPromiseFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1100
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1100
     * @tc.desc   Verify SequenceRunner.execute() with 5 tasks in serial order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const executionOrder: number[] = []
      try {
        for (let i = 1; i <= 5; i++) {
          const result = await runner.execute(new taskpool.Task(identityFunc, i))
          executionOrder.push(result as number)
        }
        expect(executionOrder.length).assertEqual(5)
        expect(executionOrder[0]).assertEqual(1)
        expect(executionOrder[4]).assertEqual(5)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest1100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1200
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1200
     * @tc.desc   Verify SequenceRunner.execute() with task bound to other runner throws error 401 (runtime arbitration: measured code 401, design expected 10200003; native CanForSequenceRunner throws TYPE_ERROR for a seqRunnerTask)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner1 = new taskpool.SequenceRunner()
      const runner2 = new taskpool.SequenceRunner()
      const task = new taskpool.Task(simpleFunc)
      try {
        await runner1.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest1200 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      try {
        await runner2.execute(task)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1300
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1300
     * @tc.desc   Verify SequenceRunner.execute() with task bound to AsyncRunner throws error 10200057
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const asyncRunner = new taskpool.AsyncRunner(2)
      const seqRunner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(simpleFunc)
      try {
        await asyncRunner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest1300 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      try {
        await seqRunner.execute(task)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(10200057)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1400
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1400
     * @tc.desc   Verify SequenceRunner.execute() with already executed task throws error 401 (runtime arbitration: measured code 401, design expected 10200006; native throws TYPE_ERROR for a task already enqueued in the serial queue)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(simpleFunc)
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest1400 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      try {
        await runner.execute(task)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1500
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1500
     * @tc.desc   Verify SequenceRunner.execute() with dependent task throws error 10200025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const task1 = new taskpool.Task(simpleFunc)
      const task2 = new taskpool.Task(simpleFunc)
      task2.addDependency(task1)
      let caught: boolean = false
      try {
        await runner.execute(task2)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(10200025)
      }
      expect(caught).assertTrue()
      done()
    })


    /**
     * @tc.name   SequenceRunnerExecuteTest1600
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1600
     * @tc.desc   Verify SequenceRunner.execute() executes tasks in submission order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const executionOrder: number[] = []
      const task1 = new taskpool.Task(identityFunc, 1)
      const task2 = new taskpool.Task(identityFunc, 2)
      const task3 = new taskpool.Task(identityFunc, 3)
      try {
        const r1 = await runner.execute(task1)
        executionOrder.push(r1 as number)
        const r2 = await runner.execute(task2)
        executionOrder.push(r2 as number)
        const r3 = await runner.execute(task3)
        executionOrder.push(r3 as number)
        expect(executionOrder[0]).assertEqual(1)
        expect(executionOrder[1]).assertEqual(2)
        expect(executionOrder[2]).assertEqual(3)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest1600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1700
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1700
     * @tc.desc   Verify SequenceRunner.execute() with non-awaited submissions still serial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const p1 = runner.execute(new taskpool.Task(identityFunc, 1))
      const p2 = runner.execute(new taskpool.Task(identityFunc, 2))
      const p3 = runner.execute(new taskpool.Task(identityFunc, 3))
      try {
        const results = await Promise.all([p1, p2, p3])
        expect(results.length).assertEqual(3)
        expect(results[0] as number).assertEqual(1)
        expect(results[1] as number).assertEqual(2)
        expect(results[2] as number).assertEqual(3)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest1700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1800
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1800
     * @tc.desc   Verify SequenceRunner.execute() previous task failure does not affect subsequent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const results: string[] = []
      try {
        const r1 = await runner.execute(new taskpool.Task(successFunc, 1))
        results.push('A_' + (r1 as number).toString())
      } catch (e) {
        results.push('A_FAIL')
      }
      try {
        await runner.execute(new taskpool.Task(failFunc))
        results.push('B_SUCCESS')
      } catch (e) {
        results.push('B_FAIL')
      }
      try {
        const r3 = await runner.execute(new taskpool.Task(successFunc, 2))
        results.push('C_' + (r3 as number).toString())
      } catch (e) {
        results.push('C_FAIL')
      }
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual('A_1')
      expect(results[1]).assertEqual('B_FAIL')
      expect(results[2]).assertEqual('C_2')
      done()
    })



    /**
     * @tc.name   SequenceRunnerExecuteTest2000
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2000
     * @tc.desc   Verify multiple SequenceRunner instances execute concurrently and independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const runner1 = new taskpool.SequenceRunner()
      const runner2 = new taskpool.SequenceRunner()
      const p1 = runner1.execute(new taskpool.Task(identityFunc, 1))
      const p2 = runner1.execute(new taskpool.Task(identityFunc, 2))
      const p3 = runner2.execute(new taskpool.Task(identityFunc, 3))
      const p4 = runner2.execute(new taskpool.Task(identityFunc, 4))
      const allPromise = Promise.all([p1, p2, p3, p4])
      try {
        const results = await allPromise
        expect(results.length).assertEqual(4)
        expect(results[0] as number).assertEqual(1)
        expect(results[1] as number).assertEqual(2)
        expect(results[2] as number).assertEqual(3)
        expect(results[3] as number).assertEqual(4)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2100
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2100
     * @tc.desc   Verify SequenceRunner.execute() with sendData and onReceiveData communication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let callbackCount = 0
      const expectedCallbacks = 1
      const task = new taskpool.Task(sendDataFunc)
      const onData: () => void = (): void => {
        callbackCount++
      }
      task.onReceiveData(onData)
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2100 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (callbackCount < expectedCallbacks && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2100 failed');
        expect(false).assertFail();
      }
      expect(callbackCount).assertEqual(expectedCallbacks)
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2200
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2200
     * @tc.desc   Verify SequenceRunner.execute() with multiple sendData triggers onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let callbackCount = 0
      const expectedCallbacks = 3
      const receivedData: string[] = []
      const task = new taskpool.Task(multiSendDataFunc)
      const onData: (data: Object) => void = (data: Object): void => {
        receivedData.push(data as string)
        callbackCount++
      }
      task.onReceiveData(onData)
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2200 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (callbackCount < expectedCallbacks && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2200 failed');
        expect(false).assertFail();
      }
      expect(callbackCount).assertEqual(expectedCallbacks)
      expect(receivedData.length).assertEqual(3)
      expect(receivedData[0]).assertEqual('data1')
      expect(receivedData[1]).assertEqual('data2')
      expect(receivedData[2]).assertEqual('data3')
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2300
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2300
     * @tc.desc   Verify SequenceRunner.execute() with LongTask executes successfully (runtime arbitration: design expected 10200003 conflicts with measurement; LongTask executes in the serial queue and returns its result)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const longTask = new taskpool.LongTask(longTaskFunc)
      try {
        const result = await runner.execute(longTask)
        expect(result as number).assertEqual(1)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2400
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2400
     * @tc.desc   Verify SequenceRunner.execute() with 100 tasks serial pressure test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let completedCount = 0
      const totalCount = 100
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalCount; i++) {
        const p = runner.execute(new taskpool.Task(pressureFunc))
        try {
          const result: Object = await p
          expect(result as number).assertEqual(1)
          completedCount++
        } catch (error) {
          expect().assertFail()
        }
        promises.push(p)
      }
      try {
        await Promise.allSettled(promises)
      } catch (error) {
        expect().assertFail()
      }
      let waited: number = 0
      try {
        while (completedCount < totalCount && waited < 5000) {
          await sleep(100)
          waited += 1000
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2400 failed');
        expect(false).assertFail();
      }
      expect(completedCount).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2500
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2500
     * @tc.desc   Verify SequenceRunner.execute() after long-running task continues normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const longTask = new taskpool.Task(longDurationFunc, 500)
      try {
        await runner.execute(longTask)
        const nextResult = await runner.execute(new taskpool.Task(simpleFunc))
        expect(nextResult as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2600
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2600
     * @tc.desc   Verify SequenceRunner.execute() 1000 cycles execution stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      const cycleCount = 1000
      let completedCount = 0
      try {
        for (let i = 0; i < cycleCount; i++) {
          const result = await runner.execute(new taskpool.Task(pressureFunc))
          if (result as number === 1) {
            completedCount++
          }
        }
        expect(completedCount).assertEqual(cycleCount)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2700
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2700
     * @tc.desc   Verify SequenceRunner.execute() triggers onEnqueued callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let enqueued = false
      let callbackCount = 0
      const task = new taskpool.Task(simpleFunc)
      const onEnqueued: () => void = (): void => {
        enqueued = true
        callbackCount++
      }
      task.onEnqueued(onEnqueued)
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2700 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (callbackCount < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2700 failed');
        expect(false).assertFail();
      }
      expect(enqueued).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2800
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2800
     * @tc.desc   Verify SequenceRunner.execute() triggers onStartExecution callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let started = false
      let callbackCount = 0
      const task = new taskpool.Task(simpleFunc)
      const onStart: () => void = (): void => {
        started = true
        callbackCount++
      }
      task.onStartExecution(onStart)
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2800 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (callbackCount < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2800 failed');
        expect(false).assertFail();
      }
      expect(started).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2900
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2900
     * @tc.desc   Verify SequenceRunner.execute() triggers onExecutionFailed callback on error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let failed = false
      let callbackCount = 0
      const task = new taskpool.Task(errorFunc)
      const onFailed: () => void = (): void => {
        failed = true
        callbackCount++
      }
      task.onExecutionFailed(onFailed)
      let rejected: boolean = false
      try {
        await runner.execute(task)
        expect().assertFail()
      } catch (e) {
        rejected = true
      }
      expect(rejected).assertTrue()
      let waited: number = 0
      try {
        while (callbackCount < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest2900 failed');
        expect(false).assertFail();
      }
      expect(failed).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3000
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3000
     * @tc.desc   Verify SequenceRunner.execute() triggers onExecutionSucceeded callback on success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let succeeded = false
      let callbackCount = 0
      const task = new taskpool.Task(simpleFunc)
      const onSuccess: () => void = (): void => {
        succeeded = true
        callbackCount++
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3000 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (callbackCount < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3000 failed');
        expect(false).assertFail();
      }
      expect(succeeded).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3100
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3100
     * @tc.desc   Verify SequenceRunner.execute() onExecutionSucceeded callback nested execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let nestedCompleted = false
      let nestedResolve: () => void
      const nestedPromise = new Promise<void>(resolve => {
        nestedResolve = resolve
      })
      const task = new taskpool.Task(simpleFunc)
      const onSuccess: () => Promise<void> = async (): Promise<void> => {
        const nestedTask = new taskpool.Task(addFunc, 42, 42)
        try {
          const nestedResult: Object = await runner.execute(nestedTask)
          expect(nestedResult as number).assertEqual(84)
          nestedCompleted = true
          nestedResolve()
        } catch (error) {
          console.error('SequenceRunnerExecuteTest3100 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        await runner.execute(task)
        await nestedPromise
        expect(nestedCompleted).assertTrue()
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3200
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3200
     * @tc.desc   Verify @Concurrent function creates nested SequenceRunner successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const counter = new SharedCounter()
      const task = new taskpool.Task(nestedRunnerCreateFunc, counter)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3200 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (counter.count < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3200 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3300
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3300
     * @tc.desc   Verify onReceiveData callback nested execute with counting wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const runner = new taskpool.SequenceRunner()
      let nestedCompleted = 0
      const expectedNested = 1
      const task = new taskpool.Task(sendDataFunc)
      const onData: () => Promise<void> = async (): Promise<void> => {
        const innerTask = new taskpool.Task(simpleFunc)
        try {
          await runner.execute(innerTask)
          nestedCompleted++
        } catch (error) {
          expect().assertFail()
        }
      }
      task.onReceiveData(onData)
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3300 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (nestedCompleted < expectedNested && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3300 failed');
        expect(false).assertFail();
      }
      expect(nestedCompleted).assertEqual(expectedNested)
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3400
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3400
     * @tc.desc   Verify small concurrency 3 with Sendable shared count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const counter = new SharedCounter()
      const promises: Promise<Object>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(concurrentRunnerCreateFunc, counter)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
        expect(results.every((result: Object): boolean => result === 1)).assertTrue()
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3500
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3500
     * @tc.desc   Verify same-name singleton SequenceRunner with same priority executes tasks correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const runnerName = 'singleton_exec_test'
      const runner1 = new taskpool.SequenceRunner(runnerName, taskpool.Priority.HIGH)
      const runner2 = new taskpool.SequenceRunner(runnerName, taskpool.Priority.HIGH)
      const p1 = runner1.execute(new taskpool.Task(simpleFunc))
      const p2 = runner2.execute(new taskpool.Task(returnNumberFunc))
      try {
        const results = await Promise.all([p1, p2])
        expect(results[0] as number).assertEqual(42)
        expect(results[1] as number).assertEqual(100)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest3500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3600
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3600
     * @tc.desc   Verify execute with non-Task argument (null/undefined/object/string) throws error 401 per input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      let caught: boolean = false
      try {
        const badTask: ESObject = null
        await runner.execute(badTask)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badTask: ESObject = undefined
        await runner.execute(badTask)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badTask: ESObject = new Object()
        await runner.execute(badTask)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()

      caught = false
      try {
        const badTask: ESObject = 'not a task'
        await runner.execute(badTask)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3700
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3700
     * @tc.desc   Verify execute with TaskGroup throws error 401 (runtime arbitration: design expected 10200003, measured 401 because TaskGroup has no taskId attribute and fails the parameter type check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      const group = new taskpool.TaskGroup('groupIntoRunner4100')
      group.addTask(new taskpool.Task(simpleFunc))
      let caught: boolean = false
      try {
        const badTask: ESObject = group
        await runner.execute(badTask)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(401)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3800
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3800
     * @tc.desc   Verify execute with periodic task throws error 10200051 (F3 recheck: a periodic task can be constructed, native CanForSequenceRunner rejects it with 10200051)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      const periodicTask = new taskpool.Task(simpleFunc)
      taskpool.executePeriodically(500, periodicTask)
      try {
        let caught: boolean = false
        try {
          await runner.execute(periodicTask)
          expect().assertFail()
        } catch (e) {
          caught = true
          expect(e.code).assertEqual(10200051)
        }
        expect(caught).assertTrue()
      } finally {
        // Always stop the periodic task so a mid-case failure cannot leak a
        // timer that keeps firing into subsequent cases.
        taskpool.cancel(periodicTask)
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3900
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3900
     * @tc.desc   Verify execute with serialization size over 16M throws error code 10200006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      const bigData: number[] = new Array<number>(2 * 1024 * 1024)
      for (let i = 0; i < bigData.length; i++) {
        bigData[i] = i
      }
      let caught: boolean = false
      try {
        await runner.execute(new taskpool.Task(bigDataLengthFunc, bigData))
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e.code).assertEqual(10200006)
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4000
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4000
     * @tc.desc   Verify execute with task returning Sendable object transfers value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task(returnSendableFunc)
      try {
        const result = await runner.execute(task)
        expect((result as SendableData).value).assertEqual(77)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4100
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4100
     * @tc.desc   Verify contrast: same runner executes serially (long before short) while taskpool.execute runs concurrently (short before long)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      const runnerCounter = new SharedCounter()
      const runnerOrder: string[] = []
      const runnerLong = new taskpool.Task(longDurationFunc, 400)
      const onRunnerLong: () => void = (): void => {
        runnerOrder.push('long')
        runnerCounter.count++
      }
      runnerLong.onExecutionSucceeded(onRunnerLong)
      const runnerShort = new taskpool.Task(pressureFunc)
      const onRunnerShort: () => void = (): void => {
        runnerOrder.push('short')
        runnerCounter.count++
      }
      runnerShort.onExecutionSucceeded(onRunnerShort)

      try {
        const pl = runner.execute(runnerLong)
        const ps = runner.execute(runnerShort)
        await Promise.all([pl, ps])
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4100 runner side failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (runnerCounter.count < 2 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4100 failed');
        expect(false).assertFail();
      }
      expect(runnerOrder.length).assertEqual(2)
      expect(runnerOrder[0]).assertEqual('long')
      expect(runnerOrder[1]).assertEqual('short')

      const poolCounter = new SharedCounter()
      const poolOrder: string[] = []
      const poolLong = new taskpool.Task(longDurationFunc, 400)
      const onPoolLong: () => void = (): void => {
        poolOrder.push('long')
        poolCounter.count++
      }
      poolLong.onExecutionSucceeded(onPoolLong)
      const poolShort = new taskpool.Task(pressureFunc)
      const onPoolShort: () => void = (): void => {
        poolOrder.push('short')
        poolCounter.count++
      }
      poolShort.onExecutionSucceeded(onPoolShort)

      try {
        const ppl = taskpool.execute(poolLong)
        const pps = taskpool.execute(poolShort)
        await Promise.all([ppl, pps])
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4100 pool side failed');
        expect(false).assertFail();
      }
      waited = 0
      try {
        while (poolCounter.count < 2 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4100 failed');
        expect(false).assertFail();
      }
      expect(poolOrder.length).assertEqual(2)
      expect(poolOrder[0]).assertEqual('short')
      expect(poolOrder[1]).assertEqual('long')
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4200
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4200
     * @tc.desc   Verify @Concurrent function body nests runner.execute and shared counter reaches exact count (F4 probe)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const task = new taskpool.Task(nestedExecuteInTaskFunc, counter)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4200 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (counter.count < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4200 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4300
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4300
     * @tc.desc   Verify two runners execute independent serial chains with per-chain exact order and chainsCompleted==2 (runtime arbitration: design literal count==1 covered a single chain, measured dual-chain count==2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runnerA = new taskpool.SequenceRunner()
      const runnerB = new taskpool.SequenceRunner()
      const orderA: number[] = []
      const orderB: number[] = []
      let chainsCompleted: number = 0

      const pa1 = runnerA.execute(new taskpool.Task(identityFunc, 1))
      const pa2 = runnerA.execute(new taskpool.Task(identityFunc, 2))
      const pb1 = runnerB.execute(new taskpool.Task(identityFunc, 10))
      const pb2 = runnerB.execute(new taskpool.Task(identityFunc, 20))

      try {
        const a1 = await pa1
        orderA.push(a1 as number)
        const a2 = await pa2
        orderA.push(a2 as number)
        if (orderA.length === 2 && orderA[0] === 1 && orderA[1] === 2) {
          chainsCompleted++
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4300 chainA failed');
        expect(false).assertFail();
      }
      try {
        const b1 = await pb1
        orderB.push(b1 as number)
        const b2 = await pb2
        orderB.push(b2 as number)
        if (orderB.length === 2 && orderB[0] === 10 && orderB[1] === 20) {
          chainsCompleted++
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4300 chainB failed');
        expect(false).assertFail();
      }
      expect(chainsCompleted).assertEqual(2)
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4400
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4400
     * @tc.desc   Verify three runners execute concurrently with succeeded-callback shared counter==3 and exact results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const runnerA = new taskpool.SequenceRunner()
      const runnerB = new taskpool.SequenceRunner()
      const runnerC = new taskpool.SequenceRunner()

      const taskA = new taskpool.Task(identityFunc, 1)
      const onA: () => void = (): void => {
        counter.count++
      }
      taskA.onExecutionSucceeded(onA)
      const taskB = new taskpool.Task(identityFunc, 2)
      const onB: () => void = (): void => {
        counter.count++
      }
      taskB.onExecutionSucceeded(onB)
      const taskC = new taskpool.Task(identityFunc, 3)
      const onC: () => void = (): void => {
        counter.count++
      }
      taskC.onExecutionSucceeded(onC)

      try {
        const results = await Promise.all([runnerA.execute(taskA), runnerB.execute(taskB), runnerC.execute(taskC)])
        expect(results.length).assertEqual(3)
        expect(results[0] as number).assertEqual(1)
        expect(results[1] as number).assertEqual(2)
        expect(results[2] as number).assertEqual(3)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4400 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (counter.count < 3 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4400 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(3)
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4500
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4500
     * @tc.desc   Verify same-name singleton queue executes 5 tasks from two references with succeeded-callback shared counter==5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter = new SharedCounter()
      const runnerName = 'singletonCounterQueue4900'
      const runner1 = new taskpool.SequenceRunner(runnerName)
      const runner2 = new taskpool.SequenceRunner(runnerName)
      const taskDefs: taskpool.Task[] = [
        new taskpool.Task(simpleFunc),
        new taskpool.Task(returnNumberFunc),
        new taskpool.Task(addFunc, 1, 2),
        new taskpool.Task(identityFunc, 7),
        new taskpool.Task(pressureFunc)
      ]
      const expectedResults: number[] = [42, 100, 3, 7, 1]
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskDefs.length; i++) {
        const task = taskDefs[i]
        const onSuccess: () => void = (): void => {
          counter.count++
        }
        task.onExecutionSucceeded(onSuccess)
        if (i % 2 === 0) {
          promises.push(runner1.execute(task))
        } else {
          promises.push(runner2.execute(task))
        }
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(5)
        for (let i = 0; i < expectedResults.length; i++) {
          expect(results[i] as number).assertEqual(expectedResults[i])
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4500 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (counter.count < 5 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4500 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(5)
      done()
    })

    // ========== Cross-Module Shared Named Queue (SeqC2#032, SharedQueueHelper asset) ==========

    /**
     * @tc.name   SequenceRunnerExecuteTest4600
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4600
     * @tc.desc   Verify different file (module) obtains the same global named queue: this file imports the SharedQueueHelper module and submits three tasks alternately through the peeked exported shared instance and a same-name wrapper, which execute serially on the one shared queue with exact order [1,2,3] (SeqC2#032 cross-module shared queue task execution)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const peekedRunner: taskpool.SequenceRunner = peekSharedQueueRunner()
      const sameNameRef: taskpool.SequenceRunner = getSameNameQueueRunner()
      const executionOrder: number[] = []
      const p1 = peekedRunner.execute(new taskpool.Task(identityFunc, 1))
      const p2 = sameNameRef.execute(new taskpool.Task(identityFunc, 2))
      const p3 = peekedRunner.execute(new taskpool.Task(identityFunc, 3))
      try {
        const r1 = await p1
        executionOrder.push(r1 as number)
        const r2 = await p2
        executionOrder.push(r2 as number)
        const r3 = await p3
        executionOrder.push(r3 as number)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4600 failed');
        expect(false).assertFail();
      }
      expect(executionOrder.length).assertEqual(3)
      expect(executionOrder[0]).assertEqual(1)
      expect(executionOrder[1]).assertEqual(2)
      expect(executionOrder[2]).assertEqual(3)
      done()
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4700
     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4700
     * @tc.desc   Verify a GenericsTask instance executed through SequenceRunner.execute returns the exact generic result and still serializes after it (M14a #072/#073; GenericsTask subclass instance enqueued into a serial Runner)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.SequenceRunner()
      const genTask = new taskpool.GenericsTask<[number, number], number>(addFunc, 21, 21)
      try {
        const genResult = await runner.execute(genTask)
        expect(genResult as number).assertEqual(42)
        const nextResult = await runner.execute(new taskpool.Task(simpleFunc))
        expect(nextResult as number).assertEqual(42)
      } catch (error) {
        console.error('SequenceRunnerExecuteTest4700 failed');
        expect(false).assertFail();
      }
      done()
    })
  })
}
