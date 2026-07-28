'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';

function readWithRWLock(lock: RWLock, arr: Array<number>, count: AtomicInt): void {
  for (let i: int = 0; i < 10; i++) {
    let guard = lock.readLock();
    guard.lock();
    try {
      let sum: number = 0;
      for (let j: int = 0; j < arr.length; j++) {
        sum += arr[j];
      }
      count.fetchAdd(1);
    } finally {
      guard.unlock();
    }
  }
}

function writeWithRWLock(lock: RWLock, arr: Array<number>, count: AtomicInt): void {
  for (let i: int = 0; i < 10; i++) {
    let guard = lock.writeLock();
    guard.lock();
    try {
      arr.push(i);
      count.fetchAdd(1);
    } finally {
      guard.unlock();
    }
  }
}

export default function ResizableArrayRWLockConcurrentTest(): void {
  describe('ResizableArrayRWLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_RWLOCK_0100
     * @tc.name   testResizableArrayRWLockConcurrent0100
     * @tc.desc   CON-003 ResizableArray RWLock保护并发读写分离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayRWLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        let arr: Array<number> = [];
        for (let i: int = 0; i < 100; i++) {
          arr.push(i);
        }
        let lock = new RWLock();
        let reads = new AtomicInt(0);
        let writes = new AtomicInt(0);
        let tasks: Promise<Any>[] = [];
        for (let i: int = 0; i < 5; i++) {
          tasks.push(taskpool.execute(readWithRWLock, lock, arr, reads));
          tasks.push(taskpool.execute(writeWithRWLock, lock, arr, writes));
        }
        for (let i: int = 0; i < tasks.length; i++) {
          await tasks[i];
        }
        expect(reads.load()).assertEqual(50);
        expect(writes.load()).assertEqual(50);
        expect(arr.length).assertEqual(150);
      });
  });
}
