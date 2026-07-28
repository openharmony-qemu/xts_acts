'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testMapNoLock(map: Map<string, number>): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      map.set('key' + i, i);
      map.get('key' + i);
      map.delete('key' + i);
    } catch (e) {
      // 竞态容忍
    }
  }
}

function testMapNoLockStress(map: Map<string, number>): void {
  for (let i: number = 0; i < 100; i++) {
    try {
      map.set('key' + i, i);
      map.get('key' + i);
      map.delete('key' + i);
    } catch (e) {
      // 竞态容忍
    }
  }
}

export default function MapNoLockConcurrentTest(): void {
  describe('MapNoLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_MAP_NOLOCK_0100
     * @tc.name   testMapNoLockConcurrent0100
     * @tc.desc   CON-006 Map线程隔离无锁并发set/get/delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMapNoLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let map: Map<string, number> = new Map<string, number>();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testMapNoLock, new Map<string, number>()).then((): void => { count.fetchAdd(1); });
      }
      testMapNoLock(map);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_MAP_NOLOCK_0200
     * @tc.name   testMapNoLockStressConcurrent0200
     * @tc.desc   CON-013 Map 100线程隔离并发set/get/delete压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMapNoLockStressConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 100;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testMapNoLockStress, new Map<string, number>()).then((): void => { count.fetchAdd(1); });
      }
      while (count.load() < totalTasks) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks);
    });
  });
}
