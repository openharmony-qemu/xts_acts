'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testAtomicIntEAWorkerFetchAdd(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    counter.fetchAdd(1);
    taskCounter.fetchAdd(1);
  }
}

export default function AtomicIntEAWorkerConcurrentTest(): void {
  describe('AtomicIntEAWorkerConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_INT_EAWORKER_0100
     * @tc.name   testAtomicIntEAWorkerConcurrent0100
     * @tc.desc   CON-060 AtomicInt EAWorker并发fetchAdd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntEAWorkerConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let totalWorkers: int = 5;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_atomic_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        workers[i].run<void>(testAtomicIntEAWorkerFetchAdd, counter, taskCounter);
      }
      while (taskCounter.load() < totalWorkers * 10) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalWorkers * 10);
      for (let i: int = 0; i < workers.length; i++) {
        workers[i].join().Await();
      }
    });
  });
}
