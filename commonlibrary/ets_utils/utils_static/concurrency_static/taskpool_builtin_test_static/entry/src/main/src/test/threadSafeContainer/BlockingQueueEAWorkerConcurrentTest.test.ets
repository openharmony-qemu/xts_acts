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

function produce(queue: containers.ArrayBlockingQueue<number>, id: number, count: number): number {
  let sum: number = 0;
  for (let i: int = 0; i < count; i++) {
    let value: number = id * count + i;
    queue.push(value);
    sum += value;
  }
  return sum;
}

function consume(queue: containers.ArrayBlockingQueue<number>, count: number): number {
  let sum: number = 0;
  for (let i: int = 0; i < count; i++) {
    let value: number | undefined = queue.pop();
    if (value === undefined) {
      throw new Error('Unexpected empty queue');
    }
    sum += value;
  }
  return sum;
}

export default function BlockingQueueEAWorkerConcurrentTest(): void {
  describe('BlockingQueueEAWorkerConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_BLOCKINGQUEUE_EAWORKER_0100
     * @tc.name   testBlockingQueueEAWorkerConcurrent0100
     * @tc.desc   CON-027 BlockingQueue EAWorker生产者-消费者
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockingQueueEAWorkerConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queue = new containers.ArrayBlockingQueue<number>(30);
        let workers: EAWorker[] = [];
        let jobs: Job<number>[] = [];
        let itemsPerWorker: number = 10.0;
        for (let i: number = 0; i < 3; i++) {
          let worker = new EAWorker('bq_producer_' + i);
          worker.start();
          workers.push(worker);
          jobs.push(worker.run<number>(produce, queue, i, itemsPerWorker));
        }
        for (let i: number = 0; i < 3; i++) {
          let worker = new EAWorker('bq_consumer_' + i);
          worker.start();
          workers.push(worker);
          jobs.push(worker.run<number>(consume, queue, itemsPerWorker));
        }
        let produced: number = 0;
        let consumed: number = 0;
        for (let i: int = 0; i < 3; i++) {
          produced += jobs[i].Await();
        }
        for (let i: int = 3; i < 6; i++) {
          consumed += jobs[i].Await();
        }
        for (let i: int = 0; i < workers.length; i++) {
          workers[i].join().Await();
        }
        expect(produced).assertEqual(435.0);
        expect(consumed).assertEqual(produced);
        expect(queue.size).assertEqual(0);
      });
  });
}
