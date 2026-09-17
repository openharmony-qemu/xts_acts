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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index'

function addDiffValueTask(s: containers.ConcurrentSet<number>, v: number): void {
  s.add(v)
}

function addSameValueNumTask(s: containers.ConcurrentSet<number>, v: number): void {
  s.add(v)
}

function addMixTask(s: containers.ConcurrentSet<number>, start: number, count: number, c: AtomicInt): void {
  for (let i = start; i < start + count; i++) {
    s.add(i)
    c.fetchAdd(1)
  }
}

function hasMixTask(s: containers.ConcurrentSet<number>, start: number, count: number, c: AtomicInt): void {
  for (let i = start; i < start + count; i++) {
    s.has(i)
    c.fetchAdd(1)
  }
}

function deleteMixTask(s: containers.ConcurrentSet<number>, start: number, count: number, c: AtomicInt): void {
  for (let i = start; i < start + count; i++) {
    s.delete(i)
    c.fetchAdd(1)
  }
}

function clearAddMixTask(s: containers.ConcurrentSet<number>, shouldClear: boolean, addStart: number, c: AtomicInt): void {
  if (shouldClear) {
    s.clear()
  } else {
    s.add(addStart)
  }
  c.fetchAdd(1)
}

function batchAddTask(s: containers.ConcurrentSet<number>, start: number, count: number): void {
  for (let i = start; i < start + count; i++) {
    s.add(i)
  }
}

function durationAddTask(s: containers.ConcurrentSet<number>, c: AtomicInt, dur: number, keyRange: number): void {
  let start: number = Date.now()
  while (Date.now() - start < dur) {
    let operation: number = c.fetchAdd(1)
    s.add(operation % keyRange)
  }
}

function messageSourceTask(s: containers.ConcurrentSet<string>, id: number, unique: number, perSource: number): void {
  for (let i = 0; i < perSource; i++) {
    let msgId: number = (id * perSource + i) % unique
    s.add(`msg_${msgId}`)
  }
}

function resultTask(s: containers.ConcurrentSet<number>, taskId: number, unique: number): void {
  let result: number = taskId % unique
  s.add(result)
}

function registerTask(s: containers.ConcurrentSet<string>, channelId: number, userCount: number): void {
  for (let i = 0; i < userCount; i++) {
    s.add(`user_${channelId}_${i}`)
  }
}

function channelDuplicateRegisterTask(s: containers.ConcurrentSet<string>, channelId: number, userId: number, attempts: number): void {
  for (let i = 0; i < attempts; i++) {
    s.add(`ch${channelId}_user_${userId}`)
  }
}

function dataSyncTask(s: containers.ConcurrentSet<string>, nodeId: number, unique: number): void {
  for (let i = 0; i < 100; i++) {
    let recordId: number = (nodeId * 100 + i) % unique
    s.add(`record_${recordId}`)
  }
}

function fullReadWriteTask(s: containers.ConcurrentSet<number>): void {
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
      throw e
    }
  }
}

function fullReadWriteStringTask(s: containers.ConcurrentSet<string>): void {
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
      throw e
    }
  }
}

function fullReadWriteNumberCountedTask(s: containers.ConcurrentSet<number>, completed: AtomicInt): void {
  fullReadWriteTask(s)
  completed.fetchAdd(1)
}

function fullReadWriteNumberReadyTask(s: containers.ConcurrentSet<number>, hostStart: AtomicInt,
  completed: AtomicInt): void {
  taskpool.Task.sendData(1.0)
  while (hostStart.load() === 0) {
  }
  fullReadWriteTask(s)
  completed.fetchAdd(1)
}

function fullReadWriteStringCountedTask(s: containers.ConcurrentSet<string>, completed: AtomicInt): void {
  fullReadWriteStringTask(s)
  completed.fetchAdd(1)
}

function fullReadWriteStringReadyTask(s: containers.ConcurrentSet<string>, hostStart: AtomicInt,
  completed: AtomicInt): void {
  taskpool.Task.sendData(1.0)
  while (hostStart.load() === 0) {
  }
  fullReadWriteStringTask(s)
  completed.fetchAdd(1)
}

function dedupReadWriteTask(s: containers.ConcurrentSet<number>, c: AtomicInt): void {
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
      throw e
    }
  }
}

function dedupReadWriteReadyTask(s: containers.ConcurrentSet<number>, c: AtomicInt, hostStart: AtomicInt): void {
  taskpool.Task.sendData(1.0)
  while (hostStart.load() === 0) {
  }
  dedupReadWriteTask(s, c)
}

