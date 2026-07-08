'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic'
import Utils from './Util.test'

async function addDiffValueTask(s: containers.ConcurrentSet<number>, v: number): Promise<void> {
  s.add(v)
}

async function addSameValueNumTask(s: containers.ConcurrentSet<number>, v: number): Promise<void> {
  s.add(v)
}

async function addMixTask(s: containers.ConcurrentSet<number>, start: number, count: number, c: AtomicInt): Promise<void> {
  for (let i = start; i < start + count; i++) {
    s.add(i)
    c.fetchAdd(1)
  }
}

async function hasMixTask(s: containers.ConcurrentSet<number>, start: number, count: number, c: AtomicInt): Promise<void> {
  for (let i = start; i < start + count; i++) {
    s.has(i)
    c.fetchAdd(1)
  }
}

async function deleteMixTask(s: containers.ConcurrentSet<number>, start: number, count: number, c: AtomicInt): Promise<void> {
  for (let i = start; i < start + count; i++) {
    s.delete(i)
    c.fetchAdd(1)
  }
}

async function clearAddMixTask(s: containers.ConcurrentSet<number>, shouldClear: boolean, addStart: number, c: AtomicInt): Promise<void> {
  if (shouldClear) {
    s.clear()
  } else {
    s.add(addStart)
  }
  c.fetchAdd(1)
}

async function hasOnlyTask(s: containers.ConcurrentSet<number>, v: number): Promise<boolean> {
  return s.has(v)
}

async function batchAddTask(s: containers.ConcurrentSet<number>, start: number, count: number): Promise<void> {
  for (let i = start; i < start + count; i++) {
    s.add(i)
  }
}

async function continuousAddTask(s: containers.ConcurrentSet<number>, c: AtomicInt, count: number): Promise<void> {
  for (let i = 0; i < count; i++) {
    let val: number = c.fetchAdd(1)
    s.add(val)
  }
}

async function messageSourceTask(s: containers.ConcurrentSet<string>, id: number, unique: number, perSource: number): Promise<void> {
  for (let i = 0; i < perSource; i++) {
    let msgId: number = (id * perSource + i) % unique
    s.add(`msg_${msgId}`)
  }
}

async function resultTask(s: containers.ConcurrentSet<number>, taskId: number, unique: number): Promise<void> {
  let result: number = taskId % unique
  s.add(result)
}

async function registerTask(s: containers.ConcurrentSet<string>, channelId: number, userCount: number): Promise<void> {
  for (let i = 0; i < userCount; i++) {
    s.add(`user_${channelId}_${i}`)
  }
}

async function duplicateRegisterTask(s: containers.ConcurrentSet<string>, userId: number, attempts: number): Promise<void> {
  for (let i = 0; i < attempts; i++) {
    s.add(`user_${userId}`)
  }
}

async function dataSyncTask(s: containers.ConcurrentSet<string>, nodeId: number, unique: number): Promise<void> {
  for (let i = 0; i < 100; i++) {
    let recordId: number = (nodeId * 100 + i) % unique
    s.add(`record_${recordId}`)
  }
}

async function fullReadWriteTask(s: containers.ConcurrentSet<number>): Promise<void> {
  for (let i = 0; i < 10; i++) {
    try {
      s.add(i)
      s.add(i * 10)
      s.add(i)
      s.has(i)
      let size: number = s.size
      s.delete(i)
      s.delete(i * 10)
      let keys: IterableIterator<number> = s.keys()
      let v: IteratorResult<number> = keys.next()
      while (!v.done) {
        let keyVal: number | undefined = v.value
        if (keyVal !== undefined) {
          s.has(keyVal)
        }
        v = keys.next()
      }
      let values: IterableIterator<number> = s.values()
      let v2: IteratorResult<number> = values.next()
      while (!v2.done) {
        v2 = values.next()
      }
      let entries: IterableIterator<[number, number]> = s.entries()
      let v3: IteratorResult<[number, number]> = entries.next()
      while (!v3.done) {
        v3 = entries.next()
      }
      s.forEach((value: number) => {})
      s.clear()
    } catch (e) {
    }
  }
}

