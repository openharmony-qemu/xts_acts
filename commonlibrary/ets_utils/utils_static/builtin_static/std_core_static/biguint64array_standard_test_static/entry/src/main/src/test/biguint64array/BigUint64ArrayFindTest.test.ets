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


export default function biguint64arrayFindTest(): void {

  describe('BigUint64ArrayFindTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0010
     * @tc.name testBigUint64ArrayFind001
     * @tc.desc Verify find() returns the first element when predicate matches the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 10n;
        });
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0020
     * @tc.name testBigUint64ArrayFind002
     * @tc.desc Verify find() returns undefined when no element satisfies the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 99n;
        });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0030
     * @tc.name testBigUint64ArrayFind003
     * @tc.desc Verify find() returns the first element when predicate always returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([30n, 60n, 90n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return true;
        });
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0040
     * @tc.name testBigUint64ArrayFind004
     * @tc.desc Verify find() returns undefined when predicate always returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 100n, 150n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return false;
        });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0050
     * @tc.name testBigUint64ArrayFind005
     * @tc.desc Verify find() callback uses only the element parameter with no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 8n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 999n;
        });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0060
     * @tc.name testBigUint64ArrayFind006
     * @tc.desc Verify find() callback uses only the index parameter to match a specific index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 15n, 25n, 35n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index === 2;
        });
      expect(result).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0070
     * @tc.name testBigUint64ArrayFind007
     * @tc.desc Verify find() callback uses only the index parameter with no matching index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 1n, 1n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index > 100;
        });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0080
     * @tc.name testBigUint64ArrayFind008
     * @tc.desc Verify find() callback uses only the array parameter via array.length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, _index: int, array: BigUint64Array): boolean => {
          return array.length === 3;
        });
      expect(result).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0090
     * @tc.name testBigUint64ArrayFind009
     * @tc.desc Verify find() callback uses only the array parameter via a fixed index read
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, _index: int, array: BigUint64Array): boolean => {
          return array[1] === 14n;
        });
      expect(result).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0100
     * @tc.name testBigUint64ArrayFind010
     * @tc.desc Verify find() callback uses element and index in one predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 10n, 20n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index > 0 && element === BigInt(index) * 10n;
        });
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0110
     * @tc.name testBigUint64ArrayFind011
     * @tc.desc Verify find() callback uses element and array in one predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, array: BigUint64Array): boolean => {
          return element > array[0] && element < array[2];
        });
      expect(result).assertEqual(14n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0120
     * @tc.name testBigUint64ArrayFind012
     * @tc.desc Verify find() callback uses all three parameters in one predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n, 44n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, array: BigUint64Array): boolean => {
          return element > 20n && index > 0 && array[index] === element;
        });
      expect(result).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0130
     * @tc.name testBigUint64ArrayFind013
     * @tc.desc Verify find() returns the first element greater than a threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 50n, 90n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 40n;
        });
      expect(result).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0140
     * @tc.name testBigUint64ArrayFind014
     * @tc.desc Verify find() supports a negated comparison predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return !(element > 5n);
        });
      expect(result).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0150
     * @tc.name testBigUint64ArrayFind015
     * @tc.desc Verify find() returns undefined when all elements are below the closed range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element >= 10n && element <= 20n;
        });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0160
     * @tc.name testBigUint64ArrayFind016
     * @tc.desc Verify find() predicate can use BigInt addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 8n, 12n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element + 2n === 10n;
        });
      expect(result).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0170
     * @tc.name testBigUint64ArrayFind017
     * @tc.desc Verify find() predicate can use BigInt subtraction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 14n, 18n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element - 2n === 12n;
        });
      expect(result).assertEqual(14n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0180
     * @tc.name testBigUint64ArrayFind018
     * @tc.desc Verify find() predicate can use BigInt multiplication
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 3n, 4n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element * 3n === 9n;
        });
      expect(result).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0190
     * @tc.name testBigUint64ArrayFind019
     * @tc.desc Verify find() predicate can use BigInt division
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element / 10n === 2n;
        });
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0200
     * @tc.name testBigUint64ArrayFind020
     * @tc.desc Verify find() predicate can use BigInt remainder for even values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element % 2n === 0n;
        });
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0210
     * @tc.name testBigUint64ArrayFind021
     * @tc.desc Verify find() predicate can use BigInt remainder for odd values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element % 2n === 1n;
        });
      expect(result).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0220
     * @tc.name testBigUint64ArrayFind022
     * @tc.desc Verify find() predicate can use BigInt bitwise AND
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 6n, 7n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return (element & 1n) === 1n;
        });
      expect(result).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0230
     * @tc.name testBigUint64ArrayFind023
     * @tc.desc Verify find() predicate can use BigInt right shift
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 8n, 12n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element >> 1n === 4n;
        });
      expect(result).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0240
     * @tc.name testBigUint64ArrayFind024
     * @tc.desc Verify find() predicate can identify a power of two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 4n, 6n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return (element & (element - 1n)) === 0n;
        });
      expect(result).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0250
     * @tc.name testBigUint64ArrayFind025
     * @tc.desc Verify find() predicate can combine BigInt arithmetic with index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 20n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index > 0 && element - BigInt(index) * 10n === 0n;
        });
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0260
     * @tc.name testBigUint64ArrayFind026
     * @tc.desc Verify find() can match zero in a mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 0n, 10n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0270
     * @tc.name testBigUint64ArrayFind027
     * @tc.desc Verify find() can match the signed int64 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signedMaxValue: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([1n, signedMaxValue, 2n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === signedMaxValue;
        });
      expect(result).assertEqual(signedMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0280
     * @tc.name testBigUint64ArrayFind028
     * @tc.desc Verify find() can match a large ordinary BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let largeValue: bigint = 99999999n;
      let sourceArray = new BigUint64Array([1n, largeValue, 2n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === largeValue;
        });
      expect(result).assertEqual(largeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0290
     * @tc.name testBigUint64ArrayFind029
     * @tc.desc Verify find() returns undefined when all max values are searched for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value, maxUint64Value]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0300
     * @tc.name testBigUint64ArrayFind030
     * @tc.desc Verify find() can match zero after a max value without changing stored max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value, 0n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(0n);
      expect(sourceArray[0]).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0310
     * @tc.name testBigUint64ArrayFind031
     * @tc.desc Verify find() short-circuits before reading a trailing max value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([42n, maxUint64Value]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 42n;
        });
      expect(result).assertEqual(42n);
      expect(callCount).assertEqual(1);
      expect(sourceArray[1]).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0320
     * @tc.name testBigUint64ArrayFind032
     * @tc.desc Verify find() can find a normal value after a leading max value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64Value, 5n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 5n;
        });
      expect(result).assertEqual(5n);
      expect(sourceArray[0]).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0330
     * @tc.name testBigUint64ArrayFind033
     * @tc.desc Verify find() on an empty array returns undefined and skips the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return true;
        });
      expect(result).assertEqual(undefined);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0340
     * @tc.name testBigUint64ArrayFind034
     * @tc.desc Verify find() can match zero in a single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0350
     * @tc.name testBigUint64ArrayFind035
     * @tc.desc Verify find() returns undefined for a single element no-match array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element !== 42n;
        });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0360
     * @tc.name testBigUint64ArrayFind036
     * @tc.desc Verify find() can match a single ordinary element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 42n;
        });
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0370
     * @tc.name testBigUint64ArrayFind037
     * @tc.desc Verify find() returns the first element in a two element array when it matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 11n;
        });
      expect(result).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0380
     * @tc.name testBigUint64ArrayFind038
     * @tc.desc Verify find() returns the second element in a two element array when it matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 22n;
        });
      expect(result).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0390
     * @tc.name testBigUint64ArrayFind039
     * @tc.desc Verify find() returns the first element from an all-same array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 7n, 7n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 7n;
        });
      expect(result).assertEqual(7n);
      expect(sourceArray.indexOf(result!)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0400
     * @tc.name testBigUint64ArrayFind040
     * @tc.desc Verify find() returns the first matching duplicate value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 7n, 5n, 9n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 5n;
        });
      expect(result).assertEqual(5n);
      expect(sourceArray.indexOf(result!)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0410
     * @tc.name testBigUint64ArrayFind041
     * @tc.desc Verify find() invokes the callback once per element when no element matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return false;
        });
      expect(result).assertEqual(undefined);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0420
     * @tc.name testBigUint64ArrayFind042
     * @tc.desc Verify find() invokes the callback once for a single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 9n;
        });
      expect(result).assertEqual(9n);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0430
     * @tc.name testBigUint64ArrayFind043
     * @tc.desc Verify find() stops after the first element when it matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return true;
        });
      expect(result).assertEqual(1n);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0440
     * @tc.name testBigUint64ArrayFind044
     * @tc.desc Verify find() stops when a middle element matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 3n;
        });
      expect(result).assertEqual(3n);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0450
     * @tc.name testBigUint64ArrayFind045
     * @tc.desc Verify find() passes callback indexes in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let recordedIndices: int[] = [0, 0, 0];
      sourceArray.find((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        recordedIndices[index] = index;
        return false;
      });
      expect(recordedIndices[0]).assertEqual(0);
      expect(recordedIndices[1]).assertEqual(1);
      expect(recordedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0460
     * @tc.name testBigUint64ArrayFind046
     * @tc.desc Verify find() callback element equals array value at the same index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 8n, 12n]);
      let allElementsMatch: boolean = true;
      sourceArray.find((element: bigint, index: int, array: BigUint64Array): boolean => {
        if (element !== array[index]) {
          allElementsMatch = false;
        }
        return false;
      });
      expect(allElementsMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0470
     * @tc.name testBigUint64ArrayFind047
     * @tc.desc Verify find() invokes the callback length times when the last element matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 30n;
        });
      expect(result).assertEqual(30n);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0480
     * @tc.name testBigUint64ArrayFind048
     * @tc.desc Verify find() callback array parameter is the live source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, index: int, array: BigUint64Array): boolean => {
          if (index === 0) {
            array[1] = 77n;
            return false;
          }
          return array[index] === 77n;
        });
      expect(result).assertEqual(77n);
      expect(sourceArray[1]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0490
     * @tc.name testBigUint64ArrayFind049
     * @tc.desc Verify find() records ascending traversal order before a later match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let recordedIndices: int[] = [-1, -1, -1, -1];
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, _array: BigUint64Array): boolean => {
          recordedIndices[index] = index;
          return element === 30n;
        });
      expect(result).assertEqual(30n);
      expect(recordedIndices[0]).assertEqual(0);
      expect(recordedIndices[1]).assertEqual(1);
      expect(recordedIndices[2]).assertEqual(2);
      expect(recordedIndices[3]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0500
     * @tc.name testBigUint64ArrayFind050
     * @tc.desc Verify find() does not visit elements after a successful match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let visited: int[] = [0, 0, 0, 0];
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, _array: BigUint64Array): boolean => {
          visited[index] = 1;
          return element === 20n;
        });
      expect(result).assertEqual(20n);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(1);
      expect(visited[2]).assertEqual(0);
      expect(visited[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0510
     * @tc.name testBigUint64ArrayFind051
     * @tc.desc Verify find() performs zero accesses after a first element match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let visitedAfterMatch: boolean = false;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, _array: BigUint64Array): boolean => {
          if (index > 0) {
            visitedAfterMatch = true;
          }
          return element === 5n;
        });
      expect(result).assertEqual(5n);
      expect(visitedAfterMatch).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0520
     * @tc.name testBigUint64ArrayFind052
     * @tc.desc Verify find() callback element matches an external indexed read
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let elementMatch: boolean = true;
      sourceArray.find((element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (element !== sourceArray[index]) {
          elementMatch = false;
        }
        return false;
      });
      expect(elementMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0530
     * @tc.name testBigUint64ArrayFind053
     * @tc.desc Verify find() returned BigInt can be used in addition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let foundValue: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 15n;
        });
      let sum: bigint = foundValue! + 5n;
      expect(sum).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0540
     * @tc.name testBigUint64ArrayFind054
     * @tc.desc Verify find() can return the element at index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index === 0;
        });
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0550
     * @tc.name testBigUint64ArrayFind055
     * @tc.desc Verify find() can return the element at length minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 19n, 29n, 39n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, index: int, array: BigUint64Array): boolean => {
          return index === array.length - 1;
        });
      expect(result).assertEqual(39n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0560
     * @tc.name testBigUint64ArrayFind056
     * @tc.desc Verify find() returned BigInt can be converted to an exact string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 77n, 777n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 77n;
        });
      expect(result!.toString()).assertEqual('77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0570
     * @tc.name testBigUint64ArrayFind057
     * @tc.desc Verify find() returned value can be assigned to a BigInt variable after non-null assertion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([12n, 24n, 36n]);
      let foundValue: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 24n;
        });
      let assignedValue: bigint = foundValue!;
      expect(assignedValue).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0580
     * @tc.name testBigUint64ArrayFind058
     * @tc.desc Verify find() leaves length unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 8n, 12n]);
      let lengthBefore: int = sourceArray.length;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 8n;
        });
      expect(result).assertEqual(8n);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0590
     * @tc.name testBigUint64ArrayFind059
     * @tc.desc Verify find() leaves length unchanged after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let lengthBefore: int = sourceArray.length;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 999n;
        });
      expect(result).assertEqual(undefined);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0600
     * @tc.name testBigUint64ArrayFind060
     * @tc.desc Verify find() leaves empty array length at zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return true;
        });
      expect(result).assertEqual(undefined);
      expect(sourceArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0610
     * @tc.name testBigUint64ArrayFind061
     * @tc.desc Verify find() leaves byteLength unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let byteLengthBefore: int = sourceArray.byteLength;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 2n;
        });
      expect(result).assertEqual(2n);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0620
     * @tc.name testBigUint64ArrayFind062
     * @tc.desc Verify find() leaves byteLength equal to length times BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 5n;
        });
      expect(result).assertEqual(7n);
      expect(sourceArray.byteLength).assertEqual(sourceArray.length * sourceArray.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0630
     * @tc.name testBigUint64ArrayFind063
     * @tc.desc Verify find() leaves BYTES_PER_ELEMENT at 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 10n;
        });
      expect(result).assertEqual(10n);
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0640
     * @tc.name testBigUint64ArrayFind064
     * @tc.desc Verify find() leaves byteOffset unchanged on a nonzero offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buffer);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 4n;
      let offsetView = new BigUint64Array(buffer, 8, 2);
      let byteOffsetBefore: int = offsetView.byteOffset;
      let result: bigint | undefined =
        offsetView.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 3n;
        });
      expect(result).assertEqual(3n);
      expect(offsetView.byteOffset).assertEqual(byteOffsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0650
     * @tc.name testBigUint64ArrayFind065
     * @tc.desc Verify find() leaves the first element unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([12n, 24n, 36n]);
      let firstElementBefore: bigint = sourceArray[0];
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 24n;
        });
      expect(result).assertEqual(24n);
      expect(sourceArray[0]).assertEqual(firstElementBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0660
     * @tc.name testBigUint64ArrayFind066
     * @tc.desc Verify find() leaves the last element unchanged after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n]);
      let lastIndex: int = sourceArray.length - 1;
      let lastElementBefore: bigint = sourceArray[lastIndex];
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(undefined);
      expect(sourceArray[lastIndex]).assertEqual(lastElementBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0670
     * @tc.name testBigUint64ArrayFind067
     * @tc.desc Verify find() leaves all elements unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 18n, 27n]);
      let copiedValues: bigint[] = [sourceArray[0], sourceArray[1], sourceArray[2]];
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 10n;
        });
      expect(result).assertEqual(18n);
      expect(sourceArray[0]).assertEqual(copiedValues[0]);
      expect(sourceArray[1]).assertEqual(copiedValues[1]);
      expect(sourceArray[2]).assertEqual(copiedValues[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0680
     * @tc.name testBigUint64ArrayFind068
     * @tc.desc Verify find() leaves all elements unchanged after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([31n, 62n, 93n]);
      let copiedValues: bigint[] = [sourceArray[0], sourceArray[1], sourceArray[2]];
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(undefined);
      expect(sourceArray[0]).assertEqual(copiedValues[0]);
      expect(sourceArray[1]).assertEqual(copiedValues[1]);
      expect(sourceArray[2]).assertEqual(copiedValues[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0690
     * @tc.name testBigUint64ArrayFind069
     * @tc.desc Verify repeated find() calls with the same predicate return the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let firstResult: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 150n;
        });
      let secondResult: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 150n;
        });
      expect(firstResult).assertEqual(200n);
      expect(secondResult).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0700
     * @tc.name testBigUint64ArrayFind070
     * @tc.desc Verify different find() predicates return their independent matched values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 100n, 150n]);
      let firstResult: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 75n;
        });
      let secondResult: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 125n;
        });
      expect(firstResult).assertEqual(100n);
      expect(secondResult).assertEqual(150n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0710
     * @tc.name testBigUint64ArrayFind071
     * @tc.desc Verify find() leaves the underlying buffer byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer);
      sourceArray[0] = 5n;
      sourceArray[1] = 10n;
      sourceArray[2] = 15n;
      let bufferLengthBefore: int = sourceArray.buffer.byteLength;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 10n;
        });
      expect(result).assertEqual(10n);
      expect(sourceArray.buffer.byteLength).assertEqual(bufferLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0720
     * @tc.name testBigUint64ArrayFind072
     * @tc.desc Verify array remains writable after find() returns a matched element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 4n;
        });
      sourceArray[2] = 600n;
      expect(result).assertEqual(4n);
      expect(sourceArray[2]).assertEqual(600n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0730
     * @tc.name testBigUint64ArrayFind073
     * @tc.desc Verify array remains writable after find() returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 100n;
        });
      sourceArray[1] = 400n;
      expect(result).assertEqual(undefined);
      expect(sourceArray[1]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0740
     * @tc.name testBigUint64ArrayFind074
     * @tc.desc Verify shared ArrayBuffer can be read through a new view after find()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer);
      sourceArray[0] = 9n;
      sourceArray[1] = 18n;
      sourceArray[2] = 27n;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 15n;
        });
      let verifyView = new BigUint64Array(buffer);
      expect(result).assertEqual(18n);
      expect(verifyView[0]).assertEqual(9n);
      expect(verifyView[1]).assertEqual(18n);
      expect(verifyView[2]).assertEqual(27n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0750
     * @tc.name testBigUint64ArrayFind075
     * @tc.desc Verify find() on a subarray returns an element from the subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let subarrayView = sourceArray.subarray(0, 3);
      let result: bigint | undefined =
        subarrayView.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 15n;
        });
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0760
     * @tc.name testBigUint64ArrayFind076
     * @tc.desc Verify find() on a subarray leaves parent elements unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([6n, 12n, 18n, 24n]);
      let subarrayView = sourceArray.subarray(1, 3);
      let result: bigint | undefined =
        subarrayView.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 12n;
        });
      expect(result).assertEqual(12n);
      expect(sourceArray[0]).assertEqual(6n);
      expect(sourceArray[1]).assertEqual(12n);
      expect(sourceArray[2]).assertEqual(18n);
      expect(sourceArray[3]).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0770
     * @tc.name testBigUint64ArrayFind077
     * @tc.desc Verify find() on one view does not change another view over the same buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let firstView = new BigUint64Array(buffer, 0, 2);
      let secondView = new BigUint64Array(buffer, 16, 2);
      firstView[0] = 1n;
      firstView[1] = 2n;
      secondView[0] = 3n;
      secondView[1] = 4n;
      let result: bigint | undefined =
        firstView.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 2n;
        });
      expect(result).assertEqual(2n);
      expect(secondView[0]).assertEqual(3n);
      expect(secondView[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0780
     * @tc.name testBigUint64ArrayFind078
     * @tc.desc Verify find() on a subarray leaves subarray length unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subarrayView = sourceArray.subarray(1, 4);
      let lengthBefore: int = subarrayView.length;
      let result: bigint | undefined =
        subarrayView.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 3n;
        });
      expect(result).assertEqual(3n);
      expect(subarrayView.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0790
     * @tc.name testBigUint64ArrayFind079
     * @tc.desc Verify find() on a nonzero byteOffset view returns a view element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buffer);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      fullView[3] = 400n;
      let offsetView = new BigUint64Array(buffer, 8, 3);
      let result: bigint | undefined =
        offsetView.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 250n;
        });
      expect(result).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0800
     * @tc.name testBigUint64ArrayFind080
     * @tc.desc Verify find() subarray callback sees index zero as the subarray start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let subarrayView = sourceArray.subarray(2, 4);
      let firstElementCorrect: boolean = true;
      subarrayView.find((_element: bigint, index: int, array: BigUint64Array): boolean => {
        if (index === 0 && array[0] !== 30n) {
          firstElementCorrect = false;
        }
        return false;
      });
      expect(firstElementCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0810
     * @tc.name testBigUint64ArrayFind081
     * @tc.desc Verify find() on an ArrayBuffer view leaves buffer content unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer);
      sourceArray[0] = 9n;
      sourceArray[1] = 18n;
      sourceArray[2] = 27n;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 15n;
        });
      let verifyView = new BigUint64Array(buffer);
      expect(result).assertEqual(18n);
      expect(verifyView[0]).assertEqual(9n);
      expect(verifyView[1]).assertEqual(18n);
      expect(verifyView[2]).assertEqual(27n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0820
     * @tc.name testBigUint64ArrayFind082
     * @tc.desc Verify find() callback array metadata matches a nonzero byteOffset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buffer);
      fullView[0] = 5n;
      fullView[1] = 10n;
      fullView[2] = 15n;
      fullView[3] = 20n;
      let offsetView = new BigUint64Array(buffer, 8, 2);
      let byteOffsetMatches: boolean = true;
      let byteLengthMatches: boolean = true;
      offsetView.find((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        if (array.byteOffset !== offsetView.byteOffset) {
          byteOffsetMatches = false;
        }
        if (array.byteLength !== offsetView.byteLength) {
          byteLengthMatches = false;
        }
        return false;
      });
      expect(byteOffsetMatches).assertTrue();
      expect(byteLengthMatches).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0830
     * @tc.name testBigUint64ArrayFind083
     * @tc.desc Verify find() returns the current callback value even when the source slot is changed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, array: BigUint64Array): boolean => {
          if (index === 0) {
            array[0] = 9n;
          }
          return true;
        });
      expect(result).assertEqual(1n);
      expect(sourceArray[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0840
     * @tc.name testBigUint64ArrayFind084
     * @tc.desc Verify find() observes a callback mutation of a later element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, index: int, array: BigUint64Array): boolean => {
          if (index === 0) {
            array[1] = 99n;
            return false;
          }
          return array[index] === 99n;
        });
      expect(result).assertEqual(99n);
      expect(sourceArray[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0850
     * @tc.name testBigUint64ArrayFind085
     * @tc.desc Verify find() callback mutation of a visited element does not change captured value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let capturedValue: bigint = 0n;
      sourceArray.find((element: bigint, index: int, array: BigUint64Array): boolean => {
        if (index === 1) {
          capturedValue = element;
          array[0] = 99n;
        }
        return false;
      });
      expect(capturedValue).assertEqual(2n);
      expect(sourceArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0860
     * @tc.name testBigUint64ArrayFind086
     * @tc.desc Verify find() callback write to an unvisited element is observable later
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, index: int, array: BigUint64Array): boolean => {
          if (index === 1) {
            array[3] = 88n;
          }
          return array[index] === 88n;
        });
      expect(result).assertEqual(88n);
      expect(sourceArray[3]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0870
     * @tc.name testBigUint64ArrayFind087
     * @tc.desc Verify find() callback can accumulate external BigInt state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n, 28n]);
      let accumulatedValue: bigint = 0n;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          accumulatedValue = accumulatedValue + element;
          return false;
        });
      expect(result).assertEqual(undefined);
      expect(accumulatedValue).assertEqual(70n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0880
     * @tc.name testBigUint64ArrayFind088
     * @tc.desc Verify find() callback can write a max value and preserve it in the source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64Value: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([1n, 2n]);
      let result: bigint | undefined =
        sourceArray.find((_element: bigint, index: int, array: BigUint64Array): boolean => {
          if (index === 0) {
            array[1] = maxUint64Value;
          }
          return false;
        });
      expect(result).assertEqual(undefined);
      expect(sourceArray[1]).assertEqual(maxUint64Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0890
     * @tc.name testBigUint64ArrayFind089
     * @tc.desc Verify find() predicate closure can capture an external counter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 2n;
        });
      expect(result).assertEqual(2n);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0900
     * @tc.name testBigUint64ArrayFind090
     * @tc.desc Verify find() predicate closure can read an external BigInt threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 18n, 7n, 22n]);
      let threshold: bigint = 15n;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > threshold;
        });
      expect(result).assertEqual(18n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0910
     * @tc.name testBigUint64ArrayFind091
     * @tc.desc Verify the same find() predicate can be reused by two different instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arrayA = new BigUint64Array([1n, 2n, 3n]);
      let arrayB = new BigUint64Array([6n, 8n, 10n]);
      let sharedPredicate: (element: bigint, index: int, array: BigUint64Array) => boolean =
        (element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 7n;
        };
      let resultA: bigint | undefined = arrayA.find(sharedPredicate);
      let resultB: bigint | undefined = arrayB.find(sharedPredicate);
      expect(resultA).assertEqual(undefined);
      expect(resultB).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0920
     * @tc.name testBigUint64ArrayFind092
     * @tc.desc Verify find() on an array built via BigUint64Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(3n, 7n, 11n);
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 7n;
        });
      expect(result).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0930
     * @tc.name testBigUint64ArrayFind093
     * @tc.desc Verify find() on an array built via length constructor and index assignment
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = 5n;
      sourceArray[1] = 10n;
      sourceArray[2] = 15n;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 15n;
        });
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0940
     * @tc.name testBigUint64ArrayFind094
     * @tc.desc Verify find() on an array built via copy constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let originalArray = new BigUint64Array([12n, 24n, 36n]);
      let copiedArray = new BigUint64Array(originalArray);
      let result: bigint | undefined =
        copiedArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 24n;
        });
      expect(result).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0950
     * @tc.name testBigUint64ArrayFind095
     * @tc.desc Verify exception thrown inside the find() predicate propagates to the caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      try {
        sourceArray.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          if (element === 2n) {
            throw new Error('callback error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0960
     * @tc.name testBigUint64ArrayFind096
     * @tc.desc Verify find() propagates a first-call exception and invokes the callback once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.find((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0970
     * @tc.name testBigUint64ArrayFind097
     * @tc.desc Verify find() on an ArrayBuffer offset view uses local callback indices for the window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: bigint | undefined =
        windowView.find((element: bigint, index: int, array: BigUint64Array): boolean => {
          observedIndexSum = observedIndexSum + index;
          return array[index] === element && index === 1;
        });
      expect(observedIndexSum).assertEqual(1);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0980
     * @tc.name testBigUint64ArrayFind098
     * @tc.desc Verify find() on a subarray observes parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let windowView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let result: bigint | undefined =
        windowView.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element >= 90n;
        });
      expect(result).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_0990
     * @tc.name testBigUint64ArrayFind099
     * @tc.desc Verify find() propagates an exception thrown on the last callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.find((_element: bigint, index: int, _array: BigUint64Array): boolean => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_1000
     * @tc.name testBigUint64ArrayFind100
     * @tc.desc Verify find() on a nested byteOffset subarray uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: bigint | undefined =
        nestedWindow.find((element: bigint, index: int, array: BigUint64Array): boolean => {
          observedIndexSum = observedIndexSum + index;
          return array[index] === element && index === 2;
        });
      expect(result).assertEqual(50n);
      expect(observedIndexSum).assertEqual(3);
      expect(nestedWindow.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_1010
     * @tc.name testBigUint64ArrayFind101
     * @tc.desc Verify find() on a slice copy from a byteOffset view does not observe later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let copiedValueResult: bigint | undefined =
        sliceCopy.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 30n;
        });
      let sourceWriteResult: bigint | undefined =
        sliceCopy.find((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 777n;
        });
      let differsFromSourceBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      expect(copiedValueResult).assertEqual(30n);
      expect(sourceWriteResult).assertEqual(undefined);
      expect(differsFromSourceBuffer).assertTrue();
      expect(fullView[2]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_1020
     * @tc.name testBigUint64ArrayFind102
     * @tc.desc Verify find() on a zero-length byteOffset view returns undefined without invoking the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: bigint | undefined =
        zeroLengthView.find((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return true;
        });
      expect(result).assertEqual(undefined);
      expect(callCount).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_1030
     * @tc.name testBigUint64ArrayFind103
     * @tc.desc Verify find() on a Set source uses callback values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 11n && index === 1 && array.length === 3;
        });
      expect(result).assertEqual(11n);
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_1040
     * @tc.name testBigUint64ArrayFind104
     * @tc.desc Verify find() on an advanced iterator source uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 15n && index === 1 && array[0] === 10n;
        });
      expect(result).assertEqual(15n);
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_1050
     * @tc.name testBigUint64ArrayFind105
     * @tc.desc Verify find() short circuit prevents later callback side effects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.find((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 2) {
            array[0] = 99n;
          }
          return element === 4n;
        });
      expect(result).assertEqual(4n);
      expect(callCount).assertEqual(2);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FIND_1060
     * @tc.name testBigUint64ArrayFind106
     * @tc.desc Verify find() observes an unvisited source value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFind106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLaterValue: bigint = 0n;
      let result: bigint | undefined =
        sourceView.find((element: bigint, index: int, _array: BigUint64Array): boolean => {
          if (index === 0) {
            siblingView[0] = 9n;
          }
          if (index === 1) {
            observedLaterValue = element;
          }
          return element === 9n;
        });
      expect(observedLaterValue).assertEqual(9n);
      expect(result).assertEqual(9n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });

  });
}
