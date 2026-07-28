'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testResizableArrayStress(arr: Array<number>): void {
  for (let i: number = 0; i < 100; i++) {
    try {
      arr.push(i);
      arr.pop();
    } catch (e) {
      // 竞态容忍
    }
  }
}

export default function ResizableArrayStressConcurrentTest(): void {
  describe('ResizableArrayStressConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_STRESS_0100
     * @tc.name   testResizableArrayStressConcurrent0100
     * @tc.desc   CON-012 ResizableArray 100线程隔离并发push/pop压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayStressConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 100;
      let waits: number = 0;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testResizableArrayStress, new Array<number>()).then((): void => { count.fetchAdd(1); });
      }
      while (count.load() < totalTasks && waits < 200) {
        await Utils.msSleep(100);
        waits++;
      }
      expect(count.load()).assertEqual(totalTasks);
    });
  });
}
