/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { afterEach, describe, expect, it, Level, Size, TestType, xit } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { delay, getTaskStateByTaskName } from './utils/taskPoolCommon';
import { additionDelay, inspectStatus, periodicTask, testFailed, wait1s, waitForRunner, } from './utils/taskPoolTask';

import {
  addTaskTask1,
  changeN2T,
  changeT,
  Concurrent,
  concurrentF,
  ConstructorTest1,
  ConstructorTest2,
  ConstructorTest3,
  funArray,
  funcRetAB,
  funcRetArray,
  funcRetArray2,
  funcRetBigint,
  funcRetBool,
  funcRetClass,
  funcRetDate,
  funcRetMap,
  funcRetNull,
  funcRetNumber,
  funcRetSet,
  funcRetString,
  funcRetU8,
  funcRetUndef,
  funcRUndef,
  funDate,
  mathMore,
  mathPow,
  mathSqrt,
  noConcurrent,
  Person as Person1,
  printABig,
  printABool,
  printNumber,
  printString,
  spileString,
  stringToNumber,
  taskTest001,
  testFunc,
  testLongTask1,
  testLongTask2,
  testRunnerNum2Str,
  testRunnerStr2Str,
  testSequenceRunner,
  testTransfer
} from './utils/taskPool';

import {
  executeDelayed,
  executeLongTask,
  executePeriodically,
  executeSequenceRunner,
  executeTask,
  executeTaskGroup
} from './utils/taskPoolCombineScenes';

import {
  CustomizeClass,
  SendableClass,
  SendableFunc,
  shareTypeTask0001,
  shareTypeTask0002,
  shareTypeTask0003,
  shareTypeTask0004,
  shareTypeTask0006,
  shareTypeTask0008,
  shareTypeTask0011,
  shareTypeTask0013,
  shareTypeTask0016,
  shareTypeTask0017,
  shareTypeTaskFun,
  unionType,
} from './utils/taskPoolExecuteCommon';

declare class ArkTools {
  static forceFullGC(): void;
}

type NullishTuple1 = [Number, String, Number];
type NullishTuple2 = [Boolean, Number, Boolean];
type MergeTuple = [Number, String, Number, Boolean, Number, Boolean];

async function promiseCase(): Promise<int> {
  let p: Promise<int> = new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(1);
    }, 100);
  });
  return p;
}

function addTaskTaskArray(args: string): Array<Number> {

  let array = new Array<Number>(1, 2, 3, 4);
  return array;
}

function testLongTaskArray(args: string): Array<Number> {

  let array = new Array<Number>(2, 3, 4, 5);
  return array;
}

function executeTask0001(args: Number): String {
  return args.toString();
}

function executeTask0002(args: String): Array<String> {
  return new Array<String>(args);
}

function executeTask0003(args: string): Array<String> {
  return new Array<String>(args);
}

function executeTask0004(args: String): String {
  return args;
}

function terminateTask0001(arg: Number): Number {
  let t: Number = Date.now();
  while (Date.now() - t < arg) {
    console.info("longTask time :" + (Date.now() - t));
    continue;
  }
  console.info("longTask has been executed.");
  return arg;
}

function isConcurrent0001(args: Number): String {
  return args.toString();
}

function isConcurrent0002(args: string): string[] {
  return new Array<string>(args);
}

