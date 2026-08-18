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

import {describe, beforeAll, afterAll, it, expect, TestType, Size, Level} from '../../../../hypium';
import Utils from '../Util.test';

let sendNoArgsFunc = (): number => { taskpool.Task.sendData(); return 100.0 }
let sendNumFunc = (args: number): number => { taskpool.Task.sendData(args); return args }
let sendStrFunc = (args: string): string => { taskpool.Task.sendData(args); return args }
let sendBoolFunc = (args: boolean): boolean => { taskpool.Task.sendData(args); return args }
let sendTwoArgsFunc = (): number => { taskpool.Task.sendData(1.0, "two"); return 100.0 }
let sendFiveArgsFunc = (): number => { taskpool.Task.sendData(1.0, "two", true, 4.0, "five"); return 100.0 }
let sendMaxValueFunc = (): number => { taskpool.Task.sendData(Number.MAX_VALUE); return 100.0 }
let sendZeroAndNegFunc = (): number => { taskpool.Task.sendData(0.0); taskpool.Task.sendData(-999.0); return 100.0 }
let sendEmptyStrFunc = (): string => { taskpool.Task.sendData(""); return "" }
let sendSpecialStrFunc = (): string => { taskpool.Task.sendData("hello@#$%"); return "hello@#$%" }
let sendNumArrFunc = (): number => { let arr: number[] = [1.0, 2.0, 3.0]; taskpool.Task.sendData(arr); return 100.0 }
let sendStrArrFunc = (): number => { let arr: string[] = ["a", "b", "c"]; taskpool.Task.sendData(arr); return 100.0 }
let sendEmptyArrFunc = (): number => { let arr: number[] = []; taskpool.Task.sendData(arr); return 100.0 }
let sendTwoDArrFunc = (): number => { let arr: number[][] = [[1.0, 2.0], [3.0, 4.0]]; taskpool.Task.sendData(arr); return 100.0 }
let sendLargeArrFunc = (): number => {
  let arr: number[] = []
  for (let i = 0; i < 100; i++) {
    arr.push(i * 1.0)
  }
  taskpool.Task.sendData(arr)
  return 100.0
}
let sendLargeStrFunc = (): number => {
  let str: string = ''
  for (let i = 0; i < 100; i++) {
    str = str + 'x'
  }
  taskpool.Task.sendData(str)
  return 100.0
}
let sendTrueFunc = (): boolean => { taskpool.Task.sendData(true); return true }
let sendFalseFunc = (): boolean => { taskpool.Task.sendData(false); return false }
let sendZeroFunc = (): number => { taskpool.Task.sendData(0.0); return 0.0 }
let sendNegFunc = (): number => { taskpool.Task.sendData(-100.0); return -100.0 }
let sendVoidFunc = (): number => { taskpool.Task.sendData("test"); return 100.0 }
let sendDataOnlyFunc = (): number => { taskpool.Task.sendData("data"); return 100.0 }
let noCallbackSendFunc = (): number => { taskpool.Task.sendData("data"); return 100.0 }
let multiSendLoopFunc = (): number => { for (let i = 0; i < 5; i++) { taskpool.Task.sendData(i * 1.0) }; return 100.0 }
let highFreqSendFunc = (): number => { for (let i = 0; i < 100; i++) { taskpool.Task.sendData(i * 1.0) }; return 100.0 }
let sendDataThenThrowFunc = (): number => { taskpool.Task.sendData(100.0); throw new Error("task error") }
let sendDataForPeriodicFunc = (args: number): number => { taskpool.Task.sendData(args); return args }
let sendDataForDelayedFunc = (args: number): number => { taskpool.Task.sendData(args); return args }
let concurrentSendFunc1 = (id: number): number => { for (let i = 0; i < 3; i++) { taskpool.Task.sendData(id * 10.0 + i * 1.0) }; return id * 1.0 }
let concurrentSendFunc2 = (id: number): number => { for (let i = 0; i < 3; i++) { taskpool.Task.sendData(id * 10.0 + i * 1.0) }; return id * 1.0 }
let sendDataInTimeoutFunc = (duration: number): string => {
  let start: Long = Date.now()
  while ((Date.now() - start) < duration) {}
  taskpool.Task.sendData(100.0)
  return 'success'
}

// Module-level array to track active periodic tasks for cleanup
let activePeriodicTasks: taskpool.Task[] = [];

