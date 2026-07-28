'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function createNumberArray(): Array<number> {
  return new Array<number>();
}

function testResizableArrayWorkerLocal(wl: WorkerLocal<Array<number>>): void {
  // 构造时提供 init 函数，首次 get 自动按线程初始化（get 未初始化会抛异常）
  let arr: Array<number> = wl.get();
  for (let i: number = 0; i < 10; i++) {
    arr.push(i);
  }
}

export default function ResizableArrayWorkerLocalConcurrentTest(): void {
  describe('ResizableArrayWorkerLocalConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_WORKERLOCAL_0100
     * @tc.name   testResizableArrayWorkerLocalConcurrent0100
     * @tc.desc   CON-004 ResizableArray WorkerLocal线程隔离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayWorkerLocalConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let wl: WorkerLocal<Array<number>> = new WorkerLocal<Array<number>>(createNumberArray);
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testResizableArrayWorkerLocal, wl).then((): void => { count.fetchAdd(1); });
      }
      testResizableArrayWorkerLocal(wl);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
    });
  });
}
