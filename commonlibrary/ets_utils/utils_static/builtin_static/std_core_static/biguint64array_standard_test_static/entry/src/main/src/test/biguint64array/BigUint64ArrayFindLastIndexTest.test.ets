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

export default function biguint64arrayFindLastIndexTest(): void {

  describe('BigUint64ArrayFindLastIndexTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0010
     * @tc.name testBigUint64ArrayFindLastIndex001
     * @tc.desc Verify findLastIndex() returns length-1 when predicate matches the last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 4n;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0020
     * @tc.name testBigUint64ArrayFindLastIndex002
     * @tc.desc Verify findLastIndex() returns 0 when only the first element matches the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 2n, 2n, 2n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 5n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0030
     * @tc.name testBigUint64ArrayFindLastIndex003
     * @tc.desc Verify findLastIndex() returns the middle index when predicate matches a middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 1n, 1n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0040
     * @tc.name testBigUint64ArrayFindLastIndex004
     * @tc.desc Verify findLastIndex() returns the rightmost index when multiple elements match the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 1n, 7n, 2n, 7n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 7n;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0050
     * @tc.name testBigUint64ArrayFindLastIndex005
     * @tc.desc Verify findLastIndex() returns length-1 when every element matches the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 3n, 3n, 3n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0060
     * @tc.name testBigUint64ArrayFindLastIndex006
     * @tc.desc Verify findLastIndex() returns -1 when no element satisfies the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 7n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0070
     * @tc.name testBigUint64ArrayFindLastIndex007
     * @tc.desc Verify findLastIndex() returns 0 on a single element array when the predicate matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 42n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0080
     * @tc.name testBigUint64ArrayFindLastIndex008
     * @tc.desc Verify findLastIndex() returns -1 on a single element array when the predicate does not match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 99n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0090
     * @tc.name testBigUint64ArrayFindLastIndex009
     * @tc.desc Verify findLastIndex() returns -1 on an empty array without invoking the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let called: boolean = false;
      let result: int = sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        called = true;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0100
     * @tc.name testBigUint64ArrayFindLastIndex010
     * @tc.desc Verify findLastIndex() passes length-1 as the first callback index searching right to left
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let firstIndex: int = -1;
      let captured: boolean = false;
      sourceArray.findLastIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (!captured) {
          firstIndex = index;
          captured = true;
        }
        return false;
      });
      expect(firstIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0110
     * @tc.name testBigUint64ArrayFindLastIndex011
     * @tc.desc Verify findLastIndex() passes 0 as the last callback index when no element matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let lastIndex: int = -1;
      sourceArray.findLastIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        lastIndex = index;
        return false;
      });
      expect(lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0120
     * @tc.name testBigUint64ArrayFindLastIndex012
     * @tc.desc Verify findLastIndex() passes callback indices that strictly decrease by one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let prevIndex: int = sourceArray.length;
      let decreasing: boolean = true;
      sourceArray.findLastIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (index !== prevIndex - 1) {
          decreasing = false;
        }
        prevIndex = index;
        return false;
      });
      expect(decreasing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0130
     * @tc.name testBigUint64ArrayFindLastIndex013
     * @tc.desc Verify findLastIndex() short-circuits and invokes the callback once when the last element matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let callCount: int = 0;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return element === 4n;
      });
      expect(result).assertEqual(3);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0140
     * @tc.name testBigUint64ArrayFindLastIndex014
     * @tc.desc Verify findLastIndex() short-circuits at a middle match and stops visiting lower indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let callCount: int = 0;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return element === 3n;
      });
      expect(result).assertEqual(2);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0150
     * @tc.name testBigUint64ArrayFindLastIndex015
     * @tc.desc Verify findLastIndex() invokes the callback length times when no element matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0160
     * @tc.name testBigUint64ArrayFindLastIndex016
     * @tc.desc Verify findLastIndex() visits elements right to left recording values in descending index order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let visited = new BigUint64Array(3);
      let pos: int = 0;
      sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        visited[pos] = element;
        pos = pos + 1;
        return false;
      });
      expect(visited[0]).assertEqual(3n);
      expect(visited[1]).assertEqual(2n);
      expect(visited[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0170
     * @tc.name testBigUint64ArrayFindLastIndex017
     * @tc.desc Verify findLastIndex() passes length-1 as the first callback index on a two element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let firstIndex: int = -1;
      let captured: boolean = false;
      sourceArray.findLastIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (!captured) {
          firstIndex = index;
          captured = true;
        }
        return false;
      });
      expect(firstIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0180
     * @tc.name testBigUint64ArrayFindLastIndex018
     * @tc.desc Verify findLastIndex() accepts an expression body arrow function as the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let result: int =
        sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => element > 8n);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0190
     * @tc.name testBigUint64ArrayFindLastIndex019
     * @tc.desc Verify findLastIndex() predicate uses all three params with a composite condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: int = sourceArray.findLastIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        return element > 2n && index < 3 && array.length === 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0200
     * @tc.name testBigUint64ArrayFindLastIndex020
     * @tc.desc Verify findLastIndex() callback uses only the element parameter to match by value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0210
     * @tc.name testBigUint64ArrayFindLastIndex021
     * @tc.desc Verify findLastIndex() callback uses only the element parameter with no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 8n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 999n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0220
     * @tc.name testBigUint64ArrayFindLastIndex022
     * @tc.desc Verify findLastIndex() callback uses only the index parameter to match a specific index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 15n, 25n, 35n]);
      let result: int = sourceArray.findLastIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0230
     * @tc.name testBigUint64ArrayFindLastIndex023
     * @tc.desc Verify findLastIndex() callback uses only the index parameter with no matching index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 1n, 1n]);
      let result: int = sourceArray.findLastIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0240
     * @tc.name testBigUint64ArrayFindLastIndex024
     * @tc.desc Verify findLastIndex() callback uses only the array parameter via array.length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let result: int = sourceArray.findLastIndex((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        return array.length === 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0250
     * @tc.name testBigUint64ArrayFindLastIndex025
     * @tc.desc Verify findLastIndex() callback uses element and index with a composite condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let result: int = sourceArray.findLastIndex((element: bigint, index: int, _array: BigUint64Array): boolean => {
        return element === 5n && index === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0260
     * @tc.name testBigUint64ArrayFindLastIndex026
     * @tc.desc Verify findLastIndex() callback uses element and array comparing element with array at a fixed index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, array: BigUint64Array): boolean => {
        return element === array[2];
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0270
     * @tc.name testBigUint64ArrayFindLastIndex027
     * @tc.desc Verify findLastIndex() callback uses index and array comparing index with the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: int = sourceArray.findLastIndex((_element: bigint, index: int, array: BigUint64Array): boolean => {
        return index === array.length - 1;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0280
     * @tc.name testBigUint64ArrayFindLastIndex028
     * @tc.desc Verify findLastIndex() callback cross-validates element index and array on each invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 15n, 25n]);
      let result: int = sourceArray.findLastIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        return element === array[index] && index < array.length;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0290
     * @tc.name testBigUint64ArrayFindLastIndex029
     * @tc.desc Verify findLastIndex() returns length-1 when the predicate ignores all params and returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: int = sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0300
     * @tc.name testBigUint64ArrayFindLastIndex030
     * @tc.desc Verify findLastIndex() returns -1 when the predicate ignores all params and returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: int = sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0310
     * @tc.name testBigUint64ArrayFindLastIndex031
     * @tc.desc Verify findLastIndex() predicate uses strict equality to match the rightmost equal element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 7n, 3n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0320
     * @tc.name testBigUint64ArrayFindLastIndex032
     * @tc.desc Verify findLastIndex() predicate uses greater-than to return the rightmost greater element index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 6n, 3n, 8n, 2n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 5n;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0330
     * @tc.name testBigUint64ArrayFindLastIndex033
     * @tc.desc Verify findLastIndex() returns length-1 when the predicate always returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let result: int = sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return true;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0340
     * @tc.name testBigUint64ArrayFindLastIndex034
     * @tc.desc Verify findLastIndex() returns -1 when the predicate always returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: int = sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0350
     * @tc.name testBigUint64ArrayFindLastIndex035
     * @tc.desc Verify findLastIndex() predicate uses logical negation to match the rightmost non-target element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 1n, 2n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return !(element === 1n);
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0360
     * @tc.name testBigUint64ArrayFindLastIndex036
     * @tc.desc Verify findLastIndex() predicate uses modulo to match the rightmost odd element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 5n, 8n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element % 2n === 1n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0370
     * @tc.name testBigUint64ArrayFindLastIndex037
     * @tc.desc Verify findLastIndex() matches the zero value in a mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 0n, 2n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0380
     * @tc.name testBigUint64ArrayFindLastIndex038
     * @tc.desc Verify findLastIndex() matches the signed int64 max value in a mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signedInt64Max: bigint = 9223372036854775807n;
      let sourceArray = new BigUint64Array([1n, signedInt64Max, 2n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === signedInt64Max;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0390
     * @tc.name testBigUint64ArrayFindLastIndex039
     * @tc.desc Verify findLastIndex() matches a large decimal value in a mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let largeValue: bigint = 99999999n;
      let sourceArray = new BigUint64Array([0n, largeValue, 1n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === largeValue;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0400
     * @tc.name testBigUint64ArrayFindLastIndex040
     * @tc.desc Verify findLastIndex() matches the value 1n in a mixed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 1n, 0n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0410
     * @tc.name testBigUint64ArrayFindLastIndex041
     * @tc.desc Verify findLastIndex() returns -1 searching a nonzero value in an all zero array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0420
     * @tc.name testBigUint64ArrayFindLastIndex042
     * @tc.desc Verify findLastIndex() with a zero equality predicate on an all max array returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, maxUint64]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0430
     * @tc.name testBigUint64ArrayFindLastIndex043
     * @tc.desc Verify findLastIndex() with a zero equality predicate on a max and zero mixed array returns the rightmost zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, 0n, maxUint64, 0n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0440
     * @tc.name testBigUint64ArrayFindLastIndex044
     * @tc.desc Verify findLastIndex() short-circuits before a leading max element and matches the rightmost value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, 42n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 42n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0450
     * @tc.name testBigUint64ArrayFindLastIndex045
     * @tc.desc Verify findLastIndex() with a zero equality predicate on an array with a -1n wrapped max element returns -1 and leaves the wrapped element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray[1] = -1n;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray[1]).assertEqual(maxUint64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0460
     * @tc.name testBigUint64ArrayFindLastIndex046
     * @tc.desc Verify findLastIndex() leaves a leading max element unchanged via direct subscript read
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([maxUint64, 5n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 5n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray[0]).assertEqual(maxUint64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0470
     * @tc.name testBigUint64ArrayFindLastIndex047
     * @tc.desc Verify findLastIndex() leaves the array length unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let lengthBefore: int = sourceArray.length;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0480
     * @tc.name testBigUint64ArrayFindLastIndex048
     * @tc.desc Verify findLastIndex() leaves the array length unchanged after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let lengthBefore: int = sourceArray.length;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 99n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0490
     * @tc.name testBigUint64ArrayFindLastIndex049
     * @tc.desc Verify findLastIndex() leaves an empty array length at 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let lengthBefore: int = sourceArray.length;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0500
     * @tc.name testBigUint64ArrayFindLastIndex050
     * @tc.desc Verify findLastIndex() leaves a single element array length at 1 after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([42n]);
      let lengthBefore: int = sourceArray.length;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 42n;
      });
      expect(result).assertEqual(0);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0510
     * @tc.name testBigUint64ArrayFindLastIndex051
     * @tc.desc Verify findLastIndex() leaves the array length unchanged after multiple calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let lengthBefore: int = sourceArray.length;
      sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 3n;
      });
      sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return false;
      });
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0520
     * @tc.name testBigUint64ArrayFindLastIndex052
     * @tc.desc Verify findLastIndex() leaves a buffer backed view length unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sharedBuffer, 0, 3);
      sourceArray[0] = 10n;
      sourceArray[1] = 20n;
      sourceArray[2] = 30n;
      let lengthBefore: int = sourceArray.length;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.length).assertEqual(lengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0530
     * @tc.name testBigUint64ArrayFindLastIndex053
     * @tc.desc Verify findLastIndex() leaves the array byteLength unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let byteLengthBefore: int = sourceArray.byteLength;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0540
     * @tc.name testBigUint64ArrayFindLastIndex054
     * @tc.desc Verify findLastIndex() leaves the array byteLength unchanged after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let byteLengthBefore: int = sourceArray.byteLength;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 99n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0550
     * @tc.name testBigUint64ArrayFindLastIndex055
     * @tc.desc Verify findLastIndex() leaves an empty array byteLength at 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(0);
      let byteLengthBefore: int = sourceArray.byteLength;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 1n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0560
     * @tc.name testBigUint64ArrayFindLastIndex056
     * @tc.desc Verify findLastIndex() leaves the array byteLength unchanged after multiple calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let byteLengthBefore: int = sourceArray.byteLength;
      sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element > 2n;
      });
      sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 4n;
      });
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0570
     * @tc.name testBigUint64ArrayFindLastIndex057
     * @tc.desc Verify findLastIndex() leaves byteLength equal to length times BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 2n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.byteLength).assertEqual(sourceArray.length * sourceArray.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0580
     * @tc.name testBigUint64ArrayFindLastIndex058
     * @tc.desc Verify findLastIndex() leaves a buffer backed view byteLength unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sharedBuffer, 0, 3);
      sourceArray[0] = 5n;
      sourceArray[1] = 15n;
      sourceArray[2] = 25n;
      let byteLengthBefore: int = sourceArray.byteLength;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 15n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0590
     * @tc.name testBigUint64ArrayFindLastIndex059
     * @tc.desc Verify findLastIndex() leaves the byteOffset unchanged on a buffer backed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(sharedBuffer, 8, 3);
      sourceArray[0] = 5n;
      sourceArray[1] = 10n;
      sourceArray[2] = 15n;
      let offsetBefore: int = sourceArray.byteOffset;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 10n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0600
     * @tc.name testBigUint64ArrayFindLastIndex060
     * @tc.desc Verify findLastIndex() leaves the underlying buffer byteLength unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(16);
      let sourceArray = new BigUint64Array(sharedBuffer, 0, 2);
      sourceArray[0] = 5n;
      sourceArray[1] = 10n;
      let bufferByteLengthBefore: int = sourceArray.buffer.byteLength;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 10n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.buffer.byteLength).assertEqual(bufferByteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0610
     * @tc.name testBigUint64ArrayFindLastIndex061
     * @tc.desc Verify findLastIndex() leaves the first element unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let valueBefore: bigint = sourceArray[0];
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray[0]).assertEqual(valueBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0620
     * @tc.name testBigUint64ArrayFindLastIndex062
     * @tc.desc Verify findLastIndex() leaves the last element unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let valueBefore: bigint = sourceArray[2];
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray[2]).assertEqual(valueBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0630
     * @tc.name testBigUint64ArrayFindLastIndex063
     * @tc.desc Verify findLastIndex() leaves a middle element unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let valueBefore: bigint = sourceArray[2];
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 40n;
      });
      expect(result).assertEqual(3);
      expect(sourceArray[2]).assertEqual(valueBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0640
     * @tc.name testBigUint64ArrayFindLastIndex064
     * @tc.desc Verify findLastIndex() leaves all elements unchanged after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let firstBefore: bigint = sourceArray[0];
      let secondBefore: bigint = sourceArray[1];
      let thirdBefore: bigint = sourceArray[2];
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 9n;
      });
      expect(result).assertEqual(2);
      expect(sourceArray[0]).assertEqual(firstBefore);
      expect(sourceArray[1]).assertEqual(secondBefore);
      expect(sourceArray[2]).assertEqual(thirdBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0650
     * @tc.name testBigUint64ArrayFindLastIndex065
     * @tc.desc Verify findLastIndex() leaves all elements unchanged after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let firstBefore: bigint = sourceArray[0];
      let secondBefore: bigint = sourceArray[1];
      let thirdBefore: bigint = sourceArray[2];
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 0n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray[0]).assertEqual(firstBefore);
      expect(sourceArray[1]).assertEqual(secondBefore);
      expect(sourceArray[2]).assertEqual(thirdBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0660
     * @tc.name testBigUint64ArrayFindLastIndex066
     * @tc.desc Verify findLastIndex() leaves BYTES_PER_ELEMENT at 8 after a match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0670
     * @tc.name testBigUint64ArrayFindLastIndex067
     * @tc.desc Verify findLastIndex() leaves BYTES_PER_ELEMENT at 8 after no match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 99n;
      });
      expect(result).assertEqual(-1);
      expect(sourceArray.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0680
     * @tc.name testBigUint64ArrayFindLastIndex068
     * @tc.desc Verify an exception thrown inside the findLastIndex predicate propagates to the caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      try {
        sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          throw new Error('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0690
     * @tc.name testBigUint64ArrayFindLastIndex069
     * @tc.desc Verify findLastIndex() propagates a first call exception and invokes the callback once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0700
     * @tc.name testBigUint64ArrayFindLastIndex070
     * @tc.desc Verify findLastIndex() propagates a mid traversal exception and stops further callbacks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount: int = 0;
      try {
        sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (callCount === 2) {
            throw new Error('callback error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0710
     * @tc.name testBigUint64ArrayFindLastIndex071
     * @tc.desc Verify a TypeError thrown inside the findLastIndex predicate propagates to the caller
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      try {
        sourceArray.findLastIndex((_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          throw new TypeError('type mismatch');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0720
     * @tc.name testBigUint64ArrayFindLastIndex072
     * @tc.desc Verify findLastIndex() callback mutation of an element is observable after the call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      sourceArray.findLastIndex((_element: bigint, _index: int, array: BigUint64Array): boolean => {
        array[0] = 0n;
        return false;
      });
      expect(sourceArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0730
     * @tc.name testBigUint64ArrayFindLastIndex073
     * @tc.desc Verify findLastIndex() callback accumulates the sum of all visited values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let sum: bigint = 0n;
      sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        sum = sum + element;
        return false;
      });
      expect(sum).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0740
     * @tc.name testBigUint64ArrayFindLastIndex074
     * @tc.desc Verify findLastIndex() predicate is a closure reading an external BigInt threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let externalTarget: bigint = 30n;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === externalTarget;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0750
     * @tc.name testBigUint64ArrayFindLastIndex075
     * @tc.desc Verify findLastIndex() predicate is a closure reading an external int target index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let targetIdx: int = 2;
      let result: int = sourceArray.findLastIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
        return index === targetIdx;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0760
     * @tc.name testBigUint64ArrayFindLastIndex076
     * @tc.desc Verify findLastIndex() predicate uses an external boolean flag to switch the match condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n]);
      let searchOdd: boolean = true;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        if (searchOdd) {
          return element % 2n === 1n;
        }
        return element % 2n === 0n;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0770
     * @tc.name testBigUint64ArrayFindLastIndex077
     * @tc.desc Verify findLastIndex() callback observes a later element mutated in a prior iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let capturedValue: bigint = 0n;
      sourceArray.findLastIndex((_element: bigint, index: int, array: BigUint64Array): boolean => {
        if (index === 2) {
          array[0] = 99n;
        }
        if (index === 0) {
          capturedValue = sourceArray[0];
        }
        return false;
      });
      expect(capturedValue).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0780
     * @tc.name testBigUint64ArrayFindLastIndex078
     * @tc.desc Verify findLastIndex() callback mutation of an already visited element does not change the result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result: int = sourceArray.findLastIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        if (index === 3) {
          array[3] = 999n;
        }
        return element === 1n;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0790
     * @tc.name testBigUint64ArrayFindLastIndex079
     * @tc.desc Verify findLastIndex() callback writes the max value and a later direct read observes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxUint64: bigint = 18446744073709551615n;
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.findLastIndex((_element: bigint, index: int, array: BigUint64Array): boolean => {
        if (index === 2) {
          array[0] = maxUint64;
        }
        return false;
      });
      expect(sourceArray[0]).assertEqual(maxUint64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0800
     * @tc.name testBigUint64ArrayFindLastIndex080
     * @tc.desc Verify findLastIndex() on an array built via BigUint64Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0810
     * @tc.name testBigUint64ArrayFindLastIndex081
     * @tc.desc Verify findLastIndex() on an array built via length constructor and index assignment
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = 10n;
      sourceArray[1] = 20n;
      sourceArray[2] = 30n;
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0820
     * @tc.name testBigUint64ArrayFindLastIndex082
     * @tc.desc Verify findLastIndex() on an array built via copy constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let seedArray = new BigUint64Array([10n, 20n, 30n]);
      let sourceArray = new BigUint64Array(seedArray);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 20n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0830
     * @tc.name testBigUint64ArrayFindLastIndex083
     * @tc.desc Verify findLastIndex() on a subarray returns a view relative index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let subView = parentArray.subarray(1, 4);
      let result: int = subView.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 30n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0840
     * @tc.name testBigUint64ArrayFindLastIndex084
     * @tc.desc Verify findLastIndex() on a subarray leaves the parent element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let subView = parentArray.subarray(1, 3);
      let result: int = subView.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(result).assertEqual(1);
      expect(parentArray[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0850
     * @tc.name testBigUint64ArrayFindLastIndex085
     * @tc.desc Verify findLastIndex() on a non zero byteOffset view returns a view relative index not buffer absolute
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 4n;
      let offsetView = new BigUint64Array(sharedBuffer, 8, 2);
      let result: int = offsetView.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0860
     * @tc.name testBigUint64ArrayFindLastIndex086
     * @tc.desc Verify findLastIndex() on one shared buffer view leaves the other view unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(24);
      let firstView = new BigUint64Array(sharedBuffer, 0, 3);
      let secondView = new BigUint64Array(sharedBuffer, 0, 3);
      firstView[0] = 5n;
      firstView[1] = 10n;
      firstView[2] = 15n;
      let result: int = firstView.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 10n;
      });
      expect(result).assertEqual(1);
      expect(secondView[1]).assertEqual(10n);
      expect(secondView.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0870
     * @tc.name testBigUint64ArrayFindLastIndex087
     * @tc.desc Verify findLastIndex() on a subarray leaves the subarray byteOffset unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subView = parentArray.subarray(1, 3);
      let offsetBefore: int = subView.byteOffset;
      let result: int = subView.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 3n;
      });
      expect(result).assertEqual(1);
      expect(subView.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0880
     * @tc.name testBigUint64ArrayFindLastIndex088
     * @tc.desc Verify findLastIndex() returned index reads the matching element via subscript
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n, 20n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 15n;
      });
      expect(sourceArray[result]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0890
     * @tc.name testBigUint64ArrayFindLastIndex089
     * @tc.desc Verify findLastIndex() returned match index is strictly less than the array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 4n;
      });
      expect(result < sourceArray.length).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0900
     * @tc.name testBigUint64ArrayFindLastIndex090
     * @tc.desc Verify findLastIndex() returned match index produces the decimal string via toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 200n;
      });
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0910
     * @tc.name testBigUint64ArrayFindLastIndex091
     * @tc.desc Verify findLastIndex() returned -1 produces the string via toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([100n, 200n]);
      let result: int = sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 999n;
      });
      expect(result.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0920
     * @tc.name testBigUint64ArrayFindLastIndex092
     * @tc.desc Verify findLastIndex() on the same array twice returns the same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 2n]);
      let firstResult: int =
        sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 2n;
        });
      let secondResult: int =
        sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 2n;
        });
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0930
     * @tc.name testBigUint64ArrayFindLastIndex093
     * @tc.desc Verify findLastIndex() with different predicates returns each correct result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let firstResult: int =
        sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element === 3n;
        });
      let secondResult: int =
        sourceArray.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
          return element > 2n;
        });
      expect(firstResult).assertEqual(2);
      expect(secondResult).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0940
     * @tc.name testBigUint64ArrayFindLastIndex094
     * @tc.desc Verify findLastIndex() on an ArrayBuffer offset view reports local callback indices in reverse order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let baseView = new BigUint64Array(sharedBuffer);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      baseView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let windowView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let firstCallbackIndex: int = -1;
      let secondCallbackIndex: int = -1;
      let callCount: int = 0;
      let result: int = windowView.findLastIndex((element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (callCount === 0) {
          firstCallbackIndex = index;
        }
        if (callCount === 1) {
          secondCallbackIndex = index;
        }
        callCount = callCount + 1;
        return element === 20n;
      });
      expect(result).assertEqual(0);
      expect(firstCallbackIndex).assertEqual(1);
      expect(secondCallbackIndex).assertEqual(0);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0950
     * @tc.name testBigUint64ArrayFindLastIndex095
     * @tc.desc Verify findLastIndex() on a subarray observes parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let windowView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let result: int = windowView.findLastIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        return element === 99n && array[index] === 99n;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0960
     * @tc.name testBigUint64ArrayFindLastIndex096
     * @tc.desc Verify findLastIndex() propagates an exception thrown on the last callback invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      try {
        sourceArray.findLastIndex((_element: bigint, index: int, _array: BigUint64Array): boolean => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0970
     * @tc.name testBigUint64ArrayFindLastIndex097
     * @tc.desc Verify findLastIndex() on a nested byteOffset subarray uses local reverse callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: int = nestedWindow.findLastIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
        callbackOrder = callbackOrder * 10 + index;
        return array[index] === element && index === 0;
      });
      expect(result).assertEqual(0);
      expect(callbackOrder).assertEqual(210);
      expect(nestedWindow.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0980
     * @tc.name testBigUint64ArrayFindLastIndex098
     * @tc.desc Verify findLastIndex() on a slice copy from a byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: int = sliceCopy.findLastIndex((element: bigint, _index: int, _array: BigUint64Array): boolean => {
        return element === 30n;
      });
      let usesIndependentBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      expect(result).assertEqual(0);
      expect(sliceCopy[0]).assertEqual(30n);
      expect(fullView[2]).assertEqual(777n);
      expect(usesIndependentBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_0990
     * @tc.name testBigUint64ArrayFindLastIndex099
     * @tc.desc Verify findLastIndex() on a zero-length byteOffset view returns negative one without callbacks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      let result: int = zeroLengthView.findLastIndex(
        (_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return true;
        });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_1000
     * @tc.name testBigUint64ArrayFindLastIndex100
     * @tc.desc Verify findLastIndex() on a Set source uses local indices after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<BigInt>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let callCount: int = 0;
      let result: int =
        sourceArray.findLastIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 11n && index === 1 && array.length === 3;
        });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_1010
     * @tc.name testBigUint64ArrayFindLastIndex101
     * @tc.desc Verify findLastIndex() on an advanced iterator source uses local reverse callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let callCount: int = 0;
      let result: int =
        sourceArray.findLastIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 15n && index === 1 && array[2] === 20n;
        });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_1020
     * @tc.name testBigUint64ArrayFindLastIndex102
     * @tc.desc Verify findLastIndex() short circuit prevents lower index callback side effects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let callCount: int = 0;
      let result: int =
        sourceArray.findLastIndex((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          if (index === 0) {
            array[2] = 99n;
          }
          return element === 4n;
        });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_FINDLASTINDEX_1030
     * @tc.name testBigUint64ArrayFindLastIndex103
     * @tc.desc Verify findLastIndex() observes an unvisited lower index written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayFindLastIndex103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLowerValue: bigint = 0n;
      let result: int = sourceView.findLastIndex((element: bigint, index: int,
        _array: BigUint64Array): boolean => {
        if (index === 2) {
          siblingView[0] = 9n;
        }
        if (index === 1) {
          observedLowerValue = element;
        }
        return element === 9n;
      });
      expect(result).assertEqual(1);
      expect(observedLowerValue).assertEqual(9n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });

  });
}
