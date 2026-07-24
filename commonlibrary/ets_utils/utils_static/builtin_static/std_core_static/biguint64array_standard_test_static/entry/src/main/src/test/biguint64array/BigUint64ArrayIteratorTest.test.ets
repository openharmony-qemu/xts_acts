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

export default function biguint64arrayIteratorTest(): void {

  describe('BigUint64ArrayIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0100
     * @tc.name testBigUint64ArrayIterator001
     * @tc.desc Verify $_iterator() called with zero arguments yields the first BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterationResult = sourceArray.$_iterator().next();
      expect(iterationResult.done).assertFalse();
      expect(iterationResult.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0200
     * @tc.name testBigUint64ArrayIterator002
     * @tc.desc Verify repeated $_iterator() calls on the same array both start at the first value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let firstIterator = sourceArray.$_iterator();
      let secondIterator = sourceArray.$_iterator();
      expect(firstIterator.next().value).assertEqual(1n);
      expect(secondIterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0300
     * @tc.name testBigUint64ArrayIterator003
     * @tc.desc Verify next().done is false before iterator exhaustion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let iterationResult = sourceArray.$_iterator().next();
      expect(iterationResult.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0400
     * @tc.name testBigUint64ArrayIterator004
     * @tc.desc Verify next().value preserves the first BigInt element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let iterationResult = sourceArray.$_iterator().next();
      expect(iterationResult.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0500
     * @tc.name testBigUint64ArrayIterator005
     * @tc.desc Verify two iterators keep independent state after one iterator advances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let firstIterator = sourceArray.$_iterator();
      let secondIterator = sourceArray.$_iterator();
      firstIterator.next();
      expect(firstIterator.next().value).assertEqual(2n);
      expect(secondIterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0600
     * @tc.name testBigUint64ArrayIterator006
     * @tc.desc Verify empty array iterator is done on the first next() call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let iterationResult = emptyArray.$_iterator().next();
      expect(iterationResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0700
     * @tc.name testBigUint64ArrayIterator007
     * @tc.desc Verify empty array iterator first next().value is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let iterationResult = emptyArray.$_iterator().next();
      expect(iterationResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0800
     * @tc.name testBigUint64ArrayIterator008
     * @tc.desc Verify empty array iterator keeps done true across repeated next() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let iterator = emptyArray.$_iterator();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.done).assertTrue();
      expect(secondResult.done).assertTrue();
      expect(thirdResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_0900
     * @tc.name testBigUint64ArrayIterator009
     * @tc.desc Verify for-of over an empty BigUint64Array does not execute the loop body
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let loopCount: int = 0;
      for (let elementValue of emptyArray) {
        loopCount++;
        expect(elementValue).assertEqual(0n);
      }
      expect(loopCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1000
     * @tc.name testBigUint64ArrayIterator010
     * @tc.desc Verify single-element array first next().value is 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let iterationResult = sourceArray.$_iterator().next();
      expect(iterationResult.value).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1100
     * @tc.name testBigUint64ArrayIterator011
     * @tc.desc Verify single zero element is yielded as 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n]);
      let iterationResult = sourceArray.$_iterator().next();
      expect(iterationResult.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1200
     * @tc.name testBigUint64ArrayIterator012
     * @tc.desc Verify max uint64 element is yielded as 18446744073709551615n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value]);
      let iterationResult = sourceArray.$_iterator().next();
      expect(iterationResult.value).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1300
     * @tc.name testBigUint64ArrayIterator013
     * @tc.desc Verify $_iterator() reports done true on the second next() after consuming the only value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      let exhaustedResult = iterator.next();
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1400
     * @tc.name testBigUint64ArrayIterator014
     * @tc.desc Verify two-element array first next().value is 1n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterationResult = sourceArray.$_iterator().next();
      expect(iterationResult.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1500
     * @tc.name testBigUint64ArrayIterator015
     * @tc.desc Verify two-element array second next().done is false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      let secondResult = iterator.next();
      expect(secondResult.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1600
     * @tc.name testBigUint64ArrayIterator016
     * @tc.desc Verify two-element array second next().value is 2n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      let secondResult = iterator.next();
      expect(secondResult.value).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1700
     * @tc.name testBigUint64ArrayIterator017
     * @tc.desc Verify two-element array third next().done is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      iterator.next();
      let thirdResult = iterator.next();
      expect(thirdResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1800
     * @tc.name testBigUint64ArrayIterator018
     * @tc.desc Verify three-element array next() yields 10n 20n 30n in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(10n);
      expect(iterator.next().value).assertEqual(20n);
      expect(iterator.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_1900
     * @tc.name testBigUint64ArrayIterator019
     * @tc.desc Verify three-element array fourth next().done is true after all values are read
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      iterator.next();
      iterator.next();
      let exhaustedResult = iterator.next();
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2000
     * @tc.name testBigUint64ArrayIterator020
     * @tc.desc Verify five-element array next() yields each value in index order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(5n);
      expect(iterator.next().value).assertEqual(10n);
      expect(iterator.next().value).assertEqual(15n);
      expect(iterator.next().value).assertEqual(20n);
      expect(iterator.next().value).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2100
     * @tc.name testBigUint64ArrayIterator021
     * @tc.desc Verify default for-of iteration executes once per array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let loopCount: int = 0;
      for (let elementValue of sourceArray) {
        loopCount++;
        expect(elementValue).assertEqual(BigInt(loopCount));
      }
      expect(loopCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2200
     * @tc.name testBigUint64ArrayIterator022
     * @tc.desc Verify default for-of iteration yields values in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let expectedValues: bigint[] = [1n, 2n, 3n];
      let currentIndex: int = 0;
      for (let elementValue of sourceArray) {
        expect(elementValue).assertEqual(expectedValues[currentIndex]);
        currentIndex++;
      }
      expect(currentIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2300
     * @tc.name testBigUint64ArrayIterator023
     * @tc.desc Verify default for-of over a single-element array yields one value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([99n]);
      let loopCount: int = 0;
      let capturedValue: bigint = 0n;
      for (let elementValue of sourceArray) {
        loopCount++;
        capturedValue = elementValue;
      }
      expect(loopCount).assertEqual(1);
      expect(capturedValue).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2400
     * @tc.name testBigUint64ArrayIterator024
     * @tc.desc Verify break terminates default for-of iteration early
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let loopCount: int = 0;
      for (let elementValue of sourceArray) {
        loopCount++;
        if (loopCount === 1) {
          expect(elementValue).assertEqual(1n);
        }
        if (loopCount === 2) {
          break;
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2500
     * @tc.name testBigUint64ArrayIterator025
     * @tc.desc Verify continue skips selected BigInt value while default iteration continues
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let accumulatedValue: bigint = 0n;
      for (let elementValue of sourceArray) {
        if (elementValue === 2n) {
          continue;
        }
        accumulatedValue += elementValue;
      }
      expect(accumulatedValue).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2600
     * @tc.name testBigUint64ArrayIterator026
     * @tc.desc Verify two default for-of passes over the same array yield identical values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let firstPassValues: bigint[] = [];
      let secondPassValues: bigint[] = [];
      for (let elementValue of sourceArray) {
        firstPassValues.push(elementValue);
      }
      for (let elementValue of sourceArray) {
        secondPassValues.push(elementValue);
      }
      expect(firstPassValues[0]).assertEqual(secondPassValues[0]);
      expect(firstPassValues[1]).assertEqual(secondPassValues[1]);
      expect(firstPassValues[2]).assertEqual(secondPassValues[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2700
     * @tc.name testBigUint64ArrayIterator027
     * @tc.desc Verify default for-of over [0n, 1n] yields zero then one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n]);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(0n);
      expect(iterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2800
     * @tc.name testBigUint64ArrayIterator028
     * @tc.desc Verify default for-of yields max uint64 value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value]);
      let capturedValue: bigint = 0n;
      for (let elementValue of sourceArray) {
        capturedValue = elementValue;
      }
      expect(capturedValue).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_2900
     * @tc.name testBigUint64ArrayIterator029
     * @tc.desc Verify default for-of yields 0n as a real element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n]);
      let capturedValue: bigint = 1n;
      for (let elementValue of sourceArray) {
        capturedValue = elementValue;
      }
      expect(capturedValue).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3000
     * @tc.name testBigUint64ArrayIterator030
     * @tc.desc Verify iterator A advancing one step does not move iterator B
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let firstIterator = sourceArray.$_iterator();
      let secondIterator = sourceArray.$_iterator();
      firstIterator.next();
      expect(firstIterator.next().value).assertEqual(2n);
      expect(secondIterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3100
     * @tc.name testBigUint64ArrayIterator031
     * @tc.desc Verify exhausted iterator A does not exhaust iterator B
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let firstIterator = sourceArray.$_iterator();
      let secondIterator = sourceArray.$_iterator();
      firstIterator.next();
      firstIterator.next();
      expect(firstIterator.next().done).assertTrue();
      expect(secondIterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3200
     * @tc.name testBigUint64ArrayIterator032
     * @tc.desc Verify interleaved iterator next() calls keep separate cursor positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let firstIterator = sourceArray.$_iterator();
      let secondIterator = sourceArray.$_iterator();
      expect(firstIterator.next().value).assertEqual(10n);
      expect(secondIterator.next().value).assertEqual(10n);
      expect(firstIterator.next().value).assertEqual(20n);
      expect(secondIterator.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3300
     * @tc.name testBigUint64ArrayIterator033
     * @tc.desc Verify creating an iterator does not change array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let originalLength: int = sourceArray.length;
      sourceArray.$_iterator();
      expect(sourceArray.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3400
     * @tc.name testBigUint64ArrayIterator034
     * @tc.desc Verify next() traversal does not change source element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      iterator.next();
      iterator.next();
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3500
     * @tc.name testBigUint64ArrayIterator035
     * @tc.desc Verify default for-of traversal does not change source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let loopCount: int = 0;
      for (let elementValue of sourceArray) {
        loopCount++;
        expect(elementValue).assertEqual(sourceArray[loopCount - 1]);
      }
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(14n);
      expect(sourceArray[2]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3600
     * @tc.name testBigUint64ArrayIterator036
     * @tc.desc Verify iterator creation does not change an ArrayBuffer-backed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(buffer, 0, 2);
      sourceArray[0] = 100n;
      sourceArray[1] = 200n;
      sourceArray.$_iterator();
      expect(sourceArray[0]).assertEqual(100n);
      expect(sourceArray[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3700
     * @tc.name testBigUint64ArrayIterator037
     * @tc.desc Verify nested default for-of over another array does not affect outer iteration order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerArray = new BigUint64Array([1n, 2n, 3n]);
      let innerArray = new BigUint64Array([10n, 20n]);
      let expectedOuterValues: bigint[] = [1n, 2n, 3n];
      let outerIndex: int = 0;
      let innerCount: int = 0;
      for (let outerValue of outerArray) {
        expect(outerValue).assertEqual(expectedOuterValues[outerIndex]);
        outerIndex++;
        for (let innerValue of innerArray) {
          innerCount++;
          let isExpectedInnerValue: boolean = innerValue === 10n || innerValue === 20n;
          expect(isExpectedInnerValue).assertTrue();
        }
      }
      expect(outerIndex).assertEqual(3);
      expect(innerCount).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3800
     * @tc.name testBigUint64ArrayIterator038
     * @tc.desc Verify outer default for-of continues after an inner loop completes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerArray = new BigUint64Array([1n, 2n, 3n]);
      let innerArray = new BigUint64Array([10n]);
      let capturedOuterValues: bigint[] = [];
      for (let outerValue of outerArray) {
        capturedOuterValues.push(outerValue);
        for (let innerValue of innerArray) {
          expect(innerValue).assertEqual(10n);
        }
      }
      expect(capturedOuterValues[0]).assertEqual(1n);
      expect(capturedOuterValues[1]).assertEqual(2n);
      expect(capturedOuterValues[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_3900
     * @tc.name testBigUint64ArrayIterator039
     * @tc.desc Verify nested default for-of over two arrays keeps each value stream separate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerArray = new BigUint64Array([1n, 2n]);
      let innerArray = new BigUint64Array([100n, 200n]);
      let outerValues: bigint[] = [];
      let innerValues: bigint[] = [];
      for (let outerValue of outerArray) {
        outerValues.push(outerValue);
        for (let innerValue of innerArray) {
          innerValues.push(innerValue);
        }
      }
      expect(outerValues[0]).assertEqual(1n);
      expect(outerValues[1]).assertEqual(2n);
      expect(innerValues[0]).assertEqual(100n);
      expect(innerValues[1]).assertEqual(200n);
      expect(innerValues[2]).assertEqual(100n);
      expect(innerValues[3]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4000
     * @tc.name testBigUint64ArrayIterator040
     * @tc.desc Verify $_iterator() and values() produce the same first value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let defaultIterator = sourceArray.$_iterator();
      let valuesIterator = sourceArray.values();
      expect(defaultIterator.next().value).assertEqual(valuesIterator.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4100
     * @tc.name testBigUint64ArrayIterator041
     * @tc.desc Verify $_iterator() and values() produce all values in the same order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let defaultIterator = sourceArray.$_iterator();
      let valuesIterator = sourceArray.values();
      expect(defaultIterator.next().value).assertEqual(10n);
      expect(valuesIterator.next().value).assertEqual(10n);
      expect(defaultIterator.next().value).assertEqual(20n);
      expect(valuesIterator.next().value).assertEqual(20n);
      expect(defaultIterator.next().value).assertEqual(30n);
      expect(valuesIterator.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4200
     * @tc.name testBigUint64ArrayIterator042
     * @tc.desc Verify $_iterator() and values() are both immediately done for an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      expect(emptyArray.$_iterator().next().done).assertTrue();
      expect(emptyArray.values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4300
     * @tc.name testBigUint64ArrayIterator043
     * @tc.desc Verify $_iterator() and values() iterators keep independent cursor states
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let defaultIterator = sourceArray.$_iterator();
      let valuesIterator = sourceArray.values();
      defaultIterator.next();
      expect(defaultIterator.next().value).assertEqual(2n);
      expect(valuesIterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4400
     * @tc.name testBigUint64ArrayIterator044
     * @tc.desc Verify for-of over $_iterator() yields the same values as for-of over values()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 15n, 25n]);
      let defaultIteratorValues: bigint[] = [];
      let valuesIteratorValues: bigint[] = [];
      for (let elementValue of sourceArray.$_iterator()) {
        defaultIteratorValues.push(elementValue);
      }
      for (let elementValue of sourceArray.values()) {
        valuesIteratorValues.push(elementValue);
      }
      expect(defaultIteratorValues[0]).assertEqual(valuesIteratorValues[0]);
      expect(defaultIteratorValues[1]).assertEqual(valuesIteratorValues[1]);
      expect(defaultIteratorValues[2]).assertEqual(valuesIteratorValues[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4500
     * @tc.name testBigUint64ArrayIterator045
     * @tc.desc Verify next() yields 0n boundary value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n]);
      expect(sourceArray.$_iterator().next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4600
     * @tc.name testBigUint64ArrayIterator046
     * @tc.desc Verify next() yields max uint64 boundary value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value]);
      expect(sourceArray.$_iterator().next().value).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4700
     * @tc.name testBigUint64ArrayIterator047
     * @tc.desc Verify -1n storage wraps to max uint64 when read through $_iterator()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-1n]);
      expect(sourceArray.$_iterator().next().value).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4800
     * @tc.name testBigUint64ArrayIterator048
     * @tc.desc Verify next() yields signed int64 max value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let signedLongMaxValue: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([signedLongMaxValue]);
      expect(sourceArray.$_iterator().next().value).assertEqual(signedLongMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_4900
     * @tc.name testBigUint64ArrayIterator049
     * @tc.desc Verify [0n, max uint64, 1n] is yielded in exact order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([0n, maxUint64Value, 1n]);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(0n);
      expect(iterator.next().value).assertEqual(maxUint64Value);
      expect(iterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5000
     * @tc.name testBigUint64ArrayIterator050
     * @tc.desc Verify repeated max uint64 elements are yielded for every next() call before exhaustion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value, maxUint64Value]);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(maxUint64Value);
      expect(iterator.next().value).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5100
     * @tc.name testBigUint64ArrayIterator051
     * @tc.desc Verify all-zero array yields 0n for each iterator step
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(0n);
      expect(iterator.next().value).assertEqual(0n);
      expect(iterator.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5200
     * @tc.name testBigUint64ArrayIterator052
     * @tc.desc Verify 2^64 storage wraps to 0n when read through $_iterator()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowUint64Value: bigint = 18446744073709551616n;
      let targetArray = new BigUint64Array(1);
      targetArray.$_set(0, overflowUint64Value);
      expect(targetArray.$_iterator().next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5300
     * @tc.name testBigUint64ArrayIterator053
     * @tc.desc Verify exhausted iterator returns done true on two consecutive next() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(secondResult.done).assertTrue();
      expect(thirdResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5400
     * @tc.name testBigUint64ArrayIterator054
     * @tc.desc Verify exhausted iterator value remains undefined across repeated next() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      iterator.next();
      let firstExhaustedResult = iterator.next();
      let secondExhaustedResult = iterator.next();
      expect(firstExhaustedResult.value).assertEqual(undefined);
      expect(secondExhaustedResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5500
     * @tc.name testBigUint64ArrayIterator055
     * @tc.desc Verify length constructor zero-filled array yields three 0n values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(0n);
      expect(iterator.next().value).assertEqual(0n);
      expect(iterator.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5600
     * @tc.name testBigUint64ArrayIterator056
     * @tc.desc Verify BigUint64Array.of() result is yielded in argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(5n);
      expect(iterator.next().value).assertEqual(10n);
      expect(iterator.next().value).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5700
     * @tc.name testBigUint64ArrayIterator057
     * @tc.desc Verify BigUint64Array.from() from the same typed array yields source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([3n, 6n, 9n]);
      let copiedArray = BigUint64Array.from(originalArray);
      let iterator = copiedArray.$_iterator();
      expect(iterator.next().value).assertEqual(3n);
      expect(iterator.next().value).assertEqual(6n);
      expect(iterator.next().value).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5800
     * @tc.name testBigUint64ArrayIterator058
     * @tc.desc Verify copy constructor result is yielded independently from source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([10n, 20n]);
      let copiedArray = new BigUint64Array(originalArray);
      originalArray[0] = 99n;
      let iterator = copiedArray.$_iterator();
      expect(iterator.next().value).assertEqual(10n);
      expect(iterator.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_5900
     * @tc.name testBigUint64ArrayIterator059
     * @tc.desc Verify ArrayBuffer-backed view values are yielded by $_iterator()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(buffer, 0, 2);
      sourceArray[0] = 100n;
      sourceArray[1] = 200n;
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(100n);
      expect(iterator.next().value).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6000
     * @tc.name testBigUint64ArrayIterator060
     * @tc.desc Verify BigUint64Array.from(Array BigInt) result is yielded in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: bigint[] = [7n, 14n, 21n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(7n);
      expect(iterator.next().value).assertEqual(14n);
      expect(iterator.next().value).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6100
     * @tc.name testBigUint64ArrayIterator061
     * @tc.desc Verify BigUint64Array.from(Set BigInt) result is yielded in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<bigint> = new Set<bigint>();
      sourceSet.add(100n);
      sourceSet.add(200n);
      let sourceArray = BigUint64Array.from(sourceSet);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(100n);
      expect(iterator.next().value).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6200
     * @tc.name testBigUint64ArrayIterator062
     * @tc.desc Verify iteration proceeds in ascending index order regardless of element magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([30n, 20n, 10n]);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(30n);
      expect(iterator.next().value).assertEqual(20n);
      expect(iterator.next().value).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6300
     * @tc.name testBigUint64ArrayIterator063
     * @tc.desc Verify iteration visits each index in a five-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let loopCount: int = 0;
      for (let elementValue of sourceArray) {
        loopCount++;
        expect(elementValue).assertEqual(BigInt(loopCount));
      }
      expect(loopCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6400
     * @tc.name testBigUint64ArrayIterator064
     * @tc.desc Verify first iterator value equals the element at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      expect(sourceArray.$_iterator().next().value).assertEqual(sourceArray[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6500
     * @tc.name testBigUint64ArrayIterator065
     * @tc.desc Verify last iterator value equals the element at length minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      iterator.next();
      expect(iterator.next().value).assertEqual(sourceArray[sourceArray.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6600
     * @tc.name testBigUint64ArrayIterator066
     * @tc.desc Verify for-of can consume the explicit $_iterator() return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let capturedValues: bigint[] = [];
      for (let elementValue of sourceArray.$_iterator()) {
        capturedValues.push(elementValue);
      }
      expect(capturedValues[0]).assertEqual(1n);
      expect(capturedValues[1]).assertEqual(2n);
      expect(capturedValues[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6700
     * @tc.name testBigUint64ArrayIterator067
     * @tc.desc Verify for-of over $_iterator() matches direct for-of over the array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n]);
      let directValues: bigint[] = [];
      let iteratorValues: bigint[] = [];
      for (let elementValue of sourceArray) {
        directValues.push(elementValue);
      }
      for (let elementValue of sourceArray.$_iterator()) {
        iteratorValues.push(elementValue);
      }
      expect(directValues[0]).assertEqual(iteratorValues[0]);
      expect(directValues[1]).assertEqual(iteratorValues[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6800
     * @tc.name testBigUint64ArrayIterator068
     * @tc.desc Verify next() in a non-exhausted state yields the remaining final value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let iterator = sourceArray.$_iterator();
      iterator.next();
      iterator.next();
      let finalResult = iterator.next();
      expect(finalResult.done).assertFalse();
      expect(finalResult.value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_6900
     * @tc.name testBigUint64ArrayIterator069
     * @tc.desc Verify for-of break exits after the first yielded value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let loopCount: int = 0;
      let capturedValue: bigint = 0n;
      for (let elementValue of sourceArray) {
        loopCount++;
        capturedValue = elementValue;
        break;
      }
      expect(loopCount).assertEqual(1);
      expect(capturedValue).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7000
     * @tc.name testBigUint64ArrayIterator070
     * @tc.desc Verify partially consumed explicit iterator for-of yields only remaining values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let iterator = sourceArray.$_iterator();
      expect(iterator.next().value).assertEqual(1n);
      let capturedValues: bigint[] = [];
      for (let elementValue of iterator) {
        capturedValues.push(elementValue);
      }
      expect(capturedValues[0]).assertEqual(2n);
      expect(capturedValues[1]).assertEqual(3n);
      expect(capturedValues[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7100
     * @tc.name testBigUint64ArrayIterator071
     * @tc.desc Verify a fully consumed explicit iterator yields no values on a second for-of pass
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let iterator = sourceArray.$_iterator();
      let firstPassCount: int = 0;
      let secondPassCount: int = 0;
      for (let elementValue of iterator) {
        firstPassCount++;
        expect(elementValue).assertEqual(BigInt(firstPassCount));
      }
      for (let elementValue of iterator) {
        secondPassCount++;
        expect(elementValue).assertEqual(0n);
      }
      expect(firstPassCount).assertEqual(2);
      expect(secondPassCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7200
     * @tc.name testBigUint64ArrayIterator072
     * @tc.desc Verify $_iterator() on a byteOffset and length view yields only the view window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let windowView = new BigUint64Array(sourceBuffer, 8, 3);
      let iterator = windowView.$_iterator();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(firstResult.value).assertEqual(20n);
      expect(secondResult.value).assertEqual(30n);
      expect(thirdResult.value).assertEqual(40n);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7300
     * @tc.name testBigUint64ArrayIterator073
     * @tc.desc Verify $_iterator() on a subarray view observes parent writes inside the shared window before iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subarrayView = parentArray.subarray(1, 4);
      let hexadecimalSourceValue: int = 0x2A;
      let replacementValue: bigint = BigInt(hexadecimalSourceValue);
      parentArray[2] = replacementValue;
      let iterator = subarrayView.$_iterator();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.value).assertEqual(20n);
      expect(secondResult.value).assertEqual(42n);
      expect(thirdResult.value).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7400
     * @tc.name testBigUint64ArrayIterator074
     * @tc.desc Verify $_iterator() on a length-bounded byteOffset subarray yields current window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sharedBuffer, 0, 7);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let byteOffset: int = 8;
      let viewLength: int = 5;
      let byteOffsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let beginIndex: int = 2;
      let endIndex: int = 5;
      let nestedView = byteOffsetView.subarray(beginIndex, endIndex);
      fullView[4] = 555n;
      let iterator = nestedView.$_iterator();
      expect(nestedView.byteOffset).assertEqual(24);
      expect(nestedView.length).assertEqual(3);
      expect(iterator.next().value).assertEqual(40n);
      expect(iterator.next().value).assertEqual(555n);
      expect(iterator.next().value).assertEqual(60n);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7500
     * @tc.name testBigUint64ArrayIterator075
     * @tc.desc Verify $_iterator() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let copyBegin: int = 0;
      let copyEnd: int = 3;
      let sliceCopy = sourceView.slice(copyBegin, copyEnd);
      sourceView[1] = 777n;
      let iterator = sliceCopy.$_iterator();
      expect(sliceCopy.byteOffset).assertEqual(0);
      expect(sliceCopy.length).assertEqual(3);
      expect(iterator.next().value).assertEqual(20n);
      expect(iterator.next().value).assertEqual(30n);
      expect(iterator.next().value).assertEqual(40n);
      expect(iterator.next().done).assertTrue();
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7600
     * @tc.name testBigUint64ArrayIterator076
     * @tc.desc Verify $_iterator() on a zero-length byteOffset view is exhausted immediately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let iterationResult = sourceView.$_iterator().next();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(iterationResult.done).assertTrue();
      expect(iterationResult.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7700
     * @tc.name testBigUint64ArrayIterator077
     * @tc.desc Verify $_iterator() on a Set source reflects insertion order after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let iterator = sourceArray.$_iterator();
      expect(sourceArray.length).assertEqual(3);
      expect(iterator.next().value).assertEqual(7n);
      expect(iterator.next().value).assertEqual(11n);
      expect(iterator.next().value).assertEqual(15n);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7800
     * @tc.name testBigUint64ArrayIterator078
     * @tc.desc Verify $_iterator() on an advanced iterator source starts at the current cursor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let iterator = sourceArray.$_iterator();
      expect(sourceArray.length).assertEqual(3);
      expect(iterator.next().value).assertEqual(10n);
      expect(iterator.next().value).assertEqual(15n);
      expect(iterator.next().value).assertEqual(20n);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_7900
     * @tc.name testBigUint64ArrayIterator079
     * @tc.desc Verify $_iterator() observes writes to unread source elements after iterator creation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let iterator = sourceArray.$_iterator();
      sourceArray[1] = 22n;
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.value).assertEqual(1n);
      expect(secondResult.value).assertEqual(22n);
      expect(thirdResult.value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_8000
     * @tc.name testBigUint64ArrayIterator080
     * @tc.desc Verify $_iterator() yielded value stays stable after the source element is modified
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 8n]);
      let iterator = sourceArray.$_iterator();
      let firstResult = iterator.next();
      sourceArray[0] = 44n;
      let secondResult = iterator.next();
      expect(firstResult.value).assertEqual(4n);
      expect(secondResult.value).assertEqual(8n);
      expect(sourceArray[0]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_8100
     * @tc.name testBigUint64ArrayIterator081
     * @tc.desc Verify exhausted $_iterator() remains exhausted after source array writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9n]);
      let iterator = sourceArray.$_iterator();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_ITERATOR_8200
     * @tc.name testBigUint64ArrayIterator082
     * @tc.desc Verify $_iterator() on a byteOffset view observes shared window writes after iterator creation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayIterator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let windowView = new BigUint64Array(sharedBuffer, 8, 2);
      let iterator = windowView.$_iterator();
      fullView[1] = 200n;
      fullView[2] = 300n;
      expect(windowView.byteOffset).assertEqual(8);
      expect(iterator.next().value).assertEqual(200n);
      expect(iterator.next().value).assertEqual(300n);
      expect(iterator.next().done).assertTrue();
    });
  });
}
