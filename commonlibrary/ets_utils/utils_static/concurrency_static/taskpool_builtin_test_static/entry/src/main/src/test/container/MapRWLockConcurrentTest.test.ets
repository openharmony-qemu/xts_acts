'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testMapReadRWLock(rwlock: RWLock, sharedMap: Map<string, number>): void {
  for (let i: int = 0; i < 10; i++) {
    let rlock = rwlock.readLock();
    rlock.lock();
    try {
      let value: number | undefined = sharedMap.get('key_' + i);
      if (value !== undefined) {
        let v: number = value;
      }
      let hasKey: boolean = sharedMap.has('key_' + i);
      sharedMap.forEach((val: number, key: string): void => {
        let k: string = key;
        let vv: number = val;
      });
    } finally {
      rlock.unlock();
    }
  }
}

function testMapWriteRWLock(rwlock: RWLock, sharedMap: Map<string, number>): void {
  for (let i: int = 0; i < 10; i++) {
    let wlock = rwlock.writeLock();
    wlock.lock();
    try {
      sharedMap.set('key_' + i, i);
      sharedMap.set('key_' + (i + 100), i + 100);
      sharedMap.delete('key_' + i);
      sharedMap.delete('key_' + (i + 100));
    } finally {
      wlock.unlock();
    }
  }
}

export default function MapRWLockConcurrentTest(): void {
  describe('MapRWLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_MAP_RWLOCK_0100
     * @tc.name   testMapRWLockConcurrent0100
     * @tc.desc   CON-067 Map RWLock读写分离并发set/get/delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMapRWLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let sharedMap: Map<string, number> = new Map<string, number>();
      for (let i: number = 0; i < 200; i++) {
        sharedMap.set('key_' + i, i);
      }
      let rwlock: RWLock = new RWLock();
      let readCount: AtomicInt = new AtomicInt(0);
      let writeCount: AtomicInt = new AtomicInt(0);
      let totalReadTasks: number = 5;
      let totalWriteTasks: number = 5;
      for (let i: number = 0; i < totalReadTasks; i++) {
        taskpool.execute(testMapReadRWLock, rwlock, sharedMap).then((): void => {
          readCount.fetchAdd(1);
        });
      }
      for (let i: number = 0; i < totalWriteTasks; i++) {
        taskpool.execute(testMapWriteRWLock, rwlock, sharedMap).then((): void => {
          writeCount.fetchAdd(1);
        });
      }
      testMapReadRWLock(rwlock, sharedMap);
      readCount.fetchAdd(1);
      testMapWriteRWLock(rwlock, sharedMap);
      writeCount.fetchAdd(1);
      while (readCount.load() < totalReadTasks + 1) {
        await Utils.msSleep(100);
      }
      while (writeCount.load() < totalWriteTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(readCount.load()).assertEqual(totalReadTasks + 1);
      expect(writeCount.load()).assertEqual(totalWriteTasks + 1);
      // 写任务每轮 set/delete key_0..9 与 key_100..109，净效果为永久删除这 20 个初始键，终态确定为 180
      expect(sharedMap.size).assertEqual(180);
    });
  });
}