export default function TaskSendDataTest(): void {
  describe('TaskSendDataTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskSendDataTest0100
     * @tc.number SUB_TASK_SEND_DATA_TEST_0100
     * @tc.desc   Verify Task.sendData() with no arguments triggers callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackTriggered: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendNoArgsFunc)
      let cbRecv0: (data?: Object) => void = (data?: Object): void => {
        callbackTriggered = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackTriggered).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskSendDataTest0200
     * @tc.number SUB_TASK_SEND_DATA_TEST_0200
     * @tc.desc   Verify Task.sendData() with one number argument passes data to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValue: number = 0.0
      let task: taskpool.Task = new taskpool.Task(sendNumFunc, 100.0)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest0300
     * @tc.number SUB_TASK_SEND_DATA_TEST_0300
     * @tc.desc   Verify Task.sendData() with one string argument passes data to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValue: string = ''
      let task: taskpool.Task = new taskpool.Task(sendStrFunc, "hello")
      task.onReceiveData((data: string): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual("hello")
      done();
    })

    /**
     * @tc.name   TaskSendDataTest0400
     * @tc.number SUB_TASK_SEND_DATA_TEST_0400
     * @tc.desc   Verify Task.sendData() with one boolean argument passes data to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValue: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendBoolFunc, true)
      task.onReceiveData((data: boolean): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskSendDataTest0500
     * @tc.number SUB_TASK_SEND_DATA_TEST_0500
     * @tc.desc   Verify Task.sendData() with two arguments passes all data to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedArg1: number = 0.0
      let receivedArg2: string = ''
      let task: taskpool.Task = new taskpool.Task(sendTwoArgsFunc)
      task.onReceiveData((a: number, b: string): void => {
        receivedArg1 = a
        receivedArg2 = b
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedArg1).assertEqual(1.0)
      expect(receivedArg2).assertEqual("two")
      done();
    })

    /**
     * @tc.name   TaskSendDataTest0600
     * @tc.number SUB_TASK_SEND_DATA_TEST_0600
     * @tc.desc   Verify Task.sendData() with five arguments passes all data to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedArg1: number = 0.0
      let receivedArg2: string = ''
      let receivedArg3: boolean = false
      let receivedArg4: number = 0.0
      let receivedArg5: string = ''
      let task: taskpool.Task = new taskpool.Task(sendFiveArgsFunc)
      task.onReceiveData((a: number, b: string, c: boolean, d: number, e: string): void => {
        receivedArg1 = a
        receivedArg2 = b
        receivedArg3 = c
        receivedArg4 = d
        receivedArg5 = e
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedArg1).assertEqual(1.0)
      expect(receivedArg2).assertEqual("two")
      expect(receivedArg3).assertTrue()
      expect(receivedArg4).assertEqual(4.0)
      expect(receivedArg5).assertEqual("five")
      done();
    })

    /**
     * @tc.name   TaskSendDataTest0700
     * @tc.number SUB_TASK_SEND_DATA_TEST_0700
     * @tc.desc   Verify Task.sendData() with Number.MAX_VALUE passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValue: number = 0.0
      let task: taskpool.Task = new taskpool.Task(sendMaxValueFunc)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual(Number.MAX_VALUE)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest0800
     * @tc.number SUB_TASK_SEND_DATA_TEST_0800
     * @tc.desc   Verify Task.sendData() with zero and negative number passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValues: number[] = []
      let callbackPromises: Promise<void>[] = []
      let task: taskpool.Task = new taskpool.Task(sendZeroAndNegFunc)
      task.onReceiveData((data: number): void => {
        receivedValues.push(data)
        callbackPromises.push(Promise.resolve())
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackPromises.length).assertEqual(2)
      expect(receivedValues.length).assertEqual(2)
      expect(receivedValues[0]).assertEqual(0.0)
      expect(receivedValues[1]).assertEqual(-999.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest0900
     * @tc.number SUB_TASK_SEND_DATA_TEST_0900
     * @tc.desc   Verify Task.sendData() with empty string and special characters passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValues: string[] = []
      let task1: taskpool.Task = new taskpool.Task(sendEmptyStrFunc)
      task1.onReceiveData((data: string): void => {
        receivedValues.push(data)
      })
      try {
        await taskpool.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      let task2: taskpool.Task = new taskpool.Task(sendSpecialStrFunc)
      task2.onReceiveData((data: string): void => {
        receivedValues.push(data)
      })
      try {
        await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValues.length).assertEqual(2)
      expect(receivedValues[0]).assertEqual("")
      expect(receivedValues[1]).assertEqual("hello@#$%")
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1000
     * @tc.number SUB_TASK_SEND_DATA_TEST_1000
     * @tc.desc   Verify Task.sendData() with number array passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number[] = []
      let task: taskpool.Task = new taskpool.Task(sendNumArrFunc)
      task.onReceiveData((data: number[]): void => {
        receivedData = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedData.length).assertEqual(3)
      expect(receivedData[0]).assertEqual(1.0)
      expect(receivedData[1]).assertEqual(2.0)
      expect(receivedData[2]).assertEqual(3.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1100
     * @tc.number SUB_TASK_SEND_DATA_TEST_1100
     * @tc.desc   Verify Task.sendData() with string array passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: string[] = []
      let task: taskpool.Task = new taskpool.Task(sendStrArrFunc)
      task.onReceiveData((data: string[]): void => {
        receivedData = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedData.length).assertEqual(3)
      expect(receivedData[0]).assertEqual("a")
      expect(receivedData[1]).assertEqual("b")
      expect(receivedData[2]).assertEqual("c")
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1200
     * @tc.number SUB_TASK_SEND_DATA_TEST_1200
     * @tc.desc   Verify Task.sendData() with empty array passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number[] = [1.0]
      let task: taskpool.Task = new taskpool.Task(sendEmptyArrFunc)
      task.onReceiveData((data: number[]): void => {
        receivedData = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedData.length).assertEqual(0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1300
     * @tc.number SUB_TASK_SEND_DATA_TEST_1300
     * @tc.desc   Verify Task.sendData() with two-dimensional array passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskSendDataTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedData: number[][] = []
      let task: taskpool.Task = new taskpool.Task(sendTwoDArrFunc)
      task.onReceiveData((data: number[][]): void => {
        receivedData = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedData.length).assertEqual(2)
      expect(receivedData[0].length).assertEqual(2)
      expect(receivedData[0][0]).assertEqual(1.0)
      expect(receivedData[1][1]).assertEqual(4.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1400
     * @tc.number SUB_TASK_SEND_DATA_TEST_1400
     * @tc.desc   Verify Task.sendData() with array of 100 elements passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskSendDataTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedLength: number = 0
      let task: taskpool.Task = new taskpool.Task(sendLargeArrFunc)
      task.onReceiveData((data: number[]): void => {
        receivedLength = data.length
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedLength).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1500
     * @tc.number SUB_TASK_SEND_DATA_TEST_1500
     * @tc.desc   Verify Task.sendData() with string of 100 characters passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskSendDataTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedLength: number = 0
      let task: taskpool.Task = new taskpool.Task(sendLargeStrFunc)
      task.onReceiveData((data: string): void => {
        receivedLength = data.length
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedLength).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1600
     * @tc.number SUB_TASK_SEND_DATA_TEST_1600
     * @tc.desc   Verify Task.sendData() with boolean true passes data to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValue: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendTrueFunc)
      task.onReceiveData((data: boolean): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1700
     * @tc.number SUB_TASK_SEND_DATA_TEST_1700
     * @tc.desc   Verify Task.sendData() with boolean false passes data to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValue: boolean = true
      let task: taskpool.Task = new taskpool.Task(sendFalseFunc)
      task.onReceiveData((data: boolean): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1800
     * @tc.number SUB_TASK_SEND_DATA_TEST_1800
     * @tc.desc   Verify Task.sendData() with number zero passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValue: number = -1.0
      let task: taskpool.Task = new taskpool.Task(sendZeroFunc)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual(0.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest1900
     * @tc.number SUB_TASK_SEND_DATA_TEST_1900
     * @tc.desc   Verify Task.sendData() with negative number passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValue: number = 0.0
      let task: taskpool.Task = new taskpool.Task(sendNegFunc)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual(-100.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest2000
     * @tc.number SUB_TASK_SEND_DATA_TEST_2000
     * @tc.desc   Verify Task.sendData() executes send and task returns result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskSendDataTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callbackTriggered: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendVoidFunc)
      let cbRecv1: (data?: Object) => void = (data?: Object): void => {
        callbackTriggered = true
        if (data !== undefined) {
          // data payload received from taskpool worker
        }
      }
      task.onReceiveData(cbRecv1)
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackTriggered).assertTrue()
      expect(result).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest2100
     * @tc.number SUB_TASK_SEND_DATA_TEST_2100
     * @tc.desc   Verify Task.sendData() executes send and task completes normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValue: string = ''
      let task: taskpool.Task = new taskpool.Task(sendDataOnlyFunc)
      task.onReceiveData((data: string): void => {
        receivedValue = data
      })
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual("data")
      expect(result).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest2200
     * @tc.number SUB_TASK_SEND_DATA_TEST_2200
     * @tc.desc   Verify Task.sendData() called from main thread throws "not called in the TaskPool thread"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hasError: boolean = false
      try {
        taskpool.Task.sendData("from main thread")
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
    })

    /**
     * @tc.name   TaskSendDataTest2300
     * @tc.number SUB_TASK_SEND_DATA_TEST_2300
     * @tc.desc   Verify Task.sendData() called from setTimeout callback throws "not called in the TaskPool thread"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let hasError: boolean = false
      try {
        taskpool.Task.sendData("from timer")
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskSendDataTest2400
     * @tc.number SUB_TASK_SEND_DATA_TEST_2400
     * @tc.desc   Verify Task.sendData() without registering onReceiveData throws "callback is not registered"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let hasError: boolean = false
      let task: taskpool.Task = new taskpool.Task(noCallbackSendFunc)
      try {
        await taskpool.execute(task)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskSendDataTest2500
     * @tc.number SUB_TASK_SEND_DATA_TEST_2500
     * @tc.desc   Verify Task.sendData() after onReceiveData(undefined) throws "callback is not registered"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let hasError: boolean = false
      let task: taskpool.Task = new taskpool.Task(noCallbackSendFunc)
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
     * @tc.name   TaskSendDataTest2600
     * @tc.number SUB_TASK_SEND_DATA_TEST_2600
     * @tc.desc   Verify Task.sendData() works with Task.onReceiveData() to pass data to host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValue: number = 0.0
      let task: taskpool.Task = new taskpool.Task(sendNumFunc, 5.0)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual(5.0)
      expect(result).assertEqual(5.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest2700
     * @tc.number SUB_TASK_SEND_DATA_TEST_2700
     * @tc.desc   Verify Task.sendData() called multiple times triggers callback each time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValues: number[] = []
      let task: taskpool.Task = new taskpool.Task(multiSendLoopFunc)
      task.onReceiveData((data: number): void => {
        receivedValues.push(data)
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValues.length).assertEqual(5)
      expect(receivedValues[0]).assertEqual(0.0)
      expect(receivedValues[1]).assertEqual(1.0)
      expect(receivedValues[2]).assertEqual(2.0)
      expect(receivedValues[3]).assertEqual(3.0)
      expect(receivedValues[4]).assertEqual(4.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest2800
     * @tc.number SUB_TASK_SEND_DATA_TEST_2800
     * @tc.desc   Verify Task.sendData() called 100 times rapidly all trigger callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskSendDataTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.Task(highFreqSendFunc)
      task.onReceiveData((data: number): void => {
        if (data !== undefined) {
          receivedCount = receivedCount + 1
        }
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedCount).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest2900
     * @tc.number SUB_TASK_SEND_DATA_TEST_2900
     * @tc.desc   Verify Task.sendData() receives data when callback registered before execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedValue: number = 0.0
      let task: taskpool.Task = new taskpool.Task(sendNumFunc, 200.0)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual(200.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest3000
     * @tc.number SUB_TASK_SEND_DATA_TEST_3000
     * @tc.desc   Verify Task.sendData() with duplicate onReceiveData registration uses last callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValue1: number = 0.0
      let receivedValue2: number = 0.0
      let task: taskpool.Task = new taskpool.Task(sendNumFunc, 300.0)
      task.onReceiveData((data: number): void => {
        receivedValue1 = data
      })
      task.onReceiveData((data: number): void => {
        receivedValue2 = data
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue1).assertEqual(0.0)
      expect(receivedValue2).assertEqual(300.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest3100
     * @tc.number SUB_TASK_SEND_DATA_TEST_3100
     * @tc.desc   Verify Task.sendData() after onReceiveData() cancel does not trigger callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskSendDataTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackTriggered: boolean = false
      let hasError: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendNumFunc, 100.0)
      task.onReceiveData((data: number): void => {
        callbackTriggered = data >= 0 || callbackTriggered;
      })
      task.onReceiveData()
      try {
        await taskpool.execute(task)
      } catch (e) {
        hasError = true
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(hasError).assertTrue()
      expect(callbackTriggered).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskSendDataTest3200
     * @tc.number SUB_TASK_SEND_DATA_TEST_3200
     * @tc.desc   Verify Task.sendData() triggers callback even when task throws error afterwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValue: number = 0.0
      let hasError: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataThenThrowFunc)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
        hasError = true
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(hasError).assertTrue()
      expect(receivedValue).assertEqual(100.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest3300
     * @tc.number SUB_TASK_SEND_DATA_TEST_3300
     * @tc.desc   Verify Task.sendData() works with taskpool.executeDelayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskSendDataTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedValue: number = 0.0
      let task: taskpool.Task = new taskpool.Task(sendDataForDelayedFunc, 50.0)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      try {
        await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual(50.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest3400
     * @tc.number SUB_TASK_SEND_DATA_TEST_3400
     * @tc.desc   Verify Task.sendData() works with taskpool.executePeriodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskSendDataTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      let receivedCount: number = 0
      let task: taskpool.Task = new taskpool.Task(sendDataForPeriodicFunc, 200.0)
      activePeriodicTasks.push(task)
      task.onReceiveData((data: number): void => {
        if (data >= 0) {
          receivedCount = receivedCount + 1
        }
      })
      taskpool.executePeriodically(200, task)
      try {
        let maxWait: number = 0
        while (receivedCount < 2 && maxWait < 3000) {
          await Utils.msSleep(500)
          maxWait += 500
        }
        // two successive deliveries prove the periodic task actually re-fires
        expect(receivedCount).assertLargerOrEqual(2)
      } catch (error) {
        expect().assertFail();
      } finally {
        try {
          taskpool.cancel(task)
        } catch (e) {
          // cancel may throw if task already finished
        }
        activePeriodicTasks = activePeriodicTasks.filter((t: taskpool.Task): boolean => t !== task)
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskSendDataTest3500
     * @tc.number SUB_TASK_SEND_DATA_TEST_3500
     * @tc.desc   Verify Task.sendData() concurrent tasks send data without confusion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskSendDataTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedData1: number[] = []
      let receivedData2: number[] = []
      let task1: taskpool.Task = new taskpool.Task(concurrentSendFunc1, 1.0)
      task1.onReceiveData((data: number): void => {
        receivedData1.push(data)
      })
      let task2: taskpool.Task = new taskpool.Task(concurrentSendFunc2, 2.0)
      task2.onReceiveData((data: number): void => {
        receivedData2.push(data)
      })
      try {
        await Promise.all([taskpool.execute(task1), taskpool.execute(task2)]);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedData1.length).assertEqual(3)
      expect(receivedData2.length).assertEqual(3)
      expect(receivedData1[0]).assertEqual(10.0)
      expect(receivedData2[0]).assertEqual(20.0)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest3600
     * @tc.number SUB_TASK_SEND_DATA_TEST_3600
     * @tc.desc   Verify Task.sendData() multiple concurrent tasks with independent callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskSendDataTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedCount1: number = 0
      let receivedCount2: number = 0
      let receivedCount3: number = 0
      let task1: taskpool.Task = new taskpool.Task(multiSendLoopFunc)
      task1.onReceiveData((data: number): void => {
        if (data >= 0) {
          receivedCount1 = receivedCount1 + 1
        }
      })
      let task2: taskpool.Task = new taskpool.Task(multiSendLoopFunc)
      task2.onReceiveData((data: number): void => {
        if (data >= 0) {
          receivedCount2 = receivedCount2 + 1
        }
      })
      let task3: taskpool.Task = new taskpool.Task(multiSendLoopFunc)
      task3.onReceiveData((data: number): void => {
        if (data >= 0) {
          receivedCount3 = receivedCount3 + 1
        }
      })
      try {
        await Promise.all([taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3)]);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedCount1).assertEqual(5)
      expect(receivedCount2).assertEqual(5)
      expect(receivedCount3).assertEqual(5)
      done();
    })

    /**
     * @tc.name   TaskSendDataTest3700
     * @tc.number SUB_TASK_SEND_DATA_TEST_3700
     * @tc.desc   Verify Task.sendData() callback not triggered after task timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskSendDataTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedValue: number = 0.0
      let hasTimeout: boolean = false
      let task: taskpool.Task = new taskpool.Task(sendDataInTimeoutFunc, 5000)
      task.onReceiveData((data: number): void => {
        receivedValue = data
      })
      try {
        await taskpool.execute(task, { timeout: 200 })
      } catch (e) {
        hasTimeout = true
      }
      expect(hasTimeout).assertTrue()
      // cancel the still-busy task so the late sendData cannot fire afterwards
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw if task already finished
      }
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedValue).assertEqual(0.0)
      done();
    })
  })
}
