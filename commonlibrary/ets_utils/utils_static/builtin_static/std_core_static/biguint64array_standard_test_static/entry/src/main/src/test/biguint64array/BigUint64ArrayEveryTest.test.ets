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

export default function biguint64arrayEveryTest(): void {

  describe('BigUint64ArrayEveryTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0010
     * @tc.name testBigUint64ArrayEvery001
     * @tc.desc Verify every() with a predicate that always returns true yields true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: boolean = sourceArray.every((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0020
     * @tc.name testBigUint64ArrayEvery002
     * @tc.desc Verify every() with a predicate that always returns false triggers early exit after first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.every((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return false;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0030
     * @tc.name testBigUint64ArrayEvery003
     * @tc.desc Verify every() with a predicate comparing element greater than threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 60n, 70n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 40n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0040
     * @tc.name testBigUint64ArrayEvery004
     * @tc.desc Verify every() with a zero-parameter predicate that always returns false triggers early exit after first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n, 100n, 101n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.every((): boolean => {
        callCount++;
        return false;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0050
     * @tc.name testBigUint64ArrayEvery005
     * @tc.desc Verify every() predicate declaring element and index verifies specific values at each position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 60n, 70n]);
      let result: boolean = sourceArray.every((element: bigint, index: int): boolean => {
        if (index === 0) {
          return element === 50n;
        }
        if (index === 1) {
          return element === 60n;
        }
        return element === 70n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0060
     * @tc.name testBigUint64ArrayEvery006
     * @tc.desc Verify every() predicate declaring three parameters cross-verifies array[index] equals element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let result: boolean = sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        return array[index] === element;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0070
     * @tc.name testBigUint64ArrayEvery007
     * @tc.desc Verify every() predicate using only the index parameter confirms all indices are within valid range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result: boolean = sourceArray.every((_element: bigint, index: int): boolean => {
        return index >= 0 && index < 4;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0080
     * @tc.name testBigUint64ArrayEvery008
     * @tc.desc Verify every() predicate using only the array parameter checks the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let result: boolean = sourceArray.every((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        return array.length === 3;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0090
     * @tc.name testBigUint64ArrayEvery009
     * @tc.desc Verify every() predicate using element and index confirms element equals (index+1)*7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let result: boolean = sourceArray.every((element: bigint, index: int): boolean => {
        return element === BigInt((index + 1) * 7);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0100
     * @tc.name testBigUint64ArrayEvery010
     * @tc.desc Verify every() predicate using element and array confirms element equals array[index]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: boolean = sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        return element === array[index];
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0110
     * @tc.name testBigUint64ArrayEvery011
     * @tc.desc Verify every() predicate using index and array confirms array[index] matches expected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 60n, 70n]);
      let expectedValues: bigint[] = [50n, 60n, 70n];
      let result: boolean = sourceArray.every((_element: bigint, index: int, array: BigUint64Array): boolean => {
        return array[index] === expectedValues[index];
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0120
     * @tc.name testBigUint64ArrayEvery012
     * @tc.desc Verify every() predicate using all three parameters cross-validates element array and index consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n]);
      let result: boolean = sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        return element === array[index] && index >= 0 && index < array.length;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0130
     * @tc.name testBigUint64ArrayEvery013
     * @tc.desc Verify every() with all elements equal to 0n passes predicate checking equality with 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0140
     * @tc.name testBigUint64ArrayEvery014
     * @tc.desc Verify every() with all elements equal to a large bigint value 1000000000000000000n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let largeValue: bigint = 1000000000000000000n;
      let sourceArray = new BigUint64Array([largeValue, largeValue]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === largeValue;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0150
     * @tc.name testBigUint64ArrayEvery015
     * @tc.desc Verify every() with all elements equal to 1n the minimum positive bigint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 1n, 1n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0160
     * @tc.name testBigUint64ArrayEvery016
     * @tc.desc Verify every() with all elements equal to the regular value 42n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n, 42n, 42n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 42n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0170
     * @tc.name testBigUint64ArrayEvery017
     * @tc.desc Verify every() with elements equal to 9223372036854775807n the signed int64 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signedMax: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([signedMax, signedMax]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === signedMax;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0180
     * @tc.name testBigUint64ArrayEvery018
     * @tc.desc Verify every() on an all-zero array with all elements >= 0n returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 0n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0190
     * @tc.name testBigUint64ArrayEvery019
     * @tc.desc Verify every() on an all-uint64-max array with <= max returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, maxUint64, maxUint64]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element <= maxUint64;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0200
     * @tc.name testBigUint64ArrayEvery020
     * @tc.desc Verify every() on assorted uint64 values where all elements are >= 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 42n, 1000n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 0n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0210
     * @tc.name testBigUint64ArrayEvery021
     * @tc.desc Verify every() callback first index argument equals 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([6n, 7n, 8n]);
      let firstIndex: int = -1;
      sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (firstIndex < 0) {
          firstIndex = index;
        }
        return true;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0220
     * @tc.name testBigUint64ArrayEvery022
     * @tc.desc Verify every() callback last index argument equals length minus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let lastIndex: int = -1;
      sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        lastIndex = index;
        return true;
      });
      expect(lastIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0230
     * @tc.name testBigUint64ArrayEvery023
     * @tc.desc Verify every() callback indices increment strictly by 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 8n, 7n, 6n]);
      let prevIndex: int = -1;
      let result: boolean = sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        let isSequential: boolean = index === prevIndex + 1;
        prevIndex = index;
        return isSequential;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0240
     * @tc.name testBigUint64ArrayEvery024
     * @tc.desc Verify every() callback index is always strictly less than array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result: boolean = sourceArray.every((_element: bigint, index: int, array: BigUint64Array): boolean => {
        return index < array.length;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0250
     * @tc.name testBigUint64ArrayEvery025
     * @tc.desc Verify every() callback index is a valid integer by accumulating indices to confirm sum of 0+1+2 = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 4n, 5n]);
      let indexSum: int = 0;
      sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        indexSum = indexSum + index;
        return true;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0260
     * @tc.name testBigUint64ArrayEvery026
     * @tc.desc Verify every() callback array parameter references the original array with correct element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([70n, 80n, 90n]);
      let result: boolean = sourceArray.every((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        return array[0] === 70n && array[2] === 90n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0270
     * @tc.name testBigUint64ArrayEvery027
     * @tc.desc Verify every() callback array parameter length matches the original array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let result: boolean = sourceArray.every((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        return array.length === 4;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0280
     * @tc.name testBigUint64ArrayEvery028
     * @tc.desc Verify every() callback confirms array[index] equals element for all positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([15n, 30n, 45n]);
      let result: boolean = sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        return array[index] === element;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0290
     * @tc.name testBigUint64ArrayEvery029
     * @tc.desc Verify every() callback array parameter shares identical length and byteLength properties with source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let allElementsMatch: boolean =
        sourceArray.every((_element: bigint, _index: int, array: BigUint64Array): boolean => {
          return array.length === sourceArray.length && array.byteLength === sourceArray.byteLength;
        });
      expect(allElementsMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0300
     * @tc.name testBigUint64ArrayEvery030
     * @tc.desc Verify every() on empty array with predicate always true returns true and callback is never called
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      let result: boolean = sourceArray.every((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0310
     * @tc.name testBigUint64ArrayEvery031
     * @tc.desc Verify every() on a single-element array with predicate returning true yields true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 99n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0320
     * @tc.name testBigUint64ArrayEvery032
     * @tc.desc Verify every() on a single-element array with predicate returning false yields false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element !== 99n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0330
     * @tc.name testBigUint64ArrayEvery033
     * @tc.desc Verify every() on a two-element array where both elements pass returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 100n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0340
     * @tc.name testBigUint64ArrayEvery034
     * @tc.desc Verify every() early exit when first element fails in a two-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      let visitedIndices: int[] = [];
      let result: boolean = sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        visitedIndices.push(index);
        return index !== 0;
      });
      expect(result).assertFalse();
      expect(visitedIndices.length).assertEqual(1);
      expect(visitedIndices[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0350
     * @tc.name testBigUint64ArrayEvery035
     * @tc.desc Verify every() checks both elements when first passes and second fails in a two-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return element < 20n;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0360
     * @tc.name testBigUint64ArrayEvery036
     * @tc.desc Verify every() early exit when first element fails in a three-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return element >= 2n;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0370
     * @tc.name testBigUint64ArrayEvery037
     * @tc.desc Verify every() stops at the second element when it fails in a three-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let visitedIndices: int[] = [];
      let result: boolean = sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        visitedIndices.push(index);
        return index < 1;
      });
      expect(result).assertFalse();
      expect(visitedIndices.length).assertEqual(2);
      expect(visitedIndices[0]).assertEqual(0);
      expect(visitedIndices[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0380
     * @tc.name testBigUint64ArrayEvery038
     * @tc.desc Verify every() checks all three elements when only the last element fails
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return element <= 10n;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0390
     * @tc.name testBigUint64ArrayEvery039
     * @tc.desc Verify every() on a five-element array where all pass invokes the callback exactly five times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n, 10n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return element % 2n === 0n;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0400
     * @tc.name testBigUint64ArrayEvery040
     * @tc.desc Verify every() predicate reads an external threshold variable via closure
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 8n, 9n]);
      let threshold: bigint = 6n;
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > threshold;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0410
     * @tc.name testBigUint64ArrayEvery041
     * @tc.desc Verify every() predicate modifies an external counter and total call count equals array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let callCount: int = 0;
      sourceArray.every((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return true;
      });
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0420
     * @tc.name testBigUint64ArrayEvery042
     * @tc.desc Verify every() early exit updates external state only up to the failing index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let lastCheckedIndex: int = -1;
      sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        lastCheckedIndex = index;
        return index < 2;
      });
      expect(lastCheckedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0430
     * @tc.name testBigUint64ArrayEvery043
     * @tc.desc Verify every() predicate accumulates all visited element values in external array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let seenElements: bigint[] = [];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        seenElements.push(element);
        return true;
      });
      expect(seenElements[0]).assertEqual(10n);
      expect(seenElements[1]).assertEqual(20n);
      expect(seenElements[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0440
     * @tc.name testBigUint64ArrayEvery044
     * @tc.desc Verify every() predicate using AND combines lower and upper bound checks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([15n, 20n, 25n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 10n && element < 30n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0450
     * @tc.name testBigUint64ArrayEvery045
     * @tc.desc Verify every() predicate using OR confirms each element matches at least one option
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n || element === 6n || element === 9n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0460
     * @tc.name testBigUint64ArrayEvery046
     * @tc.desc Verify every() predicate using compound AND plus OR checks element is in range or equals zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 50n, 99n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return (element >= 10n && element <= 99n) || element === 0n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0470
     * @tc.name testBigUint64ArrayEvery047
     * @tc.desc Verify every() callback element parameter has runtime typeof bigint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return typeof element === 'bigint';
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0480
     * @tc.name testBigUint64ArrayEvery048
     * @tc.desc Verify every() on empty array constructed with no-argument constructor returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array();
      let result: boolean = sourceArray.every((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0490
     * @tc.name testBigUint64ArrayEvery049
     * @tc.desc Verify every() on empty subarray created via subarray(begin, begin) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let emptySubarray = sourceArray.subarray(1, 1);
      let result: boolean = emptySubarray.every((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0500
     * @tc.name testBigUint64ArrayEvery050
     * @tc.desc Verify every() on empty slice created via slice(0, 0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let emptySlice = sourceArray.slice(0, 0);
      let result: boolean = emptySlice.every((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0510
     * @tc.name testBigUint64ArrayEvery051
     * @tc.desc Verify every() with index-based predicate all pass returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let result: boolean = sourceArray.every((element: bigint, index: int, _array: BigUint64Array): boolean => {
        return BigInt(index) === element;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0520
     * @tc.name testBigUint64ArrayEvery052
     * @tc.desc Verify every() with array-reference predicate confirms callback array param is the original instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: boolean = sourceArray.every((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        return array === sourceArray;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0530
     * @tc.name testBigUint64ArrayEvery053
     * @tc.desc Verify every() on all-even array with modulo-2 check returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 2n, 4n, 6n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 2n === 0n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0540
     * @tc.name testBigUint64ArrayEvery054
     * @tc.desc Verify every() on mixed values with all > 0n returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 42n, 99999999n, 1000000n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0550
     * @tc.name testBigUint64ArrayEvery055
     * @tc.desc Verify every() returns false when array contains 0n and predicate requires > 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0560
     * @tc.name testBigUint64ArrayEvery056
     * @tc.desc Verify every() stops after uint64 max element fails greater-than-max check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, 0n]);
      let visitedIndices: int[] = [];
      let result: boolean = sourceArray.every((element: bigint, index: int, _array: BigUint64Array): boolean => {
        visitedIndices.push(index);
        return element > maxUint64;
      });
      expect(result).assertFalse();
      expect(visitedIndices.length).assertEqual(1);
      expect(visitedIndices[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0570
     * @tc.name testBigUint64ArrayEvery057
     * @tc.desc Verify every() returns false when the third of five elements fails the check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 5n, 30n, 40n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 10n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0580
     * @tc.name testBigUint64ArrayEvery058
     * @tc.desc Verify every() returns false when the last of five elements fails the check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 5n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 10n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0590
     * @tc.name testBigUint64ArrayEvery059
     * @tc.desc Verify every() returns false when all elements are equal but predicate requires not-equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 7n, 7n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element !== 7n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0600
     * @tc.name testBigUint64ArrayEvery060
     * @tc.desc Verify every() returns false when mixed values contain one element failing > 0n check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 0n, 42n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0610
     * @tc.name testBigUint64ArrayEvery061
     * @tc.desc Verify every() stops before max element when normal value fails equals-max check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([42n, maxUint64]);
      let visitedIndices: int[] = [];
      let result: boolean = sourceArray.every((element: bigint, index: int, _array: BigUint64Array): boolean => {
        visitedIndices.push(index);
        return element === maxUint64;
      });
      expect(result).assertFalse();
      expect(visitedIndices.length).assertEqual(1);
      expect(visitedIndices[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0620
     * @tc.name testBigUint64ArrayEvery062
     * @tc.desc Verify every() returns false when an odd element appears in an even-number check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 2n, 3n, 4n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 2n === 0n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0630
     * @tc.name testBigUint64ArrayEvery063
     * @tc.desc Verify every() returns false when the last index fails an index-based assertion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let result: boolean = sourceArray.every((element: bigint, index: int, _array: BigUint64Array): boolean => {
        return BigInt(index) === element && index < 2;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0640
     * @tc.name testBigUint64ArrayEvery064
     * @tc.desc Verify array length is unchanged after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let savedLength: int = sourceArray.length;
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.length).assertEqual(savedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0650
     * @tc.name testBigUint64ArrayEvery065
     * @tc.desc Verify array length is unchanged after every() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let savedLength: int = sourceArray.length;
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 5n;
      });
      expect(sourceArray.length).assertEqual(savedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0660
     * @tc.name testBigUint64ArrayEvery066
     * @tc.desc Verify empty array length remains 0 after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.length).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0670
     * @tc.name testBigUint64ArrayEvery067
     * @tc.desc Verify single-element array length remains 1 after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(sourceArray.length).assertEqual(1 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0680
     * @tc.name testBigUint64ArrayEvery068
     * @tc.desc Verify single-element array length remains 1 after every() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(sourceArray.length).assertEqual(1 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0690
     * @tc.name testBigUint64ArrayEvery069
     * @tc.desc Verify calling every() twice on the same array yields identical results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let firstResult: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      let secondResult: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0700
     * @tc.name testBigUint64ArrayEvery070
     * @tc.desc Verify array byteLength is unchanged after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let savedByteLength: int = sourceArray.byteLength;
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.byteLength).assertEqual(savedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0710
     * @tc.name testBigUint64ArrayEvery071
     * @tc.desc Verify array byteLength is unchanged after every() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let savedByteLength: int = sourceArray.byteLength;
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 5n;
      });
      expect(sourceArray.byteLength).assertEqual(savedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0720
     * @tc.name testBigUint64ArrayEvery072
     * @tc.desc Verify empty array byteLength remains 0 after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.byteLength).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0730
     * @tc.name testBigUint64ArrayEvery073
     * @tc.desc Verify single-element array byteLength remains 8 after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n]);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(sourceArray.byteLength).assertEqual(8 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0740
     * @tc.name testBigUint64ArrayEvery074
     * @tc.desc Verify multi-element array byteLength equals length times 8 after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let expectedByteLength: int = sourceArray.length * 8;
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.byteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0750
     * @tc.name testBigUint64ArrayEvery075
     * @tc.desc Verify BYTES_PER_ELEMENT remains 8 after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0760
     * @tc.name testBigUint64ArrayEvery076
     * @tc.desc Verify BYTES_PER_ELEMENT remains 8 after every() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 5n;
      });
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0770
     * @tc.name testBigUint64ArrayEvery077
     * @tc.desc Verify empty array BYTES_PER_ELEMENT remains 8 after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0780
     * @tc.name testBigUint64ArrayEvery078
     * @tc.desc Verify BYTES_PER_ELEMENT is invariant before and after every() call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n]);
      let savedBPE: int = sourceArray.BYTES_PER_ELEMENT;
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 100n;
      });
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(savedBPE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0790
     * @tc.name testBigUint64ArrayEvery079
     * @tc.desc Verify directly constructed array byteOffset remains 0 after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.byteOffset).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0800
     * @tc.name testBigUint64ArrayEvery080
     * @tc.desc Verify ArrayBuffer view byteOffset is unchanged after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer, 8, 2);
      let savedOffset: int = sourceArray.byteOffset;
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 0n;
      });
      expect(sourceArray.byteOffset).assertEqual(savedOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0810
     * @tc.name testBigUint64ArrayEvery081
     * @tc.desc Verify subarray byteOffset is unchanged after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subView = sourceArray.subarray(1, 4);
      let savedOffset: int = subView.byteOffset;
      subView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(subView.byteOffset).assertEqual(savedOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0820
     * @tc.name testBigUint64ArrayEvery082
     * @tc.desc Verify directly constructed array byteOffset remains 0 after every() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      expect(sourceArray.byteOffset).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0830
     * @tc.name testBigUint64ArrayEvery083
     * @tc.desc Verify element at index 0 is unchanged after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let savedElement: bigint = sourceArray[0];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray[0]).assertEqual(savedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0840
     * @tc.name testBigUint64ArrayEvery084
     * @tc.desc Verify element at index 0 is unchanged after every() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let savedElement: bigint = sourceArray[0];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 50n;
      });
      expect(sourceArray[0]).assertEqual(savedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0850
     * @tc.name testBigUint64ArrayEvery085
     * @tc.desc Verify element at last index is unchanged after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let lastIndex: int = sourceArray.length - 1;
      let savedElement: bigint = sourceArray[lastIndex];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray[lastIndex]).assertEqual(savedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0860
     * @tc.name testBigUint64ArrayEvery086
     * @tc.desc Verify element at last index is unchanged after every() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let lastIndex: int = sourceArray.length - 1;
      let savedElement: bigint = sourceArray[lastIndex];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 50n;
      });
      expect(sourceArray[lastIndex]).assertEqual(savedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0870
     * @tc.name testBigUint64ArrayEvery087
     * @tc.desc Verify element at middle index is unchanged after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let midIndex: int = 2;
      let savedElement: bigint = sourceArray[midIndex];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray[midIndex]).assertEqual(savedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0880
     * @tc.name testBigUint64ArrayEvery088
     * @tc.desc Verify element at middle index is unchanged after every() returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let midIndex: int = 2;
      let savedElement: bigint = sourceArray[midIndex];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 50n;
      });
      expect(sourceArray[midIndex]).assertEqual(savedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0890
     * @tc.name testBigUint64ArrayEvery089
     * @tc.desc Verify all elements remain unchanged after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let savedValues: bigint[] = [sourceArray[0], sourceArray[1], sourceArray[2], sourceArray[3]];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray[0]).assertEqual(savedValues[0]);
      expect(sourceArray[1]).assertEqual(savedValues[1]);
      expect(sourceArray[2]).assertEqual(savedValues[2]);
      expect(sourceArray[3]).assertEqual(savedValues[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0900
     * @tc.name testBigUint64ArrayEvery090
     * @tc.desc Verify all elements remain unchanged after every() returns false via early exit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let savedValues: bigint[] = [sourceArray[0], sourceArray[1], sourceArray[2], sourceArray[3]];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(sourceArray[0]).assertEqual(savedValues[0]);
      expect(sourceArray[1]).assertEqual(savedValues[1]);
      expect(sourceArray[2]).assertEqual(savedValues[2]);
      expect(sourceArray[3]).assertEqual(savedValues[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0910
     * @tc.name testBigUint64ArrayEvery091
     * @tc.desc Verify changing a local copy of callback element does not change the source array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let savedElement: bigint = sourceArray[1];
      let replacementElement: bigint = 99n;
      let observedLocalElement: bigint = 0n;
      sourceArray.every((element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (index === 1) {
          let localElement: bigint = element;
          localElement = replacementElement;
          observedLocalElement = localElement;
        }
        return true;
      });
      expect(observedLocalElement).assertEqual(replacementElement);
      expect(sourceArray[1]).assertEqual(savedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0920
     * @tc.name testBigUint64ArrayEvery092
     * @tc.desc Verify subarray elements remain unchanged after every() returns true on subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subView = sourceArray.subarray(1, 4);
      let savedFirst: bigint = subView[0];
      let savedSecond: bigint = subView[1];
      let savedThird: bigint = subView[2];
      subView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(subView[0]).assertEqual(savedFirst);
      expect(subView[1]).assertEqual(savedSecond);
      expect(subView[2]).assertEqual(savedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0930
     * @tc.name testBigUint64ArrayEvery093
     * @tc.desc Verify subarray elements remain unchanged after every() returns false on subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subView = sourceArray.subarray(1, 4);
      let savedFirst: bigint = subView[0];
      let savedSecond: bigint = subView[1];
      let savedThird: bigint = subView[2];
      subView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 50n;
      });
      expect(subView[0]).assertEqual(savedFirst);
      expect(subView[1]).assertEqual(savedSecond);
      expect(subView[2]).assertEqual(savedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0940
     * @tc.name testBigUint64ArrayEvery094
     * @tc.desc Verify parent array length is unchanged after every() on a subarray returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subView = sourceArray.subarray(1, 4);
      let savedParentLength: int = sourceArray.length;
      subView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.length).assertEqual(savedParentLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0950
     * @tc.name testBigUint64ArrayEvery095
     * @tc.desc Verify parent array length is unchanged after every() on a subarray returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subView = sourceArray.subarray(1, 4);
      let savedParentLength: int = sourceArray.length;
      subView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 50n;
      });
      expect(sourceArray.length).assertEqual(savedParentLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0960
     * @tc.name testBigUint64ArrayEvery096
     * @tc.desc Verify parent array overlapping elements are unchanged after every() on subarray returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subView = sourceArray.subarray(1, 4);
      let savedParent1: bigint = sourceArray[1];
      let savedParent2: bigint = sourceArray[2];
      let savedParent3: bigint = sourceArray[3];
      subView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray[1]).assertEqual(savedParent1);
      expect(sourceArray[2]).assertEqual(savedParent2);
      expect(sourceArray[3]).assertEqual(savedParent3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0970
     * @tc.name testBigUint64ArrayEvery097
     * @tc.desc Verify parent array overlapping elements are unchanged after every() on subarray returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subView = sourceArray.subarray(1, 4);
      let savedParent1: bigint = sourceArray[1];
      let savedParent2: bigint = sourceArray[2];
      let savedParent3: bigint = sourceArray[3];
      subView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 50n;
      });
      expect(sourceArray[1]).assertEqual(savedParent1);
      expect(sourceArray[2]).assertEqual(savedParent2);
      expect(sourceArray[3]).assertEqual(savedParent3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0980
     * @tc.name testBigUint64ArrayEvery098
     * @tc.desc Verify subarray length is unchanged after every() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subView = sourceArray.subarray(1, 4);
      let savedSubLength: int = subView.length;
      subView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(subView.length).assertEqual(savedSubLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_0990
     * @tc.name testBigUint64ArrayEvery099
     * @tc.desc Verify ArrayBuffer view elements are unchanged after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer, 0, 3);
      sourceArray[0] = 100n;
      sourceArray[1] = 200n;
      sourceArray[2] = 300n;
      let savedFirst: bigint = sourceArray[0];
      let savedSecond: bigint = sourceArray[1];
      let savedThird: bigint = sourceArray[2];
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray[0]).assertEqual(savedFirst);
      expect(sourceArray[1]).assertEqual(savedSecond);
      expect(sourceArray[2]).assertEqual(savedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1000
     * @tc.name testBigUint64ArrayEvery100
     * @tc.desc Verify another view on the same buffer has unchanged elements after every() on first view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let firstView = new BigUint64Array(buffer, 0, 2);
      let secondView = new BigUint64Array(buffer, 0, 2);
      firstView[0] = 111n;
      firstView[1] = 222n;
      let savedSecond0: bigint = secondView[0];
      let savedSecond1: bigint = secondView[1];
      firstView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(secondView[0]).assertEqual(savedSecond0);
      expect(secondView[1]).assertEqual(savedSecond1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1010
     * @tc.name testBigUint64ArrayEvery101
     * @tc.desc Verify another view on the same buffer has unchanged length after every() on first view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let firstView = new BigUint64Array(buffer, 0, 2);
      let secondView = new BigUint64Array(buffer, 0, 2);
      let savedSecondLength: int = secondView.length;
      firstView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(secondView.length).assertEqual(savedSecondLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1020
     * @tc.name testBigUint64ArrayEvery102
     * @tc.desc Verify another view on the same buffer has unchanged byteOffset after every() on first view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let firstView = new BigUint64Array(buffer, 0, 2);
      let secondView = new BigUint64Array(buffer, 0, 2);
      let savedSecondOffset: int = secondView.byteOffset;
      firstView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(secondView.byteOffset).assertEqual(savedSecondOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1030
     * @tc.name testBigUint64ArrayEvery103
     * @tc.desc Verify base view elements overlapping offset view are unchanged after every() on offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(40);
      let baseView = new BigUint64Array(buffer, 0, 5);
      let offsetView = new BigUint64Array(buffer, 8, 3);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      baseView[3] = 40n;
      baseView[4] = 50n;
      let savedBase1: bigint = baseView[1];
      let savedBase2: bigint = baseView[2];
      let savedBase3: bigint = baseView[3];
      offsetView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(baseView[1]).assertEqual(savedBase1);
      expect(baseView[2]).assertEqual(savedBase2);
      expect(baseView[3]).assertEqual(savedBase3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1040
     * @tc.name testBigUint64ArrayEvery104
     * @tc.desc Verify buffer reference byteLength is unchanged after every()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer, 0, 3);
      sourceArray[0] = 100n;
      let savedBufferByteLength: int = sourceArray.buffer.byteLength;
      sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 0n;
      });
      expect(sourceArray.buffer.byteLength).assertEqual(savedBufferByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1050
     * @tc.name testBigUint64ArrayEvery105
     * @tc.desc Verify every() return value can be compared with a boolean variable when result is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      let expectedTrue: boolean = true;
      expect(result).assertEqual(expectedTrue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1060
     * @tc.name testBigUint64ArrayEvery106
     * @tc.desc Verify every() return value can be compared with a boolean variable when result is false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: boolean = sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 5n;
      });
      let expectedFalse: boolean = false;
      expect(result).assertEqual(expectedFalse);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1070
     * @tc.name testBigUint64ArrayEvery107
     * @tc.desc Verify every() boolean return value can be used as an if condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let predicateResult: boolean =
        sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 0n;
        });
      let enteredTrueBranch: boolean = false;
      if (predicateResult) {
        enteredTrueBranch = true;
      }
      expect(enteredTrueBranch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1080
     * @tc.name testBigUint64ArrayEvery108
     * @tc.desc Verify logical negation of every() false result yields true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let predicateResult: boolean =
        sourceArray.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 5n;
        });
      let negatedResult: boolean = !predicateResult;
      expect(negatedResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1090
     * @tc.name testBigUint64ArrayEvery109
     * @tc.desc Verify exception thrown inside predicate propagates to every() caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      try {
        sourceArray.every((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          throw new Error('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1100
     * @tc.name testBigUint64ArrayEvery110
     * @tc.desc Verify every() callback mutation of a later source element can cause later predicate failure
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let observedSecondElement: bigint = 0n;
      let callCount: int = 0;
      let result: boolean = sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        callCount++;
        if (index === 0) {
          array[1] = 0n;
        }
        if (index === 1) {
          observedSecondElement = element;
        }
        return element > 0n;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(2);
      expect(observedSecondElement).assertEqual(0n);
      expect(sourceArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1110
     * @tc.name testBigUint64ArrayEvery111
     * @tc.desc Verify every() on an ArrayBuffer offset view observes window values and local indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let baseView = new BigUint64Array(buffer);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      baseView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let windowView = new BigUint64Array(buffer, byteOffset, viewLength);
      let observedValues: bigint[] = [];
      let observedIndexSum: int = 0;
      let result: boolean = windowView.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        observedValues.push(element);
        observedIndexSum = observedIndexSum + index;
        return array[index] === element;
      });
      expect(result).assertTrue();
      expect(observedValues[0]).assertEqual(20n);
      expect(observedValues[1]).assertEqual(30n);
      expect(observedIndexSum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1120
     * @tc.name testBigUint64ArrayEvery112
     * @tc.desc Verify every() on a subarray observes parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let windowView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let observedValues: bigint[] = [];
      let result: boolean = windowView.every((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        observedValues.push(element);
        return element >= 20n;
      });
      expect(result).assertTrue();
      expect(observedValues[0]).assertEqual(20n);
      expect(observedValues[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1130
     * @tc.name testBigUint64ArrayEvery113
     * @tc.desc Verify every() stops after a middle predicate exception and propagates the error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          callCount++;
          if (index === 1) {
            throw new Error('middle callback error');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1140
     * @tc.name testBigUint64ArrayEvery114
     * @tc.desc Verify every() on a nested byteOffset subarray uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: boolean = nestedWindow.every(
        (element: bigint, index: int, array: BigUint64Array): boolean => {
          indexSum = indexSum + index;
          return array[index] === element && element >= 30n;
        });
      expect(result).assertTrue();
      expect(indexSum).assertEqual(3);
      expect(nestedWindow.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1150
     * @tc.name testBigUint64ArrayEvery115
     * @tc.desc Verify every() on a slice copy from a byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: boolean = sliceCopy.every((element: bigint): boolean => {
        valueTotal = valueTotal + element;
        return element <= 50n;
      });
      let usesIndependentBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      expect(result).assertTrue();
      expect(valueTotal).assertEqual(120n);
      expect(sliceCopy[0]).assertEqual(30n);
      expect(fullView[2]).assertEqual(777n);
      expect(usesIndependentBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1160
     * @tc.name testBigUint64ArrayEvery116
     * @tc.desc Verify every() on a zero-length byteOffset view returns true without invoking the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: boolean = zeroLengthView.every(
        (_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return false;
        });
      expect(result).assertTrue();
      expect(callCount).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1170
     * @tc.name testBigUint64ArrayEvery117
     * @tc.desc Verify every() on a Set source observes values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<BigInt>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let valueTotal: bigint = 0n;
      let indexSum: int = 0;
      let result: boolean =
        sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
          valueTotal = valueTotal + element;
          indexSum = indexSum + index;
          return array.length === 3 && element < 20n;
        });
      expect(result).assertTrue();
      expect(valueTotal).assertEqual(33n);
      expect(indexSum).assertEqual(3);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1180
     * @tc.name testBigUint64ArrayEvery118
     * @tc.desc Verify every() on an advanced iterator source uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let callCount: int = 0;
      let lastObservedIndex: int = -1;
      let result: boolean =
        sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          lastObservedIndex = index;
          return array[0] === 10n && element >= 10n && index < array.length;
        });
      expect(result).assertTrue();
      expect(callCount).assertEqual(3);
      expect(lastObservedIndex).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1190
     * @tc.name testBigUint64ArrayEvery119
     * @tc.desc Verify every() short circuit prevents later callback side effects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        if (index === 2) {
          array[0] = 99n;
        }
        return element < 4n;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(2);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1200
     * @tc.name testBigUint64ArrayEvery120
     * @tc.desc Verify every() callback writing the current source element keeps the captured value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let capturedElement: bigint = 0n;
      let callCount: int = 0;
      let result: boolean = sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        if (index === 0) {
          capturedElement = element;
          array[index] = 105n;
          return element === 5n;
        }
        return element > 0n;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(3);
      expect(capturedElement).assertEqual(5n);
      expect(sourceArray[0]).assertEqual(105n);
      expect(sourceArray[1]).assertEqual(10n);
      expect(sourceArray[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1210
     * @tc.name testBigUint64ArrayEvery121
     * @tc.desc Verify every() propagates an Error thrown on the last predicate callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let callCount: int = 0;
      try {
        sourceArray.every((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 2) {
            throw new Error('last callback error');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1220
     * @tc.name testBigUint64ArrayEvery122
     * @tc.desc Verify every() callback writing an already visited source element keeps its captured value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let firstCapturedElement: bigint = 0n;
      let callCount: int = 0;
      let result: boolean = sourceArray.every((element: bigint, index: int, array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        if (index === 0) {
          firstCapturedElement = element;
        }
        if (index === 1) {
          array[0] = 99n;
        }
        return element > 0n;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(3);
      expect(firstCapturedElement).assertEqual(2n);
      expect(sourceArray[0]).assertEqual(99n);
      expect(sourceArray[1]).assertEqual(4n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1230
     * @tc.name testBigUint64ArrayEvery123
     * @tc.desc Verify every() observes an unvisited value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      sourceView[0] = 2n;
      sourceView[1] = 4n;
      sourceView[2] = 6n;
      let siblingView = new BigUint64Array(sharedBuffer, 8, 3);
      let observedSecondElement: bigint = 0n;
      let callCount: int = 0;
      let result: boolean = sourceView.every((element: bigint, index: int,
        _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        if (index === 0) {
          siblingView[0] = 8n;
        }
        if (index === 1) {
          observedSecondElement = element;
        }
        return element % 2n === 0n;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(3);
      expect(observedSecondElement).assertEqual(8n);
      expect(sourceView[1]).assertEqual(8n);
      expect(siblingView[0]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1240
     * @tc.name testBigUint64ArrayEvery124
     * @tc.desc Verify every matches binary integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0b101010), BigInt(0b101010));
      expect(sourceArray.every((value: bigint): boolean => value === 42n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1250
     * @tc.name testBigUint64ArrayEvery125
     * @tc.desc Verify every matches octal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0o52), BigInt(0o52));
      expect(sourceArray.every((value: bigint): boolean => value === 42n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_EVERY_1260
     * @tc.name testBigUint64ArrayEvery126
     * @tc.desc Verify every matches hexadecimal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayEvery126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0x2A), BigInt(0x2A));
      expect(sourceArray.every((value: bigint): boolean => value === 42n)).assertTrue();
    });

  });
}
