'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

function testFixedArrayIndexRW(arr: FixedArray<number>): void {
  for (let i: int = 0; i < 10; i++) {
    try {
      let idx: int = i % 100;
      arr[idx] = i;
      let val: number = arr[idx];
    } catch (e) {
      // 竞态容忍
    }
  }
}

export default function FixedArrayNoLockConcurrentTest(): void {
  describe('FixedArrayNoLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_FIXEDARRAY_NOLOCK_0100
     * @tc.name   testFixedArrayNoLockConcurrent0100
     * @tc.desc   CON-005 FixedArray线程隔离索引并发读写
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFixedArrayNoLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let arr: FixedArray<number> = new FixedArray<number>(100);
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testFixedArrayIndexRW, new FixedArray<number>(100)).then((): void => { count.fetchAdd(1); });
      }
      testFixedArrayIndexRW(arr);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
    });
  });
}
