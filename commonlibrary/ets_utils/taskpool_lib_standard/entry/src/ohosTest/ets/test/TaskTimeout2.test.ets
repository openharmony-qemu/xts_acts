/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';
import {
  asyncRunnerNestedGroup,
  asyncRunnerNestedTask,
  asyncRunnerTaskNestedTimeout,
  delayedNestedTask,
  demoSenddata,
  level1Task,
  level3Task,
  longTaskNestedGroup,
  longTaskNestedTimeout,
  nestedDifferentTimeout,
  nestedInnerCancelExceptionTimeout,
  nestedInnerExceptionTask,
  nestedInnerTimeout1Task,
  nestedInnerTimeoutTask,
  nestedOuterCancelTask,
  nestedOuterCompleteTask,
  nestedOuterTask,
  nestedTaskGroupTask,
  nestedTimeoutTask,
  outerAwaitMultipleTimeout,
  periodicTaskInner,
  rejectTaskLong,
  rejectTaskShort,
  sendableClassWithTime,
  sequenceRunnerNestedGroup,
  sequenceRunnerNestedTask,
  setTransferListTestWithTime,
  taskAsyncRunnerInnerLongOuterShort,
  taskAsyncRunnerInnerShortOuterLong,
  taskError,
  taskGroupAsyncRunnerInnerLongOuterShort,
  taskGroupAsyncRunnerInnerShortOuterLong,
  taskGroupSequenceRunnerInnerLongOuterShort,
  taskGroupSequenceRunnerInnerShortOuterLong,
  taskSequenceRunnerInnerLongOuterShort,
  taskSequenceRunnerInnerShortOuterLong,
  timeoutDemo,
  timeoutWithLongTask
} from '../utils/TimeoutFuncList';
import { promiseCase } from './testFunclist';
import { SendableClassTest, sendableFunc } from './sendable';
import { level2Task } from '../utils/TimeoutFunc2';
import { nestPeriodicTaskInner } from '../utils/TimeoutFunc3';

