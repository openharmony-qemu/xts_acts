/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import { BaseClass, sleep } from '../utils/Model';

export default function MutexLockEnhancedTest() {
  describe('MutexLockEnhancedTest', (): void => {
    afterEach(async () => {
      await Utils.msSleep(200);
    })

    /**
     * @tc.number SUB_MutexLock_Enhanced_0100
     * @tc.name mutexLockEnhancedDeadlockCircularWait
     * @tc.desc Test circular wait deadlock scenario - Thread1: lockA->lockB, Thread2: lockB->lockA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedDeadlockCircularWait', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedDeadlockCircularWait';
        console.info(`${TAG} test start`);
        let lockA = new Mutex();
        let lockB = new Mutex();
        let result = new AtomicReference<string>('');
        let worker1Completed = new AtomicInt(0);
        let worker2Completed = new AtomicInt(0);

        let worker1 = new EAWorker();
        worker1.start();
        worker1.run<void>(() => {
          lockA.lock();
          result.exchange(result.load() + '1A');
          lockA.unlock();
          lockB.lock();
          result.exchange(result.load() + '1B');
          lockB.unlock();
          worker1Completed.fetchAdd(1);
        });

        let worker2 = new EAWorker();
        worker2.start();
        worker2.run<void>(() => {
          lockB.lock();
          result.exchange(result.load() + '2B');
          lockB.unlock();
          lockA.lock();
          result.exchange(result.load() + '2A');
          lockA.unlock();
          worker2Completed.fetchAdd(1);
        });

        worker1.join();
        worker2.join();

        while (worker1Completed.load() < 1 || worker2Completed.load() < 1) {
          await sleep(50);
        }

        console.info(`${TAG} result: ${result.load()}`);
        expect(result.load().length).assertLargerOrEqual(4);
        expect(worker1Completed.load()).assertEqual(1);
        expect(worker2Completed.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_0200
     * @tc.name mutexLockEnhancedSelfLock
     * @tc.desc Test repeated locking by same thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedSelfLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedSelfLock';
        console.info(`${TAG} test start`);
        let lock = new Mutex();
        let lockCount = new AtomicInt(0);
        let workerCompleted = new AtomicInt(0);

        lock.lock();
        lockCount.fetchAdd(1);

        let worker = new EAWorker();
        worker.start();
        let job = worker.run<void>(() => {
          lock.lock();
          lockCount.fetchAdd(1);
          lock.unlock();
          workerCompleted.fetchAdd(1);
        });

        await sleep(200);
        lock.unlock();

        job.Await();
        worker.join();

        while (workerCompleted.load() < 1) {
          await sleep(50);
        }

        console.info(`${TAG} lock count: ${lockCount.load()}`);
        expect(lockCount.load()).assertEqual(2);
        expect(workerCompleted.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_0300
     * @tc.name mutexLockEnhancedNestedLocks
     * @tc.desc Test nested lock usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedNestedLocks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedNestedLocks';
        console.info(`${TAG} test start`);
        let lock1 = new Mutex();
        let lock2 = new Mutex();
        let lock3 = new Mutex();
        let count = 0;

        lock1.lock();
        count++;
        lock2.lock();
        count++;
        lock3.lock();
        count++;

        lock3.unlock();
        lock2.unlock();
        lock1.unlock();

        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(3);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_0400
     * @tc.name mutexLockEnhancedMultiLockDeadlock
     * @tc.desc Test circular wait deadlock with three locks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mutexLockEnhancedMultiLockDeadlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedMultiLockDeadlock';
        console.info(`${TAG} test start`);
        let lockA = new Mutex();
        let lockB = new Mutex();
        let lockC = new Mutex();
        let resultCount = new AtomicInt(0);
        let worker1Completed = new AtomicInt(0);
        let worker2Completed = new AtomicInt(0);

        let worker1 = new EAWorker();
        worker1.start();
        worker1.run<void>(() => {
          lockA.lock();
          lockA.unlock();
          lockB.lock();
          lockB.unlock();
          lockC.lock();
          resultCount.fetchAdd(1);
          lockC.unlock();
          worker1Completed.fetchAdd(1);
        });

        let worker2 = new EAWorker();
        worker2.start();
        worker2.run<void>(() => {
          lockC.lock();
          lockC.unlock();
          lockB.lock();
          lockB.unlock();
          lockA.lock();
          resultCount.fetchAdd(1);
          lockA.unlock();
          worker2Completed.fetchAdd(1);
        });

        worker1.join();
        worker2.join();

        while (worker1Completed.load() < 1 || worker2Completed.load() < 1) {
          await sleep(50);
        }

        console.info(`${TAG} completed workers: ${resultCount.load()}`);
        expect(resultCount.load()).assertLargerOrEqual(2);
        expect(worker1Completed.load()).assertEqual(1);
        expect(worker2Completed.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_0500
     * @tc.name mutexLockEnhancedDoubleUnlock
     * @tc.desc Test double unlock exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedDoubleUnlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedDoubleUnlock';
        console.info(`${TAG} test start`);
        let lock = new Mutex();
        let errorCount = 0;

        lock.lock();
        lock.unlock();

        try {
          lock.unlock();
        } catch (e) {
          errorCount++;
          console.info(`${TAG} caught expected error: ${e.message}`);
        }

        console.info(`${TAG} error count: ${errorCount}`);
        expect(errorCount).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_0600
     * @tc.name mutexLockEnhancedUnlockWithoutLock
     * @tc.desc Test unlock without lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedUnlockWithoutLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedUnlockWithoutLock';
        console.info(`${TAG} test start`);
        let lock = new Mutex();
        let errorCount = 0;

        try {
          lock.unlock();
        } catch (e) {
          errorCount++;
          console.info(`${TAG} caught expected error: ${e.message}`);
        }

        console.info(`${TAG} error count: ${errorCount}`);
        expect(errorCount).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_0700
     * @tc.name mutexLockEnhancedStateAfterException
     * @tc.desc Test lock state after exception is thrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedStateAfterException', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedStateAfterException';
        console.info(`${TAG} test start`);
        let lock = new Mutex();
        let count = 0;

        lock.lock();
        try {
          count++;
          throw new Error("test exception");
        } catch (e) {
          console.info(`${TAG} caught exception: ${e.message}`);
        } finally {
          lock.unlock();
        }

        lock.lock();
        count++;
        lock.unlock();

        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(2);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_0800
     * @tc.name mutexLockEnhancedExceptionInWorker
     * @tc.desc Test impact of exception in Worker on lock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mutexLockEnhancedExceptionInWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedExceptionInWorker';
        console.info(`${TAG} test start`);
        let lock = new Mutex();
        let count = new AtomicInt(0);
        let exceptionHandled = new AtomicInt(0);

        let worker = new EAWorker();
        worker.setUncaughtExceptionHandler((e: Error) => {
          console.info(`${TAG} worker exception: ${e.message}`);
          exceptionHandled.fetchAdd(1);
          lock.unlock();
        });

        worker.start();
        let job = worker.run<void>(() => {
          lock.lock();
          count.fetchAdd(1);
          throw new Error("worker exception");
        });

        worker.join();

        while (exceptionHandled.load() < 1) {
          await sleep(50);
        }

        lock.lock();
        count.fetchAdd(1);
        lock.unlock();

        console.info(`${TAG} count: ${count.load()}, exception handled: ${exceptionHandled.load()}`);
        expect(count.load()).assertEqual(2);
        expect(exceptionHandled.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_0900
     * @tc.name mutexLockEnhancedEmptyCriticalSection
     * @tc.desc Test empty critical section
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mutexLockEnhancedEmptyCriticalSection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedEmptyCriticalSection';
        console.info(`${TAG} test start`);
        let lock = new Mutex();
        let count = 0;

        for (let i = 0; i < 100; i++) {
          lock.lock();
          lock.unlock();
          count++;
        }

        console.info(`${TAG} test result: ${count}`);
        expect(count).assertEqual(100);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_1000
     * @tc.name mutexLockEnhancedLockGuard
     * @tc.desc Test lockGuard method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedLockGuard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedLockGuard';
        console.info(`${TAG} test start`);
        let lock = new Mutex();
        let count = 0;

        lock.lockGuard(() => {
          count++;
        });

        let exceptionCaught = false;
        try {
          lock.lockGuard(() => {
            count++;
            throw new Error("test");
          });
        } catch (e) {
          exceptionCaught = true;
        }

        lock.lockGuard(() => {
          count++;
        });

        console.info(`${TAG} count: ${count}, exception caught: ${exceptionCaught}`);
        expect(count).assertEqual(3);
        expect(exceptionCaught).assertTrue();
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_1100
     * @tc.name mutexLockEnhancedWithTaskPool
     * @tc.desc Test Mutex and taskpool combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedWithTaskPool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedWithTaskPool';
        console.info(`${TAG} test start`);
        let lock = new Mutex();
        let count = new AtomicInt(0);
        let taskCount = 10;

        for (let i = 0; i < taskCount; i++) {
          taskpool.execute(() => {
            lock.lock();
            count.fetchAdd(1);
            lock.unlock();
          });
        }

        while (count.load() < taskCount) {
          await sleep(50);
        }

        console.info(`${TAG} final count: ${count.load()}`);
        expect(count.load()).assertEqual(taskCount);
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_1200
     * @tc.name mutexLockEnhancedMultipleLocksSameWorker
     * @tc.desc Test same worker using multiple different locks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedMultipleLocksSameWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedMultipleLocksSameWorker';
        console.info(`${TAG} test start`);
        let lock1 = new Mutex();
        let lock2 = new Mutex();
        let lock3 = new Mutex();
        let result = new AtomicReference<string>('');

        let worker = new EAWorker();
        worker.start();
        let job = worker.run<void>(() => {
          lock1.lock();
          result.exchange(result.load() + '1');
          lock2.lock();
          result.exchange(result.load() + '2');
          lock3.lock();
          result.exchange(result.load() + '3');
          lock3.unlock();
          lock2.unlock();
          lock1.unlock();
        });

        job.Await();
        worker.join();

        console.info(`${TAG} result: ${result.load()}`);
        expect(result.load()).assertEqual('123');
        Done();
      });

    /**
     * @tc.number SUB_MutexLock_Enhanced_1300
     * @tc.name mutexLockEnhancedSequentialLocking
     * @tc.desc Test sequential locking pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('mutexLockEnhancedSequentialLocking', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'mutexLockEnhancedSequentialLocking';
        console.info(`${TAG} test start`);
        let locks: Mutex[] = [new Mutex(), new Mutex(), new Mutex()];
        let count = new AtomicInt(0);
        let workerCount = 5;

        let jobs: Job<void>[] = [];
        for (let i = 0; i < workerCount; i++) {
          let worker = new EAWorker();
          worker.start();
          let job = worker.run<void>(() => {
            locks[0].lock();
            locks[1].lock();
            locks[2].lock();
            count.fetchAdd(1);
            locks[2].unlock();
            locks[1].unlock();
            locks[0].unlock();
          });
          jobs.push(job);
        }

        for (let i = 0; i < workerCount; i++) {
          jobs[i].Await();
        }

        while (count.load() < workerCount) {
          await sleep(50);
        }

        console.info(`${TAG} final count: ${count.load()}`);
        expect(count.load()).assertEqual(workerCount);
        Done();
      });
  })
}
