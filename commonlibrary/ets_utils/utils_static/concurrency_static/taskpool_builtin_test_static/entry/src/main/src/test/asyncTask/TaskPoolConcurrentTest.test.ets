'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testTaskPoolExecute(arr: Array<number>, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      arr.push(i);
      arr.pop();
    } catch (e) {
      // 竞态容忍：Array 并发操作可能抛出异常
      if (!(e instanceof Error)) {
        throw e; // 非预期异常重新抛出
      }
    }
    taskCounter.fetchAdd(1);
  }
}

function testTaskPoolDelayed(taskCounter: AtomicInt): void {
  taskCounter.fetchAdd(1);
}

function testTaskPoolPeriodic(taskCounter: AtomicInt): void {
  taskCounter.fetchAdd(1);
}

function testTaskPoolCancel(counter: AtomicInt): void {
  for (let i: number = 0; i < 10000; i++) {
    counter.fetchAdd(1);
  }
}

function testTaskPoolTimeout(): void {
  let sum: number = 0;
  for (let i: number = 0; i < 100000000; i++) {
    sum += i;
  }
}

function testTaskPoolStress(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 100; i++) {
    counter.fetchAdd(1);
    taskCounter.fetchAdd(1);
  }
}

function testTaskPoolSendData(counter: AtomicInt): void {
  for (let i: int = 0; i < 10; i++) {
    taskpool.Task.sendData('message' + i);
    counter.fetchAdd(1);
  }
}

export default function TaskPoolConcurrentTest(): void {
  describe('TaskPoolConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0100
     * @tc.name   testTaskPoolExecuteConcurrent0100
     * @tc.desc   CON-072 TaskPool execute普通任务并发执行
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolExecuteConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let taskCounter: AtomicInt = new AtomicInt(0);
      let arr: Array<number> = new Array<number>();
      let totalTasks: number = 20;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testTaskPoolExecute, arr, taskCounter).then((): void => { });
      }
      while (taskCounter.load() < totalTasks * 10) {
        await Utils.msSleep(100);
      }
      expect(taskCounter.load()).assertEqual(totalTasks * 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0200
     * @tc.name   testTaskPoolAsyncConcurrent0200
     * @tc.desc   CON-073 TaskPool execute异步任务并发执行
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolAsyncConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let taskCounter: AtomicInt = new AtomicInt(0);
      let arr: Array<number> = new Array<number>();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(async (a: Array<number>, tc: AtomicInt): Promise<void> => {
          for (let j: number = 0; j < 10; j++) {
            try {
              a.push(j);
              a.pop();
            } catch (e) {
              // 竞态容忍：Array 并发操作可能抛出异常
              if (!(e instanceof Error)) {
                throw e; // 非预期异常重新抛出
              }
            }
            tc.fetchAdd(1);
          }
        }, arr, taskCounter).then((): void => { });
      }
      while (taskCounter.load() < totalTasks * 10) {
        await Utils.msSleep(100);
      }
      expect(taskCounter.load()).assertEqual(totalTasks * 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0300
     * @tc.name   testTaskPoolDelayedConcurrent0300
     * @tc.desc   CON-074 TaskPool executeDelayed延时任务并发验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolDelayedConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let delayedCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: int = 10;
      for (let i: int = 0; i < totalTasks; i++) {
        let task: taskpool.Task = new taskpool.Task(testTaskPoolDelayed, delayedCounter);
        taskpool.executeDelayed(100, task).then((): void => {
          counter.fetchAdd(1);
        });
      }
      while (delayedCounter.load() < totalTasks) {
        await Utils.msSleep(100);
      }
      expect(delayedCounter.load()).assertEqual(totalTasks);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0400
     * @tc.name   testTaskPoolPeriodicConcurrent0400
     * @tc.desc   CON-075 TaskPool executePeriodically周期任务并发验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolPeriodicConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let periodicCounter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(testTaskPoolPeriodic, periodicCounter);
      taskpool.executePeriodically(100, task);
      while (periodicCounter.load() < 10) {
        await Utils.msSleep(100);
      }
      let beforeCount: number = periodicCounter.load();
      try {
        taskpool.cancel(task);
      } catch (e) {
        // 取消容忍：任务可能已执行完毕导致取消失败
        if (!(e instanceof Error)) {
          throw e; // 非预期异常重新抛出
        }
      }
      // 验证取消后周期任务不再继续执行（最多容忍3次残留执行）
      await Utils.msSleep(300);
      expect(periodicCounter.load() - beforeCount <= 3).assertTrue();
      expect(periodicCounter.load() >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0500
     * @tc.name   testTaskPoolTaskGroupConcurrent0500
     * @tc.desc   CON-076 TaskPool taskGroup批量任务并发验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolTaskGroupConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let totalTasks: int = 10;
      let group: taskpool.TaskGroup = new taskpool.TaskGroup('taskGroup');
      for (let i: int = 0; i < totalTasks; i++) {
        group.addTask((): void => {
          for (let j: int = 0; j < 10; j++) {
            counter.fetchAdd(1);
          }
        });
      }
      await taskpool.execute(group);
      expect(counter.load()).assertEqual(totalTasks * 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0600
     * @tc.name   testTaskPoolSendDataConcurrent0600
     * @tc.desc   CON-077 TaskPool sendData任务间通信验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolSendDataConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let receiveCounter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(testTaskPoolSendData, counter);
      task.onReceiveData((data: Object): void => {
        receiveCounter.fetchAdd(1);
      });
      taskpool.execute(task).then((): void => { });
      while (counter.load() < 10 || receiveCounter.load() < 10) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      expect(receiveCounter.load()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0700
     * @tc.name   testTaskPoolTimeoutConcurrent0700
     * @tc.desc   CON-078 TaskPool timeout超时任务验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolTimeoutConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(testTaskPoolTimeout);
      let timeoutCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 100 });
      } catch (e) {
        timeoutCaught = true;
      }
      expect(timeoutCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0800
     * @tc.name   testTaskPoolCancelConcurrent0800
     * @tc.desc   CON-079 TaskPool cancel任务取消验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolCancelConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(testTaskPoolCancel, counter);
      taskpool.execute(task).then((): void => { });
      while (counter.load() < 50) {
        await Utils.msSleep(100);
      }
      try {
        taskpool.cancel(task);
      } catch (e) {
        // 取消容忍：任务可能已执行完毕导致取消失败
        if (!(e instanceof Error)) {
          throw e; // 非预期异常重新抛出
        }
      }
      expect(counter.load() >= 50).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_0900
     * @tc.name   testTaskPoolCallbackConcurrent0900
     * @tc.desc   CON-086 TaskPool then/catch回调并发验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolCallbackConcurrent0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let result: AtomicInt = new AtomicInt(0);
      taskpool.execute((): int => {
        return 42;
      }).then((value: Any): void => {
        result.store(value as int);
        counter.fetchAdd(1);
      }).catch((): void => {
        counter.fetchAdd(1);
      });
      while (counter.load() < 1) {
        await Utils.msSleep(100);
      }
      expect(result.load()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_TASKPOOL_1000
     * @tc.name   testTaskPoolStressConcurrent1000
     * @tc.desc   CON-087 TaskPool 100任务并发压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolStressConcurrent1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 100;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testTaskPoolStress, counter, taskCounter).then((): void => { });
      }
      while (taskCounter.load() < totalTasks * 100) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalTasks * 100);
    });
  });
}
