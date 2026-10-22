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
import {
  asyncLock,
  asyncLock1,
  asyncLock2,
  asyncLock3,
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  printArgs7,
  printArgs8,
  printArgs9
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2 } from '../testability/pages/DataFlg';
import { AsyncLockTest, AsyncLockTestCatch,
  AsyncLockTestFinally,
  AsyncLockTestThen } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolErrorSuccessTest(): void {
  describe('taskPoolErrorSuccessTest', (): void => {
    // Each case validates a distinct callback path; serially repeating the same TaskGroup adds no coverage.
    const repeatCount: number = 1;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach((): void => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_0100
     * @tc.desc   test ErrorSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolTaskGroupExecuteStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printArgs1, 1.0);
        taskGroup.addTask(printArgs3, 1.0);

        Count1.count = 0
        Count2.count = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            Count1.count += 1;
          } catch (err) {
            Count2.count += 1;
            console.error('=======', JSON.stringify(err));
          }
        }

        let _waitStart: number = Date.now();
        while (Count2.count < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }
        expect(0).assertEqual(Count1.count)
        expect(repeatCount).assertEqual(Count2.count)
        Count1.count = 0
        Count2.count = 0
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_0200
     * @tc.desc   Verify taskpool.execute(TaskGroup) rejects when a group containing preconstructed Task objects has one successful task and one throwing task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolTaskGroupExecuteStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs3, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);

        Count1.count = 0
        Count2.count = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            Count1.count += 1;
          } catch (err) {
            Count2.count += 1;
            console.error('=======', JSON.stringify(err));
          }
        }

        let _waitStart: number = Date.now();
        while (Count2.count < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }
        expect(0).assertEqual(Count1.count)
        expect(repeatCount).assertEqual(Count2.count)
        Count1.count = 0
        Count2.count = 0
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskErrorSuccessTestStatic0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_0500
     * @tc.desc   test onReceiveData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskErrorSuccessTestStatic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs7, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs8, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task)
        taskGroup.addTask(task2)
        let count: number = 0
        let count2: number = 0

        task.onReceiveData((num: number) => {
          console.info('======num',num)
          count += num
        });
        task2.onReceiveData((num: number) => {
          console.info(`gate-num: ${num}`);
          try {
            let s: string[] = []
            throw new Error('Expected failure for callback-path validation');
          } catch (e) {
  console.info(`gate-cb-catch: ${e}`);
            count2 += 1
          }
        })

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup)
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
        }

        let _waitStart: number = Date.now();
        while (count < repeatCount || count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }
        expect(repeatCount).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskErrorSuccessTestStatic0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskErrorSuccessTestStatic0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_0600
     * @tc.desc   test Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskErrorSuccessTestStatic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task)
        taskGroup.addTask(task2)
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count += 1;
            let s: string[] = [];
            throw new Error('Expected failure for callback-path validation');
          } catch (error) {
            count2++;
          }

        }

        let _waitStart: number = Date.now();
        while (count < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(repeatCount).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskErrorSuccessTestStatic0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskErrorSuccessTestStatic0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_0700
     * @tc.desc   test Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskErrorSuccessTestStatic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            try {
              await taskpool.execute(taskGroup);
              count += 1;
              let first: string[] = [];
              throw new Error('Expected failure for callback-path validation');
            } catch (firstError) {
              let second: string[] = [];
              throw new Error('Expected failure for callback-path validation');
            }
          } catch (secondError) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(repeatCount).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskErrorSuccessTestStatic0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskErrorSuccessTestStatic0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_0800
     * @tc.desc   test Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskErrorSuccessTestStatic0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskPoolTaskErrorSuccessTestStatic0800';
      try {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            try {
              await taskpool.execute(taskGroup);
              count += 1;
            } finally {
              let s: string[] = [];
              throw new Error('Expected failure for callback-path validation');
            }
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(repeatCount).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error(`${caseName} failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_0900
     * @tc.desc   test asyncLock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTest()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count += 1;
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskErrorSuccessTestStatic1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1100
     * @tc.desc   test onExecutionFailed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskErrorSuccessTestStatic1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let task: taskpool.Task = new taskpool.Task(printArgs3, 1.0);
      let task2: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      task.onExecutionFailed((error: Error): void => {
        console.info(`gate-failed: ${error}`);
        count++
      });
      task2.onExecutionFailed((e:Error)=>{
        try {
          let s: string[] = []
          throw new Error('Expected failure for callback-path validation');
        } catch (e) {
console.info(`gate-cb-catch: ${e}`);
          count2++
        }
      })

      for (let i: number = 0; i < repeatCount; i++) {
        try {
          await taskpool.execute(taskGroup);
          console.info("taskpool: execute task success");
        } catch (err) {
          console.info("taskpool: execute task failed as expected");
        }
      }

      const deadline: number = Date.now() + 5000;
      while ((count + count2) < repeatCount * 2 && Date.now() < deadline) {
        try {
          await sleep(100)
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      }

      expect(repeatCount * 2).assertEqual(count + count2)
      done()
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1200
     * @tc.desc   test asyncLock-then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTestThen()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count += 1;
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic1200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1300
     * @tc.desc   test asyncLock-catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTestCatch()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic1300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1400
     * @tc.desc   test asyncLock-finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTestFinally()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic1400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1500
     * @tc.desc   Verify taskpool.execute(TaskGroup) rejects when a task's awaited AsyncLock operation throws from a finally callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTestFinally()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic1500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1600
     * @tc.desc   Verify taskpool.execute(TaskGroup) rejects when asyncLock2 awaits an AsyncLock operation that throws from finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTestFinally()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic1600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1700
     * @tc.desc   test task-finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTestFinally()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic1700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1800
     * @tc.desc   test task-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTest()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic1800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_1900
     * @tc.desc   test task-setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs9, 1.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          count += 1
            count2 ++
        }

        let _waitStart: number = Date.now();
        while (count < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(repeatCount).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic1900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_2000
     * @tc.desc   test async-error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTest()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
            expect(error instanceof Error).assertTrue();
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic2000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_2100
     * @tc.desc   test await-error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTest()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0
        let errorCaught: boolean = false

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
            errorCaught = error instanceof Error;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
        expect(errorCaught).assertTrue()
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic2100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_2200
     * @tc.desc   Verify awaiting taskpool.execute(TaskGroup) catches an Error when a task's AsyncLock finally callback throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTestFinally()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
            expect(error instanceof Error).assertTrue();
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
      } catch (error) {
        console.error("testTaskPoolTaskGroupExecuteStatic2200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_2300
     * @tc.desc   Verify awaiting taskpool.execute(TaskGroup) enters the catch path when asyncLock2 receives an Error from AsyncLockTestFinally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTaskPoolTaskGroupExecuteStatic2300';
      try {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

        let asyncLockTest = new AsyncLockTestFinally()
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
        let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        taskGroup.addTask(task2);
        let count: number = 0
        let count2: number = 0
        let errorCaught: boolean = false

        for (let i: number = 0; i < repeatCount; i++) {
          try {
            await taskpool.execute(taskGroup);
            count++;
          } catch (error) {
            count2++;
            errorCaught = error instanceof Error;
          }
        }

        let _waitStart: number = Date.now();
        while (count2 < repeatCount) {
          if (Date.now() - _waitStart > 5000) {
            expect().assertFail();
            break;
          }
          await sleep(300)
        }

        expect(0).assertEqual(count)
        expect(repeatCount).assertEqual(count2)
        expect(errorCaught).assertTrue()
      } catch (error) {
        console.error(`${caseName} failed`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskPoolTaskGroupExecuteStatic2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ERRORSUCCESS_2400
     * @tc.desc   test await-finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskPoolTaskGroupExecuteStatic2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.

      let asyncLockTest = new AsyncLockTestFinally()
      let task: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
      let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();

      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      let count: number = 0
      let count2: number = 0

      for (let i: number = 0; i < repeatCount; i++) {
        try {
          await taskpool.execute(taskGroup);
          count++;
        } catch (error) {
          count2++;
        }
      }

      let _waitStart: number = Date.now();
      while (count2 < repeatCount) {
        if (Date.now() - _waitStart > 5000) {
          expect().assertFail();
          break;
        }
        try {
          await sleep(300)
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
      }

      expect(0).assertEqual(count)
      expect(repeatCount).assertEqual(count2)
      done()
    })

  })
}
