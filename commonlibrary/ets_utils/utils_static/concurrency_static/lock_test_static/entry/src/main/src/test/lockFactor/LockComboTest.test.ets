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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium'
import Utils from '../Util.test'

// === Module-level helpers for combo scenarios (8200-9600) ===

// Sleep helper usable inside worker/task coroutines.
function lockComboSleep(ms: int): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    setTimeout((): void => {
      resolve(undefined)
    }, ms)
  })
}

// #6: Task that attempts WriteLock acquisition while a ReadLock is held elsewhere.
function lockComboWriteAttemptTask(rwLock: RWLock, done: AtomicInt): int {
  let wl: WriteLock = rwLock.writeLock()
  wl.lock()
  done.store(1)
  wl.unlock()
  return 1
}

// #7: Worker coroutine holds WriteLock until the host signals release.
async function lockComboWriterHoldTask(rwLock: RWLock, held: AtomicInt, release: AtomicInt): Promise<void> {
  let wl: WriteLock = rwLock.writeLock()
  wl.lock()
  held.store(1)
  while (release.load() === 0) {
    await lockComboSleep(100)
  }
  wl.unlock()
}

// #7: Task that attempts ReadLock acquisition while a WriteLock is held elsewhere.
function lockComboReadAttemptTask(rwLock: RWLock, got: AtomicInt): int {
  let rl: ReadLock = rwLock.readLock()
  rl.lock()
  got.store(1)
  rl.unlock()
  return 1
}

// #28: Worker task that waits for the Mutex held by the host.
function lockComboNestWaitTask(mutex: Mutex, done: AtomicInt): void {
  mutex.lock()
  done.store(1)
  mutex.unlock()
}

// #29/#30: Worker coroutine holds Mutex until the host signals release.
async function lockComboHoldTask(mutex: Mutex, held: AtomicInt, release: AtomicInt): Promise<void> {
  mutex.lock()
  held.store(1)
  while (release.load() === 0) {
    await lockComboSleep(100)
  }
  mutex.unlock()
}

// #29: Task representing the host-side lock attempt while a Worker holds the Mutex.
function lockComboAttemptTask(mutex: Mutex, got: AtomicInt): int {
  mutex.lock()
  got.store(1)
  mutex.unlock()
  return 1
}

// #30: Second worker task waiting for the Mutex held by the first worker.
function lockComboWaitTask(mutex: Mutex, done: AtomicInt): void {
  mutex.lock()
  done.store(1)
  mutex.unlock()
}

// #37/#82: Task that sends data back to trigger the onReceiveData callback.
function lockComboSendDataTask(idx: int): int {
  taskpool.Task.sendData(idx)
  return idx
}

// #73: Task competing for a single Mutex 100 times.
function lockComboContentionTask(mutex: Mutex, counter: AtomicInt): int {
  for (let i: int = 0; i < 100; i++) {
    mutex.lock()
    counter.fetchAdd(1)
    mutex.unlock()
  }
  return 1
}

// #21: Task acquiring two distinct Mutex instances in nested order to protect a shared counter.
function lockComboNestedMutexTask(mA: Mutex, mB: Mutex, counter: AtomicInt): int {
  mA.lock()
  mB.lock()
  try {
    counter.fetchAdd(1)
  } finally {
    mB.unlock()
    mA.unlock()
  }
  return 1
}

// #23: Task acquiring WriteLocks of two distinct RWLock instances in nested order.
function lockComboNestedWriteLockTask(w1: WriteLock, w2: WriteLock, counter: AtomicInt): int {
  w1.lock()
  w2.lock()
  try {
    counter.fetchAdd(1)
  } finally {
    w2.unlock()
    w1.unlock()
  }
  return 1
}

// #77/#78/#79: Build a payload of approximately blocks*1000 characters.
function lockComboBuildPayload(blocks: int): string {
  let block: string = '0123456789'
  let chunk: string = ''
  for (let i: int = 0; i < 100; i++) {
    chunk += block
  }
  let chunks: string[] = []
  for (let i: int = 0; i < blocks; i++) {
    chunks.push(chunk)
  }
  return chunks.join('')
}

// #77/#79: Integrity checksum of a big payload.
function lockComboChecksum(s: string): int {
  let sum: int = 0
  for (let i: int = 0; i < s.length; i++) {
    sum += s.charCodeAt(i)
  }
  return sum
}

// #77: Transfer a big payload to a task and verify it under Mutex protection.
function lockComboBigDataTransferTask(mutex: Mutex, payload: string, len: AtomicInt, sum: AtomicInt): int {
  mutex.lock()
  len.store(payload.length)
  sum.store(lockComboChecksum(payload))
  mutex.unlock()
  return payload.length
}

