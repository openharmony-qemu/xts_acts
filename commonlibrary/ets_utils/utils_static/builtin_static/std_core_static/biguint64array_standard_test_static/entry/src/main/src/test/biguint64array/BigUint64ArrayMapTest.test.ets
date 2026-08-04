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

export default function biguint64arrayMapTest(): void {

  describe('BigUint64ArrayMapTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0100
     * @tc.name testBigUint64ArrayMap001
     * @tc.desc Verify map() identity callback preserves all element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(20n);
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0200
     * @tc.name testBigUint64ArrayMap002
     * @tc.desc Verify map() callback doubles each element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element * 2n;
      });
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(12n);
      expect(resultArray[2]).assertEqual(14n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0300
     * @tc.name testBigUint64ArrayMap003
     * @tc.desc Verify map() callback returning constant zero fills the result with 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([8n, 9n, 10n]);
      let resultArray = sourceArray.map((_element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return 0n;
      });
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(0n);
      expect(resultArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0400
     * @tc.name testBigUint64ArrayMap004
     * @tc.desc Verify map() on an empty array returns an empty array without calling the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      let resultArray = sourceArray.map((_element: bigint, _index: int, _array: BigUint64Array): bigint => {
        callCount++;
        return 1n;
      });
      expect(resultArray.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0500
     * @tc.name testBigUint64ArrayMap005
     * @tc.desc Verify map() callback can use only the element parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let resultArray = sourceArray.map((element: bigint): bigint => {
        return element + 1n;
      });
      expect(resultArray[0]).assertEqual(12n);
      expect(resultArray[1]).assertEqual(23n);
      expect(resultArray[2]).assertEqual(34n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0600
     * @tc.name testBigUint64ArrayMap006
     * @tc.desc Verify map() callback uses element and index parameters together
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.map((element: bigint, index: int): bigint => {
        if (index === 0) {
          return element;
        }
        return element * 2n;
      });
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0700
     * @tc.name testBigUint64ArrayMap007
     * @tc.desc Verify map() callback uses element index and array parameters together
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let resultArray = sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        if (index === 0) {
          return element;
        }
        return element + array[0];
      });
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0800
     * @tc.name testBigUint64ArrayMap008
     * @tc.desc Verify map() callback can branch on element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 15n, 25n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        if (element > 10n) {
          return element;
        }
        return 0n;
      });
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_0900
     * @tc.name testBigUint64ArrayMap009
     * @tc.desc Verify map() callback can branch on index parity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.map((_element: bigint, index: int, _array: BigUint64Array): bigint => {
        if (index % 2 === 0) {
          return 0n;
        }
        return 1n;
      });
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(0n);
      expect(resultArray[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1000
     * @tc.name testBigUint64ArrayMap010
     * @tc.desc Verify map() callback captures an external multiplier value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 3n, 4n]);
      let multiplierValue: bigint = 10n;
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element * multiplierValue;
      });
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1100
     * @tc.name testBigUint64ArrayMap011
     * @tc.desc Verify map() callback can read values from an external BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let referenceArray = new BigUint64Array([100n, 200n, 300n]);
      let resultArray = sourceArray.map((_element: bigint, index: int, _array: BigUint64Array): bigint => {
        return referenceArray[index];
      });
      expect(resultArray[0]).assertEqual(100n);
      expect(resultArray[1]).assertEqual(200n);
      expect(resultArray[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1200
     * @tc.name testBigUint64ArrayMap012
     * @tc.desc Verify map() callback observes external state changes across calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let factorValue: bigint = 1n;
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        let mappedElement: bigint = element * factorValue;
        factorValue = factorValue + 1n;
        return mappedElement;
      });
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1300
     * @tc.name testBigUint64ArrayMap013
     * @tc.desc Verify map() callback call count equals source array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let callCount: int = 0;
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        callCount++;
        return element;
      });
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1400
     * @tc.name testBigUint64ArrayMap014
     * @tc.desc Verify map() on an empty source never calls the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      sourceArray.map((_element: bigint, _index: int, _array: BigUint64Array): bigint => {
        callCount++;
        return 0n;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1500
     * @tc.name testBigUint64ArrayMap015
     * @tc.desc Verify map() callback first index is 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstIndex: int = -1;
      sourceArray.map((_element: bigint, index: int, _array: BigUint64Array): bigint => {
        if (firstIndex === -1) {
          firstIndex = index;
        }
        return 0n;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1600
     * @tc.name testBigUint64ArrayMap016
     * @tc.desc Verify map() callback last index equals length minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([8n, 9n, 10n]);
      let lastIndex: int = -1;
      sourceArray.map((_element: bigint, index: int, _array: BigUint64Array): bigint => {
        lastIndex = index;
        return 0n;
      });
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1700
     * @tc.name testBigUint64ArrayMap017
     * @tc.desc Verify map() callback indexes increase sequentially from 0 to 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let capturedIndexes: int[] = [];
      sourceArray.map((_element: bigint, index: int, _array: BigUint64Array): bigint => {
        capturedIndexes.push(index);
        return 0n;
      });
      expect(capturedIndexes[0]).assertEqual(0);
      expect(capturedIndexes[1]).assertEqual(1);
      expect(capturedIndexes[2]).assertEqual(2);
      expect(capturedIndexes[3]).assertEqual(3);
      expect(capturedIndexes[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1800
     * @tc.name testBigUint64ArrayMap018
     * @tc.desc Verify map() callback array parameter is the original source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let callbackArray = new BigUint64Array(0);
      sourceArray.map((_element: bigint, _index: int, array: BigUint64Array): bigint => {
        callbackArray = array;
        return 0n;
      });
      expect(callbackArray).assertEqual(sourceArray);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_1900
     * @tc.name testBigUint64ArrayMap019
     * @tc.desc Verify map() callback array length equals source array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n, 12n]);
      let callbackLength: int = -1;
      sourceArray.map((_element: bigint, _index: int, array: BigUint64Array): bigint => {
        callbackLength = array.length;
        return 0n;
      });
      expect(callbackLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2000
     * @tc.name testBigUint64ArrayMap020
     * @tc.desc Verify map() callback element matches array value at the same index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let mismatchCount: int = 0;
      sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        if (element !== array[index]) {
          mismatchCount++;
        }
        return element;
      });
      expect(mismatchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2100
     * @tc.name testBigUint64ArrayMap021
     * @tc.desc Verify map() callback can read the source tail through the array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let tailValue: bigint = 0n;
      sourceArray.map((_element: bigint, _index: int, array: BigUint64Array): bigint => {
        tailValue = array[array.length - 1];
        return 0n;
      });
      expect(tailValue).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2200
     * @tc.name testBigUint64ArrayMap022
     * @tc.desc Verify map() transforms an all-zero source array with element plus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 1n;
      });
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2300
     * @tc.name testBigUint64ArrayMap023
     * @tc.desc Verify map() on a single-element source calls the callback once and maps the value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n]);
      let callCount: int = 0;
      let resultArray = sourceArray.map((element: bigint, index: int, _array: BigUint64Array): bigint => {
        callCount++;
        expect(index).assertEqual(0);
        return element + 1n;
      });
      expect(callCount).assertEqual(1);
      expect(resultArray[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2400
     * @tc.name testBigUint64ArrayMap024
     * @tc.desc Verify map() identity callback preserves the signed int64 max value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signedInt64Max: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([signedInt64Max]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray[0]).assertEqual(signedInt64Max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2500
     * @tc.name testBigUint64ArrayMap025
     * @tc.desc Verify map() callback can return the uint64 max constant
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([1n, 2n]);
      let resultArray = sourceArray.map((_element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return maxUint64;
      });
      expect(resultArray[0]).assertEqual(maxUint64);
      expect(resultArray[1]).assertEqual(maxUint64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2600
     * @tc.name testBigUint64ArrayMap026
     * @tc.desc Verify map() can process a source containing uint64 max when callback ignores the element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64]);
      let resultArray = sourceArray.map((_element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return 7n;
      });
      expect(resultArray[0]).assertEqual(7n);
      expect(sourceArray[0]).assertEqual(maxUint64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2700
     * @tc.name testBigUint64ArrayMap027
     * @tc.desc Verify map() identity callback preserves mixed zero normal and one values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 42n, 1n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(42n);
      expect(resultArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2800
     * @tc.name testBigUint64ArrayMap028
     * @tc.desc Verify map() on an of() source transforms each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(3n, 6n, 9n);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element * 10n;
      });
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(60n);
      expect(resultArray[2]).assertEqual(90n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_2900
     * @tc.name testBigUint64ArrayMap029
     * @tc.desc Verify map() on a from(Array BigInt) source transforms each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<bigint> = [2n, 4n, 6n];
      let sourceArray = BigUint64Array.from(sourceValues);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 100n;
      });
      expect(resultArray[0]).assertEqual(102n);
      expect(resultArray[1]).assertEqual(104n);
      expect(resultArray[2]).assertEqual(106n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3000
     * @tc.name testBigUint64ArrayMap030
     * @tc.desc Verify map() on a copied source transforms each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let originalArray = new BigUint64Array([25n, 50n, 75n]);
      let sourceArray = new BigUint64Array(originalArray);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element * 4n;
      });
      expect(resultArray[0]).assertEqual(100n);
      expect(resultArray[1]).assertEqual(200n);
      expect(resultArray[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3100
     * @tc.name testBigUint64ArrayMap031
     * @tc.desc Verify map() on an ArrayBuffer view with zero byte offset preserves mapped values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backingBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(backingBuffer, 0, 3);
      sourceArray[0] = 14n;
      sourceArray[1] = 28n;
      sourceArray[2] = 42n;
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element / 2n;
      });
      expect(resultArray[0]).assertEqual(7n);
      expect(resultArray[1]).assertEqual(14n);
      expect(resultArray[2]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3200
     * @tc.name testBigUint64ArrayMap032
     * @tc.desc Verify map() on an ArrayBuffer view with nonzero byte offset preserves mapped values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backingBuffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(backingBuffer, 8, 3);
      sourceArray[0] = 50n;
      sourceArray[1] = 60n;
      sourceArray[2] = 70n;
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 5n;
      });
      expect(resultArray[0]).assertEqual(55n);
      expect(resultArray[1]).assertEqual(65n);
      expect(resultArray[2]).assertEqual(75n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3300
     * @tc.name testBigUint64ArrayMap033
     * @tc.desc Verify map() on a subarray source maps only the subarray range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let sourceArray = parentArray.subarray(2, 5);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(40n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3400
     * @tc.name testBigUint64ArrayMap034
     * @tc.desc Verify map() result length equals source length for a normal source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3500
     * @tc.name testBigUint64ArrayMap035
     * @tc.desc Verify map() result length is zero for an empty source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3600
     * @tc.name testBigUint64ArrayMap036
     * @tc.desc Verify map() result byteLength is 24 for a three-element source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([15n, 30n, 45n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3700
     * @tc.name testBigUint64ArrayMap037
     * @tc.desc Verify map() result byteLength equals length times BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element * 3n;
      });
      expect(resultArray.byteLength).assertEqual(resultArray.length * resultArray.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3800
     * @tc.name testBigUint64ArrayMap038
     * @tc.desc Verify map() result BYTES_PER_ELEMENT is 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_3900
     * @tc.name testBigUint64ArrayMap039
     * @tc.desc Verify map() result name is BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 8n, 9n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4000
     * @tc.name testBigUint64ArrayMap040
     * @tc.desc Verify map() result byteOffset is zero even for transformed values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([64n, 128n, 256n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4100
     * @tc.name testBigUint64ArrayMap041
     * @tc.desc Verify map() result buffer is independent from the source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray.buffer !== sourceArray.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4200
     * @tc.name testBigUint64ArrayMap042
     * @tc.desc Verify map() result buffer is independent from an ArrayBuffer view backing buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backingBuffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(backingBuffer, 8, 3);
      sourceArray[0] = 44n;
      sourceArray[1] = 55n;
      sourceArray[2] = 66n;
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(resultArray.buffer !== backingBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4300
     * @tc.name testBigUint64ArrayMap043
     * @tc.desc Verify two independent map() calls return independent buffers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n, 12n]);
      let incrementedArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 1n;
      });
      let doubledArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element * 2n;
      });
      expect(incrementedArray.buffer !== doubledArray.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4400
     * @tc.name testBigUint64ArrayMap044
     * @tc.desc Verify modifying map() result first element does not change the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([71n, 72n, 73n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      resultArray[0] = 999n;
      expect(sourceArray[0]).assertEqual(71n);
      expect(resultArray[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4500
     * @tc.name testBigUint64ArrayMap045
     * @tc.desc Verify modifying all map() result elements does not change the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      resultArray[0] = 0n;
      resultArray[1] = 0n;
      resultArray[2] = 0n;
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4600
     * @tc.name testBigUint64ArrayMap046
     * @tc.desc Verify modifying the source after map() does not change the result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([18n, 36n, 54n, 72n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      sourceArray[0] = 999n;
      expect(resultArray[0]).assertEqual(18n);
      expect(sourceArray[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4700
     * @tc.name testBigUint64ArrayMap047
     * @tc.desc Verify map() does not change source array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([60n, 120n, 180n, 240n, 300n]);
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 1n;
      });
      expect(sourceArray.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4800
     * @tc.name testBigUint64ArrayMap048
     * @tc.desc Verify map() does not change source array byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n, 44n]);
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(sourceArray.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_4900
     * @tc.name testBigUint64ArrayMap049
     * @tc.desc Verify map() does not change source array byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backingBuffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(backingBuffer, 8, 3);
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(sourceArray.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5000
     * @tc.name testBigUint64ArrayMap050
     * @tc.desc Verify map() does not change source array BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 1n;
      });
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5100
     * @tc.name testBigUint64ArrayMap051
     * @tc.desc Verify map() transform callback leaves source element values unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element * 10n;
      });
      expect(sourceArray[0]).assertEqual(7n);
      expect(sourceArray[1]).assertEqual(14n);
      expect(sourceArray[2]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5200
     * @tc.name testBigUint64ArrayMap052
     * @tc.desc Verify map() on subarray does not change subarray length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let sourceArray = parentArray.subarray(1, 4);
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5300
     * @tc.name testBigUint64ArrayMap053
     * @tc.desc Verify writing map() result from subarray does not change the parent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let sourceArray = parentArray.subarray(1, 4);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element;
      });
      resultArray[0] = 999n;
      expect(parentArray[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5400
     * @tc.name testBigUint64ArrayMap054
     * @tc.desc Verify map() on ArrayBuffer view does not change view elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backingBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(backingBuffer, 0, 3);
      sourceArray[0] = 123n;
      sourceArray[1] = 456n;
      sourceArray[2] = 789n;
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 1n;
      });
      expect(sourceArray[0]).assertEqual(123n);
      expect(sourceArray[1]).assertEqual(456n);
      expect(sourceArray[2]).assertEqual(789n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5500
     * @tc.name testBigUint64ArrayMap055
     * @tc.desc Verify map() on one view does not change another view sharing the same buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let backingBuffer = new ArrayBuffer(32);
      let firstView = new BigUint64Array(backingBuffer, 0, 2);
      let secondView = new BigUint64Array(backingBuffer, 16, 2);
      firstView[0] = 11n;
      firstView[1] = 22n;
      secondView[0] = 33n;
      secondView[1] = 44n;
      firstView.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 100n;
      });
      expect(secondView[0]).assertEqual(33n);
      expect(secondView[1]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5600
     * @tc.name testBigUint64ArrayMap056
     * @tc.desc Verify map() can return BigInt converted from the callback index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let resultArray = sourceArray.map((_element: bigint, index: int, _array: BigUint64Array): bigint => {
        return BigInt(index);
      });
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5700
     * @tc.name testBigUint64ArrayMap057
     * @tc.desc Verify map() callback can add the first source element through array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let resultArray = sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        if (index === 0) {
          return element;
        }
        return element + array[0];
      });
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5800
     * @tc.name testBigUint64ArrayMap058
     * @tc.desc Verify map() callback can combine current and previous source elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 8n]);
      let resultArray = sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        if (index === 0) {
          return element;
        }
        return element + array[index - 1];
      });
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(6n);
      expect(resultArray[2]).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_5900
     * @tc.name testBigUint64ArrayMap059
     * @tc.desc Verify map() callback side effects can accumulate the original source sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let sumValue: bigint = 0n;
      sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        sumValue = sumValue + element;
        return element;
      });
      expect(sumValue).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6000
     * @tc.name testBigUint64ArrayMap060
     * @tc.desc Verify map() propagates an Error thrown in the middle of callback iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
          callCount++;
          if (element === 2n) {
            throw new Error('map callback error');
          }
          return element;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6100
     * @tc.name testBigUint64ArrayMap061
     * @tc.desc Verify map() stops before later elements when callback throws on the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let reachedSecondElement: boolean = false;
      try {
        sourceArray.map((_element: bigint, index: int, _array: BigUint64Array): bigint => {
          if (index === 0) {
            throw new Error('map first element error');
          }
          reachedSecondElement = true;
          return 0n;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(reachedSecondElement).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6200
     * @tc.name testBigUint64ArrayMap062
     * @tc.desc Verify map() invokes the callback one hundred times for a one hundred element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(100);
      for (let writeIndex: int = 0; writeIndex < 100; writeIndex++) {
        sourceArray[writeIndex] = BigInt(writeIndex);
      }
      let callCount: int = 0;
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        callCount++;
        return element + 1n;
      });
      expect(callCount).assertEqual(100);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[99]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6300
     * @tc.name testBigUint64ArrayMap063
     * @tc.desc Verify map() callback with multiple local statements returns the final computed value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 4n, 5n]);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        let mappedElement: bigint = element + 10n;
        mappedElement = mappedElement * 2n;
        return mappedElement;
      });
      expect(resultArray[0]).assertEqual(26n);
      expect(resultArray[1]).assertEqual(28n);
      expect(resultArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6400
     * @tc.name testBigUint64ArrayMap064
     * @tc.desc Verify map() callback can use an external threshold in conditional mapping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 15n, 25n]);
      let thresholdValue: bigint = 10n;
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        if (element > thresholdValue) {
          return element;
        }
        return thresholdValue;
      });
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6500
     * @tc.name testBigUint64ArrayMap065
     * @tc.desc Verify map() callback returning 2^64 wraps the result element to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let overflowValue: bigint = 18446744073709551616n;
      let resultArray = sourceArray.map((_element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return overflowValue;
      });
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6600
     * @tc.name testBigUint64ArrayMap066
     * @tc.desc Verify map() callback returning -1n wraps the result element to uint64 max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 4n]);
      let maxUint64: bigint = 18446744073709551615n;
      let resultArray = sourceArray.map((_element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return -1n;
      });
      expect(resultArray[0]).assertEqual(maxUint64);
      expect(resultArray[1]).assertEqual(maxUint64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6700
     * @tc.name testBigUint64ArrayMap067
     * @tc.desc Verify map() on a BigUint64Array.from(Set) source transforms insertion-order values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(2n);
      sourceSet.add(4n);
      sourceSet.add(6n);
      let sourceArray = BigUint64Array.from(sourceSet);
      let resultArray = sourceArray.map((element: bigint, index: int, _array: BigUint64Array): bigint => {
        return element + BigInt(index);
      });
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(5n);
      expect(resultArray[2]).assertEqual(8n);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[1]).assertEqual(4n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6800
     * @tc.name testBigUint64ArrayMap068
     * @tc.desc Verify map() on a FixedArray<BigInt> constructed source returns an independent mapped array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<bigint> = [5n, 10n, 15n];
      let sourceArray = new BigUint64Array(sourceValues);
      let resultArray = sourceArray.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element - 1n;
      });
      expect(resultArray[0]).assertEqual(4n);
      expect(resultArray[1]).assertEqual(9n);
      expect(resultArray[2]).assertEqual(14n);
      resultArray[0] = 99n;
      expect(sourceArray[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_6900
     * @tc.name testBigUint64ArrayMap069
     * @tc.desc Verify map() callback mutation of a later source element is observed by a later callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let observedSecondElement: bigint = 0n;
      let callCount: int = 0;
      let resultArray = sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        callCount++;
        if (index === 0) {
          array[1] = 99n;
        }
        if (index === 1) {
          observedSecondElement = element;
        }
        return element;
      });
      expect(callCount).assertEqual(3);
      expect(observedSecondElement).assertEqual(99n);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(99n);
      expect(resultArray[2]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7000
     * @tc.name testBigUint64ArrayMap070
     * @tc.desc Verify writing map() result from byteOffset view does not update the shared source buffer window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let resultArray = sourceView.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 1n;
      });
      let sharesSourceBuffer: boolean = resultArray.buffer === sharedBuffer;
      expect(sharesSourceBuffer).assertFalse();
      expect(resultArray.length).assertEqual(3);
      resultArray[0] = 99n;
      expect(resultArray[0]).assertEqual(99n);
      expect(resultArray[1]).assertEqual(31n);
      expect(resultArray[2]).assertEqual(41n);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7100
     * @tc.name testBigUint64ArrayMap071
     * @tc.desc Verify map() on a byteOffset view uses window values and local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let observedIndexTotal: int = 0;
      let resultArray = sourceView.map((element: bigint, index: int, _array: BigUint64Array): bigint => {
        observedIndexTotal = observedIndexTotal + index;
        return element + BigInt(index);
      });
      expect(observedIndexTotal).assertEqual(1);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7200
     * @tc.name testBigUint64ArrayMap072
     * @tc.desc Verify map() on a subarray observes parent mutation within the live source window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let sourceView = parentArray.subarray(beginIndex, endIndex);
      let observedSecondElement: bigint = 0n;
      let resultArray = sourceView.map((element: bigint, index: int, _array: BigUint64Array): bigint => {
        if (index === 0) {
          parentArray[2] = 99n;
        }
        if (index === 1) {
          observedSecondElement = element;
        }
        return element;
      });
      expect(observedSecondElement).assertEqual(99n);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(99n);
      expect(parentArray[2]).assertEqual(99n);
      expect(sourceView[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7300
     * @tc.name testBigUint64ArrayMap073
     * @tc.desc Verify map() propagates an Error thrown on the last callback iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let callCount: int = 0;
      try {
        sourceArray.map((element: bigint, index: int, _array: BigUint64Array): bigint => {
          callCount++;
          if (index === 2) {
            throw new Error('map last element error');
          }
          return element;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7400
     * @tc.name testBigUint64ArrayMap074
     * @tc.desc Verify map() on nested byteOffset subarray uses the local window indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let endIndex: int = 3;
      let sourceView = byteOffsetView.subarray(beginIndex, endIndex);
      let observedIndexTotal: int = 0;
      let observedByteOffset: int = 0;
      let resultArray = sourceView.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        observedIndexTotal = observedIndexTotal + index;
        observedByteOffset = array.byteOffset;
        return element + BigInt(index * 10);
      });
      let sharesSourceBuffer: boolean = resultArray.buffer === sharedBuffer;
      expect(observedIndexTotal).assertEqual(1);
      expect(observedByteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(2);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(resultArray[0]).assertEqual(30n);
      expect(resultArray[1]).assertEqual(50n);
      expect(sharesSourceBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7500
     * @tc.name testBigUint64ArrayMap075
     * @tc.desc Verify map() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let sliceCopy = sourceView.slice(beginIndex, endIndex);
      sourceView[1] = 777n;
      let resultArray = sliceCopy.map((element: bigint, _index: int, _array: BigUint64Array): bigint => {
        return element + 1n;
      });
      let sharesSliceBuffer: boolean = sliceCopy.buffer === sharedBuffer;
      let sharesResultBuffer: boolean = resultArray.buffer === sharedBuffer;
      expect(sharesSliceBuffer).assertFalse();
      expect(sharesResultBuffer).assertFalse();
      expect(sliceCopy[0]).assertEqual(30n);
      expect(sliceCopy[1]).assertEqual(40n);
      expect(sourceView[1]).assertEqual(777n);
      expect(resultArray[0]).assertEqual(31n);
      expect(resultArray[1]).assertEqual(41n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7600
     * @tc.name testBigUint64ArrayMap076
     * @tc.desc Verify map() on zero-length byteOffset view returns empty result without callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let callCount: int = 0;
      let resultArray = sourceView.map((_element: bigint, _index: int, _array: BigUint64Array): bigint => {
        callCount++;
        return 1n;
      });
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(resultArray.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7700
     * @tc.name testBigUint64ArrayMap077
     * @tc.desc Verify map() on a Set source uses callback indices after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let observedIndexTotal: int = 0;
      let resultArray = sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        observedIndexTotal = observedIndexTotal + index;
        return element + BigInt(index) + BigInt(array.length);
      });
      expect(sourceArray.length).assertEqual(3);
      expect(observedIndexTotal).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(15n);
      expect(resultArray[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7800
     * @tc.name testBigUint64ArrayMap078
     * @tc.desc Verify map() on an advanced iterator source maps the remaining iterator window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let observedFirstValue: bigint = 0n;
      let resultArray = sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        if (index === 0) {
          observedFirstValue = element;
        }
        return element + BigInt(index) + array[0];
      });
      expect(sourceArray.length).assertEqual(3);
      expect(observedFirstValue).assertEqual(10n);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(26n);
      expect(resultArray[2]).assertEqual(32n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_7900
     * @tc.name testBigUint64ArrayMap079
     * @tc.desc Verify map() callback writing the current source element keeps the captured value in result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let capturedElements: bigint[] = [];
      let resultArray = sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        capturedElements.push(element);
        array[index] = element + 100n;
        return element;
      });
      expect(capturedElements[0]).assertEqual(5n);
      expect(capturedElements[1]).assertEqual(10n);
      expect(capturedElements[2]).assertEqual(15n);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[1]).assertEqual(10n);
      expect(resultArray[2]).assertEqual(15n);
      expect(sourceArray[0]).assertEqual(105n);
      expect(sourceArray[1]).assertEqual(110n);
      expect(sourceArray[2]).assertEqual(115n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_8000
     * @tc.name testBigUint64ArrayMap080
     * @tc.desc Verify map() callback writing an already visited source element does not alter its mapped result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let resultArray = sourceArray.map((element: bigint, index: int, array: BigUint64Array): bigint => {
        if (index === 1) {
          array[0] = 99n;
        }
        return element * 2n;
      });
      expect(resultArray[0]).assertEqual(4n);
      expect(resultArray[1]).assertEqual(8n);
      expect(resultArray[2]).assertEqual(12n);
      expect(sourceArray[0]).assertEqual(99n);
      expect(sourceArray[1]).assertEqual(4n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_8100
     * @tc.name testBigUint64ArrayMap081
     * @tc.desc Verify map() observes an unvisited source value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLaterValue: bigint = 0n;
      let resultArray = sourceView.map((element: bigint, index: int,
        _array: BigUint64Array): bigint => {
        if (index === 0) {
          siblingView[0] = 9n;
        }
        if (index === 1) {
          observedLaterValue = element;
        }
        return element;
      });
      expect(observedLaterValue).assertEqual(9n);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(9n);
      expect(resultArray[2]).assertEqual(3n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_8200
     * @tc.name testBigUint64ArrayMap082
     * @tc.desc Verify map returns a binary integer converted to BigInt for every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n);
      let resultArray = sourceArray.map((_element: bigint): bigint => BigInt(0b101010));
      expect(resultArray.join(',')).assertEqual('42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_8300
     * @tc.name testBigUint64ArrayMap083
     * @tc.desc Verify map returns an octal integer converted to BigInt for every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n);
      let resultArray = sourceArray.map((_element: bigint): bigint => BigInt(0o52));
      expect(resultArray.join(',')).assertEqual('42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_8400
     * @tc.name testBigUint64ArrayMap084
     * @tc.desc Verify map returns a hexadecimal integer converted to BigInt for every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(1n, 2n);
      let resultArray = sourceArray.map((_element: bigint): bigint => BigInt(0x2A));
      expect(resultArray.join(',')).assertEqual('42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_8500
     * @tc.name testBigUint64ArrayMap085
     * @tc.desc Verify byte source converted by toInt supplies a BigInt callback result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteValueSource: byte = 42;
      let sourceArray = BigUint64Array.of(1n, 2n);
      let resultArray = sourceArray.map((_element: bigint): bigint => BigInt(byteValueSource.toInt()));
      expect(resultArray.join(',')).assertEqual('42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_8600
     * @tc.name testBigUint64ArrayMap086
     * @tc.desc Verify number source converted by toInt supplies a truncated BigInt callback result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberValueSource: number = 42.9;
      let sourceArray = BigUint64Array.of(1n, 2n);
      let resultArray = sourceArray.map((_element: bigint): bigint => BigInt(numberValueSource.toInt()));
      expect(resultArray.join(',')).assertEqual('42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_MAP_8700
     * @tc.name testBigUint64ArrayMap087
     * @tc.desc Verify double source converted by toInt supplies a truncated BigInt callback result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayMap087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleValueSource: double = 42.9;
      let sourceArray = BigUint64Array.of(1n, 2n);
      let resultArray = sourceArray.map((_element: bigint): bigint => BigInt(doubleValueSource.toInt()));
      expect(resultArray.join(',')).assertEqual('42,42');
    });
  });
}
