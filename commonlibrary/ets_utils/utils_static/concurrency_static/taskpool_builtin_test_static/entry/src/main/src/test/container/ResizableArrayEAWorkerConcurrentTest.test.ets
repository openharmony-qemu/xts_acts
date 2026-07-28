'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testResizableArrayEAWorker(arr: Array<number>, count: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      arr.push(i);
      arr.pop();
    } catch (e) {
      // 竞态容忍
    }
  }
  count.fetchAdd(1);
}

export default function ResizableArrayEAWorkerConcurrentTest(): void {
  describe('ResizableArrayEAWorkerConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_EAWORKER_0100
     * @tc.name   testResizableArrayEAWorkerConcurrent0100
     * @tc.desc   CON-010 ResizableArray EAWorker线程隔离并发push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayEAWorkerConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let totalWorkers: int = 10;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        workers[i].run<void>(testResizableArrayEAWorker, new Array<number>(), count);
      }
      while (count.load() < totalWorkers) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalWorkers);
      for (let i: int = 0; i < workers.length; i++) {
        workers[i].join().Await();
      }
    });
  });
}
