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
import Utils from '../Util.test';

function testAtomicIntEAWorkerFetchAdd(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    counter.fetchAdd(1);
    taskCounter.fetchAdd(1);
  }
}

export default function AtomicIntEAWorkerConcurrentTest(): void {
  describe('AtomicIntEAWorkerConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_INT_EAWORKER_0100
     * @tc.name   testAtomicIntEAWorkerConcurrent0100
     * @tc.desc   CON-060 AtomicInt EAWorker并发fetchAdd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntEAWorkerConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let totalWorkers: int = 5;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_atomic_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        workers[i].run<void>(testAtomicIntEAWorkerFetchAdd, counter, taskCounter);
      }
      while (taskCounter.load() < totalWorkers * 10) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(totalWorkers * 10);
      for (let i: int = 0; i < workers.length; i++) {
        workers[i].join().Await();
      }
    });
  });
}