function verifySetConsistencyNumber(s: containers.ConcurrentSet<number>): boolean {
  let count: number = 0
  let keys: IterableIterator<number> = s.keys()
  let keyResult: IteratorResult<number> = keys.next()
  while (!keyResult.done) {
    count++
    keyResult = keys.next()
  }
  return count === s.size
}

function verifySetConsistencyString(s: containers.ConcurrentSet<string>): boolean {
  let count: number = 0
  let keys: IterableIterator<string> = s.keys()
  let keyResult: IteratorResult<string> = keys.next()
  while (!keyResult.done) {
    count++
    keyResult = keys.next()
  }
  return count === s.size
}

function iterateDuringModifyTask(s: containers.ConcurrentSet<number>): void {
  for (let i = 0; i < 1; i++) {
    try {
      let keys: IterableIterator<number> = s.keys()
      let v: IteratorResult<number> = keys.next()
      while (!v.done) {
        let keyVal: number | undefined = v.value
        if (keyVal !== undefined && keyVal < 10) {
          s.add(keyVal + 100)
        }
        v = keys.next()
      }
      let entries: IterableIterator<[number, number]> = s.entries()
      let v2: IteratorResult<[number, number]> = entries.next()
      while (!v2.done) {
        let entryVal: [number, number] | undefined = v2.value
        if (entryVal !== undefined && entryVal[0] < 10) {
          s.delete(entryVal[0])
        }
        v2 = entries.next()
      }
      s.forEach((value: number) => {
        if (value < 10) {
          s.add(value * 2)
        }
      })
    } catch (e) {
      throw e
    }
  }
}

function iterateDuringModifyCountedTask(s: containers.ConcurrentSet<number>, completed: AtomicInt): void {
  iterateDuringModifyTask(s)
  completed.fetchAdd(1)
}

function iterateDuringModifyReadyTask(s: containers.ConcurrentSet<number>, hostStart: AtomicInt,
  completed: AtomicInt): void {
  taskpool.Task.sendData(1.0)
  while (hostStart.load() === 0) {
  }
  iterateDuringModifyTask(s)
  completed.fetchAdd(1)
}

function hasCountTask(s: containers.ConcurrentSet<number>, v: number, c: AtomicInt): void {
  if (s.has(v)) {
    c.fetchAdd(1)
  }
}

// Real TaskPool nesting: each level creates a new Task and awaits completion via onReceiveData
function nestedSetStepTask(s: containers.ConcurrentSet<number>, baseVal: number, level: number, maxLevel: number): void {
  s.add(baseVal + level * 1000);
  if (level < maxLevel) {
    taskpool.Task.sendData(1.0);
  }
}

async function runNestedSetChain(s: containers.ConcurrentSet<number>, baseVal: number, level: number, maxLevel: number): Promise<void> {
  let task: taskpool.Task = new taskpool.Task(nestedSetStepTask, s, baseVal, level, maxLevel);
  if (level < maxLevel) {
    let chainDone: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
      task.onReceiveData((): void => {
        resolve(undefined);
      });
    });
    await taskpool.execute(task);
    await chainDone;
    await runNestedSetChain(s, baseVal, level + 1, maxLevel);
  } else {
    await taskpool.execute(task);
  }
}

