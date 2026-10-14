'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import collections from '@arkts.collections';
import Utils from '../utils/Utils';
import { delay, getTaskStateByTaskName } from '../utils/taskPoolCommon';
import {
  testFailed,
  inspectStatus,
  additionDelay,
  waitForRunner,
  printArgs,
} from '../utils/taskPoolTask';

import {
  funcRetNumber,
  funcRetString,
  funcRetBool,
  funcRetUndef,
  funcRetNull,
  funcRetBigint,
  funcRetDate,
  funcRetArray,
  funcRetMap,
  funcRetSet,
  funcRetClass,
  funcRetAB,
  funcRetU8,
  funcRetArray2,
  printNumber,
  printString,
  printABool,
  printABig,
  taskTest001,
  mathMore,
  mathPow,
  mathSqrt,
  testTransfer,
  stringToNumber,
  testFunc,
  concurrentF,
  spileString,
  funArray,
  funDate,
  changeT,
  funcRUndef,
  changeN2T,
  ConstructorTest1,
  ConstructorTest2,
  ConstructorTest3,
  Concurrent,
  addTaskTask1,
  testLongTask1,
  testLongTask2,
  testSequenceRunner,
  testRunnerNum2Str,
  testRunnerStr2Str
} from '../utils/taskPool';

import {
  executeDelayed,
  executeLongTask,
  executePeriodically,
  executeSequenceRunner,
  executeTask,
  executeTaskGroup
} from '../utils/taskPoolCombineScenes';

import {
  SendableClass,
  SendableFunc,
  unionType,
  shareTypeTask0001,
  shareTypeTask0002,
  shareTypeTask0003,
  shareTypeTask0004,
  shareTypeTask0005,
  shareTypeTask0006,
  shareTypeTask0007,
  shareTypeTask0008,
  shareTypeTaskBool,
  shareTypeTaskNumber,
  shareTypeTask0011,
  shareTypeTask0013,
  shareTypeTask0014,
  shareTypeTask0016,
  shareTypeTask0017,
  CustomizeClass,
  ISendableClass,
  shareTypeTask0015,
} from '../utils/taskPoolExecuteCommon';

class ArkTools {
  static forceFullGC(): void {}
}

class Person1 {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  greet(): void {
    console.log(`Hello, my name is ${this.name}.`);
  }
}


function asyncSleep(time: number): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void): void => {
    setTimeout((): void => { resolve(0) }, Math.floor(time).toInt())
  });
}

function promiseCase(): Promise<void | Object> {
  let p: Promise<void | Object> = new Promise<void | Object>((resolve: (value: void | Object) => void, reject: (reason: Error) => void): void => {
    setTimeout((): void => {
      resolve(1);
    }, 300);
  });
  return p;
}

function addTaskTaskArray(args: string): Array<number> {
  let array = new Array<number>(1, 2, 3, 4);
  return array;
}

function testLongTaskArray(args: string): Array<number> {
  let array = new Array<number>(2, 3, 4, 5);
  return array;
}

function testRunnerStr2Arr1(args: number): Array<number> {
  let array = new Array<number>(3, 4, 5, 6);
  return array;
}

function testRunnerStr2Arr2(args: number): Array<number> {
  let array = new Array<number>(30, 40, 50, 60);
  return array;
}

function executeTask0001(args: number): string {
  return args.toString();
}

function executeTask0002(args: string): string[] {
  return new Array<string>(args);
}

function executeTask0003(args: string): string[] {
  return new Array<string>(args);
}

function executeTask0004(args: string): string {
  return args;
}

function terminateTask0001(arg: number): number {
  let t: number = Date.now();
  while (Date.now() - t < arg) {
    console.info("longTask time :" + (Date.now() - t));
    continue;
  }
  console.info("longTask has been executed.");
  return arg;
}

function isConcurrent0001(args: number): string {
  return args.toString();
}

function isConcurrent0002(args: string): string[] {
  return new Array<string>(args);
}

function sendDataTest0001(num: int): int {
  taskpool.Task.sendData(num);
  return num;
}

