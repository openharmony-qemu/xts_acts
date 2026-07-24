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


export default function biguint64arrayFindLastTest(): void {

  describe('BigUint64ArrayFindLastTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0100
     * @tc.name testBigUint64ArrayFindLast001
     * @tc.desc Verify findLast() returns the last element when predicate always returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return true;
        });
      expect(result).assertEqual(30n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0200
     * @tc.name testBigUint64ArrayFindLast002
     * @tc.desc Verify findLast() invokes predicate exactly once on a single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let callCount: int = 0;
      sourceArray.findLast((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0300
     * @tc.name testBigUint64ArrayFindLast003
     * @tc.desc Verify findLast() matches element by arithmetic difference with BigInt(index)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 1n, 5n, 1n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, _array: BigUint64Array): boolean => {
          return element - BigInt(index) > 0n;
        });
      expect(result).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0400
     * @tc.name testBigUint64ArrayFindLast004
     * @tc.desc Verify findLast() matches element greater than a closure captured threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 18n, 7n, 22n]);
      let threshold: bigint = 15n;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > threshold;
        });
      expect(result).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0500
     * @tc.name testBigUint64ArrayFindLast005
     * @tc.desc Verify findLast() matches element equal to the first element via subtraction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([44n, 88n, 44n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, array: BigUint64Array): boolean => {
          return element - array[0] === 0n;
        });
      expect(result).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0600
     * @tc.name testBigUint64ArrayFindLast006
     * @tc.desc Verify findLast() returns the last element when predicate matches the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index === 2;
        });
      expect(result).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0700
     * @tc.name testBigUint64ArrayFindLast007
     * @tc.desc Verify findLast() returns the middle element when predicate matches the middle index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 99n, 999n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index === 1;
        });
      expect(result).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0800
     * @tc.name testBigUint64ArrayFindLast008
     * @tc.desc Verify findLast() returns the rightmost match among duplicate values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([88n, 66n, 88n, 44n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 88n;
        });
      expect(result).assertEqual(88n);
      expect(sourceArray.lastIndexOf(result!)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_0900
     * @tc.name testBigUint64ArrayFindLast009
     * @tc.desc Verify findLast() returns the rightmost element greater than a threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 7n, 2n, 8n, 1n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 5n;
        });
      expect(result).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1000
     * @tc.name testBigUint64ArrayFindLast010
     * @tc.desc Verify findLast() returns the rightmost element greater or equal to a threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 7n, 9n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element >= 5n;
        });
      expect(result).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1100
     * @tc.name testBigUint64ArrayFindLast011
     * @tc.desc Verify findLast() returns the rightmost element less or equal to a threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([9n, 7n, 5n, 3n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element <= 5n;
        });
      expect(result).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1200
     * @tc.name testBigUint64ArrayFindLast012
     * @tc.desc Verify findLast() returns the rightmost element not equal to an excluded value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n, 99n, 77n, 99n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element !== 99n;
        });
      expect(result).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1300
     * @tc.name testBigUint64ArrayFindLast013
     * @tc.desc Verify findLast() returns the rightmost element matching a compound value and index condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([30n, 60n, 90n, 120n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, _array: BigUint64Array): boolean => {
          return element > 50n && index < 3;
        });
      expect(result).assertEqual(90n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1400
     * @tc.name testBigUint64ArrayFindLast014
     * @tc.desc Verify findLast() predicate uses only the element parameter to match by value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([13n, 23n, 33n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 23n;
        });
      expect(result).assertEqual(23n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1500
     * @tc.name testBigUint64ArrayFindLast015
     * @tc.desc Verify findLast() predicate uses only the index parameter to match a specific index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([111n, 222n, 333n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index === 0;
        });
      expect(result).assertEqual(111n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1600
     * @tc.name testBigUint64ArrayFindLast016
     * @tc.desc Verify findLast() predicate uses only the array parameter to read an element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([17n, 27n, 37n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, _index: int, array: BigUint64Array): boolean => {
          return array[0] === 17n;
        });
      expect(result).assertEqual(37n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1700
     * @tc.name testBigUint64ArrayFindLast017
     * @tc.desc Verify findLast() predicate combines element and index parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 8n, 12n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, _array: BigUint64Array): boolean => {
          return element === 12n && index === 2;
        });
      expect(result).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1800
     * @tc.name testBigUint64ArrayFindLast018
     * @tc.desc Verify findLast() predicate combines element and array parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 30n, 50n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, array: BigUint64Array): boolean => {
          return element === array[0];
        });
      expect(result).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_1900
     * @tc.name testBigUint64ArrayFindLast019
     * @tc.desc Verify findLast() predicate combines index and array parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([6n, 6n, 6n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, array: BigUint64Array): boolean => {
          return index === array.length - 1;
        });
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2000
     * @tc.name testBigUint64ArrayFindLast020
     * @tc.desc Verify findLast() predicate uses all three element index and array parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([25n, 35n, 45n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          return element === 45n && index === 2 && array.length === 3;
        });
      expect(result).assertEqual(45n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2100
     * @tc.name testBigUint64ArrayFindLast021
     * @tc.desc Verify findLast() predicate ignores all parameters and returns constant true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([14n, 28n, 42n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return true;
        });
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2200
     * @tc.name testBigUint64ArrayFindLast022
     * @tc.desc Verify findLast() matches the unsigned minimum value zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 0n, 10n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2300
     * @tc.name testBigUint64ArrayFindLast023
     * @tc.desc Verify findLast() matches the minimum positive value one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 1n;
        });
      expect(result).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2400
     * @tc.name testBigUint64ArrayFindLast024
     * @tc.desc Verify findLast() matches the signed int64 max value below the unsigned high range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signedInt64Max: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([0n, signedInt64Max, 1n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === signedInt64Max;
        });
      expect(result).assertEqual(signedInt64Max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2500
     * @tc.name testBigUint64ArrayFindLast025
     * @tc.desc Verify findLast() matches a normal value appearing more than once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n, 19n, 42n, 73n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 42n;
        });
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2600
     * @tc.name testBigUint64ArrayFindLast026
     * @tc.desc Verify findLast() returns the rightmost nonzero element among zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 3n, 0n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 0n;
        });
      expect(result).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2700
     * @tc.name testBigUint64ArrayFindLast027
     * @tc.desc Verify findLast() returns the rightmost zero in an all zero array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2800
     * @tc.name testBigUint64ArrayFindLast028
     * @tc.desc Verify findLast() matches element greater than BigInt of array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 10n, 2n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, array: BigUint64Array): boolean => {
          return element > BigInt(array.length);
        });
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_2900
     * @tc.name testBigUint64ArrayFindLast029
     * @tc.desc Verify findLast() matches the first element when predicate checks index equals zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([91n, 92n, 93n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index === 0;
        });
      expect(result).assertEqual(91n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3000
     * @tc.name testBigUint64ArrayFindLast030
     * @tc.desc Verify findLast() matches the last element when predicate checks index equals length minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([81n, 82n, 83n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, array: BigUint64Array): boolean => {
          return index === array.length - 1;
        });
      expect(result).assertEqual(83n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3100
     * @tc.name testBigUint64ArrayFindLast031
     * @tc.desc Verify findLast() matches a middle element by a middle index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([21n, 31n, 41n, 51n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index === 2;
        });
      expect(result).assertEqual(41n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3200
     * @tc.name testBigUint64ArrayFindLast032
     * @tc.desc Verify findLast() returns the rightmost element whose index is greater than zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([61n, 62n, 63n, 64n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index > 0;
        });
      expect(result).assertEqual(64n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3300
     * @tc.name testBigUint64ArrayFindLast033
     * @tc.desc Verify findLast() returns the last element when predicate checks index greater or equal zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([71n, 72n, 73n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index >= 0;
        });
      expect(result).assertEqual(73n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3400
     * @tc.name testBigUint64ArrayFindLast034
     * @tc.desc Verify findLast() returns the last element when predicate checks index less than length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([16n, 32n, 48n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, array: BigUint64Array): boolean => {
          return index < array.length;
        });
      expect(result).assertEqual(48n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3500
     * @tc.name testBigUint64ArrayFindLast035
     * @tc.desc Verify findLast() returns the rightmost element in the second half by index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 7n, 9n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index > 2;
        });
      expect(result).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3600
     * @tc.name testBigUint64ArrayFindLast036
     * @tc.desc Verify findLast() returns the rightmost element at an odd index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index % 2 !== 0;
        });
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3700
     * @tc.name testBigUint64ArrayFindLast037
     * @tc.desc Verify findLast() returns the rightmost element at an even index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([18n, 24n, 36n, 42n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          return index % 2 === 0;
        });
      expect(result).assertEqual(36n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3800
     * @tc.name testBigUint64ArrayFindLast038
     * @tc.desc Verify findLast() predicate combines element and BigInt(index) scaled
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 3n, 40n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, _array: BigUint64Array): boolean => {
          return element > BigInt(index) * 10n;
        });
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_3900
     * @tc.name testBigUint64ArrayFindLast039
     * @tc.desc Verify findLast() predicate reads array index zero and compares with current element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([15n, 25n, 15n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, array: BigUint64Array): boolean => {
          return element === array[0];
        });
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4000
     * @tc.name testBigUint64ArrayFindLast040
     * @tc.desc Verify findLast() predicate reads the last array element and compares with current element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([55n, 65n, 75n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, array: BigUint64Array): boolean => {
          return element === array[array.length - 1];
        });
      expect(result).assertEqual(75n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4100
     * @tc.name testBigUint64ArrayFindLast041
     * @tc.desc Verify findLast() predicate decides match by array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([8n, 16n, 24n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, _index: int, array: BigUint64Array): boolean => {
          return array.length === 3;
        });
      expect(result).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4200
     * @tc.name testBigUint64ArrayFindLast042
     * @tc.desc Verify findLast() predicate array argument is the same reference as a captured array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let captured: BigUint64Array = sourceArray;
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, _index: int, array: BigUint64Array): boolean => {
          return array === captured;
        });
      expect(result).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4300
     * @tc.name testBigUint64ArrayFindLast043
     * @tc.desc Verify findLast() predicate reads array at the current index and matches the element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 8n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          return element === array[index] && index === 2;
        });
      expect(result).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4400
     * @tc.name testBigUint64ArrayFindLast044
     * @tc.desc Verify findLast() predicate compares current element with the previous element via array index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([12n, 18n, 24n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          return index > 0 && element > array[index - 1];
        });
      expect(result).assertEqual(24n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4500
     * @tc.name testBigUint64ArrayFindLast045
     * @tc.desc Verify findLast() stops traversal after the rightmost match is found
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 1n, 2n, 3n, 5n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 3n;
        });
      expect(result).assertEqual(3n);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4600
     * @tc.name testBigUint64ArrayFindLast046
     * @tc.desc Verify findLast() stops at the first call when all elements satisfy the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let callCount: int = 0;
      sourceArray.findLast((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4700
     * @tc.name testBigUint64ArrayFindLast047
     * @tc.desc Verify findLast() returns the rightmost match and skips earlier matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 8n, 5n, 8n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 8n;
        });
      expect(result).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4800
     * @tc.name testBigUint64ArrayFindLast048
     * @tc.desc Verify findLast() visits index zero once on a single element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([99n]);
      let visitedIndex: int = -1;
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          visitedIndex = index;
          return true;
        });
      expect(visitedIndex).assertEqual(0);
      expect(result).assertEqual(99n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_4900
     * @tc.name testBigUint64ArrayFindLast049
     * @tc.desc Verify findLast() returns the only element on a single element array match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([77n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 77n;
        });
      expect(result).assertEqual(77n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5000
     * @tc.name testBigUint64ArrayFindLast050
     * @tc.desc Verify findLast() returns the second element immediately from the right on a two element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([19n, 29n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 29n;
        });
      expect(result).assertEqual(29n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5100
     * @tc.name testBigUint64ArrayFindLast051
     * @tc.desc Verify findLast() returns the first element after skipping the second on a two element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([39n, 49n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 39n;
        });
      expect(result).assertEqual(39n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5200
     * @tc.name testBigUint64ArrayFindLast052
     * @tc.desc Verify findLast() returns the rightmost occurrence of a duplicate value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([13n, 26n, 13n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 13n;
        });
      expect(result).assertEqual(13n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5300
     * @tc.name testBigUint64ArrayFindLast053
     * @tc.desc Verify findLast() returns the last element above a threshold in an ascending array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 7n, 9n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 4n;
        });
      expect(result).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5400
     * @tc.name testBigUint64ArrayFindLast054
     * @tc.desc Verify findLast() returns the last element below a threshold in a descending array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([20n, 15n, 10n, 5n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element < 12n;
        });
      expect(result).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5500
     * @tc.name testBigUint64ArrayFindLast055
     * @tc.desc Verify findLast() finds zero among max value elements in a mixed boundary array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, 0n, maxUint64]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 0n;
        });
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5600
     * @tc.name testBigUint64ArrayFindLast056
     * @tc.desc Verify findLast() returns the last element in an array of identical values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([44n, 44n, 44n, 44n]);
      let result: bigint | undefined =
        sourceArray.findLast((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return true;
        });
      expect(result).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5700
     * @tc.name testBigUint64ArrayFindLast057
     * @tc.desc Verify findLast() predicate can mutate an outer counter and still return a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let sideCounter: int = 0;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          sideCounter = sideCounter + 1;
          return element > 3n;
        });
      expect(result).assertEqual(6n);
      expect(sideCounter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5800
     * @tc.name testBigUint64ArrayFindLast058
     * @tc.desc Verify findLast() propagates an Error thrown on the first callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([30n, 60n, 90n]);
      let callCount: int = 0;
      try {
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 2) {
            throw new Error('first callback error');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_5900
     * @tc.name testBigUint64ArrayFindLast059
     * @tc.desc Verify findLast() predicate performs arithmetic before returning a boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element / 100n > 2n;
        });
      expect(result).assertEqual(300n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6000
     * @tc.name testBigUint64ArrayFindLast060
     * @tc.desc Verify findLast() leaves all elements unchanged after a match is found
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([16n, 32n, 48n]);
      sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 20n;
      });
      expect(sourceArray[0]).assertEqual(16n);
      expect(sourceArray[1]).assertEqual(32n);
      expect(sourceArray[2]).assertEqual(48n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6100
     * @tc.name testBigUint64ArrayFindLast061
     * @tc.desc Verify findLast() on a subarray returns the correct element from the subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let subView = sourceArray.subarray(1, 4);
      let result: bigint | undefined =
        subView.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 25n;
        });
      expect(result).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6200
     * @tc.name testBigUint64ArrayFindLast062
     * @tc.desc Verify findLast() on a subarray returns the rightmost match from the subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subView = sourceArray.subarray(2, 5);
      let result: bigint | undefined =
        subView.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 2n;
        });
      expect(result).assertEqual(5n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6300
     * @tc.name testBigUint64ArrayFindLast063
     * @tc.desc Verify findLast() on a subarray leaves the parent array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let subView = sourceArray.subarray(1, 3);
      let result: bigint | undefined =
        subView.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 15n;
        });
      expect(result).assertEqual(30n);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(30n);
      expect(sourceArray[3]).assertEqual(40n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6400
     * @tc.name testBigUint64ArrayFindLast064
     * @tc.desc Verify findLast() on an ArrayBuffer view leaves the buffer contents unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer);
      sourceArray[0] = 13n;
      sourceArray[1] = 26n;
      sourceArray[2] = 39n;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 20n;
        });
      expect(result).assertEqual(39n);
      let verifyView = new BigUint64Array(buffer);
      expect(verifyView[0]).assertEqual(13n);
      expect(verifyView[1]).assertEqual(26n);
      expect(verifyView[2]).assertEqual(39n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6500
     * @tc.name testBigUint64ArrayFindLast065
     * @tc.desc Verify findLast() on a byteOffset eight length three view returns the correct element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(buffer);
      fullView[0] = 0n;
      fullView[1] = 65n;
      fullView[2] = 75n;
      fullView[3] = 85n;
      fullView[4] = 0n;
      let offsetView = new BigUint64Array(buffer, 8, 3);
      let result: bigint | undefined =
        offsetView.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 70n;
        });
      expect(result).assertEqual(85n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6600
     * @tc.name testBigUint64ArrayFindLast066
     * @tc.desc Verify findLast() on a full buffer view returns the correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(buffer);
      sourceArray[0] = 33n;
      sourceArray[1] = 66n;
      sourceArray[2] = 99n;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 50n;
        });
      expect(result).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6700
     * @tc.name testBigUint64ArrayFindLast067
     * @tc.desc Verify findLast() predicate array byteOffset is zero on a zero byteOffset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(16);
      let offsetView = new BigUint64Array(buffer, 0, 2);
      offsetView[0] = 25n;
      offsetView[1] = 50n;
      let offsetMatched: boolean = false;
      let result: bigint | undefined =
        offsetView.findLast((element: bigint, _index: int, array: BigUint64Array): boolean => {
          if (array.byteOffset === 0) {
            offsetMatched = true;
          }
          return element === 50n;
        });
      expect(offsetMatched).assertTrue();
      expect(result).assertEqual(50n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6800
     * @tc.name testBigUint64ArrayFindLast068
     * @tc.desc Verify findLast() view BYTES_PER_ELEMENT equals the parent array BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(buffer);
      fullView[0] = 6n;
      fullView[1] = 12n;
      fullView[2] = 18n;
      let offsetView = new BigUint64Array(buffer, 8, 1);
      let result: bigint | undefined =
        offsetView.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 12n;
        });
      expect(result).assertEqual(12n);
      expect(offsetView.BYTES_PER_ELEMENT).assertEqual(fullView.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_6900
     * @tc.name testBigUint64ArrayFindLast069
     * @tc.desc Verify findLast() callback mutation of a lower source index is observed by a later callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let observedLowerElement: bigint = 0n;
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount++;
          if (index === 2) {
            array[1] = 99n;
            return false;
          }
          if (index === 1) {
            observedLowerElement = element;
          }
          return element === 99n;
        });
      expect(callCount).assertEqual(2);
      expect(observedLowerElement).assertEqual(99n);
      expect(result).assertEqual(99n);
      expect(sourceArray[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7000
     * @tc.name testBigUint64ArrayFindLast070
     * @tc.desc Verify findLast() on an ArrayBuffer offset view uses local callback indices for the window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
        windowView.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          observedIndexSum = observedIndexSum + index;
          return array[index] === element && index === 1;
        });
      expect(observedIndexSum).assertEqual(1);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7100
     * @tc.name testBigUint64ArrayFindLast071
     * @tc.desc Verify findLast() on a subarray observes parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let windowView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let result: bigint | undefined =
        windowView.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element >= 90n;
        });
      expect(result).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7200
     * @tc.name testBigUint64ArrayFindLast072
     * @tc.desc Verify findLast() propagates an exception thrown on the last callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 0) {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7300
     * @tc.name testBigUint64ArrayFindLast073
     * @tc.desc Verify findLast() on a nested byteOffset subarray uses local right to left callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let callbackOrder: int = 0;
      let result: bigint | undefined =
        nestedWindow.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          callbackOrder = callbackOrder * 10 + index;
          return array[index] === element && index === 0;
        });
      expect(result).assertEqual(30n);
      expect(callbackOrder).assertEqual(210);
      expect(nestedWindow.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7400
     * @tc.name testBigUint64ArrayFindLast074
     * @tc.desc Verify findLast() on a slice copy from a byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: bigint | undefined =
        sliceCopy.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 30n;
        });
      let usesIndependentBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      expect(result).assertEqual(30n);
      expect(sliceCopy[0]).assertEqual(30n);
      expect(fullView[2]).assertEqual(777n);
      expect(usesIndependentBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7500
     * @tc.name testBigUint64ArrayFindLast075
     * @tc.desc Verify findLast() on a byteOffset view observes writes from an overlapping buffer sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let windowView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let siblingOffset: int = 16;
      let siblingLength: int = 2;
      let siblingView = new BigUint64Array(sharedBuffer, siblingOffset, siblingLength);
      siblingView[1] = 99n;
      let observedIndexSum: int = 0;
      let result: bigint | undefined =
        windowView.findLast((element: bigint, index: int, _array: BigUint64Array): boolean => {
          observedIndexSum = observedIndexSum + index;
          return element === 99n;
        });
      expect(result).assertEqual(99n);
      expect(observedIndexSum).assertEqual(5);
      expect(windowView[2]).assertEqual(99n);
      expect(fullView[3]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7600
     * @tc.name testBigUint64ArrayFindLast076
     * @tc.desc Verify findLast() on a Set source uses right to left callback values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 11n && index === 1 && array.length === 3;
        });
      expect(result).assertEqual(11n);
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7700
     * @tc.name testBigUint64ArrayFindLast077
     * @tc.desc Verify findLast() on an advanced iterator source uses local right to left callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 15n && index === 1 && array[2] === 20n;
        });
      expect(result).assertEqual(15n);
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7800
     * @tc.name testBigUint64ArrayFindLast078
     * @tc.desc Verify findLast() short circuit prevents lower index callback side effects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 0) {
            array[2] = 99n;
          }
          return element === 4n;
        });
      expect(result).assertEqual(4n);
      expect(callCount).assertEqual(2);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_7900
     * @tc.name testBigUint64ArrayFindLast079
     * @tc.desc Verify findLast() returns the current callback value snapshot after writing the same source index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let observedElementAfterWrite: bigint = 0n;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, index: int, array: BigUint64Array): boolean => {
          if (index === 2) {
            array[index] = 99n;
            observedElementAfterWrite = element;
            return true;
          }
          return false;
        });
      expect(observedElementAfterWrite).assertEqual(3n);
      expect(result).assertEqual(3n);
      expect(sourceArray[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_8000
     * @tc.name testBigUint64ArrayFindLast080
     * @tc.desc Verify findLast() observes an unvisited lower value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLowerValue: bigint = 0n;
      let result: bigint | undefined =
        sourceView.findLast((element: bigint, index: int, _array: BigUint64Array): boolean => {
          if (index === 2) {
            siblingView[0] = 9n;
          }
          if (index === 1) {
            observedLowerValue = element;
          }
          return element === 9n;
        });
      expect(observedLowerValue).assertEqual(9n);
      expect(result).assertEqual(9n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_8100
     * @tc.name testBigUint64ArrayFindLast081
     * @tc.desc Verify findLast() propagates an Error thrown on the middle callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let callCount: int = 0;
      try {
        sourceArray.findLast((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 1) {
            throw new Error('middle callback error');
          }
          return index === 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_8200
     * @tc.name testBigUint64ArrayFindLast082
     * @tc.desc Verify findLast() leaves BigUint64Array.BYTES_PER_ELEMENT unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([15n, 30n, 45n]);
      let bytesPerElementBefore: int = BigUint64Array.BYTES_PER_ELEMENT;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 15n;
        });
      expect(result).assertEqual(15n);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(bytesPerElementBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLAST_8300
     * @tc.name testBigUint64ArrayFindLast083
     * @tc.desc Verify findLast() predicate can read BigUint64Array.BYTES_PER_ELEMENT during callback execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLast083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues = [15n, 30n, 45n];
      let sourceArray = new BigUint64Array(sourceValues);
      let observedByteLength: int = 0;
      let callCount: int = 0;
      let result: bigint | undefined =
        sourceArray.findLast((element: bigint, _index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          observedByteLength = array.length * BigUint64Array.BYTES_PER_ELEMENT;
          return element === 30n;
        });
      expect(result).assertEqual(30n);
      expect(callCount).assertEqual(2);
      expect(observedByteLength).assertEqual(24);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

  });
}
