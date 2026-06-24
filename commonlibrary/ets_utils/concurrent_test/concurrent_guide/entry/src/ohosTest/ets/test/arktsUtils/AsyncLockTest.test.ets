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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils, taskpool } from '@kit.ArkTS';

@Sendable
class SharedCounter {
  count: number = 0
}

@Concurrent
async function taskWithLock(lock: ArkTSUtils.locks.AsyncLock, counter: SharedCounter): Promise<number> {
  let result: number = await lock.lockAsync(() => {
    counter.count++
    return counter.count
  })
  return result
}

@Concurrent
async function taskWithLockLarge(lock: ArkTSUtils.locks.AsyncLock, counter: SharedCounter): Promise<number> {
  let result: number = await lock.lockAsync(() => {
    counter.count++
    return counter.count
  })
  return result
}

@Concurrent
async function incrementTen(lock: ArkTSUtils.locks.AsyncLock, counter: SharedCounter): Promise<number> {
  let result: number = await lock.lockAsync(() => {
    for (let i: number = 0; i < 10; i++) {
      counter.count++
    }
    return counter.count
  })
  return result
}

export default function AsyncLockTest(): void {
  describe('AsyncLockTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   AsyncLockTest0100
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0100
     * @tc.desc   Verify AsyncLock constructor creates a valid lock object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncLockTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      expect(lock instanceof ArkTSUtils.locks.AsyncLock).assertTrue()
      let result: string = await lock.lockAsync(() => {
        return 'created'
      })
      expect(result).assertEqual('created')
    })

    /**
     * @tc.name   AsyncLockTest0200
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0200
     * @tc.desc   Verify AsyncLock.lockAsync() executes callback and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncLockTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let result: string = await lock.lockAsync(() => {
        return 'lock executed'
      })
      expect(result).assertEqual('lock executed')
    })

    /**
     * @tc.name   AsyncLockTest0300
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0300
     * @tc.desc   Verify AsyncLock.lockAsync() passes return value from callback to caller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncLockTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let result: number = await lock.lockAsync(() => {
        let computed: number = 42
        return computed
      })
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   AsyncLockTest0400
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0400
     * @tc.desc   Verify AsyncLock can be passed across TaskPool threads and maintains mutex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncLockTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let counter: SharedCounter = new SharedCounter()
      let p1: Promise<Object> = taskpool.execute(new taskpool.Task(taskWithLock, lock, counter))
      let p2: Promise<Object> = taskpool.execute(new taskpool.Task(taskWithLock, lock, counter))
      let p3: Promise<Object> = taskpool.execute(new taskpool.Task(taskWithLock, lock, counter))
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results.length).assertEqual(3)
      expect(counter.count).assertEqual(3)
    })

    /**
     * @tc.name   AsyncLockTest0500
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0500
     * @tc.desc   Verify AsyncLock auto-releases after callback completes allowing sequential acquisition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncLockTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let first: string = await lock.lockAsync(() => {
        return 'first lock'
      })
      expect(first).assertEqual('first lock')
      let second: string = await lock.lockAsync(() => {
        return 'second lock'
      })
      expect(second).assertEqual('second lock')
      let third: string = await lock.lockAsync(() => {
        return 'third lock'
      })
      expect(third).assertEqual('third lock')
    })

    /**
     * @tc.name   AsyncLockTest0600
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0600
     * @tc.desc   Verify AsyncLock protects shared counter with 10 concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncLockTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let counter: SharedCounter = new SharedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(taskWithLock, lock, counter)))
      }
      await Promise.all(promises)
      expect(counter.count).assertEqual(10)
    })

    /**
     * @tc.name   AsyncLockTest0700
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0700
     * @tc.desc   Verify AsyncLock sequential usage with multiple acquire-release cycles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncLockTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let results: string[] = []
      for (let i: number = 0; i < 5; i++) {
        let result: string = await lock.lockAsync(() => {
          return 'cycle-' + i.toString()
        })
        results.push(result)
      }
      expect(results.length).assertEqual(5)
      expect(results[0]).assertEqual('cycle-0')
      expect(results[4]).assertEqual('cycle-4')
    })

    /**
     * @tc.name   AsyncLockTest0800
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0800
     * @tc.desc   Verify AsyncLock.lockAsync() with empty callback returning undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncLockTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let executed: boolean = false
      await lock.lockAsync(() => {
        executed = true
      })
      expect(executed).assertTrue()
    })

    /**
     * @tc.name   AsyncLockTest0900
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_0900
     * @tc.desc   Verify AsyncLock releases lock after callback throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncLockTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let caughtError: boolean = false
      try {
        await lock.lockAsync(() => {
          throw new Error('callback error')
        })
        expect().assertFail()
      } catch (e) {
        caughtError = true
        
      }
      expect(caughtError).assertTrue()
      let result: string = await lock.lockAsync(() => {
        return 'lock released after exception'
      })
      expect(result).assertEqual('lock released after exception')
    })

    /**
     * @tc.name   AsyncLockTest1000
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_1000
     * @tc.desc   Verify AsyncLock.lockAsync() without await maintains correct execution order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncLockTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let value: number = 0
      let promise1: Promise<number> = lock.lockAsync(() => {
        value = 1
        return value
      })
      let promise2: Promise<number> = lock.lockAsync(() => {
        value = 2
        return value
      })
      await promise1
      await promise2
      expect(value).assertEqual(2)
    })

    /**
     * @tc.name   AsyncLockTest1100
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_1100
     * @tc.desc   Verify AsyncLock with 100 concurrent tasks for stress mutex correctness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncLockTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let counter: SharedCounter = new SharedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 100; i++) {
        promises.push(taskpool.execute(new taskpool.Task(taskWithLockLarge, lock, counter)))
      }
      await Promise.all(promises)
      expect(counter.count).assertEqual(100)
    })

    /**
     * @tc.name   AsyncLockTest1200
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_1200
     * @tc.desc   Verify AsyncLock lifecycle stability after repeated acquire-release operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncLockTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      for (let i: number = 0; i < 50; i++) {
        await lock.lockAsync(() => {
          return i
        })
      }
      let result: string = await lock.lockAsync(() => {
        return 'still working'
      })
      expect(result).assertEqual('still working')
    })

    /**
     * @tc.name   AsyncLockTest1300
     * @tc.number SUB_ARKTS_UTILS_ASYNCLOCK_TEST_1300
     * @tc.desc   Verify AsyncLock with concurrent tasks each performing multiple increments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncLockTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let counter: SharedCounter = new SharedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(incrementTen, lock, counter)))
      }
      await Promise.all(promises)
      expect(counter.count).assertEqual(100)
    })
  })
}
