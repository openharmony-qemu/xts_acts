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

class ReadonlyArrayFindGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayFindTest(): void {
  describe('ReadonlyArrayFindTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0010
     * @tc.name testReadonlyArrayFind001
     * @tc.desc Verify ReadonlyArray.find behavior: passing predicate callback verify find and returns correctly result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.find((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value > 3;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0020
     * @tc.name testReadonlyArrayFind002
     * @tc.desc Verify ReadonlyArray.find behavior: predicate is value, index, obj parameter and returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.find((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value > 15;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0030
     * @tc.name testReadonlyArrayFind003
     * @tc.desc Verify ReadonlyArray.find behavior: predicate callback value parameter index obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 10, 15];
      const result = values.find((value: int): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0040
     * @tc.name testReadonlyArrayFind004
     * @tc.desc Verify ReadonlyArray.find behavior: predicate callback value index parameter checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [100, 200, 300];
      const result = values.find((value: int, index: int): boolean => {
        return index === 1;
      });
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0050
     * @tc.name testReadonlyArrayFind005
     * @tc.desc Verify ReadonlyArray.find behavior: predicate callback parameter value index obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.find((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value === 2 && index === 1 && obj.length === 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0060
     * @tc.name testReadonlyArrayFind006
     * @tc.desc Verify ReadonlyArray.find behavior: verify predicate callback value parameter is before iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "b", "c"];
      const collected: Array<string> = [];
      values.find((value: string): boolean => {
        collected.push(value);
        return false;
      });
      expect(collected[0]).assertEqual("a");
      expect(collected[1]).assertEqual("b");
      expect(collected[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0070
     * @tc.name testReadonlyArrayFind007
     * @tc.desc Verify ReadonlyArray.find behavior: verify predicate callback index parameter 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const indices: Array<int> = [];
      values.find((value: int, index: int): boolean => {
        indices.push(index);
        return false;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0080
     * @tc.name testReadonlyArrayFind008
     * @tc.desc Verify ReadonlyArray.find behavior: verify predicate callback obj parameter is original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let refCheck: boolean = false;
      values.find((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        if (index === 0) {
          refCheck = obj.length === values.length && obj[0] === values[0];
        }
        return false;
      });
      expect(refCheck).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0090
     * @tc.name testReadonlyArrayFind009
     * @tc.desc Verify ReadonlyArray.find behavior: predicate returns true verify find returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.find((value: int): boolean => {
        return true;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0100
     * @tc.name testReadonlyArrayFind010
     * @tc.desc Verify ReadonlyArray.find behavior: predicate returns false verify find returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.find((value: int): boolean => {
        return false;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0110
     * @tc.name testReadonlyArrayFind011
     * @tc.desc Verify ReadonlyArray.find behavior: exists matches predicate element returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 5, 10, 15];
      const result = values.find((value: int): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0120
     * @tc.name testReadonlyArrayFind012
     * @tc.desc Verify ReadonlyArray.find behavior: multiple element matches verify returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 6, 8, 10];
      const result = values.find((value: int): boolean => {
        return value > 5;
      });
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0130
     * @tc.name testReadonlyArrayFind013
     * @tc.desc Verify ReadonlyArray.find behavior: no element matches predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.find((value: int): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0140
     * @tc.name testReadonlyArrayFind014
     * @tc.desc Verify ReadonlyArray.find behavior: empty array find returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.find((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0150
     * @tc.name testReadonlyArrayFind015
     * @tc.desc Verify ReadonlyArray.find behavior: element element matches predicate returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.find((value: int): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0160
     * @tc.name testReadonlyArrayFind016
     * @tc.desc Verify ReadonlyArray.find behavior: element element matches predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.find((value: int): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0170
     * @tc.name testReadonlyArrayFind017
     * @tc.desc Verify ReadonlyArray.find behavior: string type ReadonlyArray find returns string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["apple", "banana", "cherry"];
      const result = values.find((value: string): boolean => {
        return value.startsWith("b");
      });
      expect(result).assertEqual("banana");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0180
     * @tc.name testReadonlyArrayFind018
     * @tc.desc Verify ReadonlyArray.find behavior: double type ReadonlyArray find returns double element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2, 3.3];
      const result = values.find((value: double): boolean => {
        return value > 2.0;
      });
      expect(result).assertEqual(2.2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0190
     * @tc.name testReadonlyArrayFind019
     * @tc.desc Verify ReadonlyArray.find behavior: find not found element returns undefined verify result undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.find((value: int): boolean => {
        return value === 999;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0200
     * @tc.name testReadonlyArrayFind020
     * @tc.desc Verify ReadonlyArray.find behavior: element is 0 verify 0 is return value is falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [-1, 0, 1];
      const result = values.find((value: int): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0210
     * @tc.name testReadonlyArrayFind021
     * @tc.desc Verify ReadonlyArray.find behavior: find element after iteration verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let callCount: int = 0;
      const result = values.find((value: int): boolean => {
        callCount++;
        return value === 3;
      });
      expect(result).assertEqual(3);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0220
     * @tc.name testReadonlyArrayFind022
     * @tc.desc Verify ReadonlyArray.find behavior: verify find return value type is T undefined type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result: int | undefined = values.find((value: int): boolean => {
        return value > 5;
      });
      expect(result).assertEqual(undefined);
      const result2: int | undefined = values.find((value: int): boolean => {
        return value === 2;
      });
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0230
     * @tc.name testReadonlyArrayFind023
     * @tc.desc Verify ReadonlyArray.find behavior: verify find returns element type and ReadonlyArray generic type T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world"];
      const result = values.find((value: string): boolean => {
        return value === "world";
      });
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0240
     * @tc.name testReadonlyArrayFind024
     * @tc.desc Verify ReadonlyArray.find behavior: large array matches element verify correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valuesSource: Array<int> = [];
      for (let i: int = 0; i < 10000; i++) {
        valuesSource.push(i);
      }
      const values: ReadonlyArray<int> = valuesSource as ReadonlyArray<int>;
      const result = values.find((value: int): boolean => {
        return value === 9999;
      });
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0250
     * @tc.name testReadonlyArrayFind025
     * @tc.desc Verify ReadonlyArray.find behavior: predicate element verify returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [100, 200, 300];
      const result = values.find((value: int): boolean => {
        return value === 100;
      });
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0260
     * @tc.name testReadonlyArrayFind026
     * @tc.desc Verify ReadonlyArray.find behavior: predicate after element verify returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [100, 200, 300];
      const result = values.find((value: int): boolean => {
        return value === 300;
      });
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0270
     * @tc.name testReadonlyArrayFind027
     * @tc.desc Verify ReadonlyArray.find behavior: find after verify original array length content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const originalLength: int = values.length;
      const result = values.find((value: int): boolean => {
        return value > 1;
      });
      expect(result).assertEqual(2);
      expect(values.length).assertEqual(originalLength);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0280
     * @tc.name testReadonlyArrayFind028
     * @tc.desc Verify ReadonlyArray.find behavior: find before after verify index element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "b", "c"];
      const result = values.find((value: string): boolean => {
        return value === "b";
      });
      expect(result).assertEqual("b");
      expect(values[0]).assertEqual("a");
      expect(values[1]).assertEqual("b");
      expect(values[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0290
     * @tc.name testReadonlyArrayFind029
     * @tc.desc Verify ReadonlyArray.find behavior: predicate callback throws an exception verify correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      try {
        values.find((value: int): boolean => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0300
     * @tc.name testReadonlyArrayFind030
     * @tc.desc Verify ReadonlyArray.find behavior: predicate verify find returns element and find Index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40];
      const foundValue = values.find((value: int): boolean => {
        return value > 25;
      });
      const foundIndex = values.findIndex((value: int): boolean => {
        return value > 25;
      });
      if (foundIndex !== -1) {
        expect(foundValue).assertEqual(values[foundIndex]);
      }
      expect(foundValue).assertEqual(30);
      expect(foundIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0310
     * @tc.name testReadonlyArrayFind031
     * @tc.desc Verify ReadonlyArray.find behavior: and API 1,2,3. find value>1 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.find((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return value > 1;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0320
     * @tc.name testReadonlyArrayFind032
     * @tc.desc Verify ReadonlyArray.find behavior: ReadonlyArray <boolean> find true element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [false, false, true, false];
      const result = arr.find((value: boolean): boolean => {
        return value;
      });
      expect(result).assertTrue();
      const none = arr.slice(0, 2).find((value: boolean): boolean => {
        return value;
      });
      expect(none).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0330
     * @tc.name testReadonlyArrayFind033
     * @tc.desc Verify ReadonlyArray.find behavior: predicate 0 - 1 1000000 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000, 5];
      const result = arr.find((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0340
     * @tc.name testReadonlyArrayFind034
     * @tc.desc Verify ReadonlyArray.find behavior: predicate int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.find((value: int): boolean => {
        return value === 0o10;
      });
      expect(result).assertEqual(0o10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0350
     * @tc.name testReadonlyArrayFind035
     * @tc.desc Verify ReadonlyArray.find behavior: predicate empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "", "b"];
      const result = arr.find((value: string): boolean => {
        return value === "";
      });
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0360
     * @tc.name testReadonlyArrayFind036
     * @tc.desc Verify ReadonlyArray.find behavior: predicate Unicode element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["x", cn, "y"];
      const result = arr.find((value: string): boolean => {
        return value === cn;
      });
      expect(result).assertEqual(cn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0370
     * @tc.name testReadonlyArrayFind037
     * @tc.desc Verify ReadonlyArray.find behavior: predicate empty element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const arr: ReadonlyArray<string> = ["a", zwsp, "c"];
      const result = arr.find((value: string): boolean => {
        return value === zwsp;
      });
      expect(result).assertEqual(zwsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0380
     * @tc.name testReadonlyArrayFind038
     * @tc.desc Verify ReadonlyArray.find behavior: matches element when find returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5];
      const result = values.find((value: int): boolean => {
        return value > 10;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0390
     * @tc.name testReadonlyArrayFind039
     * @tc.desc Verify ReadonlyArray.find behavior: multiple same when find returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 2, 2];
      const result = values.find((value: int, index: int): boolean => {
        return value == 2 && index == 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0400
     * @tc.name testReadonlyArrayFind040
     * @tc.desc Verify ReadonlyArray.find behavior: byte predicate find callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      const result = arr.find((value, index: int): boolean => {
        return value === 10 as byte || value === 20 as byte;
      });
      expect(result).assertEqual(10 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0410
     * @tc.name testReadonlyArrayFind041
     * @tc.desc Verify ReadonlyArray.find behavior: short predicate find callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 32767 as short];
      const result = arr.find((value, index: int): boolean => {
        return value === 100 as short || value === 32767 as short;
      });
      expect(result).assertEqual(100 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0420
     * @tc.name testReadonlyArrayFind042
     * @tc.desc Verify ReadonlyArray.find behavior: long predicate find callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [100, 9223372036854775807];
      const result = arr.find((value, index: int): boolean => {
        return value === 100 || value === 9223372036854775807;
      });
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0430
     * @tc.name testReadonlyArrayFind043
     * @tc.desc Verify ReadonlyArray.find behavior: float predicate find callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 3.14f, -99.99f];
      const result = arr.find((value, index: int): boolean => {
        return value === 0.0f || value === 3.14f;
      });
      expect(result).assertClose(0.0f, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0440
     * @tc.name testReadonlyArrayFind044
     * @tc.desc Verify ReadonlyArray.find behavior: char predicate find callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\u4e2d'];
      const result = arr.find((value: char, index: int): boolean => {
        return value === c'a' || value === c'\u4e2d';
      });
      expect(result).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0450
     * @tc.name testReadonlyArrayFind045
     * @tc.desc Verify ReadonlyArray.find behavior: string emoji predicate find callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "\uD83D\uDE00", "b"];
      const result = arr.find((value, index: int): boolean => {
        return value === "a" || value === "\uD83D\uDE00";
      });
      expect(result).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0460
     * @tc.name testReadonlyArrayFind046
     * @tc.desc Verify ReadonlyArray.find behavior: string predicate find callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "x"];
      const result = arr.find((value, index: int): boolean => {
        return value === "13800138000" || value === "x";
      });
      expect(result).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0470
     * @tc.name testReadonlyArrayFind047
     * @tc.desc Verify ReadonlyArray.find behavior: boolean predicate find callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.find((value, index: int): boolean => {
        return value === true || value === false;
      });
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0480
     * @tc.name testReadonlyArrayFind048
     * @tc.desc Verify ReadonlyArray.find behavior: 100 element ReadonlyArray <int> find predicate iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 0; i < 100; i++) {
        (arr as Array<int>).push(i);
      }
      const result = arr.find((value: int, index: int): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0490
     * @tc.name testReadonlyArrayFind049
     * @tc.desc Verify ReadonlyArray.find behavior: string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mail: string = "test@example.com";
      const arr: ReadonlyArray<string> = [mail, "other"];
      const result = arr.find((value: string): boolean => {
        return value === mail;
      });
      expect(result).assertEqual(mail);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0500
     * @tc.name testReadonlyArrayFind050
     * @tc.desc Verify ReadonlyArray.find behavior: string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const id: string = "310101199001011234";
      const arr: ReadonlyArray<string> = ["x", id];
      const result = arr.find((value: string): boolean => {
        return value === id;
      });
      expect(result).assertEqual(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0510
     * @tc.name testReadonlyArrayFind051
     * @tc.desc Verify ReadonlyArray.find behavior: t n string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tab: string = "\t";
      const arr: ReadonlyArray<string> = [tab, "\n", "x"];
      const result = arr.find((value: string): boolean => {
        return value === tab;
      });
      expect(result).assertEqual(tab);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0520
     * @tc.name testReadonlyArrayFind052
     * @tc.desc Verify ReadonlyArray.find behavior: long find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minL: long = -9223372036854775808;
      const arr: ReadonlyArray<long> = [minL, 0];
      const result = arr.find((value: long): boolean => {
        return value === minL;
      });
      expect(result).assertEqual(minL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0530
     * @tc.name testReadonlyArrayFind053
     * @tc.desc Verify ReadonlyArray.find behavior: POSITIVE_INFINITY float find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: float = Double.toFloat(Number.POSITIVE_INFINITY);
      const arr: ReadonlyArray<float> = [1.0f, inf];
      const result = arr.find((value: float): boolean => {
        return value === inf;
      });
      expect(result).assertEqual(inf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0540
     * @tc.name testReadonlyArrayFind054
     * @tc.desc Verify ReadonlyArray.find behavior: u0000 char find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'a'];
      const result = arr.find((value: char): boolean => {
        return value === (c'\u0000');
      });
      expect(result).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0550
     * @tc.name testReadonlyArrayFind055
     * @tc.desc Verify ReadonlyArray.find behavior: string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ko: string = "테스트";
      const arr: ReadonlyArray<string> = [ko, "en"];
      const result = arr.find((value: string): boolean => {
        return value === ko;
      });
      expect(result).assertEqual(ko);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0560
     * @tc.name testReadonlyArrayFind056
     * @tc.desc Verify ReadonlyArray.find behavior: string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ar: string = "الاختبار";
      const arr: ReadonlyArray<string> = [ar, "en"];
      const result = arr.find((value: string): boolean => {
        return value === ar;
      });
      expect(result).assertEqual(ar);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0570
     * @tc.name testReadonlyArrayFind057
     * @tc.desc Verify ReadonlyArray.find behavior: 2147483647 int find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxI: int = 2147483647;
      const arr: ReadonlyArray<int> = [1, maxI, 3];
      const result = arr.find((value: int): boolean => {
        return value === maxI;
      });
      expect(result).assertEqual(maxI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0580
     * @tc.name testReadonlyArrayFind058
     * @tc.desc Verify ReadonlyArray.find behavior: same element int find predicate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 5, 5];
      const result = arr.find((value: int): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0590
     * @tc.name testReadonlyArrayFind059
     * @tc.desc Verify ReadonlyArray.find behavior: 0x123 string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexStr: string = "0x123";
      const arr: ReadonlyArray<string> = ["0123", hexStr];
      const result = arr.find((value: string): boolean => {
        return value === hexStr;
      });
      expect(result).assertEqual(hexStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0600
     * @tc.name testReadonlyArrayFind060
     * @tc.desc Verify ReadonlyArray.find behavior: 123.45e6 string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sci: string = "123.45e6";
      const arr: ReadonlyArray<string> = [sci, "plain"];
      const result = arr.find((value: string): boolean => {
        return value === sci;
      });
      expect(result).assertEqual(sci);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0610
     * @tc.name testReadonlyArrayFind061
     * @tc.desc Verify ReadonlyArray.find behavior: - 128 byte find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte];
      const result = arr.find((value: byte): boolean => {
        return value === (-128 as byte);
      });
      expect(result).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0620
     * @tc.name testReadonlyArrayFind062
     * @tc.desc Verify ReadonlyArray.find behavior: - 32768 short find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 1 as short];
      const result = arr.find((value: short): boolean => {
        return value === (-32768 as short);
      });
      expect(result).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0630
     * @tc.name testReadonlyArrayFind063
     * @tc.desc Verify ReadonlyArray.find behavior: string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const full: string = "—";
      const arr: ReadonlyArray<string> = [full, "-"];
      const result = arr.find((value: string): boolean => {
        return value === full;
      });
      expect(result).assertEqual(full);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0640
     * @tc.name testReadonlyArrayFind064
     * @tc.desc Verify ReadonlyArray.find behavior: string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const card: string = "622202********1234";
      const arr: ReadonlyArray<string> = [card, "x"];
      const result = arr.find((value: string): boolean => {
        return value === card;
      });
      expect(result).assertEqual(card);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0650
     * @tc.name testReadonlyArrayFind065
     * @tc.desc Verify ReadonlyArray.find behavior: 2026 - 0o3 - 0o5 string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: string = "2026-0o3-0o5";
      const arr: ReadonlyArray<string> = [d, "y"];
      const result = arr.find((value: string): boolean => {
        return value === d;
      });
      expect(result).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0660
     * @tc.name testReadonlyArrayFind066
     * @tc.desc Verify ReadonlyArray.find behavior: - 0.0f float find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negZero: float = -0.0f;
      const arr: ReadonlyArray<float> = [negZero, 1.0f];
      const result = arr.find((value: float): boolean => {
        return value === negZero;
      });
      expect(result).assertEqual(negZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0670
     * @tc.name testReadonlyArrayFind067
     * @tc.desc Verify ReadonlyArray.find behavior: uffff char find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a'];
      const result = arr.find((value: char): boolean => {
        return value === (c'\uffff');
      });
      expect(result).assertEqual(c'\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0680
     * @tc.name testReadonlyArrayFind068
     * @tc.desc Verify ReadonlyArray.find behavior: - 2147483648 int find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minI: int = -2147483648;
      const arr: ReadonlyArray<int> = [minI, 0];
      const result = arr.find((value: int): boolean => {
        return value === minI;
      });
      expect(result).assertEqual(minI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0690
     * @tc.name testReadonlyArrayFind069
     * @tc.desc Verify ReadonlyArray.find behavior: 0o123 string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const octStr: string = "0123";
      const arr: ReadonlyArray<string> = [octStr, "123"];
      const result = arr.find((value: string): boolean => {
        return value === octStr;
      });
      expect(result).assertEqual(octStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0700
     * @tc.name testReadonlyArrayFind070
     * @tc.desc Verify ReadonlyArray.find behavior: 0b1010 string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binStr: string = "0b1010";
      const arr: ReadonlyArray<string> = [binStr, "1010"];
      const result = arr.find((value: string): boolean => {
        return value === binStr;
      });
      expect(result).assertEqual(binStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0710
     * @tc.name testReadonlyArrayFind071
     * @tc.desc Verify ReadonlyArray.find behavior: 0L long find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 100];
      const result = arr.find((value: long): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0720
     * @tc.name testReadonlyArrayFind072
     * @tc.desc Verify ReadonlyArray.find behavior: 0x0A byte find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = 0x0A as byte;
      const arr: ReadonlyArray<byte> = [b, 99 as byte];
      const result = arr.find((value: byte): boolean => {
        return value === b;
      });
      expect(result).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0730
     * @tc.name testReadonlyArrayFind073
     * @tc.desc Verify ReadonlyArray.find behavior: int find predicate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, -1, 2, -2];
      const result = arr.find((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0740
     * @tc.name testReadonlyArrayFind074
     * @tc.desc Verify ReadonlyArray.find behavior: Test string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mix: string = "Test 測試";
      const arr: ReadonlyArray<string> = [mix, "en"];
      const result = arr.find((value: string): boolean => {
        return value === mix;
      });
      expect(result).assertEqual(mix);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0750
     * @tc.name testReadonlyArrayFind075
     * @tc.desc Verify ReadonlyArray.find behavior: string find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ru: string = "АБВГД";
      const arr: ReadonlyArray<string> = [ru, "en"];
      const result = arr.find((value: string): boolean => {
        return value === ru;
      });
      expect(result).assertEqual(ru);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0760
     * @tc.name testReadonlyArrayFind076
     * @tc.desc Verify ReadonlyArray.find behavior: predicate index parameter find by index checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.find((value: int, index: int): boolean => {
        return index === 1;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0770
     * @tc.name testReadonlyArrayFind077
     * @tc.desc Verify ReadonlyArray.find behavior: find float NaN element via self - inequality predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      const result = arr.find((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(result !== undefined).assertTrue();
      expect(Number.isNaN(result!)).assertTrue();
      const idx = arr.findIndex((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0780
     * @tc.name testReadonlyArrayFind078
     * @tc.desc Verify ReadonlyArray.find behavior: predicate uses adjacent array index plus one neighbor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.find((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index < array.length - 1 && array[index + 1] === 30;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0790
     * @tc.name testReadonlyArrayFind079
     * @tc.desc Verify ReadonlyArray.find behavior: float negative infinity find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.NEGATIVE_INFINITY), 2.0f];
      const result = arr.find((value: float): boolean => {
        return value < 0.0f;
      });
      expect(result).assertEqual(Double.toFloat(Number.NEGATIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0800
     * @tc.name testReadonlyArrayFind080
     * @tc.desc Verify ReadonlyArray.find behavior: float MIN_VALUE find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const arr: ReadonlyArray<float> = [minVal, 2.0f];
      const result = arr.find((value: float): boolean => {
        return value === minVal;
      });
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0810
     * @tc.name testReadonlyArrayFind081
     * @tc.desc Verify ReadonlyArray.find behavior: double negative infinity find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, Number.NEGATIVE_INFINITY];
      const result = arr.find((value: double): boolean => {
        return value < 0.0;
      });
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0820
     * @tc.name testReadonlyArrayFind082
     * @tc.desc Verify ReadonlyArray.find behavior: double MIN_VALUE find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.MIN_VALUE, 5.0];
      const result = arr.find((value: double): boolean => {
        return value >= 0.0 && value < 1.0;
      });
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0830
     * @tc.name testReadonlyArrayFind083
     * @tc.desc Verify ReadonlyArray.find behavior: double NaN find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.1, nan, 2.2];
      const result = arr.find((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(result !== undefined).assertTrue();
      expect(Number.isNaN(result!)).assertTrue();
      const idx = arr.findIndex((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0840
     * @tc.name testReadonlyArrayFind084
     * @tc.desc Verify ReadonlyArray.find behavior: float negative zero find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, -0.0f];
      const result = arr.find((value: float): boolean => {
        return value === 0.0f;
      });
      expect(result).assertEqual(-0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0850
     * @tc.name testReadonlyArrayFind085
     * @tc.desc Verify ReadonlyArray.find behavior: string replacement character find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\uFFFD";
      const arr: ReadonlyArray<string> = ["a", target];
      const result = arr.find((value: string): boolean => {
        return value === target;
      });
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0860
     * @tc.name testReadonlyArrayFind086
     * @tc.desc Verify ReadonlyArray.find behavior: string carriage return and line feed find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\r\n";
      const arr: ReadonlyArray<string> = ["a", target];
      const result = arr.find((value: string): boolean => {
        return value === target;
      });
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0870
     * @tc.name testReadonlyArrayFind087
     * @tc.desc Verify ReadonlyArray.find behavior: byte boundary find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, -128 as byte];
      const result = arr.find((value: byte): boolean => {
        return value === -128 as byte;
      });
      expect(result).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0880
     * @tc.name testReadonlyArrayFind088
     * @tc.desc Verify ReadonlyArray.find behavior: short boundary find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short, 0 as short];
      const result = arr.find((value: short): boolean => {
        return value === 32767 as short;
      });
      expect(result).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0890
     * @tc.name testReadonlyArrayFind089
     * @tc.desc Verify ReadonlyArray.find behavior: long boundary find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, 0];
      const result = arr.find((value: long): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0900
     * @tc.name testReadonlyArrayFind090
     * @tc.desc Verify ReadonlyArray.find behavior: char maximum find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\uffff'];
      const result = arr.find((value: char): boolean => {
        return value === c'\uffff';
      });
      expect(result).assertEqual(c'\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0910
     * @tc.name testReadonlyArrayFind091
     * @tc.desc Verify ReadonlyArray.find behavior: adjacent next item find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.find((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index < array.length - 1 && array[index + 1] === 10;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0920
     * @tc.name testReadonlyArrayFind092
     * @tc.desc Verify ReadonlyArray.find behavior: adjacent previous item find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.find((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index > 0 && array[index - 1] === 5;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0930
     * @tc.name testReadonlyArrayFind093
     * @tc.desc Verify ReadonlyArray.find behavior: 1000 elements find hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.find((value: int): boolean => {
        return value === 500;
      });
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0940
     * @tc.name testReadonlyArrayFind094
     * @tc.desc Verify ReadonlyArray.find behavior: find callback array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      let same: boolean = false;
      arr.find((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        same = array === arr;
        return false;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0950
     * @tc.name testReadonlyArrayFind095
     * @tc.desc Verify ReadonlyArray.find behavior: float positive infinity find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY), 1.0f];
      const result = arr.find((value: float): boolean => {
        return value > 1.0e10f;
      });
      expect(result).assertEqual(Double.toFloat(Number.POSITIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0960
     * @tc.name testReadonlyArrayFind096
     * @tc.desc Verify ReadonlyArray.find behavior: int boundary find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, -2147483648];
      const result = arr.find((value: int): boolean => {
        return value === -2147483648;
      });
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0970
     * @tc.name testReadonlyArrayFind097
     * @tc.desc Verify ReadonlyArray.find behavior: boolean find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.find((value: boolean): boolean => {
        return !value;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0980
     * @tc.name testReadonlyArrayFind098
     * @tc.desc Verify ReadonlyArray.find behavior: continuation double positive infinity find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, Number.POSITIVE_INFINITY];
      const result = arr.find((value: double): boolean => {
        return value > 1.0e10;
      });
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0990
     * @tc.name testReadonlyArrayFind099
     * @tc.desc Verify ReadonlyArray.find behavior: continuation char null character find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\u0000'];
      const result = arr.find((value: char): boolean => {
        return value === c'\u0000';
      });
      expect(result).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1000
     * @tc.name testReadonlyArrayFind100
     * @tc.desc Verify ReadonlyArray.find behavior: continuation int repeated find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [8, 8, 9];
      const result = arr.find((value: int): boolean => {
        return value === 8;
      });
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1010
     * @tc.name testReadonlyArrayFind101
     * @tc.desc Verify ReadonlyArray.find behavior: continuation 100 elements find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.find((value: int): boolean => {
        return value === 77;
      });
      expect(result).assertEqual(77);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1020
     * @tc.name testReadonlyArrayFind102
     * @tc.desc Verify ReadonlyArray.find behavior: predicate return value - predicate always returns true - undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      arr.find((value: int): boolean => true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1030
     * @tc.name testReadonlyArrayFind103
     * @tc.desc Verify ReadonlyArray.find behavior: special elements - predicate handles null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "b"];
      const result = arr.find((value: string | null): boolean => value === null);
      expect(result === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1040
     * @tc.name testReadonlyArrayFind104
     * @tc.desc Verify ReadonlyArray.find behavior: error path - predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.find((_value: int, index: int): boolean => {
          if (index === 1) { throw new Error("predicate error"); }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1050
     * @tc.name testReadonlyArrayFind105
     * @tc.desc Verify ReadonlyArray.find behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.find((value: int): boolean => value >= 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1060
     * @tc.name testReadonlyArrayFind106
     * @tc.desc Verify ReadonlyArray.find behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.find((value: int): boolean => value === 20);
      expect(result).assertEqual(20);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1070
     * @tc.name testReadonlyArrayFind107
     * @tc.desc Verify ReadonlyArray.find behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      arr.find((_value: int): boolean => { count++; return false; });
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1080
     * @tc.name testReadonlyArrayFind108
     * @tc.desc Verify ReadonlyArray.find behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.find((value: int): boolean => value === 2);
      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1090
     * @tc.name testReadonlyArrayFind109
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.find((value: int): boolean => value >= 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1100
     * @tc.name testReadonlyArrayFind110
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.find((_value: string): boolean => true);
      expect(result).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1110
     * @tc.name testReadonlyArrayFind111
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.find((_value: string): boolean => true);
      expect(result).assertEqual("\u4e2d\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1120
     * @tc.name testReadonlyArrayFind112
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.find((_value: boolean): boolean => true);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1130
     * @tc.name testReadonlyArrayFind113
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.find((_value: double): boolean => true);
      expect(result !== undefined).assertTrue();
      expect(Number.isNaN(result!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1140
     * @tc.name testReadonlyArrayFind114
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.find((_value: ComboObjarr): boolean => true);
      expect(result === obj1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1150
     * @tc.name testReadonlyArrayFind115
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const found = arr.find((_value: Array<int>): boolean => true);
      expect(found !== undefined).assertTrue();
    });

  });
}
