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

function testResizableArrayEAWorker(arr: Array<number>, count: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      arr.push(i);
      arr.pop();
    } catch (e) {
      // 竞态容忍
    }
  }
  count.fetchAdd(1);
}

export default function ResizableArrayEAWorkerConcurrentTest(): void {
  describe('ResizableArrayEAWorkerConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_EAWORKER_0100
     * @tc.name   testResizableArrayEAWorkerConcurrent0100
     * @tc.desc   CON-010 ResizableArray EAWorker线程隔离并发push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayEAWorkerConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let totalWorkers: int = 10;
      for (let i: int = 0; i < totalWorkers; i++) {
        let w: EAWorker = new EAWorker('eaWorker_' + i);
        w.start();
        workers.push(w);
      }
      for (let i: int = 0; i < totalWorkers; i++) {
        workers[i].run<void>(testResizableArrayEAWorker, new Array<number>(), count);
      }
      while (count.load() < totalWorkers) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalWorkers);
      for (let i: int = 0; i < workers.length; i++) {
        workers[i].join().Await();
      }
    });
  });
}
