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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayFindLastGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayFindLastTest(): void {
  describe('ReadonlyArrayFindLastTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0010
     * @tc.name testReadonlyArrayFindLast001
     * @tc.desc Verify ReadonlyArray.findLast behavior: passing predicate callback verify find Last and returns after matches element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.findLast((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value > 2;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0020
     * @tc.name testReadonlyArrayFindLast002
     * @tc.desc Verify ReadonlyArray.findLast behavior: passing predicate parameter verify find Last parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.findLast((value: int): boolean => {
        return value === 3;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0030
     * @tc.name testReadonlyArrayFindLast003
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate is parameter and returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.findLast((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value > 1;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0040
     * @tc.name testReadonlyArrayFindLast004
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate callback value parameter index obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "bb", "ccc"];
      const result = values.findLast((value: string): boolean => {
        return value.length > 1;
      });
      expect(result).assertEqual("ccc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0050
     * @tc.name testReadonlyArrayFindLast005
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate callback value index parameter checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40];
      const result = values.findLast((value: int, index: int): boolean => {
        return index > 1 && value > 25;
      });
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0060
     * @tc.name testReadonlyArrayFindLast006
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate callback value index obj parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 10, 15, 20];
      const result = values.findLast((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value === obj[obj.length - 1];
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0070
     * @tc.name testReadonlyArrayFindLast007
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify predicate callback value parameter is before iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const visited: number[] = [];
      values.findLast((value: int): boolean => {
        visited.push(value);
        return false;
      });
      expect(visited[0]).assertEqual(3);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0080
     * @tc.name testReadonlyArrayFindLast008
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify predicate callback index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40];
      const indices: number[] = [];
      values.findLast((value: int, index: int): boolean => {
        indices.push(index);
        return false;
      });
      expect(indices[0]).assertEqual(3);
      expect(indices[1]).assertEqual(2);
      expect(indices[2]).assertEqual(1);
      expect(indices[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0090
     * @tc.name testReadonlyArrayFindLast009
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify predicate callback obj parameter is original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let refMatch: boolean = false;
      values.findLast((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        if (index === 0) {
          refMatch = (obj === values);
        }
        return false;
      });
      expect(refMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0100
     * @tc.name testReadonlyArrayFindLast010
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate returns true find Last returns after element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.findLast((value: int): boolean => {
        return true;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0110
     * @tc.name testReadonlyArrayFindLast011
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate returns false find Last returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.findLast((value: int): boolean => {
        return false;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0120
     * @tc.name testReadonlyArrayFindLast012
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify multiple element matches predicate when returns after index element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 6, 8, 10];
      const result = values.findLast((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0130
     * @tc.name testReadonlyArrayFindLast013
     * @tc.desc Verify ReadonlyArray.findLast behavior: no element matches predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5, 7];
      const result = values.findLast((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0140
     * @tc.name testReadonlyArrayFindLast014
     * @tc.desc Verify ReadonlyArray.findLast behavior: empty array find Last returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.findLast((value: int): boolean => {
        return true;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0150
     * @tc.name testReadonlyArrayFindLast015
     * @tc.desc Verify ReadonlyArray.findLast behavior: element element matches predicate returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.findLast((value: int): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0160
     * @tc.name testReadonlyArrayFindLast016
     * @tc.desc Verify ReadonlyArray.findLast behavior: element element matches predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.findLast((value: int): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0170
     * @tc.name testReadonlyArrayFindLast017
     * @tc.desc Verify ReadonlyArray.findLast behavior: string type ReadonlyArray find Last correctly returns after matches string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["apple", "banana", "cherry", "avocado"];
      const result = values.findLast((value: string): boolean => {
        return value.startsWith("a");
      });
      expect(result).assertEqual("avocado");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0180
     * @tc.name testReadonlyArrayFindLast018
     * @tc.desc Verify ReadonlyArray.findLast behavior: double type ReadonlyArray find Last correctly returns after matches element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2, 3.3, 4.4];
      const result = values.findLast((value: number): boolean => {
        return value > 2.0;
      });
      expect(result).assertEqual(4.4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0190
     * @tc.name testReadonlyArrayFindLast019
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify find Last returns undefined when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.findLast((value: int): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0200
     * @tc.name testReadonlyArrayFindLast020
     * @tc.desc Verify ReadonlyArray.findLast behavior: 0 0 is after matches element verify return value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 0, 3, 0];
      const result = values.findLast((value: int): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0210
     * @tc.name testReadonlyArrayFindLast021
     * @tc.desc Verify ReadonlyArray.findLast behavior: find find Last verify find Last returns after non -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const findResult = values.find((value: int): boolean => {
        return value > 1;
      });
      const findLastResult = values.findLast((value: int): boolean => {
        return value > 1;
      });
      expect(findResult).assertEqual(2);
      expect(findLastResult).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0220
     * @tc.name testReadonlyArrayFindLast022
     * @tc.desc Verify ReadonlyArray.findLast behavior: find Last iteration after after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let callCount: number = 0;
      const result = values.findLast((value: int): boolean => {
        callCount++;
        return value === 4;
      });
      expect(callCount).assertEqual(2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0230
     * @tc.name testReadonlyArrayFindLast023
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify find Last return value is element type or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result1 = values.findLast((value: int): boolean => {
        return value === 2;
      });
      expect(result1).assertEqual(2);
      const result2 = values.findLast((value: int): boolean => {
        return value > 100;
      });
      expect(result2).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0240
     * @tc.name testReadonlyArrayFindLast024
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify find Last returns non - undefined type and element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world"];
      const result = values.findLast((value: string): boolean => {
        return value === "world";
      });
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0250
     * @tc.name testReadonlyArrayFindLast025
     * @tc.desc Verify ReadonlyArray.findLast behavior: matches element find Last iteration after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [100, 2, 3, 4, 5];
      const result = values.findLast((value: int): boolean => {
        return value > 50;
      });
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0260
     * @tc.name testReadonlyArrayFindLast026
     * @tc.desc Verify ReadonlyArray.findLast behavior: find Last after verify original array modifying
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const originalLength: number = values.length;
      const result = values.findLast((value: int): boolean => {
        return value > 1;
      });
      expect(result).assertEqual(3);
      expect(values.length).assertEqual(originalLength);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0270
     * @tc.name testReadonlyArrayFindLast027
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify find Last before after element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      values.findLast((value: int): boolean => {
        return value > 5;
      });
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0280
     * @tc.name testReadonlyArrayFindLast028
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate callback throws an exception verify try - catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      try {
        values.findLast((value: int): boolean => {
          if (value === 2) {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0290
     * @tc.name testReadonlyArrayFindLast029
     * @tc.desc Verify ReadonlyArray.findLast behavior: verify find Last returns element and find Last Index returns index element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2, 4];
      const predicate = (value: int): boolean => {
          return value === 2;
      };
      const findLastResult = values.findLast(predicate);
      const findLastIndexResult = values.findLastIndex(predicate);
      expect(findLastResult).assertEqual(values[findLastIndexResult]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0300
     * @tc.name testReadonlyArrayFindLast030
     * @tc.desc Verify ReadonlyArray.findLast behavior: ReadonlyArray <boolean> find Last after true element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false];
      const result = arr.findLast((value: boolean): boolean => {
        return value;
      });
      expect(result).assertTrue();
      const none = arr.slice(1, 2).findLast((value: boolean): boolean => {
        return value;
      });
      expect(none).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0310
     * @tc.name testReadonlyArrayFindLast031
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate 0 - 1 1000000 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000, 5];
      const result = arr.findLast((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0320
     * @tc.name testReadonlyArrayFindLast032
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.findLast((value: int): boolean => {
        return value === 0x10;
      });
      expect(result).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0330
     * @tc.name testReadonlyArrayFindLast033
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "", "b"];
      const result = arr.findLast((value: string): boolean => {
        return value === "";
      });
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0340
     * @tc.name testReadonlyArrayFindLast034
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate Unicode element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["x", cn, "y"];
      const result = arr.findLast((value: string): boolean => {
        return value === cn;
      });
      expect(result).assertEqual(cn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0350
     * @tc.name testReadonlyArrayFindLast035
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate empty element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const arr: ReadonlyArray<string> = ["a", zwsp, "c"];
      const result = arr.findLast((value: string): boolean => {
        return value === zwsp;
      });
      expect(result).assertEqual(zwsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0360
     * @tc.name testReadonlyArrayFindLast036
     * @tc.desc Verify ReadonlyArray.findLast behavior: multiple 2 when find Last value==2 returns after 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const visitedIndices: Array<int> = [];
      const result = values.findLast((value: int, index: int): boolean => {
        visitedIndices.push(index);
        return value > 0;
      });
      expect(result).assertEqual(30);
      // findLast iterates from right; first visited index must be the last (length-1)
      expect(visitedIndices[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0370
     * @tc.name testReadonlyArrayFindLast037
     * @tc.desc Verify ReadonlyArray.findLast behavior: matches element when find Last returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5];
      const result = values.findLast((value: int): boolean => {
        return value > 10;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0380
     * @tc.name testReadonlyArrayFindLast038
     * @tc.desc Verify ReadonlyArray.findLast behavior: byte predicate find Last callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      const result = arr.findLast((value, index: int): boolean => {
        return value === 10 as byte || value === 20 as byte;
      });
      expect(result).assertEqual(20 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0390
     * @tc.name testReadonlyArrayFindLast039
     * @tc.desc Verify ReadonlyArray.findLast behavior: short predicate find Last callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 32767 as short];
      const result = arr.findLast((value, index: int): boolean => {
        return value === 100 as short || value === 32767 as short;
      });
      expect(result).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0400
     * @tc.name testReadonlyArrayFindLast040
     * @tc.desc Verify ReadonlyArray.findLast behavior: long predicate find Last callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [100, 9223372036854775807];
      const result = arr.findLast((value, index: int): boolean => {
        return value === 100 || value === 9223372036854775807;
      });
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0410
     * @tc.name testReadonlyArrayFindLast041
     * @tc.desc Verify ReadonlyArray.findLast behavior: float predicate find Last callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 3.14f, -99.99f];
      const result = arr.findLast((value, index: int): boolean => {
        return value === 0.0f || value === 3.14f;
      });
      expect(result).assertClose(3.14f, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0420
     * @tc.name testReadonlyArrayFindLast042
     * @tc.desc Verify ReadonlyArray.findLast behavior: char predicate find Last callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\u4e2d'];
      const result = arr.findLast((value: char, index: int): boolean => {
        return value === c'a' || value === c'\u4e2d';
      });
      expect(result).assertEqual(c'\u4e2d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0430
     * @tc.name testReadonlyArrayFindLast043
     * @tc.desc Verify ReadonlyArray.findLast behavior: string emoji predicate find Last callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "\uD83D\uDE00", "b"];
      const result = arr.findLast((value, index: int): boolean => {
        return value === "a" || value === "\uD83D\uDE00";
      });
      expect(result).assertEqual("\uD83D\uDE00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0440
     * @tc.name testReadonlyArrayFindLast044
     * @tc.desc Verify ReadonlyArray.findLast behavior: string predicate find Last callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "x"];
      const result = arr.findLast((value, index: int): boolean => {
        return value === "13800138000" || value === "x";
      });
      expect(result).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0450
     * @tc.name testReadonlyArrayFindLast045
     * @tc.desc Verify ReadonlyArray.findLast behavior: boolean predicate find Last callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.findLast((value, index: int): boolean => {
        return value === true || value === false;
      });
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0460
     * @tc.name testReadonlyArrayFindLast046
     * @tc.desc Verify ReadonlyArray.findLast behavior: 100 element ReadonlyArray <int> find Last predicate iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 0; i < 100; i++) {
        (arr as Array<int>).push(i);
      }
      const result = arr.findLast((value: int, index: int): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0470
     * @tc.name testReadonlyArrayFindLast047
     * @tc.desc Verify ReadonlyArray.findLast behavior: string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mail: string = "test@example.com";
      const arr: ReadonlyArray<string> = [mail, "other"];
      const result = arr.findLast((value: string): boolean => {
        return value === mail;
      });
      expect(result).assertEqual(mail);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0480
     * @tc.name testReadonlyArrayFindLast048
     * @tc.desc Verify ReadonlyArray.findLast behavior: string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const id: string = "310101199001011234";
      const arr: ReadonlyArray<string> = ["x", id];
      const result = arr.findLast((value: string): boolean => {
        return value === id;
      });
      expect(result).assertEqual(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0490
     * @tc.name testReadonlyArrayFindLast049
     * @tc.desc Verify ReadonlyArray.findLast behavior: t n string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tab: string = "\t";
      const arr: ReadonlyArray<string> = [tab, "\n", "x"];
      const result = arr.findLast((value: string): boolean => {
        return value === tab;
      });
      expect(result).assertEqual(tab);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0500
     * @tc.name testReadonlyArrayFindLast050
     * @tc.desc Verify ReadonlyArray.findLast behavior: long find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minL: long = -9223372036854775808;
      const arr: ReadonlyArray<long> = [minL, 0];
      const result = arr.findLast((value: long): boolean => {
        return value === minL;
      });
      expect(result).assertEqual(minL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0510
     * @tc.name testReadonlyArrayFindLast051
     * @tc.desc Verify ReadonlyArray.findLast behavior: POSITIVE_INFINITY float find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: float = Double.toFloat(Number.POSITIVE_INFINITY);
      const arr: ReadonlyArray<float> = [1.0f, inf];
      const result = arr.findLast((value: float): boolean => {
        return value === inf;
      });
      expect(result).assertEqual(inf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0520
     * @tc.name testReadonlyArrayFindLast052
     * @tc.desc Verify ReadonlyArray.findLast behavior: u0000 char find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'a'];
      const result = arr.findLast((value: char): boolean => {
        return value === (c'\u0000');
      });
      expect(result).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0530
     * @tc.name testReadonlyArrayFindLast053
     * @tc.desc Verify ReadonlyArray.findLast behavior: string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ko: string = "테스트";
      const arr: ReadonlyArray<string> = [ko, "en"];
      const result = arr.findLast((value: string): boolean => {
        return value === ko;
      });
      expect(result).assertEqual(ko);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0540
     * @tc.name testReadonlyArrayFindLast054
     * @tc.desc Verify ReadonlyArray.findLast behavior: string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ar: string = "الاختبار";
      const arr: ReadonlyArray<string> = [ar, "en"];
      const result = arr.findLast((value: string): boolean => {
        return value === ar;
      });
      expect(result).assertEqual(ar);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0550
     * @tc.name testReadonlyArrayFindLast055
     * @tc.desc Verify ReadonlyArray.findLast behavior: 2147483647 int find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxI: int = 2147483647;
      const arr: ReadonlyArray<int> = [1, maxI, 3];
      const result = arr.findLast((value: int): boolean => {
        return value === maxI;
      });
      expect(result).assertEqual(maxI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0560
     * @tc.name testReadonlyArrayFindLast056
     * @tc.desc Verify ReadonlyArray.findLast behavior: same element int find Last predicate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 5, 5];
      const result = arr.findLast((value: int): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0570
     * @tc.name testReadonlyArrayFindLast057
     * @tc.desc Verify ReadonlyArray.findLast behavior: 0x123 string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexStr: string = "0x123";
      const arr: ReadonlyArray<string> = ["0123", hexStr];
      const result = arr.findLast((value: string): boolean => {
        return value === hexStr;
      });
      expect(result).assertEqual(hexStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0580
     * @tc.name testReadonlyArrayFindLast058
     * @tc.desc Verify ReadonlyArray.findLast behavior: 123.45e6 string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sci: string = "123.45e6";
      const arr: ReadonlyArray<string> = [sci, "plain"];
      const result = arr.findLast((value: string): boolean => {
        return value === sci;
      });
      expect(result).assertEqual(sci);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0590
     * @tc.name testReadonlyArrayFindLast059
     * @tc.desc Verify ReadonlyArray.findLast behavior: - 128 byte find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte];
      const result = arr.findLast((value: byte): boolean => {
        return value === (-128 as byte);
      });
      expect(result).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0600
     * @tc.name testReadonlyArrayFindLast060
     * @tc.desc Verify ReadonlyArray.findLast behavior: - 32768 short find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 1 as short];
      const result = arr.findLast((value: short): boolean => {
        return value === (-32768 as short);
      });
      expect(result).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0610
     * @tc.name testReadonlyArrayFindLast061
     * @tc.desc Verify ReadonlyArray.findLast behavior: string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const full: string = "—";
      const arr: ReadonlyArray<string> = [full, "-"];
      const result = arr.findLast((value: string): boolean => {
        return value === full;
      });
      expect(result).assertEqual(full);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0620
     * @tc.name testReadonlyArrayFindLast062
     * @tc.desc Verify ReadonlyArray.findLast behavior: string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const card: string = "622202********1234";
      const arr: ReadonlyArray<string> = [card, "x"];
      const result = arr.findLast((value: string): boolean => {
        return value === card;
      });
      expect(result).assertEqual(card);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0630
     * @tc.name testReadonlyArrayFindLast063
     * @tc.desc Verify ReadonlyArray.findLast behavior: 2026 - 0o3 - 0o5 string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: string = "2026-0o3-0o5";
      const arr: ReadonlyArray<string> = [d, "y"];
      const result = arr.findLast((value: string): boolean => {
        return value === d;
      });
      expect(result).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0640
     * @tc.name testReadonlyArrayFindLast064
     * @tc.desc Verify ReadonlyArray.findLast behavior: - 0.0f float find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negZero: float = -0.0f;
      const arr: ReadonlyArray<float> = [negZero, 1.0f];
      const result = arr.findLast((value: float): boolean => {
        return value === negZero;
      });
      expect(result).assertEqual(negZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0650
     * @tc.name testReadonlyArrayFindLast065
     * @tc.desc Verify ReadonlyArray.findLast behavior: uffff char find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a'];
      const result = arr.findLast((value: char): boolean => {
        return value === (c'\uffff');
      });
      expect(result).assertEqual(c'\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0660
     * @tc.name testReadonlyArrayFindLast066
     * @tc.desc Verify ReadonlyArray.findLast behavior: - 2147483648 int find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minI: int = -2147483648;
      const arr: ReadonlyArray<int> = [minI, 0];
      const result = arr.findLast((value: int): boolean => {
        return value === minI;
      });
      expect(result).assertEqual(minI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0670
     * @tc.name testReadonlyArrayFindLast067
     * @tc.desc Verify ReadonlyArray.findLast behavior: 0o123 string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const octStr: string = "0123";
      const arr: ReadonlyArray<string> = [octStr, "123"];
      const result = arr.findLast((value: string): boolean => {
        return value === octStr;
      });
      expect(result).assertEqual(octStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0680
     * @tc.name testReadonlyArrayFindLast068
     * @tc.desc Verify ReadonlyArray.findLast behavior: 0b1010 string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binStr: string = "0b1010";
      const arr: ReadonlyArray<string> = [binStr, "1010"];
      const result = arr.findLast((value: string): boolean => {
        return value === binStr;
      });
      expect(result).assertEqual(binStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0690
     * @tc.name testReadonlyArrayFindLast069
     * @tc.desc Verify ReadonlyArray.findLast behavior: 0L long find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 100];
      const result = arr.findLast((value: long): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0700
     * @tc.name testReadonlyArrayFindLast070
     * @tc.desc Verify ReadonlyArray.findLast behavior: 0x0A byte find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = 0x0A as byte;
      const arr: ReadonlyArray<byte> = [b, 99 as byte];
      const result = arr.findLast((value: byte): boolean => {
        return value === b;
      });
      expect(result).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0710
     * @tc.name testReadonlyArrayFindLast071
     * @tc.desc Verify ReadonlyArray.findLast behavior: int find Last predicate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, -1, 2, -2];
      const result = arr.findLast((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0720
     * @tc.name testReadonlyArrayFindLast072
     * @tc.desc Verify ReadonlyArray.findLast behavior: Test string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mix: string = "Test 測試";
      const arr: ReadonlyArray<string> = [mix, "en"];
      const result = arr.findLast((value: string): boolean => {
        return value === mix;
      });
      expect(result).assertEqual(mix);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0730
     * @tc.name testReadonlyArrayFindLast073
     * @tc.desc Verify ReadonlyArray.findLast behavior: string find Last predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ru: string = "АБВГД";
      const arr: ReadonlyArray<string> = [ru, "en"];
      const result = arr.findLast((value: string): boolean => {
        return value === ru;
      });
      expect(result).assertEqual(ru);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0740
     * @tc.name testReadonlyArrayFindLast074
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate index parameter find Last by index checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.findLast((value: int, index: int): boolean => {
        return index === 1;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0750
     * @tc.name testReadonlyArrayFindLast075
     * @tc.desc Verify ReadonlyArray.findLast behavior: findLast float NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [nan, 1.0f, nan];
      const result = arr.findLast((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(result !== undefined).assertTrue();
      expect(Number.isNaN(result!)).assertTrue();
      const idx = arr.findLastIndex((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(idx).assertEqual(2);
      expect(result === 1.0f).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0760
     * @tc.name testReadonlyArrayFindLast076
     * @tc.desc Verify ReadonlyArray.find.last behavior: float negative infinity findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.NEGATIVE_INFINITY), Double.toFloat(Number.NEGATIVE_INFINITY)];
      const result = arr.findLast((value: float): boolean => {
        return value < 0.0f;
      });
      expect(result).assertEqual(Double.toFloat(Number.NEGATIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0770
     * @tc.name testReadonlyArrayFindLast077
     * @tc.desc Verify ReadonlyArray.find.last behavior: float MIN_VALUE findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const arr: ReadonlyArray<float> = [minVal, 2.0f];
      const result = arr.findLast((value: float): boolean => {
        return value === minVal;
      });
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0780
     * @tc.name testReadonlyArrayFindLast078
     * @tc.desc Verify ReadonlyArray.find.last behavior: double negative infinity findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, Number.NEGATIVE_INFINITY];
      const result = arr.findLast((value: double): boolean => {
        return value < 0.0;
      });
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0790
     * @tc.name testReadonlyArrayFindLast079
     * @tc.desc Verify ReadonlyArray.find.last behavior: double MIN_VALUE findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.MIN_VALUE, 5.0];
      const result = arr.findLast((value: double): boolean => {
        return value >= 0.0 && value < 1.0;
      });
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0800
     * @tc.name testReadonlyArrayFindLast080
     * @tc.desc Verify ReadonlyArray.find.last behavior: double NaN findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.1, nan, 2.2];
      const result = arr.findLast((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(result !== undefined).assertTrue();
      expect(Number.isNaN(result!)).assertTrue();
      const idx = arr.findLastIndex((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0810
     * @tc.name testReadonlyArrayFindLast081
     * @tc.desc Verify ReadonlyArray.find.last behavior: float negative zero findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, -0.0f];
      const result = arr.findLast((value: float): boolean => {
        return value === 0.0f;
      });
      expect(result).assertEqual(-0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0820
     * @tc.name testReadonlyArrayFindLast082
     * @tc.desc Verify ReadonlyArray.find.last behavior: string replacement character findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\uFFFD";
      const arr: ReadonlyArray<string> = ["x", target, target];
      const result = arr.findLast((value: string): boolean => {
        return value === target;
      });
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0830
     * @tc.name testReadonlyArrayFindLast083
     * @tc.desc Verify ReadonlyArray.find.last behavior: string carriage return and line feed findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\r\n";
      const arr: ReadonlyArray<string> = ["x", target, target];
      const result = arr.findLast((value: string): boolean => {
        return value === target;
      });
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0840
     * @tc.name testReadonlyArrayFindLast084
     * @tc.desc Verify ReadonlyArray.find.last behavior: byte boundary findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, -128 as byte];
      const result = arr.findLast((value: byte): boolean => {
        return value === -128 as byte;
      });
      expect(result).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0850
     * @tc.name testReadonlyArrayFindLast085
     * @tc.desc Verify ReadonlyArray.find.last behavior: short boundary findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short, 0 as short];
      const result = arr.findLast((value: short): boolean => {
        return value === 32767 as short;
      });
      expect(result).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0860
     * @tc.name testReadonlyArrayFindLast086
     * @tc.desc Verify ReadonlyArray.find.last behavior: long boundary findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, 0];
      const result = arr.findLast((value: long): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0870
     * @tc.name testReadonlyArrayFindLast087
     * @tc.desc Verify ReadonlyArray.find.last behavior: char maximum findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\uffff'];
      const result = arr.findLast((value: char): boolean => {
        return value === c'\uffff';
      });
      expect(result).assertEqual(c'\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0880
     * @tc.name testReadonlyArrayFindLast088
     * @tc.desc Verify ReadonlyArray.find.last behavior: adjacent next item findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.findLast((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index < array.length - 1 && array[index + 1] === 10;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0890
     * @tc.name testReadonlyArrayFindLast089
     * @tc.desc Verify ReadonlyArray.find.last behavior: adjacent previous item findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.findLast((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index > 0 && array[index - 1] === 5;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0900
     * @tc.name testReadonlyArrayFindLast090
     * @tc.desc Verify ReadonlyArray.find.last behavior: 1000 elements findLast last item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findLast((value: int): boolean => {
        return value === 999;
      });
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0910
     * @tc.name testReadonlyArrayFindLast091
     * @tc.desc Verify ReadonlyArray.find.last behavior: findLast callback array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      let same: boolean = false;
      arr.findLast((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        same = array === arr;
        return false;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0920
     * @tc.name testReadonlyArrayFindLast092
     * @tc.desc Verify ReadonlyArray.find.last behavior: float positive infinity findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY), 1.0f];
      const result = arr.findLast((value: float): boolean => {
        return value > 1.0e10f;
      });
      expect(result).assertEqual(Double.toFloat(Number.POSITIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0930
     * @tc.name testReadonlyArrayFindLast093
     * @tc.desc Verify ReadonlyArray.find.last behavior: int radix findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.findLast((value: int): boolean => {
        return value === 0o10;
      });
      expect(result).assertEqual(0o10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0940
     * @tc.name testReadonlyArrayFindLast094
     * @tc.desc Verify ReadonlyArray.find.last behavior: int boundary findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, -2147483648];
      const result = arr.findLast((value: int): boolean => {
        return value === -2147483648;
      });
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0950
     * @tc.name testReadonlyArrayFindLast095
     * @tc.desc Verify ReadonlyArray.find.last behavior: boolean findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.findLast((value: boolean): boolean => {
        return !value;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0960
     * @tc.name testReadonlyArrayFindLast096
     * @tc.desc Verify ReadonlyArray.find.last behavior: continuation double positive infinity findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY, 1.0, Number.POSITIVE_INFINITY];
      const result = arr.findLast((value: double): boolean => {
        return value > 1.0e10;
      });
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0970
     * @tc.name testReadonlyArrayFindLast097
     * @tc.desc Verify ReadonlyArray.find.last behavior: continuation char null character findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'a', c'\u0000'];
      const result = arr.findLast((value: char): boolean => {
        return value === c'\u0000';
      });
      expect(result).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0980
     * @tc.name testReadonlyArrayFindLast098
     * @tc.desc Verify ReadonlyArray.find.last behavior: continuation 100 elements findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findLast((value: int): boolean => {
        return value === 77;
      });
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_0990
     * @tc.name testReadonlyArrayFindLast099
     * @tc.desc Verify ReadonlyArray.find.last behavior: continuation index parameter findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.findLast((_value: int, index: int): boolean => {
        return index === 1;
      });
      expect(result).assertEqual(20);
    });












    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1000
     * @tc.name testReadonlyArrayFindLast100
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate return value - predicate always returns true - undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.findLast((value: int): boolean => true);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1010
     * @tc.name testReadonlyArrayFindLast101
     * @tc.desc Verify ReadonlyArray.findLast behavior: special elements - predicate handles null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "b"];
      const result = arr.findLast((value: string | null): boolean => value === null);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1020
     * @tc.name testReadonlyArrayFindLast102
     * @tc.desc Verify ReadonlyArray.findLast behavior: error path - predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.findLast((_value: int, index: int): boolean => {
          if (index === 1) { throw new Error("predicate error"); }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1030
     * @tc.name testReadonlyArrayFindLast103
     * @tc.desc Verify ReadonlyArray.findLast behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.findLast((value: int): boolean => value >= 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1040
     * @tc.name testReadonlyArrayFindLast104
     * @tc.desc Verify ReadonlyArray.findLast behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.findLast((value: int): boolean => value > 0);
      expect(result).assertEqual(20);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1050
     * @tc.name testReadonlyArrayFindLast105
     * @tc.desc Verify ReadonlyArray.findLast behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      arr.findLast((_value: int): boolean => { count++; return false; });
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1060
     * @tc.name testReadonlyArrayFindLast106
     * @tc.desc Verify ReadonlyArray.findLast behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findLast((value: int): boolean => value > 0);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1070
     * @tc.name testReadonlyArrayFindLast107
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.findLast((value: int): boolean => value >= 0);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1080
     * @tc.name testReadonlyArrayFindLast108
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.findLast((_value: string): boolean => true);
      expect(result).assertEqual("");
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1090
     * @tc.name testReadonlyArrayFindLast109
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.findLast((_value: string): boolean => true);
      expect(result).assertEqual("long-text");
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1100
     * @tc.name testReadonlyArrayFindLast110
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.findLast((_value: boolean): boolean => true);
      expect(result).assertEqual(false);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1110
     * @tc.name testReadonlyArrayFindLast111
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.findLast((_value: double): boolean => true);
      expect(result).assertEqual(-0.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1120
     * @tc.name testReadonlyArrayFindLast112
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.findLast((_value: ComboObjarr): boolean => true);
      expect(result === obj2).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1130
     * @tc.name testReadonlyArrayFindLast113
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const last: Array<int> = [2, 3];
      const arr: ReadonlyArray<Array<int>> = [[1], last];
      const found = arr.findLast((_value: Array<int>): boolean => true);
      expect(found === last).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1140
     * @tc.name testReadonlyArrayFindLast114
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const found = arr.findLast((_value: int): boolean => true);
      expect(found).assertEqual(2);
    });

  });
}