async function fullReadWriteStringTask(s: containers.ConcurrentSet<string>): Promise<void> {
  for (let i = 0; i < 10; i++) {
    try {
      s.add(`str_${i}`)
      s.add(`str_${i}`)
      s.has(`str_${i}`)
      let size: number = s.size
      let keys: IterableIterator<string> = s.keys()
      let v: IteratorResult<string> = keys.next()
      while (!v.done) {
        let keyVal: string | undefined = v.value
        if (keyVal !== undefined) {
          s.has(keyVal)
        }
        v = keys.next()
      }
      let values: IterableIterator<string> = s.values()
      let v2: IteratorResult<string> = values.next()
      while (!v2.done) {
        v2 = values.next()
      }
      s.forEach((value: string) => {})
      s.delete(`str_${i}`)
      s.clear()
    } catch (e) {
    }
  }
}

async function dedupReadWriteTask(s: containers.ConcurrentSet<number>, c: AtomicInt): Promise<void> {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < 5; j++) {
        s.add(999)
      }
      let sizeBefore: number = s.size
      s.add(999)
      let sizeAfter: number = s.size
      if (sizeAfter === sizeBefore) {
        c.fetchAdd(1)
      }
    } catch (e) {
    }
  }
}

async function iterateDuringModifyTask(s: containers.ConcurrentSet<number>): Promise<void> {
  for (let i = 0; i < 10; i++) {
    try {
      let keys: IterableIterator<number> = s.keys()
      let v: IteratorResult<number> = keys.next()
      while (!v.done) {
        let keyVal: number | undefined = v.value
        if (keyVal !== undefined) {
          s.add(keyVal + 100)
        }
        v = keys.next()
      }
      let entries: IterableIterator<[number, number]> = s.entries()
      let v2: IteratorResult<[number, number]> = entries.next()
      while (!v2.done) {
        let entryVal: [number, number] | undefined = v2.value
        if (entryVal !== undefined) {
          s.delete(entryVal[0])
        }
        v2 = entries.next()
      }
      s.forEach((value: number) => {
        s.add(value * 2)
      })
    } catch (e) {
    }
  }
}

async function hasCountTask(s: containers.ConcurrentSet<number>, v: number, c: AtomicInt): Promise<void> {
  if (s.has(v)) {
    c.fetchAdd(1)
  }
}

async function nestedAddTask(s: containers.ConcurrentSet<number>, baseVal: number, level: number, maxLevel: number): Promise<void> {
  s.add(baseVal + level * 1000)
  if (level < maxLevel) {
    await nestedAddTask(s, baseVal, level + 1, maxLevel)
  }
}

