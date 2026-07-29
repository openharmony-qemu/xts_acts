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

export default function biguint64arrayKeysTest(): void {

  describe('BigUint64ArrayKeysTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0100
     * @tc.name testBigUint64ArrayKeys001
     * @tc.desc Verify keys() called with zero arguments yields the first index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterationResult = sourceArray.keys().next();
      expect(iterationResult.done).assertFalse();
      expect(iterationResult.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0200
     * @tc.name testBigUint64ArrayKeys002
     * @tc.desc Verify keys() on an empty array yields done true and undefined value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let iterationResult = emptyArray.keys().next();
      expect(iterationResult.done).assertTrue();
      expect(iterationResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0300
     * @tc.name testBigUint64ArrayKeys003
     * @tc.desc Verify keys() iterator advances from index 0 to index 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let iterator = sourceArray.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0400
     * @tc.name testBigUint64ArrayKeys004
     * @tc.desc Verify each keys() call returns a fresh iterator starting at index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstIterator = sourceArray.keys();
      firstIterator.next();
      let secondIterator = sourceArray.keys();
      expect(secondIterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0500
     * @tc.name testBigUint64ArrayKeys005
     * @tc.desc Verify single-element array first next().value is index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let iterationResult = sourceArray.keys().next();
      expect(iterationResult.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0600
     * @tc.name testBigUint64ArrayKeys006
     * @tc.desc Verify keys().next() on a single-element array reports done false for the first key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let iterationResult = sourceArray.keys().next();
      expect(iterationResult.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0700
     * @tc.name testBigUint64ArrayKeys007
     * @tc.desc Verify keys() reports done true on the second next() after consuming the only key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let iterator = sourceArray.keys();
      iterator.next();
      let exhaustedResult = iterator.next();
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0800
     * @tc.name testBigUint64ArrayKeys008
     * @tc.desc Verify empty array first keys().next().done is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let iterationResult = emptyArray.keys().next();
      expect(iterationResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_0900
     * @tc.name testBigUint64ArrayKeys009
     * @tc.desc Verify empty array first keys().next().value is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let iterationResult = emptyArray.keys().next();
      expect(iterationResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1000
     * @tc.name testBigUint64ArrayKeys010
     * @tc.desc Verify empty array keys() keeps done true across repeated next() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let iterator = emptyArray.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.done).assertTrue();
      expect(secondResult.done).assertTrue();
      expect(thirdResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1100
     * @tc.name testBigUint64ArrayKeys011
     * @tc.desc Verify for-of over empty keys() does not execute the loop body
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let loopCount: int = 0;
      for (let key of emptyArray.keys()) {
        loopCount++;
        expect(key).assertEqual(0);
      }
      expect(loopCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1200
     * @tc.name testBigUint64ArrayKeys012
     * @tc.desc Verify two-element array second next() yields index 1 and done false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let iterator = sourceArray.keys();
      iterator.next();
      let secondResult = iterator.next();
      expect(secondResult.value).assertEqual(1);
      expect(secondResult.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1300
     * @tc.name testBigUint64ArrayKeys013
     * @tc.desc Verify two-element array third next().done is true after both indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let iterator = sourceArray.keys();
      iterator.next();
      iterator.next();
      let exhaustedResult = iterator.next();
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1400
     * @tc.name testBigUint64ArrayKeys014
     * @tc.desc Verify two-element array for-of keys() collects indexes 0 and 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let collectedKeys: int[] = [];
      for (let key of sourceArray.keys()) {
        collectedKeys.push(key);
      }
      expect(collectedKeys.length).assertEqual(2);
      expect(collectedKeys[0]).assertEqual(0);
      expect(collectedKeys[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1500
     * @tc.name testBigUint64ArrayKeys015
     * @tc.desc Verify for-of over the same keys() iterator exhausts it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let iterator = sourceArray.keys();
      let loopCount: int = 0;
      for (let key of iterator) {
        loopCount++;
        expect(key).assertEqual(loopCount - 1);
      }
      let exhaustedResult = iterator.next();
      expect(loopCount).assertEqual(2);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1600
     * @tc.name testBigUint64ArrayKeys016
     * @tc.desc Verify three-element array manual next() yields indexes 0 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1700
     * @tc.name testBigUint64ArrayKeys017
     * @tc.desc Verify three-element array for-of keys() collects indexes 0 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let collectedKeys: int[] = [];
      for (let key of sourceArray.keys()) {
        collectedKeys.push(key);
      }
      expect(collectedKeys.length).assertEqual(3);
      expect(collectedKeys[0]).assertEqual(0);
      expect(collectedKeys[1]).assertEqual(1);
      expect(collectedKeys[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1800
     * @tc.name testBigUint64ArrayKeys018
     * @tc.desc Verify keys() for-of iteration count equals array length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let loopCount: int = 0;
      for (let key of sourceArray.keys()) {
        loopCount++;
        expect(key).assertEqual(loopCount - 1);
      }
      expect(loopCount).assertEqual(sourceArray.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_1900
     * @tc.name testBigUint64ArrayKeys019
     * @tc.desc Verify a new keys() iterator starts at 0 after another iterator advances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstIterator = sourceArray.keys();
      firstIterator.next();
      let secondIterator = sourceArray.keys();
      expect(secondIterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2000
     * @tc.name testBigUint64ArrayKeys020
     * @tc.desc Verify five-element array first next() yields index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let iterationResult = sourceArray.keys().next();
      expect(iterationResult.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2100
     * @tc.name testBigUint64ArrayKeys021
     * @tc.desc Verify five-element array middle next() yields index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let iterator = sourceArray.keys();
      iterator.next();
      iterator.next();
      let middleResult = iterator.next();
      expect(middleResult.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2200
     * @tc.name testBigUint64ArrayKeys022
     * @tc.desc Verify five-element array last next() yields index 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let iterator = sourceArray.keys();
      iterator.next();
      iterator.next();
      iterator.next();
      iterator.next();
      let lastResult = iterator.next();
      expect(lastResult.value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2300
     * @tc.name testBigUint64ArrayKeys023
     * @tc.desc Verify five-element array for-of keys() collects length 5 and last index 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let collectedKeys: int[] = [];
      for (let key of sourceArray.keys()) {
        collectedKeys.push(key);
      }
      expect(collectedKeys.length).assertEqual(5);
      expect(collectedKeys[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2400
     * @tc.name testBigUint64ArrayKeys024
     * @tc.desc Verify break in keys() for-of stops after index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let loopCount: int = 0;
      let lastKey: int = -1;
      for (let key of sourceArray.keys()) {
        loopCount++;
        lastKey = key;
        if (key >= 2) {
          break;
        }
      }
      expect(loopCount).assertEqual(3);
      expect(lastKey).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2500
     * @tc.name testBigUint64ArrayKeys025
     * @tc.desc Verify continue in keys() for-of still visits every index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let loopCount: int = 0;
      let visitedSum: int = 0;
      for (let key of sourceArray.keys()) {
        loopCount++;
        if (key === 2) {
          continue;
        }
        visitedSum += key;
      }
      expect(loopCount).assertEqual(5);
      expect(visitedSum).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2600
     * @tc.name testBigUint64ArrayKeys026
     * @tc.desc Verify two independent keys() iterators both start at index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstIterator = sourceArray.keys();
      let secondIterator = sourceArray.keys();
      expect(firstIterator.next().value).assertEqual(0);
      expect(secondIterator.next().value).assertEqual(0);
      expect(firstIterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2700
     * @tc.name testBigUint64ArrayKeys027
     * @tc.desc Verify two keys() iterators keep independent state when interleaved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let firstIterator = sourceArray.keys();
      let secondIterator = sourceArray.keys();
      firstIterator.next();
      let secondFirstResult = secondIterator.next();
      let firstSecondResult = firstIterator.next();
      let secondSecondResult = secondIterator.next();
      expect(secondFirstResult.value).assertEqual(0);
      expect(firstSecondResult.value).assertEqual(1);
      expect(secondSecondResult.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2800
     * @tc.name testBigUint64ArrayKeys028
     * @tc.desc Verify exhausted keys() iterator does not affect a new iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstIterator = sourceArray.keys();
      firstIterator.next();
      firstIterator.next();
      firstIterator.next();
      let secondIterator = sourceArray.keys();
      expect(secondIterator.next().value).assertEqual(0);
      expect(secondIterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_2900
     * @tc.name testBigUint64ArrayKeys029
     * @tc.desc Verify later keys() iterators start at 0 after an earlier iterator advances twice
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let advancedIterator = sourceArray.keys();
      advancedIterator.next();
      advancedIterator.next();
      let secondIterator = sourceArray.keys();
      let thirdIterator = sourceArray.keys();
      expect(secondIterator.next().value).assertEqual(0);
      expect(thirdIterator.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3000
     * @tc.name testBigUint64ArrayKeys030
     * @tc.desc Verify exhausted keys() iterator keeps done true on later next() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let iterator = sourceArray.keys();
      iterator.next();
      iterator.next();
      let thirdResult = iterator.next();
      let fourthResult = iterator.next();
      expect(thirdResult.done).assertTrue();
      expect(fourthResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3100
     * @tc.name testBigUint64ArrayKeys031
     * @tc.desc Verify break in single-element keys() for-of still observes index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let loopCount: int = 0;
      for (let key of sourceArray.keys()) {
        loopCount++;
        expect(key).assertEqual(0);
        break;
      }
      expect(loopCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3200
     * @tc.name testBigUint64ArrayKeys032
     * @tc.desc Verify break in five-element keys() for-of stops with last observed index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let lastKey: int = -1;
      for (let key of sourceArray.keys()) {
        lastKey = key;
        if (key >= 2) {
          break;
        }
      }
      expect(lastKey).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3300
     * @tc.name testBigUint64ArrayKeys033
     * @tc.desc Verify nested keys() calls create independent inner iterators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let outerKeys: int[] = [];
      for (let outerKey of sourceArray.keys()) {
        outerKeys.push(outerKey);
        let innerKeys: int[] = [];
        for (let innerKey of sourceArray.keys()) {
          innerKeys.push(innerKey);
        }
        expect(innerKeys[0]).assertEqual(0);
        expect(innerKeys[1]).assertEqual(1);
      }
      expect(outerKeys[0]).assertEqual(0);
      expect(outerKeys[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3400
     * @tc.name testBigUint64ArrayKeys034
     * @tc.desc Verify manual next() on one keys() iterator does not affect another for-of iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let manualIterator = sourceArray.keys();
      let loopIterator = sourceArray.keys();
      let firstResult = manualIterator.next();
      let loopCount: int = 0;
      for (let key of loopIterator) {
        loopCount++;
        expect(key).assertEqual(loopCount - 1);
      }
      expect(firstResult.value).assertEqual(0);
      expect(loopCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3500
     * @tc.name testBigUint64ArrayKeys035
     * @tc.desc Verify empty constructor array keys() first next().done is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array();
      let iterationResult = emptyArray.keys().next();
      expect(iterationResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3600
     * @tc.name testBigUint64ArrayKeys036
     * @tc.desc Verify int length constructor array keys() yields indexes 0 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3700
     * @tc.name testBigUint64ArrayKeys037
     * @tc.desc Verify number length constructor array keys() iterates four indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLength: number = 4.0;
      let sourceArray = new BigUint64Array(arrayLength);
      let loopCount: int = 0;
      for (let key of sourceArray.keys()) {
        loopCount++;
        expect(key).assertEqual(loopCount - 1);
      }
      expect(loopCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3800
     * @tc.name testBigUint64ArrayKeys038
     * @tc.desc Verify copied BigUint64Array keys() count matches copied length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let copiedArray = new BigUint64Array(sourceArray);
      let loopCount: int = 0;
      for (let key of copiedArray.keys()) {
        loopCount++;
        expect(key).assertEqual(loopCount - 1);
      }
      expect(loopCount).assertEqual(sourceArray.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_3900
     * @tc.name testBigUint64ArrayKeys039
     * @tc.desc Verify BigUint64Array.of() array keys() yields indexes 0 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(100n, 200n, 300n);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4000
     * @tc.name testBigUint64ArrayKeys040
     * @tc.desc Verify BigUint64Array.from() array keys() preserves index range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.from([5n, 15n, 25n]);
      let collectedKeys: int[] = [];
      for (let key of sourceArray.keys()) {
        collectedKeys.push(key);
      }
      expect(collectedKeys.length).assertEqual(3);
      expect(collectedKeys[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4100
     * @tc.name testBigUint64ArrayKeys041
     * @tc.desc Verify array literal constructor keys() yields indexes 0 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 8n, 9n]);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4200
     * @tc.name testBigUint64ArrayKeys042
     * @tc.desc Verify ArrayBuffer full view keys() yields indexes 0 and 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(buffer, 0);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4300
     * @tc.name testBigUint64ArrayKeys043
     * @tc.desc Verify ArrayBuffer offset view keys() yields only index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(buffer, 8);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4400
     * @tc.name testBigUint64ArrayKeys044
     * @tc.desc Verify ArrayBuffer 24-byte view keys() iterates three indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer);
      let loopCount: int = 0;
      for (let key of sourceArray.keys()) {
        loopCount++;
        expect(key).assertEqual(loopCount - 1);
      }
      expect(loopCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4500
     * @tc.name testBigUint64ArrayKeys045
     * @tc.desc Verify keys() iterator created before element mutation still yields original index range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let iterator = sourceArray.keys();
      sourceArray[1] = 999n;
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4600
     * @tc.name testBigUint64ArrayKeys046
     * @tc.desc Verify keys() created after element mutation still yields indexes 0 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      sourceArray[0] = 888n;
      sourceArray[2] = 777n;
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4700
     * @tc.name testBigUint64ArrayKeys047
     * @tc.desc Verify keys() iterator created before fill() still iterates the original length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let iterator = sourceArray.keys();
      sourceArray.fill(0n);
      let loopCount: int = 0;
      for (let key of iterator) {
        loopCount++;
        expect(key).assertEqual(loopCount - 1);
      }
      expect(loopCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4800
     * @tc.name testBigUint64ArrayKeys048
     * @tc.desc Verify all-zero BigUint64Array values still produce indexes 0 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(0n, 0n, 0n);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_4900
     * @tc.name testBigUint64ArrayKeys049
     * @tc.desc Verify max uint64 element value does not affect keys() indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(18446744073709551615n, 0n);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5000
     * @tc.name testBigUint64ArrayKeys050
     * @tc.desc Verify repeated equal element values still produce ascending indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(7n, 7n, 7n, 7n);
      let collectedKeys: int[] = [];
      for (let key of sourceArray.keys()) {
        collectedKeys.push(key);
      }
      expect(collectedKeys[0]).assertEqual(0);
      expect(collectedKeys[1]).assertEqual(1);
      expect(collectedKeys[2]).assertEqual(2);
      expect(collectedKeys[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5100
     * @tc.name testBigUint64ArrayKeys051
     * @tc.desc Verify single 0n element array keys() yields index 0 then exhaustion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(0n);
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5200
     * @tc.name testBigUint64ArrayKeys052
     * @tc.desc Verify keys() index value can participate in int addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n);
      let firstKey: int = sourceArray.keys().next().value!;
      let sumValue = firstKey + 10;
      expect(sumValue).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5300
     * @tc.name testBigUint64ArrayKeys053
     * @tc.desc Verify length 1 constructor array keys() iterates exactly once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(1);
      let loopCount: int = 0;
      for (let key of sourceArray.keys()) {
        loopCount++;
        expect(key).assertEqual(0);
      }
      expect(loopCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5400
     * @tc.name testBigUint64ArrayKeys054
     * @tc.desc Verify keys() iteration does not change the source array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let lengthBefore = sourceArray.length;
      let loopCount: int = 0;
      for (let key of sourceArray.keys()) {
        loopCount++;
        expect(key).assertEqual(loopCount - 1);
      }
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5500
     * @tc.name testBigUint64ArrayKeys055
     * @tc.desc Verify keys() iteration does not change source array element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let loopCount: int = 0;
      for (let key of sourceArray.keys()) {
        expect(key).assertEqual(loopCount);
        loopCount++;
      }
      expect(loopCount).assertEqual(3);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5600
     * @tc.name testBigUint64ArrayKeys056
     * @tc.desc Verify consecutive keys() next() values increase by one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let iterator = sourceArray.keys();
      let firstKey: int = iterator.next().value!;
      let secondKey: int = iterator.next().value!;
      let thirdKey: int = iterator.next().value!;
      let fourthKey: int = iterator.next().value!;
      expect(firstKey + 1).assertEqual(secondKey);
      expect(secondKey + 1).assertEqual(thirdKey);
      expect(thirdKey + 1).assertEqual(fourthKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5700
     * @tc.name testBigUint64ArrayKeys057
     * @tc.desc Verify ArrayBuffer offset view keys() does not exceed the view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(buffer, 8);
      let collectedKeys: int[] = [];
      for (let key of sourceArray.keys()) {
        collectedKeys.push(key);
      }
      expect(collectedKeys.length).assertEqual(1);
      expect(collectedKeys[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5800
     * @tc.name testBigUint64ArrayKeys058
     * @tc.desc Verify ArrayBuffer view with explicit length 2 keys() stops at index 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(buffer, 0, 2);
      let loopCount: int = 0;
      let lastKey: int = -1;
      for (let key of sourceArray.keys()) {
        loopCount++;
        lastKey = key;
      }
      expect(loopCount).assertEqual(2);
      expect(lastKey).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_5900
     * @tc.name testBigUint64ArrayKeys059
     * @tc.desc Verify BigUint64Array.from() with mapfn still yields indexes 0 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: bigint[] = [1n, 2n, 3n];
      let sourceArray = BigUint64Array.from(sourceValues, (element: bigint, _index: number): bigint => {
        return element * 2n;
      });
      let iterator = sourceArray.keys();
      expect(iterator.next().value).assertEqual(0);
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6000
     * @tc.name testBigUint64ArrayKeys060
     * @tc.desc Verify even-length array keys() yields the expected middle and last indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n, 6n);
      let collectedKeys: int[] = [];
      for (let key of sourceArray.keys()) {
        collectedKeys.push(key);
      }
      expect(collectedKeys.length).assertEqual(6);
      expect(collectedKeys[3]).assertEqual(3);
      expect(collectedKeys[5]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6100
     * @tc.name testBigUint64ArrayKeys061
     * @tc.desc Verify odd-length array keys() yields the expected middle and last indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let collectedKeys: int[] = [];
      for (let key of sourceArray.keys()) {
        collectedKeys.push(key);
      }
      expect(collectedKeys.length).assertEqual(5);
      expect(collectedKeys[2]).assertEqual(2);
      expect(collectedKeys[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6200
     * @tc.name testBigUint64ArrayKeys062
     * @tc.desc Verify ArrayBuffer offset view with undefined length keys() yields only index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(buffer, 8, undefined);
      let iterator = sourceArray.keys();
      let iterationResult = iterator.next();
      expect(iterationResult.value).assertEqual(0);
      expect(iterationResult.done).assertFalse();
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6300
     * @tc.name testBigUint64ArrayKeys063
     * @tc.desc Verify detached keys method reference creates a fresh iterator starting at index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let directIterator = sourceArray.keys();
      directIterator.next();
      let keyFunction: () => IterableIterator<int> = sourceArray.keys;
      let iterator = keyFunction();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(firstResult.value).assertEqual(0);
      expect(firstResult.done).assertFalse();
      expect(secondResult.value).assertEqual(1);
      expect(secondResult.done).assertFalse();
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6400
     * @tc.name testBigUint64ArrayKeys064
     * @tc.desc Verify keys() on a subarray view yields zero-based indexes for the subarray window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subarrayView = parentArray.subarray(1, 4);
      let iterator = subarrayView.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
      expect(thirdResult.value).assertEqual(2);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6500
     * @tc.name testBigUint64ArrayKeys065
     * @tc.desc Verify keys() on a nested subarray from a byteOffset view yields only the nested window indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(48);
      let offsetView = new BigUint64Array(sourceBuffer, 8, 4);
      let nestedView = offsetView.subarray(1, 3);
      let iterator = nestedView.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6600
     * @tc.name testBigUint64ArrayKeys066
     * @tc.desc Verify keys() on a length-bounded byteOffset subarray yields local window indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let iterator = nestedView.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(nestedView.byteOffset).assertEqual(24);
      expect(nestedView.length).assertEqual(3);
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
      expect(thirdResult.value).assertEqual(2);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6700
     * @tc.name testBigUint64ArrayKeys067
     * @tc.desc Verify keys() on a slice copy from byteOffset view uses the copied window length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let iterator = sliceCopy.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(sliceCopy.byteOffset).assertEqual(0);
      expect(sliceCopy.length).assertEqual(3);
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
      expect(thirdResult.value).assertEqual(2);
      expect(exhaustedResult.done).assertTrue();
      expect(sliceCopy[1]).assertEqual(30n);
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6800
     * @tc.name testBigUint64ArrayKeys068
     * @tc.desc Verify keys() on a zero-length byteOffset view is exhausted immediately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let iterationResult = sourceView.keys().next();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(iterationResult.done).assertTrue();
      expect(iterationResult.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_6900
     * @tc.name testBigUint64ArrayKeys069
     * @tc.desc Verify keys() on a Set source reflects the deduplicated source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let iterator = sourceArray.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(sourceArray.length).assertEqual(3);
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
      expect(thirdResult.value).assertEqual(2);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_7000
     * @tc.name testBigUint64ArrayKeys070
     * @tc.desc Verify keys() on an advanced iterator source uses local indexes for remaining values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let iterator = sourceArray.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(sourceArray.length).assertEqual(3);
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
      expect(thirdResult.value).assertEqual(2);
      expect(exhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_7100
     * @tc.name testBigUint64ArrayKeys071
     * @tc.desc Verify keys() cursor continues with the next index after source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n);
      let iterator = sourceArray.keys();
      let firstResult = iterator.next();
      sourceArray[1] = 22n;
      let secondResult = iterator.next();
      let thirdResult = iterator.next();
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
      expect(thirdResult.value).assertEqual(2);
      expect(sourceArray[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_7200
     * @tc.name testBigUint64ArrayKeys072
     * @tc.desc Verify exhausted keys() iterator remains exhausted after source array writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(9n);
      let iterator = sourceArray.keys();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_7300
     * @tc.name testBigUint64ArrayKeys073
     * @tc.desc Verify keys() on a byteOffset view keeps local indexes after shared window writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let windowView = new BigUint64Array(sharedBuffer, 8, 2);
      let iterator = windowView.keys();
      fullView[1] = 200n;
      fullView[2] = 300n;
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let exhaustedResult = iterator.next();
      expect(windowView.length).assertEqual(2);
      expect(firstResult.value).assertEqual(0);
      expect(secondResult.value).assertEqual(1);
      expect(exhaustedResult.done).assertTrue();
      expect(windowView[0]).assertEqual(200n);
      expect(windowView[1]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_KEYS_7400
     * @tc.name testBigUint64ArrayKeys074
     * @tc.desc Verify for-of on a partially consumed keys() iterator yields only remaining indexes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayKeys074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let iterator = sourceArray.keys();
      let consumedResult = iterator.next();
      let remainingKeys: Array<int> = [];
      for (let key of iterator) {
        remainingKeys.push(key);
      }
      expect(consumedResult.done).assertFalse();
      expect(consumedResult.value).assertEqual(0);
      expect(remainingKeys.length).assertEqual(3);
      expect(remainingKeys[0]).assertEqual(1);
      expect(remainingKeys[1]).assertEqual(2);
      expect(remainingKeys[2]).assertEqual(3);
    });
  });
}
