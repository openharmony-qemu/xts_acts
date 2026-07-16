'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayFindLastIndexGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayFindLastIndexTest(): void {
  describe('ReadonlyArrayFindLastIndexTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0010
     * @tc.name testReadonlyArrayFindLastIndex001
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: passing predicate callback verify find Last Index and returns correctly index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = values.findLastIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0020
     * @tc.name testReadonlyArrayFindLastIndex002
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate is value, index, obj parameter and returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2, 5];
      const result = values.findLastIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0030
     * @tc.name testReadonlyArrayFindLastIndex003
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate callback parameter value index obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 20];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 20;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0040
     * @tc.name testReadonlyArrayFindLastIndex004
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate value index parameter checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 10, 15, 20];
      const result = values.findLastIndex((value: int, index: int): boolean => {
        return index > 1 && value > 10;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0050
     * @tc.name testReadonlyArrayFindLastIndex005
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate parameter value index obj checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2, 4];
      const result = values.findLastIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value == 2 && index < 4 && obj.length > 3;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0060
     * @tc.name testReadonlyArrayFindLastIndex006
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: verify predicate callback value parameter is before iteration element passing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const visited: number[] = [];
      values.findLastIndex((value: int): boolean => {
        visited.push(value);
        return false;
      });
      expect(visited[0]).assertEqual(3);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0070
     * @tc.name testReadonlyArrayFindLastIndex007
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: verify predicate callback index parameter index iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40];
      const visitedIndex: number[] = [];
      values.findLastIndex((value: int, index: int): boolean => {
        visitedIndex.push(index);
        return false;
      });
      expect(visitedIndex[0]).assertEqual(3);
      expect(visitedIndex[1]).assertEqual(2);
      expect(visitedIndex[2]).assertEqual(1);
      expect(visitedIndex[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0080
     * @tc.name testReadonlyArrayFindLastIndex008
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: verify predicate callback obj parameter is find Last Index original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let refCheck: boolean = false;
      values.findLastIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        if (index == 0) {
          refCheck = (obj.length == values.length && obj[0] == values[0]);
        }
        return false;
      });
      expect(refCheck).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0090
     * @tc.name testReadonlyArrayFindLastIndex009
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate returns true verify returns after element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.findLastIndex((value: int): boolean => {
        return true;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0100
     * @tc.name testReadonlyArrayFindLastIndex010
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate returns false verify returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.findLastIndex((value: int): boolean => {
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0110
     * @tc.name testReadonlyArrayFindLastIndex011
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: exists matches element returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5, 7];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 5;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0120
     * @tc.name testReadonlyArrayFindLastIndex012
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: multiple element matches returns after element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 2, 6, 2];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0130
     * @tc.name testReadonlyArrayFindLastIndex013
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: no element matches predicate returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5, 7];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 10;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0140
     * @tc.name testReadonlyArrayFindLastIndex014
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: empty array find Last Index returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 1;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0150
     * @tc.name testReadonlyArrayFindLastIndex015
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: element element matches returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 42;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0160
     * @tc.name testReadonlyArrayFindLastIndex016
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: element element matches returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0170
     * @tc.name testReadonlyArrayFindLastIndex017
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: ReadonlyArray <string> type find Last Index verify generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["apple", "banana", "cherry", "banana"];
      const result = values.findLastIndex((value: string): boolean => {
        return value == "banana";
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0180
     * @tc.name testReadonlyArrayFindLastIndex018
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: ReadonlyArray <double> type find Last Index verify generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2, 3.3, 2.2];
      const result = values.findLastIndex((value: double): boolean => {
        return value == 2.2;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0190
     * @tc.name testReadonlyArrayFindLastIndex019
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: verify element when return value - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.findLastIndex((value: int): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0200
     * @tc.name testReadonlyArrayFindLastIndex020
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: after element matches when returns length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 5;
      });
      expect(result).assertEqual(values.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0210
     * @tc.name testReadonlyArrayFindLastIndex021
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: multiple element when find Last Index returns after index find Index returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2, 4];
      const lastIndex = values.findLastIndex((value: int): boolean => {
        return value == 2;
      });
      const firstIndex = values.findIndex((value: int): boolean => {
        return value == 2;
      });
      expect(lastIndex).assertEqual(3);
      expect(firstIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0220
     * @tc.name testReadonlyArrayFindLastIndex022
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: find Last Index iteration iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2, 4];
      let callCount: number = 0;
      const result = values.findLastIndex((value: int): boolean => {
        callCount++;
        return value == 2;
      });
      expect(result).assertEqual(3);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0230
     * @tc.name testReadonlyArrayFindLastIndex023
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: verify find Last Index return value is int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result: int = values.findLastIndex((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0240
     * @tc.name testReadonlyArrayFindLastIndex024
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: verify return value is non - or - 1 returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values1: ReadonlyArray<int> = [10, 20, 30];
      const result1 = values1.findLastIndex((value: int): boolean => {
        return value == 20;
      });
      expect(result1).assertEqual(1);

      const values2: ReadonlyArray<int> = [1, 2, 3];
      const result2 = values2.findLastIndex((value: int): boolean => {
        return value == 99;
      });
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0250
     * @tc.name testReadonlyArrayFindLastIndex025
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: large array after element correctly verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<int> = [];
      for (let i = 0; i < 10000; i++) {
        values.push(i % 100);
      }
      const readonlyValues: ReadonlyArray<int> = values;
      const result = readonlyValues.findLastIndex((value: int): boolean => {
        return value == 50;
      });
      expect(result).assertEqual(9950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0260
     * @tc.name testReadonlyArrayFindLastIndex026
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: element matches predicate when returns after element index length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 6, 8, 10];
      const result = values.findLastIndex((value: int): boolean => {
        return value % 2 == 0;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0270
     * @tc.name testReadonlyArrayFindLastIndex027
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: find Last Index after verify original array content length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2, 5];
      const originalLength = values.length;
      const result = values.findLastIndex((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(3);
      expect(values.length).assertEqual(originalLength);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
      expect(values[3]).assertEqual(2);
      expect(values[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0280
     * @tc.name testReadonlyArrayFindLastIndex028
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: findLastIndex does not modify ReadonlyArray content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.findLastIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value > 15;
      });
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0290
     * @tc.name testReadonlyArrayFindLastIndex029
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate callback throws an exception when find Last Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      try {
        values.findLastIndex((value: int): boolean => {
          if (value == 2) {
            throw new Error("predicate error");
          }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0300
     * @tc.name testReadonlyArrayFindLastIndex030
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: verify find Last Index returns index and find Last returns element result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2, 4];
      const lastIndex = values.findLastIndex((value: int): boolean => {
        return value == 2;
      });
      const lastValue = values.findLast((value: int): boolean => {
        return value == 2;
      });
      expect(lastIndex).assertEqual(3);
      expect(lastValue).assertEqual(2);
      expect(values[lastIndex]).assertEqual(lastValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0310
     * @tc.name testReadonlyArrayFindLastIndex031
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: ReadonlyArray <boolean> find Last Index after true element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false];
      expect(arr.findLastIndex((value: boolean): boolean => {
          return value;
      })).assertEqual(2);
      expect(arr.findLastIndex((value: boolean): boolean => {
          return !value;
      })).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0320
     * @tc.name testReadonlyArrayFindLastIndex032
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate 0 - 1 1000000 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000, 5];
      const result = arr.findLastIndex((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0330
     * @tc.name testReadonlyArrayFindLastIndex033
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.findLastIndex((value: int): boolean => {
        return value === 0x10;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0340
     * @tc.name testReadonlyArrayFindLastIndex034
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "", "b"];
      const result = arr.findLastIndex((value: string): boolean => {
        return value === "";
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0350
     * @tc.name testReadonlyArrayFindLastIndex035
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate Unicode element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["x", cn, "y"];
      const result = arr.findLastIndex((value: string): boolean => {
        return value === cn;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0360
     * @tc.name testReadonlyArrayFindLastIndex036
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate empty element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const arr: ReadonlyArray<string> = ["a", zwsp, "c"];
      const result = arr.findLastIndex((value: string): boolean => {
        return value === zwsp;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0370
     * @tc.name testReadonlyArrayFindLastIndex037
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: matches element when find Last Index returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5];
      const result = values.findLastIndex((value: int): boolean => {
        return value > 10;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0380
     * @tc.name testReadonlyArrayFindLastIndex038
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: element matches predicate when returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [9];
      const result = values.findLastIndex((value: int): boolean => {
        return value == 9;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0390
     * @tc.name testReadonlyArrayFindLastIndex039
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate parameter obj and reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let sameRef: boolean = false;
      values.findLastIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        sameRef = obj === values;
        return false;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0400
     * @tc.name testReadonlyArrayFindLastIndex040
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: byte predicate find Last Index callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      const result = arr.findLastIndex((value, index: int): boolean => {
        return value === 10 as byte || value === 20 as byte;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0410
     * @tc.name testReadonlyArrayFindLastIndex041
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: char predicate find Last Index callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\u4e2d'];
      const result = arr.findLastIndex((value: char, index: int): boolean => {
        return value === c'a' || value === c'\u4e2d';
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0420
     * @tc.name testReadonlyArrayFindLastIndex042
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: string emoji predicate find Last Index callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "\uD83D\uDE00", "b"];
      const result = arr.findLastIndex((value, index: int): boolean => {
        return value === "a" || value === "\uD83D\uDE00";
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0430
     * @tc.name testReadonlyArrayFindLastIndex043
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: boolean predicate find Last Index callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.findLastIndex((value, index: int): boolean => {
        return value === true || value === false;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0440
     * @tc.name testReadonlyArrayFindLastIndex044
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: 100 element ReadonlyArray <int> find Last Index predicate iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 0; i < 100; i++) {
        (arr as Array<int>).push(i);
      }
      const result = arr.findLastIndex((value: int, index: int): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0450
     * @tc.name testReadonlyArrayFindLastIndex045
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: POSITIVE_INFINITY float find Last Index predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: float = Double.toFloat(Number.POSITIVE_INFINITY);
      const arr: ReadonlyArray<float> = [1.0f, inf];
      const result = arr.findLastIndex((value: float): boolean => {
        return value === inf;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0460
     * @tc.name testReadonlyArrayFindLastIndex046
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: same element int find Last Index predicate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 5, 5];
      const result = arr.findLastIndex((value: int): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0470
     * @tc.name testReadonlyArrayFindLastIndex047
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: int find Last Index predicate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, -1, 2, -2];
      const result = arr.findLastIndex((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0480
     * @tc.name testReadonlyArrayFindLastIndex048
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate index parameter find Last Index by index checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.findLastIndex((value: int, index: int): boolean => {
        return index === 1;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0490
     * @tc.name testReadonlyArrayFindLastIndex049
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: findLastIndex float NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [nan, 1.0f, nan];
      const result = arr.findLastIndex((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0500
     * @tc.name testReadonlyArrayFindLastIndex050
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: float negative infinity findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.NEGATIVE_INFINITY), 2.0f];
      const result = arr.findLastIndex((value: float): boolean => {
        return value < 0.0f;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0510
     * @tc.name testReadonlyArrayFindLastIndex051
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: float MIN_VALUE findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const arr: ReadonlyArray<float> = [minVal, 2.0f];
      const result = arr.findLastIndex((value: float): boolean => {
        return value === minVal;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0520
     * @tc.name testReadonlyArrayFindLastIndex052
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: double negative infinity findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, Number.NEGATIVE_INFINITY];
      const result = arr.findLastIndex((value: double): boolean => {
        return value < 0.0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0530
     * @tc.name testReadonlyArrayFindLastIndex053
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: double MIN_VALUE findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.MIN_VALUE, 5.0];
      const result = arr.findLastIndex((value: double): boolean => {
        return value >= 0.0 && value < 1.0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0540
     * @tc.name testReadonlyArrayFindLastIndex054
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: double NaN findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 1.1, nan];
      const result = arr.findLastIndex((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0550
     * @tc.name testReadonlyArrayFindLastIndex055
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: float negative zero findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, -0.0f];
      const result = arr.findLastIndex((value: float): boolean => {
        return value === 0.0f;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0560
     * @tc.name testReadonlyArrayFindLastIndex056
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: string replacement character findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\uFFFD";
      const arr: ReadonlyArray<string> = ["a", target, "b"];
      const result = arr.findLastIndex((value: string): boolean => {
        return value === target;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0570
     * @tc.name testReadonlyArrayFindLastIndex057
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: string carriage return and line feed findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\r\n";
      const arr: ReadonlyArray<string> = ["a", target, "b"];
      const result = arr.findLastIndex((value: string): boolean => {
        return value === target;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0580
     * @tc.name testReadonlyArrayFindLastIndex058
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: byte boundary findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, -128 as byte];
      const result = arr.findLastIndex((value: byte): boolean => {
        return value === -128 as byte;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0590
     * @tc.name testReadonlyArrayFindLastIndex059
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: short boundary findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short, 0 as short];
      const result = arr.findLastIndex((value: short): boolean => {
        return value === 32767 as short;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0600
     * @tc.name testReadonlyArrayFindLastIndex060
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: char maximum findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\uffff'];
      const result = arr.findLastIndex((value: char): boolean => {
        return value === c'\uffff';
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0610
     * @tc.name testReadonlyArrayFindLastIndex061
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: adjacent next item findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.findLastIndex((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index < array.length - 1 && array[index + 1] === 10;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0620
     * @tc.name testReadonlyArrayFindLastIndex062
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: adjacent previous item findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.findLastIndex((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index > 0 && array[index - 1] === 5;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0630
     * @tc.name testReadonlyArrayFindLastIndex063
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: 1000 elements findLastIndex last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findLastIndex((value: int): boolean => {
        return value === 999;
      });
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0640
     * @tc.name testReadonlyArrayFindLastIndex064
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: 1000 elements findLastIndex not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(1); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findLastIndex((value: int): boolean => {
        return value === 999;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0650
     * @tc.name testReadonlyArrayFindLastIndex065
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: findLastIndex callback array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      let same: boolean = false;
      arr.findLastIndex((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        same = array === arr;
        return false;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0660
     * @tc.name testReadonlyArrayFindLastIndex066
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: float positive infinity findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY), 1.0f];
      const result = arr.findLastIndex((value: float): boolean => {
        return value > 1.0e10f;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0670
     * @tc.name testReadonlyArrayFindLastIndex067
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: int radix findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.findLastIndex((value: int): boolean => {
        return value === 0o10;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0680
     * @tc.name testReadonlyArrayFindLastIndex068
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: int boundary findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, -2147483648];
      const result = arr.findLastIndex((value: int): boolean => {
        return value === -2147483648;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0690
     * @tc.name testReadonlyArrayFindLastIndex069
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: boolean findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.findLastIndex((value: boolean): boolean => {
        return !value;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0700
     * @tc.name testReadonlyArrayFindLastIndex070
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: continuation double positive infinity findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY, 1.0, Number.POSITIVE_INFINITY];
      const result = arr.findLastIndex((value: double): boolean => {
        return value > 1.0e10;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0710
     * @tc.name testReadonlyArrayFindLastIndex071
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: continuation char null character findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'a', c'\u0000'];
      const result = arr.findLastIndex((value: char): boolean => {
        return value === c'\u0000';
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0720
     * @tc.name testReadonlyArrayFindLastIndex072
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: continuation 100 elements findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findLastIndex((value: int): boolean => {
        return value === 77;
      });
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0730
     * @tc.name testReadonlyArrayFindLastIndex073
     * @tc.desc Verify ReadonlyArray.find.last.index behavior: continuation index parameter findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.findLastIndex((_value: int, index: int): boolean => {
        return index === 0;
      });
      expect(result).assertEqual(0);
    });






    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0740
     * @tc.name testReadonlyArrayFindLastIndex074
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate return value - predicate always returns true - - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.findLastIndex((value: int): boolean => true);
      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0750
     * @tc.name testReadonlyArrayFindLastIndex075
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: special elements - predicate handles null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "b"];
      const result = arr.findLastIndex((value: string | null): boolean => value === null);
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0760
     * @tc.name testReadonlyArrayFindLastIndex076
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: error path - predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.findLastIndex((_value: int, index: int): boolean => {
          if (index === 1) { throw new Error("predicate error"); }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0770
     * @tc.name testReadonlyArrayFindLastIndex077
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.findLastIndex((value: int): boolean => value >= 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0780
     * @tc.name testReadonlyArrayFindLastIndex078
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.findLastIndex((value: int): boolean => value === 10);
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0790
     * @tc.name testReadonlyArrayFindLastIndex079
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      arr.findLastIndex((_value: int): boolean => { count++; return false; });
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0800
     * @tc.name testReadonlyArrayFindLastIndex080
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findLastIndex((value: int): boolean => value === 2);
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0810
     * @tc.name testReadonlyArrayFindLastIndex081
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.findLastIndex((_value: string): boolean => true);
      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0820
     * @tc.name testReadonlyArrayFindLastIndex082
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.findLastIndex((_value: string): boolean => true);
      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0830
     * @tc.name testReadonlyArrayFindLastIndex083
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.findLastIndex((_value: boolean): boolean => true);
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0840
     * @tc.name testReadonlyArrayFindLastIndex084
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.findLastIndex((_value: double): boolean => true);
      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0850
     * @tc.name testReadonlyArrayFindLastIndex085
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.findLastIndex((_value: ComboObjarr): boolean => true);
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0860
     * @tc.name testReadonlyArrayFindLastIndex086
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.findLastIndex((_value: Array<int>): boolean => true);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0870
     * @tc.name testReadonlyArrayFindLastIndex087
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.findLastIndex((_value: int): boolean => true);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0880
     * @tc.name testReadonlyArrayFindLastIndex088
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.findLastIndex((_value: int): boolean => true);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0890
     * @tc.name testReadonlyArrayFindLastIndex089
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.findLastIndex((_value: string): boolean => true);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0900
     * @tc.name testReadonlyArrayFindLastIndex090
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.findLastIndex((_value: string): boolean => true);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0910
     * @tc.name testReadonlyArrayFindLastIndex091
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.findLastIndex((_value: boolean): boolean => true);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0920
     * @tc.name testReadonlyArrayFindLastIndex092
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.findLastIndex((_value: double): boolean => true);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0930
     * @tc.name testReadonlyArrayFindLastIndex093
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayFindLastIndexGeneratedItem = new ReadonlyArrayFindLastIndexGeneratedItem(1);
      const obj2: ReadonlyArrayFindLastIndexGeneratedItem = new ReadonlyArrayFindLastIndexGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindLastIndexGeneratedItem> = [obj1, obj2];
      const result = arr.findLastIndex((_value: ReadonlyArrayFindLastIndexGeneratedItem): boolean => true);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0940
     * @tc.name testReadonlyArrayFindLastIndex094
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate by object id property finds last matching object index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayFindLastIndexGeneratedItem = new ReadonlyArrayFindLastIndexGeneratedItem(7);
      const b: ReadonlyArrayFindLastIndexGeneratedItem = new ReadonlyArrayFindLastIndexGeneratedItem(8);
      const c: ReadonlyArrayFindLastIndexGeneratedItem = new ReadonlyArrayFindLastIndexGeneratedItem(7);
      const arr: ReadonlyArray<ReadonlyArrayFindLastIndexGeneratedItem> = [a, b, c];
      const result = arr.findLastIndex((v: ReadonlyArrayFindLastIndexGeneratedItem): boolean => v.id === 7);
      expect(result).assertEqual(2);
      expect(arr[result] === c).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0950
     * @tc.name testReadonlyArrayFindLastIndex095
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: object element references preserved unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayFindLastIndexGeneratedItem = new ReadonlyArrayFindLastIndexGeneratedItem(1);
      const b: ReadonlyArrayFindLastIndexGeneratedItem = new ReadonlyArrayFindLastIndexGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindLastIndexGeneratedItem> = [a, b];
      arr.findLastIndex((v: ReadonlyArrayFindLastIndexGeneratedItem): boolean => v.id === 2);
      expect(arr[0] === a).assertTrue();
      expect(arr[1] === b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0960
     * @tc.name testReadonlyArrayFindLastIndex096
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: two consecutive calls return identical results with no hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2, 1];
      const r1 = arr.findLastIndex((v: int): boolean => v === 2);
      const r2 = arr.findLastIndex((v: int): boolean => v === 2);
      expect(r1).assertEqual(3);
      expect(r2).assertEqual(3);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0970
     * @tc.name testReadonlyArrayFindLastIndex097
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: empty array does not invoke predicate at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let count: int = 0;
      const result = arr.findLastIndex((v: int): boolean => {
        count++;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0980
     * @tc.name testReadonlyArrayFindLastIndex098
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: last element matches immediately - predicate invoked exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let count: int = 0;
      const result = arr.findLastIndex((v: int): boolean => {
        count++;
        return v === 5;
      });
      expect(result).assertEqual(4);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_0990
     * @tc.name testReadonlyArrayFindLastIndex099
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: nested array predicate matches by inner array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1, 2], [3], [4, 5, 6]];
      const result = arr.findLastIndex((v: Array<int>): boolean => v.length >= 2);
      expect(result).assertEqual(2);
      expect(arr[result].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_1000
     * @tc.name testReadonlyArrayFindLastIndex100
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: very long string element preserved and locatable by exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 500; i++) {
        longStr += "x";
      }
      const arr: ReadonlyArray<string> = ["a", longStr, "b"];
      const result = arr.findLastIndex((v: string): boolean => v.length >= 500);
      expect(result).assertEqual(1);
      expect(arr[result].length).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_1010
     * @tc.name testReadonlyArrayFindLastIndex101
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: int max value mid-array correctly located by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxI: int = 2147483647;
      const arr: ReadonlyArray<int> = [1, maxI, 3];
      const result = arr.findLastIndex((v: int): boolean => v === maxI);
      expect(result).assertEqual(1);
      expect(arr[result]).assertEqual(maxI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_1020
     * @tc.name testReadonlyArrayFindLastIndex102
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: undefined element in union array detected by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 3, undefined];
      const result = arr.findLastIndex((v: int | undefined): boolean => v === undefined);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_1030
     * @tc.name testReadonlyArrayFindLastIndex103
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate uses obj parameter to locate by neighbour difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 5, 2, 8, 3];
      const result = arr.findLastIndex((v: int, idx: int, obj: ReadonlyArray<int>): boolean => {
        return idx > 0 && v > obj[idx - 1] * 2;
      });
      expect(result).assertEqual(3);
      expect(arr[result]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_1040
     * @tc.name testReadonlyArrayFindLastIndex104
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: two distinct predicates on same array independently produce correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const r1 = arr.findLastIndex((v: int): boolean => v < 25);
      const r2 = arr.findLastIndex((v: int): boolean => v > 35);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_1050
     * @tc.name testReadonlyArrayFindLastIndex105
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: string predicate with prefix match locates last matching string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["pre_a", "no", "pre_b", "tail"];
      const result = arr.findLastIndex((v: string): boolean => v.startsWith("pre_"));
      expect(result).assertEqual(2);
      expect(arr[result]).assertEqual("pre_b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_1060
     * @tc.name testReadonlyArrayFindLastIndex106
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: predicate returning false visits all elements right-to-left exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      let count: int = 0;
      const result = arr.findLastIndex((v: int): boolean => {
        count++;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_INDEX_1070
     * @tc.name testReadonlyArrayFindLastIndex107
     * @tc.desc Verify ReadonlyArray.findLastIndex behavior: result usable as array index to retrieve found element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLastIndex107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "alpha", "y", "alpha", "z"];
      const idx = arr.findLastIndex((v: string): boolean => v === "alpha");
      expect(idx).assertEqual(3);
      expect(arr[idx]).assertEqual("alpha");
    });

  });
}