export default function ConcurrentSetRarHighConcurrencyTest(): void {
  describe('ConcurrentSetRarHighConcurrencyTest', (): void => {
    beforeAll((): void => {})
     beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0100
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0100
     * @tc.desc   Verify 1 thread concurrent add different values size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
       let promises: Promise<Any>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0200
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0200
     * @tc.desc   Verify 3 threads concurrent add different values size is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(3)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0300
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0300
     * @tc.desc   Verify 5 threads concurrent add different values size is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(5)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0400
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0400
     * @tc.desc   Verify 10 threads concurrent add different values size is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(10)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0500
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0500
     * @tc.desc   Verify 50 threads concurrent add different values size is 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(50)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0600
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0600
     * @tc.desc   Verify 100 threads concurrent add different values size is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0700
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0700
     * @tc.desc   Verify 3 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addSameValueNumTask, set, 30.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(30)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0800
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0800
     * @tc.desc   Verify 5 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addSameValueNumTask, set, 42.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(42)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest0900
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_0900
     * @tc.desc   Verify 10 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addSameValueNumTask, set, 100.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(100)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1000
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1000
     * @tc.desc   Verify 50 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addSameValueNumTask, set, 999.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(999)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1100
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1100
     * @tc.desc   Verify 100 threads concurrent add same value size is 1 and has returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addSameValueNumTask, set, 1234.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(1234)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1200
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1200
     * @tc.desc   Verify 500 threads concurrent add same value size is 1 and dedup works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 500; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addSameValueNumTask, set, 9999.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(9999)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1300
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1300
     * @tc.desc   async 100 threads concurrent add different values with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let addCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addMixTask, set, i * 1.0, 1.0, addCount)))
      }
      await Promise.all(promises)
      expect(addCount.load()).assertEqual(100)
      expect(set.size).assertEqual(100)
      let allPresent: boolean = true
      for (let i = 0; i < 100; i++) {
        if (!set.has(i)) {
          allPresent = false
        }
      }
      expect(allPresent).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1400
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1400
     * @tc.desc   async 50 add threads and 50 has threads concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let addCount: AtomicInt = new AtomicInt(0)
      let hasCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addMixTask, set, (100 + i) * 1.0, 1.0, addCount)))
      }
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(hasMixTask, set, 0.0, 50.0, hasCount)))
      }
      await Promise.all(promises)
      expect(addCount.load()).assertEqual(50)
      expect(hasCount.load()).assertEqual(2500)
      expect(set.size).assertEqual(100)
      let addedPresent: boolean = true
      for (let i = 100; i < 150; i++) {
        if (!set.has(i)) {
          addedPresent = false
        }
      }
      expect(addedPresent).assertTrue()
      let initialPresent: boolean = true
      for (let i = 0; i < 50; i++) {
        if (!set.has(i)) {
          initialPresent = false
        }
      }
      expect(initialPresent).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1500
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1500
     * @tc.desc   async 50 add threads and 10 delete threads concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let addCount: AtomicInt = new AtomicInt(0)
      let deleteCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addMixTask, set, 100.0, 50.0, addCount)))
      }
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(deleteMixTask, set, 0.0, 10.0, deleteCount)))
      }
      await Promise.all(promises)
      expect(addCount.load()).assertEqual(2500)
      expect(deleteCount.load()).assertEqual(100)
      let remainingPreserved: boolean = true
      for (let i = 10; i < 100; i++) {
        if (!set.has(i)) {
          remainingPreserved = false
        }
      }
      expect(remainingPreserved).assertTrue()
      let addedPreserved: boolean = true
      for (let i = 100; i < 150; i++) {
        if (!set.has(i)) {
          addedPreserved = false
        }
      }
      expect(addedPreserved).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1600
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1600
     * @tc.desc   async add and clear concurrently, then verify add remains effective after the mixed phase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let counter: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(clearAddMixTask, set, true, 0.0, counter)))
      }
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(clearAddMixTask, set, false, (200 + i) * 1.0, counter)))
      }
      try {
        await Promise.all(promises)
        expect(counter.load()).assertEqual(60)
        let postClearAddPromises: Promise<Any>[] = []
        for (let i = 200; i < 250; i++) {
          postClearAddPromises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
        }
        await Promise.all(postClearAddPromises)
      } catch (e) {
        throw e
      }
      let addedPhase: boolean = true
      for (let i = 200; i < 250; i++) {
        if (!set.has(i)) {
          addedPhase = false
        }
      }
      expect(addedPhase).assertTrue()
      expect(set.has(200)).assertTrue()
      expect(set.has(249)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1700
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1700
     * @tc.desc   async 100 threads concurrent has same value without blocking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(42)
      let hitCount: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(taskpool.execute(new taskpool.Task(hasCountTask, set, 42.0, hitCount)))
      }
      await Promise.all(promises)
      expect(hitCount.load()).assertEqual(100)
      expect(set.size).assertEqual(1)
      expect(set.has(42)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1800
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1800
     * @tc.desc   async 1 level nesting 10 tasks concurrent add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(runNestedSetChain(set, i, 1, 1))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(10)
      let allPresent: boolean = true
      for (let i = 0; i < 10; i++) {
        if (!set.has(i + 1000)) {
          allPresent = false
        }
      }
      expect(allPresent).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest1900
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_1900
     * @tc.desc   async 2 level nesting 10 tasks concurrent add via TaskPool chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(runNestedSetChain(set, i, 1, 2))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(20)
      let allPresent: boolean = true
      for (let i = 0; i < 10; i++) {
        if (!set.has(i + 1000) || !set.has(i + 2000)) {
          allPresent = false
        }
      }
      expect(allPresent).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2000
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2000
     * @tc.desc   async 3 level nesting 10 tasks concurrent add via TaskPool chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(runNestedSetChain(set, i, 1, 3))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(30)
      let allPresent: boolean = true
      for (let i = 0; i < 10; i++) {
        if (!set.has(i + 1000) || !set.has(i + 2000) || !set.has(i + 3000)) {
          allPresent = false
        }
      }
      expect(allPresent).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2100
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2100
     * @tc.desc   async 5 level nesting 10 tasks concurrent add via TaskPool chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(runNestedSetChain(set, i, 1, 5))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(50)
      let allPresent: boolean = true
      for (let i = 0; i < 10; i++) {
        if (!set.has(i + 1000) || !set.has(i + 2000) || !set.has(i + 3000) || !set.has(i + 4000) || !set.has(i + 5000)) {
          allPresent = false
        }
      }
      expect(allPresent).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2200
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2200
     * @tc.desc   async batch add 1 element to ConcurrentSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      promises.push(taskpool.execute(new taskpool.Task(batchAddTask, set, 0.0, 1.0)))
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2300
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2300
     * @tc.desc   async batch add 10 different elements to ConcurrentSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      promises.push(taskpool.execute(new taskpool.Task(batchAddTask, set, 0.0, 10.0)))
      await Promise.all(promises)
      expect(set.size).assertEqual(10)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2400
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2400
     * @tc.desc   async batch add 100 different elements to ConcurrentSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      let batchSize: number = 100
      let scale: number = 100
      let threadCount: number = Math.ceil(scale / batchSize)
      for (let i = 0; i < threadCount; i++) {
        let start: number = i * batchSize
        let count: number = Math.min(batchSize, scale - i * batchSize)
        promises.push(taskpool.execute(new taskpool.Task(batchAddTask, set, start * 1.0, count * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2500
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2500
     * @tc.desc   async batch add 1000 different elements with 10 threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      let batchSize: number = 100
      let scale: number = 1000
      let threadCount: number = Math.ceil(scale / batchSize)
      for (let i = 0; i < threadCount; i++) {
        let start: number = i * batchSize
        let count: number = Math.min(batchSize, scale - i * batchSize)
        promises.push(taskpool.execute(new taskpool.Task(batchAddTask, set, start * 1.0, count * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1000)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2600
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2600
     * @tc.desc   async batch add 10000 different elements with 10 threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      let batchSize: number = 1000
      let scale: number = 10000
      let threadCount: number = Math.ceil(scale / batchSize)
      for (let i = 0; i < threadCount; i++) {
        let start: number = i * batchSize
        let count: number = Math.min(batchSize, scale - i * batchSize)
        promises.push(taskpool.execute(new taskpool.Task(batchAddTask, set, start * 1.0, count * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(10000)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2700
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2700
     * @tc.desc   async 5 threads continuously add bounded key-range values during 1s duration window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let counter: AtomicInt = new AtomicInt(0)
      let durationMs: number = 1000
      let toleranceMs: number = 30000
      let startTime: number = Date.now()
      let promises: Promise<Any>[] = []
      try {
        for (let i = 0; i < 5; i++) {
          promises.push(taskpool.execute(new taskpool.Task(durationAddTask, set, counter, durationMs * 1.0, 1000.0)))
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      let elapsed: number = Date.now() - startTime
      expect(elapsed).assertLargerOrEqual(durationMs)
      expect(elapsed).assertLessOrEqual(durationMs + toleranceMs)
      expect(counter.load()).assertLargerOrEqual(1000)
      expect(set.size).assertEqual(1000)
      expect(set.has(0)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2800
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2800
     * @tc.desc   async 5 threads continuously add bounded key-range values during 10s duration window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let counter: AtomicInt = new AtomicInt(0)
      let durationMs: number = 10000
      let toleranceMs: number = 40000
      let startTime: number = Date.now()
      let promises: Promise<Any>[] = []
      try {
        for (let i = 0; i < 5; i++) {
          promises.push(taskpool.execute(new taskpool.Task(durationAddTask, set, counter, durationMs * 1.0, 1000.0)))
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      let elapsed: number = Date.now() - startTime
      expect(elapsed).assertLargerOrEqual(durationMs)
      expect(elapsed).assertLessOrEqual(durationMs + toleranceMs)
      expect(counter.load()).assertLargerOrEqual(1000)
      expect(set.size).assertEqual(1000)
      expect(set.has(0)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest2900
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_2900
     * @tc.desc   async 5 threads continuously add bounded key-range values during 30s duration window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetRarHighConcurrencyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let counter: AtomicInt = new AtomicInt(0)
      let durationMs: number = 30000
      let toleranceMs: number = 60000
      let startTime: number = Date.now()
      let promises: Promise<Any>[] = []
      try {
        for (let i = 0; i < 5; i++) {
          promises.push(taskpool.execute(new taskpool.Task(durationAddTask, set, counter, durationMs * 1.0, 1000.0)))
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      let elapsed: number = Date.now() - startTime
      expect(elapsed).assertLargerOrEqual(durationMs)
      expect(elapsed).assertLessOrEqual(durationMs + toleranceMs)
      expect(counter.load()).assertLargerOrEqual(1000)
      expect(set.size).assertEqual(1000)
      expect(set.has(0)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3000
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3000
     * @tc.desc   async 1 message source 10% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 9
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3100
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3100
     * @tc.desc   async 1 message source 30% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 7
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3200
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3200
     * @tc.desc   async 1 message source 50% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 5
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3300
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3300
     * @tc.desc   async 1 message source 70% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 3
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 1; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3400
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3400
     * @tc.desc   async 5 message sources 10% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 45
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3500
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3500
     * @tc.desc   async 5 message sources 30% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 35
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3600
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3600
     * @tc.desc   async 5 message sources 50% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 25
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3700
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3700
     * @tc.desc   async 5 message sources 70% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 15
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3800
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3800
     * @tc.desc   async 10 message sources 10% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 90
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest3900
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_3900
     * @tc.desc   async 10 message sources 30% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 70
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4000
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4000
     * @tc.desc   async 10 message sources 50% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 50
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4100
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4100
     * @tc.desc   async 10 message sources 70% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 30
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4200
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4200
     * @tc.desc   async 50 message sources 10% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 450
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4300
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4300
     * @tc.desc   async 50 message sources 30% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 350
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4400
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4400
     * @tc.desc   async 50 message sources 50% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 250
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4500
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4500
     * @tc.desc   async 50 message sources 70% duplicate rate dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueMessages: number = 150
      let messagesPerSource: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(messageSourceTask, messageSet, i * 1.0, uniqueMessages * 1.0, messagesPerSource * 1.0)))
      }
      await Promise.all(promises)
      expect(messageSet.size).assertEqual(uniqueMessages)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4600
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4600
     * @tc.desc   async 10 tasks 0% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 10
      let uniqueResults: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4700
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4700
     * @tc.desc   async 10 tasks 30% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 10
      let uniqueResults: number = 7
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4800
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4800
     * @tc.desc   async 10 tasks 70% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 10
      let uniqueResults: number = 3
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest4900
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_4900
     * @tc.desc   async 50 tasks 0% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 50
      let uniqueResults: number = 50
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5000
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5000
     * @tc.desc   async 50 tasks 30% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 50
      let uniqueResults: number = 35
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5100
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5100
     * @tc.desc   async 50 tasks 70% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 50
      let uniqueResults: number = 15
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5200
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5200
     * @tc.desc   async 100 tasks 0% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 100
      let uniqueResults: number = 100
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5300
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5300
     * @tc.desc   async 100 tasks 30% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 100
      let uniqueResults: number = 70
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5400
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5400
     * @tc.desc   async 100 tasks 70% duplicate result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 100
      let uniqueResults: number = 30
      let promises: Promise<Any>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
      }
      await Promise.all(promises)
      expect(resultSet.size).assertEqual(uniqueResults)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5500
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5500
     * @tc.desc   async 1 channel 10 users per channel registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 1
      let users: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * users)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5600
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5600
     * @tc.desc   async 1 channel duplicate user registration dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 1
      let uniqueUsers: number = 50
      let attemptsPerUser: number = 3
      let promises: Promise<Any>[] = []
      for (let ch = 0; ch < channels; ch++) {
        for (let i = 0; i < uniqueUsers; i++) {
          promises.push(taskpool.execute(new taskpool.Task(channelDuplicateRegisterTask, userIdSet, ch * 1.0, i * 1.0, attemptsPerUser * 1.0)))
        }
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * uniqueUsers)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5700
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5700
     * @tc.desc   async 5 channels 50 users per channel registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 5
      let users: number = 50
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * users)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5800
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5800
     * @tc.desc   async 5 channels duplicate user registration dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 5
      let uniqueUsers: number = 50
      let attemptsPerUser: number = 5
      let promises: Promise<Any>[] = []
      for (let ch = 0; ch < channels; ch++) {
        for (let i = 0; i < uniqueUsers; i++) {
          promises.push(taskpool.execute(new taskpool.Task(channelDuplicateRegisterTask, userIdSet, ch * 1.0, i * 1.0, attemptsPerUser * 1.0)))
        }
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * uniqueUsers)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest5900
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_5900
     * @tc.desc   async 10 channels 100 users per channel registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 10
      let users: number = 100
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * users)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6000
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6000
     * @tc.desc   async 10 channels duplicate user registration dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 10
      let uniqueUsers: number = 100
      let attemptsPerUser: number = 10
      let promises: Promise<Any>[] = []
      for (let ch = 0; ch < channels; ch++) {
        for (let i = 0; i < uniqueUsers; i++) {
          promises.push(taskpool.execute(new taskpool.Task(channelDuplicateRegisterTask, userIdSet, ch * 1.0, i * 1.0, attemptsPerUser * 1.0)))
        }
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * uniqueUsers)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6100
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6100
     * @tc.desc   async 10 nodes concurrent sync 1000 records dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let dataSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let uniqueRecords: number = 1000
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(dataSyncTask, dataSet, i * 1.0, uniqueRecords * 1.0)))
      }
      await Promise.all(promises)
      expect(dataSet.size).assertEqual(uniqueRecords)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6200
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6200
     * @tc.desc   async 500 threads concurrent add 500 different values extreme stress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetRarHighConcurrencyTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 500; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(500)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6300
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6300
     * @tc.desc   async 500 threads concurrent add same value extreme stress dedup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetRarHighConcurrencyTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      for (let i = 0; i < 500; i++) {
        promises.push(taskpool.execute(new taskpool.Task(addSameValueNumTask, set, 99999.0)))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(1)
      expect(set.has(99999)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6400
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6400
     * @tc.desc   async main thread and 20 TaskPool children full interface concurrent read write number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let hostStart: AtomicInt = new AtomicInt(0)
      let completed: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      let readyTask: taskpool.Task = new taskpool.Task(fullReadWriteNumberReadyTask, set, hostStart, completed)
      let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
        readyTask.onReceiveData((): void => {
          resolve(undefined)
        })
      })
      promises.push(taskpool.execute(readyTask))
      for (let i = 1; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(fullReadWriteNumberCountedTask, set, completed)))
      }
      await ready
      hostStart.store(1)
      for (let i = 0; i < 20; i++) {
        fullReadWriteTask(set)
        completed.fetchAdd(1)
      }
      await Promise.all(promises)
      expect(completed.load()).assertEqual(40)
      expect(verifySetConsistencyNumber(set)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6500
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6500
     * @tc.desc   async main thread and 50 TaskPool children full interface concurrent read write number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 200; i++) {
        set.add(i)
      }
      let hostStart: AtomicInt = new AtomicInt(0)
      let completed: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      let readyTask: taskpool.Task = new taskpool.Task(fullReadWriteNumberReadyTask, set, hostStart, completed)
      let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
        readyTask.onReceiveData((signal: number): void => {
          if (signal === 1.0) {
            resolve(undefined)
          }
        })
      })
      promises.push(taskpool.execute(readyTask))
      for (let i = 1; i < 50; i++) {
        promises.push(taskpool.execute(new taskpool.Task(fullReadWriteNumberCountedTask, set, completed)))
      }
      await ready
      hostStart.store(1)
      for (let i = 0; i < 50; i++) {
        fullReadWriteTask(set)
        completed.fetchAdd(1)
      }
      await Promise.all(promises)
      expect(completed.load()).assertEqual(100)
      expect(verifySetConsistencyNumber(set)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6600
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6600
     * @tc.desc   async main thread and 20 TaskPool children full interface concurrent read write string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      for (let i = 0; i < 100; i++) {
        set.add(`init_${i}`)
      }
      let hostStart: AtomicInt = new AtomicInt(0)
      let completed: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      let readyTask: taskpool.Task = new taskpool.Task(fullReadWriteStringReadyTask, set, hostStart, completed)
      let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
        readyTask.onReceiveData((): void => {
          resolve(undefined)
        })
      })
      promises.push(taskpool.execute(readyTask))
      for (let i = 1; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(fullReadWriteStringCountedTask, set, completed)))
      }
      await ready
      hostStart.store(1)
      for (let i = 0; i < 20; i++) {
        fullReadWriteStringTask(set)
        completed.fetchAdd(1)
      }
      await Promise.all(promises)
      expect(completed.load()).assertEqual(40)
      expect(verifySetConsistencyString(set)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6700
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6700
     * @tc.desc   async main thread and TaskPool children operate 3 sets in parallel with full interface read write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set1: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let set2: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let set3: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      for (let i = 0; i < 50; i++) {
        set1.add(i)
        set2.add(i * 10)
        set3.add(`str_${i}`)
      }
      let hostStart: AtomicInt = new AtomicInt(0)
      let completed: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      let readyTask: taskpool.Task = new taskpool.Task(fullReadWriteNumberReadyTask, set1, hostStart, completed)
      let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
        readyTask.onReceiveData((): void => {
          resolve(undefined)
        })
      })
      promises.push(taskpool.execute(readyTask))
      for (let i = 0; i < 20; i++) {
        if (i > 0) {
          promises.push(taskpool.execute(new taskpool.Task(fullReadWriteNumberCountedTask, set1, completed)))
        }
        promises.push(taskpool.execute(new taskpool.Task(fullReadWriteNumberCountedTask, set2, completed)))
        promises.push(taskpool.execute(new taskpool.Task(fullReadWriteStringCountedTask, set3, completed)))
      }
      await ready
      hostStart.store(1)
      for (let i = 0; i < 20; i++) {
        fullReadWriteTask(set1)
        completed.fetchAdd(1)
        fullReadWriteTask(set2)
        completed.fetchAdd(1)
        fullReadWriteStringTask(set3)
        completed.fetchAdd(1)
      }
      await Promise.all(promises)
      expect(completed.load()).assertEqual(120)
      expect(verifySetConsistencyNumber(set1)).assertTrue()
      expect(verifySetConsistencyNumber(set2)).assertTrue()
      expect(verifySetConsistencyString(set3)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6800
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6800
     * @tc.desc   async main thread and 20 TaskPool children concurrently add the same value and verify deduplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let dedupCount: AtomicInt = new AtomicInt(0)
      let hostStart: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      let readyTask: taskpool.Task = new taskpool.Task(dedupReadWriteReadyTask, set, dedupCount, hostStart)
      let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
        readyTask.onReceiveData((signal: number): void => {
          if (signal === 1.0) {
            resolve(undefined)
          }
        })
      })
      promises.push(taskpool.execute(readyTask))
      for (let i = 1; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(dedupReadWriteTask, set, dedupCount)))
      }
      try {
        await ready
        hostStart.store(1)
        for (let i = 0; i < 20; i++) {
          dedupReadWriteTask(set, dedupCount)
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      expect(set.has(999)).assertTrue()
      expect(set.size).assertEqual(1)
      expect(dedupCount.load()).assertEqual(400)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest6900
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_6900
     * @tc.desc   async 1 channel 50 users per channel registration size 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 1
      let users: number = 50
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      await Promise.all(promises)
      expect(userIdSet.size).assertEqual(channels * users)
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest7000
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7000
     * @tc.desc   async 1 channel 100 users per channel registration size 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 1
      let users: number = 100
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      await Promise.all(promises)
       expect(userIdSet.size).assertEqual(channels * users)
       done()
     })

     /**
      * @tc.name   ConcurrentSetRarHighConcurrencyTest7100
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7100
     * @tc.desc   async 5 channels 10 users per channel registration size 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 5
      let users: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      await Promise.all(promises)
       expect(userIdSet.size).assertEqual(channels * users)
       done()
     })

     /**
      * @tc.name   ConcurrentSetRarHighConcurrencyTest7200
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7200
     * @tc.desc   async 5 channels 100 users per channel registration size 500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 5
      let users: number = 100
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      await Promise.all(promises)
       expect(userIdSet.size).assertEqual(channels * users)
       done()
     })

     /**
      * @tc.name   ConcurrentSetRarHighConcurrencyTest7300
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7300
     * @tc.desc   async 10 channels 10 users per channel registration size 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 10
      let users: number = 10
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      await Promise.all(promises)
       expect(userIdSet.size).assertEqual(channels * users)
       done()
     })

     /**
      * @tc.name   ConcurrentSetRarHighConcurrencyTest7400
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7400
     * @tc.desc   async 10 channels 50 users per channel registration size 500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let userIdSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      let channels: number = 10
      let users: number = 50
      let promises: Promise<Any>[] = []
      for (let i = 0; i < channels; i++) {
        promises.push(taskpool.execute(new taskpool.Task(registerTask, userIdSet, i * 1.0, users * 1.0)))
      }
      try {
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
       expect(userIdSet.size).assertEqual(channels * users)
       done()
     })

     /**
      * @tc.name   ConcurrentSetRarHighConcurrencyTest7500
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7500
      * @tc.desc   async main thread and 20 TaskPool children iterate while modifying the same set with weak consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetRarHighConcurrencyTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let hostStart: AtomicInt = new AtomicInt(0)
      let completed: AtomicInt = new AtomicInt(0)
      let promises: Promise<Any>[] = []
      let readyTask: taskpool.Task = new taskpool.Task(iterateDuringModifyReadyTask, set, hostStart, completed)
      let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
        readyTask.onReceiveData((signal: number): void => {
          if (signal === 1.0) {
            resolve(undefined)
          }
        })
      })
      promises.push(taskpool.execute(readyTask))
      for (let i = 1; i < 20; i++) {
        promises.push(taskpool.execute(new taskpool.Task(iterateDuringModifyCountedTask, set, completed)))
      }
      try {
        await ready
        hostStart.store(1)
        for (let i = 0; i < 20; i++) {
          iterateDuringModifyTask(set)
          completed.fetchAdd(1)
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      expect(completed.load()).assertEqual(40)
      expect(verifySetConsistencyNumber(set)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest7600
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7600
     * @tc.desc   async 5 threads continuously add bounded key-range values during 60s duration window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetRarHighConcurrencyTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let counter: AtomicInt = new AtomicInt(0)
      let durationMs: number = 60000
      let toleranceMs: number = 120000
      let startTime: number = Date.now()
      let promises: Promise<Any>[] = []
      try {
        for (let i = 0; i < 5; i++) {
          promises.push(taskpool.execute(new taskpool.Task(durationAddTask, set, counter, durationMs * 1.0, 1000.0)))
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      let elapsed: number = Date.now() - startTime
      expect(elapsed).assertLargerOrEqual(durationMs)
      expect(elapsed).assertLessOrEqual(durationMs + toleranceMs)
      expect(counter.load()).assertLargerOrEqual(1000)
      expect(set.size).assertEqual(1000)
      expect(set.has(0)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest7700
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7700
     * @tc.desc   async batch add 100000 different elements with 10 tasks exact size check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetRarHighConcurrencyTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      let batchSize: number = 10000
      let scale: number = 100000
      let threadCount: number = Math.ceil(scale / batchSize)
      try {
        for (let i = 0; i < threadCount; i++) {
          let start: number = i * batchSize
          let count: number = Math.min(batchSize, scale - i * batchSize)
          promises.push(taskpool.execute(new taskpool.Task(batchAddTask, set, start * 1.0, count * 1.0)))
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      expect(set.size).assertEqual(100000)
      expect(set.has(0)).assertTrue()
      expect(set.has(99999)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest7800
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7800
     * @tc.desc   async 500 tasks concurrent result collection with unique results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetRarHighConcurrencyTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let resultSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let taskCount: number = 500
      let uniqueResults: number = 500
      let promises: Promise<Any>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(taskpool.execute(new taskpool.Task(resultTask, resultSet, i * 1.0, uniqueResults * 1.0)))
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      expect(resultSet.size).assertEqual(uniqueResults)
      expect(resultSet.has(0)).assertTrue()
      expect(resultSet.has(taskCount - 1)).assertTrue()
      done()
    })

    /**
     * @tc.name   ConcurrentSetRarHighConcurrencyTest7900
     * @tc.number SUB_CONCURRENTSET_RAR_HIGH_CONCURRENCY_TEST_7900
     * @tc.desc   async 500 workers concurrent add different values extreme with boundary checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ConcurrentSetRarHighConcurrencyTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<Any>[] = []
      try {
        for (let i = 0; i < 500; i++) {
          promises.push(taskpool.execute(new taskpool.Task(addDiffValueTask, set, i * 1.0)))
        }
        await Promise.all(promises)
      } catch (e) {
        throw e
      }
      expect(set.size).assertEqual(500)
      expect(set.has(0)).assertTrue()
      expect(set.has(499)).assertTrue()
      done()
    })

   })

}
