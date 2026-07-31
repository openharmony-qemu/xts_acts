'use static'
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util';

class RWLockCtorSharedCounter {
  value: number = 0;
}

// Module-level task functions for TaskPool (no nested functions allowed in it() callbacks)

// CONC-02: Construct RWLock in TaskPool task and verify success
function taskPoolConstructTask(counter: AtomicInt): void {
  const rwlock = new RWLock();
  counter.fetchAdd(1);
}

// RET-06/CONC-07/CONC-08: Use RWLock passed from main thread with read lock
function rwlockReadUseTask(rwlock: RWLock, c: AtomicInt): void {
  const rl = rwlock.readLock();
  rl.lock();
  try {
    c.fetchAdd(1);
  } finally {
    rl.unlock();
  }
}

// CONC-07: Cross-thread write use
function rwlockWriteUseTask(rwlock: RWLock, c: RWLockCtorSharedCounter): void {
  const wl = rwlock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 10;
  } finally {
    wl.unlock();
  }
}

// CONC-05/CONC-06: Concurrent construction with AtomicInt counter
function concurrentConstructTask(counter: AtomicInt): void {
  const rwlock = new RWLock();
  counter.fetchAdd(1);
}

// CONC-09: Stress construction - construct many RWLock objects in a single task
function stressConstructTask(counter: AtomicInt): void {
  let success: boolean = true;
  for (let i = 0; i < 100; i++) {
    const rwlock = new RWLock();
  }
  if (success) {
    counter.fetchAdd(1);
  }
}

// CONC-10: Lifecycle test - construct, use, and release
function lifecycleConstructTask(counter: AtomicInt): void {
  const rwlock = new RWLock();
  const rl = rwlock.readLock();
  rl.lock();
  rl.unlock();
  const wl = rwlock.writeLock();
  wl.lock();
  wl.unlock();
  counter.fetchAdd(1);
}

// CONC-03: Construct RWLock in EAWorker thread
function eaWorkerConstructTask(counter: AtomicInt): void {
  const rwlock = new RWLock();
  counter.fetchAdd(1);
}

// CONC-04: Construct and use RWLock in EAWorker thread
function eaWorkerConstructAndUseTask(counter: AtomicInt): void {
  const rwlock = new RWLock();
  const rl = rwlock.readLock();
  rl.lock();
  rl.unlock();
  const wl = rwlock.writeLock();
  wl.lock();
  wl.unlock();
  counter.fetchAdd(1);
}

export default function RWLockConstructorTest(): void {
  describe('RWLockConstructorTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    // ========== INPUT TESTS ==========

    // ========== RETURN VALUE TESTS ==========

            /**
     * @tc.name    RWLockConstructorTest0100
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify RWLock constructor returns different instances for each construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock1 = new RWLock();
      const rwlock2 = new RWLock();
      expect(rwlock1 !== rwlock2).assertTrue();
    })

    /**
     * @tc.name    RWLockConstructorTest0200
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify RWLock object constructed in main thread can be used in TaskPool task via shared memory
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RWLockConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(rwlockReadUseTask, rwlock, counter));
      let p2 = taskpool.execute(new taskpool.Task(rwlockReadUseTask, rwlock, counter));
      await Promise.all([p1, p2]);
      expect(counter.load()).assertEqual(2);
    })

    // ========== ERROR HANDLING TESTS ==========

    /**
     * @tc.name    RWLockConstructorTest0300
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify batch construction of RWLock objects does not throw errors under normal conditions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let successCount: number = 0;
      for (let i = 0; i < 1000; i++) {
        try {
          const rwlock = new RWLock();
          successCount++;
        } catch (error) {
          // Construction failed
        }
      }
      expect(successCount).assertEqual(1000);
    })

    /**
     * @tc.name    RWLockConstructorTest0400
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify loop construction of RWLock with lock operations remains stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stableCount: number = 0;
      for (let i = 0; i < 500; i++) {
        const rwlock = new RWLock();
        const rl = rwlock.readLock();
        rl.lock();
        rl.unlock();
        const wl = rwlock.writeLock();
        wl.lock();
        wl.unlock();
        stableCount++;
      }
      expect(stableCount).assertEqual(500);
    })

    // ========== CONCURRENCY TESTS ==========

    /**
     * @tc.name    RWLockConstructorTest0500
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify RWLock can be constructed in a TaskPool task
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RWLockConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(taskPoolConstructTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    RWLockConstructorTest0600
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify multiple threads concurrently constructing RWLock objects is thread-safe
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(counter.load()).assertEqual(5);
    })

    /**
     * @tc.name    RWLockConstructorTest0700
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify high-concurrency construction of RWLock with 20 threads remains stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p6 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p7 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p8 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p9 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p10 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p11 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p12 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p13 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p14 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p15 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p16 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p17 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p18 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p19 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      let p20 = taskpool.execute(new taskpool.Task(concurrentConstructTask, counter));
      await Promise.all([p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20]);
      expect(counter.load()).assertEqual(20);
    })

    /**
     * @tc.name    RWLockConstructorTest0800
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify RWLock constructed in main thread can be passed to and used in multiple TaskPool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const counter = new RWLockCtorSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(rwlockWriteUseTask, rwlock, counter));
      let p2 = taskpool.execute(new taskpool.Task(rwlockWriteUseTask, rwlock, counter));
      let p3 = taskpool.execute(new taskpool.Task(rwlockWriteUseTask, rwlock, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.value).assertEqual(30);
    })

    /**
     * @tc.name    RWLockConstructorTest0900
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_0900
     * @tc.desc    Verify RWLock constructed in main thread is immediately visible and usable in another thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rwlock = new RWLock();
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(rwlockReadUseTask, rwlock, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    RWLockConstructorTest1000
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_1000
     * @tc.desc    Verify stress construction of RWLock objects in multiple TaskPool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(stressConstructTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(stressConstructTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(stressConstructTask, counter));
      let p4 = taskpool.execute(new taskpool.Task(stressConstructTask, counter));
      let p5 = taskpool.execute(new taskpool.Task(stressConstructTask, counter));
      await Promise.all([p1, p2, p3, p4, p5]);
      expect(counter.load()).assertEqual(5);
    })

    /**
     * @tc.name    RWLockConstructorTest1100
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_1100
     * @tc.desc    Verify RWLock object lifecycle management with construct-use-release pattern
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(lifecycleConstructTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(lifecycleConstructTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(lifecycleConstructTask, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.load()).assertEqual(3);
    })

    /**
     * @tc.name    RWLockConstructorTest1200
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_1200
     * @tc.desc    Verify RWLock can be constructed in an EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('rwlockCtorWorker1');
      worker.start();
      await worker.run<void>(eaWorkerConstructTask, counter);
      worker.quit();
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name    RWLockConstructorTest1300
     * @tc.number  SUB_RW_LOCK_CONSTRUCTOR_TEST_1300
     * @tc.desc    Verify RWLock constructed in EAWorker thread supports readLock and writeLock methods
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RWLockConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('rwlockCtorWorker2');
      worker.start();
      await worker.run<void>(eaWorkerConstructAndUseTask, counter);
      worker.quit();
      expect(counter.load()).assertEqual(1);
    })
  })
}
