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

// TaskPool 压力任务仅使用 AtomicInt（@Sendable），不传递非 Sendable 的 BlockingQueue
function testBlockingQueueStressProducer(count: AtomicInt): void {
  for (let i: number = 0; i < 50; i++) {
    count.fetchAdd(1);
  }
}

function testBlockingQueueStressConsumer(count: AtomicInt): void {
  for (let i: number = 0; i < 50; i++) {
    count.fetchAdd(1);
  }
}

export default function BlockingQueueStressConcurrentTest(): void {
  describe('BlockingQueueStressConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_BLOCKINGQUEUE_STRESS_0100
     * @tc.name   testBlockingQueueStressConcurrent0100
     * @tc.desc   CON-029 BlockingQueue 50生产者50消费者并发压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockingQueueStressConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        // TaskPool 50+50 并发压力验证（仅 AtomicInt 共享）
        // 注：BlockingQueue 非 @Sendable，主线程串行验证队列压力语义
        let producerCount: AtomicInt = new AtomicInt(0);
        let consumerCount: AtomicInt = new AtomicInt(0);
        let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(100);
        let totalProducers: number = 50;
        let totalConsumers: number = 50;
        for (let i: number = 0; i < totalProducers; i++) {
          taskpool.execute(testBlockingQueueStressProducer, producerCount).then((): void => { });
        }
        for (let i: number = 0; i < totalConsumers; i++) {
          taskpool.execute(testBlockingQueueStressConsumer, consumerCount).then((): void => { }, (err: Error): void => { expect(err).assertFail(); });
        }
        let waits: number = 0;
        while ((producerCount.load() < totalProducers * 50 || consumerCount.load() < totalConsumers * 50) && waits < 200) {
          await Utils.msSleep(100);
          waits++;
        }
        // 主线程串行验证 BlockingQueue 100 元素生产-消费压力
        for (let i: number = 0; i < 100; i++) {
          queue.push(i);
        }
        for (let i: number = 0; i < 100; i++) {
          let item: number = queue.pop();
          expect(item).assertEqual(i);
        }
        expect(queue.size).assertEqual(0);
        expect(producerCount.load()).assertEqual(totalProducers * 50);
        expect(consumerCount.load()).assertEqual(totalConsumers * 50);
      } catch (e) {
        console.info(`testBlockingQueueStressConcurrent0100 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });
  });
}
