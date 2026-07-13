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

class ReadonlyArrayFilterGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayFilterTest(): void {
  describe('ReadonlyArrayFilterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0010
     * @tc.name testReadonlyArrayFilter001
     * @tc.desc Verify ReadonlyArray.filter behavior: passing predicate callback verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value > 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0020
     * @tc.name testReadonlyArrayFilter002
     * @tc.desc Verify ReadonlyArray.filter behavior: passing is predicate returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value % 2 === 0;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0030
     * @tc.name testReadonlyArrayFilter003
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate callback value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.filter((value: int): boolean => {
        return value > 15;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0040
     * @tc.name testReadonlyArrayFilter004
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate callback value index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40];
      const result = values.filter((value: int, index: int): boolean => {
        return index % 2 === 0;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0050
     * @tc.name testReadonlyArrayFilter005
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate callback parameter value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 10, 15, 20];
      const result = values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value > array[0] && index < 3;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0060
     * @tc.name testReadonlyArrayFilter006
     * @tc.desc Verify ReadonlyArray.filter behavior: verify predicate callback value parameter is before iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [100, 200, 300];
      const collected: number[] = [];
      values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        collected.push(value);
        return true;
      });
      expect(collected[0]).assertEqual(100);
      expect(collected[1]).assertEqual(200);
      expect(collected[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0070
     * @tc.name testReadonlyArrayFilter007
     * @tc.desc Verify ReadonlyArray.filter behavior: verify predicate callback index parameter 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [7, 8, 9, 10];
      const indices: number[] = [];
      values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        indices.push(index);
        return true;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0080
     * @tc.name testReadonlyArrayFilter008
     * @tc.desc Verify ReadonlyArray.filter behavior: verify predicate callback array parameter is original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let arrayRef: ReadonlyArray<int> | null = null;
      values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
          if (index === 0) {
              arrayRef = array;
          }
          return true;
      });
      expect(arrayRef === values).assertTrue();
      expect(arrayRef!.length).assertEqual(3);
      expect(arrayRef![0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0090
     * @tc.name testReadonlyArrayFilter009
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate returns true returns element new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return true;
      });
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0100
     * @tc.name testReadonlyArrayFilter010
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate returns false returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return false;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0110
     * @tc.name testReadonlyArrayFilter011
     * @tc.desc Verify ReadonlyArray.filter behavior: element matches predicate returns after new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5, 6];
      const result = values.filter((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0120
     * @tc.name testReadonlyArrayFilter012
     * @tc.desc Verify ReadonlyArray.filter behavior: element matches predicate returns element new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 6, 8];
      const result = values.filter((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0130
     * @tc.name testReadonlyArrayFilter013
     * @tc.desc Verify ReadonlyArray.filter behavior: element matches predicate returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5, 7];
      const result = values.filter((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0140
     * @tc.name testReadonlyArrayFilter014
     * @tc.desc Verify ReadonlyArray.filter behavior: empty array filter returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.filter((value: int): boolean => {
        return value > 0;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0150
     * @tc.name testReadonlyArrayFilter015
     * @tc.desc Verify ReadonlyArray.filter behavior: element element matches returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5];
      const result = values.filter((value: int): boolean => {
        return value > 0;
      });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0160
     * @tc.name testReadonlyArrayFilter016
     * @tc.desc Verify ReadonlyArray.filter behavior: element element matches returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [-1];
      const result = values.filter((value: int): boolean => {
        return value > 0;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0170
     * @tc.name testReadonlyArrayFilter017
     * @tc.desc Verify ReadonlyArray.filter behavior: filter returns element original array order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 3, 8, 1, 9, 2, 7];
      const result = values.filter((value: int): boolean => {
        return value > 4;
      });
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(9);
      expect(result[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0180
     * @tc.name testReadonlyArrayFilter018
     * @tc.desc Verify ReadonlyArray.filter behavior: string type ReadonlyArray filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["apple", "banana", "cherry", "date"];
      const result = values.filter((value: string): boolean => {
        return value.length > 5;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("banana");
      expect(result[1]).assertEqual("cherry");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0190
     * @tc.name testReadonlyArrayFilter019
     * @tc.desc Verify ReadonlyArray.filter behavior: double type ReadonlyArray filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.5, 3.0, 4.8, 5.2];
      const result = values.filter((value: number): boolean => {
        return value > 3.0;
      });
      expect(result.length).assertEqual(2);
      expect(Math.abs(result[0] - 4.8) < 0.001).assertTrue();
      expect(Math.abs(result[1] - 5.2) < 0.001).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0200
     * @tc.name testReadonlyArrayFilter020
     * @tc.desc Verify ReadonlyArray.filter behavior: filter returns new array and original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.filter((value: int): boolean => {
        return true;
      });
      expect(result !== values).assertTrue();
      expect(result.length).assertEqual(values.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0210
     * @tc.name testReadonlyArrayFilter021
     * @tc.desc Verify ReadonlyArray.filter behavior: verify filter returns length matches element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result = values.filter((value: int): boolean => {
        return value % 3 === 0;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(6);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0220
     * @tc.name testReadonlyArrayFilter022
     * @tc.desc Verify ReadonlyArray.filter behavior: verify filter returns element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const result = values.filter((value: int): boolean => {
        return value >= 30;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(40);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0230
     * @tc.name testReadonlyArrayFilter023
     * @tc.desc Verify ReadonlyArray.filter behavior: 0 when filter correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [-3, -2, -1, 0, 1, 2, 3];
      const result = values.filter((value: int): boolean => {
        return value >= 0;
      });
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0240
     * @tc.name testReadonlyArrayFilter024
     * @tc.desc Verify ReadonlyArray.filter behavior: filter return value is Array<T> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result: Array<int> = values.filter((value: int): boolean => {
        return value > 2;
      });
      expect(result.length).assertEqual(3);
      result.push(6);
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0250
     * @tc.name testReadonlyArrayFilter025
     * @tc.desc Verify ReadonlyArray.filter behavior: returns element type and ReadonlyArray generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world", "test"];
      const result = values.filter((value: string): boolean => {
        return value.includes("o");
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0260
     * @tc.name testReadonlyArrayFilter026
     * @tc.desc Verify ReadonlyArray.filter behavior: verify returns length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.filter((value: int): boolean => {
        return value < 3;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0270
     * @tc.name testReadonlyArrayFilter027
     * @tc.desc Verify ReadonlyArray.filter behavior: element verify result correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<int> = [];
      for (let i = 0; i < 1000; i++) {
          values.push(i);
      }
      const readonlyValues: ReadonlyArray<int> = values;
      const result = readonlyValues.filter((value: int): boolean => {
        return value % 100 === 0;
      });
      expect(result.length).assertEqual(10);
      expect(result[0]).assertEqual(0);
      expect(result[9]).assertEqual(900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0280
     * @tc.name testReadonlyArrayFilter028
     * @tc.desc Verify ReadonlyArray.filter behavior: large array element matches returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<int> = [];
      for (let i = 0; i < 100; i++) {
          values.push(i + 1);
      }
      const readonlyValues: ReadonlyArray<int> = values;
      const result = readonlyValues.filter((value: int): boolean => {
        return value > 0;
      });
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(1);
      expect(result[99]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0290
     * @tc.name testReadonlyArrayFilter029
     * @tc.desc Verify ReadonlyArray.filter behavior: filter after ReadonlyArray content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const originalLength = values.length;
      const result = values.filter((value: int): boolean => {
        return value > 3;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(values.length).assertEqual(originalLength);
      expect(values[0]).assertEqual(1);
      expect(values[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0300
     * @tc.name testReadonlyArrayFilter030
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate callback throws an exception when filter break and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      try {
        values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
          if (value === 2) {
            throw new Error("predicate error");
          }
          return true;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0310
     * @tc.name testReadonlyArrayFilter031
     * @tc.desc Verify ReadonlyArray.filter behavior: verify predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let callCount: number = 0;
      const result = values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        callCount++;
        return value > 2;
      });
      expect(callCount).assertEqual(5);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0320
     * @tc.name testReadonlyArrayFilter032
     * @tc.desc Verify ReadonlyArray.filter behavior: and API 1,2,3. filter value>1 returns length is 2 new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value > 1;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0330
     * @tc.name testReadonlyArrayFilter033
     * @tc.desc Verify ReadonlyArray.filter behavior: ReadonlyArray <boolean> filter true element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false, true];
      const result = arr.filter((value: boolean): boolean => {
        return value;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0340
     * @tc.name testReadonlyArrayFilter034
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate 0 - 1 1000000 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000, 5];
      const result = arr.filter((value: int): boolean => {
        return value >= 0;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1000000);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0350
     * @tc.name testReadonlyArrayFilter035
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.filter((value: int): boolean => {
        return value >= 0x10;
      });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0360
     * @tc.name testReadonlyArrayFilter036
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "", "b"];
      const result = arr.filter((value: string): boolean => {
        return value === "";
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0370
     * @tc.name testReadonlyArrayFilter037
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate Unicode element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["x", cn, "y"];
      const result = arr.filter((value: string): boolean => {
        return value === cn;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0380
     * @tc.name testReadonlyArrayFilter038
     * @tc.desc Verify ReadonlyArray.filter behavior: element matches predicate when returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 6];
      const result = values.filter((value: int): boolean => {
        return value > 0;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0390
     * @tc.name testReadonlyArrayFilter039
     * @tc.desc Verify ReadonlyArray.filter behavior: filter after original array length and content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      values.filter((value: int): boolean => {
        return value > 1;
      });
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0400
     * @tc.name testReadonlyArrayFilter040
     * @tc.desc Verify ReadonlyArray.filter behavior: byte predicate filter callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      const result = arr.filter((value, index: int): boolean => {
        return value === 10 as byte || value === 20 as byte;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0410
     * @tc.name testReadonlyArrayFilter041
     * @tc.desc Verify ReadonlyArray.filter behavior: short predicate filter callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 32767 as short];
      const result = arr.filter((value, index: int): boolean => {
        return value === 100 as short || value === 32767 as short;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0420
     * @tc.name testReadonlyArrayFilter042
     * @tc.desc Verify ReadonlyArray.filter behavior: boolean predicate filter callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.filter((value, index: int): boolean => {
        return value === true || value === false;
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0430
     * @tc.name testReadonlyArrayFilter043
     * @tc.desc Verify ReadonlyArray.filter behavior: filter float NaN element via self - inequality predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      const result = arr.filter((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0440
     * @tc.name testReadonlyArrayFilter044
     * @tc.desc Verify ReadonlyArray.filter behavior: filter double NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.1, nan, 2.2];
      const result = arr.filter((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0450
     * @tc.name testReadonlyArrayFilter045
     * @tc.desc Verify ReadonlyArray.filter behavior: float negative infinity filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.NEGATIVE_INFINITY), 2.0f];
      const result = arr.filter((value: float): boolean => {
        return value < 0.0f;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0460
     * @tc.name testReadonlyArrayFilter046
     * @tc.desc Verify ReadonlyArray.filter behavior: float MIN_VALUE filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const arr: ReadonlyArray<float> = [minVal, 2.0f];
      const result = arr.filter((value: float): boolean => {
        return value === minVal;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0470
     * @tc.name testReadonlyArrayFilter047
     * @tc.desc Verify ReadonlyArray.filter behavior: double negative infinity filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, Number.NEGATIVE_INFINITY];
      const result = arr.filter((value: double): boolean => {
        return value < 0.0;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0480
     * @tc.name testReadonlyArrayFilter048
     * @tc.desc Verify ReadonlyArray.filter behavior: float negative zero filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f, -0.0f];
      const result = arr.filter((value: float): boolean => {
        return value === 0.0f;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0490
     * @tc.name testReadonlyArrayFilter049
     * @tc.desc Verify ReadonlyArray.filter behavior: string replacement character filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rep: string = "\uFFFD";
      const arr: ReadonlyArray<string> = ["a", rep, "b"];
      const result = arr.filter((value: string): boolean => {
        return value === rep;
      });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(rep);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0500
     * @tc.name testReadonlyArrayFilter050
     * @tc.desc Verify ReadonlyArray.filter behavior: string carriage return and line feed filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const crlf: string = "\r\n";
      const arr: ReadonlyArray<string> = ["x", crlf];
      const result = arr.filter((value: string): boolean => {
        return value === crlf;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0510
     * @tc.name testReadonlyArrayFilter051
     * @tc.desc Verify ReadonlyArray.filter behavior: string carriage return filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cr: string = "\r";
      const arr: ReadonlyArray<string> = [cr, "ab"];
      const result = arr.filter((value: string): boolean => {
        return value === cr;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0520
     * @tc.name testReadonlyArrayFilter052
     * @tc.desc Verify ReadonlyArray.filter behavior: string BOM filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bom: string = "\uFEFF";
      const arr: ReadonlyArray<string> = [bom, "t"];
      const result = arr.filter((value: string): boolean => {
        return value === bom;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0530
     * @tc.name testReadonlyArrayFilter053
     * @tc.desc Verify ReadonlyArray.filter behavior: string mojibake filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const garbled: string = "æµè¯";
      const arr: ReadonlyArray<string> = ["en", garbled];
      const result = arr.filter((value: string): boolean => {
        return value === garbled;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0540
     * @tc.name testReadonlyArrayFilter054
     * @tc.desc Verify ReadonlyArray.filter behavior: byte boundary filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte, 127 as byte];
      const result = arr.filter((value: byte): boolean => {
        return value < 0 as byte;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0550
     * @tc.name testReadonlyArrayFilter055
     * @tc.desc Verify ReadonlyArray.filter behavior: short boundary filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 32767 as short];
      const result = arr.filter((value: short): boolean => {
        return value === 32767 as short;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0560
     * @tc.name testReadonlyArrayFilter056
     * @tc.desc Verify ReadonlyArray.filter behavior: long boundary filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, 0];
      const result = arr.filter((value: long): boolean => {
        return value > 0;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0570
     * @tc.name testReadonlyArrayFilter057
     * @tc.desc Verify ReadonlyArray.filter behavior: char maximum filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\uffff'];
      const result = arr.filter((value: char): boolean => {
        return value === c'\uffff';
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0580
     * @tc.name testReadonlyArrayFilter058
     * @tc.desc Verify ReadonlyArray.filter behavior: adjacent filter next item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 5, 10];
      const result = arr.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index < array.length - 1 && array[index + 1] > value;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0590
     * @tc.name testReadonlyArrayFilter059
     * @tc.desc Verify ReadonlyArray.filter behavior: adjacent filter previous item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 5, 10];
      const result = arr.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index > 0 && array[index - 1] < value;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0600
     * @tc.name testReadonlyArrayFilter060
     * @tc.desc Verify ReadonlyArray.filter behavior: 1000 elements filter extended case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.filter((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result.length).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0610
     * @tc.name testReadonlyArrayFilter061
     * @tc.desc Verify ReadonlyArray.filter behavior: 1000 elements filter last item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.filter((value: int): boolean => {
        return value === 999;
      });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0620
     * @tc.name testReadonlyArrayFilter062
     * @tc.desc Verify ReadonlyArray.filter behavior: filter callback array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let same: boolean = false;
      arr.filter((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        same = array === arr;
        return true;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0630
     * @tc.name testReadonlyArrayFilter063
     * @tc.desc Verify ReadonlyArray.filter behavior: float positive infinity filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY), 1.0f];
      const result = arr.filter((value: float): boolean => {
        return value > 1.0e10f;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0640
     * @tc.name testReadonlyArrayFilter064
     * @tc.desc Verify ReadonlyArray.filter behavior: int radix filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.filter((value: int): boolean => {
        return value === 0x10;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0650
     * @tc.name testReadonlyArrayFilter065
     * @tc.desc Verify ReadonlyArray.filter behavior: int boundary filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, -2147483648, 0];
      const result = arr.filter((value: int): boolean => {
        return value === -2147483648;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0660
     * @tc.name testReadonlyArrayFilter066
     * @tc.desc Verify ReadonlyArray.filter behavior: boolean filter false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.filter((value: boolean): boolean => {
        return !value;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0670
     * @tc.name testReadonlyArrayFilter067
     * @tc.desc Verify ReadonlyArray.filter behavior: continuation index parameter filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.filter((_value: int, index: int): boolean => {
        return index % 2 === 0;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0680
     * @tc.name testReadonlyArrayFilter068
     * @tc.desc Verify ReadonlyArray.filter behavior: continuation double positive infinity filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY, 1.0];
      const result = arr.filter((value: double): boolean => {
        return value > 1.0e10;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0690
     * @tc.name testReadonlyArrayFilter069
     * @tc.desc Verify ReadonlyArray.filter behavior: continuation char null character filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'z'];
      const result = arr.filter((value: char): boolean => {
        return value === c'\u0000';
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0700
     * @tc.name testReadonlyArrayFilter070
     * @tc.desc Verify ReadonlyArray.filter behavior: continuation int repeated filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [4, 4, 5];
      const result = arr.filter((value: int): boolean => {
        return value === 4;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0710
     * @tc.name testReadonlyArrayFilter071
     * @tc.desc Verify ReadonlyArray.filter behavior: continuation 100 elements filter count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { source.push(i % 3); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.filter((value: int): boolean => {
        return value === 0;
      });
      expect(result.length).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0720
     * @tc.name testReadonlyArrayFilter072
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate return value - predicate always returns true - Array<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result: Array<int> = arr.filter((value: int): boolean => true);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0730
     * @tc.name testReadonlyArrayFilter073
     * @tc.desc Verify ReadonlyArray.filter behavior: special elements - predicate handles null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "b"];
      const result = arr.filter((value: string | null): boolean => value === null);
      expect(result.length).assertEqual(1);
      expect(result[0] === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0740
     * @tc.name testReadonlyArrayFilter074
     * @tc.desc Verify ReadonlyArray.filter behavior: error path - predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.filter((_value: int, index: int): boolean => {
          if (index === 1) { throw new Error("predicate error"); }
          return true;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0750
     * @tc.name testReadonlyArrayFilter075
     * @tc.desc Verify ReadonlyArray.filter behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.filter((value: int): boolean => {
        return value >= 15;
      });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0760
     * @tc.name testReadonlyArrayFilter076
     * @tc.desc Verify ReadonlyArray.filter behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      arr.filter((_value: int): boolean => { count++; return true; });
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0770
     * @tc.name testReadonlyArrayFilter077
     * @tc.desc Verify ReadonlyArray.filter behavior: boundary scale - no match in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      expect(arr.filter((value: int): boolean => false).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0780
     * @tc.name testReadonlyArrayFilter078
     * @tc.desc Verify ReadonlyArray.filter behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.filter((value: int): boolean => value > 1);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0790
     * @tc.name testReadonlyArrayFilter079
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.filter((_value: string): boolean => true);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0800
     * @tc.name testReadonlyArrayFilter080
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.filter((_value: string): boolean => true);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("\u4e2d\u6587");
      expect(result[1]).assertEqual("\uD83D\uDE00");
      expect(result[2]).assertEqual("long-text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0810
     * @tc.name testReadonlyArrayFilter081
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.filter((_value: boolean): boolean => true);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0820
     * @tc.name testReadonlyArrayFilter082
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.filter((_value: double): boolean => true);
      expect(result.length).assertEqual(3);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1] === 0.0).assertTrue();
      expect(result[2] === -0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0830
     * @tc.name testReadonlyArrayFilter083
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.filter((_value: ComboObjarr): boolean => true);
      expect(result.length).assertEqual(2);
      expect(result[0] === obj1).assertTrue();
      expect(result[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0840
     * @tc.name testReadonlyArrayFilter084
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.filter((_value: Array<int>): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0850
     * @tc.name testReadonlyArrayFilter085
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.filter((_value: int): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0860
     * @tc.name testReadonlyArrayFilter086
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.filter((_value: int): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0870
     * @tc.name testReadonlyArrayFilter087
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - nested int array values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.filter((_value: Array<int>): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0880
     * @tc.name testReadonlyArrayFilter088
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - repeated int elements group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.filter((_value: int): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0890
     * @tc.name testReadonlyArrayFilter089
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.filter((_value: string): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0900
     * @tc.name testReadonlyArrayFilter090
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.filter((_value: string): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0910
     * @tc.name testReadonlyArrayFilter091
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.filter((_value: boolean): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0920
     * @tc.name testReadonlyArrayFilter092
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.filter((_value: double): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0930
     * @tc.name testReadonlyArrayFilter093
     * @tc.desc Verify ReadonlyArray.filter behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayFilterGeneratedItem = new ReadonlyArrayFilterGeneratedItem(1);
      const obj2: ReadonlyArrayFilterGeneratedItem = new ReadonlyArrayFilterGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFilterGeneratedItem> = [obj1, obj2];
      const result = arr.filter((_value: ReadonlyArrayFilterGeneratedItem): boolean => true);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0940
     * @tc.name testReadonlyArrayFilter094
     * @tc.desc Verify ReadonlyArray.filter behavior: TC017 special elements - predicate handles undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<number | undefined> = [1, undefined, 2, undefined, 3];
      const result = arr.filter((value: number | undefined): boolean => value === undefined);
      expect(result.length).assertEqual(2);
      expect(result[0] === undefined).assertTrue();
      expect(result[1] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0950
     * @tc.name testReadonlyArrayFilter095
     * @tc.desc Verify ReadonlyArray.filter behavior: TC020 mid-element predicate throws stops iteration before later elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let visited: int = 0;
      try {
        arr.filter((value: int): boolean => {
          visited++;
          if (value === 3) { throw new Error("stop"); }
          return true;
        });
        expect().assertFail();
      } catch (error) {
        expect((error as Error).message).assertEqual("stop");
        expect(visited).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0960
     * @tc.name testReadonlyArrayFilter096
     * @tc.desc Verify ReadonlyArray.filter behavior: TC042 object element references preserved (===) in returned Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayFilterGeneratedItem = new ReadonlyArrayFilterGeneratedItem(1);
      const obj2: ReadonlyArrayFilterGeneratedItem = new ReadonlyArrayFilterGeneratedItem(2);
      const obj3: ReadonlyArrayFilterGeneratedItem = new ReadonlyArrayFilterGeneratedItem(3);
      const arr: ReadonlyArray<ReadonlyArrayFilterGeneratedItem> = [obj1, obj2, obj3];
      const result = arr.filter((value: ReadonlyArrayFilterGeneratedItem): boolean => value.id !== 2);
      expect(result.length).assertEqual(2);
      expect(result[0] === obj1).assertTrue();
      expect(result[1] === obj3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0970
     * @tc.name testReadonlyArrayFilter097
     * @tc.desc Verify ReadonlyArray.filter behavior: TC043 mutating returned Array does not affect original ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      const result: Array<int> = arr.filter((value: int): boolean => value > 1);
      result.push(99);
      result[0] = 100;
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0980
     * @tc.name testReadonlyArrayFilter098
     * @tc.desc Verify ReadonlyArray.filter behavior: TC048 two consecutive filter calls produce equal independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const r1: Array<int> = arr.filter((value: int): boolean => value % 2 === 0);
      const r2: Array<int> = arr.filter((value: int): boolean => value % 2 === 0);
      expect(r1 !== r2).assertTrue();
      expect(r1.length).assertEqual(r2.length);
      expect(r1[0]).assertEqual(r2[0]);
      expect(r1[1]).assertEqual(r2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_0990
     * @tc.name testReadonlyArrayFilter099
     * @tc.desc Verify ReadonlyArray.filter behavior: TC049 chain composition - filter result usable as input to .map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const filtered: Array<int> = arr.filter((value: int): boolean => value > 2);
      const mapped: Array<int> = filtered.map<int>((value: int): int => value * 10);
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(30);
      expect(mapped[1]).assertEqual(40);
      expect(mapped[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_1000
     * @tc.name testReadonlyArrayFilter100
     * @tc.desc Verify ReadonlyArray.filter behavior: TC011 predicate evaluated for every element (no early termination on first match)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 1, 2, 3, 4];
      let visited: int = 0;
      const result = arr.filter((value: int): boolean => {
        visited++;
        return value === 10;
      });
      expect(visited).assertEqual(5);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_1010
     * @tc.name testReadonlyArrayFilter101
     * @tc.desc Verify ReadonlyArray.filter behavior: TC036 distinguishing +0 and -0 within filter via 1/x sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [0.0, -0.0, 1.0];
      const result = arr.filter((value: double): boolean => 1.0 / value === Number.NEGATIVE_INFINITY);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_1020
     * @tc.name testReadonlyArrayFilter102
     * @tc.desc Verify ReadonlyArray.filter behavior: TC047 large 1024 array with no matching predicate returns empty Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.filter((value: int): boolean => value > 5000);
      expect(result.length).assertEqual(0);
      expect(arr.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_1030
     * @tc.name testReadonlyArrayFilter103
     * @tc.desc Verify ReadonlyArray.filter behavior: nested array element type T - inner array references preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<int> = [1];
      const b: Array<int> = [2, 3];
      const c: Array<int> = [4, 5, 6];
      const arr: ReadonlyArray<Array<int>> = [a, b, c];
      const result = arr.filter((value: Array<int>): boolean => value.length >= 2);
      expect(result.length).assertEqual(2);
      expect(result[0] === b).assertTrue();
      expect(result[1] === c).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_1040
     * @tc.name testReadonlyArrayFilter104
     * @tc.desc Verify ReadonlyArray.filter behavior: predicate accesses array param length matches original via callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40];
      let observedLen: int = -1;
      const result = arr.filter((value: int, _index: int, array: ReadonlyArray<int>): boolean => {
        observedLen = array.length as int;
        return value >= 20;
      });
      expect(observedLen).assertEqual(4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FILTER_1050
     * @tc.name testReadonlyArrayFilter105
     * @tc.desc Verify ReadonlyArray.filter behavior: TC050 ReadonlyArray<T> obtained via cast from Array<T>, filter still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFilter105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [1, 2, 3, 4];
      const ro: ReadonlyArray<int> = src as ReadonlyArray<int>;
      const result = ro.filter((value: int): boolean => value % 2 === 1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(ro.length).assertEqual(4);
    });

  });
}
