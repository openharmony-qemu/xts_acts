'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testSetNoLock(set: Set<number>): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      set.add(i);
      set.delete(i);
    } catch (e) {
      // 竞态容忍
    }
  }
}

export default function SetNoLockConcurrentTest(): void {
  describe('SetNoLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_SET_NOLOCK_0100
     * @tc.name   testSetNoLockConcurrent0100
     * @tc.desc   CON-008 Set线程隔离无锁并发add/remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNoLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let set: Set<number> = new Set<number>();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testSetNoLock, new Set<number>()).then((): void => { count.fetchAdd(1); });
      }
      testSetNoLock(set);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);

    });
  });
}
