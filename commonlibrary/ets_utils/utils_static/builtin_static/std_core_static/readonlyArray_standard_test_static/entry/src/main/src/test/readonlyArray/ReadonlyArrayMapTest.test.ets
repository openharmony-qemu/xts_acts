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

class Item012 {
  x: int = 0;
  constructor(x: int) {
    this.x = x;
  }
}

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayMapGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayMapTest(): void {
  describe('ReadonlyArrayMapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0010
     * @tc.name testReadonlyArrayMap001
     * @tc.desc Verify ReadonlyArray.map behavior: passing callbackfn callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<int>((value: int, index: int, array: ReadonlyArray<int>): int => {
        return value * 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0020
     * @tc.name testReadonlyArrayMap002
     * @tc.desc Verify ReadonlyArray.map behavior: normal value - value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.map<int>((value: int): int => {
        return value + 5;
      });
      expect(result[0]).assertEqual(15);
      expect(result[1]).assertEqual(25);
      expect(result[2]).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0030
     * @tc.name testReadonlyArrayMap003
     * @tc.desc Verify ReadonlyArray.map behavior: normal value - value index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.map<int>((value: int, index: int): int => {
        return value + index;
      });
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0040
     * @tc.name testReadonlyArrayMap004
     * @tc.desc Verify ReadonlyArray.map behavior: normal value - parameter value, index, array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<int>((value: int, index: int, array: ReadonlyArray<int>): int => {
        return value + index + array[0];
      });
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0050
     * @tc.name testReadonlyArrayMap005
     * @tc.desc Verify ReadonlyArray.map behavior: callback parameter verify - value is before element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [100, 200, 300];
      const collected: Array<int> = [];
      values.map<int>((value: int): int => {
        collected.push(value);
        return value;
      });
      expect(collected[0]).assertEqual(100);
      expect(collected[1]).assertEqual(200);
      expect(collected[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0060
     * @tc.name testReadonlyArrayMap006
     * @tc.desc Verify ReadonlyArray.map behavior: boundary value - callbackfn returns same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<int>((value: int): int => {
        return value;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0070
     * @tc.name testReadonlyArrayMap007
     * @tc.desc Verify ReadonlyArray.map behavior: boundary value - callbackfn returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<int>((): int => {
        return 42;
      });
      expect(result[0]).assertEqual(42);
      expect(result[1]).assertEqual(42);
      expect(result[2]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0080
     * @tc.name testReadonlyArrayMap008
     * @tc.desc Verify ReadonlyArray.map behavior: U and T same type int int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<int>((value: int): int => {
        return value * 10;
      });
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0090
     * @tc.name testReadonlyArrayMap009
     * @tc.desc Verify ReadonlyArray.map behavior: U and T different type int string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<string>((value: int): string => {
        return value.toString();
      });
      expect(result[0]).assertEqual("1");
      expect(result[1]).assertEqual("2");
      expect(result[2]).assertEqual("3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0100
     * @tc.name testReadonlyArrayMap010
     * @tc.desc Verify ReadonlyArray.map behavior: U is object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<Item012>((value: int): Item012 => {
        return new Item012(value);
      });
      expect(result[0].x).assertEqual(1);
      expect(result[1].x).assertEqual(2);
      expect(result[2].x).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0110
     * @tc.name testReadonlyArrayMap011
     * @tc.desc Verify ReadonlyArray.map behavior: - element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.map<int>((value: int): int => {
        return value * 2;
      });
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0120
     * @tc.name testReadonlyArrayMap012
     * @tc.desc Verify ReadonlyArray.map behavior: element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.map<int>((value: int): int => {
        return value + 1;
      });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0130
     * @tc.name testReadonlyArrayMap013
     * @tc.desc Verify ReadonlyArray.map behavior: type int string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.map<string>((value: int): string => {
        return "val:" + value.toString();
      });
      expect(result[0]).assertEqual("val:10");
      expect(result[1]).assertEqual("val:20");
      expect(result[2]).assertEqual("val:30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0140
     * @tc.name testReadonlyArrayMap014
     * @tc.desc Verify ReadonlyArray.map behavior: order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 3, 1, 4, 2];
      const result = values.map<int>((value: int): int => {
        return value * 10;
      });
      expect(result[0]).assertEqual(50);
      expect(result[1]).assertEqual(30);
      expect(result[2]).assertEqual(10);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0150
     * @tc.name testReadonlyArrayMap015
     * @tc.desc Verify ReadonlyArray.map behavior: different generic type - string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "b", "c"];
      const result = values.map<string>((value: string): string => {
        return value.toUpperCase();
      });
      expect(result[0]).assertEqual("A");
      expect(result[1]).assertEqual("B");
      expect(result[2]).assertEqual("C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0160
     * @tc.name testReadonlyArrayMap016
     * @tc.desc Verify ReadonlyArray.map behavior: returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<int>((): int => {
        return 0;
      });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0170
     * @tc.name testReadonlyArrayMap017
     * @tc.desc Verify ReadonlyArray.map behavior: returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<int>((value: int): int => {
        return -value;
      });
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(-2);
      expect(result[2]).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0180
     * @tc.name testReadonlyArrayMap018
     * @tc.desc Verify ReadonlyArray.map behavior: index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0, 0, 0, 0, 0];
      const result = values.map<int>((value: int, index: int): int => {
        return index;
      });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(3);
      expect(result[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0190
     * @tc.name testReadonlyArrayMap019
     * @tc.desc Verify ReadonlyArray.map behavior: return value type is Array <U >
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result: Array<int> = values.map<int>((value: int): int => {
        return value * 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0200
     * @tc.name testReadonlyArrayMap020
     * @tc.desc Verify ReadonlyArray.map behavior: original array type T and returns type U different when verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.map<string>((value: int): string => {
        return "item" + value.toString();
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("item1");
      expect(result[1]).assertEqual("item2");
      expect(result[2]).assertEqual("item3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0210
     * @tc.name testReadonlyArrayMap021
     * @tc.desc Verify ReadonlyArray.map behavior: large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const values: ReadonlyArray<int> = arr;
      const result = values.map<int>((value: int): int => {
        return value + 1;
      });
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(1);
      expect(result[999]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0220
     * @tc.name testReadonlyArrayMap022
     * @tc.desc Verify ReadonlyArray.map behavior: ReadonlyArray <boolean> map boolean is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.map<int>((value: boolean): int => {
        return value ? 1 : 0;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0230
     * @tc.name testReadonlyArrayMap023
     * @tc.desc Verify ReadonlyArray.map behavior: map int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.map<int>((value: int): int => {
        return value + 1;
      });
      expect(result[0]).assertEqual(0x10 + 1);
      expect(result[1]).assertEqual(0o10 + 1);
      expect(result[2]).assertEqual(0b10 + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0240
     * @tc.name testReadonlyArrayMap024
     * @tc.desc Verify ReadonlyArray.map behavior: map Unicode string is length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["a", cn, "hello"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0250
     * @tc.name testReadonlyArrayMap025
     * @tc.desc Verify ReadonlyArray.map behavior: map empty empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const arr: ReadonlyArray<string> = ["", " ", zwsp];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0260
     * @tc.name testReadonlyArrayMap026
     * @tc.desc Verify ReadonlyArray.map behavior: map double element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [0.0, 1.0e6, -888.88];
      const result = arr.map<double>((value: double): double => {
        return value * 2.0;
      });
      expect(result[0]).assertEqual(0.0);
      expect(result[1]).assertEqual(2.0e6);
      expect(result[2]).assertEqual(-1777.76);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0270
     * @tc.name testReadonlyArrayMap027
     * @tc.desc Verify ReadonlyArray.map behavior: map <int - >string> returns string type new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const result = values.map<string>((value: int): string => {
        return value.toString();
      });
      expect(result[0]).assertEqual("1");
      expect(result[1]).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0280
     * @tc.name testReadonlyArrayMap028
     * @tc.desc Verify ReadonlyArray.map behavior: map byte is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte];
      const result = arr.map<int>((value: byte): int => {
        return value + 1;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(11);
      expect(result[1]).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0290
     * @tc.name testReadonlyArrayMap029
     * @tc.desc Verify ReadonlyArray.map behavior: map string is length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0300
     * @tc.name testReadonlyArrayMap030
     * @tc.desc Verify ReadonlyArray.map behavior: map element string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["only"];
      const result = arr.map<string>((value: string): string => {
        return value + "!";
      });
      expect(result[0]).assertEqual("only!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0310
     * @tc.name testReadonlyArrayMap031
     * @tc.desc Verify ReadonlyArray.map behavior: float MIN_VALUE map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.MIN_VALUE), 2.0f];
      const result = arr.map<int>((value: float): int => {
        return value < 1.0f ? 0 : 1;
      });
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0320
     * @tc.name testReadonlyArrayMap032
     * @tc.desc Verify ReadonlyArray.map behavior: double negative infinity map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NEGATIVE_INFINITY, 2.2];
      const result = arr.map<int>((value: double): int => {
        return value < 0.0 ? -1 : 1;
      });
      expect(result[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0330
     * @tc.name testReadonlyArrayMap033
     * @tc.desc Verify ReadonlyArray.map behavior: double MIN_VALUE map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.MIN_VALUE, 5.0];
      const result = arr.map<int>((value: double): int => {
        return value < 1.0 ? 0 : 1;
      });
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0340
     * @tc.name testReadonlyArrayMap034
     * @tc.desc Verify ReadonlyArray.map behavior: string replacement character map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rep: string = "\uFFFD";
      const arr: ReadonlyArray<string> = [rep, "abc"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0350
     * @tc.name testReadonlyArrayMap035
     * @tc.desc Verify ReadonlyArray.map behavior: string carriage return and line feed map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const crlf: string = "\r\n";
      const arr: ReadonlyArray<string> = [crlf];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0360
     * @tc.name testReadonlyArrayMap036
     * @tc.desc Verify ReadonlyArray.map behavior: string carriage return map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cr: string = "\r";
      const arr: ReadonlyArray<string> = [cr, "ab"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0370
     * @tc.name testReadonlyArrayMap037
     * @tc.desc Verify ReadonlyArray.map behavior: string BOM map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bom: string = "\uFEFF";
      const arr: ReadonlyArray<string> = [bom, "t"];
      const result = arr.map<string>((value: string): string => {
        return value + "x";
      });
      expect(result[0]).assertEqual(bom + "x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0380
     * @tc.name testReadonlyArrayMap038
     * @tc.desc Verify ReadonlyArray.map behavior: string mojibake map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const garbled: string = "æµè¯";
      const arr: ReadonlyArray<string> = [garbled];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(garbled.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0390
     * @tc.name testReadonlyArrayMap039
     * @tc.desc Verify ReadonlyArray.map behavior: short boundary map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 32767 as short];
      const result = arr.map<short>((value: short): short => {
        return value;
      });
      expect(result[0]).assertEqual(-32768 as short);
      expect(result[1]).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0400
     * @tc.name testReadonlyArrayMap040
     * @tc.desc Verify ReadonlyArray.map behavior: long boundary map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, 0];
      const result = arr.map<long>((value: long): long => {
        return value;
      });
      expect(result[0]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0410
     * @tc.name testReadonlyArrayMap041
     * @tc.desc Verify ReadonlyArray.map behavior: char maximum map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a'];
      const result = arr.map<char>((value: char): char => {
        return value;
      });
      expect(result[0]).assertEqual(c'\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0420
     * @tc.name testReadonlyArrayMap042
     * @tc.desc Verify ReadonlyArray.map behavior: adjacent map next item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.map<int>((value: int, index: int, array: ReadonlyArray<int>): int => {
        return index < array.length - 1 ? array[index + 1] : value;
      });
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0430
     * @tc.name testReadonlyArrayMap043
     * @tc.desc Verify ReadonlyArray.map behavior: adjacent map previous item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.map<int>((value: int, index: int, array: ReadonlyArray<int>): int => {
        return index > 0 ? array[index - 1] + value : value;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0440
     * @tc.name testReadonlyArrayMap044
     * @tc.desc Verify ReadonlyArray.map behavior: 1000 elements map identity mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.map<int>((value: int): int => {
        return value;
      });
      expect(result.length).assertEqual(1000);
      expect(result[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0450
     * @tc.name testReadonlyArrayMap045
     * @tc.desc Verify ReadonlyArray.map behavior: 1000 elements map doubled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.map<int>((value: int): int => {
        return value * 2;
      });
      expect(result[500]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0460
     * @tc.name testReadonlyArrayMap046
     * @tc.desc Verify ReadonlyArray.map behavior: float positive infinity map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY)];
      const result = arr.map<int>((value: float): int => {
        return value > 0.0f ? 1 : 0;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0470
     * @tc.name testReadonlyArrayMap047
     * @tc.desc Verify ReadonlyArray.map behavior: int boundary map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, -2147483648];
      const result = arr.map<int>((value: int): int => {
        return value;
      });
      expect(result[0]).assertEqual(2147483647);
      expect(result[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0480
     * @tc.name testReadonlyArrayMap048
     * @tc.desc Verify ReadonlyArray.map behavior: boolean map negation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.map<boolean>((value: boolean): boolean => {
        return !value;
      });
      expect(result[0]).assertFalse();
      expect(result[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0490
     * @tc.name testReadonlyArrayMap049
     * @tc.desc Verify ReadonlyArray.map behavior: map byte to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte];
      const result = arr.map<int>((value: byte): int => {
        return value;
      });
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0500
     * @tc.name testReadonlyArrayMap050
     * @tc.desc Verify ReadonlyArray.map behavior: map short to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 200 as short];
      const result = arr.map<int>((value: short): int => {
        return value;
      });
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0510
     * @tc.name testReadonlyArrayMap051
     * @tc.desc Verify ReadonlyArray.map behavior: continuation phone number - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "13800138000";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0520
     * @tc.name testReadonlyArrayMap052
     * @tc.desc Verify ReadonlyArray.map behavior: continuation email - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "test@example.com";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0530
     * @tc.name testReadonlyArrayMap053
     * @tc.desc Verify ReadonlyArray.map behavior: continuation hexadecimal string - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "0x123";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0540
     * @tc.name testReadonlyArrayMap054
     * @tc.desc Verify ReadonlyArray.map behavior: continuation zero width space - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\u200B";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0550
     * @tc.name testReadonlyArrayMap055
     * @tc.desc Verify ReadonlyArray.map behavior: continuation newline - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\n";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0560
     * @tc.name testReadonlyArrayMap056
     * @tc.desc Verify ReadonlyArray.map behavior: continuation mixed script Test extended case - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "Test 測試";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0570
     * @tc.name testReadonlyArrayMap057
     * @tc.desc Verify ReadonlyArray.map behavior: continuation fullwidth dash - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "—";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0580
     * @tc.name testReadonlyArrayMap058
     * @tc.desc Verify ReadonlyArray.map behavior: continuation 0b1010 extended case - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "0b1010";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0590
     * @tc.name testReadonlyArrayMap059
     * @tc.desc Verify ReadonlyArray.map behavior: continuation extended case count extended case - map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "123.45e6";
      const arr: ReadonlyArray<string> = [target];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0600
     * @tc.name testReadonlyArrayMap060
     * @tc.desc Verify ReadonlyArray.map behavior: continuation double positive infinity map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY, 1.0];
      const result = arr.map<int>((value: double): int => {
        return value > 0.0 ? 1 : 0;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0610
     * @tc.name testReadonlyArrayMap061
     * @tc.desc Verify ReadonlyArray.map behavior: continuation char null character map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'b'];
      const result = arr.map<char>((value: char): char => {
        return value;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c'\u0000');
      expect(result[1]).assertEqual(c'b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0620
     * @tc.name testReadonlyArrayMap062
     * @tc.desc Verify ReadonlyArray.map behavior: continuation int repeated elements map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 7, 7];
      const result = arr.map<int>((value: int): int => {
        return value * 10;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(70);
      expect(result[1]).assertEqual(70);
      expect(result[2]).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0630
     * @tc.name testReadonlyArrayMap063
     * @tc.desc Verify ReadonlyArray.map behavior: continuation 100 elements map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 1; i <= 100; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.map<int>((value: int): int => {
        return value + 1;
      });
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(2);
      expect(result[99]).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0640
     * @tc.name testReadonlyArrayMap064
     * @tc.desc Verify ReadonlyArray.map behavior: continuation index parameter map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.map<int>((value: int, index: int): int => {
        return value + index;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0650
     * @tc.name testReadonlyArrayMap065
     * @tc.desc Verify ReadonlyArray.map behavior: continuation phone number - map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "13800138000";
      const arr: ReadonlyArray<string> = [target, "z"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0660
     * @tc.name testReadonlyArrayMap066
     * @tc.desc Verify ReadonlyArray.map behavior: continuation email - map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "test@example.com";
      const arr: ReadonlyArray<string> = [target, "z"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0670
     * @tc.name testReadonlyArrayMap067
     * @tc.desc Verify ReadonlyArray.map behavior: continuation hexadecimal string - map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "0x123";
      const arr: ReadonlyArray<string> = [target, "z"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0680
     * @tc.name testReadonlyArrayMap068
     * @tc.desc Verify ReadonlyArray.map behavior: continuation zero width space - map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\u200B";
      const arr: ReadonlyArray<string> = [target, "z"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0690
     * @tc.name testReadonlyArrayMap069
     * @tc.desc Verify ReadonlyArray.map behavior: continuation newline - map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: string = "\n";
      const arr: ReadonlyArray<string> = [target, "z"];
      const result = arr.map<int>((value: string): int => {
        return value.length;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0700
     * @tc.name testReadonlyArrayMap070
     * @tc.desc Verify ReadonlyArray.map behavior: continuation double positive infinity map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.POSITIVE_INFINITY];
      const result = arr.map<int>((value: double): int => {
        return value > 0.0 ? 1 : 0;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0710
     * @tc.name testReadonlyArrayMap071
     * @tc.desc Verify ReadonlyArray.map behavior: continuation char null character map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000'];
      const result = arr.map<char>((value: char): char => {
        return value;
      });
      expect(result[0]).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0720
     * @tc.name testReadonlyArrayMap072
     * @tc.desc Verify ReadonlyArray.map behavior: continuation int repeated map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2, 2, 3];
      const result = arr.map<int>((value: int): int => {
        return value * 10;
      });
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0730
     * @tc.name testReadonlyArrayMap073
     * @tc.desc Verify ReadonlyArray.map behavior: continuation 100 elements map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.map<int>((value: int): int => {
        return value + 1;
      });
      expect(result[99]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0740
     * @tc.name testReadonlyArrayMap074
     * @tc.desc Verify ReadonlyArray.map behavior: continuation index parameter map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.map<int>((value: int, index: int): int => {
        return value + index;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0750
     * @tc.name testReadonlyArrayMap075
     * @tc.desc Verify ReadonlyArray.map behavior: empty array map returns empty Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.map<int>((value: int): int => {
        return value * 2;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0760
     * @tc.name testReadonlyArrayMap076
     * @tc.desc Verify ReadonlyArray.map behavior: callback array parameter is original reference and map does not mutate source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const originalLength = values.length;
      let sameRef = false;
      const result = values.map<int>((value: int, index: int, array: ReadonlyArray<int>): int => {
        if (index === 0) {
          sameRef = array === values;
        }
        return value * 2;
      });
      expect(sameRef).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(values.length).assertEqual(originalLength);
      expect(values[0]).assertEqual(1);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0770
     * @tc.name testReadonlyArrayMap077
     * @tc.desc Verify ReadonlyArray.map behavior: error path - callback Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.map((_value: int, index: int): boolean => {
          if (index === 1) { throw new Error("predicate error"); }
          return true;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0780
     * @tc.name testReadonlyArrayMap078
     * @tc.desc Verify ReadonlyArray.map behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.map((value: int): int => value + 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0790
     * @tc.name testReadonlyArrayMap079
     * @tc.desc Verify ReadonlyArray.map behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.map<int>((value: int): int => value * 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(40);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0800
     * @tc.name testReadonlyArrayMap080
     * @tc.desc Verify ReadonlyArray.map behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      arr.map((_value: int): boolean => { count++; return true; });
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0810
     * @tc.name testReadonlyArrayMap081
     * @tc.desc Verify ReadonlyArray.map behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.map<int>((value: int): int => value + 1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0820
     * @tc.name testReadonlyArrayMap082
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.map<int>((value: int): int => value + 1);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0830
     * @tc.name testReadonlyArrayMap083
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.map<int>((value: string): int => value.length);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0840
     * @tc.name testReadonlyArrayMap084
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.map<int>((value: string): int => value.length);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0850
     * @tc.name testReadonlyArrayMap085
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.map<int>((value: boolean): int => value ? 1 : 0);
      expect(arr.length).assertEqual(2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0860
     * @tc.name testReadonlyArrayMap086
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.map<int>((value: double): int => 1);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0870
     * @tc.name testReadonlyArrayMap087
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.map<int>((value: ComboObjarr): int => value.id);
      expect(arr.length).assertEqual(2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0880
     * @tc.name testReadonlyArrayMap088
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.map<Array<int>>((value: Array<int>): Array<int> => value);
      expect(result.length).assertEqual(arr.length);
      expect(result[0] === arr[0]).assertTrue();
      expect(result[1] === arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0890
     * @tc.name testReadonlyArrayMap089
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.map<int>((value: int): int => value);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0900
     * @tc.name testReadonlyArrayMap090
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.map<string>((value: string): string => value);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0910
     * @tc.name testReadonlyArrayMap091
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.map<string>((value: string): string => value);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertEqual("\u4e2d\u6587");
      expect(result[1]).assertEqual("\uD83D\uDE00");
      expect(result[2]).assertEqual("long-text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0920
     * @tc.name testReadonlyArrayMap092
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.map<boolean>((value: boolean): boolean => value);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0930
     * @tc.name testReadonlyArrayMap093
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.map<double>((value: double): double => value);
      expect(result.length).assertEqual(arr.length);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(0.0);
      expect(result[2]).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0940
     * @tc.name testReadonlyArrayMap094
     * @tc.desc Verify ReadonlyArray.map behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayMapGeneratedItem = new ReadonlyArrayMapGeneratedItem(1);
      const obj2: ReadonlyArrayMapGeneratedItem = new ReadonlyArrayMapGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayMapGeneratedItem> = [obj1, obj2];
      const result = arr.map<ReadonlyArrayMapGeneratedItem>((value: ReadonlyArrayMapGeneratedItem): ReadonlyArrayMapGeneratedItem => value);
      expect(result.length).assertEqual(arr.length);
      expect(result[0] === obj1).assertTrue();
      expect(result[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0950
     * @tc.name testReadonlyArrayMap095
     * @tc.desc Verify ReadonlyArray.map behavior: returned Array is a new reference distinct from source ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result: Array<int> = values.map<int>((value: int): int => value);
      expect((result as Object) !== (values as Object)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0960
     * @tc.name testReadonlyArrayMap096
     * @tc.desc Verify ReadonlyArray.map behavior: callback invoked exactly length times for non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      let callCount: int = 0;
      values.map<int>((value: int): int => {
        callCount++;
        return value;
      });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0970
     * @tc.name testReadonlyArrayMap097
     * @tc.desc Verify ReadonlyArray.map behavior: callback NOT invoked when source is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: ReadonlyArray<int> = [];
      let callCount: int = 0;
      const result = empty.map<int>((value: int): int => {
        callCount++;
        return value;
      });
      expect(callCount).assertEqual(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0980
     * @tc.name testReadonlyArrayMap098
     * @tc.desc Verify ReadonlyArray.map behavior: mutating returned Array does not affect source ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result: Array<int> = values.map<int>((value: int): int => value);
      result.push(99);
      result[0] = 777;
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[2]).assertEqual(3);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_0990
     * @tc.name testReadonlyArrayMap099
     * @tc.desc Verify ReadonlyArray.map behavior: chained map call on returned Array produces correct cascaded result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const first: Array<int> = values.map<int>((value: int): int => value + 1);
      const second: Array<int> = first.map<int>((value: int): int => value * 10);
      expect(second.length).assertEqual(3);
      expect(second[0]).assertEqual(20);
      expect(second[1]).assertEqual(30);
      expect(second[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_1000
     * @tc.name testReadonlyArrayMap100
     * @tc.desc Verify ReadonlyArray.map behavior: two successive calls produce equal results without hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const r1: Array<int> = values.map<int>((value: int): int => value * 5);
      const r2: Array<int> = values.map<int>((value: int): int => value * 5);
      expect(r1.length).assertEqual(r2.length);
      expect(r1[0]).assertEqual(r2[0]);
      expect(r1[1]).assertEqual(r2[1]);
      expect(r1[2]).assertEqual(r2[2]);
      expect((r1 as Object) !== (r2 as Object)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_1010
     * @tc.name testReadonlyArrayMap101
     * @tc.desc Verify ReadonlyArray.map behavior: large array mapped with type change int to string preserves correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { source.push(i); }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result: Array<string> = arr.map<string>((value: int): string => value.toString());
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual("0");
      expect(result[500]).assertEqual("500");
      expect(result[999]).assertEqual("999");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_1020
     * @tc.name testReadonlyArrayMap102
     * @tc.desc Verify ReadonlyArray.map behavior: callback throwing Error preserves the original error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let caught: boolean = false;
      let msg: string = "";
      try {
        arr.map<int>((value: int): int => {
          throw new Error("boom-map");
        });
        expect().assertFail();
      } catch (e) {
        caught = true;
        msg = (e as Error).message;
      }
      expect(caught).assertTrue();
      expect(msg).assertEqual("boom-map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_1030
     * @tc.name testReadonlyArrayMap103
     * @tc.desc Verify ReadonlyArray.map behavior: index sequence collected via callback yields 0..length-1 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [9, 8, 7, 6];
      const indices: Array<int> = [];
      values.map<int>((value: int, index: int): int => {
        indices.push(index);
        return value;
      });
      expect(indices.length).assertEqual(4);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_1040
     * @tc.name testReadonlyArrayMap104
     * @tc.desc Verify ReadonlyArray.map behavior: callback throwing on first element stops further processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let visited: int = 0;
      let caught: boolean = false;
      try {
        arr.map<int>((value: int): int => {
          visited++;
          if (value === 1) { throw new Error("stop"); }
          return value;
        });
        expect().assertFail();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(visited).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_1050
     * @tc.name testReadonlyArrayMap105
     * @tc.desc Verify ReadonlyArray.map behavior: returned Array on empty source is still a fresh distinct reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: ReadonlyArray<int> = [];
      const result: Array<int> = empty.map<int>((value: int): int => value);
      expect((result as Object) !== (empty as Object)).assertTrue();
      expect(result.length).assertEqual(0);
      result.push(7);
      expect(empty.length).assertEqual(0);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_MAP_1060
     * @tc.name testReadonlyArrayMap106
     * @tc.desc Verify ReadonlyArray.map behavior: returned Array supports standard Array APIs such as push and indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayMap106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result: Array<int> = values.map<int>((value: int): int => value * 100);
      result.push(999);
      expect(result.length).assertEqual(4);
      expect(result.indexOf(200)).assertEqual(1);
      expect(result.indexOf(999)).assertEqual(3);
      expect(result.indexOf(42)).assertEqual(-1);
    });

  });
}
