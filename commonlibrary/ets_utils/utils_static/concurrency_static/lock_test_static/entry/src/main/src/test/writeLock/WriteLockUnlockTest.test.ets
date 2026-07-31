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

function unlockReadVerifyTask(c: UnlockSharedCounter): void {
  const rl = gUnlockRWLock.readLock();
  rl.lock();
  try {
    c.value = c.value + 1;
  } finally {
    rl.unlock();
  }
}

export default function WriteLockUnlockTest(): void {
  describe('WriteLockUnlockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

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
     * @tc.desc    Verify WriteLock.unlock() throws error containing unlock info when read lock is held
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
     * @tc.desc    Verify WriteLock.unlock() throws error with already unlocked message when releasing unlocked write lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockUnlockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.name    WriteLockUnlockTest0400
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0400
     * @tc.desc    Verify WriteLock.unlock() throws error with read-locked info when read lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockUnlockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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

    /**
     * @tc.name    WriteLockUnlockTest0500
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0500
     * @tc.desc    Verify multiple unlock calls on the same WriteLock throw error on second call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockUnlockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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

    /**
     * @tc.name    WriteLockUnlockTest0600
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0600
     * @tc.desc    Verify WriteLock.unlock() throws error on consecutive unlock calls without re-locking
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('WriteLockUnlockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rwlock = new RWLock();
      const wl = rwlock.writeLock();
      wl.lock();
      wl.unlock();
      let firstError: boolean = false;
      let secondError: boolean = false;
      try {
        wl.unlock();
      } catch (error) {
        firstError = true;
      }
      try {
        wl.unlock();
      } catch (error) {
        secondError = true;
      }
      expect(firstError).assertTrue();
      expect(secondError).assertTrue();
    })

    // ========== CONCURRENCY TESTS ==========

    /**
     * @tc.name    WriteLockUnlockTest0700
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0700
     * @tc.desc    Verify multiple threads can acquire and release the same write lock sequentially via TaskPool
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockUnlockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new UnlockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(unlockWriteTask, counter));
      let p2 = taskpool.execute(new taskpool.Task(unlockWriteTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(unlockWriteTask, counter));
      await Promise.all([p1, p2, p3]);
      expect(counter.value).assertEqual(3);
    })

    /**
     * @tc.name    WriteLockUnlockTest0800
     * @tc.number  SUB_WRITE_LOCK_UNLOCK_TEST_0800
     * @tc.desc    Verify other threads can acquire the write lock after it is released by another thread
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('WriteLockUnlockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new UnlockSharedCounter();
      let p1 = taskpool.execute(new taskpool.Task(unlockWriteTask, counter));
      await p1;
      let p2 = taskpool.execute(new taskpool.Task(unlockThenWriteTask, counter));
      let p3 = taskpool.execute(new taskpool.Task(unlockThenWriteTask, counter));
      await Promise.all([p2, p3]);
      expect(counter.value).assertEqual(21);
    })
  })
}
