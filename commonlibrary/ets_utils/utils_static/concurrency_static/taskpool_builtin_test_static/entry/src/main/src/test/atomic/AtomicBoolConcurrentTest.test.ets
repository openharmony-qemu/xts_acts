'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testAtomicBoolExchange(flag: AtomicBoolean, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    flag.exchange(!flag.load());
    taskCounter.fetchAdd(1);
  }
}

function testAtomicBoolStore(flag: AtomicBoolean, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    flag.store(true);
    taskCounter.fetchAdd(1);
  }
}

function testAtomicBoolLoad(flag: AtomicBoolean, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    flag.load();
    taskCounter.fetchAdd(1);
  }
}

export default function AtomicBoolConcurrentTest(): void {
  describe('AtomicBoolConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_BOOL_0100
     * @tc.name   testAtomicBoolExchangeConcurrent0100
     * @tc.desc   CON-058 AtomicBool多线程并发exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicBoolExchangeConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let flag: AtomicBoolean = new AtomicBoolean(false);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testAtomicBoolExchange, flag, taskCounter).then((): void => { });
      }
      testAtomicBoolExchange(flag, taskCounter);
      while (taskCounter.load() < totalTasks * 10 + 10) {
        await Utils.msSleep(100);
      }
      expect(taskCounter.load()).assertEqual(totalTasks * 10 + 10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_BOOL_0200
     * @tc.name   testAtomicBoolLoadStoreConcurrent0200
     * @tc.desc   CON-059 AtomicBool多线程并发load/store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicBoolLoadStoreConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let flag: AtomicBoolean = new AtomicBoolean(false);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 5;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testAtomicBoolStore, flag, taskCounter).then((): void => { });
      }
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testAtomicBoolLoad, flag, taskCounter).then((): void => { });
      }
      while (taskCounter.load() < totalTasks * 10 * 2) {
        await Utils.msSleep(100);
      }
      expect(taskCounter.load()).assertEqual(totalTasks * 10 * 2);
    });
  });
}
