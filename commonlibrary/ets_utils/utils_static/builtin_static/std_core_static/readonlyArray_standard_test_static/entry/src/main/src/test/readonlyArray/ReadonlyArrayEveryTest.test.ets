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

class ReadonlyArrayEveryGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayEveryTest(): void {
  describe('ReadonlyArrayEveryTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0100
     * @tc.name testReadonlyArrayEvery001
     * @tc.desc Verify ReadonlyArray.every behavior: passing predicate callback verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0200
     * @tc.name testReadonlyArrayEvery002
     * @tc.desc Verify ReadonlyArray.every behavior: predicate callback value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 6];
      const result = values.every((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0300
     * @tc.name testReadonlyArrayEvery003
     * @tc.desc Verify ReadonlyArray.every behavior: predicate callback value index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.every((value: int, index: int): boolean => {
        return value > index * 5;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0400
     * @tc.name testReadonlyArrayEvery004
     * @tc.desc Verify ReadonlyArray.every behavior: predicate callback parameter value, index, array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 5, 5];
      const result = values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value === array[0];
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0500
     * @tc.name testReadonlyArrayEvery005
     * @tc.desc Verify ReadonlyArray.every behavior: verify callback value parameter is before iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const collected: Array<int> = [];
      const result = values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected[0]).assertEqual(10);
      expect(collected[1]).assertEqual(20);
      expect(collected[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0600
     * @tc.name testReadonlyArrayEvery006
     * @tc.desc Verify ReadonlyArray.every behavior: verify callback array parameter is original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let arrayMatch = false;
      const result = values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        if (index === 0) {
          arrayMatch = array === values;
        }
        return true;
      });
      expect(result).assertTrue();
      expect(arrayMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0700
     * @tc.name testReadonlyArrayEvery007
     * @tc.desc Verify ReadonlyArray.every behavior: predicate callback returns boolean via ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0800
     * @tc.name testReadonlyArrayEvery008
     * @tc.desc Verify ReadonlyArray.every behavior: predicate returns true verify every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_0900
     * @tc.name testReadonlyArrayEvery009
     * @tc.desc Verify ReadonlyArray.every behavior: predicate returns false verify every returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1000
     * @tc.name testReadonlyArrayEvery010
     * @tc.desc Verify ReadonlyArray.every behavior: element matches predicate returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 6, 8];
      const result = values.every((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1100
     * @tc.name testReadonlyArrayEvery011
     * @tc.desc Verify ReadonlyArray.every behavior: element matches predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 3, 6, 8];
      const result = values.every((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1200
     * @tc.name testReadonlyArrayEvery012
     * @tc.desc Verify ReadonlyArray.every behavior: element matches predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5, 7];
      const result = values.every((value: int): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1300
     * @tc.name testReadonlyArrayEvery013
     * @tc.desc Verify ReadonlyArray.every behavior: empty array every returns true empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1400
     * @tc.name testReadonlyArrayEvery014
     * @tc.desc Verify ReadonlyArray.every behavior: element element matches returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5];
      const result = values.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1500
     * @tc.name testReadonlyArrayEvery015
     * @tc.desc Verify ReadonlyArray.every behavior: element element matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [-1];
      const result = values.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1600
     * @tc.name testReadonlyArrayEvery016
     * @tc.desc Verify ReadonlyArray.every behavior: element matches when every iteration after element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let callCount: int = 0;
      const result = values.every((value: int): boolean => {
        callCount++;
        return value > 10;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1700
     * @tc.name testReadonlyArrayEvery017
     * @tc.desc Verify ReadonlyArray.every behavior: ReadonlyArray <string> type every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world", "test"];
      const result = values.every((value: string): boolean => {
        return value.length > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1800
     * @tc.name testReadonlyArrayEvery018
     * @tc.desc Verify ReadonlyArray.every behavior: ReadonlyArray <double> type every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2, 3.3];
      const result = values.every((value: double): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_1900
     * @tc.name testReadonlyArrayEvery019
     * @tc.desc Verify ReadonlyArray.every behavior: 0 when verify every is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0, -1, -5, 3];
      const result = values.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2000
     * @tc.name testReadonlyArrayEvery020
     * @tc.desc Verify ReadonlyArray.every behavior: verify every return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2100
     * @tc.name testReadonlyArrayEvery021
     * @tc.desc Verify ReadonlyArray.every behavior: large array 100 element matches returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valuesSource: Array<int> = [];
      for (let i = 0; i < 100; i++) {
        valuesSource.push(i + 1);
      }
      const values: ReadonlyArray<int> = valuesSource as ReadonlyArray<int>;
      const result = values.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2200
     * @tc.name testReadonlyArrayEvery022
     * @tc.desc Verify ReadonlyArray.every behavior: large array element matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valuesSource: Array<int> = [];
      for (let i = 0; i < 100; i++) {
        valuesSource.push(i + 1);
      }
      valuesSource[50] = -1;
      const values: ReadonlyArray<int> = valuesSource as ReadonlyArray<int>;
      const result = values.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2300
     * @tc.name testReadonlyArrayEvery023
     * @tc.desc Verify ReadonlyArray.every behavior: every after original array length content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const originalLength = values.length;
      values.every((value: int): boolean => {
        return value > 0;
      });
      expect(values.length).assertEqual(originalLength);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2400
     * @tc.name testReadonlyArrayEvery024
     * @tc.desc Verify ReadonlyArray.every behavior: predicate callback modifying does not affect original array ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const originalFirst = values[0];
      values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value > 0;
      });
      expect(values[0]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2500
     * @tc.name testReadonlyArrayEvery025
     * @tc.desc Verify ReadonlyArray.every behavior: predicate callback throws an exception when every break and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      try {
        values.every((value: int): boolean => {
          if (value === 2) {
            throw new Error("Test error in predicate");
          }
          return true;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2600
     * @tc.name testReadonlyArrayEvery026
     * @tc.desc Verify ReadonlyArray.every behavior: ReadonlyArray <boolean> every checks element is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const allTrue: ReadonlyArray<boolean> = [true, true, true];
      const mixed: ReadonlyArray<boolean> = [true, false, true];
      expect(allTrue.every((value: boolean): boolean => {
          return value;
      })).assertTrue();
      expect(mixed.every((value: boolean): boolean => {
          return value;
      })).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2700
     * @tc.name testReadonlyArrayEvery027
     * @tc.desc Verify ReadonlyArray.every behavior: predicate 0 - 1 1000000 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000, 5];
      const result = arr.every((value: int): boolean => {
        return value >= 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2800
     * @tc.name testReadonlyArrayEvery028
     * @tc.desc Verify ReadonlyArray.every behavior: predicate int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_2900
     * @tc.name testReadonlyArrayEvery029
     * @tc.desc Verify ReadonlyArray.every behavior: predicate empty element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const arr: ReadonlyArray<string> = ["a", zwsp, "c"];
      const result = arr.every((value: string): boolean => {
        return value === zwsp || value === "a" || value === "c";
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3000
     * @tc.name testReadonlyArrayEvery030
     * @tc.desc Verify ReadonlyArray.every behavior: element matches when every returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 0, 3];
      const result = values.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3100
     * @tc.name testReadonlyArrayEvery031
     * @tc.desc Verify ReadonlyArray.every behavior: predicate parameter array and reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let sameRef: boolean = false;
      values.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        sameRef = array === values;
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3200
     * @tc.name testReadonlyArrayEvery032
     * @tc.desc Verify ReadonlyArray.every behavior: byte predicate every callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      const result = arr.every((value, index: int): boolean => {
        return value === 10 as byte || value === 20 as byte || value === 30 as byte;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3300
     * @tc.name testReadonlyArrayEvery033
     * @tc.desc Verify ReadonlyArray.every behavior: short predicate every callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 32767 as short];
      const result = arr.every((value, index: int): boolean => {
        return value === 100 as short || value === 32767 as short;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3400
     * @tc.name testReadonlyArrayEvery034
     * @tc.desc Verify ReadonlyArray.every behavior: long predicate every callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [100, 9223372036854775807];
      const result = arr.every((value, index: int): boolean => {
        return value === 100 || value === 9223372036854775807;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3500
     * @tc.name testReadonlyArrayEvery035
     * @tc.desc Verify ReadonlyArray.every behavior: boolean predicate every callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.every((value, index: int): boolean => {
        return value === true || value === false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3600
     * @tc.name testReadonlyArrayEvery036
     * @tc.desc Verify ReadonlyArray.every behavior: 1000 element array every predicate iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(1);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.every((value: int): boolean => {
        return value === 1;
      });
      expect(result).assertTrue();
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3700
     * @tc.name testReadonlyArrayEvery037
     * @tc.desc Verify ReadonlyArray.every behavior: float NaN array every self - inequality predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [nan, nan];
      const result = arr.every((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3800
     * @tc.name testReadonlyArrayEvery038
     * @tc.desc Verify ReadonlyArray.every behavior: float negative infinity every greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.NEGATIVE_INFINITY), 1.0f];
      const result = arr.every((value: float): boolean => {
        return value > 0.0f;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_3900
     * @tc.name testReadonlyArrayEvery039
     * @tc.desc Verify ReadonlyArray.every behavior: float MIN_VALUE every positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.MIN_VALUE), 1.0f];
      const result = arr.every((value: float): boolean => {
        return value >= 0.0f;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4000
     * @tc.name testReadonlyArrayEvery040
     * @tc.desc Verify ReadonlyArray.every behavior: double negative infinity every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NEGATIVE_INFINITY, 2.2];
      const result = arr.every((value: double): boolean => {
        return value < 0.0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4100
     * @tc.name testReadonlyArrayEvery041
     * @tc.desc Verify ReadonlyArray.every behavior: double MIN_VALUE every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.MIN_VALUE, 1.0];
      const result = arr.every((value: double): boolean => {
        return value >= 0.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4200
     * @tc.name testReadonlyArrayEvery042
     * @tc.desc Verify ReadonlyArray.every behavior: double NaN every self inequality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, nan];
      const result = arr.every((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4300
     * @tc.name testReadonlyArrayEvery043
     * @tc.desc Verify ReadonlyArray.every behavior: float negative zero every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f];
      const result = arr.every((value: float): boolean => {
        return value === value;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4400
     * @tc.name testReadonlyArrayEvery044
     * @tc.desc Verify ReadonlyArray.every behavior: string replacement character every extended case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rep: string = "\uFFFD";
      const arr: ReadonlyArray<string> = [rep, "ok"];
      const result = arr.every((value: string): boolean => {
        return value.length > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4500
     * @tc.name testReadonlyArrayEvery045
     * @tc.desc Verify ReadonlyArray.every behavior: string carriage return and line feed every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const crlf: string = "\r\n";
      const arr: ReadonlyArray<string> = [crlf, "x"];
      const result = arr.every((value: string): boolean => {
        return value.length >= 2;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4600
     * @tc.name testReadonlyArrayEvery046
     * @tc.desc Verify ReadonlyArray.every behavior: string carriage return every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cr: string = "\r";
      const arr: ReadonlyArray<string> = [cr, "ab"];
      const result = arr.every((value: string): boolean => {
        return value.length > 1;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4700
     * @tc.name testReadonlyArrayEvery047
     * @tc.desc Verify ReadonlyArray.every behavior: string BOM every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bom: string = "\uFEFF";
      const arr: ReadonlyArray<string> = [bom, "text"];
      const result = arr.every((value: string): boolean => {
        return value.length > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4800
     * @tc.name testReadonlyArrayEvery048
     * @tc.desc Verify ReadonlyArray.every behavior: string mojibake every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const garbled: string = "æµè¯";
      const arr: ReadonlyArray<string> = [garbled, "en"];
      const result = arr.every((value: string): boolean => {
        return value.length > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_4900
     * @tc.name testReadonlyArrayEvery049
     * @tc.desc Verify ReadonlyArray.every behavior: byte boundary every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 127 as byte];
      const result = arr.every((value: byte): boolean => {
        return value === -128 as byte || value === 127 as byte;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5000
     * @tc.name testReadonlyArrayEvery050
     * @tc.desc Verify ReadonlyArray.every behavior: short boundary every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 32767 as short];
      const result = arr.every((value: short): boolean => {
        return value === -32768 as short || value === 32767 as short;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5100
     * @tc.name testReadonlyArrayEvery051
     * @tc.desc Verify ReadonlyArray.every behavior: long boundary every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, -9223372036854775808];
      const result = arr.every((value: long): boolean => {
        return value === 9223372036854775807 || value === -9223372036854775808;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5200
     * @tc.name testReadonlyArrayEvery052
     * @tc.desc Verify ReadonlyArray.every behavior: char maximum every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a'];
      const result = arr.every((value: char): boolean => {
        return value >= c'a';
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5300
     * @tc.name testReadonlyArrayEvery053
     * @tc.desc Verify ReadonlyArray.every behavior: adjacent elements every next item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        if (index === array.length - 1) {
          return true;
        }
        return array[index + 1] > value;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5400
     * @tc.name testReadonlyArrayEvery054
     * @tc.desc Verify ReadonlyArray.every behavior: adjacent elements every previous item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        if (index === 0) {
          return value === 1;
        }
        return array[index - 1] < value;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5500
     * @tc.name testReadonlyArrayEvery055
     * @tc.desc Verify ReadonlyArray.every behavior: 1000 elements every visit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(1);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let visits: int = 0;
      const result = arr.every((value: int): boolean => {
        visits++;
        return value === 1;
      });
      expect(result).assertTrue();
      expect(visits).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5600
     * @tc.name testReadonlyArrayEvery056
     * @tc.desc Verify ReadonlyArray.every behavior: every callback array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      let same: boolean = false;
      arr.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        same = array === arr;
        return true;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5700
     * @tc.name testReadonlyArrayEvery057
     * @tc.desc Verify ReadonlyArray.every behavior: float positive infinity every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY), 1.0f];
      const result = arr.every((value: float): boolean => {
        return value > 0.0f;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5800
     * @tc.name testReadonlyArrayEvery058
     * @tc.desc Verify ReadonlyArray.every behavior: continuation fullwidth dash - every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "—";
      const arr: ReadonlyArray<string> = [target, target];
      const result = arr.every((value: string): boolean => {
        return value.length >= target.length;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_5900
     * @tc.name testReadonlyArrayEvery059
     * @tc.desc Verify ReadonlyArray.every behavior: continuation 0b1010 extended case - every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "0b1010";
      const arr: ReadonlyArray<string> = [target, target];
      const result = arr.every((value: string): boolean => {
        return value.length >= target.length;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6000
     * @tc.name testReadonlyArrayEvery060
     * @tc.desc Verify ReadonlyArray.every behavior: continuation double positive infinity every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY, 1.0];
      const result = arr.every((value: double): boolean => {
        return value > 0.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6100
     * @tc.name testReadonlyArrayEvery061
     * @tc.desc Verify ReadonlyArray.every behavior: continuation char null character every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'b'];
      const result = arr.every((value: char): boolean => {
        return value === c'\u0000' || value === c'b';
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6200
     * @tc.name testReadonlyArrayEvery062
     * @tc.desc Verify ReadonlyArray.every behavior: continuation int repeated elements every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 7, 7];
      const result = arr.every((value: int): boolean => {
        return value === 7;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6300
     * @tc.name testReadonlyArrayEvery063
     * @tc.desc Verify ReadonlyArray.every behavior: continuation 100 elements every all positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 1; i <= 100; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.every((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6400
     * @tc.name testReadonlyArrayEvery064
     * @tc.desc Verify ReadonlyArray.every behavior: continuation index parameter every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.every((_value: int, index: int): boolean => {
        return index < 3;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6500
     * @tc.name testReadonlyArrayEvery065
     * @tc.desc Verify ReadonlyArray.every behavior: predicate return value - predicate always returns true - true false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.every((value: int): boolean => true);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6600
     * @tc.name testReadonlyArrayEvery066
     * @tc.desc Verify ReadonlyArray.every behavior: special elements - predicate handles null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "b"];
      const result = arr.every((value: string | null): boolean => value === null);
      expect(result).assertFalse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6700
     * @tc.name testReadonlyArrayEvery067
     * @tc.desc Verify ReadonlyArray.every behavior: error path - predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.every((_value: int, index: int): boolean => {
          if (index === 1) { throw new Error("predicate error"); }
          return true;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6800
     * @tc.name testReadonlyArrayEvery068
     * @tc.desc Verify ReadonlyArray.every behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.every((value: int): boolean => value >= 0);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_6900
     * @tc.name testReadonlyArrayEvery069
     * @tc.desc Verify ReadonlyArray.every behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      let visits: int = 0;
      const result = arr.every((value: int): boolean => {
        visits++;
        return value > 0;
      });
      expect(result).assertTrue();
      expect(visits).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7000
     * @tc.name testReadonlyArrayEvery070
     * @tc.desc Verify ReadonlyArray.every behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const collected: Array<int> = [];
      arr.every((value: int): boolean => { collected.push(value); return true; });
      expect(collected.length).assertEqual(1024);
      expect(collected[0]).assertEqual(0);
      expect(collected[1023]).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7100
     * @tc.name testReadonlyArrayEvery071
     * @tc.desc Verify ReadonlyArray.every behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const collected: Array<int> = [];
      const result = arr.every((value: int): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[2]).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7200
     * @tc.name testReadonlyArrayEvery072
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const collected: Array<string> = [];
      const result = arr.every((value: string): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7300
     * @tc.name testReadonlyArrayEvery073
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const collected: Array<string> = [];
      const result = arr.every((value: string): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7400
     * @tc.name testReadonlyArrayEvery074
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const collected: Array<boolean> = [];
      const result = arr.every((value: boolean): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7500
     * @tc.name testReadonlyArrayEvery075
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      let visits: int = 0;
      const result = arr.every((value: double): boolean => {
        visits++;
        return true;
      });
      expect(result).assertTrue();
      expect(visits).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7600
     * @tc.name testReadonlyArrayEvery076
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const collected: Array<ComboObjarr> = [];
      const result = arr.every((value: ComboObjarr): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0] === arr[0]).assertTrue();
      expect(collected[arr.length - 1] === arr[arr.length - 1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7700
     * @tc.name testReadonlyArrayEvery077
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const collected: Array<Array<int>> = [];
      const result = arr.every((value: Array<int>): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0] === arr[0]).assertTrue();
      expect(collected[arr.length - 1] === arr[arr.length - 1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7800
     * @tc.name testReadonlyArrayEvery078
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const collected: Array<int> = [];
      const result = arr.every((value: int): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_7900
     * @tc.name testReadonlyArrayEvery079
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const collected: Array<int> = [];
      const result = arr.every((value: int): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8000
     * @tc.name testReadonlyArrayEvery080
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const collected: Array<string> = [];
      const result = arr.every((value: string): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8100
     * @tc.name testReadonlyArrayEvery081
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const collected: Array<string> = [];
      const result = arr.every((value: string): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8200
     * @tc.name testReadonlyArrayEvery082
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const collected: Array<boolean> = [];
      const result = arr.every((value: boolean): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8300
     * @tc.name testReadonlyArrayEvery083
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const collected: Array<double> = [];
      const result = arr.every((value: double): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8400
     * @tc.name testReadonlyArrayEvery084
     * @tc.desc Verify ReadonlyArray.every behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayEveryGeneratedItem = new ReadonlyArrayEveryGeneratedItem(1);
      const obj2: ReadonlyArrayEveryGeneratedItem = new ReadonlyArrayEveryGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayEveryGeneratedItem> = [obj1, obj2];
      const collected: Array<ReadonlyArrayEveryGeneratedItem> = [];
      const result = arr.every((value: ReadonlyArrayEveryGeneratedItem): boolean => {
        collected.push(value);
        return true;
      });
      expect(result).assertTrue();
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0] === arr[0]).assertTrue();
      expect(collected[arr.length - 1] === arr[arr.length - 1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8500
     * @tc.name testReadonlyArrayEvery085
     * @tc.desc Verify ReadonlyArray.every behavior: only first element matches predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 1, 1];
      const result = arr.every((value: int): boolean => value >= 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8600
     * @tc.name testReadonlyArrayEvery086
     * @tc.desc Verify ReadonlyArray.every behavior: only middle element matches predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 10, 1];
      const result = arr.every((value: int): boolean => value >= 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8700
     * @tc.name testReadonlyArrayEvery087
     * @tc.desc Verify ReadonlyArray.every behavior: tail-only mismatch traverses all elements before returning false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2, 4, 6, 7];
      let visits: int = 0;
      const result = arr.every((value: int): boolean => {
        visits++;
        return value % 2 === 0;
      });
      expect(result).assertFalse();
      expect(visits).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8800
     * @tc.name testReadonlyArrayEvery088
     * @tc.desc Verify ReadonlyArray.every behavior: predicate uses string prefix condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["pre_a", "pre_b", "pre_c"];
      const result = arr.every((value: string): boolean => value.startsWith("pre_"));
      expect(result).assertTrue();
      const arr2: ReadonlyArray<string> = ["pre_a", "other", "pre_c"];
      const result2 = arr2.every((value: string): boolean => value.startsWith("pre_"));
      expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_8900
     * @tc.name testReadonlyArrayEvery089
     * @tc.desc Verify ReadonlyArray.every behavior: predicate evaluates object property field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ReadonlyArrayEveryGeneratedItem = new ReadonlyArrayEveryGeneratedItem(2);
      const o2: ReadonlyArrayEveryGeneratedItem = new ReadonlyArrayEveryGeneratedItem(4);
      const o3: ReadonlyArrayEveryGeneratedItem = new ReadonlyArrayEveryGeneratedItem(6);
      const arr: ReadonlyArray<ReadonlyArrayEveryGeneratedItem> = [o1, o2, o3];
      const result = arr.every((v: ReadonlyArrayEveryGeneratedItem): boolean => v.id % 2 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9000
     * @tc.name testReadonlyArrayEvery090
     * @tc.desc Verify ReadonlyArray.every behavior: predicate handles undefined element in union array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 3];
      const result = arr.every((v: int | undefined): boolean => v !== undefined);
      expect(result).assertFalse();
      const arr2: ReadonlyArray<int | undefined> = [1, 2, 3];
      const result2 = arr2.every((v: int | undefined): boolean => v !== undefined);
      expect(result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9100
     * @tc.name testReadonlyArrayEvery091
     * @tc.desc Verify ReadonlyArray.every behavior: predicate throws at middle element stops further iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let visits: int = 0;
      try {
        arr.every((value: int): boolean => {
          visits++;
          if (value === 2) {
            throw new Error("stop");
          }
          return true;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(visits).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9200
     * @tc.name testReadonlyArrayEvery092
     * @tc.desc Verify ReadonlyArray.every behavior: index argument increments sequentially from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40];
      const indices: Array<int> = [];
      arr.every((value: int, index: int): boolean => {
        indices.push(index);
        return true;
      });
      expect(indices.length).assertEqual(4);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9300
     * @tc.name testReadonlyArrayEvery093
     * @tc.desc Verify ReadonlyArray.every behavior: object reference array unchanged after every call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ReadonlyArrayEveryGeneratedItem = new ReadonlyArrayEveryGeneratedItem(1);
      const o2: ReadonlyArrayEveryGeneratedItem = new ReadonlyArrayEveryGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayEveryGeneratedItem> = [o1, o2];
      arr.every((v: ReadonlyArrayEveryGeneratedItem): boolean => v.id > 0);
      expect(arr[0] === o1).assertTrue();
      expect(arr[1] === o2).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9400
     * @tc.name testReadonlyArrayEvery094
     * @tc.desc Verify ReadonlyArray.every behavior: consecutive calls produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2, 4, 6];
      const visits1: Array<int> = [];
      const visits2: Array<int> = [];
      const r1 = arr.every((v: int): boolean => { visits1.push(v); return v % 2 === 0; });
      const r2 = arr.every((v: int): boolean => { visits2.push(v); return v % 2 === 0; });
      const r3 = arr.every((v: int): boolean => v % 2 === 0);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertTrue();
      expect(visits1.length).assertEqual(arr.length);
      expect(visits2.length).assertEqual(visits1.length);
      for (let i: int = 0; i < visits1.length; i++) {
        expect(visits2[i]).assertEqual(visits1[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9500
     * @tc.name testReadonlyArrayEvery095
     * @tc.desc Verify ReadonlyArray.every behavior: large array tail-only mismatch returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 500; i++) {
        source.push(1);
      }
      source[499] = -1;
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.every((v: int): boolean => v > 0);
      expect(result).assertFalse();
      expect(arr.length).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9600
     * @tc.name testReadonlyArrayEvery096
     * @tc.desc Verify ReadonlyArray.every behavior: large array no element matches returns false on first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 200; i++) {
        source.push(-1);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let visits: int = 0;
      const result = arr.every((v: int): boolean => {
        visits++;
        return v > 0;
      });
      expect(result).assertFalse();
      expect(visits).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9700
     * @tc.name testReadonlyArrayEvery097
     * @tc.desc Verify ReadonlyArray.every behavior: predicate uses array argument length to derive condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 3, 3];
      const result = arr.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value === array.length;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9800
     * @tc.name testReadonlyArrayEvery098
     * @tc.desc Verify ReadonlyArray.every behavior: predicate accessing array element via index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 6, 7];
      const result = arr.every((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return array[index] === value;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_EVERY_9900
     * @tc.name testReadonlyArrayEvery099
     * @tc.desc Verify ReadonlyArray.every behavior: empty array predicate is never invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEvery099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let visits: int = 0;
      const result = arr.every((value: int): boolean => {
        visits++;
        return false;
      });
      expect(result).assertTrue();
      expect(visits).assertEqual(0);
    });

  });
}
