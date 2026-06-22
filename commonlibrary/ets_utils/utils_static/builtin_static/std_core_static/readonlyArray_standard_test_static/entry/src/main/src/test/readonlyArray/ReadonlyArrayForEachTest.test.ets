'use static'
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

class ReadonlyArrayForEachGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayForEachTest(): void {
  describe('ReadonlyArrayForEachTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0010
     * @tc.name testReadonlyArrayForEach001
     * @tc.desc Verify ReadonlyArray.forEach behavior: passing callbackfn callback verify forEach iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let sum: int = 0;
      values.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
          sum += value;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0020
     * @tc.name testReadonlyArrayForEach002
     * @tc.desc Verify ReadonlyArray.forEach behavior: callback parameter value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "b", "c"];
      let result: string = "";
      values.forEach((value: string): void => {
          result += value;
      });
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0030
     * @tc.name testReadonlyArrayForEach003
     * @tc.desc Verify ReadonlyArray.forEach behavior: callback value index parameter verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      let indices: Array<int> = [];
      values.forEach((value: int, index: int): void => {
          indices.push(index);
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0040
     * @tc.name testReadonlyArrayForEach004
     * @tc.desc Verify ReadonlyArray.forEach behavior: callback parameter value index array verify array is original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 10, 15];
      let count: int = 0;
      values.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
          expect(array.length).assertEqual(3);
          expect(array[index]).assertEqual(value);
          count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0050
     * @tc.name testReadonlyArrayForEach005
     * @tc.desc Verify ReadonlyArray.forEach behavior: verify callback value parameter before iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world"];
      let results: Array<string> = [];
      values.forEach((value: string, index: int, array: ReadonlyArray<string>): void => {
          results.push(value);
      });
      expect(results[0]).assertEqual("hello");
      expect(results[1]).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0060
     * @tc.name testReadonlyArrayForEach006
     * @tc.desc Verify ReadonlyArray.forEach behavior: verify callback index parameter 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [100, 200, 300, 400];
      let prevIndex: int = -1;
      values.forEach((value: int, index: int): void => {
          expect(index).assertEqual(prevIndex + 1);
          prevIndex = index;
      });
      expect(prevIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0070
     * @tc.name testReadonlyArrayForEach007
     * @tc.desc Verify ReadonlyArray.forEach behavior: verify callback array parameter and original array is reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      values.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
          expect(array === values).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0080
     * @tc.name testReadonlyArrayForEach008
     * @tc.desc Verify ReadonlyArray.forEach behavior: passing empty callback forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      values.forEach((): void => {
      });
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0090
     * @tc.name testReadonlyArrayForEach009
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach element callback verify element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let collected: Array<int> = [];
      values.forEach((value: int): void => {
          collected.push(value);
      });
      expect(collected.length).assertEqual(5);
      expect(collected[0]).assertEqual(1);
      expect(collected[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0100
     * @tc.name testReadonlyArrayForEach010
     * @tc.desc Verify ReadonlyArray.forEach behavior: empty array forEach callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      let called: boolean = false;
      values.forEach((value: int): void => {
          called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0110
     * @tc.name testReadonlyArrayForEach011
     * @tc.desc Verify ReadonlyArray.forEach behavior: element forEach callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      let count: int = 0;
      values.forEach((value: int): void => {
          count++;
          expect(value).assertEqual(42);
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0120
     * @tc.name testReadonlyArrayForEach012
     * @tc.desc Verify ReadonlyArray.forEach behavior: N element forEach N callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let count: int = 0;
      values.forEach((value: int): void => {
          count++;
      });
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0130
     * @tc.name testReadonlyArrayForEach013
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach by element order callback verify iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "b", "c", "d"];
      let result: string = "";
      values.forEach((value: string): void => {
          result += value;
      });
      expect(result).assertEqual("abcd");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0140
     * @tc.name testReadonlyArrayForEach014
     * @tc.desc Verify ReadonlyArray.forEach behavior: ReadonlyArray <string> type forEach iteration string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world"];
      let result: string = "";
      values.forEach((value: string): void => {
          result += value + " ";
      });
      expect(result).assertEqual("hello world ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0150
     * @tc.name testReadonlyArrayForEach015
     * @tc.desc Verify ReadonlyArray.forEach behavior: ReadonlyArray <double> type forEach iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2, 3.3];
      let sum: double = 0.0;
      values.forEach((value: double): void => {
          sum += value;
      });
      expect(Math.abs(sum - 6.6) < 0.001).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0160
     * @tc.name testReadonlyArrayForEach016
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach return value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let result: void = values.forEach((value: int): void => {

      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0170
     * @tc.name testReadonlyArrayForEach017
     * @tc.desc Verify ReadonlyArray.forEach behavior: callback return forEach iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let count: int = 0;
      values.forEach((value: int): void => {
          if (value === 3) {
              return;
          }
          count++;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0180
     * @tc.name testReadonlyArrayForEach018
     * @tc.desc Verify ReadonlyArray.forEach behavior: callback element new array verify order and original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      let collected: Array<int> = [];
      values.forEach((value: int): void => {
          collected.push(value);
      });
      for (let i = 0; i < values.length; i++) {
          expect(collected[i]).assertEqual(values[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0190
     * @tc.name testReadonlyArrayForEach019
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach after result is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let count: int = 0;
      const result = values.forEach((value: int): void => {
          count++;
          expect(value).assertEqual(values[count - 1]);
      });
      expect(result).assertEqual(undefined);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0200
     * @tc.name testReadonlyArrayForEach020
     * @tc.desc Verify ReadonlyArray.forEach behavior: element forEach verify element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      for (let i = 0; i < 1000; i++) {
          arr.push(i);
      }
      const values: ReadonlyArray<int> = arr;
      let count: int = 0;
      values.forEach((value: int): void => {
          count++;
      });
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0210
     * @tc.name testReadonlyArrayForEach021
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration result and for...of iteration result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let forEachResult: Array<int> = [];
      values.forEach((value: int): void => {
          forEachResult.push(value);
      });
      let forOfResult: Array<int> = [];
      for (const item of values) {
          forOfResult.push(item);
      }
      expect(forEachResult.length).assertEqual(forOfResult.length);
      for (let i = 0; i < forEachResult.length; i++) {
          expect(forEachResult[i]).assertEqual(forOfResult[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0220
     * @tc.name testReadonlyArrayForEach022
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach callback element does not affect original array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      values.forEach((): void => {
      });
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0230
     * @tc.name testReadonlyArrayForEach023
     * @tc.desc Verify ReadonlyArray.forEach behavior: callback throws an exception after after element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let count: int = 0;
      try {
          values.forEach((value: int): void => {
              count++;
              if (value === 3) {
                  throw new Error("stop");
              }
          });
          expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0240
     * @tc.name testReadonlyArrayForEach024
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach returns void map returns new array verify forEach returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const forEachResult = values.forEach((value: int): void => {

      });
      expect(forEachResult).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0250
     * @tc.name testReadonlyArrayForEach025
     * @tc.desc Verify ReadonlyArray.forEach behavior: verify callbackfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      let callCount: int = 0;
      values.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
          callCount++;
      });
      expect(callCount).assertEqual(values.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0260
     * @tc.name testReadonlyArrayForEach026
     * @tc.desc Verify ReadonlyArray.forEach behavior: and API forEach by order element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const collected: Array<int> = [];
      values.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
          collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(2);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0270
     * @tc.name testReadonlyArrayForEach027
     * @tc.desc Verify ReadonlyArray.forEach behavior: ReadonlyArray <boolean> forEach element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const collected: Array<boolean> = [];
      arr.forEach((value: boolean): void => {
          collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertTrue();
      expect(collected[1]).assertFalse();
      expect(collected[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0280
     * @tc.name testReadonlyArrayForEach028
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration int and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const collected: Array<int> = [];
      arr.forEach((value: int): void => {
          collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(0x10);
      expect(collected[2]).assertEqual(0b10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0290
     * @tc.name testReadonlyArrayForEach029
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach after original array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      values.forEach((): void => {
      });
      expect(values[0]).assertEqual(1);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0300
     * @tc.name testReadonlyArrayForEach030
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration byte and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      let count: int = 0;
      arr.forEach((_value: byte): void => {
          count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0310
     * @tc.name testReadonlyArrayForEach031
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration short and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 200 as short];
      let count: int = 0;
      arr.forEach((_value: short): void => {
          count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0320
     * @tc.name testReadonlyArrayForEach032
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration long and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 100, 200];
      let count: int = 0;
      arr.forEach((_value: long): void => {
          count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0330
     * @tc.name testReadonlyArrayForEach033
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration float and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 3.14f, -1.0f];
      let count: int = 0;
      arr.forEach((_value: float): void => {
          count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0340
     * @tc.name testReadonlyArrayForEach034
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration char and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b'];
      let count: int = 0;
      arr.forEach((_value: char): void => {
          count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0350
     * @tc.name testReadonlyArrayForEach035
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration string and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "\uD83D\uDE00"];
      let count: int = 0;
      arr.forEach((_value: string): void => {
          count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0360
     * @tc.name testReadonlyArrayForEach036
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration boolean and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      let count: int = 0;
      arr.forEach((_value: boolean): void => {
          count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0370
     * @tc.name testReadonlyArrayForEach037
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration 100 element int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 0; i < 100; i++) { (arr as Array<int>).push(i); }
      let count: int = 0;
      arr.forEach((_value: int): void => {
          count++;
      });
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0380
     * @tc.name testReadonlyArrayForEach038
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration string - string - ko
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["테스트", "en"];
      let count: int = 0;
      arr.forEach((_value: string): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0390
     * @tc.name testReadonlyArrayForEach039
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration string - string - ar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["الاختبار", "en"];
      let count: int = 0;
      arr.forEach((_value: string): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0400
     * @tc.name testReadonlyArrayForEach040
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration int - int - boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, -2147483648];
      let count: int = 0;
      arr.forEach((_value: int): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0410
     * @tc.name testReadonlyArrayForEach041
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration int - int - same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 5, 5];
      let count: int = 0;
      arr.forEach((_value: int): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0420
     * @tc.name testReadonlyArrayForEach042
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration long - long - max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, 0];
      let count: int = 0;
      arr.forEach((_value: long): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0430
     * @tc.name testReadonlyArrayForEach043
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration float - float - inf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY), 1.0f];
      let count: int = 0;
      arr.forEach((_value: float): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0440
     * @tc.name testReadonlyArrayForEach044
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration byte - byte - min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 127 as byte];
      let count: int = 0;
      arr.forEach((_value: byte): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0450
     * @tc.name testReadonlyArrayForEach045
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration short - short - min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 32767 as short];
      let count: int = 0;
      arr.forEach((_value: short): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0460
     * @tc.name testReadonlyArrayForEach046
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration char - char - max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a'];
      let count: int = 0;
      arr.forEach((_value: char): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0470
     * @tc.name testReadonlyArrayForEach047
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach iteration float - float - negzero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f];
      let count: int = 0;
      arr.forEach((_value: float): void => {
          count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0480
     * @tc.name testReadonlyArrayForEach048
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach int element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const collected: Array<int> = [];
      arr.forEach((value: int): void => {
          collected.push(value);
      });
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0490
     * @tc.name testReadonlyArrayForEach049
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach empty array callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let count: int = 0;
      arr.forEach((_value: int): void => {
          count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0500
     * @tc.name testReadonlyArrayForEach050
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach visits float NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      let count: int = 0;
      arr.forEach((value: float): void => {
        if (value !== value) {
          count++;
        }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0510
     * @tc.name testReadonlyArrayForEach051
     * @tc.desc Verify ReadonlyArray.for.each behavior: float negative infinity forEach accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.NEGATIVE_INFINITY), 1.0f];
      let count: int = 0;
      arr.forEach((value: float): void => {
          if (value < 0.0f) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0520
     * @tc.name testReadonlyArrayForEach052
     * @tc.desc Verify ReadonlyArray.for.each behavior: float MIN_VALUE forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const arr: ReadonlyArray<float> = [minVal, 2.0f];
      let count: int = 0;
      arr.forEach((value: float): void => {
          if (value === minVal) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0530
     * @tc.name testReadonlyArrayForEach053
     * @tc.desc Verify ReadonlyArray.for.each behavior: double negative infinity forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NEGATIVE_INFINITY, 2.2];
      let count: int = 0;
      arr.forEach((value: double): void => {
          if (value < 0.0) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0540
     * @tc.name testReadonlyArrayForEach054
     * @tc.desc Verify ReadonlyArray.for.each behavior: double MIN_VALUE forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.MIN_VALUE, 5.0];
      let count: int = 0;
      arr.forEach((value: double): void => {
          if (value >= 0.0 && value < 1.0) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0550
     * @tc.name testReadonlyArrayForEach055
     * @tc.desc Verify ReadonlyArray.for.each behavior: double NaN forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.1, nan];
      let count: int = 0;
      arr.forEach((value: double): void => {
          if (value !== value) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0560
     * @tc.name testReadonlyArrayForEach056
     * @tc.desc Verify ReadonlyArray.for.each behavior: float negative zero forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f];
      let count: int = 0;
      arr.forEach((value: float): void => {
          if (value === 0.0f) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0570
     * @tc.name testReadonlyArrayForEach057
     * @tc.desc Verify ReadonlyArray.for.each behavior: string replacement character forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rep: string = "\uFFFD";
      const arr: ReadonlyArray<string> = [rep, "a"];
      let found: boolean = false;
      arr.forEach((value: string): void => {
          if (value === rep) {
              found = true;
          }
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0580
     * @tc.name testReadonlyArrayForEach058
     * @tc.desc Verify ReadonlyArray.for.each behavior: string carriage return and line feed forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const crlf: string = "\r\n";
      const arr: ReadonlyArray<string> = [crlf];
      let len: int = 0;
      arr.forEach((value: string): void => {
          len = value.length;
      });
      expect(len).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0590
     * @tc.name testReadonlyArrayForEach059
     * @tc.desc Verify ReadonlyArray.for.each behavior: string carriage return forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cr: string = "\r";
      const arr: ReadonlyArray<string> = [cr, "ab"];
      let count: int = 0;
      arr.forEach((value: string): void => {
          if (value === cr) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });
  })
}