function sendDataTest0001(num: Number): Number {
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

function sendDataTest0016(arg: Function): Function {
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

export default function TaskPoolBaseTest() {
  describe('TaskPoolBaseTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(50);
    })
    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_0100
     * @tc.name      : testExecuteTask0001
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTask0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTask0001';
        console.info(`${caseName} test start`);
        try {
          await taskpool.execute(executeTask0001, 100.0).then((a: NullishType) => {
            expect(a as string).assertEqual('100');
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_0200
     * @tc.name      : testExecuteTask0002
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTask0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTask0002';
        console.info(`${caseName} test start`);
        try {
          await taskpool.execute(executeTask0002, '200', taskpool.Priority.LOW).then((a: NullishType) => {
            let data = a as Array<String>;
            expect(data[0]).assertEqual('200');
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_0300
     * @tc.name      : testExecuteTask0003
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTask0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTask0003';
        console.info(`${caseName} test start`);
        try {
          await taskpool.execute(executeTask0003, '300', taskpool.Priority.MEDIUM).then((a: NullishType) => {
            let data = a as Array<string>;
            expect(data[0]).assertEqual('300');
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_0400
     * @tc.name      : testExecuteTask0004
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTask0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTask0004';
        console.info(`${caseName} test start`);
        try {
          await taskpool.execute(executeTask0004, '400', taskpool.Priority.HIGH).then((a: NullishType) => {
            expect(a as string).assertEqual('400');
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TERMINATE_TASK_0100
     * @tc.name      : testTerminateTask0001
     * @tc.desc      : Testing the task->terminateTask with create func, assert the size of the task pool array.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTerminateTask0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTerminateTask0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.LongTask = new taskpool.LongTask(terminateTask0001, 1000)
          taskpool.execute(task).then((res: NullishType) => {
            taskpool.terminateTask(task);
            console.info("taskpool longTask result: " + res);
          });
          await delay(1500 as int);
          expect(String(taskpool.getTaskPoolInfo().taskInfos.length)).assertEqual('0');
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0100
     * @tc.name      : testSendData0001
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0001, 100.0);
          task.onReceiveData((data: Number): NullishType => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(100);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0200
     * @tc.name      : testSendData0002
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0002';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0002, 'hello');
          task.onReceiveData((data: string) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual('hello');
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0300
     * @tc.name      : testSendData0003
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0003';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0003, false);
          task.onReceiveData((data: boolean) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(false);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0400
     * @tc.name      : testSendData0004
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0004';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0004);
          task.onReceiveData((data: undefined) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(undefined);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0500
     * @tc.name      : testSendData0005
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0005';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0005);
          task.onReceiveData((data: null) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(null);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0600
     * @tc.name      : testSendData0006
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0006';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0006, 123456789012345678901234567890n);
          task.onReceiveData((data: object) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(123456789012345678901234567890n);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0700
     * @tc.name      : testSendData0007
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0007';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0007, new Date(1695936000000));
          task.onReceiveData((data: Date) => {
            console.info(`${caseName} onReceiveData res : ` + data.getTime());
            expect(data.getTime()).assertEqual(1695936000000);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0800
     * @tc.name      : testSendData0008
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0008';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0008, 'HELLO');
          task.onReceiveData((data: String) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual('HELLO');
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_0900
     * @tc.name      : testSendData0009
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0009';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0009, new RegExp('hello', 'i'));
          task.onReceiveData((data: RegExp) => {
            console.info(`${caseName} onReceiveData res : ` + data.source);
            console.info(`${caseName} onReceiveData res : ` + data.flags);
            expect(data.source).assertEqual('hello');
            expect(data.flags).assertEqual('i');
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_1000
     * @tc.name      : testSendData0010
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0010';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0010, [0, 1]);
          task.onReceiveData((data: Array<number>) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data.length).assertEqual(2);
            expect(data[0]).assertEqual(0);
            expect(data[1]).assertEqual(1);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_1100
     * @tc.name      : testSendData0011
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0011';
        console.info(`${caseName} test start`);
        try {
          let map = new Map<string, string>()
          map.set('hi', 'we')
          map.set('hello', 'me')
          let task: taskpool.Task = new taskpool.Task(sendDataTest0011, map);
          task.onReceiveData((data: Map<string, string>) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data.size).assertEqual(2);
            expect(data.get('hi')).assertEqual('we');
            expect(data.get('hello')).assertEqual('me');
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_1200
     * @tc.name      : testSendData0012
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0012';
        console.info(`${caseName} test start`);
        try {
          let set = new Set<number>()
          set.add(100)
          let task: taskpool.Task = new taskpool.Task(sendDataTest0012, set);
          task.onReceiveData((data: Set<number>) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data.size).assertEqual(1);
            data.forEach((value) => {
              expect(value).assertEqual(100);
            })
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_1300
     * @tc.name      : testSendData0013
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0013';
        console.info(`${caseName} test start`);
        try {
          const objectData: Person = {
            name: "Alice",
            age: 25,
          };
          let task: taskpool.Task = new taskpool.Task(sendDataTest0013, objectData);
          task.onReceiveData((data: Person) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data.name).assertEqual("Alice");
            expect(data.age).assertEqual(25);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_1400
     * @tc.name      : testSendData0014
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0014';
        console.info(`${caseName} test start`);
        try {
          const buffer = new ArrayBuffer(8);
          const uint8View = new Uint8Array(buffer);
          uint8View[0] = 255;
          uint8View[1] = 128;
          let task: taskpool.Task = new taskpool.Task(sendDataTest0014, buffer);
          task.onReceiveData((data: ArrayBuffer) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            const uint8View = new Uint8Array(data);
            expect(uint8View[0]).assertEqual(255);
            expect(uint8View[1]).assertEqual(128);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_1500
     * @tc.name      : testSendData0015
     * @tc.desc      : Testing the task->sendData with create func, assert task sendData value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0015';
        console.info(`${caseName} test start`);
        try {
          const typedArray = new Uint8Array([1, 2, 3, 4]);
          let task: taskpool.Task = new taskpool.Task(sendDataTest0015, typedArray);
          task.onReceiveData((data: Uint8Array) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data[0]).assertEqual(1);
            expect(data[1]).assertEqual(2);
            expect(data[2]).assertEqual(3);
            expect(data[3]).assertEqual(4);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_1600
     * @tc.name      : testSendData0016
     * @tc.desc      : Testing the task->sendData with create func, assert catch.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0016';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0016, () => {
            return 'hi'
          });
          task.onReceiveData((data: Any) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            // expect((data as Function)?.unsafeCall()).assertEqual('hi');
            expect(false).assertFail();
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_SEND_DATA_1700
     * @tc.name      : testSendData0017
     * @tc.desc      : Testing the task->sendData with create func, assert catch.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSendData0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testSendData0017';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(sendDataTest0017, true);
          await taskpool.execute(task);
          await delay(1000);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          // expect(error.message).assertEqual('BusinessError: The callback is not registered on the host side');
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_ON_RECEIVE_DATA_0100
     * @tc.name      : testOnReceiveData0001
     * @tc.desc      : Testing the task->sendData with create func, assert return value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOnReceiveData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testOnReceiveData0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(onReceiveData0001, true);
          task.onReceiveData((data: boolean) => {
            console.info(`${caseName} onReceiveData res : ` + data);
            expect(data).assertEqual(true);
          });
          await taskpool.execute(task);
          await delay(1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ADD_DEPENDENCY_0100
     * @tc.name      : testTaskAddDependency0001
     * @tc.desc      : Testing the task->addDependency with create tasks 1, 2, 3, none executed,
     *                 add 1 dependency 2, 2 dependency 3.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskAddDependency0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskAddDependency0001';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 100);
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          console.info("dependency: add dependency start");
          task1.addDependency(task2);
          task2.addDependency(task3);
          console.info("dependency: add dependency end");
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ADD_DEPENDENCY_0200
     * @tc.name      : testTaskAddDependency0002
     * @tc.desc      : Testing the task->addDependency with create tasks 1, 2, 3, none executed,
     *                 add 1 dependency 2, 2 dependency 3, 3 dependency 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskAddDependency0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskAddDependency0002';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 100);
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          console.info("dependency: add dependency start");
          task1.addDependency(task2);
          task2.addDependency(task3);
          task3.addDependency(task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ADD_DEPENDENCY_0300
     * @tc.name      : testTaskAddDependency0003
     * @tc.desc      : Testing the task->addDependency with create tasks 1, 2, 3, 1 to execute,
     *                 add 1 dependency 2, 2 dependencies 3.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskAddDependency0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskAddDependency0003';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 100);
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          taskpool.execute(task1).then((value: NullishType) => {
            console.info("dependency: second task1 success");
          })
          console.info("dependency: add dependency start");
          task1.addDependency(task2);
          task2.addDependency(task3);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ADD_DEPENDENCY_0400
     * @tc.name      : testTaskAddDependency0004
     * @tc.desc      : Testing the task->addDependency with Create tasks 1, 2, 3, 1 to execute, add 2 dependencies 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskAddDependency0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskAddDependency0004';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 100);
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          taskpool.execute(task1).then((value: NullishType) => {
            console.info("dependency: second task1 success");
          });
          console.info("dependency: add dependency start");
          task2.addDependency(task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ADD_DEPENDENCY_0500
     * @tc.name      : testTaskAddDependency0005
     * @tc.desc      : Testing the task->addDependency with Create tasks 1, 2, 3, and 1 as long tasks,
     *                 add 2 dependencies 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskAddDependency0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskAddDependency0005';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 1000);
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          taskpool.execute(task1).then((value: NullishType) => {
            console.info("dependency: second task1 success");
          });
          console.info("dependency: add dependency start");
          task2.addDependency(task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ADD_DEPENDENCY_0600
     * @tc.name      : testTaskAddDependency0006
     * @tc.desc      : Testing the task->addDependency with Create tasks 1, 2, 3, 1 in taskGroup,
     *                 add 2 dependencies 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskAddDependency0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskAddDependency0006';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 200);
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(task1);
          taskpool.execute(taskGroup).then((value: NullishType) => {
            console.info("dependency: taskGroup with task1 success");
          });
          ;
          console.info("dependency: add dependency start");
          task2.addDependency(task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ADD_DEPENDENCY_0700
     * @tc.name      : testTaskAddDependency0007
     * @tc.desc      : Testing the task->addDependency with Create tasks 1, 2, 3, 1 in SequenceRunner,
     *                 add 2 dependencies 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskAddDependency0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskAddDependency0007';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 200);
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          sequenceRunner.execute(task1);
          console.info("dependency: add dependency start");
          task2.addDependency(task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ADD_DEPENDENCY_0800
     * @tc.name      : testTaskAddDependency0008
     * @tc.desc      : Testing the task->addDependency with Create tasks 1, 2, 3, 1 is a periodic task,
     *                 add 2 dependencies 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskAddDependency0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskAddDependency0008';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(() => periodicTask(200 as int, 3 as int));
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          taskpool.execute(task1).then((value: NullishType) => {
            console.info("dependency: periodic task1 success");
          });
          console.info("dependency: add dependency start");
          task2.addDependency(task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_REMOVE_DEPENDENCY_0100
     * @tc.name      : testTaskRemoveDependency0001
     * @tc.desc      : Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     *                 add 1 dependency 2, 2 dependency 3, remove 1 dependency 2.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskRemoveDependency0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskRemoveDependency0001';
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
          console.info("dependency: start execute second");
          taskpool.execute(task1).then((value: NullishType) => {
            console.info("dependency: second task1 success");
          });
          taskpool.execute(task2).then((value: NullishType) => {
            console.info("dependency: second task2 success");
          });
          taskpool.execute(task3).then((value: NullishType) => {
            console.info("dependency: second task3 success");
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_REMOVE_DEPENDENCY_0200
     * @tc.name      : testTaskRemoveDependency0002
     * @tc.desc      : Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     *                 add 1 dependency 2, 2 dependency 3, remove 2 dependency 3.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskRemoveDependency0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskRemoveDependency0002';
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
          console.info("dependency: start execute second");
          taskpool.execute(task1).then((value: NullishType) => {
            console.info("dependency: second task1 success");
          });
          taskpool.execute(task2).then((value: NullishType) => {
            console.info("dependency: second task2 success");
          });
          taskpool.execute(task3).then((value: NullishType) => {
            console.info("dependency: second task3 success");
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_REMOVE_DEPENDENCY_0300
     * @tc.name      : testTaskRemoveDependency0003
     * @tc.desc      : Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     *                 add 1 dependency 2, 2 dependency 3, remove 1 dependency 3.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskRemoveDependency0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskRemoveDependency0003';
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
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_REMOVE_DEPENDENCY_0400
     * @tc.name      : testTaskRemoveDependency0004
     * @tc.desc      : Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     *                 add 1 dependency 2, 2 dependency 3, remove 3 dependency 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskRemoveDependency0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskRemoveDependency0004';
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
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_REMOVE_DEPENDENCY_0500
     * @tc.name      : testTaskRemoveDependency0005
     * @tc.desc      : Testing the task->removeDependency with create tasks 1, 2, 3, none executed,
     *                 remove 3 dependency 1.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskRemoveDependency0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskRemoveDependency0005';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 100);
          let task2: taskpool.Task = new taskpool.Task(delay, 200);
          let task3: taskpool.Task = new taskpool.Task(delay, 200);
          console.info("dependency: remove dependency start");
          task3.removeDependency(task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ON_ENQUEUED_0100
     * @tc.name      : testTaskOnEnqueued0001
     * @tc.desc      : Testing the task->onEnqueued with register before task execution.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskOnEnqueued0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskOnEnqueued0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1);
          let callbackCalled = false;
          task.onEnqueued(() => {
            console.info("taskPool: onEnqueued");
            callbackCalled = true;
          });
          await taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
            console.info(`callbackCalled = ${callbackCalled}`);
            expect(callbackCalled).assertTrue();
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ON_ENQUEUED_0200
     * @tc.name      : testTaskOnEnqueued0002
     * @tc.desc      : Testing the task->onEnqueued with register after task execution.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskOnEnqueued0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskOnEnqueued0002';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1);
          let callbackCalled = false;
          await taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
            console.info(`callbackCalled = ${callbackCalled}`);
            expect(callbackCalled).assertFalse();
          });
          task.onEnqueued(() => {
            console.info("taskPool: onEnqueued");
            callbackCalled = true;
          });
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ON_START_EXECUTION_0100
     * @tc.name      : testTaskOnStartExecution0001
     * @tc.desc      : Testing the task->onStartExecution with register before task execution.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskOnStartExecution0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskOnStartExecution0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1);
          let callbackCalled = false;
          task.onStartExecution(() => {
            console.info("taskPool: onStartExecution");
            callbackCalled = true;
          });
          await taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
            console.info(`callbackCalled = ${callbackCalled}`);
          });
          await delay(100);
          expect(callbackCalled).assertTrue();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ON_START_EXECUTION_0200
     * @tc.name      : testTaskOnStartExecution0002
     * @tc.desc      : Testing the task->onStartExecution with register after task execution.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskOnStartExecution0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskOnStartExecution0002';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1);
          let onStartExecutionCallbackCalled = false;
          await taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
            expect(onStartExecutionCallbackCalled).assertFalse();
          });
          task.onStartExecution(() => {
            console.info("taskPool: onStartExecution");
            onStartExecutionCallbackCalled = true;
          });
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ON_EXECUTION_FAILED_0100
     * @tc.name      : testTaskOnExecutionFailed0001
     * @tc.desc      : Testing the task->onExecutionFailed with error handling.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskOnExecutionFailed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskOnExecutionFailed0001';
        console.info(`${caseName} test start`);
        try {
          let task = new taskpool.Task(testFailed, 1 as int);
          task.onExecutionFailed((error) => {
            console.info("taskPool: onExecutionFailed error is " + error);
            expect(error.message).assertEqual("This is a deliberate failure for testing purposes");
          });
          taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ON_EXECUTION_FAILED_0200
     * @tc.name      : testTaskOnExecutionFailed0002
     * @tc.desc      : Testing the task->onExecutionFailed with error handling after task execution.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskOnExecutionFailed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskOnExecutionFailed0002';
        console.info(`${caseName} test start`);
        try {
          let task = new taskpool.Task(testFailed, 1);
          taskpool.execute(task)
          task.onExecutionFailed((error) => {
            console.info("taskPool: onExecutionFailed error is " + error);
          });
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ON_EXECUTION_SUCCEEDED_0100
     * @tc.name      : testTaskOnExecutionSucceeded0001
     * @tc.desc      : Testing whether onExecutionSucceeded was called when the task was executed successfully.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskOnExecutionSucceeded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskOnExecutionSucceeded0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1);
          let callbackCalled = false;
          task.onExecutionSucceeded(() => {
            console.info("11taskPool: onExecutionSucceeded");
            callbackCalled = true;
            console.info(`Succeeded callbackCalled = ${callbackCalled}`);
          });
          await taskpool.execute(task).then((value: NullishType) => {
            console.info(caseName, "taskPool: execute task success");
            console.info(`callbackCalled = ${callbackCalled}`);
          });
          await delay(100);
          expect(callbackCalled).assertTrue();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_ON_EXECUTION_SUCCEEDED_0200
     * @tc.name      : testTaskOnExecutionSucceeded0002
     * @tc.desc      : Testing the task->onExecutionSucceeded with error handling.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskOnExecutionSucceeded0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskOnExecutionSucceeded0002';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1);
          taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
          });
          task.onExecutionSucceeded(() => {
          });
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_IS_DONE_0100
     * @tc.name      : testTaskIsDone0001
     * @tc.desc      : Testing the task->isDone with task is not added.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskIsDone0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskIsDone0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1);
          expect(task.isDone()).assertFalse();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_IS_DONE_0200
     * @tc.name      : testTaskIsDone0002
     * @tc.desc      : Testing the task->isDone with task is not executed.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskIsDone0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskIsDone0002';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 1);
          let task2: taskpool.Task = new taskpool.Task(delay, 1);
          taskpool.execute(task2).then((value: NullishType) => {
            console.info("taskPool: execute task success");
          });
          expect(task1.isDone()).assertFalse();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_IS_DONE_0300
     * @tc.name      : testTaskIsDone0003
     * @tc.desc      : Testing the task->isDone with task is executing.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskIsDone0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskIsDone0003';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1000000);
          taskpool.execute(task).then((value: NullishType) => {
            expect(task.isDone()).assertFalse();
            console.info("taskPool: execute task success");
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_IS_DONE_0400
     * @tc.name      : testTaskIsDone0004
     * @tc.desc      : Testing the task->isDone with task is executed.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskIsDone0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskIsDone0004';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1);
          await taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
            expect(task.isDone()).assertTrue();
          });
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_IS_DONE_0500
     * @tc.name      : testTaskIsDone0005
     * @tc.desc      : Testing the task->isDone with task is canceled when executing.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskIsDone0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskIsDone0005';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 1000000);
          taskpool.execute(task).then((value: NullishType): void => {
            taskpool.cancel(task);
            console.info("taskPool: execute task success");
          });
          expect(task.isDone()).assertFalse();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_PRIORITY_0100
     * @tc.name      : testTaskPriority0001
     * @tc.desc      : Testing is the task->Priority setting effective.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskPriority0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskPriority0001';
        console.info(`${caseName} test start`);
        try {
          let allCount = 100;
          let taskArray: Array<taskpool.Task> = new Array<taskpool.Task>();
          for (let i: number = 0; i < allCount; i++) {
            let task1: taskpool.Task = new taskpool.Task(delay, i);
            taskArray.push(task1);
            let task2: taskpool.Task = new taskpool.Task(delay, i * 10);
            taskArray.push(task2);
            let task3: taskpool.Task = new taskpool.Task(delay, i * 100);
            taskArray.push(task3);
            let task4: taskpool.Task = new taskpool.Task(delay, i * 1000);
            taskArray.push(task4);
          }
          for (let i: number = 0; i < taskArray.length; i += 4) {
            taskpool.execute(taskArray[i], taskpool.Priority.HIGH);
            taskpool.execute(taskArray[i + 1], taskpool.Priority.LOW);
            taskpool.execute(taskArray[i + 2], taskpool.Priority.MEDIUM);
            taskpool.execute(taskArray[i + 3], taskpool.Priority.IDLE);
          }
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0100
     * @tc.name      : testCancelTask0001
     * @tc.desc      : Testing cancel(task) when task is canceled directly without added to execute.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTask0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 10);
          taskpool.cancel(task);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0200
     * @tc.name      : testCancelTask0002
     * @tc.desc      : Testing cancel(task) when task is canceled without run.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTask0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0002';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 10);
          let task2: taskpool.Task = new taskpool.Task(delay, 10);
          taskpool.execute(task2).then((value: NullishType) => {
            console.info("taskPool: execute task success");
          });
          taskpool.cancel(task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0300
     * @tc.name      : testCancelTask0003
     * @tc.desc      : Testing cancel(task) when task is executing.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //todo taskpool.Task.isCanceled() 始终为false
    it('testCancelTask0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0003';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 100);
          taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
            taskpool.cancel(task);
          });
          await delay(100);
          // expect(taskpool.Task.isCanceled()).assertEqual(true);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0400
     * @tc.name      : testCancelTask0004
     * @tc.desc      : Testing cancel(task) when task is executing.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTask0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0004';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(inspectStatus, 100);
          let task2: taskpool.Task = new taskpool.Task(inspectStatus, 200);
          let task3: taskpool.Task = new taskpool.Task(inspectStatus, 300);
          let task4: taskpool.Task = new taskpool.Task(inspectStatus, 400);
          let task5: taskpool.Task = new taskpool.Task(inspectStatus, 500);
          let task6: taskpool.Task = new taskpool.Task(inspectStatus, 600);
          taskpool.executeDelayed(0, task1).then((res: NullishType) => {
            console.info("taskpool test result: " + res);
          });
          taskpool.execute(task2);
          taskpool.execute(task3);
          taskpool.execute(task4);
          taskpool.execute(task5);
          taskpool.execute(task6);
          setTimeout(() => {
            try {
              taskpool.cancel(task1);
            } catch (e: BusinessError) {
              console.error(`taskpool: cancel error code: ${e.code}, info: ${e.message}`);
            }
          }, 1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0500
     * @tc.name      : testCancelTask0005
     * @tc.desc      : Testing cancel(task) when task is executing.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTask0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0005';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(inspectStatus, 100);
          let task2: taskpool.Task = new taskpool.Task(inspectStatus, 200);
          taskpool.executePeriodically(10, task1);
          taskpool.execute(task2);
          setTimeout(() => {
            try {
              taskpool.cancel(task1);
            } catch (e: BusinessError) {
              console.error(`taskpool: cancel error code: ${e.code}, info: ${e.message}`);
            }
          }, 1000);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0600
     * @tc.name      : testCancelTask0006
     * @tc.desc      : Testing cancel(task) when task is executed.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTask0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0006';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 100);
          await taskpool.execute(task).then((value: NullishType) => {
            console.info("taskPool: execute task success");
          });
          await delay(100);
          taskpool.cancel(task);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0700
     * @tc.name      : testCancelTask0007
     * @tc.desc      : Testing cancel(task) when task is non-existent.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTask0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0007';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(inspectStatus, 100);
          taskpool.cancel(task);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0800
     * @tc.name      : testCancelTask0008
     * @tc.desc      : Testing cancel(task) when task is cancellation for SequenceRunner.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTask0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0008';
        console.info(`${caseName} test start`);
        try {
          let finalString: string = "";
          let task1: taskpool.Task = new taskpool.Task(additionDelay, 300 as int);
          let task2: taskpool.Task = new taskpool.Task(additionDelay, 200 as int);
          let task3: taskpool.Task = new taskpool.Task(additionDelay, 100 as int);
          let task4: taskpool.Task = new taskpool.Task(waitForRunner, finalString);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task1).then((value: NullishType) => {
            finalString += 'a';
            console.info("seqrunner: task1 done.");
          });
          runner.execute(task2).then((value: NullishType) => {
            finalString += 'b';
            console.info("seqrunner: task2 done");
          });
          taskpool.cancel(task2);
          runner.execute(task3).then((value: NullishType) => {
            finalString += 'c';
            console.info("seqrunner: task3 done");
          });
          await runner.execute(task4);
          console.info("seqrunner: task4 done, finalString is " + finalString)
          expect(finalString).assertEqual("ac")
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_0900
     * @tc.name      : testCancelTask0009
     * @tc.desc      : Testing cancel(task) when tasks have a dependency relationship.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTask0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTask0009';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(delay, 10);
          let task2: taskpool.Task = new taskpool.Task(delay, 20);
          let task3: taskpool.Task = new taskpool.Task(delay, 20);
          console.info("dependency: add dependency start");
          task1.addDependency(task2);
          task3.addDependency(task1);
          console.info("dependency: add dependency end");
          let tag = false;
          taskpool.execute(task3).then((value: NullishType) => {
            console.info("taskPool: execute task success")
            tag = true;
          });
          taskpool.execute(task1).then((value: NullishType) => {
            console.info("taskPool: execute task success");
            tag = true;
          });
          await taskpool.execute(task2).then((value: NullishType) => {
            console.info("taskPool: execute task success");
            taskpool.cancel(task1);
          });
          await delay(100);
          expect(tag).assertFalse();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_CANCEL_TASK_GROUP_0100
     * @tc.name      : testCancelTaskGroup0001
     * @tc.desc      : Testing cancel(taskGroup) when task is canceled directly without added to task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCancelTaskGroup0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testCancelTaskGroup0001';
        console.info(`${caseName} test start`);
        try {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskpool.cancel(taskGroup);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_COMBINE_SCENES_0700
     * @tc.name      : testTaskCombineScenes0007
     * @tc.desc      : 执行组合，Task 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskCombineScenes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskCombineScenes0007';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
          let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
          let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
          let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
          let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
          let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
          taskpool.execute(task1);
          taskpool.execute(task2);
          taskpool.execute(task3);
          taskpool.execute(task4);
          taskpool.execute(task5);
          taskpool.execute(task6);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_COMBINE_SCENES_0800
     * @tc.name      : testTaskCombineScenes0008
     * @tc.desc      : 执行组合，TaskGroup 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskCombineScenes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskCombineScenes0008';
        console.info(`${caseName} test start`);
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
          taskpool.execute(taskGroup);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_COMBINE_SCENES_0900
     * @tc.name      : testTaskCombineScenes0009
     * @tc.desc      : 执行组合，延时 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskCombineScenes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskCombineScenes0009';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
          let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
          let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
          let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
          let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
          let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
          taskpool.executeDelayed(100, task1);
          taskpool.executeDelayed(100, task2);
          taskpool.executeDelayed(100, task3);
          taskpool.executeDelayed(100, task4);
          taskpool.executeDelayed(100, task5);
          taskpool.executeDelayed(100, task6);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_COMBINE_SCENES_1000
     * @tc.name      : testTaskCombineScenes0010
     * @tc.desc      : 执行组合，周期 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskCombineScenes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskCombineScenes0010';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
          let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
          let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
          let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
          let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
          let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
          taskpool.executePeriodically(1000, task1);
          taskpool.executePeriodically(1000, task2);
          taskpool.executePeriodically(1000, task3);
          taskpool.executePeriodically(1000, task4);
          taskpool.executePeriodically(1000, task5);
          taskpool.executePeriodically(1000, task6);
          setTimeout(() => {
            taskpool.cancel(task1)
            taskpool.cancel(task2)
            taskpool.cancel(task3)
            taskpool.cancel(task4)
            taskpool.cancel(task5)
            taskpool.cancel(task6)
          }, 2000)
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_COMBINE_SCENES_1100
     * @tc.name      : testTaskCombineScenes0011
     * @tc.desc      : 执行组合，串行 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskCombineScenes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskCombineScenes0011';
        console.info(`${caseName} test start`);
        try {
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          let task1: taskpool.Task = new taskpool.Task(executeTask, caseName);
          let task2: taskpool.Task = new taskpool.Task(executeTaskGroup, caseName);
          let task3: taskpool.Task = new taskpool.Task(executeDelayed, caseName);
          let task4: taskpool.Task = new taskpool.Task(executePeriodically, caseName);
          let task5: taskpool.Task = new taskpool.Task(executeSequenceRunner, caseName);
          let task6: taskpool.Task = new taskpool.Task(executeLongTask, caseName);
          runner.execute(task1);
          runner.execute(task2);
          runner.execute(task3);
          runner.execute(task4);
          runner.execute(task5);
          runner.execute(task6);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_COMBINE_SCENES_1200
     * @tc.name      : testTaskCombineScenes0012
     * @tc.desc      : 执行组合，长时 嵌套 Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskCombineScenes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskCombineScenes0012';
        console.info(`${caseName} test start`);
        try {
          let task1: taskpool.Task = new taskpool.LongTask(executeTask, caseName);
          let task2: taskpool.Task = new taskpool.LongTask(executeTaskGroup, caseName);
          let task3: taskpool.Task = new taskpool.LongTask(executeDelayed, caseName);
          let task4: taskpool.Task = new taskpool.LongTask(executePeriodically, caseName);
          let task5: taskpool.Task = new taskpool.LongTask(executeSequenceRunner, caseName);
          let task6: taskpool.Task = new taskpool.LongTask(executeLongTask, caseName);
          taskpool.execute(task1);
          taskpool.execute(task2);
          taskpool.execute(task3);
          taskpool.execute(task4);
          taskpool.execute(task5);
          taskpool.execute(task6);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_COMBINE_SCENES_1300
     * @tc.name      : testTaskCombineScenes0013
     * @tc.desc      : 执行组合，taskpool 并列 taskpool：Task | TaskGroup | 延时 | 周期 | 串行 | 长时
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskCombineScenes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskCombineScenes0013';
        console.info(`${caseName} test start`);
        try {
          executeTask(caseName);
          executeTaskGroup(caseName);
          executeDelayed(caseName);
          executePeriodically(caseName);
          executeSequenceRunner(caseName);
          executeLongTask(caseName);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0100
     * @tc.name      : testTaskExecutePeriodically0001
     * @tc.desc      : period：10，task：不指定任务名，优先级：不指定
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0001';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(wait1s, 10.0);
          taskpool.executePeriodically(10, task);
          setTimeout(() => {
            taskpool.cancel(task)
          }, 30)
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0200
     * @tc.name      : testTaskExecutePeriodically0002
     * @tc.desc      : period：0，task：指定任务名，优先级：指定taskpool.Priority.LOW
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0002';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(caseName, wait1s, 10.0);
          taskpool.executePeriodically(0, task, taskpool.Priority.LOW);
          setTimeout(() => {
            taskpool.cancel(task)
          }, 10)
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0300
     * @tc.name      : testTaskExecutePeriodically0003
     * @tc.desc      : period：-100，task：指定任务名，优先级：指定taskpool.Priority.MEDIUM 报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0003';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(caseName, wait1s, 10.1);
          taskpool.executePeriodically(-100, task, taskpool.Priority.MEDIUM);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0400
     * @tc.name      : testTaskExecutePeriodically0004
     * @tc.desc      : period：100，task：不指定任务名，带依赖关系，优先级：指定taskpool.Priority.HIGH 按照依赖顺序执行 报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0004';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 10);
          let task1: taskpool.Task = new taskpool.Task(delay, 10);
          console.info(`${caseName} dependency: add dependency start`);
          task.addDependency(task1);
          console.info(`${caseName} dependency: add dependency end`);
          taskpool.executePeriodically(100, task, taskpool.Priority.HIGH);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0500
     * @tc.name      : testTaskExecutePeriodically0005
     * @tc.desc      : 已经执行的task 报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0005';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 10);
          taskpool.execute(task);
          taskpool.executePeriodically(100, task);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0600
     * @tc.name      : testTaskExecutePeriodically0006
     * @tc.desc      : 周期任务 报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0006';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 10);
          taskpool.executePeriodically(100, task);
          taskpool.executePeriodically(100, task);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0700
     * @tc.name      : testTaskExecutePeriodically0007
     * @tc.desc      : 处于其他任务组的任务 报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0007';
        console.info(`${caseName} test start`);
        try {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task: taskpool.Task = new taskpool.Task(delay, 100);
          console.info(`${caseName} taskGroup: add task start`);
          taskGroup.addTask(task);
          taskpool.execute(taskGroup, taskpool.Priority.LOW);
          console.info(`${caseName} taskGroup: add task end`);
          taskpool.executePeriodically(100, task);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0800
     * @tc.name      : testTaskExecutePeriodically0008
     * @tc.desc      : 有依赖关系的任务 报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0008';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(delay, 100);
          let task1: taskpool.Task = new taskpool.Task(delay, 200);
          console.info(`${caseName} dependency: add dependency start`);
          task1.addDependency(task1);
          console.info(`${caseName} dependency: add dependency end`);
          taskpool.executePeriodically(100, task);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_EXECUTE_PERIODICALLY_0900
     * @tc.name      : testTaskExecutePeriodically0009
     * @tc.desc      : SequenceRunner的task 报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskExecutePeriodically0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskExecutePeriodically0009';
        console.info(`${caseName} test start`);
        try {
          let finalString: string = "";
          let task1: taskpool.Task = new taskpool.Task(delay, 10);
          let task2: taskpool.Task = new taskpool.Task(delay, 10);
          let task3: taskpool.Task = new taskpool.Task(delay, 10);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task1).then((value: NullishType) => {
            finalString += 'a';
            console.info(`${caseName} task1 done.`);
          });
          runner.execute(task2).then((value: NullishType) => {
            finalString += 'b';
            console.info(`${caseName} task2 done.`);
          });
          await runner.execute(task3).then((value: NullishType) => {
            finalString += 'c';
            console.info(`${caseName} task3 done.`);
          });
          console.info(`${caseName} seqrunner done, finalString is ${finalString}`);
          taskpool.executePeriodically(100, task1);
          expect(false).assertFail();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_STATE_0100
     * @tc.name      : testTaskState0001
     * @tc.desc      : 创建task，并execute，但未实际执行 WAITING
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskState0001';
        console.info(`${caseName} test start`);
        try {
          let taskDelay: taskpool.Task = new taskpool.Task(delay, 3000);
          let task: taskpool.Task = new taskpool.Task(caseName, additionDelay, 50);
          taskpool.execute(taskDelay, taskpool.Priority.MEDIUM);
          taskpool.execute(task, taskpool.Priority.LOW);
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          let state: number = getTaskStateByTaskName(taskpoolInfo, caseName);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_STATE_0200
     * @tc.name      : testTaskState0002
     * @tc.desc      : 创建task，并execute，实际执行中 RUNNING
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskState0002';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(caseName, delay, 3000);
          taskpool.execute(task, taskpool.Priority.HIGH);
          await delay(1000);
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          let state: number = getTaskStateByTaskName(taskpoolInfo, caseName);
          expect(state).assertEqual(taskpool.State.RUNNING);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_STATE_0300
     * @tc.name      : testTaskState0003
     * @tc.desc      : 创建task，并execute，执行完成 WAITING
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskState0003';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(caseName, delay, 100);
          await taskpool.execute(task).then((value: NullishType) => {
            console.info(`${caseName} task end`);
          });
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          let state: number = getTaskStateByTaskName(taskpoolInfo, caseName);
          expect(state == 0 || state == 6).assertTrue();
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_TASK_STATE_0400
     * @tc.name      : testTaskState0004
     * @tc.desc      : 创建task，并execute，cancel任务 CANCELED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskState0004';
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(caseName, delay, 50);
          taskpool.executeDelayed(1000, task);
          taskpool.cancel(task);
          let taskpoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
          let state: number = getTaskStateByTaskName(taskpoolInfo, caseName);
          expect(state).assertEqual(taskpool.State.CANCELED);
        } catch (error: Error) {
          console.info(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0600
     * @tc.name      : testTaskpoolTaskGroupConstructor001
     * @tc.desc      : Set the taskpool taskgroup constructor without groupname
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupConstructor001';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskExecute1.addTask(ConstructorTest1);
          taskExecute1.addTask(ConstructorTest2);
          taskExecute1.addTask(ConstructorTest3);

          taskpool.execute(taskExecute1).then((res: Array<NullishType>) => {
            console.info(`${caseName}: testTaskpoolTaskGroupConstructor001 return value: ${JSON.stringify(res)}`);
            isTerminate1 = true;
            expect(JSON.stringify(res as Array<NullishType>))
              .assertEqual(JSON.stringify([`ConstructorTest1`, `ConstructorTest2`, `ConstructorTest3`]));
            console.info(`${caseName}: groupName:${taskExecute1.name}`);
            expect(taskExecute1.name).assertEqual("");
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0601
     * @tc.name      : testTaskpoolTaskGroupConstructor002
     * @tc.desc      : Set the taskpool taskgroup constructor with string ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupConstructor002';
        console.info(`${caseName} test start`);
        try {
          let taskGroupName: string = "";
          let isTerminate1: boolean = false;
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName);
          taskExecute1.addTask(ConstructorTest1);

          taskpool.execute(taskExecute1).then((res: Array<NullishType>) => {
            console.info(`${caseName}: taskGroupName: ${taskExecute1.name}`);
            isTerminate1 = true;
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0604
     * @tc.name      : testTaskpoolTaskGroupConstructor005
     * @tc.desc      : Set the taskpool taskgroup constructor with taskname
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupConstructor005';
        console.info(`${caseName} test start`);
        try {
          let taskGroupName: string = "taskname";
          let isTerminate1: boolean = false;
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName);
          taskExecute1.addTask(ConstructorTest1);

          taskpool.execute(taskExecute1).then((res: Array<NullishType>) => {
            console.info(`${caseName}: taskGroupName: ${taskExecute1.name}`);
            expect(taskExecute1.name).assertDeepEquals("taskname");
            isTerminate1 = true;
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0605
     * @tc.name      : testTaskpoolTaskGroupAddTask001
     * @tc.desc      : Add task into taskgroup of taskpool with no-Concurrent function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupAddTask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupAddTask001';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskExecute1.addTask(noConcurrent);
          taskpool.execute(taskExecute1).then((res: NullishType) => {
            console.info(`${caseName}: taskExecute1 return value: ${JSON.stringify(res)}`);
            isTerminate1 = true;
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0606
     * @tc.name      : testTaskpoolTaskGroupAddTask002
     * @tc.desc      : Add task into taskgroup of taskpool with Concurrent function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    // func:使用@Concurrent装饰器装饰,返回number类型，无参数     then中可断言返回类型及返回值
    it('testTaskpoolTaskGroupAddTask002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupAddTask002';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskExecute1.addTask(Concurrent);
          taskExecute1.addTask(Concurrent);
          taskpool.execute(taskExecute1).then((res: Array<NullishType>) => {
            console.info(`${caseName}: taskExecute1 return value: ${JSON.stringify(res)}`);
            isTerminate1 = true;
            expect(JSON.stringify(res as Array<NullishType>)).assertEqual(JSON.stringify([321, 321]));
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0608
     * @tc.name      : testTaskpoolTaskGroupAddTask004
     * @tc.desc      : Add task into taskgroup of taskpool with Concurrent function whose return value type is string.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupAddTask004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupAddTask004';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let result1: Array<NullishType> = new Array<NullishType>();
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task1: taskpool.Task = new taskpool.Task(addTaskTask1, Number(100));
          let task2: taskpool.Task = new taskpool.Task(addTaskTask1, Number(100));
          taskExecute1.addTask(task1);
          taskExecute1.addTask(task2);
          taskpool.execute(taskExecute1).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            result1 = res as Array<NullishType>;
            expect(JSON.stringify(result1)).assertEqual(JSON.stringify([`1001`, `1001`]));
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0609
     * @tc.name      : testTaskpoolTaskGroupAddTask005
     * @tc.desc      : Specify task priority as taskpool Priority.LOW
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupAddTask005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupAddTask005';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          let taskName: string = "taskName";
          let task1: taskpool.Task = new taskpool.Task(taskName, addTaskTaskArray, "A");
          let task2: taskpool.Task = new taskpool.Task(taskName, addTaskTaskArray, "B");
          taskExecute1.addTask(task1);
          taskExecute1.addTask(task2);
          taskpool.execute(taskExecute1, taskpool.Priority.LOW).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            console.info(`${caseName}: typeof: ${typeof (res)}, length:${res.length}`);
            for (let i = 0; i < res.length; i++) {
              expect(res[i] as Array<Number>).assertDeepEquals(new Array<Number>(1, 2, 3, 4));
            }
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0610
     * @tc.name      : testTaskpoolTaskGroupAddTask006
     * @tc.desc      : Specify task priority as taskpool Priority.MEDIUM
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupAddTask006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupAddTask006';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          let taskName: string = "taskName";
          let task1: taskpool.Task = new taskpool.Task(taskName, addTaskTaskArray, "A");
          let task2: taskpool.Task = new taskpool.Task(taskName, addTaskTaskArray, "B");
          taskExecute1.addTask(task1);
          taskExecute1.addTask(task2);
          taskpool.execute(taskExecute1, taskpool.Priority.MEDIUM).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            console.info(`${caseName}: typeof: ${typeof (res)}, length:${res.length}`);
            for (let i = 0; i < res.length; i++) {
              expect(res[i] as Array<Number>).assertDeepEquals(new Array<Number>(1, 2, 3, 4));
            }
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0611
     * @tc.name      : testTaskpoolTaskGroupAddTask007
     * @tc.desc      : Specify task priority as taskpool Priority.HIGH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupAddTask007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupAddTask007';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let result1: Array<NullishType> = new Array<NullishType>();
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task1: taskpool.Task = new taskpool.Task(addTaskTask1, Number(10));
          let task2: taskpool.Task = new taskpool.Task(addTaskTask1, Number(20));
          taskExecute1.addTask(task1);
          taskExecute1.addTask(task2);
          taskpool.execute(taskExecute1, taskpool.Priority.HIGH).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            result1 = res as Array<NullishType>;
            expect(JSON.stringify(result1)).assertEqual(JSON.stringify([`101`, `201`]));
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0612
     * @tc.name      : testTaskpoolTaskGroupAddTask008
     * @tc.desc      : Add longTask task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupAddTask008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupAddTask008';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let result1: Array<NullishType> = new Array<NullishType>();
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task1: taskpool.Task = new taskpool.LongTask(addTaskTask1, Number(10));
          let task2: taskpool.Task = new taskpool.LongTask(addTaskTask1, Number(20));
          taskExecute1.addTask(task1);
          taskExecute1.addTask(task2);
          taskpool.execute(taskExecute1, taskpool.Priority.HIGH).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            result1 = res as Array<NullishType>;
            expect(JSON.stringify(result1)).assertEqual(JSON.stringify([`101`, `201`]));
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          done();
        }
        console.info(`${caseName} test end`);
      });


    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0613
     * @tc.name      : testTaskpoolTaskGroupAddTask009
     * @tc.desc      : Add executed task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    // 添加过的任务， 报错：401 message => Parameter error. taskpool:: executed taskGroup cannot addTask
    it('testTaskpoolTaskGroupAddTask009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupAddTask009';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let result1: Array<NullishType> = new Array<NullishType>();
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task1: taskpool.Task = new taskpool.Task(addTaskTask1, "10");
          let task2: taskpool.Task = new taskpool.Task(addTaskTask1, "20");
          taskExecute1.addTask(task1);
          taskExecute1.addTask(task2);
          taskpool.execute(taskExecute1, taskpool.Priority.HIGH).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            result1 = res as Array<NullishType>;
            expect(JSON.stringify(result1)).assertEqual(JSON.stringify([`101`, `201`]));
          });
          taskExecute1.addTask(task1);
          taskExecute1.addTask(task2);
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0614
     * @tc.name      : testTaskpoolTaskGroupLongTask001
     * @tc.desc      : Set Longtask without taskname and priority
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupLongTask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupLongTask001';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let task: taskpool.LongTask = new taskpool.LongTask(testLongTask1, Number(100));
          taskpool.execute(task).then((res: NullishType) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            expect(res as string).assertEqual(`100`);
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0615
     * @tc.name      : testTaskpoolTaskGroupLongTask002
     * @tc.desc      : Set Longtask with taskname and priority taskpool.Priority.LOW
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupLongTask002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupLongTask002';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let taskName: string = "TestName1";
          let task: taskpool.LongTask = new taskpool.LongTask(taskName, testLongTaskArray, "testString");
          taskpool.execute(task, taskpool.Priority.LOW).then((res: NullishType) => {
            console.info(`${caseName}: execute res is: ${res} taskName: ${task.name}`);
            isTerminate1 = true;
            expect(task.name).assertDeepEquals(taskName);
            expect(JSON.stringify(res as Array<Number>))
              .assertDeepEquals(JSON.stringify(new Array<Number>(2, 3, 4, 5)));
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0616
     * @tc.name      : testTaskpoolTaskGroupLongTask003
     * @tc.desc      : Set Longtask with taskname and priority taskpool.Priority.MEDIUM
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskGroupLongTask003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupLongTask003';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let taskName: string = "TestName2";
          let task: taskpool.LongTask = new taskpool.LongTask(taskName, testLongTaskArray, "testString");
          taskpool.execute(task, taskpool.Priority.MEDIUM).then((res: NullishType) => {
            console.info(`${caseName}: execute res is: ${res} taskName: ${task.name}`);
            isTerminate1 = true;
            expect(task.name).assertDeepEquals(taskName);
            expect(JSON.stringify(res as Array<Number>)).assertEqual(JSON.stringify(new Array<Number>(2, 3, 4, 5)));
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0617
     * @tc.name      : testTaskpoolTaskGroupLongTask004
     * @tc.desc      : Set Longtask without taskname but priority taskpool.Priority.HIGH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it('testTaskpoolTaskGroupLongTask004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskGroupLongTask004';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let task: taskpool.LongTask = new taskpool.LongTask(testLongTask2, "testString");
          taskpool.execute(task, taskpool.Priority.HIGH).then((res: NullishType) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            expect(res as string).assertEqual(`testString`);
          });
          while (!(isTerminate1)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0618
     * @tc.name      : testTaskpoolSequenceRunner001
     * @tc.desc      : Set taskRunner without priority
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner001';
        console.info(`${caseName} test start`);
        try {
          let finalString: string = "";
          let isTerminate1: boolean = false;
          let task: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task).then((res: NullishType) => {
            isTerminate1 = true;
            finalString += res;
            console.info(`${caseName}: seqrunner: task done.`);
            expect(finalString).assertDeepEquals('a');
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0619
     * @tc.name      : testTaskpoolSequenceRunner002
     * @tc.desc      : Set taskRunner with priority taskpool.Priority.LOW
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner002';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'low');
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.LOW);
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            console.info(`${caseName}:res: ${res}`);
            expect(res as string).assertDeepEquals('low');
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0620
     * @tc.name      : testTaskpoolSequenceRunner003
     * @tc.desc      : Set taskRunner with priority taskpool.Priority.MEDIUM
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner003';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'medium');
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.MEDIUM);
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            console.info(`${caseName}:res: ${res}`);
            expect(res as string).assertDeepEquals('medium');
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0621
     * @tc.name      : testTaskpoolSequenceRunner004
     * @tc.desc      : Set taskRunner with priority taskpool.Priority.HIGH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner004';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'high');
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.MEDIUM);
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            console.info(`${caseName}:res: ${res}`);
            expect(res as string).assertDeepEquals('high');
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0622
     * @tc.name      : testTaskpoolSequenceRunner005
     * @tc.desc      : Set taskRunner with sequenceName ""
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner005';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let sequenceName: string = "runner1";
          let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName);
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            // how to acquire runner name from runner1?
            // expect(runner1.name).assertDeepEquals('runner1');
            console.info(`${caseName}: seqrunner: task done.`);
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0625
     * @tc.name      : testTaskpoolSequenceRunner008
     * @tc.desc      : Set taskRunner with sequenceName "testName2" and priotiry taskpool.Priority.HIGH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //指定队列名  "taskname"，指定优先级taskpool.Priority.HIGH
    it('testTaskpoolSequenceRunner008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner008';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let sequenceName = "testName2";
          let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName, taskpool.Priority.HIGH);
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            console.info(`${caseName}: seqrunner: task done.`);
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          done();
        }
        console.info(`${caseName} test end`);
      });


    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0626
     * @tc.name      : testTaskpoolSequenceRunner009
     * @tc.desc      : Set taskRunner with sequenceName 123
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner009';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let sequenceName: number = 123;
          let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(String(sequenceName));
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            console.info(`${caseName}: seqrunner: task done.`);
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0627
     * @tc.name      : testTaskpoolSequenceRunner010
     * @tc.desc      : Set a named taskRunner and a unnamed taskRunner at the same time.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner010';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let isTerminate2: boolean = false;
          let sequenceName: string = "namedRunner";
          let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
          let task2: taskpool.Task = new taskpool.Task(testSequenceRunner, 'b');
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner(sequenceName);
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            console.info(`${caseName}: seqrunner: task done.`);
          });
          runner2.execute(task2).then((res: NullishType) => {
            isTerminate2 = true;
            console.info(`${caseName}: seqrunner: task done.`);
          });
          while (isTerminate1 && isTerminate2) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          done();
        }
        console.info(`${caseName} test end`);
      });


    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0628
     * @tc.name      : testTaskpoolSequenceRunner011
     * @tc.desc      : Set two taskRunners with different name at the same time.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner011';
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
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            console.info(`${caseName}: seqrunner: task done.`);
          });
          runner2.execute(task2).then((res: NullishType) => {
            isTerminate2 = true;
            console.info(`${caseName}: seqrunner: task done.`);
          });
          while (isTerminate1 && isTerminate2) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          done();
        }
        console.info(`${caseName} test end`);
      });


    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0629
     * @tc.name      : testTaskpoolSequenceRunner012
     * @tc.desc      : Set two taskRunners with same the name.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner012';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let isTerminate2: boolean = false;
          let sameNamedRunner: string = "sameNamedRunner";
          let task1: taskpool.Task = new taskpool.Task(testSequenceRunner, 'a');
          let task2: taskpool.Task = new taskpool.Task(testSequenceRunner, 'b');
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner(sameNamedRunner);
          let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner(sameNamedRunner);
          runner1.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            console.info(`${caseName}: seqrunner: task done.`);
          });
          runner2.execute(task2).then((res: NullishType) => {
            isTerminate2 = true;
            console.info(`${caseName}: seqrunner: task done.`);
          });
          while (isTerminate1 && isTerminate2) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0630
     * @tc.name      : testTaskpoolSequenceRunner013
     * @tc.desc      : Set taskRunner without runnerName and priority
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner013';
        console.info(`${caseName} test start`);
        try {
          let finalString: string = "";
          let isTerminate1: boolean = false;
          let task1: taskpool.Task = new taskpool.Task(testRunnerNum2Str, 22);
          let task2: taskpool.Task = new taskpool.Task(testRunnerNum2Str, 33);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            finalString += res;
            console.info(`${caseName}:res: ${res}, seqrunner: task1 done.`);
            expect(finalString).assertDeepEquals('22');
          });
          runner.execute(task2).then((res: NullishType) => {
            isTerminate1 = true;
            finalString += res;
            console.info(`${caseName}:res: ${res}, seqrunner: task2 done.`);
            expect(finalString).assertDeepEquals('2233');
          });
          while (isTerminate1) {
            await promiseCase();
          }
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0633
     * @tc.name      : testTaskpoolSequenceRunner016
     * @tc.desc      : Set taskRunner without taskName and but priority taskpool.Priority.HIGH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner016';
        console.info(`${caseName} test start`);
        try {
          let finalString: string = "";
          let isTerminate1: boolean = false;
          let task1: taskpool.Task = new taskpool.Task(testRunnerStr2Str, 'aa');
          let task2: taskpool.Task = new taskpool.Task(testRunnerStr2Str, 'bb');
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
          runner.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            finalString += res;
            console.info(`${caseName}:res: ${res}, seqrunner: task1 done.`);
            expect(finalString).assertDeepEquals('aa');
          });
          runner.execute(task2).then((res: NullishType) => {
            isTerminate1 = true;
            finalString += res;
            console.info(`${caseName}:res: ${res}, seqrunner: task2 done.`);
            expect(finalString).assertDeepEquals('aabb');
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0634
     * @tc.name      : testTaskpoolSequenceRunner017
     * @tc.desc      : Set taskRunner Longtask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolSequenceRunner017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolSequenceRunner016';
        console.info(`${caseName} test start`);
        try {
          let finalString: string = "";
          let isTerminate1: boolean = false;
          let task1: taskpool.Task = new taskpool.LongTask(testRunnerStr2Str, 'aa');
          let task2: taskpool.Task = new taskpool.LongTask(testRunnerStr2Str, 'bb');
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task1).then((res: NullishType) => {
            isTerminate1 = true;
            finalString += res;
            console.info(`${caseName}:res: ${res}, seqrunner: task1 done.`);
            expect(finalString).assertDeepEquals('aa');
          });
          runner.execute(task2).then((res: NullishType) => {
            isTerminate1 = true;
            finalString += res;
            console.info(`${caseName}:res: ${res}, seqrunner: task2 done.`);
            expect(finalString).assertDeepEquals('aabb');
          });
          while (isTerminate1) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_TaskpoolConcurrency_0635
     * @tc.name       : testExecuteFunc0002
     * @tc.desc       : Test the function of the constructor function.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //func:不使用@Concurrent装饰器装饰,返回number类型，无参数----报错 10200014
    it('testExecuteFunc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG = "testExecuteFunc0002";
        let funcRetNumberTmp = (): number => {
          return 0;
        };
        try {
          taskpool.execute(funcRetNumberTmp).then((value: NullishType) => {
            console.info("testExecuteFunc0002 result: " + value);
          });
        } catch (err: BusinessError) {
          console.error(`${TAG} failed, error: ${err.code}`);
          expect(err.code).assertEqual(10200014);
        }
        done()
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0100
     * @tc.name      : testTaskpoolExecute003
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回number类型，无参数----then中可断言返回类型及返回值
    it('testTaskpoolExecute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute003';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          taskpool.execute(funcRetNumber).then((res: NullishType) => {
            console.info(`${caseName}: Execute003 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as string).assertEqual('0');
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0101
     * @tc.name      : testExecuteFunc004
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回string类型，参数1：number----then中可断言返回类型及返回值 传和方法不一致的入参类型--报错
    it('testExecuteFunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteFunc0004';
        let isTerminate1: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resN: number = 100;
          taskpool.execute(funcRetString, resN).then((res: NullishType) => {
            console.info(`${caseName}: Execute004 return value: ${JSON.stringify(res)}`);
            isTerminate1 = true;
            expect(res as string).assertEqual("This is string");
          });
        } catch (error: Error) {
          isTerminate1 = true;
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        while (!(isTerminate1)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0102
     * @tc.name      : testTaskpoolExecute005
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回boolean类型，参数1：string，参数2：boolean----then中可断言返回类型及返回值
    it('testTaskpoolExecute005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteFunc0005';
        let isTerminate: boolean = false;
        try {
          let resB: boolean = true;
          let resS: string = "hello";
          let resN: number = 100;
          taskpool.execute(funcRetBool, resS, resB).then((res: NullishType) => {
            console.info(`${caseName}: Execute005 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(String(res as boolean)).assertEqual('true');
          });
          taskpool.execute(funcRetBool, resS, resN).then((res: NullishType) => {
            console.info(`${caseName}: Execute005 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as boolean).assertEqual(false);
          });
        } catch (error: Error) {
          isTerminate = true;
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0103
     * @tc.name      : testTaskpoolExecute006
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回undefined类型，无参数----then中可断言返回类型及返回值
    it('testTaskpoolExecute006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute006';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          taskpool.execute(funcRetUndef).then((res: NullishType) => {
            console.info(`${caseName}: Execute006 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(String(typeof (res) == "undefined")).assertEqual('true');
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0104
     * @tc.name      : testTaskpoolExecute007
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回null类型，参数1：boolean----then中可断言返回类型及返回值
    // 传和方法不一致的入参类型--报错
    it('testTaskpoolExecute007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute007';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resB: boolean = true;
          taskpool.execute(funcRetNull, resB).then((res: NullishType) => {
            console.info(`${caseName}: Execute007 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(String(res == null)).assertEqual('true');
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0105
     * @tc.name      : testTaskpoolExecute008
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回bigint类型，参数1：bigint----then中可断言返回类型及返回值
    // 传和方法不一致的入参类型--报错
    it('testTaskpoolExecute008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute008';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resBg = 123n;
          taskpool.execute(funcRetBigint, resBg).then((res: NullishType) => {
            console.info(`${caseName}: Execute008 return value: ${res}`);
            isTerminate = true;
            expect(String(res as bigint)).assertEqual(String(354n));
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0106
     * @tc.name      : testTaskpoolExecute009
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Date类型，参数1：string，参数2：number，参数3：number----then中可断言返回类型及返回值
    // 传和方法不一致的入参类型--报错
    it('testTaskpoolExecute009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute009';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resS: string = "2024-09-03";
          let resN1: number = 193625;
          let resN2: number = 2318;
          taskpool.execute(funcRetDate, resS, resN1, resN2).then((res: NullishType) => {
            console.info(`${caseName}: Execute009 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as Date);
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0107
     * @tc.name      : testTaskpoolExecute011
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Array类型，参数1：Array----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    it('testTaskpoolExecute011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute011';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resA: Array<int> = new Array<int>(1, 2, 3, 4, 5);
          let a: Array<int> = new Array<int>(2, 3, 4, 5, 6);
          taskpool.execute(funcRetArray, resA).then((res: NullishType) => {
            console.info(`${caseName}: Execute011 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(JSON.stringify(res as Array<int>)).assertEqual(JSON.stringify(a));
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0108
     * @tc.name      : testTaskpoolExecute012
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Map类型，参数1：Map，参数2：boolean----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    it('testTaskpoolExecute012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute012';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resMap: Map<String, Number> = new Map<String, Number>([
            ['1', 1],
            ['2', 2],
            ['3', 3],
          ]);
          let resB: boolean = false;
          taskpool.execute(funcRetMap, resMap, resB).then((res: NullishType) => {
            console.info(`${caseName}: Execute012 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as Map<string, number>);
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0109
     * @tc.name      : testTaskpoolExecute013
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Set类型，参数1：Set，参数2：boolean----then中可断言返回类型及返回值
    it('testTaskpoolExecute013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute013';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resSet: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
          let resB: boolean = false;
          taskpool.execute(funcRetSet, resSet, resB).then((res: NullishType) => {
            console.info(`${caseName}: Execute013 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as Set<int>);
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0110
     * @tc.name      : testTaskpoolExecute014
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Object(class)类型，参数1：string，参数2：Object(class)----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    it('testTaskpoolExecute014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute014';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resP = new Person1("mangGuoYuJiu", 25);
          let resS: string = 'mfWang';
          taskpool.execute(funcRetClass, resS, resP).then((res: NullishType) => {
            console.info(`${caseName}: Execute014 return value: ${res}`);
            isTerminate = true;
            expect((res as Person).name).assertEqual(resS);
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0111
     * @tc.name      : testTaskpoolExecute015
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolExecute015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        //func:使用@Concurrent装饰器装饰,返回ArrayBuffer类型，参数1：string，参数2：ArrayBuffer----then中可断言返回类型及返回值
        const caseName: string = 'testTaskpoolExecute015';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let buffer = new ArrayBuffer(16);
          let resS: string = 'mfWang';
          taskpool.execute(funcRetAB, resS, buffer).then((res: NullishType) => {
            //console.info(`${caseName}: Execute015 return value: ${res}`);
            isTerminate = true;
            expect(res as ArrayBuffer);
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });


    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0112
     * @tc.name      : testTaskpoolExecute016
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回TypedArray类型，参数1：TypedArray，参数2：boolean----then中可断言返回类型及返回值
    //传和方法不一致的入参类型--报错
    it('testTaskpoolExecute016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute016';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let buffer = new ArrayBuffer(10);
          let uint8 = new Uint8Array(buffer);
          uint8.set([10, 20, 30, 40, 50]);
          let resB: boolean = false;
          taskpool.execute(funcRetU8, uint8, resB).then((res: NullishType) => {
            console.info(`${caseName}: Execute016 return value: ${(res as Uint8Array)?.[5]}`);
            isTerminate = true;
            expect(res as Uint8Array);
            expect(String((res as Uint8Array)?.[5])).assertEqual('255');
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0113
     * @tc.name      : testTaskpoolExecute017
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //task：指定任务名，func:使用@Concurrent装饰器装饰,返回Array类型，参数1：string，优先级：指定taskpool.Priority.LOW----then中
    // 可断言返回类型及返回值
    it('testTaskpoolExecute017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute017';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetArray2, "helloXTS");
          taskpool.execute(task, taskpool.Priority.LOW).then((res: NullishType) => {
            isTerminate = true;
            expect(res as Array<int>);
            expect(String((res as Array<int>)?.[2])).assertEqual('4');
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0114
     * @tc.name      : testTaskpoolExecute018
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //task：指定任务名，func:使用@Concurrent装饰器装饰,返回Array类型，参数1：string，优先级：指定taskpool.Priority.MEDIUM----then中
    // 可断言返回类型及返回值
    it('testTaskpoolExecute018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute018';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetArray2, "helloXTS");
          taskpool.execute(task, taskpool.Priority.MEDIUM).then((res: NullishType) => {
            isTerminate = true;
            expect(res as Array<int>);
            expect(String((res as Array<int>)?.[2])).assertEqual('4');
          });
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0115
     * @tc.name      : testTaskpoolExecute019
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //taskgroup：指定任务组名，优先级：指定taskpool.Priority.LOW----结果按照添加顺序返回
    it('testTaskpoolExecute019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute019';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let isTerminate2: boolean = false;
          let result1: NullishTuple1 = [0, '', 0];
          let result2: NullishTuple2 = [false, 0, false];
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskExecute1.addTask(printNumber, 10.5);
          taskExecute1.addTask(printString, 'string');
          taskExecute1.addTask(wait1s, -30.6);
          let taskExecute2: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task1: taskpool.Task = new taskpool.Task(printABool, true);
          let task2: taskpool.Task = new taskpool.Task(printABig, 200n);
          let task3: taskpool.Task = new taskpool.Task(printABool, false);
          taskExecute2.addTask(task1);
          taskExecute2.addTask(task2);
          taskExecute2.addTask(task3);
          taskpool.execute(taskExecute1, taskpool.Priority.LOW).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            result1 = res as NullishTuple1;
            expect(result1).assertDeepEquals([10.5, 'string', -30.6] as NullishTuple1);
          });
          taskpool.execute(taskExecute2, taskpool.Priority.LOW).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate2 = true;
            result2 = res as NullishTuple2;
            expect(result2).assertDeepEquals([true, 200, false] as NullishTuple2);
          });
          while (!(isTerminate1 && isTerminate2)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0116
     * @tc.name      : testTaskpoolExecute020
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //指定任务组名，优先级：指定taskpool.Priority.MEDIUM----结果按照添加顺序返回
    it('testTaskpoolExecute020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute020';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let isTerminate2: boolean = false;
          let result1: NullishTuple1 = [0, '', 0];
          let result2: NullishTuple2 = [false, 0, false];
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskExecute1.addTask(printNumber, 10.5);
          taskExecute1.addTask(printString, 'string');
          taskExecute1.addTask(wait1s, -30.6);
          let taskExecute2: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task1: taskpool.Task = new taskpool.Task(printABool, true);
          let task2: taskpool.Task = new taskpool.Task(printABig, 200n);
          let task3: taskpool.Task = new taskpool.Task(printABool, false);
          taskExecute2.addTask(task1);
          taskExecute2.addTask(task2);
          taskExecute2.addTask(task3);
          taskpool.execute(taskExecute1, taskpool.Priority.MEDIUM).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            result1 = res as NullishTuple1;
            expect(result1).assertDeepEquals([10.5, 'string', -30.6] as NullishTuple1);
          });
          taskpool.execute(taskExecute2, taskpool.Priority.MEDIUM).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate2 = true;
            result2 = res as NullishTuple2;
            expect(result2).assertDeepEquals([true, 200, false] as NullishTuple2);
          });
          while (!(isTerminate1 && isTerminate2)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0117
     * @tc.name      : testTaskpoolExecute021
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //taskgroup：不指定任务组名，优先级：指定taskpool.Priority.HIGH----结果按照添加顺序返回
    it('testTaskpoolExecute021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolExecute021';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let isTerminate2: boolean = false;
          let result1: NullishTuple1 = [0, '', 0];
          let result2: NullishTuple2 = [false, 0, false];
          let taskExecute1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskExecute1.addTask(printNumber, 10.5);
          taskExecute1.addTask(printString, 'string');
          taskExecute1.addTask(wait1s, -30.6);
          let taskExecute2: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task1: taskpool.Task = new taskpool.Task(printABool, true);
          let task2: taskpool.Task = new taskpool.Task(printABig, 200n);
          let task3: taskpool.Task = new taskpool.Task(printABool, false);
          taskExecute2.addTask(task1);
          taskExecute2.addTask(task2);
          taskExecute2.addTask(task3);
          taskpool.execute(taskExecute1, taskpool.Priority.HIGH).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate1 = true;
            expect(res as NullishTuple1).assertDeepEquals([10.5, 'string', -30.6] as NullishTuple1);
          });
          taskpool.execute(taskExecute2, taskpool.Priority.HIGH).then((res: Array<NullishType>) => {
            console.info(`${caseName}: execute res is: ${res}`);
            isTerminate2 = true;
            expect(res as NullishTuple2).assertDeepEquals([true, 200, false] as NullishTuple2);
          });
          while (!(isTerminate1 && isTerminate2)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0118
     * @tc.name      : testTaskpoolTask001
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG = "testTaskpoolTask001";
        let taskTest001 = (): number => {
          return 0;
        };
        try {
          let task: taskpool.Task = new taskpool.Task(taskTest001);
          taskpool.execute(task).then((value: NullishType) => {
            console.info("testTaskpoolTask001 result: " + value);
          });
        } catch (err: BusinessError) {
          console.error(`${TAG} failed, error: ${err.code}`);
          expect(err.code).assertEqual(10200014);
        }
        done()
      });
    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0119
     * @tc.name      : testTaskpoolTask002
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回number类型，无参数----then中可断言返回类型及返回值
    it('testTaskpoolTask002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask002';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(taskTest001);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}: testTaskpoolTask002 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as string).assertEqual('0');
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0120
     * @tc.name      : testTaskpoolTask003
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTask003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask003';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetString, Number(20));
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}: testTaskpoolTask003 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as string).assertEqual("This is string");
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0121
     * @tc.name      : testTaskpoolTask004
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回boolean类型，参数1：string，参数2：boolean----then中可断言返回类型及返回值
    it('testTaskpoolTask004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask004';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resS: string = "This is string";
          let resB: boolean = false;
          let task: taskpool.Task = new taskpool.Task(funcRetBool, resS, resB);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}: testTaskpoolTask004 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as string).assertEqual('true');
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0122
     * @tc.name      : testTaskpoolTask005
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回undefined类型，无参数----then中可断言返回类型及返回值
    it('testTaskpoolTask005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask005';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetUndef);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}: testTaskpoolTask005 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(String(typeof (res) == "undefined")).assertEqual('true');
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0123
     * @tc.name      : testTaskpoolTask006
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTask006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask006';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let task: taskpool.Task = new taskpool.Task(funcRetNull, true);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}: testTaskpoolTask006 return value: ${res}`);
            isTerminate = true;
            expect(res as null).assertEqual(null);
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0124
     * @tc.name      : testTaskpoolTask007
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回bigint类型，参数1：bigint----then中可断言返回类型及返回值
    it('testTaskpoolTask007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask007';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resBg = 123n;
          let task: taskpool.Task = new taskpool.Task(funcRetBigint, resBg);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}: testTaskpoolTask007 return value: ${res}`);
            isTerminate = true;
            expect(String(res as bigint)).assertEqual(String(354n));
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0125
     * @tc.name      : testTaskpoolTask008
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Date类型，参数1：string，参数2：number，参数3：number----then中可断言返回类型及返回值
    it('testTaskpoolTask008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask008';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resS: string = "2024-09-03";
          let resN1: number = 193625;
          let resN2: number = 2318;
          let task: taskpool.Task = new taskpool.Task(funcRetDate, resS, resN1, resN2);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}: testTaskpoolTask008 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as Date);
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0126
     * @tc.name      : testTaskpoolTask010
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Array类型，参数1：Array----then中可断言返回类型及返回值
    it('testTaskpoolTask010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask010';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resA: Array<int> = new Array<int>(1, 2, 3, 4, 5);
          let task: taskpool.Task = new taskpool.Task(funcRetArray, resA);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}: testTaskpoolTask010 return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(JSON.stringify(res as Array<int>)).assertEqual(JSON.stringify([2, 3, 4, 5, 6]));
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0127
     * @tc.name      : testTaskpoolTask011
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Map类型，参数1：Map，参数2：boolean----then中可断言返回类型及返回值
    it('testTaskpoolTask011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask011';
        let isTerminate: boolean = false;
        let resMap: Map<String, Number> = new Map<String, Number>([
          ['1', 1],
          ['2', 2],
          ['3', 3],
        ]);
        let resB: boolean = false;
        console.info(`${caseName} test start`);

        try {
          let task: taskpool.Task = new taskpool.Task(funcRetMap, resMap, resB);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}:  return value: ${resMap.get('1')}`);
            isTerminate = true;
            expect(res as Map<string, number>);
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0128
     * @tc.name      : testTaskpoolTask012
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Set类型，参数1：Set，参数2：boolean----then中可断言返回类型及返回值
    it('testTaskpoolTask012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask012';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resSet: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
          let resB: boolean = false;
          let task: taskpool.Task = new taskpool.Task(funcRetSet, resSet, resB);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}:  return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            for (let value of Array.from(resSet)) {
              console.info(`${caseName}:  resSet value: ${value}`);
            }
            expect(res as Set<int>);
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0129
     * @tc.name      : testTaskpoolTask013
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回Object(class)类型，参数1：string，参数2：Object(class)----then中可断言返回类型及返回值
    it('testTaskpoolTask013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask013';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let resP = new Person1("mangGuoYuJiu", 25);
          let resS: string = 'mfWang';
          let task: taskpool.Task = new taskpool.Task(funcRetClass, resS, resP);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}:  return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as Person);
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0130
     * @tc.name      : testTaskpoolTask014
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回ArrayBuffer类型，参数1：string，参数2：ArrayBuffer----then中可断言返回类型及返回值
    it('testTaskpoolTask014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask014';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let buffer = new ArrayBuffer(16);
          let resS: string = 'mfWang';
          let task: taskpool.Task = new taskpool.Task(funcRetAB, resS, buffer);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}:  return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as ArrayBuffer);
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_0131
     * @tc.name      : testTaskpoolTask015
     * @tc.desc      : Test the function of the constructor function.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    //func:使用@Concurrent装饰器装饰,返回TypedArray类型，参数1：TypedArray，参数2：boolean----then中可断言返回类型及返回值
    it('testTaskpoolTask015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTask015';
        let isTerminate: boolean = false;
        console.info(`${caseName} test start`);
        try {
          let buffer = new ArrayBuffer(10);
          let uint8 = new Uint8Array(buffer);
          uint8.set([10, 20, 30, 40, 50]);
          let resB: boolean = false;
          let task: taskpool.Task = new taskpool.Task(funcRetU8, uint8, resB);
          taskpool.execute(task).then(((res: NullishType) => {
            console.info(`${caseName}:  return value: ${JSON.stringify(res)}`);
            isTerminate = true;
            expect(res as Uint8Array);
          }));
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          isTerminate = true;
          expect(false).assertFail();
        }
        while (!(isTerminate)) {
          await promiseCase();
        }
        done();
        console.info(`${caseName} test end`);
      });
    //$5.0 isCanceled----cancel(task)结合该方法用例进行判断验证
    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_900
     * @tc.name      : testTaskpoolCancel001
     * @tc.desc      : Cancel a task from the task pool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolCancel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolCancel001';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let isTerminate2: boolean = false;
          let isTerminate3: boolean = false;
          let result1: number = 0;
          let result2: number = 0;
          let result3: number = 0;
          let taskExecute1: taskpool.Task = new taskpool.Task(mathMore, Number(8));
          let taskExecute2: taskpool.Task = new taskpool.Task(mathMore, Number(16));
          let taskExecute3: taskpool.Task = new taskpool.Task(mathMore, Number(9));
          taskpool.execute(taskExecute1).then((res: NullishType) => {
            console.info(`${caseName}: taskExecute1 return value: ${JSON.stringify(res)}`);
            isTerminate1 = true;
            result1 = res as number;
          });
          taskpool.execute(taskExecute2).then((res: NullishType) => {
            console.info(`${caseName}: taskExecute2 return value: ${res}`);
            isTerminate2 = true;
            result2 = res as number;
          });
          taskpool.execute(taskExecute3).then((res: NullishType) => {
            console.info(`${caseName}: taskExecute3 return value: ${JSON.stringify(res)}`);
            isTerminate3 = true;
            result3 = res as number;
            taskpool.cancel(taskExecute3);
            expect(String(result3)).assertEqual('4');
          });
          taskpool.cancel(taskExecute1);
          taskpool.cancel(taskExecute2);
          while (!(isTerminate1 && isTerminate2 || isTerminate3)) {
            await promiseCase();
          }
          expect(String(result1)).assertEqual('0');
          expect(String(result2)).assertEqual('0');
          expect(taskpool.Task.isCanceled()).assertTrue();
          let result: number[] = [result1, result2, result3];
          console.info(`${caseName}: result:  ${result}`);
          expect(result).assertDeepEquals([0, 0, 4]);
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code => message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_1000
     * @tc.name      : testTaskpoolCancel002
     * @tc.desc      : Cancel a task group in a task pool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolCancel002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolCancel002';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let isTerminate2: boolean = false;
          let result1: number[] = [2, 2, 2];
          let result2: number[] = [1, 1, 1];
          let taskGroup1 = new taskpool.TaskGroup();
          let task01: taskpool.Task = new taskpool.Task(mathPow, Number(2), Number(3));
          let task02: taskpool.Task = new taskpool.Task(mathPow, Number(4), Number(2));
          let task03: taskpool.Task = new taskpool.Task(mathPow, Number(8), Number(2));
          taskGroup1.addTask(task01);
          taskGroup1.addTask(task02);
          taskGroup1.addTask(task03);
          let taskGroup2 = new taskpool.TaskGroup();
          let task1: taskpool.Task = new taskpool.Task(mathSqrt, Number(9));
          let task2: taskpool.Task = new taskpool.Task(mathSqrt, Number(25));
          let task3: taskpool.Task = new taskpool.Task(mathSqrt, Number(36));
          taskGroup2.addTask(task1);
          taskGroup2.addTask(task2);
          taskGroup2.addTask(task3);
          taskpool.execute(taskGroup1).then((res: NullishType) => {
            console.info(`${caseName}: taskGroup1 return value: ${JSON.stringify(res)}`);
            result1 = res as number[];
            isTerminate1 = true;
            expect(result1).assertDeepEquals([8, 16, 64]);
          }).catch((error: NullishType) => {
            console.info(`${caseName}: taskGroup1 execute catch error: ${JSON.stringify(error)}`);
            expect(error === null).assertFalse();
          });
          taskpool.cancel(taskGroup1);
          expect(result1).assertDeepEquals([2, 2, 2]);
          taskpool.execute(taskGroup2).then((res: NullishType) => {
            console.info(`${caseName}: taskGroup2 return value: ${JSON.stringify(res)}`);
            result2 = res as number[];
            isTerminate2 = true;
            expect(result2).assertDeepEquals([3, 5, 6]);
          }).catch((error: NullishType) => {
            console.info(`${caseName}: taskGroup2 execute catch error: ${JSON.stringify(error)}`);
            expect(false).assertFail();
            done();
          });
          while (!(isTerminate1 || isTerminate2)) {
            await promiseCase();
          }
          expect(taskpool.Task.isCanceled() == true);
          console.info(`${caseName} test end`);
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          console.info(`${caseName} test end`);
          expect(false).assertFail();
          done();
        }
        done()
      });


    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_2600
     * @tc.name      : testTaskpoolTaskSendData001
     * @tc.desc      : Send a message to the host thread and trigger a callback during task execution
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolTaskSendData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTaskpoolTaskSendData001';
        console.info(`${caseName} test start`);
        try {
          let isTerminate1: boolean = false;
          let isTerminate2: boolean = false;
          let isTerminate3: boolean = false;
          let isTerminate4: boolean = false;
          let isTerminate5: boolean = false;
          let isTerminate6: boolean = false;
          let isTerminate7: boolean = false;
          let isTerminate8: boolean = false;
          let taskConstructor1: taskpool.Task = new taskpool.Task(concurrentF, Number(1));
          let taskConstructor2: taskpool.Task = new taskpool.Task(spileString, 'q', 'e');
          let taskConstructor3: taskpool.Task = new taskpool.Task(funArray, new Array<number>(1, 2, 3));
          let taskConstructor4: taskpool.Task = new taskpool.Task(funDate, new Date(2024, 0, 1));
          let taskConstructor5: taskpool.Task = new taskpool.Task(changeT, false);
          let taskConstructor6: taskpool.Task = new taskpool.Task(funcRUndef, undefined);
          let taskConstructor7: taskpool.Task = new taskpool.Task(changeN2T, null);
          taskConstructor1.onReceiveData((res: NullishType) => {
            console.info(`${caseName}: taskConstructor1.onReceiveData res: ${JSON.stringify(res)}`);
            expect(res as number).assertEqual(10);
          });
          taskConstructor2.onReceiveData((res: NullishType) => {
            console.info(`${caseName}: taskConstructor2.onReceiveData res: ${JSON.stringify(res)}`);
            expect(res as string).assertEqual('qe');
          });
          taskConstructor3.onReceiveData((res: NullishType) => {
            console.info(`${caseName}: taskConstructor3.onReceiveData res: ${JSON.stringify(res)}`);
            expect(res as Array<number>).assertDeepEquals([1, 2, 3]);
          });
          taskConstructor4.onReceiveData((res: NullishType) => {
            console.info(`${caseName}: taskConstructor4.onReceiveData res: ${JSON.stringify(res)}`);
            expect((res as Date).toString()).assertEqual('Mon Jan 01 2024 00:00:00 GMT+0800');
          });
          taskConstructor5.onReceiveData((res: NullishType) => {
            console.info(`${caseName}: taskConstructor5.onReceiveData res: ${JSON.stringify(res)}`);
            expect(res as boolean).assertEqual(true);
          });
          taskConstructor6.onReceiveData((res: NullishType) => {
            console.info(`${caseName}: taskConstructor6.onReceiveData res: ${JSON.stringify(res)}`);
            expect(typeof (res) === typeof (undefined)).assertEqual(true);
          });
          taskConstructor7.onReceiveData((res: NullishType) => {
            console.info(`${caseName}: taskConstructor7.onReceiveData res: ${JSON.stringify(res)}`);
            expect(typeof (res) === typeof (undefined)).assertEqual(true);
          });
          taskpool.execute(taskConstructor1).then((res: NullishType) => {
            console.info(`${caseName}: taskConstructor1 return value: ${JSON.stringify(res)}`);
            isTerminate1 = true;
          });
          taskpool.execute(taskConstructor2).then((res: NullishType): boolean => {
            console.info(`${caseName}: taskConstructor2 return value: ${JSON.stringify(res)}`);
            isTerminate2 = true;
          });
          taskpool.execute(taskConstructor3).then((res: NullishType) => {
            console.info(`${caseName}: taskConstructor3 return value: ${res}`);
            isTerminate3 = true;
          });
          taskpool.execute(taskConstructor4).then((res: NullishType) => {
            console.info(`${caseName}: taskConstructor4 return value: ${JSON.stringify(res)}`);
            isTerminate4 = true;
          });
          taskpool.execute(taskConstructor5).then((res: NullishType) => {
            console.info(`${caseName}: taskConstructor5 return value: ${JSON.stringify(res)}`);
            isTerminate5 = true;
          });
          taskpool.execute(taskConstructor6).then((res: NullishType) => {
            console.info(`${caseName}: taskConstructor6 return value: ${JSON.stringify(res)}`);
            isTerminate6 = true;
          });
          taskpool.execute(taskConstructor7).then((res: NullishType) => {
            console.info(`${caseName}: taskConstructor7 return value: ${JSON.stringify(res)}`);
            isTerminate7 = true;
          });
          while (!(isTerminate1 && isTerminate2 && isTerminate3 && isTerminate4 && isTerminate5 && isTerminate6
            && isTerminate7)) {
            await promiseCase();
          }
          done();
        } catch (error: Error) {
          console.info(`${caseName}: catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
          done();
        }
        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_0100
     * @tc.name      : testExecuteTaskShareType0001
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0001';
        console.info(`${caseName} test start`);
        try {
          let data: ConcatArray<number> = new Array<number>(1, 2, 4);
          await taskpool.execute(shareTypeTask0001, data).then((res: NullishType) => {

            console.info(`${caseName} res: ${res}`);
            expect(res instanceof Array).assertTrue();
            expect(String(res as ConcatArray<number>)).assertEqual('1');
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_0200
     * @tc.name      : testExecuteTaskShareType0002
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0002';
        console.info(`${caseName} test start`);
        try {
          let data: Array<number> = new Array<number>();
          await taskpool.execute(shareTypeTask0002, data).then((res: NullishType) => {

            console.info(`${caseName} res: ${res}`);
            expect(res instanceof Array).assertTrue();
            expect(String((res as Array<number>)[0])).assertEqual('1');
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_0300
     * @tc.name      : testExecuteTaskShareType0003
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0003';
        console.info(`${caseName} test start`);
        try {
          let data: Map<string, string> = new Map<string, string>();
          await taskpool.execute(shareTypeTask0003, data).then((res: NullishType) => {

            console.info(`${caseName} ` + res);
            expect(res instanceof Map).assertTrue();
            expect((res as Map<string, string>).get('key')).assertEqual('value');
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_0400
     * @tc.name      : testExecuteTaskShareType0004
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0004';
        console.info(`${caseName} test start`);
        try {
          let data: Set<number> = new Set<number>();
          await taskpool.execute(shareTypeTask0004, data).then((res: NullishType) => {

            console.info(`${caseName} res: ${res}`);
            expect(res instanceof Set).assertTrue();
            expect((res as Set<number>).has(1)).assertTrue();
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_0600
     * @tc.name      : testExecuteTaskShareType0006
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0006';
        console.info(`${caseName} test start`);
        try {
          let data: AsyncLock = AsyncLock.request(caseName);
          await taskpool.execute(shareTypeTask0006, data).then((res: NullishType) => {

            expect(res instanceof AsyncLock).assertTrue();
            expect(String((res as AsyncLock).name)).assertEqual(caseName);
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_0800
     * @tc.name      : testExecuteTaskShareType0008
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0008';
        console.info(`${caseName} test start`);
        try {
          let sendable = new SendableClass();
          let data: number = sendable.count_;
          await taskpool.execute(shareTypeTask0008, data).then((res: NullishType) => {

            console.info(`${caseName} res: ${res}`);
            expect(typeof res == 'number').assertTrue();
            expect(String(res as number)).assertEqual('1');
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_0900
     * @tc.name      : testExecuteTaskShareType0009
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const caseName: string = 'testExecuteTaskShareType0009';
      console.info(`${caseName} test start`);
      try {
        let data: Function = SendableFunc;
        await taskpool.execute(shareTypeTaskFun, data).then((res: Any) => {

          console.info(`${caseName} res: ${res}`);
          // expect((res as Function).unsafeCall()).assertTrue();
        })
      } catch (error: Error) {
        console.error(`${caseName} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_1000
     * @tc.name      : testExecuteTaskShareType0010
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const caseName: string = 'testExecuteTaskShareType0010';
      console.info(`${caseName} test start`);
      try {
        let data: Function = SendableClass.getPromiseCount;
        await taskpool.execute(shareTypeTaskFun, data).then((res: Any) => {
          console.info(`${caseName} res: ${res}`);
          // expect((res as Function).unsafeCall()).assertEqual(1);
        })
      } catch (error: Error) {
        console.error(`${caseName} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_1100
     * @tc.name      : testExecuteTaskShareType0011
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const caseName: string = 'testExecuteTaskShareType0011';
      console.info(`${caseName} test start`);
      try {
        let data: SendableClass = new SendableClass();
        await taskpool.execute(shareTypeTask0011, data).then((res: NullishType) => {

          console.info(`${caseName} res: ${res}`);
          expect(res instanceof SendableClass).assertTrue();
          expect(String((res as SendableClass).count_)).assertEqual('1');
        })
      } catch (error: Error) {
        console.error(`${caseName} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_1300
     * @tc.name      : testExecuteTaskShareType0013
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0013';
        console.info(`${caseName} test start`);
        try {
          await taskpool.execute(shareTypeTask0013, SendableClass.count).then((res: NullishType) => {

            console.info(`${caseName} res: ${res}`);
            expect(typeof res == 'number').assertTrue();
            expect(String((res as number))).assertEqual('2');
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_1400
     * @tc.name      : testExecuteTaskShareType0014
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const caseName: string = 'testExecuteTaskShareType0014';
      console.info(`${caseName} test start`);
      try {
        await taskpool.execute(shareTypeTaskFun, SendableClass.getPromiseCount).then((res: Any) => {

          console.info(`${caseName} res: ${res}`);
          // expect((res as Function).unsafeCall()).assertEqual(1);
        })
      } catch (error: Error) {
        console.error(`${caseName} catch error: code =>  message => ${error.message}`);
        expect(false).assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_1600
     * @tc.name      : testExecuteTaskShareType0016
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0016';
        console.info(`${caseName} test start`);
        try {
          let data: unionType = 1;
          await taskpool.execute(shareTypeTask0016, data).then((res: NullishType) => {

            console.info(`${caseName} res: ${res}`);
            expect(typeof res == 'boolean').assertTrue();
            expect(res as boolean).assertTrue();
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_EXECUTE_TASK_SHARE_TYPE_1700
     * @tc.name      : testExecuteTaskShareType0017
     * @tc.desc      : Testing the task->execute with create func, assert return type and value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testExecuteTaskShareType0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testExecuteTaskShareType0017';
        console.info(`${caseName} test start`);
        try {
          let data: CustomizeClass = new CustomizeClass();
          await taskpool.execute(shareTypeTask0017, data).then((res: NullishType) => {

            console.info(`${caseName} res: ${res}`);
            expect(String((res as CustomizeClass).sendable.count_)).assertEqual('1');
          })
        } catch (error: Error) {
          console.error(`${caseName} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })
  });
}