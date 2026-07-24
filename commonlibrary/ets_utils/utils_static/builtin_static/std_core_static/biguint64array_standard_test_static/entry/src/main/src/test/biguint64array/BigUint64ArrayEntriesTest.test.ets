'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function biguint64arrayEntriesTest(): void {

  describe('BigUint64ArrayEntriesTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0100
     * @tc.name testBigUint64ArrayEntries001
     * @tc.desc Verify entries() called with zero arguments yields the first index-value pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
      expect(iterationResult.value![1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0200
     * @tc.name testBigUint64ArrayEntries002
     * @tc.desc Verify entries() as a zero-parameter method on empty array yields done true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let iterationResult = emptyArray.entries().next();
      expect(iterationResult.done).assertTrue();
      expect(iterationResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0300
     * @tc.name testBigUint64ArrayEntries003
     * @tc.desc Verify the iterator returned by entries() advances from first to second entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(1n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0400
     * @tc.name testBigUint64ArrayEntries004
     * @tc.desc Verify next() result done is false before iterator exhaustion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0500
     * @tc.name testBigUint64ArrayEntries005
     * @tc.desc Verify next().done is true for the first call on an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let iterationResult = emptyArray.entries().next();
      expect(iterationResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0600
     * @tc.name testBigUint64ArrayEntries006
     * @tc.desc Verify next().value of a non-empty array is an array/tuple of length 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      let iterationResult = sourceArray.entries().next();
      expect((iterationResult.value!).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0700
     * @tc.name testBigUint64ArrayEntries007
     * @tc.desc Verify the index position in next().value is a valid numeric int equal to 0 for the first entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0800
     * @tc.name testBigUint64ArrayEntries008
     * @tc.desc Verify the value position in next().value preserves BigInt 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_0900
     * @tc.name testBigUint64ArrayEntries009
     * @tc.desc Verify two calls to entries() return independent iterators that produce the same first entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let firstIterator = sourceArray.entries();
      let secondIterator = sourceArray.entries();
      let firstResult = firstIterator.next();
      let secondResult = secondIterator.next();
      expect(firstResult.value![0]).assertEqual(secondResult.value![0]);
      expect(firstResult.value![1]).assertEqual(secondResult.value![1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1000
     * @tc.name testBigUint64ArrayEntries010
     * @tc.desc Verify empty array entries() first call next().value is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let iterationResult = emptyArray.entries().next();
      expect(iterationResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1100
     * @tc.name testBigUint64ArrayEntries011
     * @tc.desc Verify empty array entries() second call to next().done remains true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let iterator = emptyArray.entries();
      iterator.next();
      let secondResult = iterator.next();
      expect(secondResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1200
     * @tc.name testBigUint64ArrayEntries012
     * @tc.desc Verify empty array entries() second call to next().value remains undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let iterator = emptyArray.entries();
      iterator.next();
      let secondResult = iterator.next();
      expect(secondResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1300
     * @tc.name testBigUint64ArrayEntries013
     * @tc.desc Verify for...of loop body does not execute when iterating entries() of an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let emptyArray = new BigUint64Array(0);
      let iterationCount = 0;
      for (let entryPair of emptyArray.entries()) {
        iterationCount++;
      }
      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1400
     * @tc.name testBigUint64ArrayEntries014
     * @tc.desc Verify single-element array [0n] value index is 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1500
     * @tc.name testBigUint64ArrayEntries015
     * @tc.desc Verify single-element array [0n] value element is 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1600
     * @tc.name testBigUint64ArrayEntries016
     * @tc.desc Verify single-element array [0n] second next().done is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n]);
      let iterator = sourceArray.entries();
      iterator.next();
      let secondResult = iterator.next();
      expect(secondResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1700
     * @tc.name testBigUint64ArrayEntries017
     * @tc.desc Verify single-element array [42n] yields value [0, 42n]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
      expect(iterationResult.value![1]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1800
     * @tc.name testBigUint64ArrayEntries018
     * @tc.desc Verify single-element array [1n] yields value 1n as the minimum positive bigint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_1900
     * @tc.name testBigUint64ArrayEntries019
     * @tc.desc Verify [1n, 2n] second next yields index 1 and value 2n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterator = sourceArray.entries();
      iterator.next();
      let secondResult = iterator.next();
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2000
     * @tc.name testBigUint64ArrayEntries020
     * @tc.desc Verify [1n, 2n] third next has done true after exhausting two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterator = sourceArray.entries();
      iterator.next();
      iterator.next();
      let thirdResult = iterator.next();
      expect(thirdResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2100
     * @tc.name testBigUint64ArrayEntries021
     * @tc.desc Verify [10n, 20n, 30n] second next yields [1, 20n]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterator = sourceArray.entries();
      iterator.next();
      let secondResult = iterator.next();
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2200
     * @tc.name testBigUint64ArrayEntries022
     * @tc.desc Verify [10n, 20n, 30n] third next yields [2, 30n]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterator = sourceArray.entries();
      iterator.next();
      iterator.next();
      let thirdResult = iterator.next();
      expect(thirdResult.value![0]).assertEqual(2);
      expect(thirdResult.value![1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2300
     * @tc.name testBigUint64ArrayEntries023
     * @tc.desc Verify [10n, 20n, 30n] fourth next has done true after three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterator = sourceArray.entries();
      iterator.next();
      iterator.next();
      iterator.next();
      let fourthResult = iterator.next();
      expect(fourthResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2400
     * @tc.name testBigUint64ArrayEntries024
     * @tc.desc Verify 5-element array entries last entry has index 4 equal to length minus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let iterator = sourceArray.entries();
      let lastResult = iterator.next();
      for (let i = 1; i < 5; i++) {
        lastResult = iterator.next();
      }
      expect(lastResult.value![0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2500
     * @tc.name testBigUint64ArrayEntries025
     * @tc.desc Verify entries() returns index sequence always starting from 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2600
     * @tc.name testBigUint64ArrayEntries026
     * @tc.desc Verify entries() returns indices that increment by 1 sequentially
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(secondResult.value![0] - firstResult.value![0]).assertEqual(1);
      expect(thirdResult.value![0] - secondResult.value![0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2700
     * @tc.name testBigUint64ArrayEntries027
     * @tc.desc Verify the last element index equals length minus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let arrayLength = sourceArray.length;
      let iterator = sourceArray.entries();
      let iterationResult = iterator.next();
      for (let i = 1; i < arrayLength; i++) {
        iterationResult = iterator.next();
      }
      expect(iterationResult.value![0]).assertEqual(arrayLength - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2800
     * @tc.name testBigUint64ArrayEntries028
     * @tc.desc Verify length-1 array entries yields a single index of 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(1);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_2900
     * @tc.name testBigUint64ArrayEntries029
     * @tc.desc Verify sub-view via ArrayBuffer with byteOffset still has entries() index starting from 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buffer);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      let subView = new BigUint64Array(buffer, 8);
      let iterationResult = subView.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
      expect(iterationResult.value![1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3000
     * @tc.name testBigUint64ArrayEntries030
     * @tc.desc Verify BigUint64Array.from constructed array entries() has index starting from 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.from([5n, 6n, 7n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
      expect(iterationResult.value![1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3100
     * @tc.name testBigUint64ArrayEntries031
     * @tc.desc Verify uint64 max value 18446744073709551615n is preserved as-is in entries() iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([18446744073709551615n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3200
     * @tc.name testBigUint64ArrayEntries032
     * @tc.desc Verify value 9223372036854775807n (2^63-1) is preserved as-is in entries() iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9223372036854775807n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3300
     * @tc.name testBigUint64ArrayEntries033
     * @tc.desc Verify -1n is modulo-truncated to MAX and entries() returns the max uint64 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([-1n]);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3400
     * @tc.name testBigUint64ArrayEntries034
     * @tc.desc Verify all-zeros array entries() yields 0n for every element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.value![1]).assertEqual(0n);
      expect(secondResult.value![1]).assertEqual(0n);
      expect(thirdResult.value![1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3500
     * @tc.name testBigUint64ArrayEntries035
     * @tc.desc Verify for...of loop over entries() iterates through all elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let iterationCount = 0;
      for (let entryPair of sourceArray.entries()) {
        iterationCount++;
      }
      expect(iterationCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3600
     * @tc.name testBigUint64ArrayEntries036
     * @tc.desc Verify for...of iteration count over entries() equals the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let iterationCount = 0;
      for (let entryPair of sourceArray.entries()) {
        iterationCount++;
      }
      expect(iterationCount).assertEqual(sourceArray.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3700
     * @tc.name testBigUint64ArrayEntries037
     * @tc.desc Verify for...of over entries() can obtain correct index and value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      let indexSum = 0;
      let valueSum = 0n;
      for (let entryPair of sourceArray.entries()) {
        indexSum = indexSum + (entryPair[0] as int);
        valueSum = valueSum + entryPair[1];
      }
      expect(indexSum).assertEqual(1);
      expect(valueSum).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3800
     * @tc.name testBigUint64ArrayEntries038
     * @tc.desc Verify break inside for...of over entries() can terminate iteration early
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let iterationCount = 0;
      for (let entryPair of sourceArray.entries()) {
        iterationCount++;
        if (entryPair[0] as int >= 2) {
          break;
        }
      }
      expect(iterationCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_3900
     * @tc.name testBigUint64ArrayEntries039
     * @tc.desc Verify continue inside for...of over entries() correctly skips the targeted entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let accumulatedSum = 0n;
      for (let entryPair of sourceArray.entries()) {
        if (entryPair[0] as int === 1) {
          continue;
        }
        accumulatedSum = accumulatedSum + entryPair[1];
      }
      expect(accumulatedSum).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4000
     * @tc.name testBigUint64ArrayEntries040
     * @tc.desc Verify after one iterator is fully consumed, another new iterator still starts from the beginning
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let firstIterator = sourceArray.entries();
      while (!firstIterator.next().done) {
      }
      let secondIterator = sourceArray.entries();
      let secondFirstResult = secondIterator.next();
      expect(secondFirstResult.value![0]).assertEqual(0);
      expect(secondFirstResult.value![1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4100
     * @tc.name testBigUint64ArrayEntries041
     * @tc.desc Verify one partially consumed iterator does not affect another independent iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstIterator = sourceArray.entries();
      firstIterator.next();
      let secondIterator = sourceArray.entries();
      let secondFirstResult = secondIterator.next();
      expect(secondFirstResult.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4200
     * @tc.name testBigUint64ArrayEntries042
     * @tc.desc Verify a partially consumed iterator used with for...of only iterates over remaining elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let iterator = sourceArray.entries();
      iterator.next();
      iterator.next();
      let remainingCount = 0;
      for (let entryPair of iterator) {
        remainingCount++;
      }
      expect(remainingCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4300
     * @tc.name testBigUint64ArrayEntries043
     * @tc.desc Verify after exhaustion, next().value is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      let iterator = sourceArray.entries();
      iterator.next();
      let exhaustedResult = iterator.next();
      expect(exhaustedResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4400
     * @tc.name testBigUint64ArrayEntries044
     * @tc.desc Verify after exhaustion, multiple subsequent next() calls keep done as true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      let iterator = sourceArray.entries();
      iterator.next();
      iterator.next();
      let thirdResult = iterator.next();
      expect(thirdResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4500
     * @tc.name testBigUint64ArrayEntries045
     * @tc.desc Verify after exhaustion, multiple subsequent next() calls keep value as undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      let iterator = sourceArray.entries();
      iterator.next();
      iterator.next();
      let thirdResult = iterator.next();
      expect(thirdResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4600
     * @tc.name testBigUint64ArrayEntries046
     * @tc.desc Verify new BigUint64Array(3) default-zero constructed array entries() yields [0,0n], [1,0n], [2,0n]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(0n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(0n);
      expect(thirdResult.value![0]).assertEqual(2);
      expect(thirdResult.value![1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4700
     * @tc.name testBigUint64ArrayEntries047
     * @tc.desc Verify BigUint64Array.of(5n, 6n, 7n) entries() returns correct key-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(5n, 6n, 7n);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.value![1]).assertEqual(5n);
      expect(secondResult.value![1]).assertEqual(6n);
      expect(thirdResult.value![1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4800
     * @tc.name testBigUint64ArrayEntries048
     * @tc.desc Verify BigUint64Array.from([1n, 2n]) entries() returns correct key-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.from([1n, 2n]);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(1n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_4900
     * @tc.name testBigUint64ArrayEntries049
     * @tc.desc Verify new BigUint64Array(buffer) constructed array entries() has index starting from 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(buffer);
      sourceArray[0] = 10n;
      sourceArray[1] = 20n;
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
      expect(iterationResult.value![1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5000
     * @tc.name testBigUint64ArrayEntries050
     * @tc.desc Verify after copyWithin modification, entries() reflects the modified element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      sourceArray.copyWithin(0, 2);
      let iterationResult = sourceArray.entries().next();
      expect(iterationResult.value![0]).assertEqual(0);
      expect(iterationResult.value![1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5100
     * @tc.name testBigUint64ArrayEntries051
     * @tc.desc Verify for...of can iterate directly over the iterator returned by entries()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let iterator = sourceArray.entries();
      let iterationCount = 0;
      for (let entryPair of iterator) {
        iterationCount++;
      }
      expect(iterationCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5200
     * @tc.name testBigUint64ArrayEntries052
     * @tc.desc Verify using the same iterator object with for...of twice results in the second iteration starting from exhausted position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let iterator = sourceArray.entries();
      let firstPassCount = 0;
      for (let entryPair of iterator) {
        firstPassCount++;
      }
      let secondPassCount = 0;
      for (let entryPair of iterator) {
        secondPassCount++;
      }
      expect(firstPassCount).assertEqual(3);
      expect(secondPassCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5300
     * @tc.name testBigUint64ArrayEntries053
     * @tc.desc Verify entries() on a byteOffset and length view yields zero-based indices for the view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let windowView = new BigUint64Array(sourceBuffer, 8, 3);
      let iterator = windowView.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(20n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(30n);
      expect(thirdResult.value![0]).assertEqual(2);
      expect(thirdResult.value![1]).assertEqual(40n);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5400
     * @tc.name testBigUint64ArrayEntries054
     * @tc.desc Verify entries() on a subarray view observes parent writes inside the shared window before iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subarrayView = parentArray.subarray(1, 4);
      let hexadecimalSourceValue: int = 0x2A;
      let replacementValue: bigint = BigInt(hexadecimalSourceValue);
      parentArray[2] = replacementValue;
      let iterator = subarrayView.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(20n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(42n);
      expect(thirdResult.value![0]).assertEqual(2);
      expect(thirdResult.value![1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5500
     * @tc.name testBigUint64ArrayEntries055
     * @tc.desc Verify entries() on a nested byteOffset subarray yields local indices and window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let viewLength: int = 4;
      let byteOffsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let beginIndex: int = 1;
      let endIndex: int = 4;
      let sourceView = byteOffsetView.subarray(beginIndex, endIndex);
      let iterator = sourceView.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(30n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(40n);
      expect(thirdResult.value![0]).assertEqual(2);
      expect(thirdResult.value![1]).assertEqual(50n);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5600
     * @tc.name testBigUint64ArrayEntries056
     * @tc.desc Verify entries() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let sliceCopy = sourceView.slice(0, 3);
      sourceView[1] = 777n;
      let iterator = sliceCopy.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(20n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(30n);
      expect(thirdResult.value![0]).assertEqual(2);
      expect(thirdResult.value![1]).assertEqual(40n);
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5700
     * @tc.name testBigUint64ArrayEntries057
     * @tc.desc Verify entries() on a zero-length byteOffset view is exhausted immediately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let iterationResult = sourceView.entries().next();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(iterationResult.done).assertTrue();
      expect(iterationResult.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5800
     * @tc.name testBigUint64ArrayEntries058
     * @tc.desc Verify entries() on a Set source reflects insertion order after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(sourceArray.length).assertEqual(3);
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(7n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(11n);
      expect(thirdResult.value![0]).assertEqual(2);
      expect(thirdResult.value![1]).assertEqual(15n);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_5900
     * @tc.name testBigUint64ArrayEntries059
     * @tc.desc Verify entries() on an advanced iterator source starts with local index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(sourceArray.length).assertEqual(3);
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(10n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(15n);
      expect(thirdResult.value![0]).assertEqual(2);
      expect(thirdResult.value![1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_6000
     * @tc.name testBigUint64ArrayEntries060
     * @tc.desc Verify entries() iterator observes source writes to unread elements after iterator creation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      sourceArray[1] = 22n;
      let secondResult = iterator.next();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(1n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_6100
     * @tc.name testBigUint64ArrayEntries061
     * @tc.desc Verify entries() yielded pair stays stable after the source element is modified
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 8n]);
      let iterator = sourceArray.entries();
      let firstResult = iterator.next();
      sourceArray[0] = 44n;
      let secondResult = iterator.next();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(4n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(8n);
      expect(sourceArray[0]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_6200
     * @tc.name testBigUint64ArrayEntries062
     * @tc.desc Verify exhausted entries() iterator remains exhausted after source array writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n]);
      let iterator = sourceArray.entries();
      iterator.next();
      let exhaustedResult = iterator.next();
      sourceArray[0] = 99n;
      let postWriteResult = iterator.next();
      expect(exhaustedResult.done).assertTrue();
      expect(exhaustedResult.value).assertUndefined();
      expect(postWriteResult.done).assertTrue();
      expect(postWriteResult.value).assertUndefined();
      expect(sourceArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_6300
     * @tc.name testBigUint64ArrayEntries063
     * @tc.desc Verify entries() on a byteOffset view observes shared window writes after iterator creation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let windowView = new BigUint64Array(sharedBuffer, 8, 2);
      let iterator = windowView.entries();
      fullView[1] = 200n;
      fullView[2] = 300n;
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      expect(windowView.byteOffset).assertEqual(8);
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual(200n);
      expect(secondResult.value![0]).assertEqual(1);
      expect(secondResult.value![1]).assertEqual(300n);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_6400
     * @tc.name testBigUint64ArrayEntries064
     * @tc.desc Verify two entries() iterators keep independent cursors during interleaved next calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstIterator = sourceArray.entries();
      let secondIterator = sourceArray.entries();
      let firstIteratorFirstResult = firstIterator.next();
      let secondIteratorFirstResult = secondIterator.next();
      let firstIteratorSecondResult = firstIterator.next();
      let firstIteratorThirdResult = firstIterator.next();
      let secondIteratorSecondResult = secondIterator.next();
      expect(firstIteratorFirstResult.value![0]).assertEqual(0);
      expect(firstIteratorFirstResult.value![1]).assertEqual(10n);
      expect(secondIteratorFirstResult.value![0]).assertEqual(0);
      expect(secondIteratorFirstResult.value![1]).assertEqual(10n);
      expect(firstIteratorSecondResult.value![0]).assertEqual(1);
      expect(firstIteratorSecondResult.value![1]).assertEqual(20n);
      expect(firstIteratorThirdResult.value![0]).assertEqual(2);
      expect(firstIteratorThirdResult.value![1]).assertEqual(30n);
      expect(secondIteratorSecondResult.value![0]).assertEqual(1);
      expect(secondIteratorSecondResult.value![1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_6500
     * @tc.name testBigUint64ArrayEntries065
     * @tc.desc Verify entries yields a binary integer converted to BigInt with index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry = BigUint64Array.of(BigInt(0b101010)).entries().next().value!;
      expect(firstEntry[0]).assertEqual(0);
      expect(firstEntry[1]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_6600
     * @tc.name testBigUint64ArrayEntries066
     * @tc.desc Verify entries yields an octal integer converted to BigInt with index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry = BigUint64Array.of(BigInt(0o52)).entries().next().value!;
      expect(firstEntry[0]).assertEqual(0);
      expect(firstEntry[1]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ENTRIES_6700
     * @tc.name testBigUint64ArrayEntries067
     * @tc.desc Verify entries yields a hexadecimal integer converted to BigInt with index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEntries067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstEntry = BigUint64Array.of(BigInt(0x2A)).entries().next().value!;
      expect(firstEntry[0]).assertEqual(0);
      expect(firstEntry[1]).assertEqual(42n);
    });

  });
}
