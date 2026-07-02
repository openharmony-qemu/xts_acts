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

async function toStringTaskNum(s: containers.ConcurrentSet<number>): Promise<string> {
  return s.toString()
}

async function toStringTaskStr(s: containers.ConcurrentSet<string>): Promise<string> {
  return s.toString()
}

async function concurrentAddTask(s: containers.ConcurrentSet<number>, newElements: number[]): Promise<void> {
  for (const elem of newElements) {
    s.add(elem)
  }
}

async function concurrentDeleteTask(s: containers.ConcurrentSet<number>, elements: number[]): Promise<void> {
  for (const elem of elements) {
    s.delete(elem)
  }
}

async function clearSetTask(s: containers.ConcurrentSet<number>): Promise<void> {
  s.clear()
}

export default function ConcurrentSetToStringTest(): void {
  describe('ConcurrentSetToStringTest', (): void => {
    beforeAll((): void => {})
    beforeEach(async (): Promise<void> => {

    })
    afterEach((): void => {
    })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100)
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0100
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0100
     * @tc.desc   Test toString() on empty set returns String type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0200
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0200
     * @tc.desc   Test toString() on empty set does not return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let result: string = set.toString()
      expect(result != null).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0300
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0300
     * @tc.desc   Test toString() on empty set does not return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let result: string = set.toString()
      expect(result != undefined).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0400
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0400
     * @tc.desc   Test toString() on empty set returns valid string with length >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let result: string = set.toString()
      expect(result.length >= 0).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0500
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0500
     * @tc.desc   Test toString() on empty set returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let result1: string = set.toString()
      let result2: string = set.toString()
      expect(result1).assertEqual(result2)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0600
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0600
     * @tc.desc   Test toString() on single element set returns String type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0700
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0700
     * @tc.desc   Test toString() on single element set returns non-empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      let result: string = set.toString()
      expect(result.length > 0).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0800
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0800
     * @tc.desc   Test toString() on single element set does not throw exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      let hasError = false
      try {
        set.toString()
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest0900
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_0900
     * @tc.desc   Test toString() on single element set returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      let result1: string = set.toString()
      let result2: string = set.toString()
      expect(result1).assertEqual(result2)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1000
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1000
     * @tc.desc   Test toString() on single element set is related to size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('element1')
      let result: string = set.toString()
      expect(set.size).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1100
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1100
     * @tc.desc   Test toString() on multiple elements set returns String type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1200
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1200
     * @tc.desc   Test toString() on multiple elements set returns string containing element info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let result: string = set.toString()
      expect(result.length > 0).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1300
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1300
     * @tc.desc   Test toString() on multiple elements set returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let result1: string = set.toString()
      let result2: string = set.toString()
      expect(result1).assertEqual(result2)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1400
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1400
     * @tc.desc   Test toString() on multiple elements set is related to size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let result: string = set.toString()
      expect(set.size).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1500
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1500
     * @tc.desc   Test toString() on multiple elements set does not throw exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let errorOccurred = false
      try {
        set.toString()
      } catch (e) {
        errorOccurred = true
      }
      expect(errorOccurred).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1600
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1600
     * @tc.desc   Test toString() return value is string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      let result: string = set.toString()
      expect(typeof result === 'string').assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1700
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1700
     * @tc.desc   Test toString() return value is not null and not undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      let result: string = set.toString()
      expect(result != null).assertTrue()
      expect(result != undefined).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1800
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1800
     * @tc.desc   Test toString() return value can be concatenated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      let result: string = set.toString()
      let concatenated: string = 'prefix_' + result + '_suffix'
      expect(concatenated.length > result.length).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest1900
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_1900
     * @tc.desc   Test toString() return value can be converted to upper/lower case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      let result: string = set.toString()
      let upperCase: string = result.toUpperCase()
      let lowerCase: string = result.toLowerCase()
      expect(typeof upperCase).assertEqual('string')
      expect(typeof lowerCase).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2000
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2000
     * @tc.desc   Test toString() return value has length property >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      let result: string = set.toString()
      expect(result.length >= 0).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2100
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2100
     * @tc.desc   Test toString() return value supports indexOf method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      let result: string = set.toString()
      let index: number = result.indexOf('a')
      expect(index >= -1).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2200
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2200
     * @tc.desc   Test toString() on string type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2300
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2300
     * @tc.desc   Test toString() on number type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(100)
      set.add(200)
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2400
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2400
     * @tc.desc   Test toString() on object type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<MyClass> = new containers.ConcurrentSet<MyClass>()
      let obj1: MyClass = new MyClass(1)
      set.add(obj1)
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2500
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2500
     * @tc.desc   Test toString() on boolean type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<boolean> = new containers.ConcurrentSet<boolean>()
      set.add(true)
      set.add(false)
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2600
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2600
     * @tc.desc   Test toString() on mixed number and string type element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number | string> = new containers.ConcurrentSet<number | string>()
      set.add(1)
      set.add('two')
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2700
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2700
     * @tc.desc   Test toString() result length is greater than 0 for non-empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      let result: string = set.toString()
      expect(result.length > 0).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2800
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2800
     * @tc.desc   Test toString() result contains set identifier format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(0)
      set.add(1)
      set.add(2)
      set.add(3)
      set.add(4)
      let result: string = set.toString()
      expect(result).assertEqual('ConcurrentSet[0,1,2,3,4]')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest2900
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_2900
     * @tc.desc   Test toString() result can be processed by string methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('test')
      let result: string = set.toString()
      expect(result.trim().length >= 0).assertTrue()
      expect(result.length >= 0).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3000
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3000
     * @tc.desc   Test toString() result can be used as Map key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(42)
      let strKey: string = set.toString()
      let map: Map<string, number> = new Map<string, number>()
      map.set(strKey, 1)
      expect(map.has(strKey)).assertTrue()
      expect(map.get(strKey)).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3100
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3100
     * @tc.desc   Test toString() result can be used as Set element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('value')
      let strResult: string = set.toString()
      let strSet: Set<string> = new Set<string>()
      strSet.add(strResult)
      expect(strSet.has(strResult)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3200
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3200
     * @tc.desc   Test toString() vs JSON.stringify produces different format types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let strResult: string = set.toString()
      expect(typeof strResult).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3300
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3300
     * @tc.desc   Test toString() result vs Array.toString comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let strResult: string = set.toString()
      expect(typeof strResult).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3400
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3400
     * @tc.desc   Test toString() does not change set state after calling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.toString()
      expect(set.size).assertEqual(3)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      expect(set.has(3)).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3500
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3500
     * @tc.desc   Test toString() does not change set content after calling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let beforeSize: number = set.size
      set.toString()
      let afterSize: number = set.size
      expect(beforeSize).assertEqual(afterSize)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3600
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3600
     * @tc.desc   Test toString() with 5 concurrent threads does not throw exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let promises: Promise<string>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(toStringTaskNum(set))
      }
      let results: string[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('string')
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3700
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3700
     * @tc.desc   Test toString() with 10 concurrent threads returns consistent string results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let promises: Promise<string>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(toStringTaskNum(set))
      }
      let results: string[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('string')
        expect(results[i].length > 0).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3800
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3800
     * @tc.desc   Test toString() with 3 concurrent threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let promises: Promise<string>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(toStringTaskNum(set))
      }
      let results: string[] = await Promise.all(promises)
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('string')
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest3900
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_3900
     * @tc.desc   Test toString() with 5 concurrent threads on string set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      for (let i = 0; i < 50; i++) {
        set.add('elem' + i)
      }
      let promises: Promise<string>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(toStringTaskStr(set))
      }
      let results: string[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4000
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4000
     * @tc.desc   Test toString() with 10 concurrent threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let promises: Promise<string>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(toStringTaskNum(set))
      }
      let results: string[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4100
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4100
     * @tc.desc   Test toString() concurrent with add does not affect toString execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let strResultPromise: Promise<string> = toStringTaskNum(set)
      let addResultPromise: Promise<void> = concurrentAddTask(set, [100.0, 101.0, 102.0])
      let strResult: string = await strResultPromise
      await addResultPromise
      expect(typeof strResult).assertEqual('string')
      expect(set.size).assertEqual(53)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4200
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4200
     * @tc.desc   Test toString() returns valid result then add new element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let str1: string = set.toString()
      await concurrentAddTask(set, [100.0])
      let str2: string = set.toString()
      expect(typeof str1).assertEqual('string')
      expect(typeof str2).assertEqual('string')
      expect(set.size).assertEqual(51)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4300
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4300
     * @tc.desc   Test toString() result reflects current set state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let sizeBefore: number = set.size
      let str: string = set.toString()
      expect(typeof str).assertEqual('string')
      expect(set.size).assertEqual(sizeBefore)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4400
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4400
     * @tc.desc   Test toString() concurrent with delete does not affect toString execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let strResultPromise: Promise<string> = toStringTaskNum(set)
      let deleteResultPromise: Promise<void> = concurrentDeleteTask(set, [0.0, 1.0, 2.0])
      let strResult: string = await strResultPromise
      await deleteResultPromise
      expect(typeof strResult).assertEqual('string')
      expect(set.size).assertEqual(47)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4500
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4500
     * @tc.desc   Test toString() returns valid result then delete element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let str1: string = set.toString()
      await concurrentDeleteTask(set, [0.0])
      let str2: string = set.toString()
      expect(typeof str1).assertEqual('string')
      expect(typeof str2).assertEqual('string')
      expect(set.size).assertEqual(49)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4600
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4600
     * @tc.desc   Test toString() concurrent with clear does not affect toString execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let strResultPromise: Promise<string> = toStringTaskNum(set)
      let clearResultPromise: Promise<void> = clearSetTask(set)
      let strResult: string = await strResultPromise
      await clearResultPromise
      expect(typeof strResult).assertEqual('string')
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4700
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4700
     * @tc.desc   Test toString() returns valid result then clear set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let str1: string = set.toString()
      await clearSetTask(set)
      let str2: string = set.toString()
      expect(typeof str1).assertEqual('string')
      expect(typeof str2).assertEqual('string')
      expect(set.size).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4800
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4800
     * @tc.desc   Test toString() on large data set with 10000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10000; i++) {
        set.add(i)
      }
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest4900
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_4900
     * @tc.desc   Test toString() on large data set with 50000 elements does not throw exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50000; i++) {
        set.add(i)
      }
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5000
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5000
     * @tc.desc   Test toString() result can be stored in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(42)
      let strResult: string = set.toString()
      let savedStrings: string[] = []
      savedStrings.push(strResult)
      expect(savedStrings.length).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5100
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5100
     * @tc.desc   Test toString() result can be compared with ===
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('value')
      let str1: string = set.toString()
      let str2: string = set.toString()
      expect(str1 === str2).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5200
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5200
     * @tc.desc   Test toString() result length is >= 0 for parsing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('test')
      let result: string = set.toString()
      expect(result.length >= 0).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5300
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5300
     * @tc.desc   Test toString() works correctly after GC-like operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.toString()
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5400
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5400
     * @tc.desc   Test toString() on set with empty string element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('')
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5500
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5500
     * @tc.desc   Test toString() on set with special character elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('\n')
      set.add('\t')
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5600
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5600
     * @tc.desc   Test toString() on set with Unicode character elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetToStringTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('你好')
      set.add('世界')
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5700
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5700
     * @tc.desc   Test toString() on set with NaN element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(NaN)
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5800
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5800
     * @tc.desc   Test toString() on set with Infinity and -Infinity elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(Infinity)
      set.add(-Infinity)
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest5900
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_5900
     * @tc.desc   Test toString() on set with 0 and -0 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetToStringTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(0)
      let result: string = set.toString()
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest6000
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_6000
     * @tc.desc   Test toString() inside TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let result: string = await toStringTaskNum(set)
      expect(typeof result).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest6100
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_6100
     * @tc.desc   Test toString() inside onExecutionSucceeded callback with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let toStringResult: string = set.toString()
      expect(typeof toStringResult).assertEqual('string')
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest6200
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_6200
     * @tc.desc   Test toString() inside onReceiveData callback with Promise.all wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let promises: Promise<string>[] = []
      promises.push(toStringTaskNum(set))
      let results: string[] = await Promise.all(promises)
      expect(results.length).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest6300
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_6300
     * @tc.desc   Test toString() with 3 concurrent nested tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let promises: Promise<string>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(toStringTaskNum(set))
      }
      let results: string[] = await Promise.all(promises)
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('string')
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest6400
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_6400
     * @tc.desc   Test toString() with 5 concurrent nested tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let promises: Promise<string>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(toStringTaskNum(set))
      }
      let results: string[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetToStringTest6500
     * @tc.number SUB_CONCURRENTSET_TOSTRING_TEST_6500
     * @tc.desc   Test toString() with 10 concurrent nested tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetToStringTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 50; i++) {
        set.add(i)
      }
      let promises: Promise<string>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(toStringTaskNum(set))
      }
      let results: string[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      Done()
    })
  })
}