export default function ConcurrentSetHighConcurrencyTest(): void {
  describe('ConcurrentSetHighConcurrencyTest', (): void => {
    beforeAll((): void => {})
    beforeEach(async (): Promise<void> => {
    })
    afterEach((): void => {
    })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100)
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0100
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0100
     * @tc.desc   Verify 1 thread concurrent add different values size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(addDiffValueTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0200
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0200
     * @tc.desc   Verify 3 threads concurrent add different values size is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(addDiffValueTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0300
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0300
     * @tc.desc   Verify 5 threads concurrent add different values size is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(addDiffValueTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0400
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0400
     * @tc.desc   Verify 10 threads concurrent add different values size is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(addDiffValueTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0500
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0500
     * @tc.desc   Verify 50 threads concurrent add different values size is 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(addDiffValueTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(50)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0600
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0600
     * @tc.desc   Verify 100 threads concurrent add different values size is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(addDiffValueTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0700
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0700
     * @tc.desc   Verify 3 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(addSameValueNumTask(set, 30))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(30)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0800
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0800
     * @tc.desc   Verify 5 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(addSameValueNumTask(set, 42))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(42)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest0900
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_0900
     * @tc.desc   Verify 10 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(addSameValueNumTask(set, 100))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(100)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1000
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1000
     * @tc.desc   Verify 50 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(addSameValueNumTask(set, 999))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(999)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1100
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1100
     * @tc.desc   Verify 100 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(addSameValueNumTask(set, 1234))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(1234)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1200
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1200
     * @tc.desc   Verify 500 threads concurrent add same value size is 1 and dedup works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 500; i++) {
        promises.push(addSameValueNumTask(set, 9999))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(9999)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1300
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1300
     * @tc.desc   async 100 threads concurrent add different values with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let addCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(addMixTask(set, i, 1, addCount))
      }
      await Promise.all(promises)
      expect(addCount.load()).assertEqual(100)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1400
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1400
     * @tc.desc   async 50 add threads and 50 has threads concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let addCount: AtomicInt = new AtomicInt(0)
      let hasCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(addMixTask(set, 100 + i, 1, addCount))
      }
      for (let i = 0; i < 50; i++) {
        promises.push(hasMixTask(set, 0, 50, hasCount))
      }
      await Promise.all(promises)
      expect(addCount.load()).assertEqual(50)
      expect(hasCount.load()).assertEqual(2500)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1500
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1500
     * @tc.desc   async 50 add threads and 10 delete threads concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let addCount: AtomicInt = new AtomicInt(0)
      let deleteCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(addMixTask(set, 100, 50, addCount))
      }
      for (let i = 0; i < 10; i++) {
        promises.push(deleteMixTask(set, 0, 10, deleteCount))
      }
      await Promise.all(promises)
      expect(addCount.load()).assertEqual(2500)
      expect(deleteCount.load()).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1600
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1600
     * @tc.desc   async add threads and clear threads concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let counter: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(clearAddMixTask(set, true, 0, counter))
      }
      for (let i = 0; i < 50; i++) {
        promises.push(clearAddMixTask(set, false, 200 + i, counter))
      }
      await Promise.all(promises)
      expect(counter.load()).assertEqual(60)
      set.add(9999)
      expect(set.has(9999)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1700
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1700
     * @tc.desc   async 100 threads concurrent has same value without blocking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(42)
      let hitCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(hasCountTask(set, 42, hitCount))
      }
      await Promise.all(promises)
      expect(hitCount.load()).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1800
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1800
     * @tc.desc   async 1 level nesting 10 tasks concurrent add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(nestedAddTask(set, i, 1, 1))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest1900
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_1900
     * @tc.desc   async 2 level nesting 10 tasks concurrent add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(nestedAddTask(set, i, 1, 2))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(20)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2000
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2000
     * @tc.desc   async 3 level nesting 10 tasks concurrent add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(nestedAddTask(set, i, 1, 3))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(30)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2100
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2100
     * @tc.desc   async 5 level nesting 10 tasks concurrent add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(nestedAddTask(set, i, 1, 5))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(50)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2200
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2200
     * @tc.desc   async batch add 1 element to ConcurrentSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      promises.push(batchAddTask(set, 0, 1))
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2300
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2300
     * @tc.desc   async batch add 10 different elements to ConcurrentSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      promises.push(batchAddTask(set, 0, 10))
      await Promise.all(promises)
      expect(set.size).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2400
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2400
     * @tc.desc   async batch add 100 different elements to ConcurrentSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      let batchSize: number = 100
      let scale: number = 100
      let threadCount: number = Math.ceil(scale / batchSize)
      for (let i = 0; i < threadCount; i++) {
        let start: number = i * batchSize
        let count: number = Math.min(batchSize, scale - i * batchSize)
        promises.push(batchAddTask(set, start, count))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2500
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2500
     * @tc.desc   async batch add 1000 different elements with 10 threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      let batchSize: number = 100
      let scale: number = 1000
      let threadCount: number = Math.ceil(scale / batchSize)
      for (let i = 0; i < threadCount; i++) {
        let start: number = i * batchSize
        let count: number = Math.min(batchSize, scale - i * batchSize)
        promises.push(batchAddTask(set, start, count))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1000)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2600
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2600
     * @tc.desc   async batch add 10000 different elements with 10 threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      let batchSize: number = 1000
      let scale: number = 10000
      let threadCount: number = Math.ceil(scale / batchSize)
      for (let i = 0; i < threadCount; i++) {
        let start: number = i * batchSize
        let count: number = Math.min(batchSize, scale - i * batchSize)
        promises.push(batchAddTask(set, start, count))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(10000)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2700
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2700
     * @tc.desc   async 5 threads continuous add 200 iterations each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let counter: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(continuousAddTask(set, counter, 200))
      }
      await Promise.all(promises)
      expect(set.size).assertLargerOrEqual(10)
      expect(counter.load()).assertLargerOrEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2800
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2800
     * @tc.desc   async 5 threads continuous add 500 iterations each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let counter: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(continuousAddTask(set, counter, 500))
      }
      await Promise.all(promises)
      expect(set.size).assertLargerOrEqual(10)
      expect(counter.load()).assertLargerOrEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest2900
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_2900
     * @tc.desc   async 5 threads continuous add 1000 iterations each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetHighConcurrencyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let counter: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(continuousAddTask(set, counter, 1000))
      }
      await Promise.all(promises)
      expect(set.size).assertLargerOrEqual(10)
      expect(counter.load()).assertLargerOrEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3000
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3000
     * @tc.desc   async 1 message source 10% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 9
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3100
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3100
     * @tc.desc   async 1 message source 30% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 7
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3200
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3200
     * @tc.desc   async 1 message source 50% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 5
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3300
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3300
     * @tc.desc   async 1 message source 70% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 3
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3400
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3400
     * @tc.desc   async 5 message sources 10% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 45
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3500
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3500
     * @tc.desc   async 5 message sources 30% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 35
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3600
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3600
     * @tc.desc   async 5 message sources 50% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 25
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3700
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3700
     * @tc.desc   async 5 message sources 70% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 15
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3800
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3800
     * @tc.desc   async 10 message sources 10% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 90
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest3900
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_3900
     * @tc.desc   async 10 message sources 30% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 70
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4000
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4000
     * @tc.desc   async 10 message sources 50% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 50
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4100
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4100
     * @tc.desc   async 10 message sources 70% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 30
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4200
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4200
     * @tc.desc   async 50 message sources 10% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 450
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4300
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4300
     * @tc.desc   async 50 message sources 30% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 350
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4400
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4400
     * @tc.desc   async 50 message sources 50% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 250
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4500
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4500
     * @tc.desc   async 50 message sources 70% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 150
      let messagesPerSource: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(messageSourceTask(messageSet, i, uniqueMessages, messagesPerSource))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4600
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4600
     * @tc.desc   async 10 tasks 0% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 10
      let uniqueResults: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4700
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4700
     * @tc.desc   async 10 tasks 30% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 10
      let uniqueResults: number = 7
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4800
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4800
     * @tc.desc   async 10 tasks 70% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 10
      let uniqueResults: number = 3
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest4900
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_4900
     * @tc.desc   async 50 tasks 0% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 50
      let uniqueResults: number = 50
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5000
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5000
     * @tc.desc   async 50 tasks 30% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 50
      let uniqueResults: number = 35
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5100
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5100
     * @tc.desc   async 50 tasks 70% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 50
      let uniqueResults: number = 15
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5200
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5200
     * @tc.desc   async 100 tasks 0% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 100
      let uniqueResults: number = 100
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5300
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5300
     * @tc.desc   async 100 tasks 30% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 100
      let uniqueResults: number = 70
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5400
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5400
     * @tc.desc   async 100 tasks 70% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 100
      let uniqueResults: number = 30
      let promises: Promise<void>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(resultTask(resultSet, i, uniqueResults))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5500
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5500
     * @tc.desc   async 1 channel 10 users per channel registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 1
      let users: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(registerTask(userIdSet, i, users))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * users)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5600
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5600
     * @tc.desc   async 1 channel duplicate user registration dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueUsers: number = 50
      let attemptsPerUser: number = 3
      let promises: Promise<void>[] = []
      for (let i = 0; i < uniqueUsers; i++) {
        promises.push(duplicateRegisterTask(userIdSet, i, attemptsPerUser))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(uniqueUsers)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5700
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5700
     * @tc.desc   async 5 channels 50 users per channel registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 5
      let users: number = 50
      let promises: Promise<void>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(registerTask(userIdSet, i, users))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * users)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5800
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5800
     * @tc.desc   async 5 channels duplicate user registration dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueUsers: number = 50
      let attemptsPerUser: number = 5
      let promises: Promise<void>[] = []
      for (let i = 0; i < uniqueUsers; i++) {
        promises.push(duplicateRegisterTask(userIdSet, i, attemptsPerUser))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(uniqueUsers)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest5900
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_5900
     * @tc.desc   async 10 channels 100 users per channel registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 10
      let users: number = 100
      let promises: Promise<void>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(registerTask(userIdSet, i, users))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * users)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6000
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6000
     * @tc.desc   async 10 channels duplicate user registration dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueUsers: number = 100
      let attemptsPerUser: number = 10
      let promises: Promise<void>[] = []
      for (let i = 0; i < uniqueUsers; i++) {
        promises.push(duplicateRegisterTask(userIdSet, i, attemptsPerUser))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(uniqueUsers)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6100
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6100
     * @tc.desc   async 10 nodes concurrent sync 1000 records dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let dataSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueRecords: number = 1000
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(dataSyncTask(dataSet, i, uniqueRecords))
      }
      await Promise.all(promises)
      expect(dataSet.size).assertEqual(uniqueRecords)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6200
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6200
     * @tc.desc   async 500 threads concurrent add 500 different values extreme stress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetHighConcurrencyTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 500; i++) {
        promises.push(addDiffValueTask(set, i))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(500)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6300
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6300
     * @tc.desc   async 500 threads concurrent add same value extreme stress dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetHighConcurrencyTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 500; i++) {
        promises.push(addSameValueNumTask(set, 99999))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(99999)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6400
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6400
     * @tc.desc   async 20 threads full interface concurrent read write number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let promises: Promise<void>[] = []
      for (let i = 0; i < 20; i++) {
        promises.push(fullReadWriteTask(set))
      }
      await Promise.all(promises)
      expect(set.size).assertLargerOrEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6500
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6500
     * @tc.desc   async 50 threads full interface concurrent read write number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 200; i++) {
        set.add(i)
      }
      let promises: Promise<void>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(fullReadWriteTask(set))
      }
      await Promise.all(promises)
      expect(set.size).assertLargerOrEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6600
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6600
     * @tc.desc   async 20 threads full interface concurrent read write string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      for (let i = 0; i < 100; i++) {
        set.add(`init_${i}`)
      }
      let promises: Promise<void>[] = []
      for (let i = 0; i < 20; i++) {
        promises.push(fullReadWriteStringTask(set))
      }
      await Promise.all(promises)
      expect(set.size).assertLargerOrEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6700
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6700
     * @tc.desc   async 3 sets parallel full interface concurrent read write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set1: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let set2: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let set3: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      for (let i = 0; i < 50; i++) {
        set1.add(i)
        set2.add(i * 10)
        set3.add(`str_${i}`)
      }
      let promises: Promise<void>[] = []
      for (let i = 0; i < 20; i++) {
        promises.push(fullReadWriteTask(set1))
        promises.push(fullReadWriteTask(set2))
        promises.push(fullReadWriteStringTask(set3))
      }
      await Promise.all(promises)
      expect(set1.size).assertLargerOrEqual(0)
      expect(set2.size).assertLargerOrEqual(0)
      expect(set3.size).assertLargerOrEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetHighConcurrencyTest6800
     * @tc.number SUB_CONCURRENTSET_HIGH_CONCURRENCY_TEST_6800
     * @tc.desc   async 20 threads concurrent add same value dedup verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetHighConcurrencyTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let dedupCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 20; i++) {
        promises.push(dedupReadWriteTask(set, dedupCount))
      }
      await Promise.all(promises)
      expect(set.has(999)).assertTrue()
      expect(dedupCount.load()).assertLargerOrEqual(0)
      Done()
    })

  })
}
