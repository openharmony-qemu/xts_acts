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

class ReadonlyArraySomeGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArraySomeTest(): void {
  describe('ReadonlyArraySomeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0010
     * @tc.name testReadonlyArraySome001
     * @tc.desc Verify ReadonlyArray.some behavior: passing predicate callback verify some and returns correctly result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value > 1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0020
     * @tc.name testReadonlyArraySome002
     * @tc.desc Verify ReadonlyArray.some behavior: predicate callback value parameter index array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.some((value: int): boolean => {
        return value > 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0030
     * @tc.name testReadonlyArraySome003
     * @tc.desc Verify ReadonlyArray.some behavior: predicate callback value index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.some((value: int, index: int): boolean => {
        return index == 1 && value == 20;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0040
     * @tc.name testReadonlyArraySome004
     * @tc.desc Verify ReadonlyArray.some behavior: predicate callback parameter value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value == array[index];
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0050
     * @tc.name testReadonlyArraySome005
     * @tc.desc Verify ReadonlyArray.some behavior: verify predicate callback value parameter is before iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      let capturedValues: Array<int> = [];
      values.some((value: int): boolean => {
        capturedValues.push(value);
        return false;
      });
      expect(capturedValues[0]).assertEqual(10);
      expect(capturedValues[1]).assertEqual(20);
      expect(capturedValues[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0060
     * @tc.name testReadonlyArraySome006
     * @tc.desc Verify ReadonlyArray.some behavior: verify predicate callback index parameter is before element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      let capturedIndices: Array<int> = [];
      values.some((value: int, index: int): boolean => {
        capturedIndices.push(index);
        return false;
      });
      expect(capturedIndices[0]).assertEqual(0);
      expect(capturedIndices[1]).assertEqual(1);
      expect(capturedIndices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0070
     * @tc.name testReadonlyArraySome007
     * @tc.desc Verify ReadonlyArray.some behavior: verify predicate callback array parameter is reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let arrayLength = 0;
      values.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        arrayLength = array.length;
        return false;
      });
      expect(arrayLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0080
     * @tc.name testReadonlyArraySome008
     * @tc.desc Verify ReadonlyArray.some behavior: predicate callback returns boolean via ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.some((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0090
     * @tc.name testReadonlyArraySome009
     * @tc.desc Verify ReadonlyArray.some behavior: predicate callback returns true verify some element returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let callCount = 0;
      const result = values.some((value: int): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0100
     * @tc.name testReadonlyArraySome010
     * @tc.desc Verify ReadonlyArray.some behavior: predicate callback returns false verify some iteration element after returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let callCount = 0;
      const result = values.some((value: int): boolean => {
        callCount++;
        return false;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0110
     * @tc.name testReadonlyArraySome011
     * @tc.desc Verify ReadonlyArray.some behavior: element matches predicate some returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 4, 6];
      const result = values.some((value: int): boolean => {
        return value % 2 == 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0120
     * @tc.name testReadonlyArraySome012
     * @tc.desc Verify ReadonlyArray.some behavior: element matches predicate some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5];
      const result = values.some((value: int): boolean => {
        return value % 2 == 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0130
     * @tc.name testReadonlyArraySome013
     * @tc.desc Verify ReadonlyArray.some behavior: empty array some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.some((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0140
     * @tc.name testReadonlyArraySome014
     * @tc.desc Verify ReadonlyArray.some behavior: element element matches predicate some returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5];
      const result = values.some((value: int): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0150
     * @tc.name testReadonlyArraySome015
     * @tc.desc Verify ReadonlyArray.some behavior: element element matches predicate some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5];
      const result = values.some((value: int): boolean => {
        return value > 10;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0160
     * @tc.name testReadonlyArraySome016
     * @tc.desc Verify ReadonlyArray.some behavior: predicate element returns true verify is iteration after element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let callCount = 0;
      const result = values.some((value: int): boolean => {
        callCount++;
        return value == 1;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0170
     * @tc.name testReadonlyArraySome017
     * @tc.desc Verify ReadonlyArray.some behavior: ReadonlyArray <string> type some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world"];
      const result = values.some((value: string): boolean => {
        return value == "hello";
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0180
     * @tc.name testReadonlyArraySome018
     * @tc.desc Verify ReadonlyArray.some behavior: ReadonlyArray <double> type some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2, 3.3];
      const result = values.some((value: double): boolean => {
        return value > 3.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0190
     * @tc.name testReadonlyArraySome019
     * @tc.desc Verify ReadonlyArray.some behavior: 0 element verify some correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0, -1, -2];
      const result = values.some((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0200
     * @tc.name testReadonlyArraySome020
     * @tc.desc Verify ReadonlyArray.some behavior: verify typeof some return value is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const resultTrue = values.some((value: int): boolean => {
        return value == 2;
      });
      expect(resultTrue).assertTrue();
      const resultFalse = values.some((value: int): boolean => {
        return value > 100;
      });
      expect(resultFalse).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0210
     * @tc.name testReadonlyArraySome021
     * @tc.desc Verify ReadonlyArray.some behavior: large array some element matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeArray: Array<int> = [];
      for (let i = 0; i < 1000; i++) {
        largeArray.push(i);
      }
      const values: ReadonlyArray<int> = largeArray;
      const result = values.some((value: int): boolean => {
        return value > 2000;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0220
     * @tc.name testReadonlyArraySome022
     * @tc.desc Verify ReadonlyArray.some behavior: large array some exists matches element returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeArray: Array<int> = [];
      for (let i = 0; i < 1000; i++) {
        largeArray.push(i);
      }
      const values: ReadonlyArray<int> = largeArray;
      const result = values.some((value: int): boolean => {
        return value == 500;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0230
     * @tc.name testReadonlyArraySome023
     * @tc.desc Verify ReadonlyArray.some behavior: some after verify original array modifying
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Array<int> = [1, 2, 3];
      const values: ReadonlyArray<int> = original;
      values.some((value: int): boolean => {
        return value > 1;
      });
      expect(original.length).assertEqual(3);
      expect(original[0]).assertEqual(1);
      expect(original[1]).assertEqual(2);
      expect(original[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0240
     * @tc.name testReadonlyArraySome024
     * @tc.desc Verify ReadonlyArray.some behavior: predicate callback element checks verify some modifying content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Array<int> = [1, 2, 3];
      const values: ReadonlyArray<int> = original;
      const result = values.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return array[index] == value;
      });
      expect(result).assertTrue();
      expect(original[0]).assertEqual(1);
      expect(original[1]).assertEqual(2);
      expect(original[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0250
     * @tc.name testReadonlyArraySome025
     * @tc.desc Verify ReadonlyArray.some behavior: predicate callback throws an exception verify try - catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      try {
        values.some((value: int): boolean => {
          if (value == 2) {
            throw new Error("Test error in predicate");
          }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0260
     * @tc.name testReadonlyArraySome026
     * @tc.desc Verify ReadonlyArray.some behavior: verify some every some returns true when every returns true some returns false when every returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values1: ReadonlyArray<int> = [1, 2, 3];
      const someResult1 = values1.some((value: int): boolean => {
        return value > 1;
      });
      const everyResult1 = values1.every((value: int): boolean => {
        return value > 1;
      });
      expect(someResult1).assertTrue();
      expect(everyResult1).assertFalse();

      const values2: ReadonlyArray<int> = [1, 2, 3];
      const someResult2 = values2.some((value: int): boolean => {
        return value > 10;
      });
      const everyResult2 = values2.every((value: int): boolean => {
        return value > 10;
      });
      expect(someResult2).assertFalse();
      expect(everyResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0270
     * @tc.name testReadonlyArraySome027
     * @tc.desc Verify ReadonlyArray.some behavior: and API 1,2,3. some value==2 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return value == 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0280
     * @tc.name testReadonlyArraySome028
     * @tc.desc Verify ReadonlyArray.some behavior: ReadonlyArray <boolean> some checks exists true element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const allFalse: ReadonlyArray<boolean> = [false, false];
      const mixed: ReadonlyArray<boolean> = [false, true, false];
      expect(allFalse.some((value: boolean): boolean => {
          return value;
      })).assertFalse();
      expect(mixed.some((value: boolean): boolean => {
          return value;
      })).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0290
     * @tc.name testReadonlyArraySome029
     * @tc.desc Verify ReadonlyArray.some behavior: predicate 0 - 1 1000000 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000, 5];
      const result = arr.some((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0300
     * @tc.name testReadonlyArraySome030
     * @tc.desc Verify ReadonlyArray.some behavior: predicate int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.some((value: int): boolean => {
        return value === 0x10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0310
     * @tc.name testReadonlyArraySome031
     * @tc.desc Verify ReadonlyArray.some behavior: predicate empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "", "b"];
      const result = arr.some((value: string): boolean => {
        return value === "";
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0320
     * @tc.name testReadonlyArraySome032
     * @tc.desc Verify ReadonlyArray.some behavior: predicate Unicode element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["x", cn, "y"];
      const result = arr.some((value: string): boolean => {
        return value === cn;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0330
     * @tc.name testReadonlyArraySome033
     * @tc.desc Verify ReadonlyArray.some behavior: element matches predicate when some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 3, 5];
      const result = values.some((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0340
     * @tc.name testReadonlyArraySome034
     * @tc.desc Verify ReadonlyArray.some behavior: element matches when some returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0, 2, 0];
      const result = values.some((value: int): boolean => {
        return value == 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0350
     * @tc.name testReadonlyArraySome035
     * @tc.desc Verify ReadonlyArray.some behavior: byte predicate some callback checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      const result = arr.some((value, index: int): boolean => {
        return value === 10 as byte || value === 20 as byte;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0360
     * @tc.name testReadonlyArraySome036
     * @tc.desc Verify ReadonlyArray.some behavior: 100 element ReadonlyArray <int> some predicate iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 0; i < 100; i++) {
        (arr as Array<int>).push(i);
      }
      const result = arr.some((value: int, index: int): boolean => {
        return value === 99;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0370
     * @tc.name testReadonlyArraySome037
     * @tc.desc Verify ReadonlyArray.some behavior: string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mail: string = "test@example.com";
      const arr: ReadonlyArray<string> = [mail, "other"];
      const result = arr.some((value: string): boolean => {
        return value === mail;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0380
     * @tc.name testReadonlyArraySome038
     * @tc.desc Verify ReadonlyArray.some behavior: string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const id: string = "310101199001011234";
      const arr: ReadonlyArray<string> = ["x", id];
      const result = arr.some((value: string): boolean => {
        return value === id;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0390
     * @tc.name testReadonlyArraySome039
     * @tc.desc Verify ReadonlyArray.some behavior: t n string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tab: string = "\t";
      const arr: ReadonlyArray<string> = [tab, "\n", "x"];
      const result = arr.some((value: string): boolean => {
        return value === tab;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0400
     * @tc.name testReadonlyArraySome040
     * @tc.desc Verify ReadonlyArray.some behavior: long some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minL: long = -9223372036854775808;
      const arr: ReadonlyArray<long> = [minL, 0];
      const result = arr.some((value: long): boolean => {
        return value === minL;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0410
     * @tc.name testReadonlyArraySome041
     * @tc.desc Verify ReadonlyArray.some behavior: POSITIVE_INFINITY float some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: float = Double.toFloat(Number.POSITIVE_INFINITY);
      const arr: ReadonlyArray<float> = [1.0f, inf];
      const result = arr.some((value: float): boolean => {
        return value === inf;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0420
     * @tc.name testReadonlyArraySome042
     * @tc.desc Verify ReadonlyArray.some behavior: u0000 char some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'a'];
      const result = arr.some((value: char): boolean => {
        return value === (c'\u0000');
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0430
     * @tc.name testReadonlyArraySome043
     * @tc.desc Verify ReadonlyArray.some behavior: string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ko: string = "테스트";
      const arr: ReadonlyArray<string> = [ko, "en"];
      const result = arr.some((value: string): boolean => {
        return value === ko;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0440
     * @tc.name testReadonlyArraySome044
     * @tc.desc Verify ReadonlyArray.some behavior: string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ar: string = "الاختبار";
      const arr: ReadonlyArray<string> = [ar, "en"];
      const result = arr.some((value: string): boolean => {
        return value === ar;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0450
     * @tc.name testReadonlyArraySome045
     * @tc.desc Verify ReadonlyArray.some behavior: 2147483647 int some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxI: int = 2147483647;
      const arr: ReadonlyArray<int> = [1, maxI, 3];
      const result = arr.some((value: int): boolean => {
        return value === maxI;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0460
     * @tc.name testReadonlyArraySome046
     * @tc.desc Verify ReadonlyArray.some behavior: same element int some predicate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 5, 5];
      const result = arr.some((value: int): boolean => {
        return value === 5;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0470
     * @tc.name testReadonlyArraySome047
     * @tc.desc Verify ReadonlyArray.some behavior: 0x123 string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexStr: string = "0x123";
      const arr: ReadonlyArray<string> = ["0123", hexStr];
      const result = arr.some((value: string): boolean => {
        return value === hexStr;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0480
     * @tc.name testReadonlyArraySome048
     * @tc.desc Verify ReadonlyArray.some behavior: 123.45e6 string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sci: string = "123.45e6";
      const arr: ReadonlyArray<string> = [sci, "plain"];
      const result = arr.some((value: string): boolean => {
        return value === sci;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0490
     * @tc.name testReadonlyArraySome049
     * @tc.desc Verify ReadonlyArray.some behavior: - 128 byte some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte];
      const result = arr.some((value: byte): boolean => {
        return value === (-128 as byte);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0500
     * @tc.name testReadonlyArraySome050
     * @tc.desc Verify ReadonlyArray.some behavior: - 32768 short some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 1 as short];
      const result = arr.some((value: short): boolean => {
        return value === (-32768 as short);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0510
     * @tc.name testReadonlyArraySome051
     * @tc.desc Verify ReadonlyArray.some behavior: string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const full: string = "—";
      const arr: ReadonlyArray<string> = [full, "-"];
      const result = arr.some((value: string): boolean => {
        return value === full;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0520
     * @tc.name testReadonlyArraySome052
     * @tc.desc Verify ReadonlyArray.some behavior: string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const card: string = "622202********1234";
      const arr: ReadonlyArray<string> = [card, "x"];
      const result = arr.some((value: string): boolean => {
        return value === card;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0530
     * @tc.name testReadonlyArraySome053
     * @tc.desc Verify ReadonlyArray.some behavior: 2026 - 0o3 - 0o5 string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: string = "2026-0o3-0o5";
      const arr: ReadonlyArray<string> = [d, "y"];
      const result = arr.some((value: string): boolean => {
        return value === d;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0540
     * @tc.name testReadonlyArraySome054
     * @tc.desc Verify ReadonlyArray.some behavior: - 0.0f float some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negZero: float = -0.0f;
      const arr: ReadonlyArray<float> = [negZero, 1.0f];
      const result = arr.some((value: float): boolean => {
        return value === negZero;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0550
     * @tc.name testReadonlyArraySome055
     * @tc.desc Verify ReadonlyArray.some behavior: uffff char some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a'];
      const result = arr.some((value: char): boolean => {
        return value === (c'\uffff');
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0560
     * @tc.name testReadonlyArraySome056
     * @tc.desc Verify ReadonlyArray.some behavior: - 2147483648 int some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minI: int = -2147483648;
      const arr: ReadonlyArray<int> = [minI, 0];
      const result = arr.some((value: int): boolean => {
        return value === minI;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0570
     * @tc.name testReadonlyArraySome057
     * @tc.desc Verify ReadonlyArray.some behavior: 0o123 string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const octStr: string = "0123";
      const arr: ReadonlyArray<string> = [octStr, "123"];
      const result = arr.some((value: string): boolean => {
        return value === octStr;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0580
     * @tc.name testReadonlyArraySome058
     * @tc.desc Verify ReadonlyArray.some behavior: 0b1010 string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binStr: string = "0b1010";
      const arr: ReadonlyArray<string> = [binStr, "1010"];
      const result = arr.some((value: string): boolean => {
        return value === binStr;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0590
     * @tc.name testReadonlyArraySome059
     * @tc.desc Verify ReadonlyArray.some behavior: 0L long some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 100];
      const result = arr.some((value: long): boolean => {
        return value === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0600
     * @tc.name testReadonlyArraySome060
     * @tc.desc Verify ReadonlyArray.some behavior: 0x0A byte some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = 0x0A as byte;
      const arr: ReadonlyArray<byte> = [b, 99 as byte];
      const result = arr.some((value: byte): boolean => {
        return value === b;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0610
     * @tc.name testReadonlyArraySome061
     * @tc.desc Verify ReadonlyArray.some behavior: int some predicate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, -1, 2, -2];
      const result = arr.some((value: int): boolean => {
        return value < 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0620
     * @tc.name testReadonlyArraySome062
     * @tc.desc Verify ReadonlyArray.some behavior: Test string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mix: string = "Test 測試";
      const arr: ReadonlyArray<string> = [mix, "en"];
      const result = arr.some((value: string): boolean => {
        return value === mix;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0630
     * @tc.name testReadonlyArraySome063
     * @tc.desc Verify ReadonlyArray.some behavior: string some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ru: string = "АБВГД";
      const arr: ReadonlyArray<string> = [ru, "en"];
      const result = arr.some((value: string): boolean => {
        return value === ru;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0640
     * @tc.name testReadonlyArraySome064
     * @tc.desc Verify ReadonlyArray.some behavior: predicate index parameter some by index checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.some((value: int, index: int): boolean => {
        return index === 1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0650
     * @tc.name testReadonlyArraySome065
     * @tc.desc Verify ReadonlyArray.some behavior: short - circuit stops after first true predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let visitCount: int = 0;
      const result = arr.some((value: int): boolean => {
        visitCount++;
        return value === 3;
      });
      expect(result).assertTrue();
      expect(visitCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0660
     * @tc.name testReadonlyArraySome066
     * @tc.desc Verify ReadonlyArray.some behavior: float NaN array some self - inequality predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      const result = arr.some((value: float): boolean => {
        return Number.isNaN(value);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0670
     * @tc.name testReadonlyArraySome067
     * @tc.desc Verify ReadonlyArray.some behavior: float negative infinity some less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.NEGATIVE_INFINITY)];
      const result = arr.some((value: float): boolean => {
        return value < 0.0f;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0680
     * @tc.name testReadonlyArraySome068
     * @tc.desc Verify ReadonlyArray.some behavior: float MIN_VALUE some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const arr: ReadonlyArray<float> = [minVal, 2.0f];
      const result = arr.some((value: float): boolean => {
        return value === minVal;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0690
     * @tc.name testReadonlyArraySome069
     * @tc.desc Verify ReadonlyArray.some behavior: double negative infinity some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, Number.NEGATIVE_INFINITY];
      const result = arr.some((value: double): boolean => {
        return value < 0.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0700
     * @tc.name testReadonlyArraySome070
     * @tc.desc Verify ReadonlyArray.some behavior: double MIN_VALUE some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.MIN_VALUE, 5.0];
      const result = arr.some((value: double): boolean => {
        return value >= 0.0 && value < 1.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0710
     * @tc.name testReadonlyArraySome071
     * @tc.desc Verify ReadonlyArray.some behavior: double NaN some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.1, nan];
      const result = arr.some((value: double): boolean => {
        return Number.isNaN(value);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0720
     * @tc.name testReadonlyArraySome072
     * @tc.desc Verify ReadonlyArray.some behavior: float negative zero some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, -0.0f];
      const result = arr.some((value: float): boolean => {
        return value === 0.0f;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0730
     * @tc.name testReadonlyArraySome073
     * @tc.desc Verify ReadonlyArray.some behavior: string replacement character some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rep: string = "\uFFFD";
      const arr: ReadonlyArray<string> = ["a", rep];
      const result = arr.some((value: string): boolean => {
        return value === rep;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0740
     * @tc.name testReadonlyArraySome074
     * @tc.desc Verify ReadonlyArray.some behavior: string carriage return and line feed some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const crlf: string = "\r\n";
      const arr: ReadonlyArray<string> = ["x", crlf];
      const result = arr.some((value: string): boolean => {
        return value === crlf;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0750
     * @tc.name testReadonlyArraySome075
     * @tc.desc Verify ReadonlyArray.some behavior: string carriage return some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cr: string = "\r";
      const arr: ReadonlyArray<string> = [cr];
      const result = arr.some((value: string): boolean => {
        return value.length === 1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0760
     * @tc.name testReadonlyArraySome076
     * @tc.desc Verify ReadonlyArray.some behavior: string BOM some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bom: string = "\uFEFF";
      const arr: ReadonlyArray<string> = [bom];
      const result = arr.some((value: string): boolean => {
        return value === bom;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0770
     * @tc.name testReadonlyArraySome077
     * @tc.desc Verify ReadonlyArray.some behavior: string mojibake some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const garbled: string = "æµè¯";
      const arr: ReadonlyArray<string> = ["en", garbled];
      const result = arr.some((value: string): boolean => {
        return value === garbled;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0780
     * @tc.name testReadonlyArraySome078
     * @tc.desc Verify ReadonlyArray.some behavior: byte boundary some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, -128 as byte];
      const result = arr.some((value: byte): boolean => {
        return value === -128 as byte;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0790
     * @tc.name testReadonlyArraySome079
     * @tc.desc Verify ReadonlyArray.some behavior: short boundary some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [0 as short, 32767 as short];
      const result = arr.some((value: short): boolean => {
        return value === 32767 as short;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0800
     * @tc.name testReadonlyArraySome080
     * @tc.desc Verify ReadonlyArray.some behavior: long boundary some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 9223372036854775807];
      const result = arr.some((value: long): boolean => {
        return value > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0810
     * @tc.name testReadonlyArraySome081
     * @tc.desc Verify ReadonlyArray.some behavior: char maximum some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\uffff'];
      const result = arr.some((value: char): boolean => {
        return value === c'\uffff';
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0820
     * @tc.name testReadonlyArraySome082
     * @tc.desc Verify ReadonlyArray.some behavior: adjacent elements some next item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index < array.length - 1 && array[index + 1] === 10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0830
     * @tc.name testReadonlyArraySome083
     * @tc.desc Verify ReadonlyArray.some behavior: adjacent elements some previous item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 3];
      const result = arr.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index > 0 && array[index - 1] === 5;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0840
     * @tc.name testReadonlyArraySome084
     * @tc.desc Verify ReadonlyArray.some behavior: 1000 elements some hit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let visits: int = 0;
      const result = arr.some((value: int): boolean => {
        visits++;
        return value === 999;
      });
      expect(result).assertTrue();
      expect(visits).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0850
     * @tc.name testReadonlyArraySome085
     * @tc.desc Verify ReadonlyArray.some behavior: 1000 elements some all false short circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(1);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let visits: int = 0;
      const result = arr.some((value: int): boolean => {
        visits++;
        return value === 999;
      });
      expect(result).assertFalse();
      expect(visits).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0860
     * @tc.name testReadonlyArraySome086
     * @tc.desc Verify ReadonlyArray.some behavior: some callback array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      let same: boolean = false;
      arr.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        same = array === arr;
        return false;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0870
     * @tc.name testReadonlyArraySome087
     * @tc.desc Verify ReadonlyArray.some behavior: float positive infinity some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY)];
      const result = arr.some((value: float): boolean => {
        return value > 1.0e10f;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0880
     * @tc.name testReadonlyArraySome088
     * @tc.desc Verify ReadonlyArray.some behavior: int radix some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.some((value: int): boolean => {
        return value === 0b10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0890
     * @tc.name testReadonlyArraySome089
     * @tc.desc Verify ReadonlyArray.some behavior: continuation extended case count extended case - some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "123.45e6";
      const arr: ReadonlyArray<string> = ["other", target];
      const result = arr.some((value: string): boolean => {
        return value === target;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0900
     * @tc.name testReadonlyArraySome090
     * @tc.desc Verify ReadonlyArray.some behavior: continuation double positive infinity some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY, 1.0];
      const result = arr.some((value: double): boolean => {
        return value > 0.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0910
     * @tc.name testReadonlyArraySome091
     * @tc.desc Verify ReadonlyArray.some behavior: continuation index parameter some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.some((_value: int, index: int): boolean => {
        return index === 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0920
     * @tc.name testReadonlyArraySome092
     * @tc.desc Verify ReadonlyArray.some behavior: continuation double positive infinity some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, Number.POSITIVE_INFINITY];
      const result = arr.some((value: double): boolean => {
        return value > 1.0e10;
      });
      expect(result).assertTrue();
    });











    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0930
     * @tc.name testReadonlyArraySome093
     * @tc.desc Verify ReadonlyArray.some behavior: predicate return value - predicate always returns true - true false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.some((value: int): boolean => true);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0940
     * @tc.name testReadonlyArraySome094
     * @tc.desc Verify ReadonlyArray.some behavior: special elements - predicate handles null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "b"];
      const result = arr.some((value: string | null): boolean => value === null);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0950
     * @tc.name testReadonlyArraySome095
     * @tc.desc Verify ReadonlyArray.some behavior: error path - predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.some((_value: int, index: int): boolean => {
          if (index === 1) { throw new Error("predicate error"); }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0960
     * @tc.name testReadonlyArraySome096
     * @tc.desc Verify ReadonlyArray.some behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.some((value: int): boolean => value === 20);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0970
     * @tc.name testReadonlyArraySome097
     * @tc.desc Verify ReadonlyArray.some behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      arr.some((_value: int): boolean => { count++; return false; });
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0980
     * @tc.name testReadonlyArraySome098
     * @tc.desc Verify ReadonlyArray.some behavior: boundary scale - no match in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      expect(arr.some((value: int): boolean => false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_0990
     * @tc.name testReadonlyArraySome099
     * @tc.desc Verify ReadonlyArray.some behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.some((value: int): boolean => value === 2);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1000
     * @tc.name testReadonlyArraySome100
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.some((_value: string): boolean => true);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1010
     * @tc.name testReadonlyArraySome101
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.some((_value: string): boolean => true);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1020
     * @tc.name testReadonlyArraySome102
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.some((_value: boolean): boolean => true);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1030
     * @tc.name testReadonlyArraySome103
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.some((_value: double): boolean => true);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1040
     * @tc.name testReadonlyArraySome104
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.some((_value: ComboObjarr): boolean => true);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1050
     * @tc.name testReadonlyArraySome105
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      let count: int = 0;
      const result = arr.some((_value: Array<int>): boolean => {
        count++;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1060
     * @tc.name testReadonlyArraySome106
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      let count: int = 0;
      const result = arr.some((_value: int): boolean => {
        count++;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1070
     * @tc.name testReadonlyArraySome107
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let count: int = 0;
      const result = arr.some((_value: int): boolean => {
        count++;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

  });
}
