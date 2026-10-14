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
        await taskpool.execute(task);
        console.info(caseName, "taskPool: execute task success");
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
     * @tc.name   testTaskIsDoneStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0550
     * @tc.desc   Testing the task->isDone with task is not added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskIsDoneStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskIsDoneStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        expect(task.isDone()).assertFalse();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskIsDoneStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0560
     * @tc.desc   Testing the task->isDone with task is not executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskIsDoneStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskIsDoneStatic0002';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 1);
        let task2: taskpool.Task = new taskpool.Task(delay, 1);
        await taskpool.execute(task2);
        console.info("taskPool: execute task success");
        expect(task1.isDone()).assertFalse();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskIsDoneStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0570
     * @tc.desc   Testing the task->isDone with task is executing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskIsDoneStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskIsDoneStatic0003';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 500);
        let executePromise: Promise<Any> = taskpool.execute(task);
        await delay(300);
        expect(task.isDone()).assertFalse();
        taskpool.cancel(task);
        try {
          await executePromise;
        } catch (error) {
          expect(error.code).assertLarger(0);
        }
        console.info("taskPool: execute task success");
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskIsDoneStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0580
     * @tc.desc   Testing the task->isDone with task is executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskIsDoneStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskIsDoneStatic0004';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 1);
        await taskpool.execute(task);
        console.info("taskPool: execute task success");
          expect(task.isDone()).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskIsDoneStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0590
     * @tc.desc   Testing the task->isDone with task is canceled when executing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskIsDoneStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskIsDoneStatic0005';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 500);
        let executePromise: Promise<Any> = taskpool.executeDelayed(500, task);
        expect(task.isDone()).assertFalse();
        taskpool.cancel(task);
        try {
          await executePromise;
        } catch (error) {
          console.info(`${caseName} canceled promise: ${JSON.stringify(error)}`);
        }
        expect(task.isDone()).assertFalse();
        console.info("taskPool: canceled pending task");
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskPriorityStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0600
     * @tc.desc   Submit tasks with four different priorities and wait for all tasks to complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPriorityStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskPriorityStatic0001';
      console.info(`${caseName} test start`);
      try {
        let allCount: int = 4;
        let taskArray: Array<taskpool.Task> = [];
        let taskPromises: Array<Promise<Any>> = [];
        for (let i: int = 0; i < allCount; i++) {
          taskArray.push(new taskpool.Task(delay, 10));
          taskArray.push(new taskpool.Task(delay, 10));
          taskArray.push(new taskpool.Task(delay, 10));
          taskArray.push(new taskpool.Task(delay, 10));
        }
        for (let i: int = 0; i < taskArray.length; i += 4) {
          taskPromises.push(taskpool.execute(taskArray[i], taskpool.Priority.HIGH));
          taskPromises.push(taskpool.execute(taskArray[i + 1], taskpool.Priority.LOW));
          taskPromises.push(taskpool.execute(taskArray[i + 2], taskpool.Priority.MEDIUM));
          taskPromises.push(taskpool.execute(taskArray[i + 3], taskpool.Priority.IDLE));
        }
        let results: Any[] = await Promise.all(taskPromises);
        expect(results.length).assertEqual(taskArray.length);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0610
     * @tc.desc   Testing cancel(task) when task is canceled directly without added to execute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 10);
        taskpool.cancel(task);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200088);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0620
     * @tc.desc   Testing cancel(task) when task is canceled without run.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0002';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 10);
        let task2: taskpool.Task = new taskpool.Task(delay, 10);
        await taskpool.execute(task2);
        console.info("taskPool: execute task success");
        taskpool.cancel(task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200088);
      }
      console.info(`${caseName} test end`);
      done();
    });

    //todo taskpool.Task.isCanceled() 始终为false
    /**
     * @tc.name   testCancelTaskStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0630
     * @tc.desc   testCancelTask0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0003';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 100);
        await taskpool.execute(task);
        console.info("taskPool: execute task success");
        let cancelCaught: boolean = false;
        try { taskpool.cancel(task); } catch (error) { cancelCaught = true; }
        expect(cancelCaught).assertTrue();
        // expect(taskpool.Task.isCanceled()).assertEqual(true);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0640
     * @tc.desc   Testing cancel(task) when task is executing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0004';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(inspectStatus, 100.0);
        let task2: taskpool.Task = new taskpool.Task(inspectStatus, 200.0);
        let task3: taskpool.Task = new taskpool.Task(inspectStatus, 300.0);
        let task4: taskpool.Task = new taskpool.Task(inspectStatus, 400.0);
        let task5: taskpool.Task = new taskpool.Task(inspectStatus, 500.0);
        let task6: taskpool.Task = new taskpool.Task(inspectStatus, 600.0);
        let res: Any = await taskpool.executeDelayed(0, task1);
        console.info("taskpool test result: " + res);
        let p2: Promise<Any> = taskpool.execute(task2);
        let p3: Promise<Any> = taskpool.execute(task3);
        let p4: Promise<Any> = taskpool.execute(task4);
        let p5: Promise<Any> = taskpool.execute(task5);
        let p6: Promise<Any> = taskpool.execute(task6);
        await promiseCase();
        let cancelCaught: boolean = false;
        try {
          taskpool.cancel(task1);
        } catch (e) {
          cancelCaught = true;
          console.info(`${caseName} cancel completed task code => ${e.code} message => ${e.message}`);
        }
        expect(cancelCaught).assertFalse();
        expect(await p2 as number).assertEqual(201);
        expect(await p3 as number).assertEqual(301);
        expect(await p4 as number).assertEqual(401);
        expect(await p5 as number).assertEqual(501);
        expect(await p6 as number).assertEqual(601);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0650
     * @tc.desc   Testing cancel(task) when task is executing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
        it('testCancelTaskStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0005';
      console.info(`${caseName} test start`);
      try {
        // 取消尚未开始的 delayed 任务，避免长忙等竞态
        let task1: taskpool.Task = new taskpool.Task(inspectStatus, 200.0);
        let task2: taskpool.Task = new taskpool.Task(inspectStatus, 200.0);
        let p1: Promise<Any> = taskpool.executeDelayed(500, task1);
        let p2: Promise<Any> = taskpool.execute(task2);
        await promiseCase();
        let cancelCaught: boolean = false;
        try {
          taskpool.cancel(task1);
        } catch (e) {
          cancelCaught = true;
          console.info(`${caseName} cancel throw code => ${e.code} message => ${e.message}`);
        }
        if (!cancelCaught) {
          try {
            await p1;
            expect().assertFail();
          } catch (e) {
            cancelCaught = true;
          }
        } else {
          try { await p1; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
        }
        try { await p2; } catch (error) { console.info(`gate-catch: ${JSON.stringify(error)}`); }
        expect(cancelCaught).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskStatic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0660
     * @tc.desc   Testing cancel(task) when task is executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0006';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 100);
        await taskpool.execute(task);
        console.info("taskPool: execute task success");
        await delay(100);
        taskpool.cancel(task);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200085);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskStatic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0670
     * @tc.desc   Testing cancel(task) when task is non-existent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0007';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(inspectStatus, 100);
        taskpool.cancel(task);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200088);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskStatic0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0680
     * @tc.desc   Testing cancel(task) when task is cancellation for SequenceRunner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0008';
      console.info(`${caseName} test start`);
      try {
        let finalString: string = "";
        let task1: taskpool.Task = new taskpool.Task(additionDelay, 300.0);
        let task2: taskpool.Task = new taskpool.Task(additionDelay, 200.0);
        let task3: taskpool.Task = new taskpool.Task(additionDelay, 100.0);
        let task4: taskpool.Task = new taskpool.Task(waitForRunner, finalString);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let promise1: Promise<Any> = runner.execute(task1);
        let promise2: Promise<Any> = runner.execute(task2);
        taskpool.cancel(task2);
        await promise1;
        finalString += 'a';
        let cancelCaught: boolean = false;
        try {
          await promise2;
          finalString += 'b';
        } catch (error) {
          cancelCaught = true;
          console.info(`${caseName} canceled task2: code => ${error.code} message => ${error.message}`);
        }
        await runner.execute(task3);
        finalString += 'c';
        await runner.execute(task4);
        expect(cancelCaught).assertTrue();
        expect(finalString).assertEqual("ac")
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskStatic0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0690
     * @tc.desc   Testing cancel(task) when tasks have a dependency relationship.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskStatic0009';
      console.info(`${caseName} test start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(delay, 10);
        let task2: taskpool.Task = new taskpool.Task(delay, 20);
        task1.addDependency(task2);
        await taskpool.execute(task2);
        let executePromise: Promise<Any> = taskpool.executeDelayed(500, task1);
        taskpool.cancel(task1);
        let cancelCaught: boolean = false;
        try { await executePromise; } catch (error) { cancelCaught = true; }
        expect(cancelCaught).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskGroupStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0700
     * @tc.desc   Testing cancel(taskGroup) when task is canceled directly without added to task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskGroupStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskGroupStatic0001';
      console.info(`${caseName} test start`);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskpool.cancel(taskGroup);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200089);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskGroupStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0710
     * @tc.desc   Testing cancel(taskGroup) when task is canceled directly without added to execute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskGroupStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskGroupStatic0002';
      console.info(`${caseName} test start`);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printArgs, 10.0);
        taskGroup.addTask(printArgs, 20.0);
        taskGroup.addTask(printArgs, 30.0);
        taskpool.cancel(taskGroup);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200089);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskGroupStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0720
     * @tc.desc   Testing cancel(taskGroup) when task is executing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskGroupStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskGroupStatic0003';
      console.info(`${caseName} test start`);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printArgs, 10.0);
        taskGroup.addTask(printArgs, 20.0);
        taskGroup.addTask(printArgs, 30.0);
        let res: Any = await taskpool.execute(taskGroup);
        let cancelCaught: boolean = false;
        try { taskpool.cancel(taskGroup); } catch (error) { cancelCaught = true; }
        expect(cancelCaught).assertTrue();
        console.info("taskpool execute res is:" + res);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testCancelTaskGroupStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0730
     * @tc.desc   Testing cancel(taskGroup) when task is executing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCancelTaskGroupStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testCancelTaskGroupStatic0004';
      console.info(`${caseName} test start`);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printArgs, 10.0);
        taskGroup.addTask(printArgs, 20.0);
        taskGroup.addTask(printArgs, 30.0);
        let res: Any = await taskpool.execute(taskGroup);
        console.info("taskpool execute res is:" + res);
        await delay(100);
        taskpool.cancel(taskGroup);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200089);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskCombineScenesStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0740
     * @tc.desc   Cancel a delayed task before it runs and assert the execute promise rejects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0001';
      console.info(`${caseName} test task start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 100);
        let p: Promise<Any> = taskpool.executeDelayed(500, task);
        taskpool.cancel(task);
        let cancelled: boolean = false;
        try {
          await p;
        } catch (e) {
          cancelled = true;
          console.info(`${caseName} cancel reject code => ${e.code} message => ${e.message}`);
        }
        expect(cancelled).assertTrue();
      } catch (e) {
        console.info(`${caseName} catch error: code => ${e.code} message => ${e.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test task end`);
      done();
    });

    /**
     * @tc.name   testTaskCombineScenesStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0750
     * @tc.desc   执行&取消, TaskGroup & cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0002';
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task: taskpool.Task = new taskpool.Task(delay, 100);
        taskGroup.addTask(task);
        await taskpool.execute(taskGroup);
        try {
          taskpool.cancel(task);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200085);
        }
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskCombineScenesStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0760
     * @tc.desc   执行&取消, 延时 & cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0003';
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 100);
        let executePromise: Promise<Any> = taskpool.executeDelayed(500, task, taskpool.Priority.LOW);
        taskpool.cancel(task);
        let rejected: boolean = false;
        try {
          await executePromise;
        } catch (error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskCombineScenesStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0770
     * @tc.desc   执行&取消, 周期 & cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0004';
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 100);
        taskpool.executePeriodically(10, task, taskpool.Priority.LOW);
        await asyncSleep(50);
        taskpool.cancel(task);
        expect(task.isDone()).assertFalse();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskCombineScenesStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0780
     * @tc.desc   执行&取消, 串行 & cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0005';
      console.info(`${caseName} test sequenceRunner start`);
      try {
        let task1: taskpool.Task = new taskpool.Task(additionDelay, 500.0);
        let task2: taskpool.Task = new taskpool.Task(additionDelay, 500.0);
        let task3: taskpool.Task = new taskpool.Task(additionDelay, 500.0);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(caseName, taskpool.Priority.LOW);
        console.info(`${caseName} sequenceRunner: execute task start`);
        let promise1: Promise<Any> = runner.execute(task1);
        let promise2: Promise<Any> = runner.execute(task2);
        let promise3: Promise<Any> = runner.execute(task3);
        taskpool.cancel(task2);
        await promise1;
        let rejected2: boolean = false;
        try {
          await promise2;
        } catch (error) {
          rejected2 = true;
          console.info(`${caseName} canceled task2 reject code => ${error.code} message => ${error.message}`);
        }
        expect(rejected2).assertTrue();
        await promise3;
        console.info(`${caseName} sequenceRunner: execute task end`);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test sequenceRunner end`);
      done();
    });

    /**
     * @tc.name   testTaskCombineScenesStatic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0790
     * @tc.desc   执行&取消, 长时 & cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0006';
      try {
        let task: taskpool.LongTask = new taskpool.LongTask(additionDelay, 1000);
        let executePromise: Promise<Any> = taskpool.execute(task);
        await delay(100);
        taskpool.terminateTask(task);
        let rejected: boolean = false;
        try {
          await executePromise;
        } catch (error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   testTaskCombineScenesStatic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0800
     * @tc.desc   执行组合，Task 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0007';
      try {
        let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
        let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
        let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
        let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
        let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
        let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
        expect(await taskpool.execute(task1) as string).assertEqual(caseName);
        expect(await taskpool.execute(task2) as string).assertEqual(caseName);
        expect(await taskpool.execute(task3) as string).assertEqual(caseName);
        expect(await taskpool.execute(task4) as string).assertEqual(caseName);
        expect(await taskpool.execute(task5) as string).assertEqual(caseName);
        expect(await taskpool.execute(task6) as string).assertEqual(caseName);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskCombineScenesStatic0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0810
     * @tc.desc   执行组合，TaskGroup 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0008';
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
        let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
        let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
        let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
        let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
        let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        taskGroup.addTask(task3);
        taskGroup.addTask(task4);
        taskGroup.addTask(task5);
        taskGroup.addTask(task6);
        let results: Array<string> = await taskpool.execute(taskGroup) as Array<string>;
        expect(results.length).assertEqual(6);
        for (let result of results) {
          expect(result).assertEqual(caseName);
        }
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   testTaskCombineScenesStatic0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0820
     * @tc.desc   执行组合，延时 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0009';
      try {
        let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
        let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
        let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
        let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
        let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
        let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
        let promise1: Promise<Any> = taskpool.executeDelayed(100, task1);
        let promise2: Promise<Any> = taskpool.executeDelayed(100, task2);
        let promise3: Promise<Any> = taskpool.executeDelayed(100, task3);
        let promise4: Promise<Any> = taskpool.executeDelayed(100, task4);
        let promise5: Promise<Any> = taskpool.executeDelayed(100, task5);
        let promise6: Promise<Any> = taskpool.executeDelayed(100, task6);
        expect(await promise1 as string).assertEqual(caseName);
        expect(await promise2 as string).assertEqual(caseName);
        expect(await promise3 as string).assertEqual(caseName);
        expect(await promise4 as string).assertEqual(caseName);
        expect(await promise5 as string).assertEqual(caseName);
        expect(await promise6 as string).assertEqual(caseName);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   testTaskCombineScenesStatic0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0830
     * @tc.desc   执行组合，周期 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0010';
      try {
        let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
        let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
        let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
        let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
        let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
        let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
        taskpool.executePeriodically(100, task1);
        taskpool.executePeriodically(100, task2);
        taskpool.executePeriodically(100, task3);
        taskpool.executePeriodically(100, task4);
        taskpool.executePeriodically(100, task5);
        taskpool.executePeriodically(100, task6);
        await asyncSleep(300);
        taskpool.cancel(task1);
        taskpool.cancel(task2);
        taskpool.cancel(task3);
        taskpool.cancel(task4);
        taskpool.cancel(task5);
        taskpool.cancel(task6);
        expect(task1.isDone()).assertFalse();
        expect(task6.isDone()).assertFalse();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   testTaskCombineScenesStatic0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0840
     * @tc.desc   执行组合，串行 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0011';
      try {
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
        let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
        let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
        let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
        let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
        let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
        expect(await runner.execute(task1) as string).assertEqual(caseName);
        expect(await runner.execute(task2) as string).assertEqual(caseName);
        expect(await runner.execute(task3) as string).assertEqual(caseName);
        expect(await runner.execute(task4) as string).assertEqual(caseName);
        expect(await runner.execute(task5) as string).assertEqual(caseName);
        expect(await runner.execute(task6) as string).assertEqual(caseName);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   testTaskCombineScenesStatic0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0850
     * @tc.desc   执行组合，长时 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0012';
      try {
        let task1: taskpool.LongTask = new taskpool.LongTask(executeTask, caseName);
        let task2: taskpool.LongTask = new taskpool.LongTask(executeTaskGroup, caseName);
        let task3: taskpool.LongTask = new taskpool.LongTask(executeDelayed, caseName);
        let task4: taskpool.LongTask = new taskpool.LongTask(executePeriodically, caseName);
        let task5: taskpool.LongTask = new taskpool.LongTask(executeSequenceRunner, caseName);
        let task6: taskpool.LongTask = new taskpool.LongTask(executeLongTask, caseName);
        expect(await taskpool.execute(task1) as string).assertEqual(caseName);
        taskpool.terminateTask(task1);
        expect(await taskpool.execute(task2) as string).assertEqual(caseName);
        taskpool.terminateTask(task2);
        expect(await taskpool.execute(task3) as string).assertEqual(caseName);
        taskpool.terminateTask(task3);
        expect(await taskpool.execute(task4) as string).assertEqual(caseName);
        taskpool.terminateTask(task4);
        expect(await taskpool.execute(task5) as string).assertEqual(caseName);
        taskpool.terminateTask(task5);
        expect(await taskpool.execute(task6) as string).assertEqual(caseName);
        taskpool.terminateTask(task6);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   testTaskCombineScenesStatic0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0860
     * @tc.desc   执行组合，taskpool 并列 taskpool：Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskCombineScenesStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskCombineScenesStatic0013';
      try {
        expect(await executeTask(caseName)).assertEqual(caseName);
        expect(await executeTaskGroup(caseName)).assertEqual(caseName);
        expect(await executeDelayed(caseName)).assertEqual(caseName);
        expect(await executePeriodically(caseName)).assertEqual(caseName);
        expect(await executeSequenceRunner(caseName)).assertEqual(caseName);
        expect(await executeLongTask(caseName)).assertEqual(caseName);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0870
     * @tc.desc   period：10，task：不指定任务名，优先级：不指定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0001';
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, caseName);
        taskpool.executePeriodically(10, task);
        await asyncSleep(50);
        taskpool.cancel(task);
        expect(task.isDone()).assertFalse();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0880
     * @tc.desc   period：0，task：指定任务名，优先级：指定taskpool.Priority.LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0002';
      try {
        let task: taskpool.Task = new taskpool.Task(caseName, printArgs, caseName);
        taskpool.executePeriodically(0, task, taskpool.Priority.LOW);
        await asyncSleep(50);
        taskpool.cancel(task);
        expect(task.isDone()).assertFalse();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0890
     * @tc.desc   period：-100，task：指定任务名，优先级：指定taskpool.Priority.MEDIUM 报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0003';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(caseName, printArgs, caseName);
        taskpool.executePeriodically(-100, task, taskpool.Priority.MEDIUM);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200096);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0900
     * @tc.desc   period：100，task：不指定任务名，带依赖关系，优先级：指定taskpool.Priority.HIGH 按照依赖顺序执行 报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0004';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 10);
        let task1: taskpool.Task = new taskpool.Task(delay, 10);
        console.info(`${caseName} dependency: add dependency start`);
        task.addDependency(task1);
        console.info(`${caseName} dependency: add dependency end`);
        taskpool.executePeriodically(100, task, taskpool.Priority.HIGH);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertLarger(0);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0910
     * @tc.desc   已经执行的task 报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0005';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 10);
        taskpool.execute(task);
        taskpool.executePeriodically(100, task);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200086);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0920
     * @tc.desc   周期任务 报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0006';
      let task: taskpool.Task = new taskpool.Task(delay, 10);
      try {
        taskpool.executePeriodically(100, task);
        try {
          taskpool.executePeriodically(100, task);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200086);
        }
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      } finally {
        taskpool.cancel(task);
      }
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0930
     * @tc.desc   处于其他任务组的任务 报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0007';
      console.info(`${caseName} test start`);
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task: taskpool.Task = new taskpool.Task(delay, 100);
        console.info(`${caseName} taskGroup: add task start`);
        taskGroup.addTask(task);
        taskpool.execute(taskGroup);
        console.info(`${caseName} taskGroup: add task end`);
        taskpool.executePeriodically(100, task);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertLarger(0);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0940
     * @tc.desc   有依赖关系的任务 报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0008';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(delay, 100);
        let task1: taskpool.Task = new taskpool.Task(delay, 200);
        console.info(`${caseName} dependency: add dependency start`);
        task.addDependency(task1);
        console.info(`${caseName} dependency: add dependency end`);
        taskpool.executePeriodically(100, task);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertLarger(0);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskExecutePeriodicallyStatic0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0950
     * @tc.desc   SequenceRunner的task 报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskExecutePeriodicallyStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskExecutePeriodicallyStatic0009';
      console.info(`${caseName} test start`);
      try {
        let finalString: string = "";
        let task1: taskpool.Task = new taskpool.Task(delay, 10);
        let task2: taskpool.Task = new taskpool.Task(delay, 10);
        let task3: taskpool.Task = new taskpool.Task(delay, 10);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task1);
        finalString += 'a';
          console.info(`${caseName} task1 done.`);
        await runner.execute(task2);
        finalString += 'b';
          console.info(`${caseName} task2 done.`);
        await runner.execute(task3);
        finalString += 'c';
          console.info(`${caseName} task3 done.`);
        console.info(`${caseName} seqrunner done, finalString is ${finalString}`);
        taskpool.executePeriodically(100, task1);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertLarger(0);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskStateStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0960
     * @tc.desc   Create a task, read its state and assert isDone returns false before execution completes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskStateStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskStateStatic0001';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(caseName, additionDelay, 50.0);
        let executePromise: Promise<Any> = taskpool.executeDelayed(500, task);
        let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let state: number = getTaskStateByTaskName(taskpoolInfo, caseName);
        expect(state).assertEqual(taskpool.State.DELAYED);
        expect(task.isDone()).assertFalse();
        taskpool.cancel(task);
        try {
          await executePromise;
        } catch (error) {
          console.info(`${caseName} canceled promise: ${JSON.stringify(error)}`);
        }
        expect(task.isDone()).assertFalse();
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskStateStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0970
     * @tc.desc   创建task，并execute，实际执行中 RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskStateStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskStateStatic0002';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(caseName, additionDelay, 500.0);
        let executePromise: Promise<Any> = taskpool.execute(task);
        let state: number = 0;
        let waitStart: number = Date.now();
        while (state !== taskpool.State.RUNNING && Date.now() - waitStart < 1000) {
          await delay(10);
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          state = getTaskStateByTaskName(taskpoolInfo, caseName);
        }
        expect(state).assertEqual(taskpool.State.RUNNING);
        await executePromise;
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskStateStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0980
     * @tc.desc   Execute a task to completion, assert isDone is true and, if the task is still listed in taskInfos, its state is not RUNNING.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskStateStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskStateStatic0003';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(caseName, delay, 100);
        await taskpool.execute(task);
        console.info(`${caseName} task end`);
        // 终态可观察断言：execute 完成后 isDone 必须为 true（不再用 0|6 魔数恒真式）
        expect(task.isDone()).assertTrue();
        let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        // 独立 sentinel 检索：helper getTaskStateByTaskName 未命中默认返 0，无法区分"未命中"与 WAITING
        let stateFound: boolean = false;
        let state: number = -1;
        for (let taskInfo of Array.from(taskpoolInfo.taskInfos)) {
          if (taskInfo.name == caseName) {
            stateFound = true;
            state = taskInfo.state;
          }
        }
        if (stateFound) {
          // 已完成任务不得仍处于 RUNNING；任务完成后被移出 taskInfos 亦属正常终态
          expect(state === taskpool.State.RUNNING).assertFalse();
        }
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskStateStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_0990
     * @tc.desc   创建task，并execute，cancel任务 CANCELED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskStateStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskStateStatic0004';
      console.info(`${caseName} test start`);
      try {
        let task: taskpool.Task = new taskpool.Task(caseName, delay, 50);
        taskpool.executeDelayed(500, task);
        taskpool.cancel(task);
        let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        let state: number = getTaskStateByTaskName(taskpoolInfo, caseName);
        expect(state).assertEqual(taskpool.State.CANCELED);
      } catch (error) {
        console.info(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolTaskGroupConstructorStatic001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1000
     * @tc.desc   Set the taskpool taskgroup constructor without groupname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupConstructorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupConstructorStatic001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(ConstructorTest1);
        taskExecute1.addTask(ConstructorTest2);
        taskExecute1.addTask(ConstructorTest3);

        let res: Any = await taskpool.execute(taskExecute1);
        console.info(`${caseName}: testTaskpoolTaskGroupConstructor001 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          expect(res as string[]).assertDeepEquals([`ConstructorTest1`, `ConstructorTest2`, `ConstructorTest3`]);
          console.info(`${caseName}: groupName:${taskExecute1.name}`);
          expect(taskExecute1.name).assertEqual("");
        while (!(isTerminate1)) {
          await promiseCase();
        }
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolTaskGroupConstructorStatic002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1010
     * @tc.desc   Set the taskpool taskgroup constructor with string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupConstructorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupConstructorStatic002';
      console.info(`${caseName} test start`);
      try {
        let taskGroupName: string = "";
        let isTerminate1: boolean = false;
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName);
        taskExecute1.addTask(ConstructorTest1);

        let res: Any = await taskpool.execute(taskExecute1);
        console.info(`${caseName}: taskGroupName: ${taskExecute1.name}`);
        isTerminate1 = true;
        expect(taskExecute1.name).assertEqual(taskGroupName);
        expect(res as string[]).assertDeepEquals(['ConstructorTest1']);
        while (!(isTerminate1)) {
          await promiseCase();
        }
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testTaskpoolTaskGroupConstructorStatic005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1020
     * @tc.desc   Set the taskpool taskgroup constructor with taskname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupConstructorStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupConstructorStatic005';
      console.info(`${caseName} test start`);
      try {
        let taskGroupName: string = "taskname";
        let isTerminate1: boolean = false;
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName);
        taskExecute1.addTask(ConstructorTest1);

        let res: Any = await taskpool.execute(taskExecute1);
        console.info(`${caseName}: taskGroupName: ${taskExecute1.name}`);
          expect(taskExecute1.name).assertDeepEquals("taskname");
          isTerminate1 = true;
        while (!(isTerminate1)) {
          await promiseCase();
        }
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    // func:使用@Concurrent装饰器装饰,返回number类型，无参数     then中可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolTaskGroupAddTaskStatic002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1030
     * @tc.desc   testTaskpoolTaskGroupAddTask002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupAddTaskStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupAddTaskStatic002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(Concurrent);
        taskExecute1.addTask(Concurrent);
        let res: Array<number> = await taskpool.execute(taskExecute1) as Array<number>;
        console.info(`${caseName}: taskExecute1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
          for (let i: int = 0; i < res.length; i++) {
            console.info(`${caseName}: ${res[i].toString()}`);
          }
          expect((res as number[])[0]).assertEqual(321.0);
          expect((res as number[])[1]).assertEqual(321.0);
        while (!(isTerminate1)) {
          await promiseCase();
        }
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name   testTaskpoolTaskGroupAddTaskStatic004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1040
     * @tc.desc   Add two preconstructed Task objects returning strings into a TaskGroup and assert the group results are ['1001', '2001'].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupAddTaskStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupAddTaskStatic004';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let result1: object[] = [];
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(addTaskTask1, 100.0);
        let task2: taskpool.Task = new taskpool.Task(addTaskTask1, 200.0);
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        let res: Any = await taskpool.execute(taskExecute1);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as object[];
          expect(result1).assertDeepEquals([`1001`, `2001`]);
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolTaskGroupAddTaskStatic005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1050
     * @tc.desc   Add two named tasks returning number arrays into a TaskGroup and assert each group result equals [1, 2, 3, 4].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupAddTaskStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupAddTaskStatic005';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        let taskName: string = "taskName";
        let task1: taskpool.Task = new taskpool.Task(taskName, addTaskTaskArray, "A");
        let task2: taskpool.Task = new taskpool.Task(taskName, addTaskTaskArray, "B");
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        let res: Array<Array<number>> = await taskpool.execute(taskExecute1, taskpool.Priority.LOW) as Array<Array<number>>;
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          console.info(`${caseName}: typeof: ${typeof (res)}, length:${res.length}`);
          for (let i: int = 0; i < res.length; i++) {
            console.info(`${caseName}: ${res[i].toString()}`);
            expect(res[i]).assertDeepEquals(new Array<number>(1, 2, 3, 4));
          };
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolTaskGroupAddTaskStatic006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1060
     * @tc.desc   Add two named tasks returning number arrays into a TaskGroup and assert each group result equals [1, 2, 3, 4].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupAddTaskStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupAddTaskStatic006';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        let taskName: string = "taskName";
        let task1: taskpool.Task = new taskpool.Task(taskName, addTaskTaskArray, "A");
        let task2: taskpool.Task = new taskpool.Task(taskName, addTaskTaskArray, "B");
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        let res: Array<Array<number>> = await taskpool.execute(taskExecute1, taskpool.Priority.MEDIUM) as Array<Array<number>>;
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          console.info(`${caseName}: typeof: ${typeof (res)}, length:${res.length}`);
          for (let i: int = 0; i < res.length; i++) {
            console.info(`${caseName}: ${res[i].toString()}`);
            expect(res[i]).assertDeepEquals(new Array<number>(1, 2, 3, 4));
          };
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolTaskGroupAddTaskStatic007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1070
     * @tc.desc   Add two tasks returning strings into a TaskGroup and assert the group results are ['AAA1', 'BBB1'].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupAddTaskStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupAddTaskStatic007';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let result1: object[] = [];
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(addTaskTask1, "AAA");
        let task2: taskpool.Task = new taskpool.Task(addTaskTask1, "BBB");
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        let res: Any = await taskpool.execute(taskExecute1);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as object[];
          expect(result1).assertDeepEquals([`AAA1`, `BBB1`]);
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolTaskGroupAddTaskStatic008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1080
     * @tc.desc   Add longTask task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupAddTaskStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupAddTaskStatic008';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let result1: Array<string> = [];
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.LongTask(addTaskTask1, "AAA");
        let task2: taskpool.Task = new taskpool.LongTask(addTaskTask1, "BBB");
        // TaskGroup 不支持 LongTask：addTask 抛 10200084（同 TaskpoolStandardStaticComplete.test.ets Static136），成功路径判失败
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        expect().assertFail();
        let res: Any = await taskpool.execute(taskExecute1);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as Array<string>;
          expect(result1).assertDeepEquals([`AAA1`, `BBB1`]);
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200084);
        done();
      }
      console.info(`${caseName} test end`);
    });


    // 添加过的任务， 报错：401 message => Parameter error. taskpool:: executed taskGroup cannot addTask
    /**
     * @tc.name   testTaskpoolTaskGroupAddTaskStatic009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1090
     * @tc.desc   testTaskpoolTaskGroupAddTask009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupAddTaskStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupAddTaskStatic009';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let result1: Array<string> = [];
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(addTaskTask1, "AAA");
        let task2: taskpool.Task = new taskpool.Task(addTaskTask1, "BBB");
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        let res: Any = await taskpool.execute(taskExecute1);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as Array<string>;
          expect(result1).assertDeepEquals([`AAA1`, `BBB1`]);
        taskExecute1.addTask(task1);
        taskExecute1.addTask(task2);
        expect().assertFail();
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect(error.code).assertEqual(10200077);
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolTaskGroupLongTaskStatic001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1100
     * @tc.desc   Set Longtask without taskname and priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupLongTaskStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupLongTaskStatic001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let task: taskpool.LongTask = new taskpool.LongTask(testLongTask1, 100.0);
        let res: Any = await taskpool.execute(task);
        taskpool.terminateTask(task);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          expect(res as string).assertEqual(`100`);
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolTaskGroupLongTaskStatic002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1110
     * @tc.desc   Create a named LongTask, execute it, and assert the task name and the returned array [2, 3, 4, 5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupLongTaskStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupLongTaskStatic002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let taskName: string = "TestName1";
        let task: taskpool.LongTask = new taskpool.LongTask(taskName, testLongTaskArray, "testString");
        let res: Any = await taskpool.execute(task, taskpool.Priority.LOW);
        taskpool.terminateTask(task);
        console.info(`${caseName}: execute res is: ${res} taskName: ${task.name}`);
          isTerminate1 = true;
          expect(task.name).assertDeepEquals(taskName);
          expect(res as object[]).assertDeepEquals(new Array<number>(2, 3, 4, 5));
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolTaskGroupLongTaskStatic003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1120
     * @tc.desc   Create a named LongTask, execute it, and assert the task name and the returned array [2, 3, 4, 5].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupLongTaskStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupLongTaskStatic003';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let taskName: string = "TestName2";
        let task: taskpool.LongTask = new taskpool.LongTask(taskName, testLongTaskArray, "testString");
        let res: Any = await taskpool.execute(task, taskpool.Priority.MEDIUM);
        taskpool.terminateTask(task);
        console.info(`${caseName}: execute res is: ${res} taskName: ${task.name}`);
          isTerminate1 = true;
          expect(task.name).assertDeepEquals(taskName);
          expect(res as object[]).assertDeepEquals(new Array<number>(2, 3, 4, 5));
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTaskpoolTaskGroupLongTaskStatic004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1130
     * @tc.desc   testTaskpoolTaskGroupLongTask004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskGroupLongTaskStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolTaskGroupLongTaskStatic004';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let task: taskpool.LongTask = new taskpool.LongTask(testLongTask2, "testString");
        let res: Any = await taskpool.execute(task);
        taskpool.terminateTask(task);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          expect(res as string).assertEqual(`testString`);
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1140
     * @tc.desc   Set taskRunner without priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic001';
      console.info(`${caseName} test start`);
      try {
        let finalString: string = "";
        let isTerminate1: boolean = false;
        let task: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let res: Any = await runner.execute(task);
        isTerminate1 = true;
          finalString += res;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(finalString).assertDeepEquals('a');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1150
     * @tc.desc   Set taskRunner with priority taskpool.Priority.LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic002';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'low');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.LOW);
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          console.info(`${caseName}:res: ${res}`);
          expect(res as string).assertDeepEquals('low');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1160
     * @tc.desc   Set taskRunner with priority taskpool.Priority.MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic003';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'medium');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.MEDIUM);
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          console.info(`${caseName}:res: ${res}`);
          expect(res as string).assertDeepEquals('medium');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1170
     * @tc.desc   Set taskRunner with priority taskpool.Priority.MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic004';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'high');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.MEDIUM);
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          console.info(`${caseName}:res: ${res}`);
          expect(res as string).assertDeepEquals('high');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1180
     * @tc.desc   Set taskRunner with sequenceName "runner1"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic005';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let sequenceName: string = "runner1";
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName.toString());
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          // how to acquire runner name from runner1?
          // expect(runner1.name).assertDeepEquals('runner1');
          expect(res as string).assertDeepEquals('a');
          console.info(`${caseName}: seqrunner: task done.`);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    //指定队列名  "taskname"，指定优先级taskpool.Priority.HIGH
    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1190
     * @tc.desc   testTaskpoolSequenceRunner008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic008';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let sequenceName = "testName2";
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName, taskpool.Priority.HIGH);
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(res as string).assertDeepEquals('a');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1200
     * @tc.desc   Convert number 123 to string "123" and set it as sequenceName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic009';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let sequenceName: number = 123;
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName.toString());
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(res as string).assertDeepEquals('a');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1210
     * @tc.desc   Set a named taskRunner and a unnamed taskRunner at the same time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic010';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let sequenceName: string = "namedRunner";
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
        let task2: taskpool.Task = new taskpool.Task(testSequenceRunner, 'b');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName.toString());
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(res as string).assertDeepEquals('a');
        let res2: Any = await runner2.execute(task2);
        isTerminate2 = true;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(res2 as string).assertDeepEquals('b');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1220
     * @tc.desc   Set two taskRunners with different name at the same time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic011';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let sequenceName1: string = "namedRunner1";
        let sequenceName2: string = "namedRunner2";
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
        let task2: taskpool.Task = new taskpool.Task(testSequenceRunner, 'b');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName1);
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName2);
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(res as string).assertDeepEquals('a');
        let res2: Any = await runner2.execute(task2);
        isTerminate2 = true;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(res2 as string).assertDeepEquals('b');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1230
     * @tc.desc   Set two taskRunners with same the name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic012';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let sameNamedRunner: string = "sameNamedRunner";
        let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
        let task2: taskpool.Task = new taskpool.Task(testSequenceRunner, 'b');
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(sameNamedRunner);
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner(sameNamedRunner);
        let res: Any = await runner1.execute(task1);
        isTerminate1 = true;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(res as string).assertDeepEquals('a');
        let res2: Any = await runner2.execute(task2);
        isTerminate2 = true;
          console.info(`${caseName}: seqrunner: task done.`);
          expect(res2 as string).assertDeepEquals('b');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1240
     * @tc.desc   Set taskRunner without runnerName and priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic013';
      console.info(`${caseName} test start`);
      try {
        let finalString: string = "";
        let isTerminate1: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(testRunnerNum2Str, 22.0);
        let task2: taskpool.Task = new taskpool.Task(testRunnerNum2Str, 33.0);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let res: Any = await runner.execute(task1);
        isTerminate1 = true;
          finalString += res;
          console.info(`${caseName}:res: ${res}, seqrunner: task1 done.`);
          expect(finalString).assertEqual('22');
        let res2: Any = await runner.execute(task2);
        isTerminate1 = true;
          finalString += res2;
          console.info(`${caseName}:res2: ${res2}, seqrunner: task2 done.`);
          expect(finalString).assertEqual('2233');
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1250
     * @tc.desc   Set taskRunner without taskName and but priority taskpool.Priority.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic016';
      console.info(`${caseName} test start`);
      try {
        let finalString: string = "";
        let isTerminate1: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(testRunnerStr2Str, 'aa');
        let task2: taskpool.Task = new taskpool.Task(testRunnerStr2Str, 'bb');
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
        let res: Any = await runner.execute(task1);
        isTerminate1 = true;
          finalString += res;
          console.info(`${caseName}:res: ${res}, seqrunner: task1 done.`);
          expect(finalString).assertDeepEquals('aa');
        let res2: Any = await runner.execute(task2);
        isTerminate1 = true;
          finalString += res2;
          console.info(`${caseName}:res2: ${res2}, seqrunner: task2 done.`);
          expect(finalString).assertDeepEquals('aabb');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTaskpoolSequenceRunnerStatic017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1260
     * @tc.desc   Set taskRunner Longtask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolSequenceRunnerStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolSequenceRunnerStatic017';
      console.info(`${caseName} test start`);
      try {
        let finalString: string = "";
        let isTerminate1: boolean = false;
        let task1: taskpool.Task = new taskpool.LongTask(testRunnerStr2Str, 'aa');
        let task2: taskpool.Task = new taskpool.LongTask(testRunnerStr2Str, 'bb');
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let res: Any = await runner.execute(task1);
        taskpool.terminateTask(task1);
        isTerminate1 = true;
          finalString += res;
          console.info(`${caseName}:res: ${res}, seqrunner: task1 done.`);
          expect(finalString).assertDeepEquals('aa');
        let res2: Any = await runner.execute(task2);
        taskpool.terminateTask(task2);
        isTerminate1 = true;
          finalString += res2;
          console.info(`${caseName}:res2: ${res2}, seqrunner: task2 done.`);
          expect(finalString).assertDeepEquals('aabb');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    //func:使用@Concurrent装饰器装饰,返回number类型，无参数----then中可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolExecuteStatic003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1270
     * @tc.desc   testTaskpoolExecute003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic003';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let res: Any = await taskpool.execute(funcRetNumber);
          console.info(`${caseName}: Execute003 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as number).assertEqual(0);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic003 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回string类型，参数1：number----then中可断言返回类型及返回值 传和方法不一致的入参类型--报错
    /**
     * @tc.name   testExecuteFuncStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1280
     * @tc.desc   testExecuteFunc0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteFuncStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testExecuteFuncStatic0004';
        let isTerminate1: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resN: number = 100;
          let res: Any = await taskpool.execute(funcRetString, resN);
          console.info(`${caseName}: Execute004 return value: ${JSON.stringify(res)}`);
            isTerminate1 = true;
            expect(res as string).assertEqual("This is string");
        } catch (error) {
          isTerminate1 = true;
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expect().assertFail();
        }
        while (!(isTerminate1)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testExecuteFuncStatic0004 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回boolean类型，参数1：string，参数2：boolean----then中可断言返回类型及返回值
    // 传和方法不一致的入参类型--报错
    /**
     * @tc.name   testExecuteFuncStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1290
     * @tc.desc   testExecuteFunc0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExecuteFuncStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testExecuteFuncStatic0005';
        let isTerminate: boolean = false;
        try {
          let resB: boolean = true;
          let resS: string = "hello";
          let resN: number = 100;
          let res: Any = await taskpool.execute(funcRetBool, resS, resB);
          console.info(`${caseName}: Execute005 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as boolean).assertEqual(true);
          let res2: Any = await taskpool.execute(funcRetBool, resS, resN);
          console.info(`${caseName}: Execute005 return value: ${JSON.stringify(res2)}`);
            isTerminate = true;
            expect(res2 as boolean).assertEqual(false);
        } catch (error) {
          isTerminate = true;
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
      } catch (error) {
        console.error("testExecuteFuncStatic0005 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回undefined类型，无参数----then中可断言返回类型及返回值
    // 传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1300
     * @tc.desc   testTaskpoolExecute006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic006';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let res: Any = await taskpool.execute(funcRetUndef);
          console.info(`${caseName}: Execute006 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(typeof (res) == "undefined").assertEqual(true);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic006 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回null类型，参数1：boolean----then中可断言返回类型及返回值
    // 传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1310
     * @tc.desc   testTaskpoolExecute007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic007';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resB: boolean = true;
          let res: Any = await taskpool.execute(funcRetNull, resB);
          console.info(`${caseName}: Execute007 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res == null).assertEqual(true);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic007 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回bigint类型，参数1：bigint----then中可断言返回类型及返回值
    // 传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1320
     * @tc.desc   testTaskpoolExecute008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic008';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resBg = 123n;
          let res: Any = await taskpool.execute(funcRetBigint, resBg);
          console.info(`${caseName}: Execute008 return value: ${res}`);
            isTerminate = true;
            expect(res as bigint).assertEqual(354n);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic008 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回Date类型，参数1：string，参数2：number，参数3：number----then中可断言返回类型及返回值
    // 传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1330
     * @tc.desc   testTaskpoolExecute009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic009';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resS: string = "2024-09-03";
          let resN1: number = 193625;
          let resN2: number = 2318;
          let res: Any = await taskpool.execute(funcRetDate, resS, resN1, resN2);
          console.info(`${caseName}: Execute009 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect((res as Date).toISOString()).assertEqual(new Date(resS).toISOString());
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic009 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回Array类型，参数1：Array----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1340
     * @tc.desc   testTaskpoolExecute011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic011';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resA: Array<number> = new Array<number>(1.0, 2.0, 3.0, 4.0, 5.0);
          let res: Array<number> = await taskpool.execute(funcRetArray, resA) as Array<number>;
          console.info(`${caseName}: Execute011 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res[0]).assertEqual(2.0);
            expect(res[1]).assertEqual(3.0);
            expect(res[2]).assertEqual(4.0);
            expect(res[3]).assertEqual(5.0);
            expect(res[4]).assertEqual(6.0);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic011 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回Map类型，参数1：Map，参数2：boolean----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1350
     * @tc.desc   testTaskpoolExecute012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic012';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resMap: Map<string, number> = new Map<string, number>([
            ['1', 1],
            ['2', 2],
            ['3', 3],
          ]);
          let resB: boolean = false;
          let res: Map<string, number> = await taskpool.execute(funcRetMap, resMap, resB) as Map<string, number>;
          console.info(`${caseName}: Execute012 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res.get('1')).assertEqual(2);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic012 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回Set类型，参数1：Set，参数2：boolean----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1360
     * @tc.desc   testTaskpoolExecute013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic013';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resSet: Set<number> = new Set<number>([1, 2, 3, 4, 5]);
          let resB: boolean = false;
          let res: Set<number> = await taskpool.execute(funcRetSet, resSet, resB) as Set<number>;
          console.info(`${caseName}: Execute013 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res.size).assertEqual(5);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic013 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回Object(class)类型，参数1：string，参数2：Object(class)----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1370
     * @tc.desc   testTaskpoolExecute014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic014';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resP = new Person1("mangGuoYuJiu", 25.0);
          let resS: string = 'mfWang';
          let res: Object = await taskpool.execute(funcRetClass, resS, resP) as Object;
          console.info(`${caseName}: Execute014 return value: ${resS}`);
            isTerminate = true;
            expect((res as Person1).name).assertEqual(resP.name);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic014 failed");
        expect(false).assertFail();
      }
      done();
    });


    //func:使用@Concurrent装饰器装饰,返回ArrayBuffer类型，参数1：string，参数2：ArrayBuffer----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1380
     * @tc.desc   testTaskpoolExecute015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic015';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let buffer = new ArrayBuffer(16);
          let resS: string = 'mfWang';
          let res: Any = await taskpool.execute(funcRetAB, resS, buffer);
          //console.info(`${caseName}: Execute015 return value: ${res}`);
            isTerminate = true;
            expect(new DataView(res as ArrayBuffer).getUint32(0, true)).assertEqual(0x12345678);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic015 failed");
        expect(false).assertFail();
      }
      done();
    });


    //func:使用@Concurrent装饰器装饰,返回TypedArray类型，参数1：TypedArray，参数2：boolean----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    /**
     * @tc.name   testTaskpoolExecuteStatic016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1390
     * @tc.desc   testTaskpoolExecute016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic016';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let buffer = new ArrayBuffer(10);
          let uint8 = new Uint8Array(buffer);
          uint8.set([10, 20, 30, 40, 50]);
          let resB: boolean = false;
          let res: Uint8Array = await taskpool.execute(funcRetU8, uint8, resB) as Uint8Array;
          console.info(`${caseName}: Execute016 return value: ${res[5]}`);
            isTerminate = true;
            expect(res[6]).assertEqual(100);
            expect(res[5]).assertEqual(255);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic016 failed");
        expect(false).assertFail();
      }
      done();
    });

    //task：指定任务名，func:使用@Concurrent装饰器装饰,返回Array类型，参数1：string，优先级：指定taskpool.Priority.LOW----then中
    // 可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolExecuteStatic017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1400
     * @tc.desc   testTaskpoolExecute017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic017';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetArray2, "helloXTS");
          let res: Array<number> = await taskpool.execute(task, taskpool.Priority.LOW) as Array<number>;
          console.info(`${caseName}: res[0] return value: ${res[0]}`);
            console.info(`${caseName}: res[1] return value: ${res[1]}`);
            console.info(`${caseName}: res[2] return value: ${res[2]}`);
            console.info(`${caseName}: res[3] return value: ${res[3]}`);
            console.info(`${caseName}: res[4] return value: ${res[4]}`);
            isTerminate = true;
                      expect(res[2]).assertEqual(4);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic017 failed");
        expect(false).assertFail();
      }
      done();
    });

    //task：指定任务名，func:使用@Concurrent装饰器装饰,返回Array类型，参数1：string，优先级：指定taskpool.Priority.MEDIUM----then中
    // 可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolExecuteStatic018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1410
     * @tc.desc   testTaskpoolExecute018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolExecuteStatic018';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetArray2, "helloXTS");
          let res: Array<number> = await taskpool.execute(task, taskpool.Priority.MEDIUM) as Array<number>;
          console.info(`${caseName}: res[0] return value: ${res[0]}`);
            console.info(`${caseName}: res[1] return value: ${res[1]}`);
            console.info(`${caseName}: res[2] return value: ${res[2]}`);
            console.info(`${caseName}: res[3] return value: ${res[3]}`);
            console.info(`${caseName}: res[4] return value: ${res[4]}`);
            isTerminate = true;
                      expect(res[2]).assertEqual(4);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolExecuteStatic018 failed");
        expect(false).assertFail();
      }
      done();
    });

    //taskgroup：指定任务组名，优先级：指定taskpool.Priority.LOW----结果按照添加顺序返回
    /**
     * @tc.name   testTaskpoolExecuteStatic019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1420
     * @tc.desc   testTaskpoolExecute019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolExecuteStatic019';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: object[] = [];
        let result2: object[] = [];
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(printNumber, 10.5);
        taskExecute1.addTask(printString, 'string');
        taskExecute1.addTask(printArgs, -30.6);
        let taskExecute2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(printABool, true);
        let task2: taskpool.Task = new taskpool.Task(printABig, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printABool, false);
        taskExecute2.addTask(task1);
        taskExecute2.addTask(task2);
        taskExecute2.addTask(task3);
        let res: Any = await taskpool.execute(taskExecute1, taskpool.Priority.LOW);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as object[];
          expect(result1).assertDeepEquals([10.5, 'string', -30.6]);
        let res2: object[] = await taskpool.execute(taskExecute2, taskpool.Priority.LOW) as object[];
        console.info(`${caseName}: execute res2 is: ${res2}`);
          isTerminate2 = true;
          result2 = res2 as object[];
          expect(result2).assertDeepEquals([true, 200.0, false]);
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
        let result: object[] = result1.concat(result2);
        expect(result).assertDeepEquals([10.5, 'string', -30.6, true, 200.0, false]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    //指定任务组名，优先级：指定taskpool.Priority.MEDIUM----结果按照添加顺序返回
    /**
     * @tc.name   testTaskpoolExecuteStatic020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1430
     * @tc.desc   testTaskpoolExecute020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolExecuteStatic020';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: object[] = [];
        let result2: object[] = [];
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(printNumber, 10.5);
        taskExecute1.addTask(printString, 'string');
        taskExecute1.addTask(printArgs, -30.6);
        let taskExecute2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(printABool, true);
        let task2: taskpool.Task = new taskpool.Task(printABig, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printABool, false);
        taskExecute2.addTask(task1);
        taskExecute2.addTask(task2);
        taskExecute2.addTask(task3);
        let res: Any = await taskpool.execute(taskExecute1, taskpool.Priority.MEDIUM);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as object[];
          expect(result1).assertDeepEquals([10.5, 'string', -30.6]);
        let res2: object[] = await taskpool.execute(taskExecute2, taskpool.Priority.MEDIUM) as object[];
        console.info(`${caseName}: execute res2 is: ${res2}`);
          isTerminate2 = true;
          result2 = res2 as object[];
          expect(result2).assertDeepEquals([true, 200.0, false]);
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
        let result: object[] = result1.concat(result2);
        expect(result).assertDeepEquals([10.5, 'string', -30.6, true, 200.0, false]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    //taskgroup：不指定任务组名，优先级：指定taskpool.Priority.HIGH----结果按照添加顺序返回
    /**
     * @tc.name   testTaskpoolExecuteStatic021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1440
     * @tc.desc   testTaskpoolExecute021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolExecuteStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskpoolExecuteStatic021';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: object[] = [];
        let result2: object[] = [];
        let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskExecute1.addTask(printNumber, 10.5);
        taskExecute1.addTask(printString, 'string');
        taskExecute1.addTask(printArgs, -30.6);
        let taskExecute2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(printABool, true);
        let task2: taskpool.Task = new taskpool.Task(printABig, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printABool, false);
        taskExecute2.addTask(task1);
        taskExecute2.addTask(task2);
        taskExecute2.addTask(task3);
        let res: Any = await taskpool.execute(taskExecute1, taskpool.Priority.HIGH);
        console.info(`${caseName}: execute res is: ${res}`);
          isTerminate1 = true;
          result1 = res as object[];
          expect(result1).assertDeepEquals([10.5, 'string', -30.6]);
        let res2: object[] = await taskpool.execute(taskExecute2, taskpool.Priority.HIGH) as object[];
        console.info(`${caseName}: execute res2 is: ${res2}`);
          isTerminate2 = true;
          result2 = res2 as object[];
          expect(result2).assertDeepEquals([true, 200.0, false]);
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
        let result: object[] = result1.concat(result2);
        expect(result).assertDeepEquals([10.5, 'string', -30.6, true, 200.0, false]);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    //func:使用@Concurrent装饰器装饰,返回number类型，无参数----then中可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolTaskStatic002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1450
     * @tc.desc   testTaskpoolTask002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolTaskStatic002';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(taskTest001);
          let res: Any = await taskpool.execute(task);
          console.info(`${caseName}: testTaskpoolTask002 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as number).assertEqual(0);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolTaskStatic002 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskpoolTaskStatic003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1460
     * @tc.desc   testTaskpoolTask003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolTaskStatic003';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetString, 20.0);
          let res: Any = await taskpool.execute(task);
          console.info(`${caseName}: testTaskpoolTask003 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as string).assertEqual("This is string");
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolTaskStatic003 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回boolean类型，参数1：string，参数2：boolean----then中可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolTaskStatic004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1470
     * @tc.desc   testTaskpoolTask004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolTaskStatic004';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resS: string = "This is string";
          let resB: boolean = false;
          let task: taskpool.Task = new taskpool.Task(funcRetBool, resS, resB);
          let res: Any = await taskpool.execute(task);
          console.info(`${caseName}: testTaskpoolTask004 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as boolean).assertEqual(true);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolTaskStatic004 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回undefined类型，无参数----then中可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolTaskStatic005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1480
     * @tc.desc   testTaskpoolTask005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolTaskStatic005';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetUndef);
          let res: Any = await taskpool.execute(task);
          console.info(`${caseName}: testTaskpoolTask005 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(typeof (res) == "undefined").assertEqual(true);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolTaskStatic005 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTaskpoolTaskStatic006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1490
     * @tc.desc   testTaskpoolTask006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolTaskStatic006';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetNull);
          let res: Any = await taskpool.execute(task);
          console.info(`${caseName}: testTaskpoolTask006 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res == null).assertEqual(true);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolTaskStatic006 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回bigint类型，参数1：bigint----then中可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolTaskStatic007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1500
     * @tc.desc   testTaskpoolTask007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolTaskStatic007';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resBg = 123n;
          let task: taskpool.Task = new taskpool.Task(funcRetBigint, resBg);
          let res: Any = await taskpool.execute(task);
          console.info(`${caseName}: testTaskpoolTask007 return value: ${res}`);
            isTerminate = true;
            expect(res as bigint).assertEqual(354n);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolTaskStatic007 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回Date类型，参数1：string，参数2：number，参数3：number----then中可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolTaskStatic008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1510
     * @tc.desc   testTaskpoolTask008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolTaskStatic008';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resS: string = "2024-09-03";
          let resN1: number = 193625;
          let resN2: number = 2318;
          let task: taskpool.Task = new taskpool.Task(funcRetDate, resS, resN1, resN2);
          let res: Any = await taskpool.execute(task);
          console.info(`${caseName}: testTaskpoolTask008 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect((res as Date).toISOString()).assertEqual(new Date(resS).toISOString());
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          isTerminate = true;
          expect().assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        console.info(`${caseName} test end`);
      } catch (error) {
        console.error("testTaskpoolTaskStatic008 failed");
        expect(false).assertFail();
      }
      done();
    });

    //func:使用@Concurrent装饰器装饰,返回Array类型，参数1：Array----then中可断言返回类型及返回值
    /**
     * @tc.name   testTaskpoolTaskStatic010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_TASKPOOLSTATIC_1520
     * @tc.desc   testTaskpoolTask010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskpoolTaskStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testTaskpoolTaskStatic010';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resA: Array<number> = new Array<number>(1.0, 2.0, 3.0, 4.0, 5.0);
          let task: taskpool.Task = new taskpool.Task(funcRetArray, resA);
          let res: Array<number> = await taskpool.execute(task) as Array<number>;
          console.info(`${caseName}: testTaskpoolTask010 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
