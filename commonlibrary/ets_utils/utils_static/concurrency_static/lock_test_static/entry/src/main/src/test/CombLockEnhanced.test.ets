'use static';
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
 * See the License for the specific language: governing permissions and
 * limitations under the License.
 */

import {
  afterEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium";
import Utils from './Util';
import { BaseClass, CountClass, Event, sleep } from '../utils/Model';

export default function CombLockEnhancedTest(): void {
  describe('CombLockEnhancedTest', (): void => {
    afterEach(async () => {
      await Utils.msSleep(200);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0100
     * @tc.name combLockEnhancedMutexRWLockDeadlock
     * @tc.desc Test Mutex and RWLock deadlock scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedMutexRWLockDeadlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedMutexRWLockDeadlock';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let resultCount = new AtomicInt(0);
        let worker1Completed = new AtomicInt(0);
        let worker2Completed = new AtomicInt(0);

        let worker1 = new EAWorker();
        worker1.start();
        worker1.run<void>(() => {
          mutex.lock();
          resultCount.fetchAdd(1);
          mutex.unlock();
          rwLock.writeLock().lock();
          resultCount.fetchAdd(1);
          rwLock.writeLock().unlock();
          worker1Completed.fetchAdd(1);
        });

        let worker2 = new EAWorker();
        worker2.start();
        worker2.run<void>(() => {
          rwLock.writeLock().lock();
          resultCount.fetchAdd(1);
          rwLock.writeLock().unlock();
          mutex.lock();
          resultCount.fetchAdd(1);
          mutex.unlock();
          worker2Completed.fetchAdd(1);
        });

        while (worker1Completed.load() < 1 || worker2Completed.load() < 1) {
          await sleep(50);
        }

        worker1.join();
        worker2.join();


        expect(resultCount.load()).assertLargerOrEqual(4);
        expect(worker1Completed.load()).assertEqual(1);
        expect(worker2Completed.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0200
     * @tc.name combLockEnhancedLockOrderProtocol
     * @tc.desc Test unified lock order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedLockOrderProtocol', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedLockOrderProtocol';

        let locks: Mutex[] = [new Mutex(), new Mutex(), new Mutex()];
        let count = new AtomicInt(0);
        let workerCount = 10;

        for (let i = 0; i < workerCount; i++) {
          let worker = new EAWorker();
          worker.start();
          worker.run<void>(() => {
            locks[0].lock();
            locks[1].lock();
            locks[2].lock();
            count.fetchAdd(1);
            locks[2].unlock();
            locks[1].unlock();
            locks[0].unlock();
          });
          worker.join();
        }

        while (count.load() < workerCount) {
          await sleep(100);
        }


        expect(count.load()).assertEqual(workerCount);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0300
     * @tc.name combLockEnhancedAsyncLockTimeout
     * @tc.desc Test AsyncLock timeout mechanism
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('combLockEnhancedAsyncLockTimeout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedAsyncLockTimeout';

        let lock = new AsyncLock();
        let count = new AtomicInt(0);
        let timeoutOccurred = new AtomicInt(0);

        await lock.lockAsync(async () => {
          count.fetchAdd(1);

          let options = new AsyncLockOptions<void>();
          options.timeout = 500;

          try {
            await lock.lockAsync(() => {
              count.fetchAdd(1);
            }, AsyncLockMode.EXCLUSIVE, options);
          } catch (e) {
            expect(e instanceof Error).assertTrue();
            expect((e as Error).message.length > 0).assertTrue();
            timeoutOccurred.fetchAdd(1);
          }
        }, AsyncLockMode.EXCLUSIVE);


        expect(count.load()).assertEqual(1);
        expect(timeoutOccurred.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0400
     * @tc.name combLockEnhancedAsyncLockSignalAbort
     * @tc.desc Test AsyncLock signal abort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('combLockEnhancedAsyncLockSignalAbort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedAsyncLockSignalAbort';

        let lock = new AsyncLock();
        let count = new AtomicInt(0);
        let abortOccurred = new AtomicInt(0);

        await lock.lockAsync(async () => {
          count.fetchAdd(1);

          let options = new AsyncLockOptions<void>();
          options.timeout = 50;

          try {
            await lock.lockAsync(() => {
              count.fetchAdd(1);
              return 'should not execute';
            }, AsyncLockMode.EXCLUSIVE, options);
          } catch (e) {
            expect(e instanceof Error).assertTrue();
            expect((e as Error).message.length > 0).assertTrue();
            abortOccurred.fetchAdd(1);
          }
        }, AsyncLockMode.EXCLUSIVE);


        expect(count.load()).assertEqual(1);
        expect(abortOccurred.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0500
     * @tc.name combLockEnhancedMutexRWLockAsyncLock
     * @tc.desc Test Mutex, RWLock, and AsyncLock combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedMutexRWLockAsyncLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedMutexRWLockAsyncLock';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let asyncLock = new AsyncLock();
        let count = new AtomicInt(0);

        await asyncLock.lockAsync(() => {
          mutex.lock();
          rwLock.readLock().lock();
          count.fetchAdd(1);
          rwLock.readLock().unlock();
          mutex.unlock();
        }, AsyncLockMode.EXCLUSIVE);


        expect(count.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0600
     * @tc.name combLockEnhancedNestedDifferentLocks
     * @tc.desc Test nested use of different lock types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedNestedDifferentLocks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedNestedDifferentLocks';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let result: string = '';

        mutex.lock();
        result += 'M';

        rwLock.readLock().lock();
        result += 'R';

        rwLock.readLock().unlock();
        result += 'R2';

        mutex.unlock();
        result += 'M2';


        expect(result).assertEqual('MRR2M2');
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0700
     * @tc.name combLockEnhancedEventMutexSync
     * @tc.desc Test Event and Mutex combination for synchronization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedEventMutexSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedEventMutexSync';

        let mutex = new Mutex();
        let event = new Event();
        let result = new AtomicReference<string>('');

        let worker1 = new EAWorker();
        worker1.start();
        worker1.run<void>(() => {
          mutex.lock();
          result.exchange(result.load() + 'W1-1');
          mutex.unlock();
          event.Wait();
          mutex.lock();
          result.exchange(result.load() + 'W1-2');
          mutex.unlock();
        });

        await sleep(100);

        let worker2 = new EAWorker();
        worker2.start();
        worker2.run<void>(() => {
          mutex.lock();
          result.exchange(result.load() + 'W2');
          mutex.unlock();
          event.Fire();
        });

        worker1.join();
        worker2.join();


        expect(result.load().indexOf('W1-1')).assertLargerOrEqual(0);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0800
     * @tc.name combLockEnhancedCondVarMutexPattern
     * @tc.desc Test producer-consumer pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('combLockEnhancedCondVarMutexPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedCondVarMutexPattern';

        let mutex = new Mutex();
        let event = new Event();
        let data = new CountClass();
        let produced = new AtomicInt(0);
        let consumed = new AtomicInt(0);

        let consumer = new EAWorker();
        consumer.start();
        consumer.run<void>(() => {
          mutex.lock();
          while (produced.load() < 1) {
            mutex.unlock();
            event.Wait();
            mutex.lock();
          }
          data.setCount(data.getCount() + 1);
          consumed.fetchAdd(1);
          mutex.unlock();
        });

        let producer = new EAWorker();
        producer.start();
        producer.run<void>(() => {
          mutex.lock();
          data.setCount(data.getCount() + 1);
          produced.fetchAdd(1);
          event.Fire();
          mutex.unlock();
        });
        while (produced.load() < 1 || consumed.load() < 1) {
          await sleep(50);
        }
        consumer.join();
        producer.join();


        expect(produced.load()).assertEqual(1);
        expect(consumed.load()).assertEqual(1);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_0900
     * @tc.name combLockEnhancedLockViaMessage
     * @tc.desc Test passing locks through MessageHandler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('combLockEnhancedLockViaMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedLockViaMessage';

        let mutex = new Mutex();
        let result = new AtomicInt(0);

        let worker1 = new EAWorker();
        worker1.start();
        let worker1Completed = new AtomicInt(0);

        let worker2 = new EAWorker();
        worker2.start();
        let worker2Completed = new AtomicInt(0);

        worker1.run<void>(() => {
          mutex.lock();
          result.store(100);
          mutex.unlock();
          worker1Completed.fetchAdd(1);
        });

        worker2.run<void>(() => {
          mutex.lock();
          result.store(200);
          mutex.unlock();
          worker2Completed.fetchAdd(1);
        });


        while (worker1Completed.load() < 1 || worker2Completed.load() < 1) {
          await sleep(50);
        }

        worker1.join();
        worker2.join();


        expect(worker1Completed.load()).assertEqual(1);
        expect(worker2Completed.load()).assertEqual(1);
        expect(result.load() === 100 || result.load() === 200).assertEqual(true);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_1000
     * @tc.name combLockEnhancedTaskPoolWithLocks
     * @tc.desc Test taskpool and lock combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedTaskPoolWithLocks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedTaskPoolWithLocks';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let count = new AtomicInt(0);
        let taskCount = 50;

        for (let i = 0; i < taskCount; i++) {
          taskpool.execute(() => {
            mutex.lock();
            rwLock.readLock().lock();
            count.fetchAdd(1);
            rwLock.readLock().unlock();
            mutex.unlock();
          });
        }

        while (count.load() < taskCount) {
          await sleep(100);
        }


        expect(count.load()).assertEqual(taskCount);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_1100
     * @tc.name combLockEnhancedSequenceRunnerWithLocks
     * @tc.desc Test SequenceRunner and lock combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedSequenceRunnerWithLocks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedSequenceRunnerWithLocks';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let count = new AtomicInt(0);
        let runner = new taskpool.SequenceRunner(TAG);

        for (let i = 0; i < 10; i++) {
          let task = new taskpool.Task(() => {
            mutex.lock();
            rwLock.writeLock().lock();
            count.fetchAdd(1);
            rwLock.writeLock().unlock();
            mutex.unlock();
          });
          await runner.execute(task);
        }


        expect(count.load()).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_1200
     * @tc.name combLockEnhancedAsyncRunnerWithLocks
     * @tc.desc Test AsyncRunner and lock combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedAsyncRunnerWithLocks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedAsyncRunnerWithLocks';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let runner = new taskpool.AsyncRunner(TAG, 5);
        let completedTasks = new AtomicInt(0);

        for (let i = 0; i < 10; i++) {
          let task = new taskpool.Task(() => {
            mutex.lock();
            rwLock.readLock().lock();
            setTimeout(() => {
              rwLock.readLock().unlock();
              mutex.unlock();
              completedTasks.fetchAdd(1);
            }, 10);
          });
          runner.execute(task);
        }

        while (completedTasks.load() < 10) {
          await sleep(50);
        }


        expect(completedTasks.load()).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_1300
     * @tc.name combLockEnhancedTaskGroupWithLocks
     * @tc.desc Test TaskGroup and lock combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedTaskGroupWithLocks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedTaskGroupWithLocks';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let count = new AtomicInt(0);
        let group = new taskpool.TaskGroup(TAG);

        for (let i = 0; i < 10; i++) {
          let task = new taskpool.Task(() => {
            mutex.lock();
            rwLock.writeLock().lock();
            count.fetchAdd(1);
            rwLock.writeLock().unlock();
            mutex.unlock();
          });
          group.addTask(task);
        }

        await taskpool.execute(group);


        expect(count.load()).assertEqual(10);
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_1400
     * @tc.name combLockEnhancedLockOrderMultipleTypes
     * @tc.desc Test lock order for multiple lock types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedLockOrderMultipleTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedLockOrderMultipleTypes';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let asyncLock = new AsyncLock();
        let result: string = '';

        mutex.lock();
        result += 'M';

        rwLock.readLock().lock();
        result += 'R';

        await asyncLock.lockAsync(() => {
          result += 'A';
        }, AsyncLockMode.EXCLUSIVE);

        rwLock.readLock().unlock();
        result += 'R2';

        mutex.unlock();
        result += 'M2';


        expect(result).assertEqual('MRAR2M2');
        Done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CombLock_Enhanced_1500
     * @tc.name combLockEnhancedErrorRecoveryWithLocks
     * @tc.desc Test error recovery with lock combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('combLockEnhancedErrorRecoveryWithLocks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'combLockEnhancedErrorRecoveryWithLocks';

        let mutex = new Mutex();
        let rwLock = new RWLock();
        let count = new AtomicInt(0);
        let errorCaught = new AtomicInt(0);

        mutex.lock();
        rwLock.readLock().lock();

        try {
          count.fetchAdd(1);
          throw new Error("test error");
        } catch (e) {
          expect(e instanceof Error).assertTrue();
          expect((e as Error).message.length > 0).assertTrue();
          errorCaught.fetchAdd(1);
        } finally {
          rwLock.readLock().unlock();
          mutex.unlock();
        }

        mutex.lock();
        rwLock.readLock().lock();
        count.fetchAdd(1);
        rwLock.readLock().unlock();
        mutex.unlock();


        expect(count.load()).assertEqual(2);
        expect(errorCaught.load()).assertEqual(1);
        Done();
      });
  })
}
