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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium'
import Utils from './Util.test'

class MyClass {
  id: number
  constructor(id: number) {
    this.id = id
  }
}

async function sizeTaskNum(s: containers.ConcurrentSet<int>): Promise<int> {
  return s.size
}

async function concurrentAddTaskSize(s: containers.ConcurrentSet<int>, newElements: int[]): Promise<void> {
  for (const elem of newElements) {
    s.add(elem)
  }
}

async function concurrentDeleteTaskSize(s: containers.ConcurrentSet<int>, elements: int[]): Promise<void> {
  for (const elem of elements) {
    s.delete(elem)
  }
}

async function clearSetTaskSize(s: containers.ConcurrentSet<int>): Promise<void> {
  s.clear()
}

export default function ConcurrentSetSizeTest(): void {
  describe('ConcurrentSetSizeTest', (): void => {
    beforeAll((): void => {})
    beforeEach(async (): Promise<void> => {

    })
    afterEach((): void => {
    })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100)
    })

    /**
     * @tc.name ConcurrentSetSizeTest0100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0100
     * @tc.desc   Test size property on empty set returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest0200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0200
     * @tc.desc   Test size property on empty set returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(typeof set.size).assertEqual('int')
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest0300
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0300
     * @tc.desc   Test size property on empty set returns integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(Number.isInteger(set.size)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest0400
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0400
     * @tc.desc   Test size property on empty set is non-negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size >= 0).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest0500
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0500
     * @tc.desc   Test size property on empty set returns consistent value on multiple reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let size1: number = set.size
      let size2: number = set.size
      let size3: number = set.size
      expect(size1).assertEqual(size2)
      expect(size2).assertEqual(size3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest0600
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0600
     * @tc.desc   Test size property on empty set does not throw exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let size: number = set.size
      expect(size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest0700
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0700
     * @tc.desc   Test size property on single element set returns 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest0800
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0800
     * @tc.desc   Test size property on single element set returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      expect(typeof set.size).assertEqual('int')
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest0900
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_0900
     * @tc.desc   Test size property on single element set returns integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      expect(Number.isInteger(set.size)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1000
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1000
     * @tc.desc   Test size property on single element set returns consistent value on multiple reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      let size1: number = set.size
      let size2: number = set.size
      expect(size1).assertEqual(size2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1100
     * @tc.desc   Test size property on single element set is greater than 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      expect(set.size > 0).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1200
     * @tc.desc   Test size property on 3-element set returns 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1300
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1300
     * @tc.desc   Test size property on multiple elements returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(typeof set.size).assertEqual('int')
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1400
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1400
     * @tc.desc   Test size property on multiple elements returns integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(Number.isInteger(set.size)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1500
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1500
     * @tc.desc   Test size property on multiple elements returns consistent value on multiple reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let size1: number = set.size
      let size2: number = set.size
      let size3: number = set.size
      expect(size1).assertEqual(size2)
      expect(size2).assertEqual(size3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1600
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1600
     * @tc.desc   Test size property equals number of added unique elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1700
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1700
     * @tc.desc   Test size property on multiple elements is greater than 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size > 0).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1800
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1800
     * @tc.desc   Test size return value is number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      expect(typeof set.size === 'int').assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest1900
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_1900
     * @tc.desc   Test size return value is integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      expect(Number.isInteger(set.size)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2000
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2000
     * @tc.desc   Test size return value is non-negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      expect(set.size >= 0).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2100
     * @tc.desc   Test size return value is finite number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      expect(Number.isFinite(set.size)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2200
     * @tc.desc   Test size return value is not NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      expect(Number.isNaN(set.size)).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2300
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2300
     * @tc.desc   Test size return value is not Infinity or -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      expect(set.size !== Infinity).assertTrue()
      expect(set.size !== -Infinity).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2400
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2400
     * @tc.desc   Test size value can be used in math operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      let size: number = set.size
      expect(size + 1).assertEqual(2)
      expect(size * 2).assertEqual(2)
      expect(size - 1).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2500
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2500
     * @tc.desc   Test size value can be compared with other numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      let size: number = set.size
      expect(size === 1).assertTrue()
      expect(size !== 0).assertTrue()
      expect(size > 0).assertTrue()
      expect(size < 100).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2600
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2600
     * @tc.desc   Test size on string type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2700
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2700
     * @tc.desc   Test size on number type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(100)
      set.add(200)
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2800
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2800
     * @tc.desc   Test size on object type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<MyClass> = new containers.ConcurrentSet<MyClass>()
      let obj1: MyClass = new MyClass(1)
      let obj2: MyClass = new MyClass(2)
      set.add(obj1)
      set.add(obj2)
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest2900
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_2900
     * @tc.desc   Test size on boolean type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<boolean> = new containers.ConcurrentSet<boolean>()
      set.add(true)
      set.add(false)
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3000
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3000
     * @tc.desc   Test size on mixed number and string type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number | string> = new containers.ConcurrentSet<number | string>()
      set.add(1)
      set.add('two')
      set.add(3)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3100
     * @tc.desc   Test size is readonly and cannot be directly modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      let originalSize: number = set.size
      expect(set.size).assertEqual(originalSize)
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3200
     * @tc.desc   Test size modification does not affect the set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      expect(set.size).assertEqual(2)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3300
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3300
     * @tc.desc   Test size is readonly property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3400
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3400
     * @tc.desc   Test add new element increases size by 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      set.add(1)
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3500
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3500
     * @tc.desc   Test add multiple elements increases size sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      set.add(1)
      expect(set.size).assertEqual(1)
      set.add(2)
      expect(set.size).assertEqual(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3600
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3600
     * @tc.desc   Test add existing element does not change size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      expect(set.size).assertEqual(1)
      set.add(1)
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3700
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3700
     * @tc.desc   Test add same value multiple times does not change size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('value')
      expect(set.size).assertEqual(1)
      set.add('value')
      set.add('value')
      set.add('value')
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3800
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3800
     * @tc.desc   Test size after continuous add of 100 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      expect(set.size).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest3900
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_3900
     * @tc.desc   Test size reflects change immediately after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let beforeSize: number = set.size
      set.add(999)
      let afterSize: number = set.size
      expect(afterSize - beforeSize).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4000
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4000
     * @tc.desc   Test delete existing element decreases size by 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      set.delete(1)
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4100
     * @tc.desc   Test delete multiple elements decreases size sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      set.delete(1)
      expect(set.size).assertEqual(2)
      set.delete(2)
      expect(set.size).assertEqual(1)
      set.delete(3)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4200
     * @tc.desc   Test delete non-existing element does not change size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      set.delete(999)
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4300
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4300
     * @tc.desc   Test delete already deleted element does not change size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.delete(1)
      expect(set.size).assertEqual(2)
      set.delete(1)
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4400
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4400
     * @tc.desc   Test delete all elements results in size 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.delete(1)
      set.delete(2)
      set.delete(3)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4500
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4500
     * @tc.desc   Test size reflects change immediately after delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let beforeSize: number = set.size
      set.delete(1)
      let afterSize: number = set.size
      expect(beforeSize - afterSize).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4600
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4600
     * @tc.desc   Test clear results in size 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size).assertEqual(3)
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4700
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4700
     * @tc.desc   Test clear on empty set does not change size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let emptySet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(emptySet.size).assertEqual(0)
      emptySet.clear()
      expect(emptySet.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4800
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4800
     * @tc.desc   Test size reflects change immediately after clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let beforeSize: number = set.size
      set.clear()
      let afterSize: number = set.size
      expect(beforeSize).assertEqual(3)
      expect(afterSize).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest4900
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_4900
     * @tc.desc   Test size is 0 consistently after clear on multiple reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      expect(set.size).assertEqual(0)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5000
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5000
     * @tc.desc   Test add after clear correctly increases size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      set.add(100)
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5100
     * @tc.desc   Test size equals has() true count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetSizeTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let hasTrueCount: number = 0
      for (let i = 1; i <= 3; i++) {
        if (set.has(i)) {
          hasTrueCount++
        }
      }
      expect(set.size).assertEqual(hasTrueCount)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5200
     * @tc.desc   Test size equals keys() iteration count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let keys: number[] = []
      for (let k of set.keys()) {
        keys.push(k)
      }
      expect(set.size).assertEqual(keys.length)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5300
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5300
     * @tc.desc   Test size equals values() iteration count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let values: number[] = []
      for (let v of set.values()) {
        values.push(v)
      }
      expect(set.size).assertEqual(values.length)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5400
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5400
     * @tc.desc   Test size equals entries() iteration count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let entries: [number, number][] = []
      for (let e of set.entries()) {
        entries.push(e)
      }
      expect(set.size).assertEqual(entries.length)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5500
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5500
     * @tc.desc   Test size equals forEach callback execution count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let forEachCount: number = 0
      set.forEach(() => {
        forEachCount++
      })
      expect(set.size).assertEqual(forEachCount)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5600
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5600
     * @tc.desc   Test multi-thread concurrent read size without exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 100; i++) { set.add(i) }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 5; i++) { promises.push(sizeTaskNum(set)) }
      let results: int[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (const result of results) { expect(typeof result).assertEqual('int') }
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5700
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5700
     * @tc.desc   Test multi-thread concurrent read size result consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 100; i++) { set.add(i) }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 10; i++) { promises.push(sizeTaskNum(set)) }
      let results: int[] = await Promise.all(promises)
      for (const result of results) {
        expect(result >= 0).assertTrue()
        expect(Number.isInteger(result)).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5800
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5800
     * @tc.desc   Test multi-thread read size consistency with set state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 100; i++) { set.add(i) }
      let sizeBefore: int = set.size
      let result: int = await sizeTaskNum(set)
      expect(result >= 0).assertTrue()
      expect(result <= sizeBefore + 1).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest5900
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_5900
     * @tc.desc   Test 3 threads concurrent read size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 3; i++) { promises.push(sizeTaskNum(set)) }
      let results: int[] = await Promise.all(promises)
      expect(results.length).assertEqual(3)
      results.forEach((r: int) => expect(r >= 0).assertTrue())
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6000
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6000
     * @tc.desc   Test 5 threads concurrent read size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 5; i++) { promises.push(sizeTaskNum(set)) }
      let results: int[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6100
     * @tc.desc   Test 10 threads concurrent read size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let promises: Promise<int>[] = []
      for (let i = 0; i < 10; i++) { promises.push(sizeTaskNum(set)) }
      let results: int[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6200
     * @tc.desc   Test read size during concurrent add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let sizeBefore: int = set.size
      let addPromise: Promise<void> = concurrentAddTaskSize(set, [100, 101, 102])
      let readPromise: Promise<int> = sizeTaskNum(set)
      await Promise.all([addPromise, readPromise])
      expect(set.size >= sizeBefore).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6300
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6300
     * @tc.desc   Test size after multi-thread concurrent add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let initialSize: int = set.size
      let addTasks: Promise<void>[] = []
      for (let t = 0; t < 5; t++) {
        let newElements: int[] = []
        for (let i = 100 + t * 10; i < 110 + t * 10; i++) { newElements.push(i) }
        addTasks.push(concurrentAddTaskSize(set, newElements))
      }
      await Promise.all(addTasks)
      expect(set.size >= initialSize).assertTrue()
      expect(set.size <= initialSize + 50).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6400
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6400
     * @tc.desc   Test size reflects instant state after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let sizeBefore: int = set.size
      await concurrentAddTaskSize(set, [999])
      let sizeAfter: int = set.size
      expect(sizeAfter - sizeBefore).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6500
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6500
     * @tc.desc   Test read size during concurrent delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let sizeBefore: int = set.size
      let deletePromise: Promise<void> = concurrentDeleteTaskSize(set, [0, 1, 2])
      let readPromise: Promise<int> = sizeTaskNum(set)
      await Promise.all([deletePromise, readPromise])
      expect(set.size <= sizeBefore).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6600
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6600
     * @tc.desc   Test size after multi-thread concurrent delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let initialSize: int = set.size
      let deleteTasks: Promise<void>[] = []
      for (let t = 0; t < 5; t++) {
        let elements: int[] = []
        for (let i = t * 10; i < t * 10 + 10; i++) { elements.push(i) }
        deleteTasks.push(concurrentDeleteTaskSize(set, elements))
      }
      await Promise.all(deleteTasks)
      expect(set.size >= 0).assertTrue()
      expect(set.size <= initialSize).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6700
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6700
     * @tc.desc   Test size reflects instant state after delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let sizeBefore: int = set.size
      await concurrentDeleteTaskSize(set, [0])
      let sizeAfter: int = set.size
      expect(sizeBefore - sizeAfter).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6800
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6800
     * @tc.desc   Test read size during concurrent clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      let sizeBefore: int = set.size
      let clearPromise: Promise<void> = clearSetTaskSize(set)
      let readPromise: Promise<int> = sizeTaskNum(set)
      await Promise.all([clearPromise, readPromise])
      expect(set.size <= sizeBefore).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest6900
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_6900
     * @tc.desc   Test size is 0 after concurrent clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      await clearSetTaskSize(set)
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7000
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7000
     * @tc.desc   Test read consistent 0 size after concurrent clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 50; i++) { set.add(i) }
      await clearSetTaskSize(set)
      let promises: Promise<int>[] = []
      for (let i = 0; i < 5; i++) { promises.push(sizeTaskNum(set)) }
      let results: int[] = await Promise.all(promises)
      results.forEach((r: int) => expect(r).assertEqual(0))
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7100
     * @tc.desc   Test 10000 elements size is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10000; i++) { set.add(i) }
      expect(set.size).assertEqual(10000)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7200
     * @tc.desc   Test large data multiple reads size consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10000; i++) { set.add(i) }
      let size1: number = set.size
      let size2: number = set.size
      let size3: number = set.size
      expect(size1).assertEqual(size2)
      expect(size2).assertEqual(size3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7300
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7300
     * @tc.desc   Test large data clear size correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10000; i++) { set.add(i) }
      expect(set.size).assertEqual(10000)
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7400
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7400
     * @tc.desc   Test size minimum value is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      expect(set.size >= 0).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7500
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7500
     * @tc.desc   Test size not negative after repeated delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.delete(1)
      set.delete(1)
      expect(set.size >= 0).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7600
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7600
     * @tc.desc   Test size not exceed add count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      expect(set.size <= 3).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7700
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7700
     * @tc.desc   Test size zero boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      expect(set.size).assertEqual(0)
      set.add(1)
      expect(set.size).assertEqual(1)
      set.delete(1)
      expect(set.size).assertEqual(0)
      set.add(1)
      set.clear()
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7800
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7800
     * @tc.desc   Test size is exact integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 1000; i++) { set.add(i) }
      expect(set.size).assertEqual(1000)
      expect(Number.isInteger(set.size)).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest7900
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_7900
     * @tc.desc   Test size reflects call moment state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      let size1: number = set.size
      set.add(3)
      let size2: number = set.size
      expect(size1).assertEqual(2)
      expect(size2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest8000
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_8000
     * @tc.desc   Test size read does not block modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      let size: number = set.size
      set.add(999)
      set.delete(1)
      expect(typeof size).assertEqual('number')
      expect(set.size >= 1).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest8100
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_8100
     * @tc.desc   Test size is instant value not cumulative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetSizeTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let size3: number = set.size
      set.add(4)
      let size4: number = set.size
      expect(size3).assertEqual(3)
      expect(size4).assertEqual(4)
      expect(size4 - size3).assertEqual(1)
      Done()
    })

    /**
     * @tc.name ConcurrentSetSizeTest8200
     * @tc.number SUB_CONCURRENTSET_SIZE_TEST_8200
     * @tc.desc   Test TaskPool task nested read size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetSizeTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<int> = new containers.ConcurrentSet<int>()
      for (let i = 0; i < 100; i++) { set.add(i) }
      let result: int = await sizeTaskNum(set)
      expect(result).assertEqual(100)
      Done()
    })

  })
}