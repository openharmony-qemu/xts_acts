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

function testResizableArrayMutex(arr: Array<number>, mutex: Mutex): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      arr.push(i);
      arr.pop();
    } finally {
      mutex.unlock();
    }
  }
}

export default function ResizableArrayMutexConcurrentTest(): void {
  describe('ResizableArrayMutexConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_MUTEX_0100
     * @tc.name   testResizableArrayMutexConcurrent0100
     * @tc.desc   CON-002 ResizableArray Mutex保护并发push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayMutexConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let arr: Array<number> = new Array<number>();
      let mutex: Mutex = new Mutex();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testResizableArrayMutex, arr, mutex).then((): void => { count.fetchAdd(1); });
      }
      testResizableArrayMutex(arr, mutex);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);
      expect(arr.length).assertEqual(0);
    });
  });
}
