/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import { taskpool, collections, TreeSet, MessageEvents } from '@kit.ArkTS'
import worker from '@ohos.worker'
import { BusinessError } from '@ohos.base'
import { currentFun, transferArrayBuffer, transferAtomics, setCloneListTest, setTransferListTest,
  testString, testTime, testNumber, testTaskPool, promiseCase, asyncSum,
  printArgsFunc, Sum, delaySum, Add, funcStrCat, arraySum, objectSum, Multi, AdditionDelay, WaitforRunner,
  errorTest, testCancelDelayed, dependend, hashMapTest, delay, randomTest, outerTaskFunc,
  isConcurrentTest1, isConcurrentTest2, sequenceRunnerTest, sequenceRunnerPriorityTest, CancelAndExecuteDelayed,
  errorManageTest, dealHashMapTest, noUseConcurrentTest, sendDataTest, sendableClassTestFunc, Int8ArrayTestFunc,
  SetTestFunc, MapTestFunc, simpleSendableClassTestFunc, Uint8ClampedArrayTestFunc, testWithThreeParams, testWithArray,
  sendableFuncTest, sendableClassTest, promiseTest, measureTest, loop, returnError, longString, sendableClassArrFunc,
  promiseNumber, TreeSetTestFunc, getCreateTaskId, taskSendManyFunc, taskErrFunc } from './testFunclist'
import { A, B, StrCat, printArgs, printStrArgs, fun, cancelById, getLongString, getTaskResult } from './exportFunclist'
import { SendableClass, SimpleSendable, sendableFunc, SendableClassTest, TaskInfoClass } from './sendable';
import HashMap from '@ohos.util.HashMap';

export default function cancelTest() {
  describe('cancelTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   TaskPoolTestClass225
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0225
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.execute(task).catch(() => {
        str = 'cancel success';
        terminate = true;
      });
      setTimeout(() => {
        taskpool.cancel(task.taskId);
      }, 1000);

      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('cancel success');
      done();
    })


    /**
     * @tc.name   TaskPoolTestClass226
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0226
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.execute(task).catch(() => {
        str = 'cancel success';
        terminate = true;
      });
      let cancelTask = new taskpool.Task(cancelById, task.taskId);
      taskpool.execute(cancelTask);
      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('cancel success');
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass227
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0227
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);
        let start: number = new Date().getTime();
        while (new Date().getTime() - start < 1000) {
          continue;
        }
        taskpool.cancel(task1.taskId);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass228
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0228
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.executeDelayed(2000, task).catch(() => {
        str = 'cancel success';
        terminate = true;
      });
      let cancelTask = new taskpool.Task(cancelById, task.taskId);
      taskpool.execute(cancelTask);
      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('cancel success');
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass229
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0229
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      try {
        taskpool.cancel(task.taskId);
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass230
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0230
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let str = 'test';
      let task1 = new taskpool.Task(printArgs, 100);
      let task2 = new taskpool.Task(printArgs, 100);
      let task3 = new taskpool.Task(fun, str);
      let taskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      taskGroup.addTask(task3);
      let terminate = false;
      taskpool.execute(taskGroup).then(() => {
        str = 'finish success';
        terminate = true;
      }).catch(() => {
        terminate = true;
        str = 'cancel success';
      });
      setTimeout(() => {
        taskpool.cancel(task3.taskId);
      }, 1000);
      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('cancel success');
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass231
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0231
     * @tc.desc   test microjob in the taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let value: number = 500;
      let task: taskpool.Task = new taskpool.Task(promiseTest, value);
      let result = await taskpool.execute(task);
      expect(result).assertEqual(1000);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass232
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0232
     * @tc.desc   Test the ContainerScope and Measure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(measureTest);
      let result = await taskpool.execute(task);
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass234
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0234
     * @tc.desc   Test asyncRunnerTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let cancelNum = 0;
      let catchCount = 0;
      let asyncRunner:taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let size = 30;
      for (let i = 0; i < size; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        asyncRunner.execute(task).catch((e: BusinessError) => {
          catchCount++;
          if (e.code == 10200055) {
            cancelNum++;
          }
        })
        taskpool.cancel(task);
      }
      while (catchCount < size) {
        await promiseCase();
      }
      expect(cancelNum).assertEqual(size);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass235
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0235
     * @tc.desc   Test task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let cancelNum = 0;
      let catchCount = 0;
      let size = 20;
      for (let i = 0; i < size; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        taskpool.execute(task).catch((e: BusinessError) => {
          catchCount++;
          if (e.code == 0) {
            cancelNum++;
          }
        })
        taskpool.cancel(task);
      }
      let asyncRunner:taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let asyncSize = 10;
      let asyncCatchNum = 0;
      for (let i = 0; i < asyncSize; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        asyncRunner.execute(task).catch((e: BusinessError) => {
          catchCount++;
          if (e.code == 10200055) {
            asyncCatchNum++;
          }
        })
        taskpool.cancel(task);
      }
      while (catchCount < (size+asyncSize)) {
        await promiseCase();
      }
      expect(cancelNum).assertEqual(size);
      expect(asyncCatchNum).assertEqual(asyncSize);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass236
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0236
     * @tc.desc   Test waiting task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.executeDelayed(1000, task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 500);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass237
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0237
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 300);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass238
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0238
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass239
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0239
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:string = "";
      let task = new taskpool.Task(returnError, 1000);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = (e.data.result as object).toString();
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 500);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual("Error: this is return error");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass240
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0240
     * @tc.desc   Test running asyncTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let runner = new taskpool.AsyncRunner(1,1);
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        code = e.code;
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 300);

      while (!terminate) {
