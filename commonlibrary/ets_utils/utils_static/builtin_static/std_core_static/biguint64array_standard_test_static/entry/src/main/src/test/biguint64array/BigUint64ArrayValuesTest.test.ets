'use static'


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

const MAX_UINT64_VALUE: bigint = 18446744073709551615n;
const UINT64_MODULUS_VALUE: bigint = 18446744073709551616n;

export default function biguint64arrayValuesTest(): void {

  describe('BigUint64ArrayValuesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0100
     * @tc.name testBigUint64ArrayValues001
     * @tc.desc Verify values() on an empty array is done on the first next() call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array();
      let iterationResult = emptyArray.values().next();
      expect(iterationResult.done).assertTrue();
      expect(iterationResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0200
     * @tc.name testBigUint64ArrayValues002
     * @tc.desc Verify a zero length values() iterator remains done across repeated next() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let valuesIterator = emptyArray.values();
      expect(valuesIterator.next().done).assertTrue();
      expect(valuesIterator.next().done).assertTrue();
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0300
     * @tc.name testBigUint64ArrayValues003
     * @tc.desc Verify a single element values() iterator yields the element before completion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let valuesIterator = sourceArray.values();
      let firstResult = valuesIterator.next();
      expect(firstResult.done).assertFalse();
      expect(firstResult.value).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0400
     * @tc.name testBigUint64ArrayValues004
     * @tc.desc Verify a single element values() iterator is done after the first value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let valuesIterator = sourceArray.values();
      valuesIterator.next();
      let secondResult = valuesIterator.next();
      expect(secondResult.done).assertTrue();
      expect(secondResult.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0500
     * @tc.name testBigUint64ArrayValues005
     * @tc.desc Verify values() yields the max uint64 BigInt element exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE]);
      let firstResult = sourceArray.values().next();
      expect(firstResult.done).assertFalse();
      expect(firstResult.value).assertEqual(MAX_UINT64_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0600
     * @tc.name testBigUint64ArrayValues006
     * @tc.desc Verify values() yields three elements in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(1n);
      expect(valuesIterator.next().value).assertEqual(2n);
      expect(valuesIterator.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0700
     * @tc.name testBigUint64ArrayValues007
     * @tc.desc Verify values() is done after all source elements are consumed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let valuesIterator = sourceArray.values();
      valuesIterator.next();
      valuesIterator.next();
      valuesIterator.next();
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0800
     * @tc.name testBigUint64ArrayValues008
     * @tc.desc Verify values() preserves repeated equal element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 5n, 5n]);
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(5n);
      expect(valuesIterator.next().value).assertEqual(5n);
      expect(valuesIterator.next().value).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_0900
     * @tc.name testBigUint64ArrayValues009
     * @tc.desc Verify values() preserves zero max uint64 and one order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, MAX_UINT64_VALUE, 1n]);
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(0n);
      expect(valuesIterator.next().value).assertEqual(MAX_UINT64_VALUE);
      expect(valuesIterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1000
     * @tc.name testBigUint64ArrayValues010
     * @tc.desc Verify values() yields stored values after uint64 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-1n, UINT64_MODULUS_VALUE + 1n]);
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(MAX_UINT64_VALUE);
      expect(valuesIterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1100
     * @tc.name testBigUint64ArrayValues011
     * @tc.desc Verify values() on a length constructed array yields zero elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(0n);
      expect(valuesIterator.next().value).assertEqual(0n);
      expect(valuesIterator.next().value).assertEqual(0n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1200
     * @tc.name testBigUint64ArrayValues012
     * @tc.desc Verify values() on an of() result yields argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n);
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(10n);
      expect(valuesIterator.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1300
     * @tc.name testBigUint64ArrayValues013
     * @tc.desc Verify values() on a from() result yields source array order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.from([4n, 5n, 6n]);
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(4n);
      expect(valuesIterator.next().value).assertEqual(5n);
      expect(valuesIterator.next().value).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1400
     * @tc.name testBigUint64ArrayValues014
     * @tc.desc Verify values() on a copied array is independent from later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([7n, 8n, 9n]);
      let copiedArray = new BigUint64Array(originalArray);
      originalArray[0] = 70n;
      let valuesIterator = copiedArray.values();
      expect(valuesIterator.next().value).assertEqual(7n);
      expect(valuesIterator.next().value).assertEqual(8n);
      expect(valuesIterator.next().value).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1500
     * @tc.name testBigUint64ArrayValues015
     * @tc.desc Verify values() on a whole ArrayBuffer view yields buffer backed values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(sourceBuffer);
      sourceArray[0] = 99n;
      sourceArray[1] = 100n;
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(99n);
      expect(valuesIterator.next().value).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1600
     * @tc.name testBigUint64ArrayValues016
     * @tc.desc Verify values() on an offset ArrayBuffer view yields only the view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      let valuesIterator = offsetView.values();
      expect(valuesIterator.next().value).assertEqual(20n);
      expect(valuesIterator.next().value).assertEqual(30n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1700
     * @tc.name testBigUint64ArrayValues017
     * @tc.desc Verify values() on a subarray view yields only the view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let childView = sourceArray.subarray(1, 3);
      let valuesIterator = childView.values();
      expect(valuesIterator.next().value).assertEqual(2n);
      expect(valuesIterator.next().value).assertEqual(3n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1800
     * @tc.name testBigUint64ArrayValues018
     * @tc.desc Verify values() on a slice copy is unaffected by later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let slicedArray = sourceArray.slice(1, 3);
      sourceArray[1] = 200n;
      let valuesIterator = slicedArray.values();
      expect(valuesIterator.next().value).assertEqual(20n);
      expect(valuesIterator.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_1900
     * @tc.name testBigUint64ArrayValues019
     * @tc.desc Verify two values() iterators over the same array keep independent cursors
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let firstIterator = sourceArray.values();
      let secondIterator = sourceArray.values();
      expect(firstIterator.next().value).assertEqual(1n);
      expect(firstIterator.next().value).assertEqual(2n);
      expect(secondIterator.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2000
     * @tc.name testBigUint64ArrayValues020
     * @tc.desc Verify a new values() iterator starts from the first element after partial consumption
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let consumedIterator = sourceArray.values();
      consumedIterator.next();
      let freshIterator = sourceArray.values();
      expect(freshIterator.next().value).assertEqual(100n);
      expect(consumedIterator.next().value).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2100
     * @tc.name testBigUint64ArrayValues021
     * @tc.desc Verify values() and the default iterator yield the same first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([8n, 9n]);
      let valuesIterator = sourceArray.values();
      let defaultIterator = sourceArray.$_iterator();
      expect(valuesIterator.next().value).assertEqual(defaultIterator.next().value);
      expect(valuesIterator.next().value).assertEqual(defaultIterator.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2200
     * @tc.name testBigUint64ArrayValues022
     * @tc.desc Verify for-of over values() collects elements in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let collectedValues: bigint[] = [];
      for (let elementValue of sourceArray.values()) {
        collectedValues.push(elementValue);
      }
      expect(collectedValues[0]).assertEqual(10n);
      expect(collectedValues[1]).assertEqual(20n);
      expect(collectedValues[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2300
     * @tc.name testBigUint64ArrayValues023
     * @tc.desc Verify for-of over values() on an empty array does not enter the loop body
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray = new BigUint64Array(0);
      let loopCount: int = 0;
      for (let elementValue of emptyArray.values()) {
        loopCount++;
        expect(elementValue).assertEqual(0n);
      }
      expect(loopCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2400
     * @tc.name testBigUint64ArrayValues024
     * @tc.desc Verify nested for-of over values() creates independent iterators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let outerCount: int = 0;
      let innerCount: int = 0;
      for (let outerValue of sourceArray.values()) {
        outerCount++;
        expect(outerValue).assertEqual(BigInt(outerCount));
        for (let innerValue of sourceArray.values()) {
          innerCount++;
          expect(innerValue).assertEqual(BigInt(innerCount % 2 === 1 ? 1 : 2));
        }
      }
      expect(outerCount).assertEqual(2);
      expect(innerCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2500
     * @tc.name testBigUint64ArrayValues025
     * @tc.desc Verify a values() iterator itself can be consumed by for-of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n]);
      let valuesIterator = sourceArray.values();
      let loopCount: int = 0;
      for (let elementValue of valuesIterator) {
        loopCount++;
        expect(elementValue).assertEqual(BigInt(loopCount + 4));
      }
      expect(loopCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2600
     * @tc.name testBigUint64ArrayValues026
     * @tc.desc Verify creating a values() iterator does not change source metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      sourceArray.values();
      expect(sourceArray.length).assertEqual(lengthBefore);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
      expect(sourceArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2700
     * @tc.name testBigUint64ArrayValues027
     * @tc.desc Verify consuming a values() iterator does not modify source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let valuesIterator = sourceArray.values();
      valuesIterator.next();
      valuesIterator.next();
      valuesIterator.next();
      expect(sourceArray[0]).assertEqual(11n);
      expect(sourceArray[1]).assertEqual(22n);
      expect(sourceArray[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2800
     * @tc.name testBigUint64ArrayValues028
     * @tc.desc Verify a new values() iterator observes writes made before iterator creation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray[1] = 999n;
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(1n);
      expect(valuesIterator.next().value).assertEqual(999n);
      expect(valuesIterator.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_2900
     * @tc.name testBigUint64ArrayValues029
     * @tc.desc Verify a values() iterator observes writes made before its first next() call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let valuesIterator = sourceArray.values();
      sourceArray[0] = 100n;
      expect(valuesIterator.next().value).assertEqual(100n);
      expect(valuesIterator.next().value).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3000
     * @tc.name testBigUint64ArrayValues030
     * @tc.desc Verify a values() iterator observes later writes to unvisited elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let valuesIterator = sourceArray.values();
      expect(valuesIterator.next().value).assertEqual(1n);
      sourceArray[1] = 200n;
      expect(valuesIterator.next().value).assertEqual(200n);
      expect(valuesIterator.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3100
     * @tc.name testBigUint64ArrayValues031
     * @tc.desc Verify exhausted values() iterators keep returning done true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let valuesIterator = sourceArray.values();
      valuesIterator.next();
      expect(valuesIterator.next().done).assertTrue();
      expect(valuesIterator.next().done).assertTrue();
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3200
     * @tc.name testBigUint64ArrayValues032
     * @tc.desc Verify values() on a subarray view observes parent writes inside the shared window before iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subarrayView = parentArray.subarray(1, 4);
      let hexadecimalSourceValue: int = 0x2A;
      let replacementValue: bigint = BigInt(hexadecimalSourceValue);
      parentArray[2] = replacementValue;
      let valuesIterator = subarrayView.values();
      expect(valuesIterator.next().value).assertEqual(20n);
      expect(valuesIterator.next().value).assertEqual(42n);
      expect(valuesIterator.next().value).assertEqual(40n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3300
     * @tc.name testBigUint64ArrayValues033
     * @tc.desc Verify values() on a nested subarray from a byteOffset view yields only the nested window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 4);
      let nestedView = offsetView.subarray(1, 3);
      let valuesIterator = nestedView.values();
      expect(valuesIterator.next().value).assertEqual(30n);
      expect(valuesIterator.next().value).assertEqual(40n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3400
     * @tc.name testBigUint64ArrayValues034
     * @tc.desc Verify values() on a length-bounded byteOffset subarray yields current window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let valuesIterator = nestedView.values();
      expect(nestedView.byteOffset).assertEqual(24);
      expect(nestedView.length).assertEqual(3);
      expect(valuesIterator.next().value).assertEqual(40n);
      expect(valuesIterator.next().value).assertEqual(555n);
      expect(valuesIterator.next().value).assertEqual(60n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3500
     * @tc.name testBigUint64ArrayValues035
     * @tc.desc Verify values() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let valuesIterator = sliceCopy.values();
      expect(sliceCopy.byteOffset).assertEqual(0);
      expect(sliceCopy.length).assertEqual(3);
      expect(valuesIterator.next().value).assertEqual(20n);
      expect(valuesIterator.next().value).assertEqual(30n);
      expect(valuesIterator.next().value).assertEqual(40n);
      expect(valuesIterator.next().done).assertTrue();
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3600
     * @tc.name testBigUint64ArrayValues036
     * @tc.desc Verify values() on a zero-length byteOffset view is exhausted immediately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let iterationResult = sourceView.values().next();
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(iterationResult.done).assertTrue();
      expect(iterationResult.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3700
     * @tc.name testBigUint64ArrayValues037
     * @tc.desc Verify values() on a Set source reflects insertion order after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let valuesIterator = sourceArray.values();
      expect(sourceArray.length).assertEqual(3);
      expect(valuesIterator.next().value).assertEqual(7n);
      expect(valuesIterator.next().value).assertEqual(11n);
      expect(valuesIterator.next().value).assertEqual(15n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3800
     * @tc.name testBigUint64ArrayValues038
     * @tc.desc Verify values() on an advanced iterator source starts at the current cursor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let valuesIterator = sourceArray.values();
      expect(sourceArray.length).assertEqual(3);
      expect(valuesIterator.next().value).assertEqual(10n);
      expect(valuesIterator.next().value).assertEqual(15n);
      expect(valuesIterator.next().value).assertEqual(20n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_3900
     * @tc.name testBigUint64ArrayValues039
     * @tc.desc Verify values() yielded value stays stable after the source element is modified
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 8n]);
      let valuesIterator = sourceArray.values();
      let firstResult = valuesIterator.next();
      sourceArray[0] = 44n;
      let secondResult = valuesIterator.next();
      expect(firstResult.value).assertEqual(4n);
      expect(secondResult.value).assertEqual(8n);
      expect(sourceArray[0]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_4000
     * @tc.name testBigUint64ArrayValues040
     * @tc.desc Verify exhausted values() iterator remains exhausted after source array writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9n]);
      let valuesIterator = sourceArray.values();
      valuesIterator.next();
      let exhaustedResult = valuesIterator.next();
      sourceArray[0] = 99n;
      let postWriteResult = valuesIterator.next();
      expect(exhaustedResult.done).assertTrue();
      expect(exhaustedResult.value).assertUndefined();
      expect(postWriteResult.done).assertTrue();
      expect(postWriteResult.value).assertUndefined();
      expect(sourceArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_4100
     * @tc.name testBigUint64ArrayValues041
     * @tc.desc Verify values() on a byteOffset view observes shared window writes after iterator creation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let windowView = new BigUint64Array(sharedBuffer, 8, 2);
      let valuesIterator = windowView.values();
      fullView[1] = 200n;
      fullView[2] = 300n;
      expect(windowView.byteOffset).assertEqual(8);
      expect(valuesIterator.next().value).assertEqual(200n);
      expect(valuesIterator.next().value).assertEqual(300n);
      expect(valuesIterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUES_4200
     * @tc.name testBigUint64ArrayValues042
     * @tc.desc Verify two values() iterators keep independent cursors during alternating advancement
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let firstIterator = sourceArray.values();
      let secondIterator = sourceArray.values();
      expect(firstIterator.next().value).assertEqual(5n);
      expect(secondIterator.next().value).assertEqual(5n);
      expect(secondIterator.next().value).assertEqual(10n);
      expect(firstIterator.next().value).assertEqual(10n);
      expect(firstIterator.next().value).assertEqual(15n);
      expect(secondIterator.next().value).assertEqual(15n);
      expect(firstIterator.next().done).assertTrue();
      expect(secondIterator.next().done).assertTrue();
    });
  });
}
