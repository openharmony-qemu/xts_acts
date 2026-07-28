'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';

function queueOperations(queue: containers.stackless.ConcurrentQueue<Object>): number {
  let completed: number = 0;
  for (let i: int = 0; i < 10; i++) {
    queue.add(i as Object);
    queue.poll();
    completed++;
  }
  return completed;
}

export default function ConcurrentQueueConcurrentTest(): void {
  describe('ConcurrentQueueConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_CONCURRENTQUEUE_0100
     * @tc.name   testConcurrentQueueConcurrent0100
     * @tc.desc   CON-020 ConcurrentQueue无锁并发push/pop/add/poll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConcurrentQueueConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        let queue = new containers.stackless.LinkedConcurrentQueue<Object>(100);
        let tasks: Promise<Any>[] = [];
        for (let i: int = 0; i < 11; i++) {
          tasks.push(taskpool.execute(queueOperations, queue));
        }
        for (let i: int = 0; i < tasks.length; i++) {
          expect(await tasks[i] as number).assertEqual(10);
        }
        expect(queue.size).assertEqual(0);
      });
  });
}
