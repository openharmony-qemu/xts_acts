'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

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
    it('testEAWorkerConstructorConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let w: EAWorker = new EAWorker('eaWorker_init');
      w.start();
      w.run<void>(testEAWorkerInitTask, counter);
      while (counter.load() < 10) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      w.join().Await();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0200
     * @tc.name   testEAWorkerRunConcurrent0200
     * @tc.desc   CON-083 EAWorker run任务并发提交验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerRunConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let totalWorkers: int = 5;
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
      while (counter.load() < totalWorkers * 10) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalWorkers * 10);
      joinWorkers(workers);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0300
     * @tc.name   testEAWorkerPostTaskConcurrent0300
     * @tc.desc   CON-084 EAWorker postTask任务并发提交验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerPostTaskConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let totalWorkers: int = 5;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_post_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        for (let j: int = 0; j < 10; j++) {
          workers[i].postTask((): void => { testEAWorkerPostTask(counter); });
        }
      }
      while (counter.load() < totalWorkers * 10) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalWorkers * 10);
      joinWorkers(workers);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0400
     * @tc.name   testEAWorkerQuitJoinConcurrent0400
     * @tc.desc   CON-085 EAWorker join终止并等待资源释放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerQuitJoinConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let w: EAWorker = new EAWorker('eaWorker_quit');
      w.start();
      w.run<void>(testEAWorkerInitTask, counter);
      while (counter.load() < 5) {
        await Utils.msSleep(100);
      }
      // 主线程应使用 join().Await() 回收线程；quit() 禁止在主线程调用
      w.join().Await();
      expect(counter.load() >= 5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_EAWORKER_0500
     * @tc.name   testEAWorkerStressConcurrent0500
     * @tc.desc   CON-088 EAWorker 10实例并发压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEAWorkerStressConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      // 50 个 EAWorker 易在全量/多轮压测下触发 LMK App died；10 实例仍覆盖多线程压力语义
      let totalWorkers: int = 10;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_stress_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        workers[i].run<void>(testEAWorkerStress, counter);
      }
      while (counter.load() < totalWorkers * 50) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalWorkers * 50);
      joinWorkers(workers);
    });
  });
}
