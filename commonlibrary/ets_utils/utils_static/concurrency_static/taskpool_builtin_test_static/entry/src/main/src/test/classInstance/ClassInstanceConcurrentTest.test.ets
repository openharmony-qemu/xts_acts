'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

class DataClass {
  value: number = 0;
}

function testClassNoLock(data: DataClass): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      data.value = data.value + 1;
    } catch (e) {
      // 竞态容忍
    }
  }
}

function testClassMutex(data: DataClass, mutex: Mutex, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      data.value = data.value + 1;
    } finally {
      mutex.unlock();
    }
    taskCounter.fetchAdd(1);
  }
}

function testClassWorkerLocal(wl: WorkerLocal<DataClass>, failCount: AtomicInt): void {
  let data: DataClass = new DataClass();
  wl.set(data);
  for (let i: number = 0; i < 10; i++) {
    data.value = data.value + 1;
  }
  let check: DataClass | undefined = wl.get();
  if (check === undefined || check === null || check.value != 10) {
    failCount.fetchAdd(1);
  }
}

function testClassStress(data: DataClass, mutex: Mutex, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 100; i++) {
    mutex.lock();
    try {
      data.value = data.value + 1;
    } finally {
      mutex.unlock();
    }
    taskCounter.fetchAdd(1);
  }
}

export default function ClassInstanceConcurrentTest(): void {
  describe('ClassInstanceConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CLASSINSTANCE_NOLOCK_0100
     * @tc.name   testClassNoLockConcurrent0100
     * @tc.desc   CON-040 普通类无锁竞态并发属性修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClassNoLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let data: DataClass = new DataClass();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testClassNoLock, data).then((): void => { count.fetchAdd(1); });
      }
      testClassNoLock(data);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CLASSINSTANCE_MUTEX_0200
     * @tc.name   testClassMutexConcurrent0200
     * @tc.desc   CON-041 普通类Mutex保护并发属性修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClassMutexConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let taskCounter: AtomicInt = new AtomicInt(0);
      let data: DataClass = new DataClass();
      let mutex: Mutex = new Mutex();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testClassMutex, data, mutex, taskCounter).then((): void => { });
      }
      testClassMutex(data, mutex, taskCounter);
      while (taskCounter.load() < totalTasks * 10 + 10) {
        await Utils.msSleep(100);
      }
      expect(data.value).assertEqual(totalTasks * 10 + 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CLASSINSTANCE_WORKERLOCAL_0300
     * @tc.name   testClassWorkerLocalConcurrent0300
     * @tc.desc   CON-042 普通类WorkerLocal线程隔离实例
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClassWorkerLocalConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let failCount: AtomicInt = new AtomicInt(0);
      let wl: WorkerLocal<DataClass> = new WorkerLocal<DataClass>();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testClassWorkerLocal, wl, failCount).then((): void => { count.fetchAdd(1); });
      }
      testClassWorkerLocal(wl, failCount);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
      expect(failCount.load()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CLASSINSTANCE_EA_WORKER_0400
     * @tc.name   testClassEAWorkerConcurrent0400
     * @tc.desc   CON-045 普通类EAWorker并发属性修改
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClassEAWorkerConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let data: DataClass = new DataClass();
      let workers: EAWorker[] = [];
      let totalWorkers: int = 5;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_class_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        workers[i].run<void>((d: DataClass, c: AtomicInt): void => {
          for (let j: int = 0; j < 10; j++) {
            try {
              d.value = d.value + 1;
            } catch (e) {
              // 竞态容忍
            }
          }
          c.fetchAdd(1);
        }, data, count);
      }
      while (count.load() < totalWorkers) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalWorkers);
      for (let i: int = 0; i < workers.length; i++) {
        workers[i].join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CLASSINSTANCE_MUTEX_STRESS_0500
     * @tc.name   testClassMutexStressConcurrent0500
     * @tc.desc   CON-046 普通类100线程Mutex保护并发属性修改压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClassMutexStressConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let taskCounter: AtomicInt = new AtomicInt(0);
      let data: DataClass = new DataClass();
      let mutex: Mutex = new Mutex();
      let totalTasks: number = 100;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testClassStress, data, mutex, taskCounter).then((): void => { });
      }
      while (taskCounter.load() < totalTasks * 100) {
        await Utils.msSleep(100);
      }
      expect(data.value).assertEqual(totalTasks * 100);
    });
  });
}
