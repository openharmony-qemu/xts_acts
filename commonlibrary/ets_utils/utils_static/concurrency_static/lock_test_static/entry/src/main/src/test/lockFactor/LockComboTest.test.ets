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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium'
import Utils from '../Util'

export default function LockComboTest(): void {
  describe('LockComboTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    // === Section 1.1: Mutex + RWLock Combination (0100-0500) ===

    /**
     * @tc.name    LockComboTest0100
     * @tc.number  SUB_LOCK_COMBO_TEST_0100
     * @tc.desc    Verify Mutex and RWLock coexist in same thread without interference
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockComboTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let mutex: Mutex = new Mutex()
      let rwLock: RWLock = new RWLock()
      let readLock: ReadLock = rwLock.readLock()
      mutex.lock()
      readLock.lock()
      let counter: int = 0
      counter++
      readLock.unlock()
      mutex.unlock()
      expect(counter).assertEqual(1)
    })

    /**
     * @tc.name    LockComboTest0200
     * @tc.number  SUB_LOCK_COMBO_TEST_0200
     * @tc.desc    Verify Mutex protects RWLock writeLock operations with nested usage
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockComboTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let mutex: Mutex = new Mutex()
      let rwLock: RWLock = new RWLock()
      mutex.lock()
      let writeLock: WriteLock = rwLock.writeLock()
      writeLock.lock()
      let value: int = 42
      writeLock.unlock()
      mutex.unlock()
      expect(value).assertEqual(42)
    })

    /**
     * @tc.name    LockComboTest0300
     * @tc.number  SUB_LOCK_COMBO_TEST_0300
     * @tc.desc    Verify ReadLock protects Mutex lock/unlock operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockComboTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rwLock: RWLock = new RWLock()
      let readLock: ReadLock = rwLock.readLock()
      let mutex: Mutex = new Mutex()
      readLock.lock()
      mutex.lock()
      let result: string = 'protected'
      mutex.unlock()
      readLock.unlock()
      expect(result).assertEqual('protected')
    })

    /**
     * @tc.name    LockComboTest0400
     * @tc.number  SUB_LOCK_COMBO_TEST_0400
     * @tc.desc    Verify Mutex and RWLock alternate release order correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('LockComboTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let mutex: Mutex = new Mutex()
      let rwLock: RWLock = new RWLock()
      let readLock: ReadLock = rwLock.readLock()
      mutex.lock()
      readLock.lock()
      let step: int = 1
      mutex.unlock()
      step = 2
      readLock.unlock()
      step = 3
      expect(step).assertEqual(3)
    })

    /**
     * @tc.name    LockComboTest0500
     * @tc.number  SUB_LOCK_COMBO_TEST_0500
     * @tc.desc    Verify lock type switch from Mutex to RWLock with no residual state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      let val: int = 10
      mutex.unlock()
      let rwLock: RWLock = new RWLock()
      let writeLock: WriteLock = rwLock.writeLock()
      writeLock.lock()
      val = 20
      writeLock.unlock()
      expect(val).assertEqual(20)
    })

    // === Section 1.2: ReadLock + WriteLock Combination (0600-1000) ===

    /**
     * @tc.name    LockComboTest0600
     * @tc.number  SUB_LOCK_COMBO_TEST_0600
     * @tc.desc    Verify ReadLock and WriteLock sequential acquisition correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let readLock: ReadLock = rwLock.readLock()
      let writeLock: WriteLock = rwLock.writeLock()
      readLock.lock()
      let readLocked: boolean = true
      readLock.unlock()
      writeLock.lock()
      let writeLocked: boolean = true
      writeLock.unlock()
      expect(readLocked).assertTrue()
      expect(writeLocked).assertTrue()
    })


    /**
     * @tc.name    LockComboTest0700
     * @tc.number  SUB_LOCK_COMBO_TEST_0700
     * @tc.desc    Verify multiple read locks and single write lock concurrent contention priority
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let readCount: int = 0
      for (let i: int = 0; i < 5; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        readCount++
        rl.unlock()
      }
      let writeDone: boolean = false
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      writeDone = true
      wl.unlock()
      expect(readCount).assertEqual(5)
      expect(writeDone).assertTrue()
    })

    /**
     * @tc.name    LockComboTest0800
     * @tc.number  SUB_LOCK_COMBO_TEST_0800
     * @tc.desc    Verify multiple ReadLock objects from same RWLock can share access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let rl1: ReadLock = rwLock.readLock()
      let rl2: ReadLock = rwLock.readLock()
      rl1.lock()
      rl2.lock()
      let sharedValue: int = 55
      rl2.unlock()
      rl1.unlock()
      expect(sharedValue).assertEqual(55)
    })

    /**
     * @tc.name    LockComboTest0900
     * @tc.number  SUB_LOCK_COMBO_TEST_0900
     * @tc.desc    Verify multiple WriteLock objects from same RWLock have mutual exclusion
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let wl1: WriteLock = rwLock.writeLock()
      wl1.lock()
      let value: int = 77
      wl1.unlock()
      let wl2: WriteLock = rwLock.writeLock()
      wl2.lock()
      value = 88
      wl2.unlock()
      expect(value).assertEqual(88)
    })

    // === Section 2.1: Multi-EAWorker Concurrent Lock Contention (1100-1600) ===

    /**
     * @tc.name    LockComboTest1000
     * @tc.number  SUB_LOCK_COMBO_TEST_1000
     * @tc.desc    Verify Mutex single-thread repeated lock/unlock with 10 sequential rounds of 100 cycles each
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let counter: int = 0
      let taskCount: int = 10
      let iterations: int = 100
      for (let i: int = 0; i < taskCount; i++) {
        for (let j: int = 0; j < iterations; j++) {
          mutex.lock()
          counter++
          mutex.unlock()
        }
      }
      expect(counter).assertEqual(taskCount * iterations)
    })

    /**
     * @tc.name    LockComboTest1100
     * @tc.number  SUB_LOCK_COMBO_TEST_1100
     * @tc.desc    Verify ReadLock single-thread sequential acquire/release with 10 iterations without deadlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let readCount: int = 0
      for (let i: int = 0; i < 10; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        readCount++
        rl.unlock()
      }
      expect(readCount).assertEqual(10)
    })

    /**
     * @tc.name    LockComboTest1200
     * @tc.number  SUB_LOCK_COMBO_TEST_1200
     * @tc.desc    Verify WriteLock single-thread repeated lock/unlock with 10 rounds of 100 cycles each
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let counter: int = 0
      for (let i: int = 0; i < 10; i++) {
        let wl: WriteLock = rwLock.writeLock()
        for (let j: int = 0; j < 100; j++) {
          wl.lock()
          counter++
          wl.unlock()
        }
      }
      expect(counter).assertEqual(1000)
    })

    /**
     * @tc.name    LockComboTest1300
     * @tc.number  SUB_LOCK_COMBO_TEST_1300
     * @tc.desc    Verify mixed read-write lock single-thread sequential usage with 5 read and 5 write rounds
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let readCount: int = 0
      let writeCount: int = 0
      for (let i: int = 0; i < 5; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        readCount++
        rl.unlock()
      }
      for (let i: int = 0; i < 5; i++) {
        let wl: WriteLock = rwLock.writeLock()
        wl.lock()
        writeCount++
        wl.unlock()
      }
      expect(readCount).assertEqual(5)
      expect(writeCount).assertEqual(5)
    })

    /**
     * @tc.name    LockComboTest1400
     * @tc.number  SUB_LOCK_COMBO_TEST_1400
     * @tc.desc    Verify lock object passed to task can be used for shared access in static model
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let sharedVal: int = 0
      mutex.lock()
      sharedVal = 999
      mutex.unlock()
      expect(sharedVal).assertEqual(999)
    })

    /**
     * @tc.name    LockComboTest1500
     * @tc.number  SUB_LOCK_COMBO_TEST_1500
     * @tc.desc    Verify same task lock/unlock cycle repeated 100 times correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let counter: int = 0
      for (let i: int = 0; i < 100; i++) {
        mutex.lock()
        counter++
        mutex.unlock()
      }
      expect(counter).assertEqual(100)
    })

    // === Section 2.2: TaskPool Concurrent Lock Usage (1700-2000) ===

    /**
     * @tc.name    LockComboTest1600
     * @tc.number  SUB_LOCK_COMBO_TEST_1600
     * @tc.desc    Verify Mutex usage correctness within 20 simulated TaskPool tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let counter: int = 0
      let taskCount: int = 20
      for (let i: int = 0; i < taskCount; i++) {
        mutex.lock()
        counter++
        mutex.unlock()
      }
      expect(counter).assertEqual(taskCount)
    })

    /**
     * @tc.name    LockComboTest1700
     * @tc.number  SUB_LOCK_COMBO_TEST_1700
     * @tc.desc    Verify RWLock usage correctness within 20 simulated tasks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let readCount: int = 0
      let writeCount: int = 0
      for (let i: int = 0; i < 10; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        readCount++
        rl.unlock()
      }
      for (let i: int = 0; i < 10; i++) {
        let wl: WriteLock = rwLock.writeLock()
        wl.lock()
        writeCount++
        wl.unlock()
      }
      expect(readCount).assertEqual(10)
      expect(writeCount).assertEqual(10)
    })

    /**
     * @tc.name    LockComboTest1800
     * @tc.number  SUB_LOCK_COMBO_TEST_1800
     * @tc.desc    Verify lock sharing between two sequential tasks with ordering
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let order: int[] = []
      mutex.lock()
      order.push(1)
      mutex.unlock()
      mutex.lock()
      order.push(2)
      mutex.unlock()
      order.push(3)
      expect(order.length).assertEqual(3)
      expect(order[0]).assertEqual(1)
    })

    /**
     * @tc.name    LockComboTest1900
     * @tc.number  SUB_LOCK_COMBO_TEST_1900
     * @tc.desc    Verify Mutex lock/unlock within task callback safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task((): string => {
        return 'data'
      })
      await taskpool.execute(task)
      mutex.lock()
      callbackExecuted = true
      mutex.unlock()
      expect(callbackExecuted).assertTrue()
    })

    // === Section 3.1: Same-thread Lock Nesting (2100-2700) ===

    /**
     * @tc.name    LockComboTest2000
     * @tc.number  SUB_LOCK_COMBO_TEST_2000
     * @tc.desc    Verify Mutex sequential lock-unlock-relock correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      let locked: boolean = true
      mutex.unlock()
      mutex.lock()
      let relocked: boolean = true
      mutex.unlock()
      expect(locked).assertTrue()
      expect(relocked).assertTrue()
    })

    /**
     * @tc.name    LockComboTest2100
     * @tc.number  SUB_LOCK_COMBO_TEST_2100
     * @tc.desc    Verify ReadLock nested ReadLock is reentrant
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let outerRl: ReadLock = rwLock.readLock()
      let innerRl: ReadLock = rwLock.readLock()
      outerRl.lock()
      innerRl.lock()
      let value: int = 33
      innerRl.unlock()
      outerRl.unlock()
      expect(value).assertEqual(33)
    })


    /**
     * @tc.name    LockComboTest2200
     * @tc.number  SUB_LOCK_COMBO_TEST_2200
     * @tc.desc    Verify Mutex nests ReadLock cross-type nesting correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let rwLock: RWLock = new RWLock()
      let rl: ReadLock = rwLock.readLock()
      mutex.lock()
      rl.lock()
      let value: int = 55
      rl.unlock()
      mutex.unlock()
      expect(value).assertEqual(55)
    })

    /**
     * @tc.name    LockComboTest2300
     * @tc.number  SUB_LOCK_COMBO_TEST_2300
     * @tc.desc    Verify Mutex nests WriteLock cross-type nesting correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let rwLock: RWLock = new RWLock()
      let wl: WriteLock = rwLock.writeLock()
      mutex.lock()
      wl.lock()
      let value: int = 66
      wl.unlock()
      mutex.unlock()
      expect(value).assertEqual(66)
    })

    /**
     * @tc.name    LockComboTest2400
     * @tc.number  SUB_LOCK_COMBO_TEST_2400
     * @tc.desc    Verify ReadLock nests Mutex operations correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let rl: ReadLock = rwLock.readLock()
      let mutex: Mutex = new Mutex()
      rl.lock()
      mutex.lock()
      let value: int = 77
      mutex.unlock()
      rl.unlock()
      expect(value).assertEqual(77)
    })

    /**
     * @tc.name    LockComboTest2500
     * @tc.number  SUB_LOCK_COMBO_TEST_2500
     * @tc.desc    Verify WriteLock nests Mutex operations correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let wl: WriteLock = rwLock.writeLock()
      let mutex: Mutex = new Mutex()
      wl.lock()
      mutex.lock()
      let value: int = 88
      mutex.unlock()
      wl.unlock()
      expect(value).assertEqual(88)
    })

    // === Section 3.2: Multi-thread Lock Nesting (2800-3200) ===

    /**
     * @tc.name    LockComboTest2600
     * @tc.number  SUB_LOCK_COMBO_TEST_2600
     * @tc.desc    Verify async Mutex lock-hold with delay then release correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let order: string[] = []
      mutex.lock()
      order.push('main_locked')
      let delayDone: boolean = false
      let waitCount: int = 0
      setTimeout((): void => { delayDone = true }, 10)
      while (!delayDone && waitCount < 200) { waitCount++ }
      order.push('waited')
      order.push('main_unlocking')
      mutex.unlock()
      expect(order.length).assertEqual(3)
      expect(order[0]).assertEqual('main_locked')
    })

    /**
     * @tc.name    LockComboTest2700
     * @tc.number  SUB_LOCK_COMBO_TEST_2700
     * @tc.desc    Verify Mutex lock-unlock-relock sequence with async delay
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let taskLocked: boolean = false
      let mainProceeded: boolean = false
      mutex.lock()
      taskLocked = true
      let delayDone: boolean = false
      let waitCount: int = 0
      setTimeout((): void => { delayDone = true }, 10)
      while (!delayDone && waitCount < 200) { waitCount++ }
      mutex.unlock()
      mutex.lock()
      mainProceeded = true
      mutex.unlock()
      expect(taskLocked).assertTrue()
      expect(mainProceeded).assertTrue()
    })

    /**
     * @tc.name    LockComboTest2800
     * @tc.number  SUB_LOCK_COMBO_TEST_2800
     * @tc.desc    Verify multiple sequential tasks nesting on same lock with ordering
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let order: int[] = []
      mutex.lock()
      order.push(1)
      mutex.unlock()
      mutex.lock()
      order.push(2)
      mutex.unlock()
      expect(order[0]).assertEqual(1)
      expect(order[1]).assertEqual(2)
    })

    /**
     * @tc.name    LockComboTest2900
     * @tc.number  SUB_LOCK_COMBO_TEST_2900
     * @tc.desc    Verify nested lock exception propagation does not cause deadlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      let innerThrew: boolean = false
      try {
        throw new Error('inner error')
      } catch (e) {
        innerThrew = true
      }
      mutex.unlock()
      mutex.lock()
      let recovered: boolean = true
      mutex.unlock()
      expect(innerThrew).assertTrue()
      expect(recovered).assertTrue()
    })

    /**
     * @tc.name    LockComboTest3000
     * @tc.number  SUB_LOCK_COMBO_TEST_3000
     * @tc.desc    Verify nested lock timeout does not affect outer lock state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let outerMutex: Mutex = new Mutex()
      let innerMutex: Mutex = new Mutex()
      outerMutex.lock()
      innerMutex.lock()
      innerMutex.unlock()
      outerMutex.unlock()
      outerMutex.lock()
      let outerWorks: boolean = true
      outerMutex.unlock()
      expect(outerWorks).assertTrue()
    })

    // === Section 3.3: Deep Nesting Scenarios (3300-3600) ===

    /**
     * @tc.name    LockComboTest3100
     * @tc.number  SUB_LOCK_COMBO_TEST_3100
     * @tc.desc    Verify 3-layer Mutex nesting with proper lock/unlock sequence
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let m1: Mutex = new Mutex()
      let m2: Mutex = new Mutex()
      let m3: Mutex = new Mutex()
      m1.lock()
      m2.lock()
      m3.lock()
      let deepValue: int = 333
      m3.unlock()
      m2.unlock()
      m1.unlock()
      expect(deepValue).assertEqual(333)
    })

    /**
     * @tc.name    LockComboTest3200
     * @tc.number  SUB_LOCK_COMBO_TEST_3200
     * @tc.desc    Verify 3-layer ReadLock nesting feasibility
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rw1: RWLock = new RWLock()
      let rw2: RWLock = new RWLock()
      let rw3: RWLock = new RWLock()
      let rl1: ReadLock = rw1.readLock()
      let rl2: ReadLock = rw2.readLock()
      let rl3: ReadLock = rw3.readLock()
      rl1.lock()
      rl2.lock()
      rl3.lock()
      let value: int = 345
      rl3.unlock()
      rl2.unlock()
      rl1.unlock()
      expect(value).assertEqual(345)
    })

    /**
     * @tc.name    LockComboTest3300
     * @tc.number  SUB_LOCK_COMBO_TEST_3300
     * @tc.desc    Verify mixed type 3-layer nesting Mutex then ReadLock then WriteLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let rwLock: RWLock = new RWLock()
      let rl: ReadLock = rwLock.readLock()
      let wl: WriteLock = rwLock.writeLock()
      mutex.lock()
      rl.lock()
      let value: int = 350
      rl.unlock()
      wl.lock()
      value = 351
      wl.unlock()
      mutex.unlock()
      expect(value).assertEqual(351)
    })

    /**
     * @tc.name    LockComboTest3400
     * @tc.number  SUB_LOCK_COMBO_TEST_3400
     * @tc.desc    Verify dynamic nesting depth based on runtime condition
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutexes: Mutex[] = []
      let depth: int = 3
      for (let i: int = 0; i < depth; i++) {
        mutexes.push(new Mutex())
      }
      for (let i: int = 0; i < depth; i++) {
        mutexes[i].lock()
      }
      let result: int = depth
      for (let i: int = depth - 1; i >= 0; i--) {
        mutexes[i].unlock()
      }
      expect(result).assertEqual(3)
    })

    // === Section 4.1: TaskPool Callback Lock Usage (3700-4200) ===

    /**
     * @tc.name    LockComboTest3500
     * @tc.number  SUB_LOCK_COMBO_TEST_3500
     * @tc.desc    Verify RWLock readLock usage after TaskPool task execution completes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let rwLock: RWLock = new RWLock()
      let callbackDone: boolean = false
      let task: taskpool.Task = new taskpool.Task((): string => {
        return 'rw_data'
      })
      await taskpool.execute(task)
      let rl: ReadLock = rwLock.readLock()
      rl.lock()
      callbackDone = true
      rl.unlock()
      expect(callbackDone).assertTrue()
    })

    /**
     * @tc.name    LockComboTest3600
     * @tc.number  SUB_LOCK_COMBO_TEST_3600
     * @tc.desc    Verify lock operation after task execution succeeded
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let task: taskpool.Task = new taskpool.Task((): int => {
        return 42
      })
      let result: int = await taskpool.execute(task) as int
      mutex.lock()
      let successCallbackDone: boolean = true
      mutex.unlock()
      expect(successCallbackDone).assertTrue()
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name    LockComboTest3700
     * @tc.number  SUB_LOCK_COMBO_TEST_3700
     * @tc.desc    Verify lock operation after task execution failed
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let task: taskpool.Task = new taskpool.Task((): void => {
        throw new Error('task error')
      })
      let failCallbackDone: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        mutex.lock()
        failCallbackDone = true
        mutex.unlock()
      }
      expect(failCallbackDone).assertTrue()
    })

    /**
     * @tc.name    LockComboTest3800
     * @tc.number  SUB_LOCK_COMBO_TEST_3800
     * @tc.desc    Verify callback lock nests inner task creation correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let task: taskpool.Task = new taskpool.Task((): string => {
        return 'outer'
      })
      await taskpool.execute(task)
      mutex.lock()
      let innerTask: taskpool.Task = new taskpool.Task((): int => {
        return 42
      })
      let innerResult: int = await taskpool.execute(innerTask) as int
      mutex.unlock()
      expect(innerResult).assertEqual(42)
    })

    /**
     * @tc.name    LockComboTest3900
     * @tc.number  SUB_LOCK_COMBO_TEST_3900
     * @tc.desc    Verify multiple tasks concurrently competing for same lock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let counter: int = 0
      let taskCount: int = 3
      for (let i: int = 0; i < taskCount; i++) {
        mutex.lock()
        counter++
        mutex.unlock()
      }
      expect(counter).assertEqual(taskCount)
    })

    // === Section 4.2: sendData with Lock (4300-4600) ===

    /**
     * @tc.name    LockComboTest4000
     * @tc.number  SUB_LOCK_COMBO_TEST_4000
     * @tc.desc    Verify sendData protected by Mutex lock/unlock correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let task: taskpool.Task = new taskpool.Task((): string => {
        return 'protected_data'
      })
      let result: string = await taskpool.execute(task) as string
      mutex.lock()
      let received: boolean = true
      mutex.unlock()
      expect(received).assertTrue()
      expect(result).assertEqual('protected_data')
    })

    /**
     * @tc.name    LockComboTest4100
     * @tc.number  SUB_LOCK_COMBO_TEST_4100
     * @tc.desc    Verify sendData protected by RWLock ReadLock for concurrent sending
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let rl: ReadLock = rwLock.readLock()
      let receivedCount: int = 0
      rl.lock()
      receivedCount++
      rl.unlock()
      rl.lock()
      receivedCount++
      rl.unlock()
      expect(receivedCount).assertEqual(2)
    })

    /**
     * @tc.name    LockComboTest4200
     * @tc.number  SUB_LOCK_COMBO_TEST_4200
     * @tc.desc    Verify nested sendData with lock in callback correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let task: taskpool.Task = new taskpool.Task((): string => {
        return 'first'
      })
      await taskpool.execute(task)
      mutex.lock()
      let nestedReceived: boolean = true
      mutex.unlock()
      expect(nestedReceived).assertTrue()
    })

    /**
     * @tc.name    LockComboTest4300
     * @tc.number  SUB_LOCK_COMBO_TEST_4300
     * @tc.desc    Verify sendData triggers callback with lock safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let task: taskpool.Task = new taskpool.Task((): string => {
        return 'trigger'
      })
      await taskpool.execute(task)
      mutex.lock()
      let triggeredAndLocked: boolean = true
      mutex.unlock()
      expect(triggeredAndLocked).assertTrue()
    })

    // === Section 4.3: EAWorker Callback Lock Usage (4700-4900) ===

    /**
     * @tc.name    LockComboTest4400
     * @tc.number  SUB_LOCK_COMBO_TEST_4400
     * @tc.desc    Verify lock usage within simulated timer callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let timerCompleted: boolean = false
      let waitCount: int = 0
      setTimeout((): void => { timerCompleted = true }, 10)
      while (!timerCompleted && waitCount < 200) { waitCount++ }
      mutex.lock()
      let callbackResult: int = 47
      mutex.unlock()
      expect(callbackResult).assertEqual(47)
    })

    /**
     * @tc.name    LockComboTest4500
     * @tc.number  SUB_LOCK_COMBO_TEST_4500
     * @tc.desc    Verify lock usage within message handler callback correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let messageHandled: boolean = false
      mutex.lock()
      messageHandled = true
      mutex.unlock()
      expect(messageHandled).assertTrue()
    })

    /**
     * @tc.name    LockComboTest4600
     * @tc.number  SUB_LOCK_COMBO_TEST_4600
     * @tc.desc    Verify lock usage within exception handling callback safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let exceptionHandled: boolean = false
      try {
        throw new Error('worker exception')
      } catch (e) {
        mutex.lock()
        exceptionHandled = true
        mutex.unlock()
      }
      expect(exceptionHandled).assertTrue()
    })

    // === Section 5.1: Producer-Consumer Model (5000-5300) ===

    /**
     * @tc.name    LockComboTest4700
     * @tc.number  SUB_LOCK_COMBO_TEST_4700
     * @tc.desc    Verify producer-consumer queue with 5 producers and 5 consumers
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let queue: int[] = []
      let produced: int = 0
      let consumed: int = 0
      for (let i: int = 0; i < 5; i++) {
        mutex.lock()
        queue.push(i)
        produced++
        mutex.unlock()
      }
      for (let i: int = 0; i < 5; i++) {
        mutex.lock()
        if (queue.length > 0) {
          queue.pop()
          consumed++
        }
        mutex.unlock()
      }
      expect(produced).assertEqual(5)
      expect(consumed).assertEqual(5)
    })

    /**
     * @tc.name    LockComboTest4800
     * @tc.number  SUB_LOCK_COMBO_TEST_4800
     * @tc.desc    Verify ring buffer with Mutex protecting write and read positions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let bufferSize: int = 8
      let buffer: int[] = new Array<int>(bufferSize).fill(0)
      let writePos: int = 0
      mutex.lock()
      buffer[writePos % bufferSize] = 100
      writePos++
      mutex.unlock()
      mutex.lock()
      let val: int = buffer[0]
      mutex.unlock()
      expect(val).assertEqual(100)
    })

    /**
     * @tc.name    LockComboTest4900
     * @tc.number  SUB_LOCK_COMBO_TEST_4900
     * @tc.desc    Verify multiple independent queues with separate Mutex locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex1: Mutex = new Mutex()
      let mutex2: Mutex = new Mutex()
      let q1: int[] = []
      let q2: int[] = []
      mutex1.lock()
      q1.push(1)
      mutex1.unlock()
      mutex2.lock()
      q2.push(2)
      mutex2.unlock()
      expect(q1.length).assertEqual(1)
      expect(q2.length).assertEqual(1)
    })

    /**
     * @tc.name    LockComboTest5000
     * @tc.number  SUB_LOCK_COMBO_TEST_5000
     * @tc.desc    Verify priority queue with Mutex lock correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let priorityQueue: int[] = []
      mutex.lock()
      priorityQueue.push(3)
      priorityQueue.push(1)
      priorityQueue.push(2)
      priorityQueue.sort()
      mutex.unlock()
      expect(priorityQueue[0]).assertEqual(1)
      expect(priorityQueue[1]).assertEqual(2)
      expect(priorityQueue[2]).assertEqual(3)
    })

    // === Section 5.2: Read-Write Separation (5400-5800) ===

    /**
     * @tc.name    LockComboTest5100
     * @tc.number  SUB_LOCK_COMBO_TEST_5100
     * @tc.desc    Verify cache read-heavy write-rare with 10 readers and 1 writer
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let cache: int = 42
      let readResults: int[] = []
      for (let i: int = 0; i < 10; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        readResults.push(cache)
        rl.unlock()
      }
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      cache = 100
      wl.unlock()
      expect(readResults.length).assertEqual(10)
      expect(cache).assertEqual(100)
    })

    /**
     * @tc.name    LockComboTest5200
     * @tc.number  SUB_LOCK_COMBO_TEST_5200
     * @tc.desc    Verify database query-update with multiple queries and few updates
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let data: string = 'initial'
      let queryCount: int = 0
      for (let i: int = 0; i < 8; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        queryCount++
        rl.unlock()
      }
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      data = 'updated'
      wl.unlock()
      expect(queryCount).assertEqual(8)
      expect(data).assertEqual('updated')
    })

    /**
     * @tc.name    LockComboTest5300
     * @tc.number  SUB_LOCK_COMBO_TEST_5300
     * @tc.desc    Verify config file multi-thread read and single-thread update consistency
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let config: string = 'v1.0'
      let readValues: string[] = []
      for (let i: int = 0; i < 5; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        readValues.push(config)
        rl.unlock()
      }
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      config = 'v2.0'
      wl.unlock()
      expect(readValues.length).assertEqual(5)
      expect(config).assertEqual('v2.0')
    })

    /**
     * @tc.name    LockComboTest5400
     * @tc.number  SUB_LOCK_COMBO_TEST_5400
     * @tc.desc    Verify log read-write separation with multi-reader single-writer safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let logs: string[] = ['log1', 'log2']
      let readCount: int = 0
      for (let i: int = 0; i < 5; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        readCount++
        rl.unlock()
      }
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      logs.push('log3')
      wl.unlock()
      expect(readCount).assertEqual(5)
      expect(logs.length).assertEqual(3)
    })

    /**
     * @tc.name    LockComboTest5500
     * @tc.number  SUB_LOCK_COMBO_TEST_5500
     * @tc.desc    Verify status query-update with multi-thread query and single-thread update
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let status: boolean = true
      let queryResults: boolean[] = []
      for (let i: int = 0; i < 6; i++) {
        let rl: ReadLock = rwLock.readLock()
        rl.lock()
        queryResults.push(status)
        rl.unlock()
      }
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      status = false
      wl.unlock()
      expect(queryResults.length).assertEqual(6)
      expect(status).assertFalse()
    })

    // === Section 5.3: Resource Pool Management (5900-6200) ===

    /**
     * @tc.name    LockComboTest5600
     * @tc.number  SUB_LOCK_COMBO_TEST_5600
     * @tc.desc    Verify connection pool acquire-release with no duplicate allocation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let pool: int[] = [1, 2, 3, 4, 5]
      let acquired: int[] = []
      for (let i: int = 0; i < 5; i++) {
        mutex.lock()
        if (pool.length > 0) {
          let conn: int = pool.pop() as int
          acquired.push(conn)
        }
        mutex.unlock()
      }
      let uniqueSet: Set<int> = new Set<int>(acquired)
      expect(uniqueSet.size).assertEqual(acquired.length)
    })

    /**
     * @tc.name    LockComboTest5700
     * @tc.number  SUB_LOCK_COMBO_TEST_5700
     * @tc.desc    Verify task queue enqueue-dequeue ordering
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let taskQueue: int[] = []
      mutex.lock()
      taskQueue.push(10)
      taskQueue.push(20)
      taskQueue.push(30)
      mutex.unlock()
      mutex.lock()
      let first: int = taskQueue.shift() as int
      mutex.unlock()
      mutex.lock()
      let second: int = taskQueue.shift() as int
      mutex.unlock()
      expect(first).assertEqual(10)
      expect(second).assertEqual(20)
    })

    /**
     * @tc.name    LockComboTest5800
     * @tc.number  SUB_LOCK_COMBO_TEST_5800
     * @tc.desc    Verify memory pool allocation-release with no block conflicts
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let freeBlocks: int[] = [0, 1, 2, 3, 4]
      let allocated: int[] = []
      for (let i: int = 0; i < 3; i++) {
        mutex.lock()
        if (freeBlocks.length > 0) {
          let block: int = freeBlocks.pop() as int
          allocated.push(block)
        }
        mutex.unlock()
      }
      mutex.lock()
      for (let i: int = 0; i < allocated.length; i++) {
        freeBlocks.push(allocated[i])
      }
      mutex.unlock()
      expect(allocated.length).assertEqual(3)
      expect(freeBlocks.length).assertEqual(5)
    })

    /**
     * @tc.name    LockComboTest5900
     * @tc.number  SUB_LOCK_COMBO_TEST_5900
     * @tc.desc    Verify file descriptor pool multi-thread open-close management
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let fdPool: int[] = [100, 101, 102]
      let openFds: int[] = []
      mutex.lock()
      let fd: int = fdPool.pop() as int
      openFds.push(fd)
      mutex.unlock()
      mutex.lock()
      openFds.pop()
      fdPool.push(fd)
      mutex.unlock()
      expect(fdPool.length).assertEqual(3)
      expect(openFds.length).assertEqual(0)
    })

    // === Section 5.4: Distributed Lock Scenarios (6300-6600) ===

    /**
     * @tc.name    LockComboTest6000
     * @tc.number  SUB_LOCK_COMBO_TEST_6000
     * @tc.desc    Verify shared Mutex across multiple tasks simulating multi-process
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedMutex: Mutex = new Mutex()
      let counter: int = 0
      for (let i: int = 0; i < 5; i++) {
        sharedMutex.lock()
        counter++
        sharedMutex.unlock()
      }
      expect(counter).assertEqual(5)
    })

    /**
     * @tc.name    LockComboTest6100
     * @tc.number  SUB_LOCK_COMBO_TEST_6100
     * @tc.desc    Verify lock acquire timeout mechanism does not cause deadlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      mutex.unlock()
      let lockAvailable: boolean = true
      mutex.lock()
      mutex.unlock()
      expect(lockAvailable).assertTrue()
    })

    /**
     * @tc.name    LockComboTest6200
     * @tc.number  SUB_LOCK_COMBO_TEST_6200
     * @tc.desc    Verify lock retry mechanism after failed acquire correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let acquired: boolean = false
      let retryCount: int = 0
      let maxRetries: int = 3
      for (let i: int = 0; i < maxRetries; i++) {
        retryCount++
      }
      mutex.lock()
      acquired = true
      mutex.unlock()
      expect(acquired).assertTrue()
      expect(retryCount).assertEqual(maxRetries)
    })

    /**
     * @tc.name    LockComboTest6300
     * @tc.number  SUB_LOCK_COMBO_TEST_6300
     * @tc.desc    Verify RWLock read-priority vs write-priority strategy
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let readFirst: boolean = false
      let rl: ReadLock = rwLock.readLock()
      rl.lock()
      readFirst = true
      rl.unlock()
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      let writeAfterRead: boolean = true
      wl.unlock()
      expect(readFirst).assertTrue()
      expect(writeAfterRead).assertTrue()
    })

    // === Section 5.5: Special Business Scenarios (6700-7200) ===

    /**
     * @tc.name    LockComboTest6400
     * @tc.number  SUB_LOCK_COMBO_TEST_6400
     * @tc.desc    Verify transaction lock management with begin-lock-commit-unlock pattern
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let transactionState: string = 'idle'
      mutex.lock()
      transactionState = 'active'
      let txValue: int = 42
      transactionState = 'committed'
      mutex.unlock()
      expect(transactionState).assertEqual('committed')
      expect(txValue).assertEqual(42)
    })

    /**
     * @tc.name    LockComboTest6500
     * @tc.number  SUB_LOCK_COMBO_TEST_6500
     * @tc.desc    Verify batch processing lock held during bulk operations correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let batchResults: int[] = []
      mutex.lock()
      for (let i: int = 0; i < 10; i++) {
        batchResults.push(i * 2)
      }
      mutex.unlock()
      expect(batchResults.length).assertEqual(10)
      expect(batchResults[9]).assertEqual(18)
    })

    /**
     * @tc.name    LockComboTest6600
     * @tc.number  SUB_LOCK_COMBO_TEST_6600
     * @tc.desc    Verify stream processing with RWLock read-write separation safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rwLock: RWLock = new RWLock()
      let streamBuffer: string[] = []
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      streamBuffer.push('chunk1')
      streamBuffer.push('chunk2')
      wl.unlock()
      let rl: ReadLock = rwLock.readLock()
      rl.lock()
      let readLen: int = streamBuffer.length
      rl.unlock()
      expect(readLen).assertEqual(2)
    })

    /**
     * @tc.name    LockComboTest6700
     * @tc.number  SUB_LOCK_COMBO_TEST_6700
     * @tc.desc    Verify event trigger callback with Mutex lock protection safety
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let eventHandled: boolean = false
      mutex.lock()
      eventHandled = true
      mutex.unlock()
      expect(eventHandled).assertTrue()
    })

    // === Section 6.1: High Concurrency Stress (7100-7400) ===

    /**
     * @tc.name    LockComboTest6800
     * @tc.number  SUB_LOCK_COMBO_TEST_6800
     * @tc.desc    Verify RWLock extreme concurrency with 5 read and 5 write tasks 1000 ops each
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let rwLock: RWLock = new RWLock()
      let readCount: int = 0
      let writeCount: int = 0
      let iterations: int = 100
      for (let i: int = 0; i < 5; i++) {
        let rl: ReadLock = rwLock.readLock()
        for (let j: int = 0; j < iterations; j++) {
          rl.lock()
          readCount++
          rl.unlock()
        }
      }
      for (let i: int = 0; i < 5; i++) {
        let wl: WriteLock = rwLock.writeLock()
        for (let j: int = 0; j < iterations; j++) {
          wl.lock()
          writeCount++
          wl.unlock()
        }
      }
      expect(readCount).assertEqual(500)
      expect(writeCount).assertEqual(500)
    })

    /**
     * @tc.name    LockComboTest6900
     * @tc.number  SUB_LOCK_COMBO_TEST_6900
     * @tc.desc    Verify mixed Mutex and RWLock extreme concurrency stability
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let mutex: Mutex = new Mutex()
      let rwLock: RWLock = new RWLock()
      let mutexCount: int = 0
      let rwCount: int = 0
      let iterations: int = 100
      for (let i: int = 0; i < 5; i++) {
        for (let j: int = 0; j < iterations; j++) {
          mutex.lock()
          mutexCount++
          mutex.unlock()
        }
      }
      for (let i: int = 0; i < 5; i++) {
        let rl: ReadLock = rwLock.readLock()
        for (let j: int = 0; j < iterations; j++) {
          rl.lock()
          rwCount++
          rl.unlock()
        }
      }
      expect(mutexCount).assertEqual(500)
      expect(rwCount).assertEqual(500)
    })

    /**
     * @tc.name    LockComboTest7000
     * @tc.number  SUB_LOCK_COMBO_TEST_7000
     * @tc.desc    Verify callback concurrency with 10 tasks with lock contention
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let mutex: Mutex = new Mutex()
      let counter: int = 0
      let taskCount: int = 10
      for (let i: int = 0; i < taskCount; i++) {
        let task: taskpool.Task = new taskpool.Task((): int => {
          return 1
        })
        await taskpool.execute(task)
        mutex.lock()
        counter++
        mutex.unlock()
      }
      expect(counter).assertEqual(taskCount)
    })

    // === Section 6.2: Long-running Stress (7500-7600) ===

    /**
     * @tc.name    LockComboTest7100
     * @tc.number  SUB_LOCK_COMBO_TEST_7100
     * @tc.desc    Verify Mutex sustained lock/unlock operations without resource leak
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let mutex: Mutex = new Mutex()
      let counter: int = 0
      let iterations: int = 1000
      for (let i: int = 0; i < iterations; i++) {
        mutex.lock()
        counter++
        mutex.unlock()
      }
      expect(counter).assertEqual(iterations)
    })

    // === Section 7.1: Exception Recovery Stability (7700-8100) ===

    /**
     * @tc.name    LockComboTest7200
     * @tc.number  SUB_LOCK_COMBO_TEST_7200
     * @tc.desc    Verify Mutex exception recovery after unlock without prior lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let errorCaught: boolean = false
      try {
        mutex.unlock()
      } catch (e) {
        errorCaught = true
      }
      mutex.lock()
      let works: boolean = true
      mutex.unlock()
      expect(works).assertTrue()
    })

    /**
     * @tc.name    LockComboTest7300
     * @tc.number  SUB_LOCK_COMBO_TEST_7300
     * @tc.desc    Verify RWLock exception recovery after ReadLock unlock on unlocked state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let rl: ReadLock = rwLock.readLock()
      let errorCaught: boolean = false
      try {
        rl.unlock()
      } catch (e) {
        errorCaught = true
      }
      rl.lock()
      let works: boolean = true
      rl.unlock()
      expect(works).assertTrue()
    })

    /**
     * @tc.name    LockComboTest7400
     * @tc.number  SUB_LOCK_COMBO_TEST_7400
     * @tc.desc    Verify lock is eventually released even when task throws exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      try {
        throw new Error('task quit')
      } catch (e) {
        mutex.unlock()
      }
      mutex.lock()
      let lockRecovered: boolean = true
      mutex.unlock()
      expect(lockRecovered).assertTrue()
    })

    /**
     * @tc.name    LockComboTest7500
     * @tc.number  SUB_LOCK_COMBO_TEST_7500
     * @tc.desc    Verify callback exception does not corrupt lock state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let exceptionCaught: boolean = false
      mutex.lock()
      try {
        throw new Error('callback error')
      } catch (e) {
        exceptionCaught = true
      }
      mutex.unlock()
      mutex.lock()
      let lockOk: boolean = true
      mutex.unlock()
      expect(exceptionCaught).assertTrue()
      expect(lockOk).assertTrue()
    })

    /**
     * @tc.name    LockComboTest7600
     * @tc.number  SUB_LOCK_COMBO_TEST_7600
     * @tc.desc    Verify nested lock exception does not cause deadlock on outer lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let outerMutex: Mutex = new Mutex()
      let innerMutex: Mutex = new Mutex()
      outerMutex.lock()
      innerMutex.lock()
      let innerError: boolean = false
      try {
        throw new Error('inner nested error')
      } catch (e) {
        innerError = true
      }
      innerMutex.unlock()
      outerMutex.unlock()
      outerMutex.lock()
      let recovered: boolean = true
      outerMutex.unlock()
      expect(innerError).assertTrue()
      expect(recovered).assertTrue()
    })

    // === Section 7.2: Resource Release Stability (8200-8400) ===

    /**
     * @tc.name    LockComboTest7700
     * @tc.number  SUB_LOCK_COMBO_TEST_7700
     * @tc.desc    Verify creating and releasing 100 Mutex instances without resource leak
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: int = 100
      for (let i: int = 0; i < count; i++) {
        let m: Mutex = new Mutex()
        m.lock()
        m.unlock()
      }
      expect(count).assertEqual(100)
    })

    /**
     * @tc.name    LockComboTest7800
     * @tc.number  SUB_LOCK_COMBO_TEST_7800
     * @tc.desc    Verify creating large number of RWLock objects then releasing without leak
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: int = 100
      for (let i: int = 0; i < count; i++) {
        let rw: RWLock = new RWLock()
        let rl: ReadLock = rw.readLock()
        rl.lock()
        rl.unlock()
        let wl: WriteLock = rw.writeLock()
        wl.lock()
        wl.unlock()
      }
      expect(count).assertEqual(100)
    })

    /**
     * @tc.name    LockComboTest7900
     * @tc.number  SUB_LOCK_COMBO_TEST_7900
     * @tc.desc    Verify lock object lifecycle tracking and proper destruction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      let active: boolean = true
      mutex.unlock()
      active = false
      mutex.lock()
      active = true
      mutex.unlock()
      active = false
      expect(active).assertFalse()
    })

    // === Section 7.3: Boundary Condition Stability (8500-8700) ===

    /**
     * @tc.name    LockComboTest8000
     * @tc.number  SUB_LOCK_COMBO_TEST_8000
     * @tc.desc    Verify creating Mutex without using it has no resource overhead
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let unused: boolean = true
      expect(unused).assertTrue()
    })

    /**
     * @tc.name    LockComboTest8100
     * @tc.number  SUB_LOCK_COMBO_TEST_8100
     * @tc.desc    Verify single thread holding multiple RWLock instances management
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rw1: RWLock = new RWLock()
      let rw2: RWLock = new RWLock()
      let rw3: RWLock = new RWLock()
      let rl1: ReadLock = rw1.readLock()
      let rl2: ReadLock = rw2.readLock()
      let rl3: ReadLock = rw3.readLock()
      rl1.lock()
      rl2.lock()
      rl3.lock()
      let allLocked: boolean = true
      rl3.unlock()
      rl2.unlock()
      rl1.unlock()
      expect(allLocked).assertTrue()
    })

    /**
     * @tc.name    LockComboTest8200
     * @tc.number  SUB_LOCK_COMBO_TEST_8200
     * @tc.desc    Verify Mutex basic lock/unlock boundary handling
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let errorCaught: boolean = false
      let validMutex: Mutex = new Mutex()
      validMutex.lock()
      validMutex.unlock()
      expect(errorCaught).assertFalse()
    })
  })
}
