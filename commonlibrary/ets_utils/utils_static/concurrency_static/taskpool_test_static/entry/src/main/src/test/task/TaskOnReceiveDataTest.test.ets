'use static';

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

import {describe, afterAll, it, expect, TestType, Size, Level, beforeAll} from '../../../../hypium';
import Utils from '../Util.test';

let sendDataNumFunc = (args: number): number => { taskpool.Task.sendData(args); return args }
let sendDataBoolFunc = (args: boolean): boolean => { taskpool.Task.sendData(args); return args }
let sendDataMultiArgsFunc = (): number => { taskpool.Task.sendData(1.0, "test", true); return 100.0 }
let sendDataChainFunc = (): number => { taskpool.Task.sendData(1.0); taskpool.Task.sendData(2.0); taskpool.Task.sendData(3.0); return 100.0 }
let sendDataEmptyFunc = (): number => { taskpool.Task.sendData(); return 100.0 }
let sendDataLoopFunc = (): number => { for (let i = 0; i < 5; i++) { taskpool.Task.sendData(i * 1.0) }; return 100.0 }
let sendDataArrayFunc = (): number => { let arr: number[] = [1.0, 2.0, 3.0]; taskpool.Task.sendData(arr); return 100.0 }
let sendDataThenThrowFunc = (): number => { taskpool.Task.sendData(100.0); throw new Error("task error") }
let highFreqSendFunc = (): number => { for (let i = 0; i < 100; i++) { taskpool.Task.sendData(i * 1.0) }; return 100.0 }
let simpleFunc = (): number => { return 100.0 }
let sendDataLargeArrFunc = (): number => {
  let arr: number[] = []
  for (let i = 0; i < 100; i++) {
    arr.push(i * 1.0)
  }
  taskpool.Task.sendData(arr)
  return 100.0
}
let sendDataLargeStrFunc = (): number => {
  let str: string = ''
  for (let i = 0; i < 100; i++) {
    str = str + 'x'
  }
  taskpool.Task.sendData(str)
  return 100.0
}
let sendDataForPeriodicFunc = (args: number): number => { taskpool.Task.sendData(args); return args }

// Module-level array to track active periodic tasks for cleanup
let activePeriodicTasks: taskpool.Task[] = [];

async function waitForReceiveCondition(condition: () => boolean): Promise<void> {
  let waitCount: number = 0
  while (!condition() && waitCount < 150) {
    try {
      await Utils.msSleep(20)
    } catch (error) {
      expect().assertFail()
    }
    waitCount++
  }
}

