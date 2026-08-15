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

function setOperations(set: containers.ConcurrentSet<number>, taskId: int): number {
  let completed: number = 0;
  for (let i: int = 0; i < 10; i++) {
    let value: int = 1000 + taskId * 10 + i;
    set.add(value);
    set.delete(value);
    completed++;
  }
  return completed;
}

export default function ConcurrentSetConcurrentTest(): void {
  describe('ConcurrentSetConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_CONCURRENTSET_0100
     * @tc.name   testConcurrentSetConcurrent0100
     * @tc.desc   CON-019 ConcurrentSet无锁并发add/remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConcurrentSetConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let set = new containers.ConcurrentSet<number>();
          for (let i: int = 0; i < 100; i++) {
            set.add(i);
          }
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 11; i++) {
            tasks.push(taskpool.execute(setOperations, set, i));
          }
          for (let i: int = 0; i < tasks.length; i++) {
            expect(await tasks[i] as number).assertEqual(10);
          }
          expect(set.size).assertEqual(100);
          expect(set.has(0)).assertTrue();
          expect(set.has(99)).assertTrue();
        } catch (e) {
          console.info(`testConcurrentSetConcurrent0100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });
  });
}