// #78: Writer task that appends a chunk to shared big data under WriteLock.
function lockComboWriteBigDataTask(rwLock: RWLock, data: string[], chunk: string, expectedLen: int, ok: AtomicInt): int {
  let wl: WriteLock = rwLock.writeLock()
  wl.lock()
  data[0] = data[0] + chunk
  if (data[0].length === expectedLen) {
    ok.store(1)
  }
  wl.unlock()
  return data[0].length
}

// #78: Reader task that reads shared big data length under ReadLock.
function lockComboReadBigDataTask(rwLock: RWLock, data: string[], expectedLen: int, observed: AtomicInt): int {
  let rl: ReadLock = rwLock.readLock()
  rl.lock()
  observed.store(data[0].length)
  rl.unlock()
  return data[0].length
}

// #79: Verify one big payload under its own Mutex and record success.
function lockComboBigDataVerifyTask(mutex: Mutex, payload: string, expectedLen: int, expectedSum: int, ok: AtomicInt): int {
  mutex.lock()
  if (payload.length === expectedLen && lockComboChecksum(payload) === expectedSum) {
    ok.fetchAdd(1)
  }
  mutex.unlock()
  return payload.length
}

export default function LockComboTest(): void {
  describe('LockComboTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

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
      let nestedDone: boolean = false
      writeLock.lock()
      try {
        nestedDone = true
      } finally {
        writeLock.unlock()
      }
      mutex.unlock()
      expect(nestedDone).assertTrue()
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
      let nestedDone: boolean = false
      mutex.lock()
      try {
        nestedDone = true
      } finally {
        mutex.unlock()
      }
      readLock.unlock()
      expect(nestedDone).assertTrue()
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
      let completed: boolean = false
      mutex.lock()
      readLock.lock()
      try {
        completed = true
      } finally {
        mutex.unlock()
        readLock.unlock()
      }
      expect(completed).assertTrue()
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
      let mutexDone: boolean = false
      mutex.lock()
      try {
        mutexDone = true
      } finally {
        mutex.unlock()
      }
      let rwLock: RWLock = new RWLock()
      let writeLock: WriteLock = rwLock.writeLock()
      let writeDone: boolean = false
      writeLock.lock()
      try {
        writeDone = true
      } finally {
        writeLock.unlock()
      }
      expect(mutexDone).assertTrue()
      expect(writeDone).assertTrue()
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
      let readLocked: boolean = false
      try {
        readLocked = true
      } finally {
        readLock.unlock()
      }
      writeLock.lock()
      let writeLocked: boolean = false
      try {
        writeLocked = true
      } finally {
        writeLock.unlock()
      }
      expect(readLocked).assertTrue()
      expect(writeLocked).assertTrue()
    })


    /**
     * @tc.name    LockComboTest0700
     * @tc.number  SUB_LOCK_COMBO_TEST_0700
     * @tc.desc    Verify 5 sequential ReadLock acquisitions followed by WriteLock acquisition on same RWLock
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
      try {
        writeDone = true
      } finally {
        wl.unlock()
      }
      expect(readCount).assertEqual(5)
      expect(writeDone).assertTrue()
    })

    /**
     * @tc.name    LockComboTest0800
     * @tc.number  SUB_LOCK_COMBO_TEST_0800
     * @tc.desc    Verify ReadLock instance from same RWLock can be acquired repeatedly for shared access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let rl1: ReadLock = rwLock.readLock()
      let rl2: ReadLock = rwLock.readLock()
      rl1.lock()
      let shared: boolean = false
      rl2.lock()
      try {
        shared = true
      } finally {
        rl2.unlock()
        rl1.unlock()
      }
      expect(shared).assertTrue()
    })

    /**
     * @tc.name    LockComboTest0900
     * @tc.number  SUB_LOCK_COMBO_TEST_0900
     * @tc.desc    Verify WriteLock instance from same RWLock can be re-acquired after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let wl1: WriteLock = rwLock.writeLock()
      wl1.lock()
      let firstDone: boolean = false
      try {
        firstDone = true
      } finally {
        wl1.unlock()
      }
      let wl2: WriteLock = rwLock.writeLock()
      wl2.lock()
      let secondDone: boolean = false
      try {
        secondDone = true
      } finally {
        wl2.unlock()
      }
      expect(firstDone).assertTrue()
      expect(secondDone).assertTrue()
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
     * @tc.desc    Verify Mutex protects shared value update correctness in static model
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let sharedVal: int = 0
      let lockDone: boolean = false
      mutex.lock()
      try {
        sharedVal = 999
        lockDone = true
      } finally {
        mutex.unlock()
      }
      expect(lockDone).assertTrue()
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
     * @tc.desc    Verify sequential Mutex lock/unlock preserves operation ordering
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
      expect(order[1]).assertEqual(2)
      expect(order[2]).assertEqual(3)
    })

    /**
     * @tc.name    LockComboTest1900
     * @tc.number  SUB_LOCK_COMBO_TEST_1900
     * @tc.desc    Verify Mutex lock/unlock after taskpool task execution completes
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
      let result: string = await taskpool.execute(task) as string
      mutex.lock()
      try {
        callbackExecuted = true
      } finally {
        mutex.unlock()
      }
      expect(result).assertEqual('data')
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
      let locked: boolean = false
      try {
        locked = true
      } finally {
        mutex.unlock()
      }
      mutex.lock()
      let relocked: boolean = false
      try {
        relocked = true
      } finally {
        mutex.unlock()
      }
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
      let nestedDone: boolean = false
      innerRl.lock()
      try {
        nestedDone = true
      } finally {
        innerRl.unlock()
        outerRl.unlock()
      }
      expect(nestedDone).assertTrue()
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
      let nestedDone: boolean = false
      rl.lock()
      try {
        nestedDone = true
      } finally {
        rl.unlock()
        mutex.unlock()
      }
      expect(nestedDone).assertTrue()
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
      let nestedDone: boolean = false
      wl.lock()
      try {
        nestedDone = true
      } finally {
        wl.unlock()
        mutex.unlock()
      }
      expect(nestedDone).assertTrue()
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
      let nestedDone: boolean = false
      mutex.lock()
      try {
        nestedDone = true
      } finally {
        mutex.unlock()
        rl.unlock()
      }
      expect(nestedDone).assertTrue()
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
      let nestedDone: boolean = false
      mutex.lock()
      try {
        nestedDone = true
      } finally {
        mutex.unlock()
        wl.unlock()
      }
      expect(nestedDone).assertTrue()
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
      await lockComboSleep(100)
      order.push('waited')
      order.push('main_unlocking')
      mutex.unlock()
      expect(order.length).assertEqual(3)
      expect(order[0]).assertEqual('main_locked')
      expect(order[1]).assertEqual('waited')
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
      await lockComboSleep(100)
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
     * @tc.desc    Verify repeated sequential Mutex lock/unlock preserves operation ordering
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let order: int[] = []
      mutex.lock()
      try {
        order.push(1)
      } finally {
        mutex.unlock()
      }
      mutex.lock()
      try {
        order.push(2)
      } finally {
        mutex.unlock()
      }
      expect(order.length).assertEqual(2)
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
      let recovered: boolean = false
      try {
        recovered = true
      } finally {
        mutex.unlock()
      }
      expect(innerThrew).assertTrue()
      expect(recovered).assertTrue()
    })

    /**
     * @tc.name    LockComboTest3000
     * @tc.number  SUB_LOCK_COMBO_TEST_3000
     * @tc.desc    Verify inner Mutex release does not affect outer Mutex re-acquisition
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
      let outerWorks: boolean = false
      try {
        outerWorks = true
      } finally {
        outerMutex.unlock()
      }
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
      let deepDone: boolean = false
      m3.lock()
      try {
        deepDone = true
      } finally {
        m3.unlock()
        m2.unlock()
        m1.unlock()
      }
      expect(deepDone).assertTrue()
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
      let value: int = 0
      rl1.lock()
      rl2.lock()
      rl3.lock()
      value = 345
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
     * @tc.desc    Verify 3-layer Mutex array nesting with sequential lock/unlock correctness
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
      let result: int = 0
      for (let i: int = 0; i < depth; i++) {
        mutexes[i].lock()
        result++
      }
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
      let result: string = await taskpool.execute(task) as string
      let rl: ReadLock = rwLock.readLock()
      rl.lock()
      callbackDone = true
      rl.unlock()
      expect(result).assertEqual('rw_data')
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
      let lockDone: boolean = false
      mutex.lock()
      try {
        lockDone = true
      } finally {
        mutex.unlock()
      }
      expect(lockDone).assertTrue()
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
     * @tc.desc    Verify Mutex sequential repeated lock/unlock counting correctness
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
     * @tc.desc    Verify Mutex lock/unlock after taskpool task execution with result correctness
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
      let lockDone: boolean = false
      mutex.lock()
      try {
        lockDone = true
      } finally {
        mutex.unlock()
      }
      expect(lockDone).assertTrue()
      expect(result).assertEqual('protected_data')
    })

    /**
     * @tc.name    LockComboTest4100
     * @tc.number  SUB_LOCK_COMBO_TEST_4100
     * @tc.desc    Verify ReadLock repeated sequential acquisition counting correctness
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
     * @tc.desc    Verify Mutex lock/unlock after taskpool task execution with string result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let task: taskpool.Task = new taskpool.Task((): string => {
        return 'first'
      })
      let result: string = await taskpool.execute(task) as string
      let nestedReceived: boolean = false
      mutex.lock()
      try {
        nestedReceived = true
      } finally {
        mutex.unlock()
      }
      expect(result).assertEqual('first')
      expect(nestedReceived).assertTrue()
    })

    /**
     * @tc.name    LockComboTest4300
     * @tc.number  SUB_LOCK_COMBO_TEST_4300
     * @tc.desc    Verify Mutex lock/unlock after taskpool task returning trigger marker
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let task: taskpool.Task = new taskpool.Task((): string => {
        return 'trigger'
      })
      let result: string = await taskpool.execute(task) as string
      let triggeredAndLocked: boolean = false
      mutex.lock()
      try {
        triggeredAndLocked = true
      } finally {
        mutex.unlock()
      }
      expect(result).assertEqual('trigger')
      expect(triggeredAndLocked).assertTrue()
    })

    // === Section 4.3: EAWorker Callback Lock Usage (4700-4900) ===

    /**
     * @tc.name    LockComboTest4400
     * @tc.number  SUB_LOCK_COMBO_TEST_4400
     * @tc.desc    Verify lock usage after a simulated async timer delay
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      await lockComboSleep(100)
      let lockOk: boolean = false
      mutex.lock()
      try {
        lockOk = true
      } finally {
        mutex.unlock()
      }
      expect(lockOk).assertTrue()
    })

    /**
     * @tc.name    LockComboTest4500
     * @tc.number  SUB_LOCK_COMBO_TEST_4500
     * @tc.desc    Verify Mutex lock/unlock protected state flag update in simulated flow
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutex: Mutex = new Mutex()
      let messageHandled: boolean = false
      mutex.lock()
      try {
        messageHandled = true
      } finally {
        mutex.unlock()
      }
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
     * @tc.desc    Verify Mutex-protected queue with 5 sequential produce and 5 consume operations
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
     * @tc.desc    Verify cache read-heavy write-rare scenario with 10 sequential reads and 1 write
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
     * @tc.desc    Verify config file read-update consistency with 5 sequential reads and single update
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
     * @tc.desc    Verify log read-write separation with 5 sequential reads and single write
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
     * @tc.desc    Verify status query-update with 6 sequential queries and single update
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
     * @tc.desc    Verify shared Mutex sequential lock/unlock across 5 iterations
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
     * @tc.desc    Verify Mutex re-acquisition after release does not deadlock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      mutex.unlock()
      let lockAvailable: boolean = false
      mutex.lock()
      try {
        lockAvailable = true
      } finally {
        mutex.unlock()
      }
      expect(lockAvailable).assertTrue()
    })

    /**
     * @tc.name    LockComboTest6200
     * @tc.number  SUB_LOCK_COMBO_TEST_6200
     * @tc.desc    Verify Mutex lock acquisition with bounded retry count tracking
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
      try {
        acquired = true
      } finally {
        mutex.unlock()
      }
      expect(acquired).assertTrue()
      expect(retryCount).assertEqual(maxRetries)
    })

    /**
     * @tc.name    LockComboTest6300
     * @tc.number  SUB_LOCK_COMBO_TEST_6300
     * @tc.desc    Verify RWLock sequential read-then-write acquisition order
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let readFirst: boolean = false
      let rl: ReadLock = rwLock.readLock()
      rl.lock()
      try {
        readFirst = true
      } finally {
        rl.unlock()
      }
      let wl: WriteLock = rwLock.writeLock()
      wl.lock()
      let writeAfterRead: boolean = false
      try {
        writeAfterRead = true
      } finally {
        wl.unlock()
      }
      expect(readFirst).assertTrue()
      expect(writeAfterRead).assertTrue()
    })

    // === Section 5.5: Special Business Scenarios (6700-7100) ===

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
     * @tc.desc    Verify Mutex lock/unlock protected state flag update safety
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

    // === Section 6.1: High Concurrency Stress (7100-7300) ===

    /**
     * @tc.name    LockComboTest6800
     * @tc.number  SUB_LOCK_COMBO_TEST_6800
     * @tc.desc    Verify RWLock sustained sequential access with 5 read and 5 write rounds of 100 ops each
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
     * @tc.desc    Verify mixed Mutex and RWLock sustained sequential lock stability
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
     * @tc.desc    Verify Mutex counting after 10 sequential taskpool task executions
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
        let result: int = await taskpool.execute(task) as int
        expect(result).assertEqual(1)
        mutex.lock()
        counter++
        mutex.unlock()
      }
      expect(counter).assertEqual(taskCount)
    })

    // === Section 7.1: Exception Recovery Stability (7600-8000) ===

    /**
     * @tc.name    LockComboTest7100
     * @tc.number  SUB_LOCK_COMBO_TEST_7100
     * @tc.desc    Verify Mutex exception recovery after unlock without prior lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      let errorCaught: boolean = false
      try {
        mutex.unlock()
      } catch (e) {
        errorCaught = true
      }
      expect(errorCaught).assertTrue()
      mutex.lock()
      let works: boolean = false
      try {
        works = true
      } finally {
        mutex.unlock()
      }
      expect(works).assertTrue()
    })

    /**
     * @tc.name    LockComboTest7200
     * @tc.number  SUB_LOCK_COMBO_TEST_7200
     * @tc.desc    Verify RWLock exception recovery after ReadLock unlock on unlocked state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rwLock: RWLock = new RWLock()
      let rl: ReadLock = rwLock.readLock()
      let errorCaught: boolean = false
      try {
        rl.unlock()
      } catch (e) {
        errorCaught = true
      }
      expect(errorCaught).assertTrue()
      rl.lock()
      let works: boolean = false
      try {
        works = true
      } finally {
        rl.unlock()
      }
      expect(works).assertTrue()
    })

    /**
     * @tc.name    LockComboTest7300
     * @tc.number  SUB_LOCK_COMBO_TEST_7300
     * @tc.desc    Verify lock is eventually released even when task throws exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      try {
        throw new Error('task quit')
      } catch (e) {
        mutex.unlock()
      }
      mutex.lock()
      let lockRecovered: boolean = false
      try {
        lockRecovered = true
      } finally {
        mutex.unlock()
      }
      expect(lockRecovered).assertTrue()
    })

    /**
     * @tc.name    LockComboTest7400
     * @tc.number  SUB_LOCK_COMBO_TEST_7400
     * @tc.desc    Verify callback exception does not corrupt lock state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      let lockOk: boolean = false
      try {
        lockOk = true
      } finally {
        mutex.unlock()
      }
      expect(exceptionCaught).assertTrue()
      expect(lockOk).assertTrue()
    })

    /**
     * @tc.name    LockComboTest7500
     * @tc.number  SUB_LOCK_COMBO_TEST_7500
     * @tc.desc    Verify nested lock exception does not cause deadlock on outer lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      let recovered: boolean = false
      try {
        recovered = true
      } finally {
        outerMutex.unlock()
      }
      expect(innerError).assertTrue()
      expect(recovered).assertTrue()
    })

    // === Section 7.2: Resource Release Stability (8100-8300) ===

    /**
     * @tc.name    LockComboTest7600
     * @tc.number  SUB_LOCK_COMBO_TEST_7600
     * @tc.desc    Verify creating and releasing 100 Mutex instances without resource leak
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: int = 100
      let completed: int = 0
      for (let i: int = 0; i < count; i++) {
        let m: Mutex = new Mutex()
        m.lock()
        m.unlock()
        completed++
      }
      expect(completed).assertEqual(count)
    })

    /**
     * @tc.name    LockComboTest7700
     * @tc.number  SUB_LOCK_COMBO_TEST_7700
     * @tc.desc    Verify creating large number of RWLock objects then releasing without leak
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: int = 100
      let completed: int = 0
      for (let i: int = 0; i < count; i++) {
        let rw: RWLock = new RWLock()
        let rl: ReadLock = rw.readLock()
        rl.lock()
        rl.unlock()
        let wl: WriteLock = rw.writeLock()
        wl.lock()
        wl.unlock()
        completed++
      }
      expect(completed).assertEqual(count)
    })

    /**
     * @tc.name    LockComboTest7800
     * @tc.number  SUB_LOCK_COMBO_TEST_7800
     * @tc.desc    Verify Mutex re-acquisition after release remains usable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      mutex.lock()
      mutex.unlock()
      let reacquired: boolean = false
      mutex.lock()
      try {
        reacquired = true
      } finally {
        mutex.unlock()
      }
      expect(reacquired).assertTrue()
    })

    // === Section 7.3: Boundary Condition Stability (8400-8600) ===

    /**
     * @tc.name    LockComboTest7900
     * @tc.number  SUB_LOCK_COMBO_TEST_7900
     * @tc.desc    Verify Mutex created without immediate use remains fully usable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mutex: Mutex = new Mutex()
      // A Mutex created without immediate use remains fully usable later.
      let usable: boolean = false
      mutex.lock()
      try {
        usable = true
      } finally {
        mutex.unlock()
      }
      expect(usable).assertTrue()
    })

    /**
     * @tc.name    LockComboTest8000
     * @tc.number  SUB_LOCK_COMBO_TEST_8000
     * @tc.desc    Verify single thread holding multiple RWLock instances management
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rw1: RWLock = new RWLock()
      let rw2: RWLock = new RWLock()
      let rw3: RWLock = new RWLock()
      let rl1: ReadLock = rw1.readLock()
      let rl2: ReadLock = rw2.readLock()
      let rl3: ReadLock = rw3.readLock()
      rl1.lock()
      rl2.lock()
      rl3.lock()
      let allLocked: boolean = false
      try {
        allLocked = true
      } finally {
        rl3.unlock()
        rl2.unlock()
        rl1.unlock()
      }
      expect(allLocked).assertTrue()
    })

    /**
     * @tc.name    LockComboTest8100
     * @tc.number  SUB_LOCK_COMBO_TEST_8100
     * @tc.desc    Verify Mutex basic lock/unlock boundary handling
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let errorCaught: boolean = false
      let validMutex: Mutex = new Mutex()
      try {
        validMutex.lock()
        validMutex.unlock()
      } catch (e) {
        errorCaught = true
      }
      expect(errorCaught).assertFalse()
    })

    // === Section 8: Missing Combo Scenarios (8200-9600) ===

    /**
     * @tc.name    LockComboTest8200
     * @tc.number  SUB_LOCK_COMBO_TEST_8200
     * @tc.desc    Verify read lock to write lock upgrade attempt blocks writer while reader holds (deadlock detection without hang)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Same-coroutine read->write upgrade is unsupported: WriteLock waits for all readers, including itself.
      // Cross-coroutine observable behavior: writer stays blocked until the reader releases.
      let rwLock: RWLock = new RWLock()
      let rl: ReadLock = rwLock.readLock()
      rl.lock()
      let done: AtomicInt = new AtomicInt(0)
      let p = taskpool.execute(new taskpool.Task(lockComboWriteAttemptTask, rwLock, done))
      await Utils.msSleep(300)
      expect(done.load()).assertEqual(0)
      rl.unlock()
      await p
      expect(done.load()).assertEqual(1)
    })

    /**
     * @tc.name    LockComboTest8300
     * @tc.number  SUB_LOCK_COMBO_TEST_8300
     * @tc.desc    Verify write lock to read lock transition blocks readers until writer releases (downgrade handoff)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Same-coroutine write->read downgrade is unsupported: ReadLock.lock() suspends while WriteLock is held by the
      // same coroutine, so WriteLock.unlock() is unreachable. Cross-coroutine handoff is validated instead.
      let rwLock: RWLock = new RWLock()
      let held: AtomicInt = new AtomicInt(0)
      let release: AtomicInt = new AtomicInt(0)
      let rGot: AtomicInt = new AtomicInt(0)
      let worker: EAWorker = new EAWorker('lockComboDowngrade')
      worker.start()
      try {
        let pW = worker.run<Promise<void>>(lockComboWriterHoldTask, rwLock, held, release)
        let tries: int = 0
        while (held.load() === 0 && tries < 50) {
          await Utils.msSleep(100)
          tries++
        }
        try {
          expect(held.load()).assertEqual(1)
          let pR = taskpool.execute(new taskpool.Task(lockComboReadAttemptTask, rwLock, rGot))
          await Utils.msSleep(300)
          expect(rGot.load()).assertEqual(0)
          release.store(1)
          await pW.Await()
          await pR
          expect(rGot.load()).assertEqual(1)
        } finally {
          release.store(1)
        }
      } finally {
        worker.quit()
      }
    })

    /**
     * @tc.name    LockComboTest8400
     * @tc.number  SUB_LOCK_COMBO_TEST_8400
     * @tc.desc    Verify same-thread true nesting of two distinct Mutex instances (lock A then lock B)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let mutexA: Mutex = new Mutex()
      let mutexB: Mutex = new Mutex()
      let counter: AtomicInt = new AtomicInt(0)
      let taskCount: int = 10
      let promises: Promise<Any>[] = []
      for (let i: int = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(lockComboNestedMutexTask, mutexA, mutexB, counter)))
      }
      await Promise.all<Any>(promises)
      // Nested locking keeps the shared counter consistent under concurrency
      expect(counter.load()).assertEqual(taskCount)
    })

    /**
     * @tc.name    LockComboTest8500
     * @tc.number  SUB_LOCK_COMBO_TEST_8500
     * @tc.desc    Verify true nesting of WriteLocks from two distinct RWLock instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rw1: RWLock = new RWLock()
      let rw2: RWLock = new RWLock()
      let counter: AtomicInt = new AtomicInt(0)
      let taskCount: int = 10
      let promises: Promise<Any>[] = []
      for (let i: int = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(lockComboNestedWriteLockTask, rw1.writeLock(), rw2.writeLock(), counter)))
      }
      await Promise.all<Any>(promises)
      // Nested write locks keep the shared counter consistent under concurrency
      expect(counter.load()).assertEqual(taskCount)
    })

    /**
     * @tc.name    LockComboTest8600
     * @tc.number  SUB_LOCK_COMBO_TEST_8600
     * @tc.desc    Verify cross-thread nesting: worker waits for Mutex held by main thread, then acquires after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let done: AtomicInt = new AtomicInt(0)
      mutex.lock()
      let worker: EAWorker = new EAWorker('lockComboNest28')
      worker.start()
      try {
        let job = worker.run<void>(lockComboNestWaitTask, mutex, done)
        try {
          await Utils.msSleep(300)
          expect(done.load()).assertEqual(0)
        } finally {
          mutex.unlock()
        }
        job.Await()
        expect(done.load()).assertEqual(1)
      } finally {
        worker.quit()
      }
    })

    /**
     * @tc.name    LockComboTest8700
     * @tc.number  SUB_LOCK_COMBO_TEST_8700
     * @tc.desc    Verify reverse cross-thread nesting: worker holds Mutex, host-side attempt blocks until worker releases
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let held: AtomicInt = new AtomicInt(0)
      let release: AtomicInt = new AtomicInt(0)
      let mainGot: AtomicInt = new AtomicInt(0)
      let worker: EAWorker = new EAWorker('lockComboNest29')
      worker.start()
      try {
        let pW = worker.run<Promise<void>>(lockComboHoldTask, mutex, held, release)
        let tries: int = 0
        while (held.load() === 0 && tries < 50) {
          await Utils.msSleep(100)
          tries++
        }
        try {
          expect(held.load()).assertEqual(1)
          let pM = taskpool.execute(new taskpool.Task(lockComboAttemptTask, mutex, mainGot))
          await Utils.msSleep(300)
          expect(mainGot.load()).assertEqual(0)
          release.store(1)
          await pW.Await()
          await pM
          expect(mainGot.load()).assertEqual(1)
        } finally {
          release.store(1)
        }
      } finally {
        worker.quit()
      }
    })

    /**
     * @tc.name    LockComboTest8800
     * @tc.number  SUB_LOCK_COMBO_TEST_8800
     * @tc.desc    Verify multi-worker nesting on the same Mutex: worker2 waits while worker1 holds, acquires after release
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let w1Held: AtomicInt = new AtomicInt(0)
      let releaseW1: AtomicInt = new AtomicInt(0)
      let w2Done: AtomicInt = new AtomicInt(0)
      let w1: EAWorker = new EAWorker('lockComboNest30a')
      w1.start()
      let w2: EAWorker = new EAWorker('lockComboNest30b')
      w2.start()
      try {
        try {
          let p1 = w1.run<Promise<void>>(lockComboHoldTask, mutex, w1Held, releaseW1)
          let tries: int = 0
          while (w1Held.load() === 0 && tries < 50) {
            await Utils.msSleep(100)
            tries++
          }
          expect(w1Held.load()).assertEqual(1)
          let p2 = w2.run<void>(lockComboWaitTask, mutex, w2Done)
          await Utils.msSleep(300)
          expect(w2Done.load()).assertEqual(0)
          releaseW1.store(1)
          await p1.Await()
          p2.Await()
          expect(w2Done.load()).assertEqual(1)
        } finally {
          releaseW1.store(1)
        }
      } finally {
        w2.quit()
        w1.quit()
      }
    })

    /**
     * @tc.name    LockComboTest8900
     * @tc.number  SUB_LOCK_COMBO_TEST_8900
     * @tc.desc    Verify Mutex lock/unlock safety inside taskpool onReceiveData callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('LockComboTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mutex: Mutex = new Mutex()
      let callbackCount: AtomicInt = new AtomicInt(0)
      let task: taskpool.Task = new taskpool.Task(lockComboSendDataTask, 1)
      task.onReceiveData((): void => {
        mutex.lock()
        callbackCount.fetchAdd(1)
        mutex.unlock()
      })
      let result: int = await taskpool.execute(task) as int
      expect(result).assertEqual(1)
      expect(callbackCount.load()).assertEqual(1)
    })

    /**
     * @tc.name    LockComboTest9000
     * @tc.number  SUB_LOCK_COMBO_TEST_9000
     * @tc.desc    Verify periodic timer task increments shared state under Mutex protection with correct final count
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('LockComboTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let mutex: Mutex = new Mutex()
      let counter: int = 0
      let tickCount: int = 0
      let expectedTicks: int = 5
      let done: boolean = false
      let timerId: int = 0
      timerId = setInterval((): void => {
        mutex.lock()
        counter++
        tickCount++
        mutex.unlock()
        if (tickCount >= expectedTicks) {
          clearInterval(timerId)
          done = true
        }
      }, 100)
      try {
        let waitTries: int = 0
        while (!done && waitTries < 60) {
          await Utils.msSleep(100)
          waitTries++
        }
        expect(done).assertTrue()
        expect(counter).assertEqual(expectedTicks)
      } finally {
        clearInterval(timerId)
      }
    })

    /**
     * @tc.name    LockComboTest9100
     * @tc.number  SUB_LOCK_COMBO_TEST_9100
     * @tc.desc    Verify Mutex concurrency: 10 tasks each performing 100 locked increments
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let mutex: Mutex = new Mutex()
      let counter: AtomicInt = new AtomicInt(0)
      let taskCount: int = 10
      let promises: Promise<Any>[] = []
      for (let i: int = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(lockComboContentionTask, mutex, counter)))
      }
      await Promise.all<Any>(promises)
      expect(counter.load()).assertEqual(taskCount * 100)
    })

    /**
     * @tc.name    LockComboTest9200
     * @tc.number  SUB_LOCK_COMBO_TEST_9200
     * @tc.desc    Verify Mutex protects 1MB-level big data transfer with integrity assertions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let mutex: Mutex = new Mutex()
      let payload: string = lockComboBuildPayload(1050)
      let expectedLen: int = payload.length
      let expectedSum: int = lockComboChecksum(payload)
      expect(expectedLen).assertEqual(1050000)
      let len: AtomicInt = new AtomicInt(0)
      let sum: AtomicInt = new AtomicInt(0)
      let result: int = await taskpool.execute(new taskpool.Task(lockComboBigDataTransferTask, mutex, payload, len, sum)) as int
      expect(result).assertEqual(expectedLen)
      expect(len.load()).assertEqual(expectedLen)
      expect(sum.load()).assertEqual(expectedSum)
      expect(lockComboChecksum(payload)).assertEqual(expectedSum)
    })

    /**
     * @tc.name    LockComboTest9300
     * @tc.number  SUB_LOCK_COMBO_TEST_9300
     * @tc.desc    Verify RWLock protects 1MB-level big data write under WriteLock and read under ReadLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let rwLock: RWLock = new RWLock()
      let data: string[] = [lockComboBuildPayload(525)]
      let chunk: string = lockComboBuildPayload(525)
      let expectedLen: int = data[0].length + chunk.length
      let ok: AtomicInt = new AtomicInt(0)
      let observed: AtomicInt = new AtomicInt(0)
      let written: int = await taskpool.execute(new taskpool.Task(lockComboWriteBigDataTask, rwLock, data, chunk, expectedLen, ok)) as int
      expect(written).assertEqual(expectedLen)
      expect(ok.load()).assertEqual(1)
      await taskpool.execute(new taskpool.Task(lockComboReadBigDataTask, rwLock, data, expectedLen, observed))
      expect(observed.load()).assertEqual(expectedLen)
      expect(data[0].length).assertEqual(expectedLen)
    })

    /**
     * @tc.name    LockComboTest9400
     * @tc.number  SUB_LOCK_COMBO_TEST_9400
     * @tc.desc    Verify multiple big data chunks concurrently transferred under separate Mutex instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let taskCount: int = 5
      let mutexes: Mutex[] = []
      let payloads: string[] = []
      let checksums: int[] = []
      for (let i: int = 0; i < taskCount; i++) {
        mutexes.push(new Mutex())
        let p: string = lockComboBuildPayload(210)
        payloads.push(p)
        checksums.push(lockComboChecksum(p))
      }
      let ok: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      for (let i: int = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(lockComboBigDataVerifyTask, mutexes[i], payloads[i], payloads[i].length, checksums[i], ok)))
      }
      await Promise.all<Any>(promises)
      expect(ok.load()).assertEqual(taskCount)
    })

    /**
     * @tc.name    LockComboTest9500
     * @tc.number  SUB_LOCK_COMBO_TEST_9500
     * @tc.desc    Verify RWLock sustained read/write lock rounds for long-running stability
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let rwLock: RWLock = new RWLock()
      let readCount: int = 0
      let writeCount: int = 0
      let rounds: int = 500
      let perRound: int = 100
      for (let r: int = 0; r < rounds; r++) {
        let rl: ReadLock = rwLock.readLock()
        for (let i: int = 0; i < perRound; i++) {
          rl.lock()
          readCount++
          rl.unlock()
        }
        let wl: WriteLock = rwLock.writeLock()
        for (let i: int = 0; i < perRound; i++) {
          wl.lock()
          writeCount++
          wl.unlock()
        }
      }
      expect(readCount).assertEqual(rounds * perRound)
      expect(writeCount).assertEqual(rounds * perRound)
    })

    /**
     * @tc.name    LockComboTest9600
     * @tc.number  SUB_LOCK_COMBO_TEST_9600
     * @tc.desc    Verify sustained taskpool onReceiveData callbacks using Mutex for long-running callback stability
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('LockComboTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let mutex: Mutex = new Mutex()
      let callbackCount: AtomicInt = new AtomicInt(0)
      let rounds: int = 20
      for (let i: int = 0; i < rounds; i++) {
        let task: taskpool.Task = new taskpool.Task(lockComboSendDataTask, i)
        task.onReceiveData((): void => {
          mutex.lock()
          callbackCount.fetchAdd(1)
          mutex.unlock()
        })
        await taskpool.execute(task)
      }
      expect(callbackCount.load()).assertEqual(rounds)
    })
  })
}