export default function TaskOnReceiveDataTest(): void {
  describe('TaskOnReceiveDataTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskOnReceiveDataTest0100
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0100
     * @tc.desc   Verify Task.onReceiveData() with no parameter cancels registered callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let received: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      let cbRecv0: (data: Object) => void = (data: Object): void => {
        received = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv0)
      task.onReceiveData()
      let hasError: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
      expect(received).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest0200
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0200
     * @tc.desc   Verify Task.onReceiveData() with callback parameter registers callback successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let received: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      task.onReceiveData((data: number) => {
        received = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let waitCount: number = 0
      while (received !== 100.0 && waitCount < 50) {
        try {
          await Utils.msSleep(20)
        } catch (error) {
          expect().assertFail()
        }
        waitCount++
      }
      expect(received).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest0300
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0300
     * @tc.desc   Verify Task.onReceiveData() with arrow function callback receives data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let received: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 42.0)
      let handler = (data: number): void => {
        received = data
      }
      task.onReceiveData(handler)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let waitCount: number = 0
      while (received !== 42.0 && waitCount < 50) {
        try {
          await Utils.msSleep(20)
        } catch (error) {
          expect().assertFail()
        }
        waitCount++
      }
      expect(received).assertEqual(42.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest0400
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0400
     * @tc.desc   Verify Task.onReceiveData() callback parameter receives sendData value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedStr: string = ""
      let task: taskpool.Task = new taskpool.Task((): string => {
        taskpool.Task.sendData("hello")
        return "done"
      })
      task.onReceiveData((msg: string) => {
        receivedStr = msg
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let waitCount: number = 0
      while (receivedStr !== "hello" && waitCount < 50) {
        try {
          await Utils.msSleep(20)
        } catch (error) {
          expect().assertFail()
        }
        waitCount++
      }
      expect(receivedStr).assertEqual("hello")
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest0500
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0500
     * @tc.desc   Verify Task.onReceiveData() callback receives multiple sendData arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedA: number = 0
      let receivedB: string = ""
      let receivedC: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataMultiArgsFunc)
      task.onReceiveData((a: number, b: string, c: boolean) => {
        receivedA = a
        receivedB = b
        receivedC = c
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let waitCount: number = 0
      while (!receivedC && waitCount < 50) {
        try {
          await Utils.msSleep(20)
        } catch (error) {
          expect().assertFail()
        }
        waitCount++
      }
      expect(receivedA).assertEqual(1.0)
      expect(receivedB).assertEqual("test")
      expect(receivedC).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest0600
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0600
     * @tc.desc   Verify Task.onReceiveData() with async callback function triggers correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let asyncCompleted: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      task.onReceiveData(async (data: number) => {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        if (data >= 0) {
          asyncCompleted = true
        }
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0600: () => boolean = (): boolean => asyncCompleted
      try {
        await waitForReceiveCondition(condition0600)
      } catch (error) {
        expect().assertFail()
      }
      expect(asyncCompleted).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest0700
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0700
     * @tc.desc   Verify Task.onReceiveData(undefined) cancels registered callback instead of null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let received: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      let cbRecv1: (data: Object) => void = (data: Object): void => {
        received = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv1)
      task.onReceiveData(undefined)
      let hasError: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
      expect(received).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest0800
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0800
     * @tc.desc   Verify Task.onReceiveData(undefined) cancels callback and task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskOnReceiveDataTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let hasError: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      let cbRecv2: (data: Object) => void = (data: Object): void => {
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv2)
      task.onReceiveData(undefined)
      try {
        await taskpool.execute(task)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest0900
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_0900
     * @tc.desc   Verify Task.onReceiveData() does not support chaining, last registration takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callback1Called: boolean = false
      let callback2Called: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      let cbRecv3: (data: Object) => void = (data: Object): void => {
        callback1Called = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv3)
      let cbRecv4: (data: Object) => void = (data: Object): void => {
        callback2Called = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv4)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0900: () => boolean = (): boolean => callback2Called
      try {
        await waitForReceiveCondition(condition0900)
      } catch (error) {
        expect().assertFail()
      }
      expect(callback1Called).assertFalse()
      expect(callback2Called).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1000
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1000
     * @tc.desc   Verify sendData without registered callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      let errorCaught: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        errorCaught = true
      }
      expect(errorCaught).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1100
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1100
     * @tc.desc   Verify sendData called from main thread throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let errorCaught: boolean = false
      try {
        taskpool.Task.sendData(100.0)
      } catch (e) {
        errorCaught = true
      }
      expect(errorCaught).assertTrue()
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1200
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1200
     * @tc.desc   Verify Task.onReceiveData() callback internal exception caught does not affect task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      let errorCaughtInCallback: boolean = false
      task.onReceiveData((data: number) => {
        if (data !== undefined) {
          try {
            throw new Error("callback error")
          } catch (e) {
            errorCaughtInCallback = true
          }
        }
      })
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      const condition1200: () => boolean = (): boolean => errorCaughtInCallback
      try {
        await waitForReceiveCondition(condition1200)
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertEqual(100.0)
      expect(errorCaughtInCallback).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1300
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1300
     * @tc.desc   Verify Task.onReceiveData() can register a callback after task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let result1300: number = 0;
      try {
        result1300 = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      let registered: boolean = false
      try {
        let cbRecv5: (data: Object) => void = (data: Object): void => {
          if (data !== undefined) {
            // data payload received from taskpool worker
          }
        }
        task.onReceiveData(cbRecv5)
        registered = true
      } catch (e) {
      }
      expect(result1300).assertEqual(100.0)
      expect(registered).assertTrue()
      expect(task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1400
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1400
     * @tc.desc   Verify Task.onReceiveData() receives chained sendData messages in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let received: number[] = []
      let task: taskpool.Task = new taskpool.Task(sendDataChainFunc)
      task.onReceiveData((data: number) => {
        received.push(data)
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition1400: () => boolean = (): boolean => received.length === 3
      try {
        await waitForReceiveCondition(condition1400)
      } catch (error) {
        expect().assertFail()
      }
      expect(received.length).assertEqual(3)
      expect(received[0]).assertEqual(1.0)
      expect(received[1]).assertEqual(2.0)
      expect(received[2]).assertEqual(3.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1500
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1500
     * @tc.desc   Verify Task.onReceiveData() callback not triggered after task cancellation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedCount: AtomicInt = new AtomicInt(0)
      let task: taskpool.Task = new taskpool.Task((): number => {
        for (let i = 0; i < 10; i++) {
          if (taskpool.Task.isCanceled()) {
            break
          }
          taskpool.Task.sendData(i * 1.0)
          let t: Long = Date.now()
          while (Date.now() - t < 100) {}
        }
        return 100.0
      })
      let cbRecv6: (data: Object) => void = (data: Object): void => {
        receivedCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv6)
      let executePromise: Promise<Any> = taskpool.execute(task, { timeout: 5000 })
      let running1500: boolean = false
      let begin1500: number = Date.now()
      while (!running1500 && Date.now() - begin1500 < 10000) {
        try {
          let info1500: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of info1500.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running1500 = true
            }
          }
          if (!running1500) {
            await Utils.msSleep(20)
          }
        } catch (error) {
          expect().assertFail();
        }
      }
      expect(running1500).assertTrue()
      try {
        taskpool.cancel(task)
      } catch (e) {
      }
      try {
        await executePromise
      } catch (e) {
      }
      expect(receivedCount.load()).assertLess(10)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1600
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1600
     * @tc.desc   Verify Task.onReceiveData() callback not triggered after task timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedCount: AtomicInt = new AtomicInt(0)
      let task: taskpool.Task = new taskpool.Task((): number => {
        for (let i = 0; i < 5; i++) {
          taskpool.Task.sendData(i * 1.0)
          let t: Long = Date.now()
          while (Date.now() - t < 1000) {}
        }
        return 100.0
      })
      let cbRecv7: (data: Object) => void = (data: Object): void => {
        receivedCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv7)
      try {
        await taskpool.execute(task, { timeout: 500 })
      } catch (e) {
      }
      expect(receivedCount.load()).assertLess(5)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1700
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1700
     * @tc.desc   Verify Task.onReceiveData() callback handles event driven processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eventQueue: string[] = []
      let task: taskpool.Task = new taskpool.Task(sendDataChainFunc)
      task.onReceiveData((event: number) => {
        eventQueue.push("processed:" + event.toString())
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition1700: () => boolean = (): boolean => eventQueue.length === 3
      try {
        await waitForReceiveCondition(condition1700)
      } catch (error) {
        expect().assertFail()
      }
      expect(eventQueue.length).assertEqual(3)
      expect(eventQueue[0]).assertEqual("processed:1")
      expect(eventQueue[1]).assertEqual("processed:2")
      expect(eventQueue[2]).assertEqual("processed:3")
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1800
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1800
     * @tc.desc   Verify Task.onReceiveData() handles concurrent sendData from multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackCount: AtomicInt = new AtomicInt(0)
      let task1: taskpool.Task = new taskpool.Task(sendDataNumFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(sendDataNumFunc, 2.0)
      let task3: taskpool.Task = new taskpool.Task(sendDataNumFunc, 3.0)
      let task1Fired1800: boolean = false
      let task2Fired1800: boolean = false
      let task3Fired1800: boolean = false
      let cbRecv8: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1); task1Fired1800 = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task1.onReceiveData(cbRecv8)
      let cbRecv9: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1); task2Fired1800 = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task2.onReceiveData(cbRecv9)
      let cbRecv10: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1); task3Fired1800 = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task3.onReceiveData(cbRecv10)
      try {
        await Promise.all([taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3)]);
      } catch (error) {
        expect().assertFail();
      }
      const condition1800: () => boolean = (): boolean => task1Fired1800 && task2Fired1800 && task3Fired1800
      try {
        await waitForReceiveCondition(condition1800)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackCount.load()).assertEqual(3)
      expect(task1Fired1800).assertTrue()
      expect(task2Fired1800).assertTrue()
      expect(task3Fired1800).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest1900
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_1900
     * @tc.desc   Verify Task.onReceiveData() callback completes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      let callbackPromise: Promise<void> = new Promise<void>((resolve: (value: void | PromiseLike<void>) => void, reject: (reason: Error) => void) => {
        task.onReceiveData((data: number) => {
          if (data !== undefined) {
            callbackExecuted = true
            resolve(undefined)
          }
        })
      })
      let executePromise: Promise<Any> = taskpool.execute(task)
      try {
        await callbackPromise;
      } catch (error) {
        expect().assertFail();
      }
      try {
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackExecuted).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2000
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2000
     * @tc.desc   Verify Task.onReceiveData() callback count after concurrent task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackCount: AtomicInt = new AtomicInt(0)
      let totalCount: number = 5
      let task1: taskpool.Task = new taskpool.Task(sendDataNumFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(sendDataNumFunc, 2.0)
      let task3: taskpool.Task = new taskpool.Task(sendDataNumFunc, 3.0)
      let task4: taskpool.Task = new taskpool.Task(sendDataNumFunc, 4.0)
      let task5: taskpool.Task = new taskpool.Task(sendDataNumFunc, 5.0)
      let cbRecv11: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task1.onReceiveData(cbRecv11)
      let cbRecv12: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task2.onReceiveData(cbRecv12)
      let cbRecv13: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task3.onReceiveData(cbRecv13)
      let cbRecv14: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task4.onReceiveData(cbRecv14)
      let cbRecv15: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task5.onReceiveData(cbRecv15)
      try {
        await Promise.all([
         taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3),
         taskpool.execute(task4), taskpool.execute(task5)
       ]);
      } catch (error) {
       expect().assertFail();
      }
      const condition2000: () => boolean = (): boolean => callbackCount.load() >= totalCount
      try {
        await waitForReceiveCondition(condition2000)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackCount.load()).assertEqual(totalCount)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2100
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2100
     * @tc.desc   Verify Task.onReceiveData() with shared callback handles data from multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedData: number[] = []
      let task1: taskpool.Task = new taskpool.Task(sendDataNumFunc, 10.0)
      let task2: taskpool.Task = new taskpool.Task(sendDataNumFunc, 20.0)
      let task3: taskpool.Task = new taskpool.Task(sendDataNumFunc, 30.0)
      let callbackPromises: Promise<void>[] = []
      let expectedCount: number = 3
      let allCallbacksCompleted: Promise<void> = new Promise<void>((resolve: (value: void | PromiseLike<void>) => void, reject: (reason: Error) => void) => {
        let completedCount: AtomicInt = new AtomicInt(0)
        let sharedHandler = (data: number): void => {
          receivedData.push(data)
          let countAfterAdd: number = completedCount.fetchAdd(1) + 1
          callbackPromises.push(Promise.resolve())
          if (countAfterAdd === expectedCount) {
            resolve(undefined)
          }
        }
        task1.onReceiveData(sharedHandler)
        task2.onReceiveData(sharedHandler)
        task3.onReceiveData(sharedHandler)
      })
      try {
        await Promise.all([taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3)])
      } catch (e) {
      }
      try {
        await allCallbacksCompleted;
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackPromises.length).assertEqual(3)
      expect(receivedData.length).assertEqual(3)
      let has10: boolean = false
      let has20: boolean = false
      let has30: boolean = false
      for (let i = 0; i < receivedData.length; i++) {
        if (receivedData[i] === 10) { has10 = true }
        if (receivedData[i] === 20) { has20 = true }
        if (receivedData[i] === 30) { has30 = true }
      }
      expect(has10).assertTrue()
      expect(has20).assertTrue()
      expect(has30).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2200
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2200
     * @tc.desc   Verify Task.onReceiveData() registered before execute triggers callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let received: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      task.onReceiveData((data: number) => {
        received = data
      })
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      const condition2200: () => boolean = (): boolean => received === 100.0
      try {
        await waitForReceiveCondition(condition2200)
      } catch (error) {
        expect().assertFail()
      }
      expect(received).assertEqual(100.0)
      expect(result).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2300
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2300
     * @tc.desc   Verify Task.onReceiveData() with no prior registration does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let noException: boolean = true
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        task.onReceiveData()
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2400
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2400
     * @tc.desc   Verify Task.onReceiveData() re-registration after cancellation works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let received: string = ""
      let task: taskpool.Task = new taskpool.Task((): number => {
        taskpool.Task.sendData("test")
        return 100.0
      })
      let cbRecv16: (data: Object) => void = (data: Object): void => {
        try {
        received = "first"
        } catch (error) {
        expect().assertFail();
        }
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv16)
      task.onReceiveData()
      let cbRecv17: (data: Object) => void = (data: Object): void => {
        try {
        received = "second"
        } catch (error) {
        expect().assertFail();
        }
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv17)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition2400: () => boolean = (): boolean => received === "second"
      try {
        await waitForReceiveCondition(condition2400)
      } catch (error) {
        expect().assertFail()
      }
      expect(received).assertEqual("second")
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2500
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2500
     * @tc.desc   Verify Task.onReceiveData() same callback registered multiple times triggers once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callCount: AtomicInt = new AtomicInt(0)
      let handler = (data: number): void => {
        callCount.fetchAdd(1)
      }
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      task.onReceiveData(handler)
      task.onReceiveData(handler)
      task.onReceiveData(handler)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition2500: () => boolean = (): boolean => callCount.load() >= 1
      try {
        await waitForReceiveCondition(condition2500)
      } catch (error) {
        expect().assertFail()
      }
      expect(callCount.load()).assertEqual(1)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2600
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2600
     * @tc.desc   Verify Task.onReceiveData() receives boolean data from sendData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedBool: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataBoolFunc, true)
      task.onReceiveData((b: boolean) => { receivedBool = b })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition2600: () => boolean = (): boolean => receivedBool
      try {
        await waitForReceiveCondition(condition2600)
      } catch (error) {
        expect().assertFail()
      }
      expect(receivedBool).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2700
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2700
     * @tc.desc   Verify Task.onReceiveData() receives array data from sendData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedArr: number[] = []
      let task: taskpool.Task = new taskpool.Task(sendDataArrayFunc)
      task.onReceiveData((arr: number[]) => { receivedArr = arr })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition2700: () => boolean = (): boolean => receivedArr.length === 3
      try {
        await waitForReceiveCondition(condition2700)
      } catch (error) {
        expect().assertFail()
      }
      expect(receivedArr.length).assertEqual(3)
      expect(receivedArr[0]).assertEqual(1.0)
      expect(receivedArr[1]).assertEqual(2.0)
      expect(receivedArr[2]).assertEqual(3.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2800
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2800
     * @tc.desc   Verify Task.onReceiveData() callback triggered for each sendData call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnReceiveDataTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let received: number[] = []
      let task: taskpool.Task = new taskpool.Task(sendDataLoopFunc)
      task.onReceiveData((data: number) => {
        received.push(data)
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition2800: () => boolean = (): boolean => received.length === 5
      try {
        await waitForReceiveCondition(condition2800)
      } catch (error) {
        expect().assertFail()
      }
      expect(received.length).assertEqual(5)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest2900
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_2900
     * @tc.desc   Verify Task.onReceiveData() callback triggered when sendData called with no args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let received: string = "not called"
      let task: taskpool.Task = new taskpool.Task(sendDataEmptyFunc)
      let cbRecv18: (data?: Object) => void = (data?: Object): void => {
        received = "called"
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv18)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition2900: () => boolean = (): boolean => received === "called"
      try {
        await waitForReceiveCondition(condition2900)
      } catch (error) {
        expect().assertFail()
      }
      expect(received).assertEqual("called")
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3000
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3000
     * @tc.desc   Verify Task.onReceiveData() with executePeriodically receives periodic data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedCount: AtomicInt = new AtomicInt(0)
      let task: taskpool.Task = new taskpool.Task(sendDataForPeriodicFunc, 100.0)
      activePeriodicTasks.push(task)
      let cbRecv19: (data: Object) => void = (data: Object): void => {
        receivedCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv19)
      taskpool.executePeriodically(200, task)
      let maxWait: number = 0
      while (receivedCount.load() < 1 && maxWait < 3000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100
      }
      expect(receivedCount.load()).assertLarger(0)
      taskpool.cancel(task)
      activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3100
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3100
     * @tc.desc   Verify Task.onReceiveData() with TaskGroup task receives data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackCount: AtomicInt = new AtomicInt(0)
      let task1: taskpool.Task = new taskpool.Task(sendDataNumFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(sendDataNumFunc, 2.0)
      let task1Fired3100: boolean = false
      let task2Fired3100: boolean = false
      let cbRecv20: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1); task1Fired3100 = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task1.onReceiveData(cbRecv20)
      let cbRecv21: (data: Object) => void = (data: Object): void => {
        callbackCount.fetchAdd(1); task2Fired3100 = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task2.onReceiveData(cbRecv21)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task1)
      taskGroup.addTask(task2)
      try {
        await taskpool.execute(taskGroup);
      } catch (error) {
        expect().assertFail();
      }
      const condition3100: () => boolean = (): boolean => task1Fired3100 && task2Fired3100
      try {
        await waitForReceiveCondition(condition3100)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackCount.load()).assertEqual(2)
      expect(task1Fired3100).assertTrue()
      expect(task2Fired3100).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3200
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3200
     * @tc.desc   Verify Task.onReceiveData() with SequenceRunner task receives data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let results: number[] = []
      let task1: taskpool.Task = new taskpool.Task(sendDataNumFunc, 10.0)
      let task2: taskpool.Task = new taskpool.Task(sendDataNumFunc, 20.0)
      task1.onReceiveData((data: number) => { results.push(data) })
      task2.onReceiveData((data: number) => { results.push(data) })
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      try {
        await runner.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await runner.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      const condition3200: () => boolean = (): boolean => results.length === 2
      try {
        await waitForReceiveCondition(condition3200)
      } catch (error) {
        expect().assertFail()
      }
      expect(results.length).assertEqual(2)
      expect(results[0]).assertEqual(10.0)
      expect(results[1]).assertEqual(20.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3300
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3300
     * @tc.desc   Verify Task.onReceiveData() with named Task receives data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let received: number = 0
      let taskName: string = "myTask"
      let task: taskpool.Task = new taskpool.Task(taskName, sendDataNumFunc, 100.0)
      expect(task.name).assertEqual("myTask")
      task.onReceiveData((data: number) => {
        received = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition3300: () => boolean = (): boolean => received === 100.0
      try {
        await waitForReceiveCondition(condition3300)
      } catch (error) {
        expect().assertFail()
      }
      expect(received).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3400
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3400
     * @tc.desc   Verify Task.onReceiveData() callback triggered by sendData before task exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataThenThrowFunc)
      let cbRecv22: (data: Object) => void = (data: Object): void => {
        received = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv22)
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      const condition3400: () => boolean = (): boolean => received
      try {
        await waitForReceiveCondition(condition3400)
      } catch (error) {
        expect().assertFail()
      }
      expect(received).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3500
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3500
     * @tc.desc   Verify Task.onReceiveData() cancellation after execution has no effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let received: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      task.onReceiveData((data: number) => {
        received = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition3500: () => boolean = (): boolean => received === 100.0
      try {
        await waitForReceiveCondition(condition3500)
      } catch (error) {
        expect().assertFail()
      }
      expect(received).assertEqual(100.0)
      task.onReceiveData()
      expect(received).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3600
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3600
     * @tc.desc   Verify Task.onReceiveData() callback calling sendData throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sendDataErrorCaught: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      let cbRecv23: (data: Object) => void = (data: Object): void => {
        try {
        taskpool.Task.sendData(200.0)
        } catch (e) {
        sendDataErrorCaught = true
        }
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv23)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition3600: () => boolean = (): boolean => sendDataErrorCaught
      try {
        await waitForReceiveCondition(condition3600)
      } catch (error) {
        expect().assertFail()
      }
      expect(sendDataErrorCaught).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3700
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3700
     * @tc.desc   Verify Task.onReceiveData() with no-parameter callback triggers correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let called: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataMultiArgsFunc)
      let cbRecv24: (data: Object) => void = (data: Object): void => {
        called = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv24)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition3700: () => boolean = (): boolean => called
      try {
        await waitForReceiveCondition(condition3700)
      } catch (error) {
        expect().assertFail()
      }
      expect(called).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3800
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3800
     * @tc.desc   Verify Task.onReceiveData() callback receives partial sendData arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let received: number = 0
      let task: taskpool.Task = new taskpool.Task((): number => {
        taskpool.Task.sendData(1.0, 2.0, 3.0, 4.0, 5.0)
        return 100
      })
      task.onReceiveData((a: number, b: number) => {
        received = a + b
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition3800: () => boolean = (): boolean => received === 3.0
      try {
        await waitForReceiveCondition(condition3800)
      } catch (error) {
        expect().assertFail()
      }
      expect(received).assertEqual(3.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest3900
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_3900
     * @tc.desc   Verify Task.onReceiveData() receives large array from sendData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskOnReceiveDataTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let receivedLength: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataLargeArrFunc)
      task.onReceiveData((data: number[]) => {
        receivedLength = data.length
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition3900: () => boolean = (): boolean => receivedLength === 100
      try {
        await waitForReceiveCondition(condition3900)
      } catch (error) {
        expect().assertFail()
      }
      expect(receivedLength).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest4000
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_4000
     * @tc.desc   Verify Task.onReceiveData() handles high frequency sendData correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnReceiveDataTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedCount: AtomicInt = new AtomicInt(0)
      let task: taskpool.Task = new taskpool.Task(highFreqSendFunc)
      let cbRecv25: (data: Object) => void = (data: Object): void => {
        receivedCount.fetchAdd(1)
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv25)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition4000: () => boolean = (): boolean => receivedCount.load() >= 100
      try {
        await waitForReceiveCondition(condition4000)
      } catch (error) {
        expect().assertFail()
      }
      expect(receivedCount.load()).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest4100
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_4100
     * @tc.desc   Verify Task.onReceiveData() with empty callback body executes without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let noException: boolean = true
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      try {
        task.onReceiveData((data: Object) => {
          try {
            if (data !== undefined) {
              callbackExecuted = true
            }
          } catch (error) {
            expect().assertFail();
          }
        })
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      const condition4100: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForReceiveCondition(condition4100)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      expect(result).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest4200
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_4200
     * @tc.desc   Verify Task.onReceiveData() callback return value is ignored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callbackCalled: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      task.onReceiveData((data: number): number => {
        callbackCalled = true
        return data * 2
      })
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      const condition4200: () => boolean = (): boolean => callbackCalled
      try {
        await waitForReceiveCondition(condition4200)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackCalled).assertTrue()
      expect(result).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest4300
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_4300
     * @tc.desc   Verify Task.onReceiveData() callback captures external variable via closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let multiplier: number = 10
      let result: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 5.0)
      task.onReceiveData((data: number) => {
        result = data * multiplier
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition4300: () => boolean = (): boolean => result === 50.0
      try {
        await waitForReceiveCondition(condition4300)
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertEqual(50.0)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest4400
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_4400
     * @tc.desc   Verify Task.onReceiveData() receives large string from sendData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskOnReceiveDataTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let receivedLength: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataLargeStrFunc)
      task.onReceiveData((data: string) => {
        receivedLength = data.length
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition4400: () => boolean = (): boolean => receivedLength === 100
      try {
        await waitForReceiveCondition(condition4400)
      } catch (error) {
        expect().assertFail()
      }
      expect(receivedLength).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskOnReceiveDataTest4500
     * @tc.number SUB_TASK_ON_RECEIVE_DATA_TEST_4500
     * @tc.desc   Verify Task.onReceiveData() callback can execute nested task with counter-based waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnReceiveDataTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let nestedCount: number = 0
      let nestedResult: number = 0
      let nestedPromise: Promise<Any> | null = null
      let task: taskpool.Task = new taskpool.Task(sendDataNumFunc, 100.0)
      task.onReceiveData((data: number) => {
        if (data >= 0) {
          let nestedTask: taskpool.Task = new taskpool.Task(simpleFunc)
          nestedPromise = taskpool.execute(nestedTask)
        }
      })
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      let waitStart: number = Date.now()
      while (nestedPromise === null && Date.now() - waitStart < 5000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
      }
      expect(nestedPromise !== null).assertTrue()
      if (nestedPromise !== null) {
        let nestedResultValue: Any = undefined;
        try {
          nestedResultValue = await nestedPromise;
        } catch (error) {
          expect().assertFail();
        }
        nestedResult = nestedResultValue as number
        nestedCount++
      }
      expect(nestedCount).assertEqual(1)
      expect(nestedResult).assertEqual(100)
      done();
    })
  })
}