export default function TaskTimeout2Test() {
  describe('ActTaskTimeout2Test', () => {
    /**
     * @tc.name   TaskTimeout2TestClass001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0339
     * @tc.desc   HIGH priority + short timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass001';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task, { priority: taskpool.Priority.HIGH, timeout: 50 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0340
     * @tc.desc   LOW priority + long timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass002';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task, { priority: taskpool.Priority.LOW, timeout: 200 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);
      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0341
     * @tc.desc   IDLE priority + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass003';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 600);
      taskpool.execute(task, { priority: taskpool.Priority.IDLE, timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0342
     * @tc.desc   Multiple tasks with different priorities and same timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass004';
      console.log(`${caseName} start.`);
      let count = 0;
      let isTerminate = false;
      let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 200);

      taskpool.execute(task1, { priority: taskpool.Priority.HIGH, timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch task1: ${e}`);
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(task2, { priority: taskpool.Priority.MEDIUM, timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch task2: ${e}`);
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(task3, { priority: taskpool.Priority.LOW, timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch task3: ${e}`);
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      });

      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0343
     * @tc.desc   Task + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass005';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      taskpool.execute(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0344
     * @tc.desc   GenericsTask + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass006';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.GenericsTask<[number], number> =
        new taskpool.GenericsTask<[number], number>(timeoutDemo, 200);
      taskpool.execute<[number], number>(task, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0345
     * @tc.desc   TaskGroup + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass007';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timeoutDemo, 200);
      taskGroup.addTask(timeoutDemo, 200);
      taskpool.execute(taskGroup, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200070);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0346
     * @tc.desc   Mixed task group + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass008';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timeoutDemo, 100);
      taskGroup.addTask(timeoutDemo, 500);
      taskGroup.addTask(timeoutDemo, 1200);
      taskpool.execute(taskGroup, { timeout: 1000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200070);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0347
     * @tc.desc   Multiple timeout tasks concurrent execution
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass009';
      console.log(`${caseName} start.`);
      let count = 0;
      let isTerminate = false;
      let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task3: taskpool.Task = new taskpool.Task(timeoutDemo, 200);

      taskpool.execute(task1, { timeout: 100 }).catch((e: BusinessError) => {
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(task2, { timeout: 100 }).catch((e: BusinessError) => {
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      })
      taskpool.execute(task3, { timeout: 100 }).catch((e: BusinessError) => {
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 3) {
          isTerminate = true;
        }
      });

      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0348
     * @tc.desc   Timeout task and normal task concurrent
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass010';
      console.log(`${caseName} start.`);
      let count = 0;
      let isTerminate = false;
      let task1: taskpool.Task = new taskpool.Task(timeoutDemo, 200);
      let task2: taskpool.Task = new taskpool.Task(timeoutDemo, 100);

      taskpool.execute(task1, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        count++;
        expect(e.code).assertEqual(10200058);
        if (count >= 2) {
          isTerminate = true;
        }
      })
      taskpool.execute(task2).then(() => {
        count++;
        console.log(`${caseName} then`);
        if (count >= 2) {
          isTerminate = true;
        }
      });

      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0349
     * @tc.desc   Multiple task groups concurrent timeout execution
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass011';
      console.log(`${caseName} start.`);
      let count = 0;
      let isTerminate = false;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(timeoutDemo, 200);
      taskGroup2.addTask(timeoutDemo, 200);

      taskpool.execute(taskGroup1, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch taskGroup1: ${e}`);
        count++;
        expect(e.code).assertEqual(10200070);
        if (count >= 2) {
          isTerminate = true;
        }
      })
      taskpool.execute(taskGroup2, { timeout: 100 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch taskGroup2: ${e}`);
        count++;
        expect(e.code).assertEqual(10200070);
        if (count >= 2) {
          isTerminate = true;
        }
      });

      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0350
     * @tc.desc   Timeout task + ArrayBuffer parameters
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass012';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(setTransferListTestWithTime, new Uint8Array(new ArrayBuffer(8)),
        new Uint8Array(new ArrayBuffer(8)), 500);
      taskpool.execute(task, { timeout: 1000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(16);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0351
     * @tc.desc   Timeout task + Sendable object
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass013';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let classTest: SendableClassTest = new SendableClassTest(sendableFunc);
      let task = new taskpool.Task(sendableClassWithTime, classTest, 500);
      taskpool.execute(task, { timeout: 1000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(600);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0352
     * @tc.desc   Timeout task + setTransferList
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass014';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(setTransferListTestWithTime, new Uint8Array(new ArrayBuffer(8)),
        new Uint8Array(new ArrayBuffer(8)), 500);
      task.setTransferList([new ArrayBuffer(8)]);
      taskpool.execute(task, { timeout: 1000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(16);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0353
     * @tc.desc   Timeout task + setCloneList
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass015';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let classTest: SendableClassTest = new SendableClassTest(sendableFunc);
      let task = new taskpool.Task(sendableClassWithTime, classTest, 500);
      task.setCloneList([classTest]);
      taskpool.execute(task, { timeout: 1000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(600);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0354
     * @tc.desc   Nested timeout task inside normal task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass016';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedOuterTask, 100);
      taskpool.execute(task, { timeout: 2000 }).catch((e: BusinessError) => {
        isTerminate = true;
        console.log(`${caseName} error: ${e.code}, ${e.message}`)
        expect(e.code).assertContain(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0355
     * @tc.desc   Nested timeout task inside timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass017';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedTimeoutTask, 100);
      taskpool.execute(task, { timeout: 2000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0356
     * @tc.desc   Nested timeout task inside timeout task with different timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass018';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedDifferentTimeout, 100);
      taskpool.execute(task, { timeout: 3000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0357
     * @tc.desc   Nested timeout task group inside timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass019';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(nestedTaskGroupTask, 100);
      taskpool.execute(task, { timeout: 3000 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.toString()).assertContain(10200070);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0358
     * @tc.desc   Multi-layer nested timeout tasks
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass020';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      taskpool.execute(new taskpool.Task(level1Task), { timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0359
     * @tc.desc   Timeout task await multiple timeout tasks
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass021';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task = new taskpool.Task(outerAwaitMultipleTimeout);
      taskpool.execute(task, { timeout: 5000 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        let data = res as Array<number>
        expect(data.length).assertEqual(2);
        expect(data[0]).assertEqual(100);
        expect(data[1]).assertEqual(100);

      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0360
     * @tc.desc   AsyncRunner task with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass022';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let task = new taskpool.Task(asyncRunnerNestedTask);
      runner.execute(task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200016);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0361
     * @tc.desc   SequenceRunner task with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass023';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task = new taskpool.Task(sequenceRunnerNestedTask);
      runner.execute(task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertContain(10200016);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0362
     * @tc.desc   AsyncRunner task with nested timeout task group
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass024';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let task = new taskpool.Task(asyncRunnerNestedGroup);
      runner.execute(task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0363
     * @tc.desc   SequenceRunner task with nested timeout task group
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass025';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task = new taskpool.Task(sequenceRunnerNestedGroup);
      runner.execute(task).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase();
      }
      expect(isTerminate).assertEqual(true);
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0364
     * @tc.desc   AsyncRunner onReceiveData with nested timeout task
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass026';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let count = 0;
      let task1 = new taskpool.Task(demoSenddata, 300);
      task1.onReceiveData((data: number) => {
        count++;
        if (count === 2) {
          let innerTask = new taskpool.Task(timeoutDemo, 200);
          taskpool.execute(innerTask, { timeout: 100 }).catch((e: BusinessError) => {
            console.log(`${caseName} catch innerTask: ${e}`);
            isTerminate = true;

            expect(e.code).assertEqual(10200058);
          })
        }
      })
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0366
     * @tc.desc   Timeout task nested in onExecutionSucceeded
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass028';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(timeoutDemo, 100);
      task1.onExecutionSucceeded(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1).then(() => {
        console.info(`${caseName} execute task1 then`);
      }).catch((e: BusinessError) => {
        console.info(`${caseName} catch task1: ${e.message}`);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0367
     * @tc.desc   Timeout task nested in onExecutionFailed
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass029';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(taskError, 100);
      task1.onExecutionFailed(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      taskpool.execute(task1).catch((e: BusinessError) => {
        console.log(`${caseName} catch task1: ${e}`);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0368
     * @tc.desc   Timeout task nested in onReceiveData
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass030';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let count = 0;
      let task1 = new taskpool.Task(demoSenddata, 300);
      task1.onReceiveData((data: number) => {
        count++;
        if (count === 2) {
          let innerTask = new taskpool.Task(timeoutDemo, 200);
          taskpool.execute(innerTask, { timeout: 100 }).catch((e: BusinessError) => {
            console.log(`${caseName} catch innerTask: ${e}`);
            isTerminate = true;
            expect(e.code).assertEqual(10200058);
          })
        }
      })
      taskpool.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0369
     * @tc.desc   Timeout task nested in onEnqueued
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass031';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(timeoutDemo, 100);
      task1.onEnqueued(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      taskpool.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0370
     * @tc.desc   Timeout task nested in onStartExecution
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass032';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(timeoutDemo, 100);
      task1.onStartExecution(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      })
      taskpool.execute(task1);
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0371
     * @tc.desc   Timeout task nested in Promise.then
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass033';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task1).then(() => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
        })
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0372
     * @tc.desc   Timeout task nested in Promise.catch
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass034';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task1 = new taskpool.Task(taskError, 100);
      taskpool.execute(task1).catch((e: BusinessError) => {
        let innerTask = new taskpool.Task(timeoutDemo, 300);
        taskpool.execute(innerTask, { timeout: 200 }).catch((e: BusinessError) => {
          console.log(`${caseName} catch innerTask: ${e}`);
          isTerminate = true;
          expect(e.code).assertEqual(10200058);
