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
      async (done: () => void): Promise<void> => {
        let queue = new containers.stackless.LinkedConcurrentQueue<Object>(100);
        let tasks: Promise<Any>[] = [];
        for (let i: int = 0; i < 11; i++) {
          tasks.push(taskpool.execute(queueOperations, queue));
        }
        for (let i: int = 0; i < tasks.length; i++) {
          try {
            expect(await tasks[i] as number).assertEqual(10);
          } catch (err) {
            expect(err).assertFail();
          }
        }
        expect(queue.size).assertEqual(0);
        done();
      });
  });
}
