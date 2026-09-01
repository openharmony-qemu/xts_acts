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

class UnlockSharedCounter {
  value: number = 0;
}

const gUnlockRWLock: RWLock = new RWLock();

function unlockWriteTask(c: UnlockSharedCounter): void {
  const wl = gUnlockRWLock.writeLock();
  wl.lock();
  try {
    c.value++;
  } finally {
    wl.unlock();
  }
}

function unlockThenWriteTask(c: UnlockSharedCounter): void {
  const wl = gUnlockRWLock.writeLock();
  wl.lock();
  try {
    c.value = c.value + 10;
  } finally {
    wl.unlock();
  }
}

function unlockOwnerHolderTask(heldFlag: AtomicInt, holderUnlockOk: AtomicInt): void {
  const wl = gUnlockRWLock.writeLock();
  wl.lock();
  heldFlag.store(1);
  try {
    wl.unlock();
    holderUnlockOk.store(1);
  } catch (e) {
    holderUnlockOk.store(0);
  }
}

function unlockNonHolderTask(caught: AtomicInt): void {
  const wl = gUnlockRWLock.writeLock();
  try {
    wl.unlock();
    caught.store(0);
  } catch (e) {
    caught.store(1);
  }
}

export default function WriteLockUnlockTest(): void {
  describe('WriteLockUnlockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    // ========== INPUT TESTS ==========

    /**
     * @tc.name    WriteLockUnlockTest0100
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0100
     * @tc.desc    Verify WriteLock.unlock() throws error when called without prior lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('WriteLockUnlockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      let errorCaught: boolean = false;
      try {
        wl.unlock();
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.name    WriteLockUnlockTest0200
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0200
     * @tc.desc    Verify WriteLock.unlock() throws error when called while only the read lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockUnlockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const rl = rwlock.readLock();
      rl.lock();
      const wl = rwlock.writeLock();
      let errorCaught: boolean = false;
      try {
        wl.unlock();
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      rl.unlock();
    })

    // ========== RETURN VALUE TESTS ==========

    // ========== ERROR HANDLING TESTS ==========

    /**
     * @tc.name    WriteLockUnlockTest0300
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0300
     * @tc.desc    Verify multiple unlock calls on the same WriteLock throw error on second call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockUnlockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      wl.lock();
      wl.unlock();
      let errorCaught: boolean = false;
      try {
        wl.unlock();
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    })

    // ========== CONCURRENCY TESTS ==========

    /**
     * @tc.name    WriteLockUnlockTest0400
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0400
     * @tc.desc    Verify multiple threads can acquire and release the same write lock sequentially via TaskPool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockUnlockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const counter = new UnlockSharedCounter();
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(unlockWriteTask, counter)));
      }
      await Promise.all(promises);
      expect(counter.value).assertEqual(3);
      } catch (error) {
        console.error(`WriteLockUnlockTest0400 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    WriteLockUnlockTest0500
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0500
     * @tc.desc    Verify other threads can acquire the write lock after it is released by another thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockUnlockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const counter = new UnlockSharedCounter();
      await taskpool.execute(new taskpool.Task(unlockWriteTask, counter));
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 2; i++) {
        promises.push(taskpool.execute(new taskpool.Task(unlockThenWriteTask, counter)));
      }
      await Promise.all(promises);
      expect(counter.value).assertEqual(21);
      } catch (error) {
        console.error(`WriteLockUnlockTest0500 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })

    // ========== RETURN VALUE TESTS (supplement) ==========

    /**
     * @tc.name    WriteLockUnlockTest0600
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0600
     * @tc.desc    Verify WriteLock.unlock() releases the write lock so the same thread can call lock() again successfully
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockUnlockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      wl.lock();
      wl.unlock();
      let reacquired: boolean = false;
      wl.lock();
      try {
        reacquired = true;
      } finally {
        wl.unlock();
      }
      expect(reacquired).assertTrue();
    })

    // ========== CONCURRENCY TESTS (supplement) ==========

    /**
     * @tc.name    WriteLockUnlockTest0700
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0700
     * @tc.desc    Verify WriteLock.unlock() with real EAWorker threads: the holding thread's release succeeds, and threads that do not hold the write lock throw when attempting to release it
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockUnlockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const heldFlag = new AtomicInt(0);
      const holderUnlockOk = new AtomicInt(-1);
      const caughtA = new AtomicInt(-1);
      const caughtB = new AtomicInt(-1);
      const holderW = new EAWorker('wlUnlockOwnerHolder');
      holderW.start();
      try {
        const holderRun = holderW.run<void>(unlockOwnerHolderTask, heldFlag, holderUnlockOk);
        let attempts: number = 0;
        while (heldFlag.load() === 0 && attempts < 50) {
          await Utils.msSleep(100);
          attempts++;
        }
        expect(heldFlag.load()).assertEqual(1);
        await holderRun;
        // Only the holder's release succeeds
        expect(holderUnlockOk.load()).assertEqual(1);
      } finally {
        holderW.quit();
      }
      const nonHolderA = new EAWorker('wlUnlockNonHolderA');
      nonHolderA.start();
      try {
        await nonHolderA.run<void>(unlockNonHolderTask, caughtA);
      } finally {
        nonHolderA.quit();
      }
      const nonHolderB = new EAWorker('wlUnlockNonHolderB');
      nonHolderB.start();
      try {
        await nonHolderB.run<void>(unlockNonHolderTask, caughtB);
      } finally {
        nonHolderB.quit();
      }
      // Non-holder threads cannot release the same write lock: their unlock attempts throw
      expect(caughtA.load()).assertEqual(1);
      expect(caughtB.load()).assertEqual(1);
      } catch (error) {
        console.error(`WriteLockUnlockTest0700 failed: ${error}`);
        expect(false).assertFail();
      }
      done();
    })
  })
}
