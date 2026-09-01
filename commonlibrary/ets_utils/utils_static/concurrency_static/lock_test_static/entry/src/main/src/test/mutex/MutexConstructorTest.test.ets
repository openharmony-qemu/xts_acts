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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

class MutexCtorSharedCounter {
  value: number = 0;
}

// TC-1100/TC-1300/TC-1700: Construct a Mutex inside a concurrent task or worker thread
function constructMutexTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  counter.fetchAdd(1);
}

// TC-1800: Cross-thread sharing - use Mutex lock/unlock in TaskPool
function mutexLockUseTask(mutex: Mutex, c: MutexCtorSharedCounter): void {
  mutex.lock();
  try {
    c.value = c.value + 1;
  } finally {
    mutex.unlock();
  }
}

// TC-2000: Stress construction in TaskPool
function stressConstructTask(counter: AtomicInt): void {
  for (let i = 0; i < 100; i++) {
    const mutex = new Mutex();
  }
  counter.fetchAdd(1);
}

// TC-2100: Lifecycle - construct, lock, unlock in TaskPool
function lifecycleConstructTask(counter: AtomicInt): void {
  const mutex = new Mutex();
  mutex.lock();
  mutex.unlock();
  counter.fetchAdd(1);
}

export default function MutexConstructorTest(): void {
  describe('MutexConstructorTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name    MutexConstructorTest0100
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify Mutex constructor returns independent instances for each construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mutex1 = new Mutex();
      const mutex2 = new Mutex();
      // Each constructed instance is an independent lock: holding one does not block the other.
      mutex1.lock();
      let secondAcquired: boolean = false;
      mutex2.lock();
      try {
        secondAcquired = true;
      } finally {
        mutex2.unlock();
      }
      mutex1.unlock();
      expect(secondAcquired).assertTrue();
    })

    /**
     * @tc.name    MutexConstructorTest0200
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify batch construction of Mutex objects does not throw errors under normal conditions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let successCount: number = 0;
      for (let i = 0; i < 1000; i++) {
        const mutex = new Mutex();
        successCount++;
      }
      expect(successCount).assertEqual(1000);
    })

    /**
     * @tc.name    MutexConstructorTest0300
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify repeated construction and lock/unlock cycles on a reassigned variable remain stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let stableCount: number = 0;
      for (let i = 0; i < 500; i++) {
        const mutex = new Mutex();
        mutex.lock();
        mutex.unlock();
        stableCount++;
      }
      expect(stableCount).assertEqual(500);
    })

    /**
     * @tc.name    MutexConstructorTest0400
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify Mutex can be constructed in a TaskPool task
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('MutexConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(constructMutexTask, counter));
      await p1;
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`MutexConstructorTest0400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexConstructorTest0500
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify multiple threads concurrently constructing Mutex objects is thread-safe
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(constructMutexTask, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(5);
      } catch (error) {
        console.error(`MutexConstructorTest0500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexConstructorTest0600
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify Mutex constructed in main thread can be shared and used across TaskPool tasks via static model
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      const mutex = new Mutex();
      const counter = new MutexCtorSharedCounter();
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(mutexLockUseTask, mutex, counter)));
      }
      await Promise.all(promises);
      expect(counter.value).assertEqual(3);
      } catch (error) {
        console.error(`MutexConstructorTest0600 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexConstructorTest0700
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify stress construction of Mutex objects in multiple TaskPool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(stressConstructTask, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(5);
      } catch (error) {
        console.error(`MutexConstructorTest0700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexConstructorTest0800
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify Mutex object lifecycle management with construct-use-release pattern in concurrent tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(lifecycleConstructTask, counter)));
      }
      await Promise.all(promises);
      expect(counter.load()).assertEqual(3);
      } catch (error) {
        console.error(`MutexConstructorTest0800 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexConstructorTest0900
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_0900
     * @tc.desc    Verify Mutex can be constructed in an EAWorker thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('MutexConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const counter = new AtomicInt(0);
      const worker = new EAWorker('mutexCtorWorker1');
      worker.start();
      try {
        await worker.run<void>(constructMutexTask, counter);
        // run<void> may resolve before the worker-side store is visible; bounded-poll it.
        let waits: int = 0;
        while (counter.load() === 0 && waits < 50) {
          await Utils.msSleep(100);
          waits++;
        }
      } finally {
        worker.quit();
      }
      expect(counter.load()).assertEqual(1);
      } catch (error) {
        console.error(`MutexConstructorTest0900 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    MutexConstructorTest1000
     * @tc.number  SUB_MUTEX_CONSTRUCTOR_TEST_1000
     * @tc.desc    TC-08/TC-13: Verify a newly constructed Mutex is initially unlocked and lock() can be acquired immediately
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('MutexConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const mutex = new Mutex();
      let lockAcquired: boolean = false;
      try {
        mutex.lock();
        lockAcquired = true;
        mutex.unlock();
      } catch (e) {
        lockAcquired = false;
      }
      expect(lockAcquired).assertTrue();
    })
  })
}
