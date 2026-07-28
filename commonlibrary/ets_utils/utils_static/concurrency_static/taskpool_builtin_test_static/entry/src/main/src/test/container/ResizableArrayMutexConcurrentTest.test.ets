'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testResizableArrayMutex(arr: Array<number>, mutex: Mutex): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      arr.push(i);
      arr.pop();
    } finally {
      mutex.unlock();
    }
  }
}

export default function ResizableArrayMutexConcurrentTest(): void {
  describe('ResizableArrayMutexConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_MUTEX_0100
     * @tc.name   testResizableArrayMutexConcurrent0100
     * @tc.desc   CON-002 ResizableArray Mutex保护并发push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayMutexConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let arr: Array<number> = new Array<number>();
      let mutex: Mutex = new Mutex();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testResizableArrayMutex, arr, mutex).then((): void => { count.fetchAdd(1); });
      }
      testResizableArrayMutex(arr, mutex);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
      expect(arr.length).assertEqual(0);
    });
  });
}
