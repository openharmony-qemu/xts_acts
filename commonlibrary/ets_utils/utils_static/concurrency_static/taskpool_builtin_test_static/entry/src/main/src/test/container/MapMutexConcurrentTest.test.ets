'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testMapMutex(map: Map<string, number>, mutex: Mutex): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      map.set('key' + i, i);
      map.get('key' + i);
      map.delete('key' + i);
    } finally {
      mutex.unlock();
    }
  }
}

export default function MapMutexConcurrentTest(): void {
  describe('MapMutexConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_MAP_MUTEX_0100
     * @tc.name   testMapMutexConcurrent0100
     * @tc.desc   CON-007 Map Mutex保护并发set/get/delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMapMutexConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let map: Map<string, number> = new Map<string, number>();
      let mutex: Mutex = new Mutex();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testMapMutex, map, mutex).then((): void => { count.fetchAdd(1); });
      }
      testMapMutex(map, mutex);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
      expect(map.size).assertEqual(0);
    });
  });
}
