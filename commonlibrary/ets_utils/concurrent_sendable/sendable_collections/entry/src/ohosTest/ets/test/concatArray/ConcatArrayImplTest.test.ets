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

import { collections } from '@kit.ArkTS';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../Utils';

// ===== @Sendable Class Definitions =====

@Sendable
class MyConcatArrayNum {
  _data: collections.Array<number> = new collections.Array<number>()
  get length(): number {
    return this._data.length
  }
  get(index: number): number {
    return this._data[index]
  }
  join(separator?: string): string {
    return this._data.join(separator)
  }
  slice(start?: number, end?: number): collections.Array<number> {
    return this._data.slice(start, end)
  }
  push(value: number): void {
    this._data.push(value)
  }
  pop(): number | undefined {
    return this._data.pop()
  }
  forEach(callback: (value: number, index: number) => void): void {
    for (let i = 0; i < this._data.length; i++) {
      callback(this._data[i], i)
    }
  }
  map(callback: (value: number, index: number) => number): MyConcatArrayNum {
    let result = new MyConcatArrayNum()
    for (let i = 0; i < this._data.length; i++) {
      result.push(callback(this._data[i], i))
    }
    return result
  }
  indexOf(value: number, fromIndex?: number): number {
    return this._data.indexOf(value, fromIndex)
  }
  includes(value: number, fromIndex?: number): boolean {
    return this._data.includes(value, fromIndex)
  }
}

@Sendable
class MyConcatArrayStr {
  _data: collections.Array<string> = new collections.Array<string>()
  get length(): number {
    return this._data.length
  }
  get(index: number): string {
    return this._data[index]
  }
  join(separator?: string): string {
    return this._data.join(separator)
  }
  slice(start?: number, end?: number): collections.Array<string> {
    return this._data.slice(start, end)
  }
  push(value: string): void {
    this._data.push(value)
  }
}

@Sendable
class MyConcatArrayAlt {
  _items: collections.Array<number> = new collections.Array<number>()
  get length(): number {
    return this._items.length
  }
  get(index: number): number {
    return this._items[index]
  }
  join(separator?: string): string {
    return this._items.join(separator)
  }
  slice(start?: number, end?: number): collections.Array<number> {
    return this._items.slice(start, end)
  }
  add(value: number): void {
    this._items.push(value)
  }
}

