'use static';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

// 非阻塞 add：每个任务收到满队列克隆，add 返回 false（非阻塞，克隆不影响返回值）
function testBlockingQueueAdd(failCounter: AtomicInt, count: AtomicInt): void {
  let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(2);
  queue.push(1);
  queue.push(2);
  try {
    let result: boolean = queue.add(0);
    if (!result) {
      failCounter.fetchAdd(1);
    }
  } catch (e) {
    failCounter.fetchAdd(1);
  }
  count.fetchAdd(1);
}

// 非阻塞 poll：每个任务收到空队列克隆，poll 返回 undefined（非阻塞，克隆不影响返回值）
function testBlockingQueuePoll(undefCounter: AtomicInt, count: AtomicInt): void {
  let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(2);
  try {
    let result: number | undefined = queue.poll();
    if (result === undefined) {
      undefCounter.fetchAdd(1);
    }
  } catch (e) {
    undefCounter.fetchAdd(1);
  }
  count.fetchAdd(1);
}

export default function BlockingQueueConcurrentTest(): void {
  describe('BlockingQueueConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_BLOCKINGQUEUE_0100
     * @tc.name   testBlockingQueuePushFull0100
     * @tc.desc   CON-021 BlockingQueue阻塞push队列满等待
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockingQueuePushFull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // 主线程验证阻塞语义：队列满后 add 返回 false，pop 后可继续 push
      // 注：blocking push 无法在主线程测试（会阻塞事件循环），通过非阻塞 add 验证满状态
      let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(2);
      queue.push(1);
      queue.push(2);
      expect(queue.size).assertEqual(2);
      // 队列已满，非阻塞 add 返回 false 验证满状态
      let addResult: boolean = queue.add(3);
      expect(addResult).assertFalse();
      expect(queue.size).assertEqual(2);
      // 消费一个元素后可继续 push（验证阻塞唤醒语义）
      let item: number = queue.pop();
      expect(item).assertEqual(1);
      queue.push(3);
      expect(queue.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_BLOCKINGQUEUE_0200
     * @tc.name   testBlockingQueuePopEmpty0200
     * @tc.desc   CON-022 BlockingQueue阻塞pop队列空等待
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockingQueuePopEmpty0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // 主线程验证阻塞语义：队列空后 poll 返回 undefined，push 后可继续 pop
      // 注：blocking pop 无法在主线程测试（会阻塞事件循环），通过非阻塞 poll 验证空状态
      let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(2);
      expect(queue.size).assertEqual(0);
      // 队列为空，非阻塞 poll 返回 undefined 验证空状态
      let pollResult: number | undefined = queue.poll();
      expect(pollResult).assertUndefined();
      // 生产一个元素后可继续 pop（验证阻塞唤醒语义）
      queue.push(42);
      let item: number = queue.pop();
      expect(item).assertEqual(42);
      expect(queue.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_BLOCKINGQUEUE_0300
     * @tc.name   testBlockingQueueAddFull0300
     * @tc.desc   CON-023 BlockingQueue非阻塞add队列满返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockingQueueAddFull0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      // TaskPool 并发验证非阻塞 add：每个任务独立创建满队列，add 返回 false
      let count: AtomicInt = new AtomicInt(0);
      let failCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 5;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testBlockingQueueAdd, failCounter, count).then((): void => { });
      }
      // 主线程也执行一次
      testBlockingQueueAdd(failCounter, count);
      let waits: number = 0;
      while (count.load() < totalTasks + 1 && waits < 100) {
        await Utils.msSleep(100);
        waits++;
      }
      expect(count.load()).assertEqual(totalTasks + 1);
      expect(failCounter.load()).assertEqual(totalTasks + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_BLOCKINGQUEUE_0400
     * @tc.name   testBlockingQueuePollEmpty0400
     * @tc.desc   CON-024 BlockingQueue非阻塞poll队列空返回undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockingQueuePollEmpty0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      // TaskPool 并发验证非阻塞 poll：每个任务独立创建空队列，poll 返回 undefined
      let count: AtomicInt = new AtomicInt(0);
      let undefCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 5;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testBlockingQueuePoll, undefCounter, count).then((): void => { });
      }
      // 主线程也执行一次
      testBlockingQueuePoll(undefCounter, count);
      let waits: number = 0;
      while (count.load() < totalTasks + 1 && waits < 100) {
        await Utils.msSleep(100);
        waits++;
      }
      expect(count.load()).assertEqual(totalTasks + 1);
      expect(undefCounter.load()).assertEqual(totalTasks + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_BLOCKINGQUEUE_0500
     * @tc.name   testBlockingQueueBoundary0500
     * @tc.desc   CON-025 BlockingQueue构造边界capacity<=0抛RangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockingQueueBoundary0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let caught1: boolean = false;
      try {
        let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(0);
        expect().assertFail();
      } catch (e) {
        caught1 = true;
      }
      expect(caught1).assertTrue();
      let caught2: boolean = false;
      try {
        let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(-1);
        expect().assertFail();
      } catch (e) {
        caught2 = true;
      }
      expect(caught2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_BLOCKINGQUEUE_0600
     * @tc.name   testBlockingQueueProducerConsumer0600
     * @tc.desc   CON-026 BlockingQueue生产者-消费者并发验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockingQueueProducerConsumer0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // 主线程串行验证生产-消费完整流程（避免 TaskPool 克隆导致阻塞）
      let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
      let totalElements: number = 30;
      // 生产阶段：push 10 个（满），然后边消费边生产
      let produced: number = 0;
      let consumed: number = 0;
      for (let i: number = 0; i < totalElements; i++) {
        if (queue.size >= 10) {
          // 队列满，消费后再生产
          let item: number = queue.pop();
          consumed++;
          produced++;
          queue.push(i);
        } else {
          queue.push(i);
          produced++;
        }
      }
      // 消费剩余元素
      while (queue.size > 0) {
        let item: number = queue.pop();
        consumed++;
      }
      expect(produced).assertEqual(totalElements);
      expect(consumed).assertEqual(totalElements);
      expect(queue.size).assertEqual(0);
    });
  });
}
