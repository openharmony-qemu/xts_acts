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


export default function biguint64arrayFindIndexTest(): void {

  describe('BigUint64ArrayFindIndexTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0010
     * @tc.name testBigUint64ArrayFindIndex001
     * @tc.desc Verify findIndex() returns 0 when predicate matches the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 10n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0020
     * @tc.name testBigUint64ArrayFindIndex002
     * @tc.desc Verify findIndex() returns the middle index when predicate matches a middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 8n, 7n, 6n, 5n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 7n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0030
     * @tc.name testBigUint64ArrayFindIndex003
     * @tc.desc Verify findIndex() returns length-1 when predicate matches the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 5n;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0040
     * @tc.name testBigUint64ArrayFindIndex004
     * @tc.desc Verify findIndex() returns -1 when no element satisfies the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 99n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0050
     * @tc.name testBigUint64ArrayFindIndex005
     * @tc.desc Verify findIndex() returns 0 when predicate always returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([30n, 60n, 90n]);
      let result: int = sourceArray.findIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0060
     * @tc.name testBigUint64ArrayFindIndex006
     * @tc.desc Verify findIndex() returns -1 when predicate always returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 100n, 150n]);
      let result: int = sourceArray.findIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0070
     * @tc.name testBigUint64ArrayFindIndex007
     * @tc.desc Verify findIndex() callback uses only the element parameter to match by value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([13n, 26n, 39n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 26n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0080
     * @tc.name testBigUint64ArrayFindIndex008
     * @tc.desc Verify findIndex() callback uses only the element parameter with no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 8n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 999n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0090
     * @tc.name testBigUint64ArrayFindIndex009
     * @tc.desc Verify findIndex() callback uses only the index parameter to match a specific index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 15n, 25n, 35n]);
      let result: int = sourceArray.findIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0100
     * @tc.name testBigUint64ArrayFindIndex010
     * @tc.desc Verify findIndex() callback uses only the index parameter with no matching index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 1n, 1n]);
      let result: int = sourceArray.findIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0110
     * @tc.name testBigUint64ArrayFindIndex011
     * @tc.desc Verify findIndex() callback uses only the array parameter via array.length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let result: int = sourceArray.findIndex((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        return array.length === 3;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0120
     * @tc.name testBigUint64ArrayFindIndex012
     * @tc.desc Verify findIndex() callback uses only the array parameter via a fixed index read
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let result: int = sourceArray.findIndex((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        return array[1] === 14n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0130
     * @tc.name testBigUint64ArrayFindIndex013
     * @tc.desc Verify findIndex() callback uses element and index where element equals BigInt(index)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 2n, 4n]);
      let result: int = sourceArray.findIndex((element: bigint, index: int, _array: BigUint64Array): boolean => {
        return element === BigInt(index);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0140
     * @tc.name testBigUint64ArrayFindIndex014
     * @tc.desc Verify findIndex() callback uses element and array comparing element with array[fixed]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, array: BigUint64Array): boolean => {
        return element === array[2];
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0150
     * @tc.name testBigUint64ArrayFindIndex015
     * @tc.desc Verify findIndex() callback uses all three params with a composite condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 4n, 9n, 16n, 25n]);
      let result: int = sourceArray.findIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        return element > 5n && index > 1 && array.length > 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0160
     * @tc.name testBigUint64ArrayFindIndex016
     * @tc.desc Verify findIndex() predicate uses greater-than to return the first greater element index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 7n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 4n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0170
     * @tc.name testBigUint64ArrayFindIndex017
     * @tc.desc Verify findIndex() predicate uses less-than to return the first smaller element index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 5n, 1n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element < 7n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0180
     * @tc.name testBigUint64ArrayFindIndex018
     * @tc.desc Verify findIndex() predicate uses negation of a greater-than comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 4n, 2n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return !(element > 3n);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0190
     * @tc.name testBigUint64ArrayFindIndex019
     * @tc.desc Verify findIndex() predicate with identity paradox value !== value returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element !== element;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0200
     * @tc.name testBigUint64ArrayFindIndex020
     * @tc.desc Verify findIndex() predicate uses BigInt addition to match the target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element + 5n === 15n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0210
     * @tc.name testBigUint64ArrayFindIndex021
     * @tc.desc Verify findIndex() predicate uses BigInt subtraction to match the target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 7n, 11n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element - 1n === 6n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0220
     * @tc.name testBigUint64ArrayFindIndex022
     * @tc.desc Verify findIndex() predicate uses BigInt multiplication to match the target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 5n, 7n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element * 2n === 10n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0230
     * @tc.name testBigUint64ArrayFindIndex023
     * @tc.desc Verify findIndex() predicate uses BigInt division to match the target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([6n, 10n, 14n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element / 2n === 5n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0240
     * @tc.name testBigUint64ArrayFindIndex024
     * @tc.desc Verify findIndex() predicate uses modulo to match the first even element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 5n, 8n, 11n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 2n === 0n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0250
     * @tc.name testBigUint64ArrayFindIndex025
     * @tc.desc Verify findIndex() predicate uses modulo to match the first odd element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 7n, 10n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 2n === 1n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0260
     * @tc.name testBigUint64ArrayFindIndex026
     * @tc.desc Verify findIndex() predicate uses bitwise AND to match the first odd element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 9n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return (element & 1n) === 1n;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0270
     * @tc.name testBigUint64ArrayFindIndex027
     * @tc.desc Verify findIndex() predicate uses right-shift to match the target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 8n, 16n, 32n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >> 1n === 8n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0280
     * @tc.name testBigUint64ArrayFindIndex028
     * @tc.desc Verify findIndex() predicate uses power-of-two check via bitwise AND
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 7n, 16n, 20n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return (element & (element - 1n)) === 0n && element > 0n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0290
     * @tc.name testBigUint64ArrayFindIndex029
     * @tc.desc Verify findIndex() predicate combines element and BigInt(index) in arithmetic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 20n]);
      let result: int = sourceArray.findIndex((element: bigint, index: int, _array: BigUint64Array): boolean => {
        return element - BigInt(index) * 10n === 0n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0300
     * @tc.name testBigUint64ArrayFindIndex030
     * @tc.desc Verify findIndex() matches the zero value in a mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n, 0n, 88n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0310
     * @tc.name testBigUint64ArrayFindIndex031
     * @tc.desc Verify findIndex() matches the signed int64 max value in a mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signedInt64Max: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([1n, signedInt64Max, 2n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === signedInt64Max;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0320
     * @tc.name testBigUint64ArrayFindIndex032
     * @tc.desc Verify findIndex() matches a large decimal value in a mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let largeValue: bigint = 99999999n;
      let sourceArray = new BigUint64Array([0n, largeValue, 1n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === largeValue;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0330
     * @tc.name testBigUint64ArrayFindIndex033
     * @tc.desc Verify findIndex() with zero-equality predicate on an all-max array returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, maxUint64]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0340
     * @tc.name testBigUint64ArrayFindIndex034
     * @tc.desc Verify findIndex() with zero-equality predicate on a max-and-zero mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, 0n, maxUint64, 0n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0350
     * @tc.name testBigUint64ArrayFindIndex035
     * @tc.desc Verify findIndex() short-circuits before a trailing max element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([42n, maxUint64]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 42n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0360
     * @tc.name testBigUint64ArrayFindIndex036
     * @tc.desc Verify findIndex() leaves a leading max element unchanged via direct read
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, 5n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 5n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray[0]).assertEqual(maxUint64);
      expect(sourceArray[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0370
     * @tc.name testBigUint64ArrayFindIndex037
     * @tc.desc Verify findIndex() on an empty array returns -1 without invoking the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      let result: int = sourceArray.findIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0380
     * @tc.name testBigUint64ArrayFindIndex038
     * @tc.desc Verify findIndex() on a single zero element array matching zero returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0390
     * @tc.name testBigUint64ArrayFindIndex039
     * @tc.desc Verify findIndex() on a single non-zero element array with no match returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0400
     * @tc.name testBigUint64ArrayFindIndex040
     * @tc.desc Verify findIndex() on a single element array matching that element returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 42n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0410
     * @tc.name testBigUint64ArrayFindIndex041
     * @tc.desc Verify findIndex() on a two element array matching the first returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([77n, 88n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 77n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0420
     * @tc.name testBigUint64ArrayFindIndex042
     * @tc.desc Verify findIndex() on a two element array matching the second returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([77n, 88n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 88n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0430
     * @tc.name testBigUint64ArrayFindIndex043
     * @tc.desc Verify findIndex() on an all-same-value array returns the first index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n, 99n, 99n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 99n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0440
     * @tc.name testBigUint64ArrayFindIndex044
     * @tc.desc Verify findIndex() on a duplicate-value array returns the first occurrence index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 8n, 5n, 8n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 8n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0450
     * @tc.name testBigUint64ArrayFindIndex045
     * @tc.desc Verify findIndex() invokes the callback length times when no element matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 8n, 9n, 10n, 11n]);
      let callCount: int = 0;
      let result: int = sourceArray.findIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0460
     * @tc.name testBigUint64ArrayFindIndex046
     * @tc.desc Verify findIndex() invokes the callback exactly once on a single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let callCount: int = 0;
      let result: int = sourceArray.findIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0470
     * @tc.name testBigUint64ArrayFindIndex047
     * @tc.desc Verify findIndex() short-circuits and calls the callback once on a first match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([25n, 50n, 75n, 100n]);
      let invokeCount: int = 0;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        invokeCount = invokeCount + 1;
        return element === 25n;
      });
      expect(result).assertEqual(0);
      expect(invokeCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0480
     * @tc.name testBigUint64ArrayFindIndex048
     * @tc.desc Verify findIndex() stops invoking after a mid-array match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 7n, 2n, 9n, 1n]);
      let invokeCount: int = 0;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        invokeCount = invokeCount + 1;
        return element === 7n;
      });
      expect(result).assertEqual(1);
      expect(invokeCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0490
     * @tc.name testBigUint64ArrayFindIndex049
     * @tc.desc Verify findIndex() passes index in strictly ascending order to the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let sequenceValid: boolean = true;
      let previousIndex: int = -1;
      sourceArray.findIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (index !== previousIndex + 1) {
          sequenceValid = false;
        }
        previousIndex = index;
        return false;
      });
      expect(sequenceValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0500
     * @tc.name testBigUint64ArrayFindIndex050
     * @tc.desc Verify findIndex() callback element equals array[index] on each invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 7n]);
      let consistent: boolean = true;
      sourceArray.findIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        if (element !== array[index]) {
          consistent = false;
        }
        return false;
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0510
     * @tc.name testBigUint64ArrayFindIndex051
     * @tc.desc Verify findIndex() invokes the callback length times when the last element matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return element === 3n;
      });
      expect(result).assertEqual(2);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0520
     * @tc.name testBigUint64ArrayFindIndex052
     * @tc.desc Verify findIndex() callback array parameter is the same reference as the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray.findIndex((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        array[0] = 99n;
        return true;
      });
      expect(sourceArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0530
     * @tc.name testBigUint64ArrayFindIndex053
     * @tc.desc Verify findIndex() callback receives indices in ascending order recorded in an array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 8n, 7n, 6n]);
      let recordedIndices: int[] = [0, 0, 0, 0];
      let position: int = 0;
      sourceArray.findIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        recordedIndices[position] = index;
        position = position + 1;
        return false;
      });
      expect(recordedIndices[0]).assertEqual(0);
      expect(recordedIndices[1]).assertEqual(1);
      expect(recordedIndices[2]).assertEqual(2);
      expect(recordedIndices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0540
     * @tc.name testBigUint64ArrayFindIndex054
     * @tc.desc Verify findIndex() stops visiting elements after a match is found
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let visited: int[] = [0, 0, 0, 0, 0];
      sourceArray.findIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        visited[index] = 1;
        return index === 2;
      });
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(1);
      expect(visited[2]).assertEqual(1);
      expect(visited[3]).assertEqual(0);
      expect(visited[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0550
     * @tc.name testBigUint64ArrayFindIndex055
     * @tc.desc Verify findIndex() visits zero elements beyond the matched position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n, 44n, 55n]);
      let beyondMatchCount: int = 0;
      let matched: boolean = false;
      sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        if (matched) {
          beyondMatchCount = beyondMatchCount + 1;
        }
        if (element === 22n) {
          matched = true;
          return true;
        }
        return false;
      });
      expect(beyondMatchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0560
     * @tc.name testBigUint64ArrayFindIndex056
     * @tc.desc Verify findIndex() callback element equals a direct external index read each call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let valuesMatch: boolean = true;
      let externalIndex: int = 0;
      sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        if (element !== sourceArray[externalIndex]) {
          valuesMatch = false;
        }
        externalIndex = externalIndex + 1;
        return false;
      });
      expect(valuesMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0570
     * @tc.name testBigUint64ArrayFindIndex057
     * @tc.desc Verify findIndex() returned index reads the matching element via subscript
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 15n;
      });
      expect(sourceArray[result]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0580
     * @tc.name testBigUint64ArrayFindIndex058
     * @tc.desc Verify findIndex() returned index 0 reads the first element via subscript
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 100n;
      });
      expect(sourceArray[result]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0590
     * @tc.name testBigUint64ArrayFindIndex059
     * @tc.desc Verify findIndex() returned last index reads the last element via subscript
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(sourceArray[result]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0600
     * @tc.name testBigUint64ArrayFindIndex060
     * @tc.desc Verify findIndex() returned match index produces the decimal string via toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 200n;
      });
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0610
     * @tc.name testBigUint64ArrayFindIndex061
     * @tc.desc Verify findIndex() returned -1 produces the string via toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 999n;
      });
      expect(result.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0620
     * @tc.name testBigUint64ArrayFindIndex062
     * @tc.desc Verify findIndex() returned match index is strictly less than the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 4n;
      });
      expect(result < sourceArray.length).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0630
     * @tc.name testBigUint64ArrayFindIndex063
     * @tc.desc Verify findIndex() leaves the array length unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let lengthBefore: int = sourceArray.length;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0640
     * @tc.name testBigUint64ArrayFindIndex064
     * @tc.desc Verify findIndex() leaves the array length unchanged after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let lengthBefore: int = sourceArray.length;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 99n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0650
     * @tc.name testBigUint64ArrayFindIndex065
     * @tc.desc Verify findIndex() leaves an empty array length at 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0660
     * @tc.name testBigUint64ArrayFindIndex066
     * @tc.desc Verify findIndex() leaves the array byteLength unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let byteLengthBefore: int = sourceArray.byteLength;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0670
     * @tc.name testBigUint64ArrayFindIndex067
     * @tc.desc Verify findIndex() leaves byteLength equal to length times BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.byteLength).assertEqual(sourceArray.length * sourceArray.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0680
     * @tc.name testBigUint64ArrayFindIndex068
     * @tc.desc Verify findIndex() leaves BYTES_PER_ELEMENT at 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(result).assertEqual(0);
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0690
     * @tc.name testBigUint64ArrayFindIndex069
     * @tc.desc Verify findIndex() leaves the byteOffset unchanged on a buffer-backed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(sharedBuffer, 8, 3);
      sourceArray[0] = 5n;
      sourceArray[1] = 10n;
      sourceArray[2] = 15n;
      let offsetBefore: int = sourceArray.byteOffset;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 10n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0700
     * @tc.name testBigUint64ArrayFindIndex070
     * @tc.desc Verify findIndex() leaves the first element unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 60n, 70n]);
      let firstBefore: bigint = sourceArray[0];
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 60n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray[0]).assertEqual(firstBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0710
     * @tc.name testBigUint64ArrayFindIndex071
     * @tc.desc Verify findIndex() leaves the last element unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 60n, 70n, 80n]);
      let lastBefore: bigint = sourceArray[3];
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 60n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray[3]).assertEqual(lastBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0720
     * @tc.name testBigUint64ArrayFindIndex072
     * @tc.desc Verify findIndex() leaves all elements unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 22n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray[0]).assertEqual(11n);
      expect(sourceArray[1]).assertEqual(22n);
      expect(sourceArray[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0730
     * @tc.name testBigUint64ArrayFindIndex073
     * @tc.desc Verify findIndex() leaves all elements unchanged after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let snapshotZero: bigint = sourceArray[0];
      let snapshotOne: bigint = sourceArray[1];
      let snapshotTwo: bigint = sourceArray[2];
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 8n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray[0]).assertEqual(snapshotZero);
      expect(sourceArray[1]).assertEqual(snapshotOne);
      expect(sourceArray[2]).assertEqual(snapshotTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0740
     * @tc.name testBigUint64ArrayFindIndex074
     * @tc.desc Verify findIndex() on the same array twice returns the same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let firstResult: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      let secondResult: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0750
     * @tc.name testBigUint64ArrayFindIndex075
     * @tc.desc Verify findIndex() with different predicates returns each correct result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let firstResult: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      let secondResult: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 4n;
      });
      expect(firstResult).assertEqual(1);
      expect(secondResult).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0760
     * @tc.name testBigUint64ArrayFindIndex076
     * @tc.desc Verify findIndex() leaves the underlying buffer byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(sharedBuffer, 0, 2);
      sourceArray[0] = 9n;
      sourceArray[1] = 18n;
      let bufferByteLengthBefore: int = sourceArray.buffer.byteLength;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 9n;
      });
      expect(result).assertEqual(0);
      expect(sourceArray.buffer.byteLength).assertEqual(bufferByteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0770
     * @tc.name testBigUint64ArrayFindIndex077
     * @tc.desc Verify findIndex() leaves the array writable after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 6n;
      });
      expect(result).assertEqual(1);
      sourceArray[0] = 77n;
      expect(sourceArray[0]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0780
     * @tc.name testBigUint64ArrayFindIndex078
     * @tc.desc Verify findIndex() leaves the array writable after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 999n;
      });
      expect(result).assertEqual(-1);
      sourceArray[1] = 88n;
      expect(sourceArray[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0790
     * @tc.name testBigUint64ArrayFindIndex079
     * @tc.desc Verify findIndex() leaves the shared ArrayBuffer readable via a new view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sharedBuffer, 0, 3);
      sourceArray[0] = 10n;
      sourceArray[1] = 20n;
      sourceArray[2] = 30n;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      let verifyView = new BigUint64Array(sharedBuffer, 0, 3);
      expect(result).assertEqual(1);
      expect(verifyView[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0800
     * @tc.name testBigUint64ArrayFindIndex080
     * @tc.desc Verify findIndex() on a subarray returns a view-relative index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subView = parentArray.subarray(1, 4);
      let result: int = subView.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 30n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0810
     * @tc.name testBigUint64ArrayFindIndex081
     * @tc.desc Verify findIndex() on a subarray leaves the parent element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let subView = parentArray.subarray(1, 3);
      let result: int = subView.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(result).assertEqual(1);
      expect(parentArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0820
     * @tc.name testBigUint64ArrayFindIndex082
     * @tc.desc Verify findIndex() on one shared-buffer view leaves the other view unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let firstView = new BigUint64Array(sharedBuffer, 0, 3);
      let secondView = new BigUint64Array(sharedBuffer, 0, 3);
      firstView[0] = 5n;
      firstView[1] = 10n;
      firstView[2] = 15n;
      let result: int = firstView.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 10n;
      });
      expect(result).assertEqual(1);
      expect(secondView[1]).assertEqual(10n);
      expect(secondView.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0830
     * @tc.name testBigUint64ArrayFindIndex083
     * @tc.desc Verify findIndex() on a subarray leaves the subarray length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subView = parentArray.subarray(0, 3);
      let lengthBefore: int = subView.length;
      let result: int = subView.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      expect(result).assertEqual(1);
      expect(subView.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0840
     * @tc.name testBigUint64ArrayFindIndex084
     * @tc.desc Verify findIndex() on a non-zero byteOffset view returns a view-relative index not buffer-absolute
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 4n;
      let offsetView = new BigUint64Array(sharedBuffer, 8, 2);
      let result: int = offsetView.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0850
     * @tc.name testBigUint64ArrayFindIndex085
     * @tc.desc Verify findIndex() on a subarray returns an index consistent with parent memory
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subView = parentArray.subarray(2, 5);
      let result: int = subView.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 40n;
      });
      expect(result).assertEqual(1);
      expect(subView[result]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0860
     * @tc.name testBigUint64ArrayFindIndex086
     * @tc.desc Verify findIndex() on a buffer-backed view leaves the buffer content unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sharedBuffer, 0, 3);
      sourceArray[0] = 100n;
      sourceArray[1] = 200n;
      sourceArray[2] = 300n;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 200n;
      });
      let verifyView = new BigUint64Array(sharedBuffer, 0, 3);
      expect(result).assertEqual(1);
      expect(verifyView[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0870
     * @tc.name testBigUint64ArrayFindIndex087
     * @tc.desc Verify findIndex() on a subarray leaves the subarray byteOffset unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subView = parentArray.subarray(1, 3);
      let offsetBefore: int = subView.byteOffset;
      let result: int = subView.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(result).assertEqual(1);
      expect(subView.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0880
     * @tc.name testBigUint64ArrayFindIndex088
     * @tc.desc Verify findIndex() callback element is unaffected by mutating the same index in-call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let firstOriginal: bigint = 0n;
      sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        firstOriginal = element;
        sourceArray[0] = 99n;
        return true;
      });
      expect(firstOriginal).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0890
     * @tc.name testBigUint64ArrayFindIndex089
     * @tc.desc Verify findIndex() callback observes a later element mutated in a prior iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let valueAfterMutation: bigint = 0n;
      sourceArray.findIndex((element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (index === 1) {
          sourceArray[2] = 999n;
          return false;
        }
        if (index === 2) {
          valueAfterMutation = element;
          return true;
        }
        return false;
      });
      expect(valueAfterMutation).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0900
     * @tc.name testBigUint64ArrayFindIndex090
     * @tc.desc Verify findIndex() callback mutation of a visited element does not change captured value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let preValue: bigint = 0n;
      let postValue: bigint = 0n;
      sourceArray.findIndex((element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (index === 0) {
          preValue = element;
          return false;
        }
        if (index === 1) {
          sourceArray[0] = 888n;
          postValue = sourceArray[0];
          return true;
        }
        return false;
      });
      expect(preValue).assertEqual(5n);
      expect(postValue).assertEqual(888n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0910
     * @tc.name testBigUint64ArrayFindIndex091
     * @tc.desc Verify findIndex() callback write to an unvisited element is observable later
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      let mutatedSeen: bigint = 0n;
      sourceArray.findIndex((element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (index === 0) {
          sourceArray[3] = 777n;
          return false;
        }
        if (index === 3) {
          mutatedSeen = element;
          return true;
        }
        return false;
      });
      expect(mutatedSeen).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0920
     * @tc.name testBigUint64ArrayFindIndex092
     * @tc.desc Verify findIndex() callback persists external BigInt state across invocations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let sum: bigint = 0n;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        sum = sum + element;
        return sum > 5n;
      });
      expect(result).assertEqual(1);
      expect(sum).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0930
     * @tc.name testBigUint64ArrayFindIndex093
     * @tc.desc Verify findIndex() callback writes the max value and a later read observes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([1n, 1n, 1n]);
      let seenMax: bigint = 0n;
      sourceArray.findIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (index === 0) {
          sourceArray[1] = maxUint64;
          return false;
        }
        if (index === 1) {
          seenMax = sourceArray[1];
          return true;
        }
        return false;
      });
      expect(seenMax).assertEqual(maxUint64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0940
     * @tc.name testBigUint64ArrayFindIndex094
     * @tc.desc Verify findIndex() predicate is a closure capturing an external int counter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 7n]);
      let accumulator: int = 0;
      let result: int = sourceArray.findIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        accumulator = accumulator + 1;
        return accumulator === 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0950
     * @tc.name testBigUint64ArrayFindIndex095
     * @tc.desc Verify findIndex() predicate is a closure reading an external BigInt threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let target: bigint = 6n;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === target;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0960
     * @tc.name testBigUint64ArrayFindIndex096
     * @tc.desc Verify findIndex() reuses the same lambda across two different instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arrayA = new BigUint64Array([1n, 2n, 3n]);
      let arrayB = new BigUint64Array([4n, 5n, 6n]);
      let sharedPredicate = (element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 5n;
      };
      let resultA: int = arrayA.findIndex(sharedPredicate);
      let resultB: int = arrayB.findIndex(sharedPredicate);
      expect(resultA).assertEqual(-1);
      expect(resultB).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0970
     * @tc.name testBigUint64ArrayFindIndex097
     * @tc.desc Verify findIndex() on an array built via BigUint64Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(3n, 7n, 11n);
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 7n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0980
     * @tc.name testBigUint64ArrayFindIndex098
     * @tc.desc Verify findIndex() on an array built via length constructor and index assignment
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = 5n;
      sourceArray[1] = 10n;
      sourceArray[2] = 15n;
      let result: int = sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 15n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_0990
     * @tc.name testBigUint64ArrayFindIndex099
     * @tc.desc Verify findIndex() on an array built via copy constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let originalArray = new BigUint64Array([12n, 24n, 36n]);
      let copiedArray = new BigUint64Array(originalArray);
      let result: int = copiedArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 24n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1000
     * @tc.name testBigUint64ArrayFindIndex100
     * @tc.desc Verify exception thrown inside the findIndex predicate propagates to the caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      try {
        sourceArray.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          if (element === 2n) {
            throw new Error('callback error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1010
     * @tc.name testBigUint64ArrayFindIndex101
     * @tc.desc Verify findIndex() propagates a first-call exception and invokes the callback once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.findIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          throw new Error('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1020
     * @tc.name testBigUint64ArrayFindIndex102
     * @tc.desc Verify findIndex() on an ArrayBuffer offset view uses local callback indices for the window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let baseView = new BigUint64Array(sharedBuffer);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      baseView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let windowView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let observedIndexSum: int = 0;
      let result: int = windowView.findIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        observedIndexSum = observedIndexSum + index;
        return array[index] === element && element === 30n;
      });
      expect(observedIndexSum).assertEqual(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1030
     * @tc.name testBigUint64ArrayFindIndex103
     * @tc.desc Verify findIndex() on a subarray observes parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let windowView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let result: int = windowView.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 90n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1040
     * @tc.name testBigUint64ArrayFindIndex104
     * @tc.desc Verify findIndex() propagates an exception thrown on the last callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.findIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 2) {
            throw new Error('last callback error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1050
     * @tc.name testBigUint64ArrayFindIndex105
     * @tc.desc Verify findIndex() on a nested byteOffset subarray uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let nestedWindow = offsetView.subarray(1, 4);
      let observedIndexSum: int = 0;
      let result: int = nestedWindow.findIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        observedIndexSum = observedIndexSum + index;
        return array[index] === element && index === 2;
      });
      expect(result).assertEqual(2);
      expect(observedIndexSum).assertEqual(3);
      expect(nestedWindow.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1060
     * @tc.name testBigUint64ArrayFindIndex106
     * @tc.desc Verify findIndex() on a slice copy from a byteOffset view does not observe later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let copiedValueIndex: int =
        sliceCopy.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 30n;
        });
      let sourceWriteIndex: int =
        sliceCopy.findIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 777n;
        });
      let differsFromSourceBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      expect(copiedValueIndex).assertEqual(0);
      expect(sourceWriteIndex).assertEqual(-1);
      expect(differsFromSourceBuffer).assertTrue();
      expect(fullView[2]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1070
     * @tc.name testBigUint64ArrayFindIndex107
     * @tc.desc Verify findIndex() on a zero-length byteOffset view returns negative one without invoking the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: int = zeroLengthView.findIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1080
     * @tc.name testBigUint64ArrayFindIndex108
     * @tc.desc Verify findIndex() on a Set source uses callback values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let callCount: int = 0;
      let result: int =
        sourceArray.findIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 11n && index === 1 && array.length === 3;
        });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1090
     * @tc.name testBigUint64ArrayFindIndex109
     * @tc.desc Verify findIndex() on an advanced iterator source uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let callCount: int = 0;
      let result: int =
        sourceArray.findIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 15n && index === 1 && array[0] === 10n;
        });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1100
     * @tc.name testBigUint64ArrayFindIndex110
     * @tc.desc Verify findIndex() short circuit prevents later callback side effects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let callCount: int = 0;
      let result: int =
        sourceArray.findIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 2) {
            array[0] = 99n;
          }
          return element === 4n;
        });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDINDEX_1110
     * @tc.name testBigUint64ArrayFindIndex111
     * @tc.desc Verify findIndex() observes an unvisited source value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindIndex111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLaterValue: bigint = 0n;
      let result: int = sourceView.findIndex((element: bigint, index: int,
        _array: BigUint64Array): boolean => {
        if (index === 0) {
          siblingView[0] = 9n;
        }
        if (index === 1) {
          observedLaterValue = element;
        }
        return element === 9n;
      });
      expect(result).assertEqual(1);
      expect(observedLaterValue).assertEqual(9n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });

  });
}