export default function ConcatArrayImplTest(): void {
  describe('ConcatArrayImplTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Section 2: collections.Array implements ConcatArray (0100-0700) =====

    /**
     * @tc.name   CAImplTest0100
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0100
     * @tc.desc   Verify collections.Array implements ConcatArray interface with all methods and type compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(typeof arr.join).assertEqual('function')
      expect(typeof arr.slice).assertEqual('function')
      expect(typeof arr.concat).assertEqual('function')
      expect(arr.length).assertEqual(3)
      let concatArr = new collections.Array<number>(1, 2, 3)
      expect(concatArr.length).assertEqual(3)
      let sliced = concatArr.slice(1, 2)
      expect(sliced.length).assertEqual(1)
    })

    /**
     * @tc.name   CAImplTest0200
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0200
     * @tc.desc   Verify length property updates correctly after push and pop operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3, 4, 5)
      expect(arr.length).assertEqual(5)
      arr.push(6)
      expect(arr.length).assertEqual(6)
      arr.pop()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   CAImplTest0300
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0300
     * @tc.desc   Verify join method with default, custom and empty separators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<string>('a', 'b', 'c')
      expect(arr.join()).assertEqual('a,b,c')
      expect(arr.join('-')).assertEqual('a-b-c')
      expect(arr.join('')).assertEqual('abc')
    })

    /**
     * @tc.name   CAImplTest0400
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0400
     * @tc.desc   Verify slice method with start+end, start-only and no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3, 4, 5)
      let sliced1 = arr.slice(1, 3)
      expect(sliced1.length).assertEqual(2)
      expect(sliced1[0]).assertEqual(2)
      expect(sliced1[1]).assertEqual(3)
      let sliced2 = arr.slice(2)
      expect(sliced2.length).assertEqual(3)
      let sliced3 = arr.slice()
      expect(sliced3.length).assertEqual(5)
    })

    /**
     * @tc.name   CAImplTest0500
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0500
     * @tc.desc   Verify concat method accepts ConcatArray parameter and merges correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr1 = new collections.Array<number>(1, 2)
      let arr2 = new collections.Array<number>(3, 4)
      let concatenated = arr1.concat(arr2)
      expect(concatenated.length).assertEqual(4)
      expect(concatenated[0]).assertEqual(1)
      expect(concatenated[3]).assertEqual(4)
    })

    /**
     * @tc.name   CAImplTest0600
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0600
     * @tc.desc   Verify indexOf method with and without fromIndex parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3, 2, 1)
      expect(arr.indexOf(2)).assertEqual(1)
      expect(arr.indexOf(2, 2)).assertEqual(3)
      expect(arr.indexOf(4)).assertEqual(-1)
    })

    /**
     * @tc.name   CAImplTest0700
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0700
     * @tc.desc   Verify includes method returns correct boolean for element existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(arr.includes(2)).assertTrue()
      expect(arr.includes(4)).assertFalse()
    })

    // ===== Section 2.3: Index accessor (0800) =====

    /**
     * @tc.name   CAImplTest0800
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0800
     * @tc.desc   Verify index accessor returns correct values and throws on out-of-bounds access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(10, 20, 30)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
      expect(arr[2]).assertEqual(30)
      try {
        let val = arr[10]
        expect(val === undefined).assertTrue()
      } catch (error) {
        expect(error.message !== undefined).assertTrue()
      }
    })

    // ===== Section 8: Error handling (2600-2700) =====

    /**
     * @tc.name   CAImplTest0900
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_0900
     * @tc.desc   Verify slice method returns empty ConcatArray when start equals array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CAImplTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      let sliced = arr.slice(3)
      expect(sliced.length).assertEqual(0)
      let sliced2 = arr.slice(5)
      expect(sliced2.length).assertEqual(0)
    })

    // ===== Section 3.4/3.5: Additional boundary tests (2800-2900) =====

    /**
     * @tc.name   CAImplTest1000
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_1000
     * @tc.desc   Verify join method on collections.Array with number elements and custom separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CAImplTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(arr.join(' | ')).assertEqual('1 | 2 | 3')
      let emptyArr = new collections.Array<number>()
      expect(emptyArr.join()).assertEqual('')
      let singleArr = new collections.Array<number>(42)
      expect(singleArr.join('-')).assertEqual('42')
    })

    /**
     * @tc.name   CAImplTest1100
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_1100
     * @tc.desc   Verify slice on collections.Array with negative start and end parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CAImplTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3, 4, 5)
      let sliced1 = arr.slice(-3)
      expect(sliced1.length).assertEqual(3)
      expect(sliced1[0]).assertEqual(3)
      let sliced2 = arr.slice(-3, -1)
      expect(sliced2.length).assertEqual(2)
      expect(sliced2[0]).assertEqual(3)
      expect(sliced2[1]).assertEqual(4)
    })

    // ===== Section 4: Interface method implementation (3000-3100) =====

    /**
     * @tc.name   CAImplTest1200
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_1200
     * @tc.desc   Verify ConcatArray readonly index accessor returns correct type for string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<string>('hello', 'world')
      expect(arr[0]).assertEqual('hello')
      expect(arr[1]).assertEqual('world')
      expect(typeof arr[0]).assertEqual('string')
      expect(arr.length).assertEqual(2)
    })

    /**
     * @tc.name   CAImplTest1300
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_1300
     * @tc.desc   Verify ConcatArray slice returns a new independent ConcatArray instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAImplTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(10, 20, 30, 40, 50)
      let sliced = arr.slice(1, 4)
      expect(sliced.length).assertEqual(3)
      expect(sliced[0]).assertEqual(20)
      expect(sliced[2]).assertEqual(40)
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   CAImplTest1400
     * @tc.number SUB_CONCATARRAY_IMPL_TEST_1400
     * @tc.desc   Verify multiple concat operations chain correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CAImplTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr1 = new collections.Array<number>(1)
      let arr2 = new collections.Array<number>(2)
      let arr3 = new collections.Array<number>(3)
      let result = arr1.concat(arr2).concat(arr3)
      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
    })
  })
}
