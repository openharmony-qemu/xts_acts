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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface Item014 {
  value: number;
  index: number;
  isPositive: boolean;
}

interface Point029 {
  x: number;
  y: number;
}

interface Result033 {
  original: number;
  squared: number;
  cubed: number;
}

class FromFixedObjA {
  label: string = '';
}

function createIntFixedArray(size: int): FixedArray<int> {
  let source = new FixedArray<int>(size, 0);
  for (let i: int = 0; i < size; i++) {
    source[i] = i;
  }
  return source;
}

function createIntFixedArrayFromValues(values: Array<int>): FixedArray<int> {
  let source = new FixedArray<int>(values.length, 0);
  for (let i: int = 0; i < values.length; i++) {
    source[i] = values[i];
  }
  return source;
}

function createCharFixedArrayFromValues(values: Array<char>): FixedArray<char> {
  let source = new FixedArray<char>(values.length, c'\0');
  for (let i: int = 0; i < values.length; i++) {
    source[i] = values[i];
  }
  return source;
}

function charToCode(value: char): number {
  let text = value.toString();
  return text.charCodeAt(0);
}

export default function ArrayFrom4Test(): void {
  describe('ArrayFrom4Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0100
     * @tc.name testArrayFromFour001
     * @tc.desc Verify Array from requires values and map function parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<int> = [10, 20, 30];
      let arr = Array.from<int, int>(sourceArray, (v: int, i: int): int => v + i);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(21);
      expect(arr[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0200
     * @tc.name testArrayFromFour002
     * @tc.desc Verify Array from maps values from a standard fixed array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<int> = [1, 2, 3];
      let arr = Array.from<int, int>(sourceArray, (v: int): int => v * 2);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0300
     * @tc.name testArrayFromFour003
     * @tc.desc Verify Array from supports empty fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<int> = [];
      let arr = Array.from<int, int>(sourceArray, (v: int): int => v * 2);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0400
     * @tc.name testArrayFromFour004
     * @tc.desc Verify Array from supports single element fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<int> = [42];
      let arr = Array.from<int, int>(sourceArray, (v: int): int => v + 10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(52);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0500
     * @tc.name testArrayFromFour005
     * @tc.desc Verify Array from supports large fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(100);
      let arr = Array.from<int, int>(sourceArray, (v: int): int => v * 10);
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[50]).assertEqual(500);
      expect(arr[99]).assertEqual(990);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0600
     * @tc.name testArrayFromFour006
     * @tc.desc Verify Array from maps fixed arrays containing zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(0, 1, 0));
      let arr = Array.from<int, string>(sourceArray, (v: int): string => {
        return v === 0 ? 'zero' : 'non-zero';
      });
      expect(arr[0]).assertEqual('zero');
      expect(arr[1]).assertEqual('non-zero');
      expect(arr[2]).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0700
     * @tc.name testArrayFromFour007
     * @tc.desc Verify Array from maps fixed arrays containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(-100, 0, 100));
      let arr = Array.from<int, int>(sourceArray, (v: int): int => Math.abs(v));
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0800
     * @tc.name testArrayFromFour008
     * @tc.desc Verify Array from maps maximum and minimum int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<int> = [2147483647, -2147483648];
      let arr = Array.from<int, string>(sourceArray, (v: int): string => v.toString());
      expect(arr[0]).assertEqual('2147483647');
      expect(arr[1]).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_0900
     * @tc.name testArrayFromFour009
     * @tc.desc Verify Array from maps fixed arrays containing special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createCharFixedArrayFromValues(new Array<char>(c'A', c'B', c'C'));
      let arr = Array.from<char, string>(sourceArray, (c: char): string => c.toString());
      expect(arr[0]).assertEqual('A');
      expect(arr[2]).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1000
     * @tc.name testArrayFromFour010
     * @tc.desc Verify Array from maps fixed arrays containing escaped characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createCharFixedArrayFromValues(
        new Array<char>(c'\n', c'\t', c'\x7F')
      );
      let arr = Array.from<char, number>(sourceArray, (c: char): number => charToCode(c));
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(9);
      expect(arr[2]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1100
     * @tc.name testArrayFromFour011
     * @tc.desc Verify Array from supports a standard mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(10, 20, 30));
      let arr = Array.from<int, string>(
        sourceArray,
        (v: int, k: int): string => 'Index:' + k + ', Value:' + v
      );
      expect(arr[0]).assertEqual('Index:0, Value:10');
      expect(arr[2]).assertEqual('Index:2, Value:30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1200
     * @tc.name testArrayFromFour012
     * @tc.desc Verify Array from maps ints to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int, string>(sourceArray, (v: int): string => v.toString());
      expect(arr[0]).assertEqual('1');
      expect(arr[1]).assertEqual('2');
      expect(arr[2]).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1300
     * @tc.name testArrayFromFour013
     * @tc.desc Verify Array from maps ints to booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(0, 5, -3));
      let arr = Array.from<int, boolean>(sourceArray, (v: int): boolean => v !== 0);
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertTrue();
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1400
     * @tc.name testArrayFromFour014
     * @tc.desc Verify Array from maps ints to object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, -2, 3));
      let arr = Array.from<int, Item014>(sourceArray, (v: int, k: int): Item014 => {
        return {
          value: v,
          index: k,
          isPositive: v > 0
        };
      });
      expect(arr[0].value).assertEqual(1);
      expect(arr[0].isPositive).assertTrue();
      expect(arr[1].value).assertEqual(-2);
      expect(arr[1].isPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1500
     * @tc.name testArrayFromFour015
     * @tc.desc Verify Array from supports conditional mapping logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3, 4, 5));
      let arr = Array.from<int, string>(sourceArray, (v: int): string => {
        if (v % 2 === 0) {
          return 'even:' + v;
        }
        return 'odd:' + v;
      });
      expect(arr[0]).assertEqual('odd:1');
      expect(arr[1]).assertEqual('even:2');
      expect(arr[4]).assertEqual('odd:5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1600
     * @tc.name testArrayFromFour016
     * @tc.desc Verify Array from supports cumulative mapping calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3, 4, 5));
      let sum = 0;
      let arr = Array.from<int, int>(sourceArray, (v: int): int => {
        sum += v;
        return sum;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(6);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1700
     * @tc.name testArrayFromFour017
     * @tc.desc Verify Array from can use source indexes in calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(5);
      let arr = Array.from<int, int>(sourceArray, (v: int, k: int): int => v * k);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(9);
      expect(arr[4]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1800
     * @tc.name testArrayFromFour018
     * @tc.desc Verify Array from maps zero values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(0, 0, 1));
      let arr = Array.from<int, string>(sourceArray, (v: int): string => {
        return v === 0 ? 'zero' : 'non-zero';
      });
      expect(arr[0]).assertEqual('zero');
      expect(arr[1]).assertEqual('zero');
      expect(arr[2]).assertEqual('non-zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_1900
     * @tc.name testArrayFromFour019
     * @tc.desc Verify Array from propagates mapping function exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let visited = new Array<number>();
      let caught = false;
      try {
        Array.from<int, int>(sourceArray, (v: int): int => {
          visited.push(v);
          if (v === 2) {
            throw new Error('Test error at value 2');
          }
          return v * 2;
        });
      } catch (e) {
        caught = e.name === 'Error' && e.message === 'Test error at value 2';
      }
      expect(caught).assertTrue();
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2000
     * @tc.name testArrayFromFour020
     * @tc.desc Verify Array from passes source values into the mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(10, 20, 30));
      let values = new Array<number>();
      Array.from<int, int>(sourceArray, (v: int): int => {
        values.push(v);
        return v * 2;
      });
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2100
     * @tc.name testArrayFromFour021
     * @tc.desc Verify Array from passes indexes into the mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let indices = new Array<number>();
      let arr = Array.from<int, int>(sourceArray, (v: int, k: int): int => {
        indices.push(k);
        return k;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2200
     * @tc.name testArrayFromFour022
     * @tc.desc Verify Array from starts indexes at zero and increments them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(5);
      let arr = Array.from<int, number>(sourceArray, (v: int, k: int): number => k);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2300
     * @tc.name testArrayFromFour023
     * @tc.desc Verify Array from returns a new array with mapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int, number>(sourceArray, (v: int): number => v * 2);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2400
     * @tc.name testArrayFromFour024
     * @tc.desc Verify Array from returns arrays of the target generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int, string>(sourceArray, (v: int): string => 'value:' + v);
      expect(arr[0]).assertEqual('value:1');
      expect(typeof arr[0]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2500
     * @tc.name testArrayFromFour025
     * @tc.desc Verify Array from does not modify the original fixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int, number>(sourceArray, (v: int): number => v * 10);
      expect(sourceArray[0]).assertEqual(1);
      expect(sourceArray[1]).assertEqual(2);
      expect(sourceArray[2]).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2600
     * @tc.name testArrayFromFour026
     * @tc.desc Verify Array from can be called as a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int, int>(sourceArray, (v: int): int => v * 2);
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2700
     * @tc.name testArrayFromFour027
     * @tc.desc Verify Array from supports two generic type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let charArray = createCharFixedArrayFromValues(new Array<char>(c'A', c'B', c'C'));
      let intResult = Array.from<int, string>(intArray, (v: int): string => v.toString());
      let charResult = Array.from<char, string>(charArray, (c: char): string => c.toString());
      expect(intResult[0]).assertEqual('1');
      expect(charResult[0]).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2800
     * @tc.name testArrayFromFour028
     * @tc.desc Verify Array from maps int fixed arrays into transformed numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3, 4, 5));
      let arr = Array.from<int, number>(sourceArray, (v: int): number => v * v);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(9);
      expect(arr[4]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_2900
     * @tc.name testArrayFromFour029
     * @tc.desc Verify Array from maps char fixed arrays into strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createCharFixedArrayFromValues(
        new Array<char>(c'H', c'e', c'l', c'l', c'o')
      );
      let arr = Array.from<char, string>(sourceArray, (c: char): string => c.toString());
      let str = arr.join('');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual('H');
      expect(arr[4]).assertEqual('o');
      expect(str).assertEqual('Hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3000
     * @tc.name testArrayFromFour030
     * @tc.desc Verify Array from maps complex fixed array element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<Point029> = [{ x: 1, y: 2 }, { x: 3, y: 4 }];
      let arr = Array.from<Point029, number>(sourceArray, (p: Point029): number => p.x + p.y);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3100
     * @tc.name testArrayFromFour031
     * @tc.desc Verify Array from converts fixed arrays into mutable arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(5);
      let arr = Array.from<int, int>(sourceArray, (v: int): int => v);
      expect(sourceArray.length).assertEqual(5);
      expect(arr.length).assertEqual(5);
      arr.pushOne(100);
      expect(arr.length).assertEqual(6);
      expect(arr[5]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3200
     * @tc.name testArrayFromFour032
     * @tc.desc Verify Array from can transform both types and values together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int, string>(sourceArray, (v: int): string => {
        return 'Number ' + v + ' squared is ' + v * v;
      });
      expect(arr[0]).assertEqual('Number 1 squared is 1');
      expect(arr[1]).assertEqual('Number 2 squared is 4');
      expect(arr[2]).assertEqual('Number 3 squared is 9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3300
     * @tc.name testArrayFromFour033
     * @tc.desc Verify Array from supports complex calculation mappings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(5);
      let arr = Array.from<int, Result033>(sourceArray, (v: int): Result033 => {
        return {
          original: v,
          squared: v * v,
          cubed: v * v * v
        };
      });
      expect(arr[0].original).assertEqual(0);
      expect(arr[0].squared).assertEqual(0);
      expect(arr[0].cubed).assertEqual(0);
      expect(arr[3].original).assertEqual(3);
      expect(arr[3].squared).assertEqual(9);
      expect(arr[3].cubed).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3400
     * @tc.name testArrayFromFour034
     * @tc.desc Verify Array from handles large fixed array mappings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(10000);
      let arr = Array.from<int, number>(sourceArray, (v: int): number => v * 2);
      expect(arr.length).assertEqual(10000);
      expect(arr[0]).assertEqual(0);
      expect(arr[9999]).assertEqual(19998);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3500
     * @tc.name testArrayFromFour035
     * @tc.desc Verify Array from supports complex iterative calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(100);
      let arr = Array.from<int, number>(sourceArray, (v: int): number => {
        let result = 0;
        for (let i: int = 0; i <= v; i++) {
          result += i;
        }
        return result;
      });
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[10]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3600
     * @tc.name testArrayFromFour036
     * @tc.desc Verify Array from reports mapping function errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3, 4));
      let visited = new Array<number>();
      let caught = false;
      try {
        Array.from<int, number>(sourceArray, (v: int): number => {
          visited.push(v);
          if (v > 2) {
            throw new Error('Value too large');
          }
          return v * 2;
        });
      } catch (e) {
        caught = e.name === 'Error' && e.message === 'Value too large';
      }
      expect(caught).assertTrue();
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3700
     * @tc.name testArrayFromFour037
     * @tc.desc Verify Array.from converts fixed int arrays with explicit generic mapping result types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr1 = Array.from<int, number>(sourceArray, (v: int): number => v * 2);
      let arr2 = Array.from<int, string>(sourceArray, (v: int): string => v.toString());
      expect(arr1[0]).assertEqual(2);
      expect(arr2[0]).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3800
     * @tc.name testArrayFromFour038
     * @tc.desc Verify this overload handles fixed arrays specifically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixedArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr1 = Array.from<int, number>(fixedArray, (v: int): number => v * 2);
      let set = new Set<number>([1, 2, 3]);
      let arr2 = Array.from<number, number>(set, (v: number): number => v * 2);
      expect(Array.isArray(arr1)).assertTrue();
      expect(Array.isArray(arr2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_3900
     * @tc.name testArrayFromFour039
     * @tc.desc Verify different creation approaches can produce the same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr1 = Array.from<int, int>(sourceArray, (v: int): int => v * 2);
      let arr2 = new Array<int>();
      for (let i: int = 0; i < 3; i++) {
        arr2.pushOne(sourceArray[i] * 2);
      }
      for (let i: int = 0; i < 3; i++) {
        expect(arr1[i]).assertEqual(arr2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4000
     * @tc.name testArrayFromFour040
     * @tc.desc Verify Array from provides continuous indexes from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(10, 11, 12, 13, 14));
      let indices = new Array<number>();
      Array.from<int, number>(sourceArray, (v: int, k: int): number => {
        indices.push(k);
        return v;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[4]).assertEqual(4);
      for (let i: int = 0; i < indices.length - 1; i++) {
        expect(indices[i + 1] - indices[i]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4100
     * @tc.name testArrayFromFour041
     * @tc.desc Verify mapping functions can capture outer variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let multiplier = 10;
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int, number>(sourceArray, (v: int): number => v * multiplier);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4200
     * @tc.name testArrayFromFour042
     * @tc.desc Verify Array from executes mappings in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(10, 20, 30));
      let callOrder = 0;
      let results = new Array<number>();
      let arr = Array.from<int, number>(sourceArray, (v: int): number => {
        let order = callOrder++;
        results.push(order);
        return v;
      });
      expect(arr.length).assertEqual(3);
      expect(callOrder).assertEqual(3);
      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4300
     * @tc.name testArrayFromFour043
     * @tc.desc Verify Array.from with fixed-array map can transform 0, 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0, 1, 2];
      const arr = Array.from<int, int>(source, (value: int): int => value * 2);
      expect(arr.toString()).assertEqual('0,2,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4400
     * @tc.name testArrayFromFour044
     * @tc.desc Verify Array.from with fixed-array mapper can increment each int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int, int>(source, (value: int): int => value + 1);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4500
     * @tc.name testArrayFromFour045
     * @tc.desc Verify Array.from with fixed-array mapper can prefix string output with indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [4, 5, 6];
      const result = Array.from<int, string>(source, (value: int, index: int): string => index.toString() + ':' + value.toString());
      expect(result.toString()).assertEqual('0:4,1:5,2:6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4600
     * @tc.name testArrayFromFour046
     * @tc.desc Verify Array.from with fixed-array mapper can map negative and zero ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-3, 0, 5];
      const result = Array.from<int, int>(source, (value: int): int => value * 2);
      expect(result.toString()).assertEqual('-6,0,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4700
     * @tc.name testArrayFromFour047
     * @tc.desc Verify Array.from with fixed-array mapper can map duplicate ints consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [2, 2, 2];
      const result = Array.from<int, int>(source, (value: int, index: int): int => value + index);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4800
     * @tc.name testArrayFromFour048
     * @tc.desc Verify Array.from with fixed-array mapper can map char values into strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'A', c'B', c'C'];
      const result = Array.from<char, string>(source, (value: char): string => value.toString());
      expect(result.toString()).assertEqual('A,B,C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_4900
     * @tc.name testArrayFromFour049
     * @tc.desc Verify Array.from with fixed-array mapper can map boolean projections from ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3, 4];
      const result = Array.from<int, boolean>(source, (value: int): boolean => value % 2 === 0);
      expect(result.toString()).assertEqual('false,true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5000
     * @tc.name testArrayFromFour050
     * @tc.desc Verify Array.from with fixed-array mapper can map into object records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8];
      const result = Array.from<int, FromFixedObjA>(source, (value: int): FromFixedObjA => { const item = new FromFixedObjA(); item.label = 'label_' + value.toString(); return item; });
      expect(result[0].label).assertEqual('label_7');
      expect(result[1].label).assertEqual('label_8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5100
     * @tc.name testArrayFromFour051
     * @tc.desc Verify Array.from with fixed-array mapper can map a single-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [9];
      const result = Array.from<int, int>(source, (value: int): int => value * 2);
      expect(result.toString()).assertEqual('18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5200
     * @tc.name testArrayFromFour052
     * @tc.desc Verify Array.from with fixed-array mapper can map an empty fixed-array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [];
      const result = Array.from<int, int>(source, (value: int): int => value + 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5300
     * @tc.name testArrayFromFour053
     * @tc.desc Verify Array.from with fixed-array mapper can map large boundary ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0x7fffffff, -0x80000000];
      const result = Array.from<int, string>(source, (value: int): string => value.toString());
      expect(result.toString()).assertEqual('2147483647,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5400
     * @tc.name testArrayFromFour054
     * @tc.desc Verify Array.from with fixed-array mapper can map escaped chars into text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'\n', c'\t'];
      const result = Array.from<char, string>(source, (value: char): string => value.toString());
      expect(result.length).assertEqual(2);
      expect(result[0].charCodeAt(0)).assertEqual(10);
      expect(result[1].charCodeAt(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5500
     * @tc.name testArrayFromFour055
     * @tc.desc Verify Array.from with fixed-array mapper can map values after a fixed-array copy is rebuilt into Array.from again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [3, 6, 9];
      const first = Array.from<int, int>(source, (value: int): int => value + 1);
      const result = Array.from<int, int>(first, (value: int): int => value * 2);
      expect(result.toString()).assertEqual('8,14,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5600
     * @tc.name testArrayFromFour056
     * @tc.desc Verify Array.from with fixed-array mapper can map values into constant strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int, string>(source, (_value: int): string => 'x');
      expect(result.toString()).assertEqual('x,x,x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5700
     * @tc.name testArrayFromFour057
     * @tc.desc Verify Array.from with fixed-array mapper can map values into negative outputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int, int>(source, (value: int): int => -value);
      expect(result.toString()).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5800
     * @tc.name testArrayFromFour058
     * @tc.desc Verify Array.from with fixed-array mapper can map using the index to compute totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [9, 8, 7];
      const result = Array.from<int, int>(source, (value: int, index: int): int => value + index);
      expect(result.toString()).assertEqual('9,9,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_5900
     * @tc.name testArrayFromFour059
     * @tc.desc Verify Array.from with fixed-array mapper can preserve source immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [4, 5, 6];
      const result = Array.from<int, int>(source, (value: int): int => value + 1);
      expect(result.toString()).assertEqual('5,6,7');
      expect(source[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6000
     * @tc.name testArrayFromFour060
     * @tc.desc Verify Array.from with fixed-array mapper can map unicode-compatible chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'A', c'B'];
      const result = Array.from<char, string>(source, (value: char): string => value.toString());
      expect(result.toString()).assertEqual('A,B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6100
     * @tc.name testArrayFromFour061
     * @tc.desc Verify Array.from with fixed-array mapper can map repeated chars without collapsing them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'A', c'A', c'B'];
      const result = Array.from<char, string>(source, (value: char): string => value.toString());
      expect(result.toString()).assertEqual('A,A,B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6200
     * @tc.name testArrayFromFour062
     * @tc.desc Verify Array.from with fixed-array mapper can map a source containing zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0, 1, 0];
      const result = Array.from<int, int>(source, (value: int): int => value + 2);
      expect(result.toString()).assertEqual('2,3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6300
     * @tc.name testArrayFromFour063
     * @tc.desc Verify Array.from with fixed-array mapper can map a source containing descending ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [5, 4, 3, 2];
      const result = Array.from<int, int>(source, (value: int): int => value - 1);
      expect(result.toString()).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6400
     * @tc.name testArrayFromFour064
     * @tc.desc Verify Array.from with fixed-array mapper can map a source into boolean thresholds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 5, 9];
      const result = Array.from<int, boolean>(source, (value: int): boolean => value >= 5);
      expect(result.toString()).assertEqual('false,true,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6500
     * @tc.name testArrayFromFour065
     * @tc.desc Verify Array.from with fixed-array mapper can map a source into joined bracketed strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int, string>(source, (value: int): string => '[' + value.toString() + ']');
      expect(result.toString()).assertEqual('[1],[2],[3]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6600
     * @tc.name testArrayFromFour066
     * @tc.desc Verify Array.from with fixed-array mapper can map a source after Array.of comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8, 9];
      const result = Array.from<int, int>(source, (value: int): int => value);
      expect(result.toString()).assertEqual(Array.of<number>(7, 8, 9).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6700
     * @tc.name testArrayFromFour067
     * @tc.desc Verify Array.from with fixed-array mapper can map six generated ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0, 1, 2, 3, 4, 5];
      const result = Array.from<int, int>(source, (value: int): int => value * 3);
      expect(result.toString()).assertEqual('0,3,6,9,12,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6800
     * @tc.name testArrayFromFour068
     * @tc.desc Verify Array.from with fixed-array mapper can map odd and even classification text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3, 4];
      const result = Array.from<int, string>(source, (value: int): string => value % 2 === 0 ? 'E' : 'O');
      expect(result.toString()).assertEqual('O,E,O,E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_6900
     * @tc.name testArrayFromFour069
     * @tc.desc Verify Array.from with fixed-array mapper can map a prefix after manual fixed-array selection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [8, 9, 10, 11];
      const prefix: FixedArray<int> = [source[0], source[1], source[2]];
      const result = Array.from<int, int>(prefix, (value: int): int => value + 10);
      expect(result.toString()).assertEqual('18,19,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7000
     * @tc.name testArrayFromFour070
     * @tc.desc Verify Array.from with fixed-array mapper can map a fixed-array source into strings using both index and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [2, 4, 6];
      const result = Array.from<int, string>(source, (value: int, index: int): string => index.toString() + '-' + value.toString());
      expect(result.toString()).assertEqual('0-2,1-4,2-6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7100
     * @tc.name testArrayFromFour071
     * @tc.desc Verify Array.from with fixed-array mapper can map two repeated zeros into stable outputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0, 0];
      const result = Array.from<int, int>(source, (value: int, index: int): int => value + index);
      expect(result.toString()).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7200
     * @tc.name testArrayFromFour072
     * @tc.desc Verify Array.from with fixed-array mapper can map a source containing a tab char and a space char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'	', c' '];
      const result = Array.from<char, string>(source, (value: char): string => value.toString());
      expect(result.length).assertEqual(2);
      expect(result[0].charCodeAt(0)).assertEqual(9);
      expect(result[1].charCodeAt(0)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7300
     * @tc.name testArrayFromFour073
     * @tc.desc Verify Array.from with fixed-array mapper can map values into a checksum-friendly range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [2, 4, 6];
      const result = Array.from<int, int>(source, (value: int, index: int): int => value * (index + 1));
      expect(result.toString()).assertEqual('2,8,18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7400
     * @tc.name testArrayFromFour074
     * @tc.desc Verify Array.from with fixed-array mapper can map values after converting from a standard array into a fixed-array literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5);
      const source: FixedArray<int> = [arr[0].toInt(), arr[1].toInt(), arr[2].toInt()];
      const result = Array.from<int, int>(source, (value: int): int => value + 2);
      expect(result.toString()).assertEqual('5,6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7500
     * @tc.name testArrayFromFour075
     * @tc.desc Verify Array.from with fixed-array mapper can map three boundary-style small ints into text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-1, 0, 1];
      const result = Array.from<int, string>(source, (value: int): string => value.toString());
      expect(result.toString()).assertEqual('-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7600
     * @tc.name testArrayFromFour076
     * @tc.desc Verify Array.from with fixed-array mapper can map chars into lowercase normalization output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'A', c'B'];
      const result = Array.from<char, string>(source, (value: char): string => value.toString().toLowerCase());
      expect(result.toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7700
     * @tc.name testArrayFromFour077
     * @tc.desc Verify Array.from with fixed-array mapper can map a four-element source into offset sums
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3, 4];
      const result = Array.from<int, int>(source, (value: int, index: int): int => value + 10 + index);
      expect(result.toString()).assertEqual('11,13,15,17');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7800
     * @tc.name testArrayFromFour078
     * @tc.desc Verify Array.from with fixed-array mapper can map a source containing repeated max-ish values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1024, 1024, 512];
      const result = Array.from<int, int>(source, (value: int): int => value / 2);
      expect(result.toString()).assertEqual('512,512,256');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_7900
     * @tc.name testArrayFromFour079
     * @tc.desc Verify Array.from with fixed-array mapper can map a source into stable textual parity pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [5, 6];
      const result = Array.from<int, string>(source, (value: int): string => value.toString() + (value % 2 === 0 ? 'E' : 'O'));
      expect(result.toString()).assertEqual('5O,6E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_8000
     * @tc.name testArrayFromFour080
     * @tc.desc Verify Array.from with fixed-array mapper can map and preserve output length equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8, 9];
      const result = Array.from<int, int>(source, (value: int): int => value);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_8100
     * @tc.name testArrayFromFour081
     * @tc.desc Verify Array.from with fixed-array mapper can add descending offsets across three integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [9, 9, 9];
      const result = Array.from<int, int>(source, (value: int, index: int): int => value - index);
      expect(result.toString()).assertEqual('9,8,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_8200
     * @tc.name testArrayFromFour082
     * @tc.desc Verify Array.from with fixed-array mapper can emit stringified hexadecimal forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [10, 11, 12];
      const result = Array.from<int, string>(source, (value: int): string => value.toString(16));
      expect(result.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FOUR_8300
     * @tc.name testArrayFromFour083
     * @tc.desc Verify Array.from with fixed-array mapper can preserve zeros while injecting the index into later items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0, 0, 0, 0];
      const result = Array.from<int, int>(source, (value: int, index: int): int => value + index);
      expect(result.toString()).assertEqual('0,1,2,3');
    });

  });
}

