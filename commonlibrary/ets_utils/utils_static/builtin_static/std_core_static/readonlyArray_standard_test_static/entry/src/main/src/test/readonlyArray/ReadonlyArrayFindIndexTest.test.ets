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

class ReadonlyArrayFindIndexGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayFindIndexTest(): void {
  describe('ReadonlyArrayFindIndexTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0010
     * @tc.name testReadonlyArrayFindIndex001
     * @tc.desc Verify ReadonlyArray.findIndex behavior: passing predicate callback find Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value == 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0020
     * @tc.name testReadonlyArrayFindIndex002
     * @tc.desc Verify ReadonlyArray.findIndex behavior: passing returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 10, 15];
      const result = values.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value >= 10;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0030
     * @tc.name testReadonlyArrayFindIndex003
     * @tc.desc Verify ReadonlyArray.findIndex behavior: callback parameter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.findIndex((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0040
     * @tc.name testReadonlyArrayFindIndex004
     * @tc.desc Verify ReadonlyArray.findIndex behavior: callback value index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40];
      const result = values.findIndex((value: int, index: int): boolean => {
        return index == 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0050
     * @tc.name testReadonlyArrayFindIndex005
     * @tc.desc Verify ReadonlyArray.findIndex behavior: callback parameter value index obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return obj.length > 0 && value == 2;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0060
     * @tc.name testReadonlyArrayFindIndex006
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify callback value parameter before iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [100, 200, 300];
      const result = values.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        if (index == 0) { expect(value).assertEqual(100); }
        if (index == 1) { expect(value).assertEqual(200); }
        if (index == 2) { expect(value).assertEqual(300); }
        return value == 300;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0070
     * @tc.name testReadonlyArrayFindIndex007
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify callback index parameter 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [7, 8, 9];
      let indices: number[] = [];
      values.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        indices.push(index);
        return false;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0080
     * @tc.name testReadonlyArrayFindIndex008
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify callback obj parameter original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [3, 6, 9];
      const result = values.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        expect(obj === values).assertTrue();
        expect(obj.length).assertEqual(values.length);
        expect(obj[0]).assertEqual(3);
        expect(obj[1]).assertEqual(6);
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0090
     * @tc.name testReadonlyArrayFindIndex009
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate returns true find Index returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42, 99, 100];
      const result = values.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return true;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0100
     * @tc.name testReadonlyArrayFindIndex010
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate returns false find Index returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0110
     * @tc.name testReadonlyArrayFindIndex011
     * @tc.desc Verify ReadonlyArray.findIndex behavior: exists matches element returns correctly index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 5, 10, 15];
      const result = values.findIndex((value: int): boolean => {
        return value == 10;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0120
     * @tc.name testReadonlyArrayFindIndex012
     * @tc.desc Verify ReadonlyArray.findIndex behavior: multiple element matches predicate returns element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2, 5];
      const result = values.findIndex((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0130
     * @tc.name testReadonlyArrayFindIndex013
     * @tc.desc Verify ReadonlyArray.findIndex behavior: element not matching predicate returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5, 7];
      const result = values.findIndex((value: int): boolean => {
        return value == 4;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0140
     * @tc.name testReadonlyArrayFindIndex014
     * @tc.desc Verify ReadonlyArray.findIndex behavior: empty array find Index returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.findIndex((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0150
     * @tc.name testReadonlyArrayFindIndex015
     * @tc.desc Verify ReadonlyArray.findIndex behavior: element element matches returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.findIndex((value: int): boolean => {
        return value == 42;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0160
     * @tc.name testReadonlyArrayFindIndex016
     * @tc.desc Verify ReadonlyArray.findIndex behavior: element element matches returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.findIndex((value: int): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0170
     * @tc.name testReadonlyArrayFindIndex017
     * @tc.desc Verify ReadonlyArray.findIndex behavior: string type generic ReadonlyArray find Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["apple", "banana", "cherry"];
      const result = values.findIndex((value: string): boolean => {
        return value == "banana";
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0180
     * @tc.name testReadonlyArrayFindIndex018
     * @tc.desc Verify ReadonlyArray.findIndex behavior: double type generic ReadonlyArray find Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2, 3.3];
      const result = values.findIndex((value: double): boolean => {
        return value > 2.0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0190
     * @tc.name testReadonlyArrayFindIndex019
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify return value - 1 correctly not found matches element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.findIndex((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0200
     * @tc.name testReadonlyArrayFindIndex020
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify return value 0 element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [99, 1, 2];
      const result = values.findIndex((value: int): boolean => {
        return value == 99;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0210
     * @tc.name testReadonlyArrayFindIndex021
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify find Index element after iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let callCount: number = 0;
      const result = values.findIndex((value: int): boolean => {
        callCount++;
        return value == 2;
      });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0220
     * @tc.name testReadonlyArrayFindIndex022
     * @tc.desc Verify ReadonlyArray.findIndex behavior: element matches find Index returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let callCount: number = 0;
      const result = values.findIndex((value: int): boolean => {
        callCount++;
        return value == 1;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0230
     * @tc.name testReadonlyArrayFindIndex023
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify find Index return value type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result: int = values.findIndex((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0240
     * @tc.name testReadonlyArrayFindIndex024
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify return value typeof is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 10, 15];
      const result = values.findIndex((value: int): boolean => {
        return value > 7;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0250
     * @tc.name testReadonlyArrayFindIndex025
     * @tc.desc Verify ReadonlyArray.findIndex behavior: element when return value is non -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.findIndex((value: int): boolean => {
        return value >= 10;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0260
     * @tc.name testReadonlyArrayFindIndex026
     * @tc.desc Verify ReadonlyArray.findIndex behavior: large array element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const values: ReadonlyArray<int> = arr;
      const result = values.findIndex((value: int): boolean => {
        return value == 9999;
      });
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0270
     * @tc.name testReadonlyArrayFindIndex027
     * @tc.desc Verify ReadonlyArray.findIndex behavior: after element matches index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const result = values.findIndex((value: int): boolean => {
        return value == 50;
      });
      expect(result).assertEqual(4);
      expect(result).assertEqual(values.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0280
     * @tc.name testReadonlyArrayFindIndex028
     * @tc.desc Verify ReadonlyArray.findIndex behavior: find Index after original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const originalLength = values.length;
      const result = values.findIndex((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(1);
      expect(values.length).assertEqual(originalLength);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0290
     * @tc.name testReadonlyArrayFindIndex029
     * @tc.desc Verify ReadonlyArray.findIndex behavior: find Index after original array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "b", "c"];
      const result = values.findIndex((value: string): boolean => {
        return value == "b";
      });
      expect(result).assertEqual(1);
      expect(values[0]).assertEqual("a");
      expect(values[1]).assertEqual("b");
      expect(values[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0300
     * @tc.name testReadonlyArrayFindIndex030
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate callback throws an exception find Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      try {
        values.findIndex((value: int): boolean => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0310
     * @tc.name testReadonlyArrayFindIndex031
     * @tc.desc Verify ReadonlyArray.findIndex behavior: verify find Index returns index find returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40];
      const index = values.findIndex((value: int): boolean => {
        return value > 15;
      });
      const element = values.find((value: int): boolean => {
        return value > 15;
      });
      expect(index).assertEqual(1);
      expect(element).assertEqual(20);
      expect(values[index]).assertEqual(element);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0320
     * @tc.name testReadonlyArrayFindIndex032
     * @tc.desc Verify ReadonlyArray.findIndex behavior: ReadonlyArray <boolean> find Index true element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [false, true, false, true];
      expect(arr.findIndex((value: boolean): boolean => {
          return value;
      })).assertEqual(1);
      expect(arr.findIndex((value: boolean): boolean => {
          return !value;
      })).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0330
     * @tc.name testReadonlyArrayFindIndex033
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate 0 - 1 1000000 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000, 5];
      const result = arr.findIndex((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0340
     * @tc.name testReadonlyArrayFindIndex034
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.findIndex((value: int): boolean => {
        return value === 0b10;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0350
     * @tc.name testReadonlyArrayFindIndex035
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "", "b"];
      const result = arr.findIndex((value: string): boolean => {
        return value === "";
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0360
     * @tc.name testReadonlyArrayFindIndex036
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate Unicode element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["x", cn, "y"];
      const result = arr.findIndex((value: string): boolean => {
        return value === cn;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0370
     * @tc.name testReadonlyArrayFindIndex037
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate empty element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const arr: ReadonlyArray<string> = ["a", zwsp, "c"];
      const result = arr.findIndex((value: string): boolean => {
        return value === zwsp;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0380
     * @tc.name testReadonlyArrayFindIndex038
     * @tc.desc Verify ReadonlyArray.findIndex behavior: matches element when find Index returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5];
      const result = values.findIndex((value: int): boolean => {
        return value > 10;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0390
     * @tc.name testReadonlyArrayFindIndex039
     * @tc.desc Verify ReadonlyArray.findIndex behavior: multiple 2 when find Index returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 3, 2];
      const result = values.findIndex((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0400
     * @tc.name testReadonlyArrayFindIndex040
     * @tc.desc Verify ReadonlyArray.findIndex behavior: byte predicate find Index callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      const result = arr.findIndex((value, index: int): boolean => {
        return value === 10 as byte || value === 20 as byte;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0410
     * @tc.name testReadonlyArrayFindIndex041
     * @tc.desc Verify ReadonlyArray.findIndex behavior: short predicate find Index callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 32767 as short];
      const result = arr.findIndex((value, index: int): boolean => {
        return value === 100 as short || value === 32767 as short;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0420
     * @tc.name testReadonlyArrayFindIndex042
     * @tc.desc Verify ReadonlyArray.findIndex behavior: string emoji predicate find Index callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "\uD83D\uDE00", "b"];
      const result = arr.findIndex((value, index: int): boolean => {
        return value === "a" || value === "\uD83D\uDE00";
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0430
     * @tc.name testReadonlyArrayFindIndex043
     * @tc.desc Verify ReadonlyArray.findIndex behavior: string predicate find Index callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "x"];
      const result = arr.findIndex((value, index: int): boolean => {
        return value === "13800138000" || value === "x";
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0440
     * @tc.name testReadonlyArrayFindIndex044
     * @tc.desc Verify ReadonlyArray.findIndex behavior: 100 element ReadonlyArray <int> find Index predicate iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 0; i < 100; i++) {
        (arr as Array<int>).push(i);
      }
      const result = arr.findIndex((value: int, index: int): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0450
     * @tc.name testReadonlyArrayFindIndex045
     * @tc.desc Verify ReadonlyArray.findIndex behavior: string find Index predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mail: string = "test@example.com";
      const arr: ReadonlyArray<string> = [mail, "other"];
      const result = arr.findIndex((value: string): boolean => {
        return value === mail;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0460
     * @tc.name testReadonlyArrayFindIndex046
     * @tc.desc Verify ReadonlyArray.findIndex behavior: u0000 char find Index predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'a'];
      const result = arr.findIndex((value: char): boolean => {
        return value === (c'\u0000');
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0470
     * @tc.name testReadonlyArrayFindIndex047
     * @tc.desc Verify ReadonlyArray.findIndex behavior: 0x123 string find Index predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexStr: string = "0x123";
      const arr: ReadonlyArray<string> = ["0123", hexStr];
      const result = arr.findIndex((value: string): boolean => {
        return value === hexStr;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0480
     * @tc.name testReadonlyArrayFindIndex048
     * @tc.desc Verify ReadonlyArray.findIndex behavior: Test string find Index predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mix: string = "Test 測試";
      const arr: ReadonlyArray<string> = [mix, "en"];
      const result = arr.findIndex((value: string): boolean => {
        return value === mix;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0490
     * @tc.name testReadonlyArrayFindIndex049
     * @tc.desc Verify ReadonlyArray.findIndex behavior: findIndex float NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      const result = arr.findIndex((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0500
     * @tc.name testReadonlyArrayFindIndex050
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate uses adjacent array index minus one neighbor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.findIndex((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index > 0 && array[index - 1] === 10;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0510
     * @tc.name testReadonlyArrayFindIndex051
     * @tc.desc Verify ReadonlyArray.find.index behavior: float negative infinity findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.NEGATIVE_INFINITY), 2.0f];
      const result = arr.findIndex((value: float): boolean => {
        return value < 0.0f;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0520
     * @tc.name testReadonlyArrayFindIndex052
     * @tc.desc Verify ReadonlyArray.find.index behavior: float MIN_VALUE findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const arr: ReadonlyArray<float> = [minVal, 2.0f];
      const result = arr.findIndex((value: float): boolean => {
        return value === minVal;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0530
     * @tc.name testReadonlyArrayFindIndex053
     * @tc.desc Verify ReadonlyArray.find.index behavior: double negative infinity findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, Number.NEGATIVE_INFINITY];
      const result = arr.findIndex((value: double): boolean => {
        return value < 0.0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0540
     * @tc.name testReadonlyArrayFindIndex054
     * @tc.desc Verify ReadonlyArray.find.index behavior: double MIN_VALUE findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.MIN_VALUE, 5.0];
      const result = arr.findIndex((value: double): boolean => {
        return value >= 0.0 && value < 1.0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0550
     * @tc.name testReadonlyArrayFindIndex055
     * @tc.desc Verify ReadonlyArray.find.index behavior: double NaN findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.1, nan, 2.2];
      const result = arr.findIndex((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0560
     * @tc.name testReadonlyArrayFindIndex056
     * @tc.desc Verify ReadonlyArray.find.index behavior: float negative zero findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, -0.0f];
      const result = arr.findIndex((value: float): boolean => {
        return value === 0.0f;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0570
     * @tc.name testReadonlyArrayFindIndex057
     * @tc.desc Verify ReadonlyArray.find.index behavior: string replacement character findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\uFFFD";
      const arr: ReadonlyArray<string> = ["a", target, "b"];
      const result = arr.findIndex((value: string): boolean => {
        return value === target;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0580
     * @tc.name testReadonlyArrayFindIndex058
     * @tc.desc Verify ReadonlyArray.find.index behavior: string carriage return and line feed findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\r\n";
      const arr: ReadonlyArray<string> = ["a", target, "b"];
      const result = arr.findIndex((value: string): boolean => {
        return value === target;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0590
     * @tc.name testReadonlyArrayFindIndex059
     * @tc.desc Verify ReadonlyArray.find.index behavior: byte boundary findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, -128 as byte];
      const result = arr.findIndex((value: byte): boolean => {
        return value === -128 as byte;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0600
     * @tc.name testReadonlyArrayFindIndex060
     * @tc.desc Verify ReadonlyArray.find.index behavior: short boundary findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short, 0 as short];
      const result = arr.findIndex((value: short): boolean => {
        return value === 32767 as short;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0610
     * @tc.name testReadonlyArrayFindIndex061
     * @tc.desc Verify ReadonlyArray.find.index behavior: long boundary findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, 0];
      const result = arr.findIndex((value: long): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0620
     * @tc.name testReadonlyArrayFindIndex062
     * @tc.desc Verify ReadonlyArray.find.index behavior: char maximum findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\uffff'];
      const result = arr.findIndex((value: char): boolean => {
        return value === c'\uffff';
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0630
     * @tc.name testReadonlyArrayFindIndex063
     * @tc.desc Verify ReadonlyArray.find.index behavior: adjacent next item findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.findIndex((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index < array.length - 1 && array[index + 1] === 10;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0640
     * @tc.name testReadonlyArrayFindIndex064
     * @tc.desc Verify ReadonlyArray.find.index behavior: adjacent previous item findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.findIndex((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index > 0 && array[index - 1] === 5;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0650
     * @tc.name testReadonlyArrayFindIndex065
     * @tc.desc Verify ReadonlyArray.find.index behavior: 1000 elements findIndex last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findIndex((value: int): boolean => {
        return value === 999;
      });
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0660
     * @tc.name testReadonlyArrayFindIndex066
     * @tc.desc Verify ReadonlyArray.find.index behavior: findIndex callback array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      let same: boolean = false;
      arr.findIndex((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        same = array === arr;
        return false;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0670
     * @tc.name testReadonlyArrayFindIndex067
     * @tc.desc Verify ReadonlyArray.find.index behavior: float positive infinity findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY), 1.0f];
      const result = arr.findIndex((value: float): boolean => {
        return value > 1.0e10f;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0680
     * @tc.name testReadonlyArrayFindIndex068
     * @tc.desc Verify ReadonlyArray.find.index behavior: int radix findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.findIndex((value: int): boolean => {
        return value === 0o10;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0690
     * @tc.name testReadonlyArrayFindIndex069
     * @tc.desc Verify ReadonlyArray.find.index behavior: int boundary findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, -2147483648];
      const result = arr.findIndex((value: int): boolean => {
        return value === -2147483648;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0700
     * @tc.name testReadonlyArrayFindIndex070
     * @tc.desc Verify ReadonlyArray.find.index behavior: boolean findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.findIndex((value: boolean): boolean => {
        return !value;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0710
     * @tc.name testReadonlyArrayFindIndex071
     * @tc.desc Verify ReadonlyArray.find.index behavior: continuation double positive infinity findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, Number.POSITIVE_INFINITY];
      const result = arr.findIndex((value: double): boolean => {
        return value > 1.0e10;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0720
     * @tc.name testReadonlyArrayFindIndex072
     * @tc.desc Verify ReadonlyArray.find.index behavior: continuation char null character findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\u0000'];
      const result = arr.findIndex((value: char): boolean => {
        return value === c'\u0000';
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0730
     * @tc.name testReadonlyArrayFindIndex073
     * @tc.desc Verify ReadonlyArray.find.index behavior: continuation int repeated findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [8, 8, 9];
      const result = arr.findIndex((value: int): boolean => {
        return value === 8;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0740
     * @tc.name testReadonlyArrayFindIndex074
     * @tc.desc Verify ReadonlyArray.find.index behavior: continuation 100 elements findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findIndex((value: int): boolean => {
        return value === 77;
      });
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0750
     * @tc.name testReadonlyArrayFindIndex075
     * @tc.desc Verify ReadonlyArray.find.index behavior: continuation index parameter findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.findIndex((_value: int, index: int): boolean => {
        return index === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0760
     * @tc.name testReadonlyArrayFindIndex076
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate return value - predicate always returns true - - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.findIndex((value: int): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0770
     * @tc.name testReadonlyArrayFindIndex077
     * @tc.desc Verify ReadonlyArray.findIndex behavior: special elements - predicate handles null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "b"];
      const result = arr.findIndex((value: string | null): boolean => value === null);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0780
     * @tc.name testReadonlyArrayFindIndex078
     * @tc.desc Verify ReadonlyArray.findIndex behavior: error path - predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.findIndex((_value: int, index: int): boolean => {
          if (index === 1) { throw new Error("predicate error"); }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0790
     * @tc.name testReadonlyArrayFindIndex079
     * @tc.desc Verify ReadonlyArray.findIndex behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.findIndex((value: int): boolean => value >= 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0800
     * @tc.name testReadonlyArrayFindIndex080
     * @tc.desc Verify ReadonlyArray.findIndex behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.findIndex((value: int): boolean => value === 20);
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0810
     * @tc.name testReadonlyArrayFindIndex081
     * @tc.desc Verify ReadonlyArray.findIndex behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      arr.findIndex((_value: int): boolean => { count++; return false; });
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0820
     * @tc.name testReadonlyArrayFindIndex082
     * @tc.desc Verify ReadonlyArray.findIndex behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findIndex((value: int): boolean => value === 2);
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0830
     * @tc.name testReadonlyArrayFindIndex083
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.findIndex((value: int): boolean => value >= 0);
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0840
     * @tc.name testReadonlyArrayFindIndex084
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.findIndex((_value: string): boolean => true);
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0850
     * @tc.name testReadonlyArrayFindIndex085
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.findIndex((_value: string): boolean => true);
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0860
     * @tc.name testReadonlyArrayFindIndex086
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.findIndex((_value: boolean): boolean => true);
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0870
     * @tc.name testReadonlyArrayFindIndex087
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.findIndex((_value: double): boolean => true);
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0880
     * @tc.name testReadonlyArrayFindIndex088
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.findIndex((_value: ComboObjarr): boolean => true);
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0890
     * @tc.name testReadonlyArrayFindIndex089
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.findIndex((_value: Array<int>): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0900
     * @tc.name testReadonlyArrayFindIndex090
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.findIndex((_value: int): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0910
     * @tc.name testReadonlyArrayFindIndex091
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.findIndex((_value: int): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0920
     * @tc.name testReadonlyArrayFindIndex092
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.findIndex((_value: string): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0930
     * @tc.name testReadonlyArrayFindIndex093
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.findIndex((_value: string): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0940
     * @tc.name testReadonlyArrayFindIndex094
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.findIndex((_value: boolean): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0950
     * @tc.name testReadonlyArrayFindIndex095
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.findIndex((_value: double): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0960
     * @tc.name testReadonlyArrayFindIndex096
     * @tc.desc Verify ReadonlyArray.findIndex behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayFindIndexGeneratedItem = new ReadonlyArrayFindIndexGeneratedItem(1);
      const obj2: ReadonlyArrayFindIndexGeneratedItem = new ReadonlyArrayFindIndexGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindIndexGeneratedItem> = [obj1, obj2];
      const result = arr.findIndex((_value: ReadonlyArrayFindIndexGeneratedItem): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0970
     * @tc.name testReadonlyArrayFindIndex097
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate throws Error preserves specific message string when propagating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.findIndex((value: int): boolean => {
          if (value === 2) { throw new Error("specific-msg"); }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect((error as Error).message).assertEqual("specific-msg");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0980
     * @tc.name testReadonlyArrayFindIndex098
     * @tc.desc Verify ReadonlyArray.findIndex behavior: large 1000-element array with no match returns -1 without iteration error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(1); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.findIndex((value: int): boolean => value === 999);
      expect(result).assertEqual(-1);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_0990
     * @tc.name testReadonlyArrayFindIndex099
     * @tc.desc Verify ReadonlyArray.findIndex behavior: two consecutive calls on same array yield identical results (no hidden state)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40];
      const r1 = arr.findIndex((value: int): boolean => value > 15);
      const r2 = arr.findIndex((value: int): boolean => value > 15);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(1);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_1000
     * @tc.name testReadonlyArrayFindIndex100
     * @tc.desc Verify ReadonlyArray.findIndex behavior: object element match by reference equality (===) returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ReadonlyArrayFindIndexGeneratedItem = new ReadonlyArrayFindIndexGeneratedItem(7);
      const o2: ReadonlyArrayFindIndexGeneratedItem = new ReadonlyArrayFindIndexGeneratedItem(7);
      const arr: ReadonlyArray<ReadonlyArrayFindIndexGeneratedItem> = [o1, o2];
      const result = arr.findIndex((value: ReadonlyArrayFindIndexGeneratedItem): boolean => value === o2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_1010
     * @tc.name testReadonlyArrayFindIndex101
     * @tc.desc Verify ReadonlyArray.findIndex behavior: returned index can be used to access the matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [11, 22, 33, 44];
      const idx = arr.findIndex((value: int): boolean => value === 33);
      expect(idx).assertEqual(2);
      expect(arr[idx]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_1020
     * @tc.name testReadonlyArrayFindIndex102
     * @tc.desc Verify ReadonlyArray.findIndex behavior: undefined element in union type array is matched correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 3];
      const result = arr.findIndex((value: int | undefined): boolean => value === undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_1030
     * @tc.name testReadonlyArrayFindIndex103
     * @tc.desc Verify ReadonlyArray.findIndex behavior: returned index value supports arithmetic (result + 1) confirming int semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 15];
      const idx: int = arr.findIndex((value: int): boolean => value === 10);
      const next: int = idx + 1;
      expect(idx).assertEqual(1);
      expect(next).assertEqual(2);
      expect(arr[next]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_1040
     * @tc.name testReadonlyArrayFindIndex104
     * @tc.desc Verify ReadonlyArray.findIndex behavior: predicate using obj.length to filter returns first valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      const result = arr.findIndex((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return index === obj.length - 1;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_1050
     * @tc.name testReadonlyArrayFindIndex105
     * @tc.desc Verify ReadonlyArray.findIndex behavior: NaN matched by Number.isNaN predicate in double array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.5, 2.5, Number.NaN, 3.5];
      const result = arr.findIndex((value: double): boolean => Number.isNaN(value));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_INDEX_1060
     * @tc.name testReadonlyArrayFindIndex106
     * @tc.desc Verify ReadonlyArray.findIndex behavior: short-circuit stops at match - elements past match index are not visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindIndex106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      let visited: Array<int> = [];
      const result = arr.findIndex((value: int): boolean => {
        visited.push(value);
        return value === 30;
      });
      expect(result).assertEqual(2);
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(10);
      expect(visited[1]).assertEqual(20);
      expect(visited[2]).assertEqual(30);
    });

  });
}