function sendDataTest0002(arg: string): string {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0003(arg: boolean): boolean {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0004(): undefined {
  taskpool.Task.sendData(undefined);
  return undefined;
}

function sendDataTest0005(): null {
  taskpool.Task.sendData(null);
  return null;
}

function sendDataTest0006(arg: bigint): bigint {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0007(arg: Date): Date {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0008(arg: String): String {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0009(arg: RegExp): RegExp {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0010(arg: Array<number>): Array<number> {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0011(arg: Map<string, string>): Map<string, string> {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0012(arg: Set<number>): Set<number> {
  taskpool.Task.sendData(arg);
  return arg;
}

interface Person {
  name: string;
  age: number;
}

function sendDataTest0013(arg: Object): Object {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0014(arg: ArrayBuffer): void {
  taskpool.Task.sendData(arg);
}

function sendDataTest0015(arg: Uint8Array): Uint8Array {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0016(arg: () => string): () => string {
  taskpool.Task.sendData(arg);
  return arg;
}

function sendDataTest0017(arg: boolean): boolean {
  taskpool.Task.sendData(arg);
  return arg;
}

function onReceiveData0001(arg: boolean): boolean {
  taskpool.Task.sendData(arg);
  return arg;
}

function printTaskPoolInfos(caseName: string) {
  console.info(caseName + "printTaskPoolInfos start date: " + new Date().getTime());
  let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();

  let taskInfos: taskpool.TaskInfo[] = taskpoolInfo.taskInfos;
  console.info(caseName + "taskInfos: " + JSON.stringify(taskInfos));
  taskInfos.forEach(taskInfo => {
    console.info(caseName + "taskInfo name: " + taskInfo.name);
    console.info(caseName + "taskInfo taskId: " + taskInfo.taskId);
    console.info(caseName + "taskInfo state: " + taskInfo.state);
    console.info(caseName + "taskInfo duration: " + taskInfo.duration);
  });

  let threadInfos: taskpool.ThreadInfo[] = taskpoolInfo.threadInfos;
  console.info(caseName + "threadInfos: " + JSON.stringify(threadInfos));
  threadInfos.forEach(threadInfo => {
    console.info(caseName + "threadInfo tid: " + threadInfo.tid);
    let taskIds = threadInfo.taskIds;
    console.info(caseName + "threadInfo taskIds: " + JSON.stringify(taskIds));
    console.info(caseName + "threadInfo priority: " + threadInfo.priority);
  });

  console.info(caseName + "printTaskPoolInfos end date: " + new Date().getTime());
}

function printResult(data: number): void {
  console.info("taskpool: data is: " + data);
}

function testExecutePeriodically(args: number): void {
  let t = Date.now();
  while ((Date.now() - t) < args) {
    continue;
  }
  taskpool.Task.sendData(args); // 向主线程发送消息
}

class ShareData {
  name: string = 'John';
  age: number = 30;
  city: string = 'ChangKing';
}

export default function TaskPoolStaticTest(): void {
  describe('TaskPoolStaticTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(500);
    })

    /**
     * @tc.name   testExecuteTaskStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0100
     * @tc.desc   Testing the task->execute with create func, assert return type and value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteTaskStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testExecuteTaskStatic0001';
      console.info(`${caseName} test start`);
      try {
        let a: string = await taskpool.execute(executeTask0001, 100.0) as string;
        expect(a).assertEqual('100');
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testExecuteTaskStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0110
     * @tc.desc   Testing the task->execute with create func, assert return type and value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteTaskStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testExecuteTaskStatic0002';
      console.info(`${caseName} test start`);
      try {
        let a: Array<string> = await taskpool.execute(executeTask0002, '200', taskpool.Priority.LOW) as Array<string>;
        expect(a).assertInstanceOf('Array');
          expect(a.toString()).assertEqual('200');
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testExecuteTaskStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0120
     * @tc.desc   Testing the task->execute with create func, assert return type and value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteTaskStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testExecuteTaskStatic0003';
      console.info(`${caseName} test start`);
      try {
        let a: Array<string> = await taskpool.execute(executeTask0003, '300', taskpool.Priority.MEDIUM) as Array<string>;
        expect(a).assertInstanceOf('Array');
          expect(a.toString()).assertEqual('300');
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testExecuteTaskStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0130
     * @tc.desc   Testing the task->execute with create func, assert return type and value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteTaskStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testExecuteTaskStatic0004';
      console.info(`${caseName} test start`);
      try {
        let a: string = await taskpool.execute(executeTask0004, '400', taskpool.Priority.HIGH) as string;
        expect(a).assertInstanceOf('String');
          expect(a).assertEqual('400');
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTerminateTaskStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0140
     * @tc.desc   Testing the task->terminateTask with create func, assert the size of the task pool array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTerminateTaskStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTerminateTaskStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.LongTask = new taskpool.LongTask(terminateTask0001, 500.0)
        let executePromise: Promise<Any> = taskpool.execute(task);
        await delay(300);
        // 静态运行时 terminateTask 当前为空实现：调用不抛错，长时任务继续执行至自然完成
        taskpool.terminateTask(task);
        let result: number = await executePromise as number;
        expect(result).assertEqual(500);
        console.info("taskpool longTask executed to completion");
        for (let i: int = 0; i < 150 && taskpool.getTaskPoolInfo().taskInfos.length > 0; i++) {
          await delay(10);
        }
        expect(taskpool.getTaskPoolInfo().taskInfos.length).assertEqual(0);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testIsConcurrentStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0150
     * @tc.desc   Testing the task->isConcurrent with create func, assert return value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsConcurrentStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testIsConcurrentStatic0001';
      console.info(`${caseName} test start`);
      try {
        let result: string = await taskpool.execute(isConcurrent0001, 1.0) as string;
        expect(result).assertEqual('1');
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testIsConcurrentStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0160
     * @tc.desc   Testing the task->isConcurrent with create func, assert return value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsConcurrentStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testIsConcurrentStatic0002';
      console.info(`${caseName} test start`);
      try {
        let result: Array<string> = await taskpool.execute(isConcurrent0002, '2') as Array<string>;
        expect(result).assertDeepEquals(new Array<string>('2'));
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0170
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0001, 100);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: int) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(100);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0180
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0002';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0002, 'hello');
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: string) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual('hello');
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0190
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0003';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0003, false);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: boolean) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(false);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0200
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0004';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0004);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: undefined) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(undefined);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0210
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0005';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0005);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: null) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(null);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0220
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0006';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0006, 123456789012345678901234567890n);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: object) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(123456789012345678901234567890n);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0230
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0007';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0007, new Date(1695936000000));
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: Date) => {
            console.info(`${caseName} onReceiveData res : ` + data.getTime());
            expect(data.getTime()).assertEqual(1695936000000);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0240
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0008';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0008, 'HELLO');
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: String) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual('HELLO');
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0250
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0009';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0009, new RegExp('hello', 'i'));
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: RegExp) => {
            console.info(`${caseName} onReceiveData res : ` + data.flags);
            expect(data.flags).assertEqual('i');
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0260
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0010';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0010, [0.0, 1.0]);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: Array<number>) => {
            try {
              console.info(`${caseName} onReceiveData res : ` + data);
              expect(data.length).assertEqual(2);
              expect(data[0]).assertEqual(0.0);
              expect(data[1]).assertEqual(1.0);
              received = true;
            } finally {
              resolve(undefined);
            }
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0270
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0011';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0011, new Map<string, string>([['hi', 'we'], ['hello', 'me']]));
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: Map<string, string>) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data.size).assertEqual(2);
            expect(data.get('hi')).assertEqual('we');
            expect(data.get('hello')).assertEqual('me');
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0280
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0012';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0012, new Set<number>([100]));
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: Set<number>) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data.size).assertEqual(1);
            data.forEach((value) => {
              expect(value).assertEqual(100);
            })
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0290
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0013';
      console.info(`${caseName} test start`);
      try {
        const objectData: Person = {
          name: "Alice",
          age: 25,
        };
        let task: taskpool.Task = new taskpool.Task(sendDataTest0013, objectData);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: Person) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data.age).assertEqual(25);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0300
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0014';
      console.info(`${caseName} test start`);
      try {
        const buffer = new ArrayBuffer(8);
        const uint8View = new Uint8Array(buffer);
        uint8View[0] = 255;
        uint8View[1] = 128;
        let task: taskpool.Task = new taskpool.Task(sendDataTest0014, buffer);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: ArrayBuffer) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            let receivedView: Uint8Array = new Uint8Array(data);
            expect(receivedView[0]).assertEqual(255);
            expect(receivedView[1]).assertEqual(128);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0310
     * @tc.desc   Testing the task->sendData with create func, assert task sendData value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0015';
      console.info(`${caseName} test start`);
      try {
        const typedArray = new Uint8Array([1, 2, 3, 4]);
        let task: taskpool.Task = new taskpool.Task(sendDataTest0015, typedArray);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: Uint8Array) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data[0]).assertEqual(1);
            expect(data[1]).assertEqual(2);
            expect(data[2]).assertEqual(3);
            expect(data[3]).assertEqual(4);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0320
     * @tc.desc   Testing the task->sendData with create func, assert catch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0016';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0016, () => {
          return 'hi'
        });
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: () => string) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data()).assertEqual('hi');
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testSendDataStatic0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0330
     * @tc.desc   Testing the task->sendData with create func, assert catch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendDataStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testSendDataStatic0017';
      console.info(`${caseName} test start`);
      let caught: boolean = false;
      try {
        let task: taskpool.Task = new taskpool.Task(sendDataTest0017, true);
        await taskpool.execute(task);
      } catch (error) {
        console.info(`${caseName} catch error: ${error}`);
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   testOnReceiveDataStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0340
     * @tc.desc   Register onReceiveData callback, execute a task that sends data, and assert the received data is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnReceiveDataStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testOnReceiveDataStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(onReceiveData0001, true);
        let received: boolean = false;
        let receiveDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onReceiveData((data: boolean) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(true);
            received = true;
            resolve(undefined);
          });
        });
        await taskpool.execute(task);
        await receiveDone;
        expect(received).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskAddDependencyStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0350
      * @tc.desc   Testing the task->addDependency with create tasks 1, 2, 3, none executed,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskAddDependencyStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskAddDependencyStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        console.info("dependency: add dependency start");
        task1.addDependency(task2);
        task2.addDependency(task3);
        console.info("dependency: add dependency end");
        // 依赖链生效的可观察断言：task1(100ms) 依赖 task2(200ms)，task2 依赖 task3(200ms)，
        // 三者并发提交后 task1 必须先于 task2 完成，不允许出现 task1 已完成而 task2 未完成
        let task1DoneBeforeTask2: boolean = false;
        let executePromise1: Promise<Any> = taskpool.execute(task1);
        let executePromise2: Promise<Any> = taskpool.execute(task2);
        let executePromise3: Promise<Any> = taskpool.execute(task3);
        let waitStart: number = Date.now();
        while (Date.now() - waitStart < 2000) {
          await delay(20);
          if (task1.isDone() && !task2.isDone()) {
            task1DoneBeforeTask2 = true;
            break;
          }
          if (task2.isDone()) {
            break;
          }
        }
        expect(task1DoneBeforeTask2).assertFalse();
        await executePromise3;
        await executePromise2;
        await executePromise1;
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskAddDependencyStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0360
     * @tc.desc   Testing the task->addDependency with create tasks 1, 2, 3, none executed,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskAddDependencyStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskAddDependencyStatic0002';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        console.info("dependency: add dependency start");
        task1.addDependency(task2);
        task2.addDependency(task3);
        task3.addDependency(task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200026);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskAddDependencyStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0370
     * @tc.desc   Testing the task->addDependency with create tasks 1, 2, 3, 1 to execute,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskAddDependencyStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskAddDependencyStatic0003';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        await taskpool.execute(task1);
        console.info("dependency: second task1 success");
        console.info("dependency: add dependency start");
        task1.addDependency(task2);
        task2.addDependency(task3);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertLarger(0);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskAddDependencyStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0380
     * @tc.desc   Testing the task->addDependency with Create tasks 1, 2, 3, 1 to execute, add 2 dependencies 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskAddDependencyStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskAddDependencyStatic0004';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        await taskpool.execute(task1);
        console.info("dependency: second task1 success");
        console.info("dependency: add dependency start");
        task2.addDependency(task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertLarger(0);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskAddDependencyStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0390
     * @tc.desc   Testing the task->addDependency with Create tasks 1, 2, 3, and 1 as long tasks,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskAddDependencyStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskAddDependencyStatic0005';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 1000);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        await taskpool.execute(task1);
        console.info("dependency: second task1 success");
        console.info("dependency: add dependency start");
        task2.addDependency(task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertLarger(0);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskAddDependencyStatic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0400
     * @tc.desc   Testing the task->addDependency with Create tasks 1, 2, 3, 1 in taskGroup,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskAddDependencyStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskAddDependencyStatic0006';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 200);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        await taskpool.execute(taskGroup);
        console.info("dependency: taskGroup with task1 success");
        ;
        console.info("dependency: add dependency start");
        task2.addDependency(task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertLarger(0);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskAddDependencyStatic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0410
     * @tc.desc   Testing the task->addDependency with Create tasks 1, 2, 3, 1 in SequenceRunner,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskAddDependencyStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskAddDependencyStatic0007';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 200);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        sequenceRunner.execute(task1);
        console.info("dependency: add dependency start");
        task2.addDependency(task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200079);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskRemoveDependencyStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0420
     * @tc.desc   Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskRemoveDependencyStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskRemoveDependencyStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        console.info("dependency: add dependency start");
        task1.addDependency(task2);
        task2.addDependency(task3);
        console.info("dependency: add dependency end");
        console.info("dependency: remove dependency start");
        task1.removeDependency(task2);
        console.info("dependency: remove dependency end");
        await taskpool.execute(task1);
        console.info("dependency: second task1 success");
        await taskpool.execute(task3);
        console.info("dependency: second task3 success");
        await taskpool.execute(task2);
        console.info("dependency: second task2 success");
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskRemoveDependencyStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0430
     * @tc.desc   Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskRemoveDependencyStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskRemoveDependencyStatic0002';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        console.info("dependency: add dependency start");
        task1.addDependency(task2);
        task2.addDependency(task3);
        console.info("dependency: add dependency end");
        console.info("dependency: remove dependency start");
        task2.removeDependency(task3);
        console.info("dependency: remove dependency end");
        await taskpool.execute(task2);
        console.info("dependency: second task2 success");
        await taskpool.execute(task1);
        console.info("dependency: second task1 success");
        await taskpool.execute(task3);
        console.info("dependency: second task3 success");
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskRemoveDependencyStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0440
     * @tc.desc   Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskRemoveDependencyStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskRemoveDependencyStatic0003';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        console.info("dependency: add dependency start");
        task1.addDependency(task2);
        task2.addDependency(task3);
        console.info("dependency: add dependency end");
        console.info("dependency: remove dependency start");
        task1.removeDependency(task3);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200027);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskRemoveDependencyStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0450
     * @tc.desc   Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskRemoveDependencyStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskRemoveDependencyStatic0004';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        console.info("dependency: add dependency start");
        task1.addDependency(task2);
        task2.addDependency(task3);
        console.info("dependency: add dependency end");
        console.info("dependency: remove dependency start");
        task3.removeDependency(task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200097);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskRemoveDependencyStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0460
     * @tc.desc   Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskRemoveDependencyStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskRemoveDependencyStatic0005';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 100);
        let task2: taskpool.Task = new taskpool.Task(delay, 200);
        let task3: taskpool.Task = new taskpool.Task(delay, 200);
        console.info("dependency: remove dependency start");
        task3.removeDependency(task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200097);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskOnEnqueuedStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0470
     * @tc.desc   Testing the task->onEnqueued with register before task execution.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskOnEnqueuedStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskOnEnqueuedStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        let callbackCalled = false;
        task.onEnqueued(() => {
          try {
            console.info("taskPool: onEnqueued");
            callbackCalled = true;

          } catch (error) {
            console.info(`gate-cb-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }});
        await taskpool.execute(task);
        console.info("taskPool: execute task success");
          console.info(`callbackCalled = ${callbackCalled}`);
          expect(callbackCalled).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskOnStartExecutionStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0490
     * @tc.desc   Testing the task->onStartExecution with register before task execution.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskOnStartExecutionStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskOnStartExecutionStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        let callbackCalled = false;
        task.onStartExecution(() => {
          try {
            console.info("taskPool: onStartExecution");
            callbackCalled = true;

          } catch (error) {
            console.info(`gate-cb-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }});
        await taskpool.execute(task);
        console.info("taskPool: execute task success");
          console.info(`callbackCalled = ${callbackCalled}`);
        await delay(100);
        expect(callbackCalled).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskOnExecutionFailedStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0510
     * @tc.desc   Testing the task->onExecutionFailed with error handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskOnExecutionFailedStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskOnExecutionFailedStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task = new taskpool.Task(testFailed, 1.0);
        let callbackCalled: boolean = false;
        let failedDone: Promise<void> = new Promise<void>((resolve): void => {
          task.onExecutionFailed((error) => {
            console.info("taskPool: onExecutionFailed error is " + error);
            callbackCalled = true;
            resolve(undefined);
          });
        });
        try { await taskpool.execute(task); } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
        await failedDone;
        expect(callbackCalled).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskOnExecutionFailedStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0520
     * @tc.desc   Testing the task->onExecutionFailed with error handling after task execution.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskOnExecutionFailedStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskOnExecutionFailedStatic0002';
      console.info(`${caseName} test start`);
      try {
        let task = new taskpool.Task(testFailed, 1.0);
        taskpool.execute(task)
        task.onExecutionFailed((error) => {
          console.info("taskPool: onExecutionFailed error is " + error);
        });
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200034);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskOnExecutionSucceededStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0530
     * @tc.desc   Testing whether onExecutionSucceeded was called when the task was executed successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskOnExecutionSucceededStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskOnExecutionSucceededStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        let callbackCalled = false;
        task.onExecutionSucceeded(() => {
          try {
            console.info("11taskPool: onExecutionSucceeded");
            callbackCalled = true;
            console.info(`Succeeded callbackCalled = ${callbackCalled}`);

          } catch (error) {
            console.info(`gate-cb-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }});
