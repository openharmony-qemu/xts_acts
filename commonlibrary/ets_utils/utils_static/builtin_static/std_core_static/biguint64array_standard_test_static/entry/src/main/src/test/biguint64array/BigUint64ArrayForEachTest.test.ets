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


export default function biguint64arrayForEachTest(): void {

  describe('BigUint64ArrayForEachTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0010
     * @tc.name testBigUint64ArrayForEach001
     * @tc.desc Verify forEach() on an empty array with a three-parameter callback never invokes the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0020
     * @tc.name testBigUint64ArrayForEach002
     * @tc.desc Verify forEach() on a single-element array invokes a three-parameter callback once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let callCount: int = 0;
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
        callCount++;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0030
     * @tc.name testBigUint64ArrayForEach003
     * @tc.desc Verify forEach() invokes a three-parameter callback once per element on a multi-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount: int = 0;
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
        callCount++;
      });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0040
     * @tc.name testBigUint64ArrayForEach004
     * @tc.desc Verify forEach() passes the element value to a one-parameter callback in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let capturedValues: bigint[] = [];
      sourceArray.forEach((element: bigint): void => {
        capturedValues.push(element);
      });
      expect(capturedValues[0]).assertEqual(100n);
      expect(capturedValues[1]).assertEqual(200n);
      expect(capturedValues[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0050
     * @tc.name testBigUint64ArrayForEach005
     * @tc.desc Verify forEach() passes element and index to a two-parameter callback with sequential indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let capturedIndices: int[] = [];
      sourceArray.forEach((_element: bigint, index: int): void => {
        capturedIndices.push(index);
      });
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
      expect(capturedIndices[2]).assertEqual(2);
      expect(capturedIndices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0060
     * @tc.name testBigUint64ArrayForEach006
     * @tc.desc Verify forEach() passes the original array reference as the third callback argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 6n]);
      let isSameReference: boolean = false;
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 0) {
          isSameReference = array === sourceArray;
        }
      });
      expect(isSameReference).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0070
     * @tc.name testBigUint64ArrayForEach007
     * @tc.desc Verify forEach() callback receives 0n as the first element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let firstValue: bigint = 99n;
      sourceArray.forEach((element: bigint, index: int): void => {
        if (index === 0) {
          firstValue = element;
        }
      });
      expect(firstValue).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0080
     * @tc.name testBigUint64ArrayForEach008
     * @tc.desc Verify forEach() callback receives 1n as a minimum positive element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let capturedValue: bigint = 0n;
      sourceArray.forEach((element: bigint): void => {
        capturedValue = element;
      });
      expect(capturedValue).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0090
     * @tc.name testBigUint64ArrayForEach009
     * @tc.desc Verify forEach() callback receives element values in increasing index order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([99n, 88n, 77n]);
      let capturedValues: bigint[] = [];
      sourceArray.forEach((element: bigint): void => {
        capturedValues.push(element);
      });
      expect(capturedValues[0]).assertEqual(99n);
      expect(capturedValues[1]).assertEqual(88n);
      expect(capturedValues[2]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0100
     * @tc.name testBigUint64ArrayForEach010
     * @tc.desc Verify forEach() traverses values from a BigUint64Array.of() result in argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(3n, 6n, 9n);
      let capturedValues: bigint[] = [];
      sourceArray.forEach((element: bigint): void => {
        capturedValues.push(element);
      });
      expect(capturedValues[0]).assertEqual(3n);
      expect(capturedValues[1]).assertEqual(6n);
      expect(capturedValues[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0110
     * @tc.name testBigUint64ArrayForEach011
     * @tc.desc Verify forEach() traverses values from a BigUint64Array.from() result in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: bigint[] = [11n, 22n, 33n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let capturedValues: bigint[] = [];
      sourceArray.forEach((element: bigint): void => {
        capturedValues.push(element);
      });
      expect(capturedValues[0]).assertEqual(11n);
      expect(capturedValues[1]).assertEqual(22n);
      expect(capturedValues[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0120
     * @tc.name testBigUint64ArrayForEach012
     * @tc.desc Verify forEach() visits every element when all element values are identical
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 7n, 7n, 7n]);
      let matchCount: int = 0;
      sourceArray.forEach((element: bigint): void => {
        if (element === 7n) {
          matchCount++;
        }
      });
      expect(matchCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0130
     * @tc.name testBigUint64ArrayForEach013
     * @tc.desc Verify forEach() preserves callback order across zero, high boundary, and unit values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let highBoundaryValue: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([0n, highBoundaryValue, 1n]);
      let capturedValues: bigint[] = [];
      sourceArray.forEach((element: bigint): void => {
        capturedValues.push(element);
      });
      expect(capturedValues[0]).assertEqual(0n);
      expect(capturedValues[1]).assertEqual(highBoundaryValue);
      expect(capturedValues[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0140
     * @tc.name testBigUint64ArrayForEach014
     * @tc.desc Verify forEach() receives only zero values from a length-constructed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(5);
      let zeroCount: int = 0;
      sourceArray.forEach((element: bigint): void => {
        if (element === 0n) {
          zeroCount++;
        }
      });
      expect(zeroCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0150
     * @tc.name testBigUint64ArrayForEach015
     * @tc.desc Verify forEach() callback element has bigint runtime type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n]);
      let typeResult: string = '';
      sourceArray.forEach((element: bigint): void => {
        typeResult = typeof element;
      });
      expect(typeResult).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0160
     * @tc.name testBigUint64ArrayForEach016
     * @tc.desc Verify forEach() callback receives a regular middle-range bigint value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([99999999n]);
      let capturedValue: bigint = 0n;
      sourceArray.forEach((element: bigint): void => {
        capturedValue = element;
      });
      expect(capturedValue).assertEqual(99999999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0170
     * @tc.name testBigUint64ArrayForEach017
     * @tc.desc Verify forEach() traverses values copied by the BigUint64Array copy constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([55n, 66n]);
      let copiedArray = new BigUint64Array(originalArray);
      let capturedValues: bigint[] = [];
      copiedArray.forEach((element: bigint): void => {
        capturedValues.push(element);
      });
      expect(capturedValues[0]).assertEqual(55n);
      expect(capturedValues[1]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0180
     * @tc.name testBigUint64ArrayForEach018
     * @tc.desc Verify the first forEach() callback index is zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9n, 8n, 7n]);
      let firstIndex: int = -1;
      sourceArray.forEach((_element: bigint, index: int): void => {
        if (firstIndex === -1) {
          firstIndex = index;
        }
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0190
     * @tc.name testBigUint64ArrayForEach019
     * @tc.desc Verify the final forEach() callback index is length minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let lastIndex: int = -1;
      sourceArray.forEach((_element: bigint, index: int): void => {
        lastIndex = index;
      });
      expect(lastIndex).assertEqual(sourceArray.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0200
     * @tc.name testBigUint64ArrayForEach020
     * @tc.desc Verify forEach() callback indices strictly increase during traversal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let previousIndex: int = -1;
      let isStrictlyIncreasing: boolean = true;
      sourceArray.forEach((_element: bigint, index: int): void => {
        if (index <= previousIndex) {
          isStrictlyIncreasing = false;
        }
        previousIndex = index;
      });
      expect(isStrictlyIncreasing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0210
     * @tc.name testBigUint64ArrayForEach021
     * @tc.desc Verify forEach() callback index sequence contains each index exactly once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let capturedIndices: int[] = [];
      sourceArray.forEach((_element: bigint, index: int): void => {
        capturedIndices.push(index);
      });
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
      expect(capturedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0220
     * @tc.name testBigUint64ArrayForEach022
     * @tc.desc Verify forEach() callback indices are never negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let foundNegativeIndex: boolean = false;
      sourceArray.forEach((_element: bigint, index: int): void => {
        if (index < 0) {
          foundNegativeIndex = true;
        }
      });
      expect(foundNegativeIndex).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0230
     * @tc.name testBigUint64ArrayForEach023
     * @tc.desc Verify forEach() callback indices are always less than the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let foundOutOfRangeIndex: boolean = false;
      sourceArray.forEach((_element: bigint, index: int): void => {
        if (index >= sourceArray.length) {
          foundOutOfRangeIndex = true;
        }
      });
      expect(foundOutOfRangeIndex).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0240
     * @tc.name testBigUint64ArrayForEach024
     * @tc.desc Verify forEach() callback count exactly equals source array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 1n, 1n, 1n, 1n]);
      let callCount: int = 0;
      sourceArray.forEach((): void => {
        callCount++;
      });
      expect(callCount).assertEqual(sourceArray.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0250
     * @tc.name testBigUint64ArrayForEach025
     * @tc.desc Verify forEach() callback index is zero for a single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([999n]);
      let receivedIndex: int = -1;
      sourceArray.forEach((_element: bigint, index: int): void => {
        receivedIndex = index;
      });
      expect(receivedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0260
     * @tc.name testBigUint64ArrayForEach026
     * @tc.desc Verify forEach() index sequence is 0, 1, 2 for a three-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(100n, 200n, 300n);
      let capturedIndices: int[] = [];
      sourceArray.forEach((_element: bigint, index: int): void => {
        capturedIndices.push(index);
      });
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
      expect(capturedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0270
     * @tc.name testBigUint64ArrayForEach027
     * @tc.desc Verify forEach() index matches an external manual counter for each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(5);
      let manualIndex: int = 0;
      let allMatched: boolean = true;
      sourceArray.forEach((_element: bigint, index: int): void => {
        if (index !== manualIndex) {
          allMatched = false;
        }
        manualIndex++;
      });
      expect(allMatched).assertTrue();
      expect(manualIndex).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0280
     * @tc.name testBigUint64ArrayForEach028
     * @tc.desc Verify forEach() traverses all indices of a one-hundred-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(100);
      let lastIndex: int = -1;
      let callCount: int = 0;
      sourceArray.forEach((_element: bigint, index: int): void => {
        callCount++;
        lastIndex = index;
      });
      expect(callCount).assertEqual(100);
      expect(lastIndex).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0290
     * @tc.name testBigUint64ArrayForEach029
     * @tc.desc Verify forEach() array callback argument is the source array reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([13n, 14n]);
      let isSameReference: boolean = false;
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 0) {
          isSameReference = array === sourceArray;
        }
      });
      expect(isSameReference).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0300
     * @tc.name testBigUint64ArrayForEach030
     * @tc.desc Verify forEach() array callback argument keeps the source length on every callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let lengthMatches: boolean = true;
      sourceArray.forEach((_element: bigint, _index: int, array: BigUint64Array): void => {
        if (array.length !== sourceArray.length) {
          lengthMatches = false;
        }
      });
      expect(lengthMatches).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0310
     * @tc.name testBigUint64ArrayForEach031
     * @tc.desc Verify forEach() array callback argument returns the current element at array[index]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([77n, 88n, 99n]);
      let isConsistent: boolean = true;
      sourceArray.forEach((element: bigint, index: int, array: BigUint64Array): void => {
        if (array[index] !== element) {
          isConsistent = false;
        }
      });
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0320
     * @tc.name testBigUint64ArrayForEach032
     * @tc.desc Verify forEach() array callback argument exposes BYTES_PER_ELEMENT as eight
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      let bytesPerElement: int = 0;
      sourceArray.forEach((_element: bigint, _index: int, array: BigUint64Array): void => {
        bytesPerElement = array.BYTES_PER_ELEMENT;
      });
      expect(bytesPerElement).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0330
     * @tc.name testBigUint64ArrayForEach033
     * @tc.desc Verify forEach() callback can read the first element through the array argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([55n, 66n, 77n]);
      let firstValue: bigint = 0n;
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 0) {
          firstValue = array[0];
        }
      });
      expect(firstValue).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0340
     * @tc.name testBigUint64ArrayForEach034
     * @tc.desc Verify forEach() callback can read the last element through the array argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let lastValue: bigint = 0n;
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 3) {
          lastValue = array[3];
        }
      });
      expect(lastValue).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0350
     * @tc.name testBigUint64ArrayForEach035
     * @tc.desc Verify mutation through the forEach() array argument is visible on the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 1) {
          array[1] = 99n;
        }
      });
      expect(sourceArray[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0360
     * @tc.name testBigUint64ArrayForEach036
     * @tc.desc Verify forEach() passes the same array object reference across consecutive callbacks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let firstArray: BigUint64Array | undefined = undefined;
      let isSameReference: boolean = false;
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 0) {
          firstArray = array;
        }
        if (index === 1) {
          isSameReference = array === firstArray;
        }
      });
      expect(isSameReference).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0370
     * @tc.name testBigUint64ArrayForEach037
     * @tc.desc Verify an Error thrown on the first forEach() callback propagates to the caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.forEach((_element: bigint, _index: int): void => {
          callCount++;
          throw new Error('fail at first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0380
     * @tc.name testBigUint64ArrayForEach038
     * @tc.desc Verify an Error thrown on the last forEach() callback propagates after prior callbacks run
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n]);
      let callCount: int = 0;
      try {
        sourceArray.forEach((_element: bigint, index: int): void => {
          callCount++;
          if (index === 2) {
            throw new Error('fail at last');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0390
     * @tc.name testBigUint64ArrayForEach039
     * @tc.desc Verify a RangeError thrown from a middle forEach() callback propagates with its name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let callCount: int = 0;
      try {
        sourceArray.forEach((_element: bigint, index: int): void => {
          callCount++;
          if (index === 1) {
            throw new RangeError('mid error');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0400
     * @tc.name testBigUint64ArrayForEach040
     * @tc.desc Verify a TypeError thrown from a later forEach() callback propagates with its name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let callCount: int = 0;
      try {
        sourceArray.forEach((_element: bigint, index: int): void => {
          callCount++;
          if (index >= 3) {
            throw new TypeError('type error');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0410
     * @tc.name testBigUint64ArrayForEach041
     * @tc.desc Verify an Error message thrown from a forEach() callback is preserved for the caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      try {
        sourceArray.forEach((_element: bigint): void => {
          throw new Error('custom-message-123');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('custom-message-123');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0420
     * @tc.name testBigUint64ArrayForEach042
     * @tc.desc Verify forEach() stops iterating after a callback throws on a matched element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n, 99n, 3n]);
      let visitedValues: bigint[] = [];
      try {
        sourceArray.forEach((element: bigint): void => {
          visitedValues.push(element);
          if (element === 99n) {
            throw new Error('stop');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visitedValues.length).assertEqual(4);
      expect(visitedValues[3]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0430
     * @tc.name testBigUint64ArrayForEach043
     * @tc.desc Verify a TypeError thrown when forEach() sees 0n propagates after earlier callbacks run
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 0n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.forEach((element: bigint): void => {
          callCount++;
          if (element === 0n) {
            throw new TypeError('zero hit');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0440
     * @tc.name testBigUint64ArrayForEach044
     * @tc.desc Verify forEach() aborts after the callback throws and does not visit later elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let visitedCount: int = 0;
      try {
        sourceArray.forEach((_element: bigint, index: int): void => {
          visitedCount++;
          if (index === 2) {
            throw new Error('abort');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visitedCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0450
     * @tc.name testBigUint64ArrayForEach045
     * @tc.desc Verify external state changed before a thrown forEach() callback is not rolled back
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let sumBeforeThrow: bigint = 0n;
      try {
        sourceArray.forEach((element: bigint, index: int): void => {
          sumBeforeThrow = sumBeforeThrow + element;
          if (index === 2) {
            throw new Error('abort');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(sumBeforeThrow).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0460
     * @tc.name testBigUint64ArrayForEach046
     * @tc.desc Verify forEach() callback can increment an external counter once per element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let counter: int = 0;
      sourceArray.forEach((): void => {
        counter++;
      });
      expect(counter).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0470
     * @tc.name testBigUint64ArrayForEach047
     * @tc.desc Verify forEach() callback can append visited element values to an external array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([33n, 44n, 55n]);
      let collectedValues: bigint[] = [];
      sourceArray.forEach((element: bigint): void => {
        collectedValues.push(element);
      });
      expect(collectedValues[0]).assertEqual(33n);
      expect(collectedValues[1]).assertEqual(44n);
      expect(collectedValues[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0480
     * @tc.name testBigUint64ArrayForEach048
     * @tc.desc Verify forEach() callback can append visited indices to an external array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([7n, 7n, 7n]);
      let collectedIndices: int[] = [];
      sourceArray.forEach((_element: bigint, index: int): void => {
        collectedIndices.push(index);
      });
      expect(collectedIndices[0]).assertEqual(0);
      expect(collectedIndices[1]).assertEqual(1);
      expect(collectedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0490
     * @tc.name testBigUint64ArrayForEach049
     * @tc.desc Verify forEach() callback can accumulate all element values into a bigint sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let sum: bigint = 0n;
      sourceArray.forEach((element: bigint): void => {
        sum = sum + element;
      });
      expect(sum).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0500
     * @tc.name testBigUint64ArrayForEach050
     * @tc.desc Verify forEach() callback can mutate the current index through the array argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 5n, 5n]);
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        array[index] = BigInt(index) + 1n;
      });
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0510
     * @tc.name testBigUint64ArrayForEach051
     * @tc.desc Verify forEach() callback can update an external product through closure state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let product: bigint = 1n;
      sourceArray.forEach((element: bigint): void => {
        product = product * element;
      });
      expect(product).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0520
     * @tc.name testBigUint64ArrayForEach052
     * @tc.desc Verify an empty forEach() callback body completes without changing source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([999n, 888n, 777n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[0]).assertEqual(999n);
      expect(sourceArray[1]).assertEqual(888n);
      expect(sourceArray[2]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0530
     * @tc.name testBigUint64ArrayForEach053
     * @tc.desc Verify nested forEach() callbacks traverse the inner array for each outer element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerArray = new BigUint64Array([1n, 2n]);
      let innerArray = new BigUint64Array([10n, 20n, 30n]);
      let callCount: int = 0;
      outerArray.forEach((_outerElement: bigint): void => {
        innerArray.forEach((_innerElement: bigint): void => {
          callCount++;
        });
      });
      expect(callCount).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0540
     * @tc.name testBigUint64ArrayForEach054
     * @tc.desc Verify forEach() callback can test each value while ignoring index and array arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let allEven: boolean = true;
      sourceArray.forEach((element: bigint): void => {
        if (element % 2n !== 0n) {
          allEven = false;
        }
      });
      expect(allEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0550
     * @tc.name testBigUint64ArrayForEach055
     * @tc.desc Verify forEach() callback can use only the index argument to observe the maximum index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let maxIndex: int = -1;
      sourceArray.forEach((_element: bigint, index: int): void => {
        maxIndex = index;
      });
      expect(maxIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0560
     * @tc.name testBigUint64ArrayForEach056
     * @tc.desc Verify forEach() callback can use the array argument to read byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([12n, 24n, 36n]);
      let capturedByteLength: int = 0;
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 0) {
          capturedByteLength = array.byteLength;
        }
      });
      expect(capturedByteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0570
     * @tc.name testBigUint64ArrayForEach057
     * @tc.desc Verify forEach() callback can mutate the sole element of a single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([50n]);
      sourceArray.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        array[index] = 100n;
      });
      expect(sourceArray[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0580
     * @tc.name testBigUint64ArrayForEach058
     * @tc.desc Verify forEach() callback index stays synchronized with an external manual counter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let manualCounter: int = 0;
      let allMatched: boolean = true;
      sourceArray.forEach((_element: bigint, index: int): void => {
        if (index !== manualCounter) {
          allMatched = false;
        }
        manualCounter++;
      });
      expect(allMatched).assertTrue();
      expect(manualCounter).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0590
     * @tc.name testBigUint64ArrayForEach059
     * @tc.desc Verify forEach() over a length-constructed array observes zero-valued elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      let sum: bigint = 0n;
      sourceArray.forEach((element: bigint): void => {
        sum = sum + element;
      });
      expect(sum).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0600
     * @tc.name testBigUint64ArrayForEach060
     * @tc.desc Verify forEach() traverses a BigInt array-literal constructor result in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([15n, 30n, 45n]);
      let capturedValues: bigint[] = [];
      sourceArray.forEach((element: bigint): void => {
        capturedValues.push(element);
      });
      expect(capturedValues[0]).assertEqual(15n);
      expect(capturedValues[1]).assertEqual(30n);
      expect(capturedValues[2]).assertEqual(45n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0610
     * @tc.name testBigUint64ArrayForEach061
     * @tc.desc Verify forEach() traverses a BigUint64Array.of() result exactly three times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(7n, 14n, 21n);
      let callCount: int = 0;
      sourceArray.forEach((_element: bigint): void => {
        callCount++;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0620
     * @tc.name testBigUint64ArrayForEach062
     * @tc.desc Verify forEach() traverses a BigUint64Array.from() result and accumulates element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: bigint[] = [8n, 16n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let sum: bigint = 0n;
      sourceArray.forEach((element: bigint): void => {
        sum = sum + element;
      });
      expect(sum).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0630
     * @tc.name testBigUint64ArrayForEach063
     * @tc.desc Verify forEach() on a copy-constructed array receives values equal to the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([9n, 18n, 27n]);
      let copiedArray = new BigUint64Array(originalArray);
      let matchCount: int = 0;
      copiedArray.forEach((element: bigint, index: int): void => {
        if (element === originalArray[index]) {
          matchCount++;
        }
      });
      expect(matchCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0640
     * @tc.name testBigUint64ArrayForEach064
     * @tc.desc Verify forEach() on an ArrayBuffer offset view traverses elements from the selected byte range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buffer);
      fullView[0] = 111n;
      fullView[1] = 222n;
      fullView[2] = 333n;
      let offsetView = new BigUint64Array(buffer, 8, 2);
      let capturedValues: bigint[] = [];
      offsetView.forEach((element: bigint): void => {
        capturedValues.push(element);
      });
      expect(capturedValues[0]).assertEqual(222n);
      expect(capturedValues[1]).assertEqual(333n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0650
     * @tc.name testBigUint64ArrayForEach065
     * @tc.desc Verify forEach() on an all-ones array receives only 1n values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 1n, 1n, 1n]);
      let allValuesAreOne: boolean = true;
      sourceArray.forEach((element: bigint): void => {
        if (element !== 1n) {
          allValuesAreOne = false;
        }
      });
      expect(allValuesAreOne).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0660
     * @tc.name testBigUint64ArrayForEach066
     * @tc.desc Verify forEach() itself leaves source elements unchanged when the callback is read-only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n, 84n, 126n]);
      let snapshotValues: bigint[] = [sourceArray[0], sourceArray[1], sourceArray[2]];
      sourceArray.forEach((_element: bigint): void => {
      });
      expect(sourceArray[0]).assertEqual(snapshotValues[0]);
      expect(sourceArray[1]).assertEqual(snapshotValues[1]);
      expect(sourceArray[2]).assertEqual(snapshotValues[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0670
     * @tc.name testBigUint64ArrayForEach067
     * @tc.desc Verify forEach() callback can read an external multiplier from closure state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let multiplier: bigint = 10n;
      let weightedSum: bigint = 0n;
      sourceArray.forEach((element: bigint): void => {
        weightedSum = weightedSum + element * multiplier;
      });
      expect(weightedSum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0680
     * @tc.name testBigUint64ArrayForEach068
     * @tc.desc Verify forEach() callback updates external accumulated state across all iterations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let accumulatedValue: bigint = 0n;
      sourceArray.forEach((element: bigint): void => {
        accumulatedValue = accumulatedValue + element;
      });
      expect(accumulatedValue).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0690
     * @tc.name testBigUint64ArrayForEach069
     * @tc.desc Verify forEach() leaves empty array length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0700
     * @tc.name testBigUint64ArrayForEach070
     * @tc.desc Verify forEach() leaves single-element array length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([100n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0710
     * @tc.name testBigUint64ArrayForEach071
     * @tc.desc Verify forEach() leaves three-element array length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0720
     * @tc.name testBigUint64ArrayForEach072
     * @tc.desc Verify forEach() leaves BigUint64Array.of() result length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0730
     * @tc.name testBigUint64ArrayForEach073
     * @tc.desc Verify forEach() leaves BigUint64Array.from() result length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: bigint[] = [5n, 6n, 7n];
      let sourceArray = BigUint64Array.from(sourceValues);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0740
     * @tc.name testBigUint64ArrayForEach074
     * @tc.desc Verify forEach() leaves ArrayBuffer root view length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer, 0);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0750
     * @tc.name testBigUint64ArrayForEach075
     * @tc.desc Verify forEach() leaves copy-constructed array length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let copiedArray = new BigUint64Array(sourceArray);
      copiedArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(copiedArray.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0760
     * @tc.name testBigUint64ArrayForEach076
     * @tc.desc Verify forEach() leaves subarray view length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subArray = parentArray.subarray(1, 4);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0770
     * @tc.name testBigUint64ArrayForEach077
     * @tc.desc Verify forEach() leaves no-argument constructor array length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array();
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0780
     * @tc.name testBigUint64ArrayForEach078
     * @tc.desc Verify forEach() leaves empty array byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0790
     * @tc.name testBigUint64ArrayForEach079
     * @tc.desc Verify forEach() leaves single-element array byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0800
     * @tc.name testBigUint64ArrayForEach080
     * @tc.desc Verify forEach() leaves five-element array byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(5);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0810
     * @tc.name testBigUint64ArrayForEach081
     * @tc.desc Verify forEach() leaves offset buffer view byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(buffer, 8);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0820
     * @tc.name testBigUint64ArrayForEach082
     * @tc.desc Verify byteLength equals length multiplied by eight before and after forEach()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(6);
      expect(sourceArray.byteLength).assertEqual(sourceArray.length * 8);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.byteLength).assertEqual(sourceArray.length * 8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0830
     * @tc.name testBigUint64ArrayForEach083
     * @tc.desc Verify forEach() leaves subarray byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array(8);
      let subArray = parentArray.subarray(2, 5);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0840
     * @tc.name testBigUint64ArrayForEach084
     * @tc.desc Verify forEach() leaves element at index zero unchanged with a read-only callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([42n, 99n, 100n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0850
     * @tc.name testBigUint64ArrayForEach085
     * @tc.desc Verify forEach() leaves middle element unchanged with a read-only callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 55n, 20n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[1]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0860
     * @tc.name testBigUint64ArrayForEach086
     * @tc.desc Verify forEach() leaves last element unchanged with a read-only callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 7n, 9n]);
      let lastIndex: int = sourceArray.length - 1;
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[lastIndex]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0870
     * @tc.name testBigUint64ArrayForEach087
     * @tc.desc Verify forEach() leaves all-zero array elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
      expect(sourceArray[2]).assertEqual(0n);
      expect(sourceArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0880
     * @tc.name testBigUint64ArrayForEach088
     * @tc.desc Verify forEach() leaves 0n element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0890
     * @tc.name testBigUint64ArrayForEach089
     * @tc.desc Verify forEach() leaves 1n element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 100n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0900
     * @tc.name testBigUint64ArrayForEach090
     * @tc.desc Verify forEach() leaves mixed regular element values unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 9223372036854775807n, 42n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[0]).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(9223372036854775807n);
      expect(sourceArray[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0910
     * @tc.name testBigUint64ArrayForEach091
     * @tc.desc Verify forEach() leaves BigUint64Array.of() element values unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(11n, 22n, 33n);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[0]).assertEqual(11n);
      expect(sourceArray[1]).assertEqual(22n);
      expect(sourceArray[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0920
     * @tc.name testBigUint64ArrayForEach092
     * @tc.desc Verify forEach() leaves ArrayBuffer-constructed element values unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(buffer, 0);
      sourceArray[0] = 77n;
      sourceArray[1] = 88n;
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray[0]).assertEqual(77n);
      expect(sourceArray[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0930
     * @tc.name testBigUint64ArrayForEach093
     * @tc.desc Verify forEach() keeps buffer reference observable through a saved reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 15n]);
      let savedBuffer = sourceArray.buffer;
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      sourceArray[0] = 999n;
      let verifyView = new BigUint64Array(savedBuffer, 0);
      expect(verifyView[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0940
     * @tc.name testBigUint64ArrayForEach094
     * @tc.desc Verify forEach() leaves backing buffer byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(buffer, 0);
      let beforeByteLength: int = sourceArray.buffer.byteLength;
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.buffer.byteLength).assertEqual(beforeByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0950
     * @tc.name testBigUint64ArrayForEach095
     * @tc.desc Verify forEach() leaves subarray backing buffer byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([3n, 6n, 9n, 12n]);
      let subArray = parentArray.subarray(1, 3);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray.buffer.byteLength).assertEqual(parentArray.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0960
     * @tc.name testBigUint64ArrayForEach096
     * @tc.desc Verify forEach() keeps constructor ArrayBuffer sharing observable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer, 0);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      sourceArray[0] = 77n;
      let verifyView = new BigUint64Array(buffer, 0);
      expect(verifyView[0]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0970
     * @tc.name testBigUint64ArrayForEach097
     * @tc.desc Verify forEach() leaves root view byteOffset unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0980
     * @tc.name testBigUint64ArrayForEach098
     * @tc.desc Verify forEach() leaves offset view byteOffset eight unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(buffer, 8);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_0990
     * @tc.name testBigUint64ArrayForEach099
     * @tc.desc Verify forEach() leaves larger offset view byteOffset sixteen unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(40);
      let sourceArray = new BigUint64Array(buffer, 16);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1000
     * @tc.name testBigUint64ArrayForEach100
     * @tc.desc Verify forEach() leaves computed subarray byteOffset unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subArray = parentArray.subarray(2, 4);
      let beforeByteOffset: int = subArray.byteOffset;
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray.byteOffset).assertEqual(beforeByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1010
     * @tc.name testBigUint64ArrayForEach101
     * @tc.desc Verify forEach() leaves instance BYTES_PER_ELEMENT value as eight
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1020
     * @tc.name testBigUint64ArrayForEach102
     * @tc.desc Verify forEach() leaves subarray instance BYTES_PER_ELEMENT value as eight
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([5n, 10n, 15n, 20n]);
      let subArray = parentArray.subarray(0, 2);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1030
     * @tc.name testBigUint64ArrayForEach103
     * @tc.desc Verify forEach() leaves name property as BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1040
     * @tc.name testBigUint64ArrayForEach104
     * @tc.desc Verify forEach() leaves subarray name property as BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([7n, 14n, 21n]);
      let subArray = parentArray.subarray(1, 3);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1050
     * @tc.name testBigUint64ArrayForEach105
     * @tc.desc Verify nested forEach() leaves outer array length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerArray = new BigUint64Array([5n, 10n, 15n]);
      let innerArray = new BigUint64Array([1n, 2n]);
      outerArray.forEach((_outerElement: bigint, _outerIndex: int, _outerArray: BigUint64Array): void => {
        innerArray.forEach((_innerElement: bigint, _innerIndex: int, _innerArray: BigUint64Array): void => {
        });
      });
      expect(outerArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1060
     * @tc.name testBigUint64ArrayForEach106
     * @tc.desc Verify nested forEach() leaves inner array elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerArray = new BigUint64Array([1n, 2n]);
      let innerArray = new BigUint64Array([10n, 20n]);
      outerArray.forEach((_outerElement: bigint, _outerIndex: int, _outerArray: BigUint64Array): void => {
        innerArray.forEach((_innerElement: bigint, _innerIndex: int, _innerArray: BigUint64Array): void => {
        });
      });
      expect(innerArray[0]).assertEqual(10n);
      expect(innerArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1070
     * @tc.name testBigUint64ArrayForEach107
     * @tc.desc Verify forEach() leaves BigInt array constructor result length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: bigint[] = [100n, 200n, 300n];
      let sourceArray = new BigUint64Array(sourceValues);
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1080
     * @tc.name testBigUint64ArrayForEach108
     * @tc.desc Verify forEach() leaves buffer offset length view properties unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(buffer, 8, 2);
      sourceArray[0] = 11n;
      sourceArray[1] = 22n;
      sourceArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(sourceArray.length).assertEqual(2);
      expect(sourceArray.byteOffset).assertEqual(8);
      expect(sourceArray[0]).assertEqual(11n);
      expect(sourceArray[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1090
     * @tc.name testBigUint64ArrayForEach109
     * @tc.desc Verify forEach() on parent array leaves subarray elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let subArray = parentArray.subarray(1, 3);
      parentArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray[0]).assertEqual(20n);
      expect(subArray[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1100
     * @tc.name testBigUint64ArrayForEach110
     * @tc.desc Verify forEach() on subarray leaves parent element outside range unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([5n, 15n, 25n, 35n]);
      let subArray = parentArray.subarray(1, 3);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(parentArray[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1110
     * @tc.name testBigUint64ArrayForEach111
     * @tc.desc Verify forEach() on subarray leaves parent element inside range unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let subArray = parentArray.subarray(1, 2);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(parentArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1120
     * @tc.name testBigUint64ArrayForEach112
     * @tc.desc Verify forEach() on subarray leaves parent array length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([1n, 3n, 5n, 7n, 9n]);
      let subArray = parentArray.subarray(0, 2);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(parentArray.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1130
     * @tc.name testBigUint64ArrayForEach113
     * @tc.desc Verify forEach() on subarray leaves parent byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([2n, 4n, 6n]);
      let subArray = parentArray.subarray(1, 2);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(parentArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1140
     * @tc.name testBigUint64ArrayForEach114
     * @tc.desc Verify forEach() on subarray keeps parent buffer sharing observable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([8n, 16n, 24n]);
      let subArray = parentArray.subarray(0, 1);
      let savedBuffer = parentArray.buffer;
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      parentArray[0] = 999n;
      let verifyView = new BigUint64Array(savedBuffer, 0);
      expect(verifyView[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1150
     * @tc.name testBigUint64ArrayForEach115
     * @tc.desc Verify forEach() on one offset view leaves another offset view unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let firstView = new BigUint64Array(buffer, 0);
      let secondView = new BigUint64Array(buffer, 16);
      firstView[0] = 42n;
      firstView[1] = 99n;
      secondView[0] = 77n;
      secondView[1] = 88n;
      firstView.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(secondView[0]).assertEqual(77n);
      expect(secondView[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1160
     * @tc.name testBigUint64ArrayForEach116
     * @tc.desc Verify forEach() on one full buffer view preserves the other full view values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let firstView = new BigUint64Array(buffer, 0);
      let secondView = new BigUint64Array(buffer, 0);
      firstView[0] = 33n;
      firstView[1] = 66n;
      firstView.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(secondView[0]).assertEqual(33n);
      expect(secondView[1]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1170
     * @tc.name testBigUint64ArrayForEach117
     * @tc.desc Verify forEach() on offset view leaves bytes before the view unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buffer, 0);
      let offsetView = new BigUint64Array(buffer, 8);
      fullView[0] = 11n;
      fullView[1] = 22n;
      fullView[2] = 33n;
      offsetView.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(fullView[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1180
     * @tc.name testBigUint64ArrayForEach118
     * @tc.desc Verify forEach() on offset view leaves bytes after the view unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buffer, 0);
      let offsetView = new BigUint64Array(buffer, 8, 2);
      fullView[0] = 5n;
      fullView[1] = 15n;
      fullView[2] = 25n;
      fullView[3] = 35n;
      offsetView.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(fullView[3]).assertEqual(35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1190
     * @tc.name testBigUint64ArrayForEach119
     * @tc.desc Verify innermost subarray forEach() leaves root ancestor elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rootArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let middleArray = rootArray.subarray(1, 5);
      let leafArray = middleArray.subarray(1, 3);
      leafArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(rootArray[0]).assertEqual(1n);
      expect(rootArray[1]).assertEqual(2n);
      expect(rootArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1200
     * @tc.name testBigUint64ArrayForEach120
     * @tc.desc Verify innermost subarray forEach() leaves middle-level elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rootArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let middleArray = rootArray.subarray(0, 4);
      let leafArray = middleArray.subarray(2, 4);
      leafArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(middleArray[0]).assertEqual(10n);
      expect(middleArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1210
     * @tc.name testBigUint64ArrayForEach121
     * @tc.desc Verify forEach() on a middle shared view preserves outer views
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(40);
      let leftView = new BigUint64Array(buffer, 0);
      let middleView = new BigUint64Array(buffer, 8, 2);
      let rightView = new BigUint64Array(buffer, 24);
      leftView[0] = 1n;
      leftView[1] = 2n;
      rightView[0] = 9n;
      rightView[1] = 10n;
      middleView.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(leftView[1]).assertEqual(2n);
      expect(rightView[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1220
     * @tc.name testBigUint64ArrayForEach122
     * @tc.desc Verify parent forEach() leaves subarray length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([7n, 14n, 21n, 28n]);
      let subArray = parentArray.subarray(0, 2);
      parentArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1230
     * @tc.name testBigUint64ArrayForEach123
     * @tc.desc Verify parent forEach() leaves subarray byteOffset unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([3n, 6n, 9n, 12n]);
      let subArray = parentArray.subarray(2, 4);
      let beforeByteOffset: int = subArray.byteOffset;
      parentArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(subArray.byteOffset).assertEqual(beforeByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1240
     * @tc.name testBigUint64ArrayForEach124
     * @tc.desc Verify forEach() on buffer subarray leaves buffer elements outside the view unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buffer, 0);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      fullView[3] = 400n;
      let subArray = fullView.subarray(1, 3);
      subArray.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(fullView[0]).assertEqual(100n);
      expect(fullView[3]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1250
     * @tc.name testBigUint64ArrayForEach125
     * @tc.desc Verify shared buffer byteLength is unchanged across views after forEach()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let firstView = new BigUint64Array(buffer, 0);
      let secondView = new BigUint64Array(buffer, 0);
      firstView[0] = 13n;
      firstView.forEach((_element: bigint, _index: int, _array: BigUint64Array): void => {
      });
      expect(firstView.buffer.byteLength).assertEqual(16);
      expect(secondView.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1260
     * @tc.name testBigUint64ArrayForEach126
     * @tc.desc Verify forEach() returns undefined after executing callbacks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n]);
      let callbackTotal: bigint = 0n;
      let returnedValue = sourceArray.forEach((element: bigint): void => {
        callbackTotal = callbackTotal + element;
      });
      expect(returnedValue).assertEqual(undefined);
      expect(callbackTotal).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1270
     * @tc.name testBigUint64ArrayForEach127
     * @tc.desc Verify forEach() on an ArrayBuffer offset view reports local callback indices in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let baseView = new BigUint64Array(sharedBuffer);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      baseView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let windowView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let capturedIndices: int[] = [];
      windowView.forEach((_element: bigint, index: int, array: BigUint64Array): void => {
        capturedIndices.push(index);
        expect(array.byteOffset).assertEqual(byteOffset);
      });
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1280
     * @tc.name testBigUint64ArrayForEach128
     * @tc.desc Verify forEach() on a subarray observes parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let windowView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let observedValue: bigint = 0n;
      windowView.forEach((element: bigint, index: int): void => {
        if (index === 1) {
          observedValue = element;
        }
      });
      expect(observedValue).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1290
     * @tc.name testBigUint64ArrayForEach129
     * @tc.desc Verify forEach() writes through an ArrayBuffer offset view into the shared base view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let baseView = new BigUint64Array(sharedBuffer);
      baseView[0] = 1n;
      baseView[1] = 2n;
      baseView[2] = 3n;
      baseView[3] = 4n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let windowView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      windowView.forEach((element: bigint, index: int, array: BigUint64Array): void => {
        array[index] = element + 10n;
      });
      expect(baseView[0]).assertEqual(1n);
      expect(baseView[1]).assertEqual(12n);
      expect(baseView[2]).assertEqual(13n);
      expect(baseView[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1300
     * @tc.name testBigUint64ArrayForEach130
     * @tc.desc Verify forEach() on a nested byteOffset subarray uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(56);
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
      let offsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let nestedWindow = offsetView.subarray(1, 4);
      let indexSum: int = 0;
      let valueTotal: bigint = 0n;
      nestedWindow.forEach((element: bigint, index: int, array: BigUint64Array): void => {
        indexSum = indexSum + index;
        valueTotal = valueTotal + array[index];
        expect(array[index]).assertEqual(element);
      });
      expect(indexSum).assertEqual(3);
      expect(valueTotal).assertEqual(120n);
      expect(nestedWindow.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1310
     * @tc.name testBigUint64ArrayForEach131
     * @tc.desc Verify forEach() on a slice copy from a byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let viewLength: int = 4;
      let offsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let sliceCopy = offsetView.slice(1, 4);
      fullView[2] = 777n;
      let valueTotal: bigint = 0n;
      sliceCopy.forEach((element: bigint): void => {
        valueTotal = valueTotal + element;
      });
      let usesIndependentBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      expect(valueTotal).assertEqual(120n);
      expect(sliceCopy[0]).assertEqual(30n);
      expect(fullView[2]).assertEqual(777n);
      expect(usesIndependentBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1320
     * @tc.name testBigUint64ArrayForEach132
     * @tc.desc Verify forEach() on a zero-length byteOffset view does not invoke the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let callCount: int = 0;
      let returnedValue = zeroLengthView.forEach(
        (_element: bigint, _index: int, _array: BigUint64Array): void => {
          callCount = callCount + 1;
        });
      expect(returnedValue).assertEqual(undefined);
      expect(callCount).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1330
     * @tc.name testBigUint64ArrayForEach133
     * @tc.desc Verify forEach() on a Set source observes values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<BigInt>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let valueTotal: bigint = 0n;
      let indexSum: int = 0;
      let observedLength: int = 0;
      sourceArray.forEach((element: bigint, index: int, array: BigUint64Array): void => {
        valueTotal = valueTotal + element;
        indexSum = indexSum + index;
        observedLength = array.length;
      });
      expect(valueTotal).assertEqual(33n);
      expect(indexSum).assertEqual(3);
      expect(observedLength).assertEqual(3);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1340
     * @tc.name testBigUint64ArrayForEach134
     * @tc.desc Verify forEach() on an advanced iterator source uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let firstObservedElement: bigint = 0n;
      let valueTotal: bigint = 0n;
      let lastObservedIndex: int = -1;
      sourceArray.forEach((element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 0) {
          firstObservedElement = element;
        }
        valueTotal = valueTotal + array[index];
        lastObservedIndex = index;
      });
      expect(firstObservedElement).assertEqual(10n);
      expect(valueTotal).assertEqual(45n);
      expect(lastObservedIndex).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1350
     * @tc.name testBigUint64ArrayForEach135
     * @tc.desc Verify forEach() callback observes an unvisited element changed by an earlier callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let observedTailValue: bigint = 0n;
      let callCount: int = 0;
      sourceArray.forEach((element: bigint, index: int, array: BigUint64Array): void => {
        callCount = callCount + 1;
        if (index === 0) {
          array[2] = 99n;
        }
        if (index === 2) {
          observedTailValue = element;
        }
      });
      expect(callCount).assertEqual(3);
      expect(observedTailValue).assertEqual(99n);
      expect(sourceArray[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1360
     * @tc.name testBigUint64ArrayForEach136
     * @tc.desc Verify forEach() current callback value remains a snapshot after writing the same source index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let observedCurrentValue: bigint = 0n;
      sourceArray.forEach((element: bigint, index: int, array: BigUint64Array): void => {
        if (index === 1) {
          array[index] = 99n;
          observedCurrentValue = element;
        }
      });
      expect(observedCurrentValue).assertEqual(20n);
      expect(sourceArray[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1370
     * @tc.name testBigUint64ArrayForEach137
     * @tc.desc Verify forEach() later write to a visited index does not change the previously captured value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let capturedValues: bigint[] = [];
      sourceArray.forEach((element: bigint, index: int, array: BigUint64Array): void => {
        capturedValues.push(element);
        if (index === 2) {
          array[0] = 77n;
        }
      });
      expect(capturedValues[0]).assertEqual(2n);
      expect(capturedValues[1]).assertEqual(4n);
      expect(capturedValues[2]).assertEqual(6n);
      expect(sourceArray[0]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FOR_EACH_1380
     * @tc.name testBigUint64ArrayForEach138
     * @tc.desc Verify forEach() observes an unvisited source value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayForEach138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLaterValue: bigint = 0n;
      sourceView.forEach((element: bigint, index: int, _array: BigUint64Array): void => {
        if (index === 0) {
          siblingView[0] = 9n;
        }
        if (index === 1) {
          observedLaterValue = element;
        }
      });
      expect(observedLaterValue).assertEqual(9n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
      expect(sourceView[2]).assertEqual(3n);
    });
  });
}
