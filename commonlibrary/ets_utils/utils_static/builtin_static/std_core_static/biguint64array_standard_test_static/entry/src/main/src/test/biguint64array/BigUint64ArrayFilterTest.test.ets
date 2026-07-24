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

export default function biguint64arrayFilterTest(): void {

  describe('BigUint64ArrayFilterTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0010
     * @tc.name testBigUint64ArrayFilter001
     * @tc.desc Verify filter() with a single fn that always returns true retains all elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(resultArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0020
     * @tc.name testBigUint64ArrayFilter002
     * @tc.desc Verify filter() with a single fn that always returns false produces an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0030
     * @tc.name testBigUint64ArrayFilter003
     * @tc.desc Verify filter() with a fn that compares element greater than a threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([50n, 60n, 70n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 55n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(60n);
      expect(resultArray[1]).assertEqual(70n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0040
     * @tc.name testBigUint64ArrayFilter004
     * @tc.desc Verify filter() callback uses only the element parameter to filter by value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 2n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0050
     * @tc.name testBigUint64ArrayFilter005
     * @tc.desc Verify filter() callback uses index parameter to retain only the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index === 0;
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0060
     * @tc.name testBigUint64ArrayFilter006
     * @tc.desc Verify filter() callback uses index to retain only the last element via index === length-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index === sourceArray.length - 1;
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0070
     * @tc.name testBigUint64ArrayFilter007
     * @tc.desc Verify filter() callback uses index modulo 2 equals 0 to retain even-index elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let resultArray = sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index % 2 === 0;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(10n);
      expect(resultArray[1]).assertEqual(30n);
      expect(resultArray[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0080
     * @tc.name testBigUint64ArrayFilter008
     * @tc.desc Verify filter() callback uses index modulo 2 not equal 0 to retain odd-index elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let resultArray = sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index % 2 !== 0;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0090
     * @tc.name testBigUint64ArrayFilter009
     * @tc.desc Verify filter() callback uses element and index to filter condition with composite AND
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let resultArray = sourceArray.filter((element: bigint, index: int, _array: BigUint64Array): boolean => {
        return element > 15n && index < 3;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(20n);
      expect(resultArray[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0100
     * @tc.name testBigUint64ArrayFilter010
     * @tc.desc Verify filter() callback uses all three parameters (element, index, array) to build filter logic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((element: bigint, index: int, array: BigUint64Array): boolean => {
        return element > 0n && index < array.length - 1;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0110
     * @tc.name testBigUint64ArrayFilter011
     * @tc.desc Verify filter() callback accesses array.length for partial range filtering
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let resultArray = sourceArray.filter((_element: bigint, index: int, array: BigUint64Array): boolean => {
        return index < array.length - 3;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0120
     * @tc.name testBigUint64ArrayFilter012
     * @tc.desc Verify filter() callback reads array element via index access to compare with source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 1n, 4n, 1n, 5n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, array: BigUint64Array): boolean => {
        return element === array[0];
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0130
     * @tc.name testBigUint64ArrayFilter013
     * @tc.desc Verify filter() with element greater than 0n filters out zero-value elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 0n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0140
     * @tc.name testBigUint64ArrayFilter014
     * @tc.desc Verify filter() with element strictly equal to 0n retains only zero-value elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 0n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0150
     * @tc.name testBigUint64ArrayFilter015
     * @tc.desc Verify filter() with element greater than or equal to a threshold includes boundary element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 7n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 3n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[1]).assertEqual(5n);
      expect(resultArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0160
     * @tc.name testBigUint64ArrayFilter016
     * @tc.desc Verify filter() with element less than or equal to a threshold includes upper boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element <= 4n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0170
     * @tc.name testBigUint64ArrayFilter017
     * @tc.desc Verify filter() with negated comparison condition keeps elements not above threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return !(element > 3n);
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0180
     * @tc.name testBigUint64ArrayFilter018
     * @tc.desc Verify filter() with negated index condition excludes first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return !(index === 0);
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(3n);
      expect(resultArray[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0190
     * @tc.name testBigUint64ArrayFilter019
     * @tc.desc Verify filter() with element strictly less than a fixed threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 5n, 7n, 9n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element < 7n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0200
     * @tc.name testBigUint64ArrayFilter020
     * @tc.desc Verify filter() with element in a closed interval keeps elements within bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 2n, 4n, 6n, 8n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 2n && element <= 6n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0210
     * @tc.name testBigUint64ArrayFilter021
     * @tc.desc Verify filter() with compound OR condition between element and index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 2n, 0n, 4n]);
      let resultArray = sourceArray.filter((element: bigint, index: int, _array: BigUint64Array): boolean => {
        return element > 0n || index === 0;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0220
     * @tc.name testBigUint64ArrayFilter022
     * @tc.desc Verify filter() using BigInt modulo 2 equals 0 to retain even-value elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 2n === 0n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0230
     * @tc.name testBigUint64ArrayFilter023
     * @tc.desc Verify filter() using BigInt modulo 2 not equal 0 to retain odd-value elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 2n !== 0n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(3n);
      expect(resultArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0240
     * @tc.name testBigUint64ArrayFilter024
     * @tc.desc Verify filter() using BigInt modulo 3 equals 1 to retain elements with remainder 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n, 3n, 4n, 5n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 3n === 1n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0250
     * @tc.name testBigUint64ArrayFilter025
     * @tc.desc Verify filter() using BigInt modulo 3 equals 0 to retain divisible-by-3 elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n, 3n, 4n, 5n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 3n === 0n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0260
     * @tc.name testBigUint64ArrayFilter026
     * @tc.desc Verify filter() using BigInt addition where element plus element exceeds a threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element + element > 3n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0270
     * @tc.name testBigUint64ArrayFilter027
     * @tc.desc Verify filter() using BigInt multiplication where element times element is below a threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element * element < 10n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(2n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0280
     * @tc.name testBigUint64ArrayFilter028
     * @tc.desc Verify filter() using BigInt subtraction and comparison combined as predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 3n, 8n, 1n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return 10n - element >= 5n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[1]).assertEqual(3n);
      expect(resultArray[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0290
     * @tc.name testBigUint64ArrayFilter029
     * @tc.desc Verify filter() using BigInt left shift operation as predicate condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return (element << 1n) > 3n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0300
     * @tc.name testBigUint64ArrayFilter030
     * @tc.desc Verify filter() using BigInt bitwise AND to check the least significant bit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return (element & 1n) === 1n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0310
     * @tc.name testBigUint64ArrayFilter031
     * @tc.desc Verify filter() using BigInt bitwise OR to check if OR with 1 leaves element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return (element | 1n) === element;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(1n);
      expect(resultArray[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0320
     * @tc.name testBigUint64ArrayFilter032
     * @tc.desc Verify filter() using BigInt bitwise XOR where result greater than element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return (element ^ 1n) > element;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0330
     * @tc.name testBigUint64ArrayFilter033
     * @tc.desc Verify filter() with parenthesized compound AND expression for element range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return (element > 1n) && (element < 4n);
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(2n);
      expect(resultArray[1]).assertEqual(3n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0340
     * @tc.name testBigUint64ArrayFilter034
     * @tc.desc Verify filter() preserves element with value 9223372036854775807n (signed int64 max)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signedInt64Max: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([1n, signedInt64Max, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === signedInt64Max;
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(signedInt64Max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0350
     * @tc.name testBigUint64ArrayFilter035
     * @tc.desc Verify filter() with element between 0n and MAX on a mixed boundary array returns empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([0n, maxUint64, 0n, maxUint64]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n && element < maxUint64;
      });
      expect(resultArray.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0360
     * @tc.name testBigUint64ArrayFilter036
     * @tc.desc Verify filter() with zero and max mixed array keeps only zero-value elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([0n, maxUint64, 0n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(0n);
      expect(resultArray[1]).assertEqual(0n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0370
     * @tc.name testBigUint64ArrayFilter037
     * @tc.desc Verify filter() keeps all occurrences of a repeated value in source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 3n, 7n, 2n, 7n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 7n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(7n);
      expect(resultArray[1]).assertEqual(7n);
      expect(resultArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0380
     * @tc.name testBigUint64ArrayFilter038
     * @tc.desc Verify filter() excludes all occurrences of a repeated value from source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 3n, 7n, 2n, 7n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element !== 7n;
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0390
     * @tc.name testBigUint64ArrayFilter039
     * @tc.desc Verify filter() on empty array with always-true predicate returns empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0400
     * @tc.name testBigUint64ArrayFilter040
     * @tc.desc Verify filter() on single-element [0n] array with always-true predicate retains it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n]);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0410
     * @tc.name testBigUint64ArrayFilter041
     * @tc.desc Verify filter() on single-element [0n] array with always-false predicate returns empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n]);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0420
     * @tc.name testBigUint64ArrayFilter042
     * @tc.desc Verify filter() on single-element [MAX] array with always-true predicate retains the max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64]);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(maxUint64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0430
     * @tc.name testBigUint64ArrayFilter043
     * @tc.desc Verify filter() on single-element [MAX] array with always-false predicate returns empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64]);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0440
     * @tc.name testBigUint64ArrayFilter044
     * @tc.desc Verify filter() on single-element array matching on the exact element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 7n;
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0450
     * @tc.name testBigUint64ArrayFilter045
     * @tc.desc Verify filter() on array with two identical elements, filtering by index retains only first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 5n]);
      let resultArray = sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index === 0;
      });
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0460
     * @tc.name testBigUint64ArrayFilter046
     * @tc.desc Verify filter() on all-zero array with element greater than 0n returns empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0470
     * @tc.name testBigUint64ArrayFilter047
     * @tc.desc Verify filter() on all-zero array with element equal to 0n retains all
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(resultArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0480
     * @tc.name testBigUint64ArrayFilter048
     * @tc.desc Verify filter() callback invocation count equals source array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let callCount: int = 0;
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0490
     * @tc.name testBigUint64ArrayFilter049
     * @tc.desc Verify filter() callback is not invoked on empty source array, counter stays 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let callCount: int = 0;
      let sourceArray = new BigUint64Array(0);
      sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0500
     * @tc.name testBigUint64ArrayFilter050
     * @tc.desc Verify filter() callback is invoked exactly once on single-element source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let callCount: int = 0;
      let sourceArray = new BigUint64Array([42n]);
      sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0510
     * @tc.name testBigUint64ArrayFilter051
     * @tc.desc Verify filter() callback receives index parameters in strictly increasing order 0 to length-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let capturedIndices: int[] = [0, 0, 0];
      let writePos: int = 0;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        capturedIndices[writePos] = index;
        writePos = writePos + 1;
        return true;
      });
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
      expect(capturedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0520
     * @tc.name testBigUint64ArrayFilter052
     * @tc.desc Verify filter() callback receives index 0 for single-element source array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let capturedIndex: int = -1;
      let sourceArray = new BigUint64Array([42n]);
      sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        capturedIndex = index;
        return true;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0530
     * @tc.name testBigUint64ArrayFilter053
     * @tc.desc Verify filter() callback array parameter length matches source array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let capturedLength: int = -1;
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.filter((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        capturedLength = array.length;
        return true;
      });
      expect(capturedLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0540
     * @tc.name testBigUint64ArrayFilter054
     * @tc.desc Verify filter() callback array parameter reads element at specific index correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let capturedValue: bigint = -1n;
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      sourceArray.filter((_element: bigint, index: int, array: BigUint64Array): boolean => {
        if (index === 1) {
          capturedValue = array[1];
        }
        return true;
      });
      expect(capturedValue).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0550
     * @tc.name testBigUint64ArrayFilter055
     * @tc.desc Verify filter() preserves descending array order in filtered output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 4n, 3n, 2n, 1n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(5n);
      expect(resultArray[1]).assertEqual(4n);
      expect(resultArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0560
     * @tc.name testBigUint64ArrayFilter056
     * @tc.desc Verify filter() preserves unsorted array order in output when all elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 1n, 4n, 2n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(resultArray[0]).assertEqual(3n);
      expect(resultArray[1]).assertEqual(1n);
      expect(resultArray[2]).assertEqual(4n);
      expect(resultArray[3]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0570
     * @tc.name testBigUint64ArrayFilter057
     * @tc.desc Verify filter() first returned element is the first matching element in original order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 1n, 4n, 1n, 5n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      expect(resultArray[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0580
     * @tc.name testBigUint64ArrayFilter058
     * @tc.desc Verify filter() last returned element is the last matching element in original order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 1n, 4n, 1n, 5n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      let lastIdx: int = resultArray.length - 1;
      expect(resultArray[lastIdx]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0590
     * @tc.name testBigUint64ArrayFilter059
     * @tc.desc Verify filter() result name is BigUint64Array when all elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(resultArray.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0600
     * @tc.name testBigUint64ArrayFilter060
     * @tc.desc Verify filter() result name is BigUint64Array when no elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 999n;
      });
      expect(resultArray.name).assertEqual('BigUint64Array');
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0610
     * @tc.name testBigUint64ArrayFilter061
     * @tc.desc Verify filter() result name is BigUint64Array when source is empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(resultArray.name).assertEqual('BigUint64Array');
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0620
     * @tc.name testBigUint64ArrayFilter062
     * @tc.desc Verify filter() result BYTES_PER_ELEMENT is 8 when all elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(resultArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0630
     * @tc.name testBigUint64ArrayFilter063
     * @tc.desc Verify filter() result length equals source length when all elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 14n, 21n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 7n;
      });
      expect(resultArray.length).assertEqual(sourceArray.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0640
     * @tc.name testBigUint64ArrayFilter064
     * @tc.desc Verify filter() result length correct for partial match (2 of 5 elements)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 10n, 2n, 20n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 10n;
      });
      expect(resultArray.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0650
     * @tc.name testBigUint64ArrayFilter065
     * @tc.desc Verify filter() result length is 0 when no elements match the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 10000n;
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0660
     * @tc.name testBigUint64ArrayFilter066
     * @tc.desc Verify filter() result length is 0 when source array is empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0670
     * @tc.name testBigUint64ArrayFilter067
     * @tc.desc Verify filter() result length is 1 when single element matches exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([77n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 77n;
      });
      expect(resultArray.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0680
     * @tc.name testBigUint64ArrayFilter068
     * @tc.desc Verify filter() result byteLength equals result length multiplied by 8 for all-match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      let expectedByteLength: int = resultArray.length * 8;
      expect(resultArray.byteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0690
     * @tc.name testBigUint64ArrayFilter069
     * @tc.desc Verify filter() result byteLength is 0 when no elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 999n;
      });
      expect(resultArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0700
     * @tc.name testBigUint64ArrayFilter070
     * @tc.desc Verify filter() result byteLength equals result length multiplied by BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 2n === 1n;
      });
      let expectedByteLength: int = resultArray.length * resultArray.BYTES_PER_ELEMENT;
      expect(resultArray.byteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0710
     * @tc.name testBigUint64ArrayFilter071
     * @tc.desc Verify filter() result BYTES_PER_ELEMENT is 8 when no elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 999n;
      });
      expect(resultArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0720
     * @tc.name testBigUint64ArrayFilter072
     * @tc.desc Verify filter() result byteOffset is 0 when all elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(resultArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0730
     * @tc.name testBigUint64ArrayFilter073
     * @tc.desc Verify filter() result byteOffset is 0 when no elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 999n;
      });
      expect(resultArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0740
     * @tc.name testBigUint64ArrayFilter074
     * @tc.desc Verify filter() result is not the same reference as source when all elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      let isSameReference: boolean = resultArray === sourceArray;
      expect(isSameReference).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0750
     * @tc.name testBigUint64ArrayFilter075
     * @tc.desc Verify filter() result is not the same reference as source when no elements match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 999n;
      });
      let isSameReference: boolean = resultArray === sourceArray;
      expect(isSameReference).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0760
     * @tc.name testBigUint64ArrayFilter076
     * @tc.desc Verify filter() result is not the same reference as source when source is empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let resultArray = sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      let isSameReference: boolean = resultArray === sourceArray;
      expect(isSameReference).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0770
     * @tc.name testBigUint64ArrayFilter077
     * @tc.desc Verify modifying filter() result does not affect the original array elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let savedOriginal: bigint = sourceArray[0];
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 20n;
      });
      resultArray[0] = 999n;
      expect(sourceArray[0]).assertEqual(savedOriginal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0780
     * @tc.name testBigUint64ArrayFilter078
     * @tc.desc Verify modifying original array does not affect previously obtained filter() result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let resultArray = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 20n;
      });
      let savedResult: bigint = resultArray[0];
      sourceArray[0] = 999n;
      expect(resultArray[0]).assertEqual(savedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0790
     * @tc.name testBigUint64ArrayFilter079
     * @tc.desc Verify two filter() results obtained from the same source are independent of each other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let firstResult = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      let secondResult = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      let savedFirstElement: bigint = firstResult[0];
      secondResult[0] = 99999n;
      expect(firstResult[0]).assertEqual(savedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0800
     * @tc.name testBigUint64ArrayFilter080
     * @tc.desc Verify original array length is unchanged after filter() with all-match predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let originalLength: int = sourceArray.length;
      sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 0n;
      });
      expect(sourceArray.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0810
     * @tc.name testBigUint64ArrayFilter081
     * @tc.desc Verify original array length is unchanged after filter() with no-match predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let originalLength: int = sourceArray.length;
      sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element < 0n;
      });
      expect(sourceArray.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0820
     * @tc.name testBigUint64ArrayFilter082
     * @tc.desc Verify original array byteLength is unchanged after filter() invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let originalByteLength: int = sourceArray.byteLength;
      sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 3n;
      });
      expect(sourceArray.byteLength).assertEqual(originalByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0830
     * @tc.name testBigUint64ArrayFilter083
     * @tc.desc Verify original array byteOffset is unchanged after filter() invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let originalByteOffset: int = sourceArray.byteOffset;
      sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 15n;
      });
      expect(sourceArray.byteOffset).assertEqual(originalByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0840
     * @tc.name testBigUint64ArrayFilter084
     * @tc.desc Verify original array BYTES_PER_ELEMENT is unchanged after filter() invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let originalBPE: int = sourceArray.BYTES_PER_ELEMENT;
      sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(originalBPE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0850
     * @tc.name testBigUint64ArrayFilter085
     * @tc.desc Verify original array element at index 0 is unchanged after filter()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let savedFirstElement: bigint = sourceArray[0];
      sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 150n;
      });
      expect(sourceArray[0]).assertEqual(savedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0860
     * @tc.name testBigUint64ArrayFilter086
     * @tc.desc Verify original array last element is unchanged after filter()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let lastIndex: int = sourceArray.length - 1;
      let savedLastElement: bigint = sourceArray[lastIndex];
      sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element < 35n;
      });
      expect(sourceArray[lastIndex]).assertEqual(savedLastElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0870
     * @tc.name testBigUint64ArrayFilter087
     * @tc.desc Verify original array all elements remain unchanged when filter() matches all
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let savedElements: bigint[] = [sourceArray[0], sourceArray[1], sourceArray[2], sourceArray[3]];
      sourceArray.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(sourceArray[0]).assertEqual(savedElements[0]);
      expect(sourceArray[1]).assertEqual(savedElements[1]);
      expect(sourceArray[2]).assertEqual(savedElements[2]);
      expect(sourceArray[3]).assertEqual(savedElements[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0880
     * @tc.name testBigUint64ArrayFilter088
     * @tc.desc Verify original array all elements remain unchanged when filter() matches none
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 6n, 7n, 8n]);
      let savedElements: bigint[] = [sourceArray[0], sourceArray[1], sourceArray[2], sourceArray[3]];
      sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element < 0n;
      });
      expect(sourceArray[0]).assertEqual(savedElements[0]);
      expect(sourceArray[1]).assertEqual(savedElements[1]);
      expect(sourceArray[2]).assertEqual(savedElements[2]);
      expect(sourceArray[3]).assertEqual(savedElements[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0890
     * @tc.name testBigUint64ArrayFilter089
     * @tc.desc Verify chained filter() calls (double filtering) produce correct final result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let intermediateResult = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      let finalResult = intermediateResult.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element < 5n;
      });
      expect(finalResult.length).assertEqual(2);
      expect(finalResult[0]).assertEqual(3n);
      expect(finalResult[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0900
     * @tc.name testBigUint64ArrayFilter090
     * @tc.desc Verify two independent filter() calls on the same source with different predicates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let lowPassResult = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element <= 2n;
      });
      let highPassResult = sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      expect(lowPassResult.length).assertEqual(2);
      expect(highPassResult.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0910
     * @tc.name testBigUint64ArrayFilter091
     * @tc.desc Verify filter() callback throws an error mid-iteration, exception propagates to caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      try {
        sourceArray.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          if (element === 2n) {
            throw new Error('callback error');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0920
     * @tc.name testBigUint64ArrayFilter092
     * @tc.desc Verify filter() callback throws on the first element, subsequent callback is not reached
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n, 300n]);
      let reachedSecondElement: boolean = false;
      try {
        sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          if (index === 0) {
            throw new Error('first element error');
          }
          reachedSecondElement = true;
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(reachedSecondElement).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0930
     * @tc.name testBigUint64ArrayFilter093
     * @tc.desc Verify filter() callback mutation of a later source element affects later predicate selection
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let observedSecondElement: bigint = 0n;
      let filterResult = sourceArray.filter((element: bigint, index: int, array: BigUint64Array): boolean => {
        if (index === 0) {
          array[1] = 9n;
          return false;
        }
        if (index === 1) {
          observedSecondElement = element;
        }
        return element === 9n;
      });
      expect(observedSecondElement).assertEqual(9n);
      expect(filterResult.length).assertEqual(1);
      expect(filterResult[0]).assertEqual(9n);
      expect(sourceArray[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0940
     * @tc.name testBigUint64ArrayFilter094
     * @tc.desc Verify filter on non-zero byteOffset view returns an independent buffer from the shared source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      let offsetView = new BigUint64Array(sharedBuffer, 8, 3);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let thresholdValue: bigint = 30n;
      let filterResult = offsetView.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= thresholdValue;
      });
      let sharesSourceBuffer: boolean = filterResult.buffer === sharedBuffer;
      expect(sharesSourceBuffer).assertFalse();
      expect(filterResult.length).assertEqual(2);
      filterResult[0] = 99n;
      expect(filterResult[0]).assertEqual(99n);
      expect(filterResult[1]).assertEqual(40n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0950
     * @tc.name testBigUint64ArrayFilter095
     * @tc.desc Verify filter() on an ArrayBuffer offset view uses local callback indices for the window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let filterResult = windowView.filter((element: bigint, index: int, array: BigUint64Array): boolean => {
        observedIndexSum = observedIndexSum + index;
        return array[index] === element && index === 1;
      });
      expect(observedIndexSum).assertEqual(1);
      expect(filterResult.length).assertEqual(1);
      expect(filterResult[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0960
     * @tc.name testBigUint64ArrayFilter096
     * @tc.desc Verify subarray.filter() observes parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let windowView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let filterResult = windowView.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element >= 90n;
      });
      expect(filterResult.length).assertEqual(1);
      expect(filterResult[0]).assertEqual(99n);
      filterResult[0] = 77n;
      expect(sourceArray[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0970
     * @tc.name testBigUint64ArrayFilter097
     * @tc.desc Verify filter() propagates an exception thrown on the last callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.filter((_element: bigint, index: int, _array: BigUint64Array): boolean => {
          callCount++;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0980
     * @tc.name testBigUint64ArrayFilter098
     * @tc.desc Verify filter() on nested byteOffset subarray keeps local window elements by index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let observedIndexSum: int = 0;
      let observedByteOffset: int = 0;
      let filterResult = sourceView.filter((_element: bigint, index: int, array: BigUint64Array): boolean => {
        observedIndexSum = observedIndexSum + index;
        observedByteOffset = array.byteOffset;
        return index !== 1;
      });
      let sharesSourceBuffer: boolean = filterResult.buffer === sharedBuffer;
      expect(observedIndexSum).assertEqual(3);
      expect(observedByteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(3);
      expect(sourceView.byteOffset).assertEqual(16);
      expect(filterResult.length).assertEqual(2);
      expect(filterResult[0]).assertEqual(30n);
      expect(filterResult[1]).assertEqual(50n);
      expect(sharesSourceBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_0990
     * @tc.name testBigUint64ArrayFilter099
     * @tc.desc Verify filter() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let filterResult = sliceCopy.filter((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 35n;
      });
      let sharesSliceBuffer: boolean = sliceCopy.buffer === sharedBuffer;
      let sharesResultBuffer: boolean = filterResult.buffer === sharedBuffer;
      expect(sharesSliceBuffer).assertFalse();
      expect(sharesResultBuffer).assertFalse();
      expect(sliceCopy[0]).assertEqual(30n);
      expect(sliceCopy[1]).assertEqual(40n);
      expect(sourceView[1]).assertEqual(777n);
      expect(filterResult.length).assertEqual(1);
      expect(filterResult[0]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_1000
     * @tc.name testBigUint64ArrayFilter100
     * @tc.desc Verify filter() on zero-length byteOffset view returns empty result without callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let callCount: int = 0;
      let filterResult = sourceView.filter((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return true;
      });
      expect(sourceView.byteOffset).assertEqual(16);
      expect(sourceView.length).assertEqual(0);
      expect(filterResult.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_1010
     * @tc.name testBigUint64ArrayFilter101
     * @tc.desc Verify filter() on a Set source observes values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let callCount: int = 0;
      let filterResult = sourceArray.filter((element: bigint, index: int, array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return array.length === 3 && index >= 1 && element >= 11n;
      });
      expect(sourceArray.length).assertEqual(3);
      expect(callCount).assertEqual(3);
      expect(filterResult.length).assertEqual(2);
      expect(filterResult[0]).assertEqual(11n);
      expect(filterResult[1]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_1020
     * @tc.name testBigUint64ArrayFilter102
     * @tc.desc Verify filter() on an advanced iterator source uses local indices for the remaining window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let observedIndexTotal: int = 0;
      let filterResult = sourceArray.filter((element: bigint, index: int, array: BigUint64Array): boolean => {
        observedIndexTotal = observedIndexTotal + index;
        return array[0] === 10n && index > 0 && element >= 15n;
      });
      expect(sourceArray.length).assertEqual(3);
      expect(observedIndexTotal).assertEqual(3);
      expect(filterResult.length).assertEqual(2);
      expect(filterResult[0]).assertEqual(15n);
      expect(filterResult[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FILTER_1030
     * @tc.name testBigUint64ArrayFilter103
     * @tc.desc Verify filter() observes an unvisited source value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFilter103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLaterValue: bigint = 0n;
      let filterResult = sourceView.filter((element: bigint, index: int,
        _array: BigUint64Array): boolean => {
        if (index === 0) {
          siblingView[0] = 9n;
        }
        if (index === 1) {
          observedLaterValue = element;
        }
        return element === 9n;
      });
      expect(observedLaterValue).assertEqual(9n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
      expect(filterResult.length).assertEqual(1);
      expect(filterResult[0]).assertEqual(9n);
    });
  });
}
