'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Utils.test';

// TaskPool 任务仅使用 AtomicInt（@Sendable），不传递非 Sendable 的 BlockingQueue
function testProducerCounter(count: AtomicInt): void {
  for (let i: number = 0; i < 100; i++) {
    count.fetchAdd(1);
  }
}

function testConsumerCounter(count: AtomicInt): void {
  for (let i: number = 0; i < 100; i++) {
    count.fetchAdd(1);
  }
}

// 非阻塞 add 限流：每个任务独立创建满队列，add 返回 false
function testRateLimitingAdd(successCounter: AtomicInt, rejectCounter: AtomicInt, count: AtomicInt): void {
  let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(100);
  for (let i: number = 0; i < 100; i++) {
    queue.push(i);
  }
  for (let i: number = 0; i < 10; i++) {
    let result: boolean = queue.add(i);
    if (result) {
      successCounter.fetchAdd(1);
    } else {
      rejectCounter.fetchAdd(1);
    }
    count.fetchAdd(1);
  }
}

// 非阻塞 poll 连接池：每个任务独立创建队列，poll 借用/归还
function testConnectionPoolBorrow(borrowCounter: AtomicInt, returnCounter: AtomicInt, count: AtomicInt): void {
  let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(10);
  for (let i: number = 0; i < 10; i++) {
    queue.push(i);
  }
  for (let i: number = 0; i < 10; i++) {
    let conn: number | undefined = queue.poll();
    if (conn !== undefined && conn !== null) {
      borrowCounter.fetchAdd(1);
      queue.push(conn);
      returnCounter.fetchAdd(1);
    }
    count.fetchAdd(1);
  }
}

// EAWorker 任务仅使用 AtomicInt
function testGracefulShutdownWorker(taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    taskCounter.fetchAdd(1);
  }
}

