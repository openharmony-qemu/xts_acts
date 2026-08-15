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

function testEAWorkerInitTask(counter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    counter.fetchAdd(1);
  }
}

function testEAWorkerRunTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

function testEAWorkerPostTask(counter: AtomicInt): void {
  counter.fetchAdd(1);
}

function testEAWorkerStress(counter: AtomicInt): void {
  for (let i: number = 0; i < 50; i++) {
    counter.fetchAdd(1);
  }
}

function joinWorkers(workers: EAWorker[]): void {
  for (let i: int = 0; i < workers.length; i++) {
    workers[i].join().Await();
  }
}

export default function EAWorkerConcurrentTest(): void {
  describe('EAWorkerConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0100
     * @tc.name   testEAWorkerConstructorConcurrent0100
     * @tc.desc   CON-082 EAWorker constructor初始任务并发验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerConstructorConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let counter: AtomicInt = new AtomicInt(0);
      let w: EAWorker = new EAWorker('eaWorker_init');
      w.start();
      w.run<void>(testEAWorkerInitTask, counter);
      w.join().Await();
      expect(counter.load()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0200
     * @tc.name   testEAWorkerRunConcurrent0200
     * @tc.desc   CON-083 EAWorker run任务并发提交验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerRunConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let counter: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let totalWorkers: int = 2;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_run_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        for (let j: int = 0; j < 10; j++) {
          workers[i].run<void>(testEAWorkerRunTask, counter);
        }
      }
      joinWorkers(workers);
      expect(counter.load()).assertEqual(totalWorkers * 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0300
     * @tc.name   testEAWorkerPostTaskConcurrent0300
     * @tc.desc   CON-084 EAWorker postTask任务并发提交验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerPostTaskConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let counter: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let totalWorkers: int = 2;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_post_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        for (let j: int = 0; j < 10; j++) {
          workers[i].postTask((): void => {
            try {
              testEAWorkerPostTask(counter);
            } catch (e) {
              console.info(`testEAWorkerPostTaskConcurrent0300 catch error: ${JSON.stringify(e)}`);
            }
          });
        }
      }
      joinWorkers(workers);
      expect(counter.load()).assertEqual(totalWorkers * 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0400
     * @tc.name   testEAWorkerQuitJoinConcurrent0400
     * @tc.desc   CON-085 EAWorker join终止并等待资源释放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerQuitJoinConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let counter: AtomicInt = new AtomicInt(0);
      let w: EAWorker = new EAWorker('eaWorker_quit');
      w.start();
      w.run<void>(testEAWorkerInitTask, counter);
      // 主线程应使用 join().Await() 回收线程；quit() 禁止在主线程调用
      w.join().Await();
      expect(counter.load()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0500
     * @tc.name   testEAWorkerStressConcurrent0500
     * @tc.desc   CON-088 EAWorker多实例并发压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerStressConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let counter: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      // 32-bit ArkTS reserves a 2 MB stack per EAWorker; two workers retain cross-worker pressure coverage.
      let totalWorkers: int = 2;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_stress_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        workers[i].run<void>(testEAWorkerStress, counter);
      }
      joinWorkers(workers);
      expect(counter.load()).assertEqual(totalWorkers * 50);
    });
  });
}
