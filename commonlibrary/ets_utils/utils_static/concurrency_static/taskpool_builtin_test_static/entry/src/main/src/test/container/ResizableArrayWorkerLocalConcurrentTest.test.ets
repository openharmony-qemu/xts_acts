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

function createNumberArray(): Array<number> {
  return new Array<number>();
}

function testResizableArrayWorkerLocal(wl: WorkerLocal<Array<number>>): void {
  // 构造时提供 init 函数，首次 get 自动按线程初始化（get 未初始化会抛异常）
  let arr: Array<number> = wl.get();
  for (let i: number = 0; i < 10; i++) {
    arr.push(i);
  }
}

export default function ResizableArrayWorkerLocalConcurrentTest(): void {
  describe('ResizableArrayWorkerLocalConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_WORKERLOCAL_0100
     * @tc.name   testResizableArrayWorkerLocalConcurrent0100
     * @tc.desc   CON-004 ResizableArray WorkerLocal线程隔离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayWorkerLocalConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let wl: WorkerLocal<Array<number>> = new WorkerLocal<Array<number>>(createNumberArray);
      let totalTasks: number = 10;
      let tasks: Promise<Any>[] = [];
      for (let i: number = 0; i < totalTasks; i++) {
        tasks.push(taskpool.execute(testResizableArrayWorkerLocal, wl).then((): void => { count.fetchAdd(1); }));
      }
      testResizableArrayWorkerLocal(wl);
      count.fetchAdd(1);
      try {
        await Promise.all(tasks);
        expect(count.load()).assertEqual(totalTasks + 1);
      } catch (err) {
        expect(err).assertFail();
      }
    });
  });
}
