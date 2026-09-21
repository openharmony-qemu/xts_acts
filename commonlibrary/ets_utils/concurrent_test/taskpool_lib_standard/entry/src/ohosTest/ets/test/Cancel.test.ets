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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium-dynamic'
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0451
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0452
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0453
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0454
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0455
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0456
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0457
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0458
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0459
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0460
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0461
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0462
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0463
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0464
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0465
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
        await promiseCase();
      }
      expect(error).assertEqual("The asyncRunner task has been canceled.");
      expect(result).assertEqual(0);
      expect(code).assertEqual(10200055);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass241
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0466
     * @tc.desc   Test running asyncTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      expect(code).assertEqual(10200055);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass242
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0467
     * @tc.desc   Test waiting asyncTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let task2 = new taskpool.Task(loop);
      let runner = new taskpool.AsyncRunner(1,1);
      runner.execute(task);
      runner.execute(task2).catch((e:BusinessError<taskpool.TaskResult>) => {
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
        taskpool.cancel(task2.taskId);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("The asyncRunner task has been canceled.");
      expect(result).assertEqual(undefined);
      expect(code).assertEqual(10200055);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass243
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0468
     * @tc.desc   Test running asyncTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(delaySum, 10, 20, 500);
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
        await promiseCase();
      }
      expect(error).assertEqual("The asyncRunner task has been canceled.");
      expect(result).assertEqual(30);
      expect(code).assertEqual(10200055);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass244
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0469
     * @tc.desc   Test running sequenceTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let runner = new taskpool.SequenceRunner();
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
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      expect(code).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass245
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0470
     * @tc.desc   Test running sequenceTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let runner = new taskpool.SequenceRunner();
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
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
     * @tc.name   TaskPoolTestClass246
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0471
     * @tc.desc   Test running sequenceTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(delaySum, 10, 20, 1000);
      let runner = new taskpool.SequenceRunner();
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
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
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass247
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0472
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.executeDelayed(500, task).catch((e:BusinessError<taskpool.TaskResult>) => {
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
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      expect(code).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass248
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0473
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.executeDelayed(500, task).catch((e:BusinessError<taskpool.TaskResult>) => {
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
      }, 1300);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass249
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0474
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(longString, 500);
      taskpool.executeDelayed(500, task).catch((e:BusinessError<taskpool.TaskResult>) => {
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
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(getLongString());
      expect(code).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass250
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0475
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task1 = new taskpool.Task(delaySum, 10, 10, 300);
      let task2 = new taskpool.Task(delaySum, 20, 10, 800);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task1);
      }, 200);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass251
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0476
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task1 = new taskpool.Task(delaySum, 10, 10, 300);
      let task2 = new taskpool.Task(delaySum, 20, 10, 800);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(group);
      }, 200);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass252
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0477
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task1 = new taskpool.Task(loop);
      let task2 = new taskpool.Task(loop);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task1);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass253
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0478
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task1 = new taskpool.Task(longString, 1000);
      let task2 = new taskpool.Task(longString, 2000);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task1.taskId);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(getLongString());
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass254
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0479
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.LongTask(delaySum, 10, 10, 1000);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
          taskpool.terminateTask(task);
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
      expect(result).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass255
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0480
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.LongTask(loop);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
          taskpool.terminateTask(task);
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
     * @tc.name   TaskPoolTestClass256
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0481
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.LongTask(loop);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
          taskpool.terminateTask(task);
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
     * @tc.name   TaskPoolTestClass257
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0482
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:number = -1;
      let size = 1024;
      let arr = new collections.Array<SendableClass>()
      for (let i = 0; i < size; i++) {
        arr.push(new SendableClass(i));
      }
      let task: taskpool.Task = new taskpool.Task(sendableClassArrFunc, arr);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            let res = e.data.result as collections.Array<SendableClass>;
            result = res.length;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 400);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(size);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass258
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0483
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:number = -1;
      let size = 1024;
      let arr = new collections.Array<SendableClass>()
      for (let i = 0; i < size; i++) {
        arr.push(new SendableClass(i));
      }
      let task: taskpool.Task = new taskpool.Task(sendableClassArrFunc, arr);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            let res = e.data.result as collections.Array<SendableClass>;
            result = res.length;
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
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass259
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0484
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:number = -1;
      let value: number = 500;
      let task: taskpool.Task = new taskpool.Task(promiseNumber, value);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as number;
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
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(value);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass260
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0485
     * @tc.desc   taskpool support TreeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let treeSet = new TreeSet<number>();
      treeSet.add(5);
      treeSet.add(1);
      treeSet.add(2);
      let task: taskpool.Task = new taskpool.Task(TreeSetTestFunc, treeSet);
      let res: TreeSet<number> = await taskpool.execute(task) as TreeSet<number>;
      expect(res.length).assertEqual(4);
      expect(res.has(4)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass261
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0486
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        taskpool.getTask(null);
      } catch (e) {
        expect((e as BusinessError).toString()).assertContain("Parameter error");
      }
      try {
        taskpool.getTask(undefined);
      } catch (e) {
        expect((e as BusinessError).toString()).assertContain("Parameter error");
      }

      let task: taskpool.Task |undefined = taskpool.getTask(0);
      expect(task).assertEqual(undefined);

      let task2: taskpool.Task |undefined = taskpool.getTask(-1);
      expect(task2).assertEqual(undefined);

      let task3: taskpool.Task |undefined = taskpool.getTask(1.1);
      expect(task3).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass262
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0487
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(promiseNumber, 1000);
      try {
        taskpool.getTask(task.taskId, null);
      } catch (e) {
        expect((e as BusinessError).toString()).assertContain("Parameter error");
      }

      let task2: taskpool.Task |undefined = taskpool.getTask(task.taskId, "");
      expect(task2).assertEqual(undefined);

      let task3: taskpool.Task |undefined = taskpool.getTask(task.taskId, "default");
      expect(task3).assertEqual(undefined);

      let task4: taskpool.Task |undefined = taskpool.getTask(task.taskId, "PromiseNumber");
      expect(task4).assertEqual(undefined);

      let task5: taskpool.Task |undefined = taskpool.getTask(task.taskId, "promiseNumber");
      expect(task5).assertEqual(task);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass263
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0488
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
      let terminate = false;
      taskpool.execute(getTaskResult, task.taskId).then((res) => {
        terminate = true;
        expect(res).assertFalse();
      }).catch(() => { console.error('catch error'); })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass264
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0489
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let terminate = false;
      taskpool.execute(getCreateTaskId).then((res) =>{
        terminate = true;
        let task: taskpool.Task | undefined = taskpool.getTask(res as number);
        expect(task).assertEqual(undefined);
      }).catch(() => { console.error('catch error'); })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass265
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0490
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ss: worker.ThreadWorker = new worker.ThreadWorker("../workers/worker1.ets")
      let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
      ss.postMessage(task.taskId);
      let flag:boolean = false;
      let result:boolean = true;
      ss.onmessage = (e: MessageEvents) => {
        flag = true
        ss.terminate();
        result = e.data;
      }
      while (!flag) {
        await promiseCase()
      }
      expect(result).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass266
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0491
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ss: worker.ThreadWorker = new worker.ThreadWorker("../workers/worker2.ets")
      ss.postMessage("hello");
      let flag:boolean = false;
      let result:boolean = true;
      ss.onmessage = (e: MessageEvents) => {
        flag = true
        ss.terminate();
        result = e.data;
      }
      while (!flag) {
        await promiseCase()
      }
      expect(result).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass267
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0492
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
      let task1: taskpool.Task | undefined = taskpool.getTask(task.taskId, task.name);
      expect(task1!.taskId).assertEqual(task.taskId);
      expect(task1!.name).assertEqual(task.name);
      expect(task1!.function).assertEqual(task.function);
      expect(task1!.arguments).assertEqual(task.arguments);
      expect(task1!.totalDuration).assertEqual(task.totalDuration);
      expect(task1!.ioDuration).assertEqual(task.ioDuration);
      expect(task1!.cpuDuration).assertEqual(task.cpuDuration);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass268
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0493
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let class1 = new TaskInfoClass();
      let task: taskpool.Task = new taskpool.Task(taskSendManyFunc, 10, 20);
      taskpool.execute(task).then(() => {
        class1.increaseCount();
      }).catch(() => { console.error('catch error'); })
      let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
      task2?.onReceiveData(() => {
        class1.increaseOnReceicve();
      })
      expect(task2!.isDone()).assertEqual(false);
      while (await class1.getCount() < 1) {
        await promiseCase()
      }
      expect(await class1.getOnReceicve()).assertEqual(20);
      expect(task2!.isDone()).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass269
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0494
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let class1 = new TaskInfoClass();
      let task: taskpool.Task = new taskpool.Task(taskSendManyFunc, 10, 20);
      let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
      task2?.onExecutionSucceeded(() => {
        class1.increaseExecuteSuccess();
      })
      task2?.onEnqueued(() => {
        class1.increaseEnqueue();
      })
      task2?.onStartExecution(() => {
        class1.increaseStartExecute();
      })
      task2?.onReceiveData(() => {
        class1.increaseOnReceicve();
      })
      taskpool.execute(task2).then(() => {
        class1.increaseCount();
      }).catch(() => {
        class1.increaseErrCount()
      })

      while (await class1.getCount() < 1) {
        await promiseCase()
      }
      expect(await class1.getEnqueue()).assertEqual(1);
      expect(await class1.getStartExecute()).assertEqual(1);
      expect(await class1.getExecuteSuccess()).assertEqual(1);
      expect(await class1.getOnReceicve()).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass270
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0495
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let class1 = new TaskInfoClass();
      let task: taskpool.Task = new taskpool.Task(taskErrFunc, 50);
      let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
      task2?.onExecutionFailed(() => {
        class1.increaseExecuteFailed();
      })
      task2?.onEnqueued(() => {
        class1.increaseEnqueue();
      })
      task2?.onStartExecution(() => {
        class1.increaseStartExecute();
      })
      taskpool.execute(task2).then(() => {
        class1.increaseCount();
      }).catch(() => {
        class1.increaseErrCount()
      })

      while (await class1.getErrCount() < 1) {
        await promiseCase()
      }
      expect(await class1.getEnqueue()).assertEqual(1);
      expect(await class1.getStartExecute()).assertEqual(1);
      expect(await class1.getExecuteFailed()).assertEqual(1);
      done();
    })
  })
}
