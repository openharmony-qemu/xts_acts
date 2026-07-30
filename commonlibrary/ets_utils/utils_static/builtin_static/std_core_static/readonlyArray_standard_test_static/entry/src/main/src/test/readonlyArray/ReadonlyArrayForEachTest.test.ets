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
        if (Number.isNaN(value)) {
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
          if (Number.isNaN(value)) {
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0600
     * @tc.name testReadonlyArrayForEach060
     * @tc.desc Verify ReadonlyArray.for.each behavior: string BOM forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bom: string = "\uFEFF";
      const arr: ReadonlyArray<string> = [bom, "t"];
      let count: int = 0;
      arr.forEach((value: string): void => {
          if (value.length > 0) {
              count++;
          }
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0610
     * @tc.name testReadonlyArrayForEach061
     * @tc.desc Verify ReadonlyArray.for.each behavior: string mojibake forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const garbled: string = "æµè¯";
      const arr: ReadonlyArray<string> = [garbled];
      let len: int = 0;
      arr.forEach((value: string): void => {
        len = value.length;
      });
      expect(len).assertEqual(garbled.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0620
     * @tc.name testReadonlyArrayForEach062
     * @tc.desc Verify ReadonlyArray.for.each behavior: byte boundary forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 127 as byte];
      let sum: int = 0;
      arr.forEach((value: byte): void => {
        sum += value;
      });
      expect(sum).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0630
     * @tc.name testReadonlyArrayForEach063
     * @tc.desc Verify ReadonlyArray.for.each behavior: adjacent forEach next item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let hit: boolean = false;
      arr.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
          if (index < array.length - 1 && array[index + 1] === 3) {
              hit = true;
          }
      });
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0640
     * @tc.name testReadonlyArrayForEach064
     * @tc.desc Verify ReadonlyArray.for.each behavior: 1000 elements forEach count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      arr.forEach((_value: int): void => {
        count++;
      });
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0650
     * @tc.name testReadonlyArrayForEach065
     * @tc.desc Verify ReadonlyArray.for.each behavior: forEach callback array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      let same: boolean = false;
      arr.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
        same = array === arr;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0660
     * @tc.name testReadonlyArrayForEach066
     * @tc.desc Verify ReadonlyArray.for.each behavior: float positive infinity forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY)];
      let count: int = 0;
      arr.forEach((value: float): void => {
          if (value > 1.0e10f) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0670
     * @tc.name testReadonlyArrayForEach067
     * @tc.desc Verify ReadonlyArray.for.each behavior: int radix forEach sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      let sum: int = 0;
      arr.forEach((value: int): void => {
        sum += value;
      });
      expect(sum).assertEqual(0x10 + 0o10 + 0b10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0680
     * @tc.name testReadonlyArrayForEach068
     * @tc.desc Verify ReadonlyArray.for.each behavior: boolean forEach count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      let falseCount: int = 0;
      arr.forEach((value: boolean): void => {
          if (!value) {
              falseCount++;
          }
      });
      expect(falseCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0690
     * @tc.name testReadonlyArrayForEach069
     * @tc.desc Verify ReadonlyArray.for.each behavior: forEach index parameter validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      let sumIdx: int = 0;
      arr.forEach((value: int, index: int): void => {
        sumIdx += index;
      });
      expect(sumIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0700
     * @tc.name testReadonlyArrayForEach070
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation phone number - forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "13800138000";
      const arr: ReadonlyArray<string> = [target];
      let matched: boolean = false;
      arr.forEach((value: string): void => {
          if (value === target) {
              matched = true;
          }
      });
      expect(matched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0710
     * @tc.name testReadonlyArrayForEach071
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation email - forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "test@example.com";
      const arr: ReadonlyArray<string> = [target];
      let matched: boolean = false;
      arr.forEach((value: string): void => {
          if (value === target) {
              matched = true;
          }
      });
      expect(matched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0720
     * @tc.name testReadonlyArrayForEach072
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation double positive infinity forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY, 1.0];
      let count: int = 0;
      arr.forEach((value: double): void => {
          if (value > 0.0) {
              count++;
          }
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0730
     * @tc.name testReadonlyArrayForEach073
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation int repeated elements forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 7, 7];
      let allSeven: boolean = true;
      arr.forEach((value: int): void => {
          if (value !== 7) {
              allSeven = false;
          }
      });
      expect(allSeven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0740
     * @tc.name testReadonlyArrayForEach074
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation 100 elements forEach all positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 1; i <= 100; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      arr.forEach((value: int): void => {
          if (value > 0) {
              count++;
          }
      });
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0750
     * @tc.name testReadonlyArrayForEach075
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation hexadecimal string - forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "0x123";
      const arr: ReadonlyArray<string> = [target];
      let ok: boolean = false;
      arr.forEach((value: string): void => {
          if (value === target) {
              ok = true;
          }
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0760
     * @tc.name testReadonlyArrayForEach076
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation zero width space - forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\u200B";
      const arr: ReadonlyArray<string> = [target];
      let ok: boolean = false;
      arr.forEach((value: string): void => {
          if (value === target) {
              ok = true;
          }
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0770
     * @tc.name testReadonlyArrayForEach077
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation double positive infinity forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY];
      let count: int = 0;
      arr.forEach((value: double): void => {
          if (value > 0.0) {
              count++;
          }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0780
     * @tc.name testReadonlyArrayForEach078
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation int repeated forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [6, 6, 6];
      let sum: int = 0;
      arr.forEach((value: int): void => {
        sum += value;
      });
      expect(sum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0790
     * @tc.name testReadonlyArrayForEach079
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation 100 elements forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { source.push(1); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      arr.forEach((_value: int): void => {
        count++;
      });
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0800
     * @tc.name testReadonlyArrayForEach080
     * @tc.desc Verify ReadonlyArray.for.each behavior: continuation index parameter forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let sum: int = 0;
      arr.forEach((_value: int, index: int): void => {
        sum += index;
      });
      expect(sum).assertEqual(3);
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0810
     * @tc.name testReadonlyArrayForEach081
     * @tc.desc Verify ReadonlyArray.forEach behavior: error path - callback Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.forEach((_value: int, index: int): void => {
          if (index === 1) { throw new Error("predicate error"); }
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0820
     * @tc.name testReadonlyArrayForEach082
     * @tc.desc Verify ReadonlyArray.forEach behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.forEach((_value: int): void => {});
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0830
     * @tc.name testReadonlyArrayForEach083
     * @tc.desc Verify ReadonlyArray.forEach behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      let count: int = 0;
      let sum: int = 0;
      arr.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
        expect(index).assertEqual(count);
        expect(array.length).assertEqual(2);
        sum += value;
        count++;
      });
      expect(count).assertEqual(2);
      expect(sum).assertEqual(30);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0840
     * @tc.name testReadonlyArrayForEach084
     * @tc.desc Verify ReadonlyArray.forEach behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      arr.forEach((_value: int): void => { count++; });
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0850
     * @tc.name testReadonlyArrayForEach085
     * @tc.desc Verify ReadonlyArray.forEach behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      let sum: int = 0;
      arr.forEach((value: int, index: int, array: ReadonlyArray<int>): void => {
        expect(index).assertEqual(count);
        expect(array.length).assertEqual(source.length);
        sum += value;
        count++;
      });
      expect(count).assertEqual(3);
      expect(sum).assertEqual(6);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0860
     * @tc.name testReadonlyArrayForEach086
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let count: int = 0;
      arr.forEach((_value: int): void => { count++; });
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0870
     * @tc.name testReadonlyArrayForEach087
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      let count: int = 0;
      arr.forEach((_value: string): void => { count++; });
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0880
     * @tc.name testReadonlyArrayForEach088
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      let count: int = 0;
      arr.forEach((_value: string): void => { count++; });
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0890
     * @tc.name testReadonlyArrayForEach089
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      let count: int = 0;
      arr.forEach((_value: boolean): void => { count++; });
      expect(count).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0900
     * @tc.name testReadonlyArrayForEach090
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      let count: int = 0;
      arr.forEach((_value: double): void => { count++; });
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0910
     * @tc.name testReadonlyArrayForEach091
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      let count: int = 0;
      arr.forEach((_value: ComboObjarr): void => { count++; });
      expect(count).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0920
     * @tc.name testReadonlyArrayForEach092
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      let count: int = 0;
      arr.forEach((_value: Array<int>): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0930
     * @tc.name testReadonlyArrayForEach093
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      let count: int = 0;
      arr.forEach((_value: int): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0940
     * @tc.name testReadonlyArrayForEach094
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let count: int = 0;
      arr.forEach((_value: int): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0950
     * @tc.name testReadonlyArrayForEach095
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      let count: int = 0;
      arr.forEach((_value: string): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0960
     * @tc.name testReadonlyArrayForEach096
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      let count: int = 0;
      arr.forEach((_value: string): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0970
     * @tc.name testReadonlyArrayForEach097
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      let count: int = 0;
      arr.forEach((_value: boolean): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0980
     * @tc.name testReadonlyArrayForEach098
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      let count: int = 0;
      arr.forEach((_value: double): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_0990
     * @tc.name testReadonlyArrayForEach099
     * @tc.desc Verify ReadonlyArray.forEach behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayForEachGeneratedItem = new ReadonlyArrayForEachGeneratedItem(1);
      const obj2: ReadonlyArrayForEachGeneratedItem = new ReadonlyArrayForEachGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayForEachGeneratedItem> = [obj1, obj2];
      let count: int = 0;
      arr.forEach((_value: ReadonlyArrayForEachGeneratedItem): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1000
     * @tc.name testReadonlyArrayForEach100
     * @tc.desc Verify ReadonlyArray.forEach behavior: object element reference identity preserved through callback (TC018/TC042)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayForEachGeneratedItem = new ReadonlyArrayForEachGeneratedItem(7);
      const obj2: ReadonlyArrayForEachGeneratedItem = new ReadonlyArrayForEachGeneratedItem(9);
      const arr: ReadonlyArray<ReadonlyArrayForEachGeneratedItem> = [obj1, obj2];
      const refs: Array<ReadonlyArrayForEachGeneratedItem> = [];
      arr.forEach((value: ReadonlyArrayForEachGeneratedItem): void => {
        refs.push(value);
      });
      expect(refs[0] === obj1).assertTrue();
      expect(refs[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1010
     * @tc.name testReadonlyArrayForEach101
     * @tc.desc Verify ReadonlyArray.forEach behavior: object element id property accessible in callback (TC017)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayForEachGeneratedItem = new ReadonlyArrayForEachGeneratedItem(11);
      const obj2: ReadonlyArrayForEachGeneratedItem = new ReadonlyArrayForEachGeneratedItem(22);
      const arr: ReadonlyArray<ReadonlyArrayForEachGeneratedItem> = [obj1, obj2];
      let idSum: int = 0;
      arr.forEach((value: ReadonlyArrayForEachGeneratedItem): void => {
        idSum += value.id;
      });
      expect(idSum).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1020
     * @tc.name testReadonlyArrayForEach102
     * @tc.desc Verify ReadonlyArray.forEach behavior: two consecutive forEach calls produce identical sequences (TC019/TC048)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [4, 8, 15, 16, 23];
      const first: Array<int> = [];
      const second: Array<int> = [];
      arr.forEach((value: int): void => { first.push(value); });
      arr.forEach((value: int): void => { second.push(value); });
      expect(first.length).assertEqual(second.length);
      for (let i: int = 0; i < first.length; i++) {
        expect(first[i]).assertEqual(second[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1030
     * @tc.name testReadonlyArrayForEach103
     * @tc.desc Verify ReadonlyArray.forEach behavior: nested array elements maintain reference identity (TC032/TC062)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Array<int> = [1, 2];
      const inner2: Array<int> = [3, 4, 5];
      const arr: ReadonlyArray<Array<int>> = [inner1, inner2];
      const refs: Array<Array<int>> = [];
      arr.forEach((value: Array<int>): void => { refs.push(value); });
      expect(refs[0] === inner1).assertTrue();
      expect(refs[1] === inner2).assertTrue();
      expect(refs[1].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1040
     * @tc.name testReadonlyArrayForEach104
     * @tc.desc Verify ReadonlyArray.forEach behavior: empty string element not skipped during iteration (TC037)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "", "y"];
      let emptySeen: boolean = false;
      let count: int = 0;
      arr.forEach((value: string, index: int): void => {
        if (index === 1 && value === "") { emptySeen = true; }
        count++;
      });
      expect(emptySeen).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1050
     * @tc.name testReadonlyArrayForEach105
     * @tc.desc Verify ReadonlyArray.forEach behavior: +0 and -0 both visited and treated equal by === (TC036)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [0.0, -0.0];
      let zeroEqualCount: int = 0;
      arr.forEach((value: double): void => {
        if (value === 0.0) { zeroEqualCount++; }
      });
      expect(zeroEqualCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1060
     * @tc.name testReadonlyArrayForEach106
     * @tc.desc Verify ReadonlyArray.forEach behavior: callback throw preserves error message text (TC011)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      let caughtMessage: string = "";
      try {
        arr.forEach((value: int): void => {
          if (value === 20) { throw new Error("forEach-trip"); }
        });
        expect().assertFail();
      } catch (error) {
        caughtMessage = (error as Error).message;
      }
      expect(caughtMessage).assertEqual("forEach-trip");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1070
     * @tc.name testReadonlyArrayForEach107
     * @tc.desc Verify ReadonlyArray.forEach behavior: forEach call does not replace object references in original array (TC042)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayForEachGeneratedItem = new ReadonlyArrayForEachGeneratedItem(1);
      const obj2: ReadonlyArrayForEachGeneratedItem = new ReadonlyArrayForEachGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayForEachGeneratedItem> = [obj1, obj2];
      arr.forEach((_value: ReadonlyArrayForEachGeneratedItem): void => {});
      expect(arr[0] === obj1).assertTrue();
      expect(arr[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1080
     * @tc.name testReadonlyArrayForEach108
     * @tc.desc Verify ReadonlyArray.forEach behavior: value parameter equals array[index] at each iteration (signature contract)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["alpha", "beta", "gamma"];
      let mismatches: int = 0;
      arr.forEach((value: string, index: int, array: ReadonlyArray<string>): void => {
        if (array[index] !== value) { mismatches++; }
      });
      expect(mismatches).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1090
     * @tc.name testReadonlyArrayForEach109
     * @tc.desc Verify ReadonlyArray.forEach behavior: long string element preserved without truncation (TC039)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longText: string = "";
      for (let i: int = 0; i < 200; i++) { longText += "ab"; }
      const arr: ReadonlyArray<string> = [longText, "tail"];
      let observedLen: int = 0;
      arr.forEach((value: string, index: int): void => {
        if (index === 0) { observedLen = value.length; }
      });
      expect(observedLen).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1100
     * @tc.name testReadonlyArrayForEach110
     * @tc.desc Verify ReadonlyArray.forEach behavior: callback throw at first element prevents further iteration (TC012)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let count: int = 0;
      try {
        arr.forEach((value: int): void => {
          count++;
          if (value === 1) { throw new Error("first"); }
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("Error");
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1110
     * @tc.name testReadonlyArrayForEach111
     * @tc.desc Verify ReadonlyArray.forEach behavior: outer counter side-effect equals length for repeated values (TC024 reinforced)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [9, 9, 9, 9];
      let visits: int = 0;
      let total: int = 0;
      arr.forEach((value: int): void => {
        visits++;
        total += value;
      });
      expect(visits).assertEqual(4);
      expect(total).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FOR_EACH_1120
     * @tc.name testReadonlyArrayForEach112
     * @tc.desc Verify ReadonlyArray.forEach behavior: array-typed callback parameter length equals receiver length each call (TC003)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayForEach112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let lenMismatch: int = 0;
      arr.forEach((_value: int, _index: int, array: ReadonlyArray<int>): void => {
        if (array.length !== 5) { lenMismatch++; }
      });
      expect(lenMismatch).assertEqual(0);
    });

  });
}