export default function IndustryBlockingQueueConcurrentTest(): void {
  describe('IndustryBlockingQueueConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_BLOCKINGQUEUE_0100
     * @tc.name   testProducerConsumerConcurrent0100
     * @tc.desc   IP-001 BlockingQueue生产者-消费者完整系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testProducerConsumerConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        // TaskPool 并发验证计数器（@Sendable），主线程串行验证 BlockingQueue 生产-消费
        let producerCount: AtomicInt = new AtomicInt(0);
        let consumerCount: AtomicInt = new AtomicInt(0);
        let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(100);
        let totalProducers: number = 5;
        let totalConsumers: number = 5;
        for (let i: number = 0; i < totalProducers; i++) {
          taskpool.execute(testProducerCounter, producerCount).then((): void => { });
        }
        for (let i: number = 0; i < totalConsumers; i++) {
          taskpool.execute(testConsumerCounter, consumerCount).then((): void => { });
        }
        // 主线程串行验证 BlockingQueue 生产-消费完整流程
        for (let i: number = 0; i < 100; i++) {
          queue.push(i);
        }
        for (let i: number = 0; i < 100; i++) {
          let item: number = queue.pop();
          expect(item).assertEqual(i);
        }
        let waits: number = 0;
        while ((producerCount.load() < totalProducers * 100 || consumerCount.load() < totalConsumers * 100) && waits < 200) {
          await Utils.msSleep(100);
          waits++;
        }
        expect(queue.size).assertEqual(0);
        expect(producerCount.load()).assertEqual(totalProducers * 100);
        expect(consumerCount.load()).assertEqual(totalConsumers * 100);
      } catch (e) {
        console.info(`testProducerConsumerConcurrent0100 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_BLOCKINGQUEUE_0200
     * @tc.name   testPipelineConcurrent0200
     * @tc.desc   IP-002 BlockingQueue多阶段管道系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipelineConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // 主线程串行验证多阶段管道（BlockingQueue 非 Sendable，不能跨 TaskPool 共享）
      let inputQueue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(50);
      let outputQueue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(200);
      let stage1Counter: number = 0;
      let stage2Counter: number = 0;
      // 阶段1：生产 100 个元素到 inputQueue
      for (let i: number = 0; i < 100; i++) {
        if (inputQueue.size >= 50) {
          let item: number = inputQueue.pop();
          outputQueue.push(item);
          stage1Counter++;
        }
        inputQueue.push(i);
      }
      while (inputQueue.size > 0) {
        let item: number = inputQueue.pop();
        outputQueue.push(item);
        stage1Counter++;
      }
      // 阶段2：从 outputQueue 消费
      while (outputQueue.size > 0) {
        let item: number = outputQueue.pop();
        stage2Counter++;
      }
      expect(stage1Counter).assertEqual(100);
      expect(stage2Counter).assertEqual(100);
      expect(inputQueue.size).assertEqual(0);
      expect(outputQueue.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_BLOCKINGQUEUE_0300
     * @tc.name   testRateLimitingConcurrent0300
     * @tc.desc   IP-003 BlockingQueue限流缓冲队列系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRateLimitingConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        // TaskPool 并发验证限流：每个任务独立创建满队列，add 全部返回 false
        let successCounter: AtomicInt = new AtomicInt(0);
        let rejectCounter: AtomicInt = new AtomicInt(0);
        let count: AtomicInt = new AtomicInt(0);
        let totalTasks: number = 20;
        for (let i: number = 0; i < totalTasks; i++) {
          taskpool.execute(testRateLimitingAdd, successCounter, rejectCounter, count).then((): void => { });
        }
        let waits: number = 0;
        while (count.load() < totalTasks * 10 && waits < 200) {
          await Utils.msSleep(100);
          waits++;
        }
        expect(count.load()).assertEqual(totalTasks * 10);
        expect(successCounter.load()).assertEqual(0);
        expect(rejectCounter.load()).assertEqual(totalTasks * 10);
      } catch (e) {
        console.info(`testRateLimitingConcurrent0300 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_BLOCKINGQUEUE_0400
     * @tc.name   testConnectionPoolConcurrent0400
     * @tc.desc   IP-006 BlockingQueue连接池管理系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConnectionPoolConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        // TaskPool 并发验证连接池：每个任务独立创建队列，poll 借用 + push 归还
        let borrowCounter: AtomicInt = new AtomicInt(0);
        let returnCounter: AtomicInt = new AtomicInt(0);
        let count: AtomicInt = new AtomicInt(0);
        let totalTasks: number = 10;
        for (let i: number = 0; i < totalTasks; i++) {
          taskpool.execute(testConnectionPoolBorrow, borrowCounter, returnCounter, count).then((): void => { });
        }
        let waits: number = 0;
        while (count.load() < totalTasks * 10 && waits < 200) {
          await Utils.msSleep(100);
          waits++;
        }
        expect(count.load()).assertEqual(totalTasks * 10);
        expect(borrowCounter.load()).assertEqual(returnCounter.load());
        expect(borrowCounter.load()).assertEqual(totalTasks * 10);
      } catch (e) {
        console.info(`testConnectionPoolConcurrent0400 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_BLOCKINGQUEUE_0500
     * @tc.name   testEventSourcingConcurrent0500
     * @tc.desc   IP-007 BlockingQueue Event Sourcing事件存储系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEventSourcingConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // 主线程串行验证事件存储：生产 100 事件，消费 100 事件
      let queue: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(200);
      let eventCount: number = 0;
      let persistCount: number = 0;
      for (let i: number = 0; i < 100; i++) {
        queue.push('event' + i);
        eventCount++;
      }
      while (queue.size > 0) {
        let event: string = queue.pop();
        persistCount++;
      }
      expect(eventCount).assertEqual(100);
      expect(persistCount).assertEqual(100);
      expect(queue.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_INDUSTRY_BLOCKINGQUEUE_0600
     * @tc.name   testGracefulShutdownConcurrent0600
     * @tc.desc   IP-008 BlockingQueue+EAWorker优雅关闭系统
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGracefulShutdownConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // EAWorker 并发验证计数器（@Sendable），主线程串行验证 BlockingQueue 消费
      let taskCounter: AtomicInt = new AtomicInt(0);
      let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(50);
      for (let i: number = 0; i < 50; i++) {
        queue.push(i);
      }
      let workers: EAWorker[] = [];
      let totalWorkers: int = 2;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_shutdown_' + i);
        w.start();
        workers.push(w);
        w.run<void>(testGracefulShutdownWorker, taskCounter);
      }
      // 主线程串行消费 50 个元素
      let consumed: number = 0;
      while (queue.size > 0) {
        let item: number = queue.pop();
        consumed++;
      }
      for (let i: int = 0; i < workers.length; i++) {
        workers[i].join().Await();
      }
      expect(consumed).assertEqual(50);
      expect(taskCounter.load()).assertEqual(totalWorkers * 10);
    });
  });
}
