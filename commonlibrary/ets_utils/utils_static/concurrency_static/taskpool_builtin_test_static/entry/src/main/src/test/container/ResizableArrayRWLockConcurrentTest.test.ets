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

function readWithRWLock(lock: RWLock, arr: Array<number>, count: AtomicInt): void {
  for (let i: int = 0; i < 10; i++) {
    let guard = lock.readLock();
    guard.lock();
    try {
      let sum: number = 0;
      for (let j: int = 0; j < arr.length; j++) {
        sum += arr[j];
      }
      count.fetchAdd(1);
    } finally {
      guard.unlock();
    }
  }
}

function writeWithRWLock(lock: RWLock, arr: Array<number>, count: AtomicInt): void {
  for (let i: int = 0; i < 10; i++) {
    let guard = lock.writeLock();
    guard.lock();
    try {
      arr.push(i);
      count.fetchAdd(1);
    } finally {
      guard.unlock();
    }
  }
}

export default function ResizableArrayRWLockConcurrentTest(): void {
  describe('ResizableArrayRWLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_RWLOCK_0100
     * @tc.name   testResizableArrayRWLockConcurrent0100
     * @tc.desc   CON-003 ResizableArray RWLock保护并发读写分离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayRWLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let arr: Array<number> = [];
          for (let i: int = 0; i < 100; i++) {
            arr.push(i);
          }
          let lock = new RWLock();
          let reads = new AtomicInt(0);
          let writes = new AtomicInt(0);
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 5; i++) {
            tasks.push(taskpool.execute(readWithRWLock, lock, arr, reads));
            tasks.push(taskpool.execute(writeWithRWLock, lock, arr, writes));
          }
          for (let i: int = 0; i < tasks.length; i++) {
            await tasks[i];
          }
          expect(reads.load()).assertEqual(50);
          expect(writes.load()).assertEqual(50);
          expect(arr.length).assertEqual(150);
        } catch (e) {
          console.info(`testResizableArrayRWLockConcurrent0100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });
  });
}
