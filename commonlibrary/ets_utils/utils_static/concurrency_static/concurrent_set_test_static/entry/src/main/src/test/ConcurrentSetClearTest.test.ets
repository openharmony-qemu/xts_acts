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
import Utils from './Util.test'

async function clearTask(s: containers.ConcurrentSet<number>): Promise<void> {
  s.clear()
}

async function clearTaskStr(s: containers.ConcurrentSet<string>): Promise<void> {
  s.clear()
}

async function outerTaskClearSize(): Promise<int> {
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  innerSet.clear()
  return innerSet.size
}

async function outerTaskClearEmpty(): Promise<int> {
  let innerSet: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
  innerSet.clear()
  return innerSet.size
}

async function clearTaskInCallback(s: containers.ConcurrentSet<int>): Promise<void> {
  s.clear()
}

export default function ConcurrentSetClearTest(): void {
  describe('ConcurrentSetClearTest', (): void => {
    beforeAll((): void => {})
    beforeEach(async (): Promise<void> => {

    })
    afterEach((): void => {
    })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100)
    })

    /**
     * @tc.name   ConcurrentSetClearTest0100
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0100
     * @tc.desc   Verify ConcurrentSet clear() removes all elements and size becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      expect(set.has(1)).assertFalse()
      expect(set.has(2)).assertFalse()
      expect(set.has(3)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest0200
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0200
     * @tc.desc   Verify ConcurrentSet clear() on empty set does not throw and size remains 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest0300
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0300
     * @tc.desc   Verify ConcurrentSet clear() returns void and size is 0 after clearing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest0400
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0400
     * @tc.desc   Verify ConcurrentSet clear() with string type elements removes all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.clear()
      expect(set.size).assertEqual(0)
      expect(set.has('a')).assertFalse()
      expect(set.has('b')).assertFalse()
      expect(set.has('c')).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest0500
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0500
     * @tc.desc   Verify ConcurrentSet clear() on already empty set size remains 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest0600
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0600
     * @tc.desc   Verify ConcurrentSet clear() with 100 elements size becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetClearTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest0700
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0700
     * @tc.desc   Verify ConcurrentSet clear() removes elements and has() returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest0800
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0800
     * @tc.desc   Verify ConcurrentSet clear() single thread size is 0 after clearing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest0900
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_0900
     * @tc.desc   Verify ConcurrentSet clear() single thread clearing does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1000
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1000
     * @tc.desc   Verify ConcurrentSet clear() with string type single thread size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1100
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1100
     * @tc.desc   Verify ConcurrentSet clear() on empty set single thread size remains 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1200
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1200
     * @tc.desc   Verify ConcurrentSet clear() with 100 elements single thread size becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetClearTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1300
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1300
     * @tc.desc   Verify ConcurrentSet clear() then add new element size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      set.add(4)
      expect(set.size).assertEqual(1)
      expect(set.has(4)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1400
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1400
     * @tc.desc   Verify ConcurrentSet clear() then add different elements old elements not present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.clear()
      set.add(3)
      set.add(4)
      expect(set.size).assertEqual(2)
      expect(set.has(3)).assertTrue()
      expect(set.has(4)).assertTrue()
      expect(set.has(1)).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1500
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1500
     * @tc.desc   Verify ConcurrentSet clear() called multiple times size remains 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetClearTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.clear()
      set.clear()
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1600
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1600
     * @tc.desc   Verify ConcurrentSet clear() with 10 concurrent threads size becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetClearTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(clearTask(set))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1700
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1700
     * @tc.desc   Verify ConcurrentSet clear() with 3 concurrent threads size becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetClearTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      await Promise.all([
        clearTask(set),
        clearTask(set),
        clearTask(set)
      ])
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1800
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1800
     * @tc.desc   Verify ConcurrentSet clear() with 5 concurrent string type threads size becomes 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetClearTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.add('d')
      set.add('e')
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(clearTaskStr(set))
      }
      await Promise.all(promises)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest1900
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_1900
     * @tc.desc   Verify ConcurrentSet clear() inside TaskPool task with elements size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetClearTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskClearSize()
      expect(result).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest2000
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_2000
     * @tc.desc   Verify ConcurrentSet clear() inside TaskPool task on empty set size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetClearTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskClearEmpty()
      expect(result).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetClearTest2100
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_2100
     * @tc.desc   Verify ConcurrentSet clear() inside onExecutionSucceeded callback clears set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetClearTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      await clearTaskInCallback(set)
      expect(set.size).assertEqual(0)
      Done()
    })
    
    /**
     * @tc.name   ConcurrentSetClearTest2200
     * @tc.number SUB_CONCURRENTSET_CLEAR_TEST_2200
     * @tc.desc   Verify ConcurrentSet clear() inside onReceiveData callback clears set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('ConcurrentSetClearTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      set.add(1)
      set.add(2)
      set.add(3)
      await clearTaskInCallback(set)
      expect(set.size).assertEqual(0)
      Done()
    })
  })
}
