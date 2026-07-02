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

interface Item008 {
  value: number;
  index: number;
}

class Item026 {
  value: number = 0;
  doubled: number = 0;

  constructor(v: number, d: number) {
    this.value = v;
    this.doubled = d;
  }
}

interface Result039 {
  original: number;
  squared: number;
  cubed: number;
}

class FromMapObjA {
  label: string = '';
}

function isValueNaN(value: number): boolean {
  return value !== value;
}

function createSequentialArray(size: int): Array<number> {
  let source = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    source.pushOne(i);
  }
  return source;
}

function createGeneratedNumberIterable() {
  let source = new Array<number>(1, 2, 3);
  return source.values();
}

export default function ArrayFrom3Test(): void {
  describe('ArrayFrom3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0100
     * @tc.name testArrayFromThree001
     * @tc.desc Verify Array from requires iterable and map function parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, number>(source, (v: number): number => v * 2);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0200
     * @tc.name testArrayFromThree002
     * @tc.desc Verify Array from maps values from an array like object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number>(0, 0, 0);
      arrayLike[0] = 1;
      arrayLike[1] = 2;
      arrayLike[2] = 3;
      let arr = Array.from<number, number>(arrayLike, (v: number): number => v * 10);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0300
     * @tc.name testArrayFromThree003
     * @tc.desc Verify Array from maps values from a set iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 3, 4, 5]);
      let arr = Array.from<number, number>(set, (v: number): number => v * v);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(9);
      expect(arr[4]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0400
     * @tc.name testArrayFromThree004
     * @tc.desc Verify Array from maps values from a string iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str = 'abc';
      let arr = Array.from<string, string>(str, (c: string): string => c.toUpperCase());
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('A');
      expect(arr[2]).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0500
     * @tc.name testArrayFromThree005
     * @tc.desc Verify Array from supports a standard mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, string>(
        source,
        (v: number, k: int): string => 'Index:' + k + ', Value:' + v
      );
      expect(arr[0]).assertEqual('Index:0, Value:1');
      expect(arr[1]).assertEqual('Index:1, Value:2');
      expect(arr[2]).assertEqual('Index:2, Value:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0600
     * @tc.name testArrayFromThree006
     * @tc.desc Verify Array from maps numbers to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, string>(source, (v: number): string => v.toString());
      expect(arr[0]).assertEqual('1');
      expect(arr[2]).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0700
     * @tc.name testArrayFromThree007
     * @tc.desc Verify Array from maps numbers to booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(0, 1, 2);
      let arr = Array.from<number, boolean>(source, (v: number): boolean => v > 0);
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertTrue();
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0800
     * @tc.name testArrayFromThree008
     * @tc.desc Verify Array from maps numbers to objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(10, 20, 30);
      let arr = Array.from<number, Item008>(source, (v: number, k: int): Item008 => {
        return {
          value: v,
          index: k
        };
      });
      expect(arr[0].value).assertEqual(10);
      expect(arr[0].index).assertEqual(0);
      expect(arr[2].value).assertEqual(30);
      expect(arr[2].index).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_0900
     * @tc.name testArrayFromThree009
     * @tc.desc Verify Array from supports conditional mapping logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3, 4, 5);
      let arr = Array.from<number, number>(source, (v: number): number => {
        if (v % 2 === 0) {
          return v * 2;
        }
        return v;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(8);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1000
     * @tc.name testArrayFromThree010
     * @tc.desc Verify Array from supports cumulative mapping calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3, 4, 5);
      let sum = 0;
      let arr = Array.from<number, number>(source, (v: number): number => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1100
     * @tc.name testArrayFromThree011
     * @tc.desc Verify Array from passes the index into the mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<string>('a', 'b', 'c');
      let arr = Array.from<string, string>(
        source,
        (v: string, k: int): string => k + ':' + v
      );
      expect(arr[0]).assertEqual('0:a');
      expect(arr[1]).assertEqual('1:b');
      expect(arr[2]).assertEqual('2:c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1200
     * @tc.name testArrayFromThree012
     * @tc.desc Verify Array from maps zero values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(0, 1, 0);
      let arr = Array.from<number, string>(source, (v: number): string => {
        return v === 0 ? 'zero' : 'non-zero';
      });
      expect(arr[0]).assertEqual('zero');
      expect(arr[1]).assertEqual('non-zero');
      expect(arr[2]).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1300
     * @tc.name testArrayFromThree013
     * @tc.desc Verify Array from maps negative values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(-1, -2, -3);
      let arr = Array.from<number, number>(source, (v: number): number => Math.abs(v));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1400
     * @tc.name testArrayFromThree014
     * @tc.desc Verify Array from maps maximum and minimum values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(Number.MAX_VALUE, Number.MIN_VALUE);
      let arr = Array.from<number, string>(source, (v: number): string => v.toString());
      expect(arr[0]).assertEqual(Number.MAX_VALUE.toString());
      expect(arr[1]).assertEqual(Number.MIN_VALUE.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1500
     * @tc.name testArrayFromThree015
     * @tc.desc Verify Array from maps null values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number | null>(1, null, 3);
      let arr = Array.from<number | null, string>(source, (v: number | null): string => {
        return v === null ? 'NULL' : v.toString();
      });
      expect(arr[0]).assertEqual('1');
      expect(arr[1]).assertEqual('NULL');
      expect(arr[2]).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1600
     * @tc.name testArrayFromThree016
     * @tc.desc Verify Array from maps undefined values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number | undefined>(1, undefined, 3);
      let arr = Array.from<number | undefined, string>(
        source,
        (v: number | undefined): string => {
          return v === undefined ? 'UNDEFINED' : v.toString();
        }
      );
      expect(arr[1]).assertEqual('UNDEFINED');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1700
     * @tc.name testArrayFromThree017
     * @tc.desc Verify Array from maps NaN values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, Double.NaN, 3);
      let arr = Array.from<number, string>(source, (v: number): string => {
        return isValueNaN(v) ? 'NaN' : v.toString();
      });
      expect(arr[0]).assertEqual('1');
      expect(arr[1]).assertEqual('NaN');
      expect(arr[2]).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1800
     * @tc.name testArrayFromThree018
     * @tc.desc Verify Array from maps infinity values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, Double.POSITIVE_INFINITY, -Double.POSITIVE_INFINITY);
      let arr = Array.from<number, string>(source, (v: number): string => {
        if (v === Double.POSITIVE_INFINITY) {
          return 'Inf';
        }
        if (v === -Double.POSITIVE_INFINITY) {
          return '-Inf';
        }
        return v.toString();
      });
      expect(arr[0]).assertEqual('1');
      expect(arr[1]).assertEqual('Inf');
      expect(arr[2]).assertEqual('-Inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_1900
     * @tc.name testArrayFromThree019
     * @tc.desc Verify Array from propagates mapping function exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      let caught = false;
      try {
        Array.from<number, number>(source, (v: number): number => {
          visited.push(v);
          if (v === 2) {
            throw new Error('Test error');
          }
          return v * 2;
        });
      } catch (e) {
        caught = e.name === 'Error' && e.message === 'Test error';
      }
      expect(caught).assertTrue();
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2000
     * @tc.name testArrayFromThree020
     * @tc.desc Verify Array from passes the source value to the mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(10, 20, 30);
      let values = new Array<number>();
      Array.from<number, number>(source, (v: number): number => {
        values.push(v);
        return v * 2;
      });
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2100
     * @tc.name testArrayFromThree021
     * @tc.desc Verify Array from passes the source index to the mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<string>('a', 'b', 'c');
      let indices = new Array<number>();
      Array.from<string, string>(source, (v: string, k: int): string => {
        indices.push(k);
        return v;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2200
     * @tc.name testArrayFromThree022
     * @tc.desc Verify Array from starts indexes at zero and increments them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3, 4, 5);
      let arr = Array.from<number, number>(source, (v: number, k: int): number => k);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2300
     * @tc.name testArrayFromThree023
     * @tc.desc Verify Array from supports number return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, number>(source, (v: number): number => v + 10);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2400
     * @tc.name testArrayFromThree024
     * @tc.desc Verify Array from supports string return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, string>(source, (v: number): string => 'value:' + v);
      expect(arr[0]).assertEqual('value:1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2500
     * @tc.name testArrayFromThree025
     * @tc.desc Verify Array from supports boolean return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(0, 5, 10);
      let arr = Array.from<number, boolean>(source, (v: number): boolean => v >= 5);
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertTrue();
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2600
     * @tc.name testArrayFromThree026
     * @tc.desc Verify Array from supports object return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, Item026>(
        source,
        (v: number): Item026 => new Item026(v, v * 2)
      );
      expect(arr[0].value).assertEqual(1);
      expect(arr[0].doubled).assertEqual(2);
      expect(arr[2].value).assertEqual(3);
      expect(arr[2].doubled).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2700
     * @tc.name testArrayFromThree027
     * @tc.desc Verify Array from returns a new array with mapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, number>(source, (v: number): number => v * 2);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2800
     * @tc.name testArrayFromThree028
     * @tc.desc Verify Array from returns an array of the target generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, string>(source, (v: number): string => v.toString());
      expect(arr[0]).assertEqual('1');
      expect(typeof arr[0]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_2900
     * @tc.name testArrayFromThree029
     * @tc.desc Verify Array from does not modify the source object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, number>(source, (v: number): number => v * 2);
      expect(source[0]).assertEqual(1);
      expect(source[1]).assertEqual(2);
      expect(source[2]).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3000
     * @tc.name testArrayFromThree030
     * @tc.desc Verify Array from can be called as a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, number>(source, (v: number): number => v * 10);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3100
     * @tc.name testArrayFromThree031
     * @tc.desc Verify Array from supports two generic type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberSource = new Array<number>(1, 2, 3);
      let numberResult = Array.from<number, number>(
        numberSource,
        (v: number): number => v * 2
      );
      let stringSource = new Array<string>('a', 'b', 'c');
      let stringResult = Array.from<string, number>(
        stringSource,
        (v: string): number => v.length
      );
      expect(numberResult[1]).assertEqual(4);
      expect(stringResult[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3200
     * @tc.name testArrayFromThree032
     * @tc.desc Verify Array from preserves set deduplication before mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 2, 3, 3, 3]);
      let arr = Array.from<number, number>(set, (v: number): number => v * v);
      expect(arr.length).assertEqual(3);
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(4)).assertTrue();
      expect(arr.includes(9)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3300
     * @tc.name testArrayFromThree033
     * @tc.desc Verify Array from maps values from map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, number>([
        ['a', 1],
        ['b', 2],
        ['c', 3]
      ]);
      let arr = Array.from<[string, number], string>(
        map.entries(),
        (entry: [string, number]): string => entry[0] + ':' + entry[1]
      );
      expect(arr.length).assertEqual(3);
      expect(arr.includes('a:1')).assertTrue();
      expect(arr.includes('c:3')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3400
     * @tc.name testArrayFromThree034
     * @tc.desc Verify Array from maps string characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str = 'hello';
      let arr = Array.from<string, string>(str, (c: string): string => c.toUpperCase());
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual('H');
      expect(arr[4]).assertEqual('O');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3500
     * @tc.name testArrayFromThree035
     * @tc.desc Verify Array from maps values from a generator source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.from<number, number>(
        createGeneratedNumberIterable(),
        (v: number): number => v * 10
      );
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3600
     * @tc.name testArrayFromThree036
     * @tc.desc Verify Array from maps values from array like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number>(0, 0, 0);
      arrayLike[0] = 1;
      arrayLike[1] = 2;
      arrayLike[2] = 3;
      let arr = Array.from<number, number>(arrayLike, (v: number): number => v * v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3700
     * @tc.name testArrayFromThree037
     * @tc.desc Verify Array from can transform both type and value together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3, 4, 5);
      let arr = Array.from<number, string>(source, (v: number): string => 'Number ' + v);
      expect(arr[0]).assertEqual('Number 1');
      expect(arr[4]).assertEqual('Number 5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3800
     * @tc.name testArrayFromThree038
     * @tc.desc Verify Array from can emulate filtering through mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3, 4, 5);
      let arr = Array.from<number, number | null>(source, (v: number): number | null => {
        if (v % 2 === 0) {
          return v;
        }
        return null;
      });
      expect(arr.length).assertEqual(5);
      expect(arr[0] === null).assertTrue();
      expect(arr[1]).assertEqual(2);
      expect(arr[2] === null).assertTrue();
      expect(arr[3]).assertEqual(4);
      expect(arr[4] === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_3900
     * @tc.name testArrayFromThree039
     * @tc.desc Verify Array from can create objects with computed properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, Result039>(source, (v: number): Result039 => {
        return {
          original: v,
          squared: v * v,
          cubed: v * v * v
        };
      });
      expect(arr[0].original).assertEqual(1);
      expect(arr[0].squared).assertEqual(1);
      expect(arr[0].cubed).assertEqual(1);
      expect(arr[2].original).assertEqual(3);
      expect(arr[2].squared).assertEqual(9);
      expect(arr[2].cubed).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4000
     * @tc.name testArrayFromThree040
     * @tc.desc Verify Array from can flatten nested values through mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested = new Array<Array<number>>(
        new Array<number>(1, 2),
        new Array<number>(3, 4),
        new Array<number>(5, 6)
      );
      let arr = Array.from<Array<number>, number>(nested, (inner: Array<number>): number => {
        return inner[0] + inner[1];
      });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(7);
      expect(arr[2]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4100
     * @tc.name testArrayFromThree041
     * @tc.desc Verify Array from handles large scale mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = createSequentialArray(100);
      let arr = Array.from<number, number>(source, (v: number): number => v * 2);
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(198);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4200
     * @tc.name testArrayFromThree042
     * @tc.desc Verify Array from supports complex calculations in the mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3, 4, 5);
      let arr = Array.from<number, number>(source, (v: number): number => {
        let result = 0;
        for (let i: int = 0; i <= v; i++) {
          result += i;
        }
        return result;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(6);
      expect(arr[4]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4300
     * @tc.name testArrayFromThree043
     * @tc.desc Verify Array from reports mapping function errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3, 4);
      let visited = new Array<number>();
      let caught = false;
      try {
        Array.from<number, number>(source, (v: number): number => {
          visited.push(v);
          if (v > 2) {
            throw new Error('Value too large');
          }
          return v;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4400
     * @tc.name testArrayFromThree044
     * @tc.desc Verify Array.from supports explicit source and result type parameters with valid mapping callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr1 = Array.from<number, number>(source, (v: number): number => v * 2);
      let arr2 = Array.from<number, string>(source, (v: number): string => v.toString());
      expect(arr1[0]).assertEqual(2);
      expect(arr2[0]).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4500
     * @tc.name testArrayFromThree045
     * @tc.desc Verify Array from with map function matches Array map behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr1 = Array.from<number, number>(source, (v: number): number => v * 2);
      let arr2 = source.map((v: number): number => v * 2);
      expect(arr1.length).assertEqual(arr2.length);
      for (let i: int = 0; i < arr1.length; i++) {
        expect(arr1[i]).assertEqual(arr2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4600
     * @tc.name testArrayFromThree046
     * @tc.desc Verify Array from without and with map function produce different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr1 = Array.from<number>(source);
      let arr2 = Array.from<number, number>(source, (v: number): number => v * 2);
      expect(arr1.length).assertEqual(arr2.length);
      expect(arr1[0]).assertEqual(1);
      expect(arr2[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4700
     * @tc.name testArrayFromThree047
     * @tc.desc Verify Array from provides continuous indexes from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(10, 20, 30, 40, 50);
      let indices = new Array<number>();
      Array.from<number, number>(source, (v: number, k: int): number => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4800
     * @tc.name testArrayFromThree048
     * @tc.desc Verify Array from keeps set deduplication when mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 2, 3, 3, 3, 4]);
      let arr = Array.from<number, number>(set, (v: number): number => v * v);
      expect(arr.length).assertEqual(4);
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(4)).assertTrue();
      expect(arr.includes(9)).assertTrue();
      expect(arr.includes(16)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_4900
     * @tc.name testArrayFromThree049
     * @tc.desc Verify Array from mapping functions can capture outer variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let multiplier = 10;
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, number>(
        source,
        (v: number): number => v * multiplier
      );
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5000
     * @tc.name testArrayFromThree050
     * @tc.desc Verify Array from maps all elements synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callOrder = 0;
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number, number>(source, (v: number): number => {
        let currentOrder = callOrder++;
        expect(currentOrder < 3).assertTrue();
        return v * 10;
      });
      expect(arr.length).assertEqual(3);
      expect(callOrder).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5100
     * @tc.name testArrayFromThree051
     * @tc.desc Verify Array.from with map can transform the numeric triple 0, 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(0, 1, 2);
      const arr = Array.from<number, number>(source, (value: number): number => value + 1);
      expect(arr.toString()).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5200
     * @tc.name testArrayFromThree052
     * @tc.desc Verify Array.from with mapper can convert numbers to strings by prefixing text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        Array.from<number, string>(new Array<number>(1, 2, 3), (value: number): string => 'n' + value.toString());
      expect(result.toString()).assertEqual('n1,n2,n3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5300
     * @tc.name testArrayFromThree053
     * @tc.desc Verify Array.from with mapper can convert numbers to booleans by parity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        Array.from<number, boolean>(new Array<number>(1, 2, 3, 4), (value: number): boolean => value % 2 === 0);
      expect(result.toString()).assertEqual('false,true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5400
     * @tc.name testArrayFromThree054
     * @tc.desc Verify Array.from with mapper can expose the index for cumulative formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, string>(new Array<number>(5, 6, 7),
        (value: number, index: int): string => index.toString() + ':' + value.toString());
      expect(result.toString()).assertEqual('0:5,1:6,2:7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5500
     * @tc.name testArrayFromThree055
     * @tc.desc Verify Array.from with mapper can map negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, number>(new Array<number>(-3, 0, 5), (value: number): number => value * 2);
      expect(result.toString()).assertEqual('-6,0,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5600
     * @tc.name testArrayFromThree056
     * @tc.desc Verify Array.from with mapper can map duplicate values consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        Array.from<number, number>(new Array<number>(2, 2, 2), (value: number, index: int): number => value + index);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5700
     * @tc.name testArrayFromThree057
     * @tc.desc Verify Array.from with mapper can map values from a Set iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(3);
      set.add(1);
      set.add(2);
      const result = Array.from<number, number>(set, (value: number): number => value * 10);
      expect(result.toString()).assertEqual('30,10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5800
     * @tc.name testArrayFromThree058
     * @tc.desc Verify Array.from with mapper can map characters from a string iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<string, string>('ark', (value: string, index: int): string => value + index.toString());
      expect(result.toString()).assertEqual('a0,r1,k2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_5900
     * @tc.name testArrayFromThree059
     * @tc.desc Verify Array.from with mapper can map values from a Map key iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('left', 1);
      map.set('right', 2);
      const result = Array.from<string, string>(map.keys(), (value: string): string => value.toUpperCase());
      expect(result.toString()).assertEqual('LEFT,RIGHT');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6000
     * @tc.name testArrayFromThree060
     * @tc.desc Verify Array.from with mapper can map values from a filtered array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value >= 3);
      const result = Array.from<number, number>(source, (value: number): number => value - 1);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6100
     * @tc.name testArrayFromThree061
     * @tc.desc Verify Array.from with mapper can map values from a sliced array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4, 5).slice(1, 4);
      const result = Array.from<number, string>(source, (value: number): string => 'v' + value.toString());
      expect(result.toString()).assertEqual('v2,v3,v4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6200
     * @tc.name testArrayFromThree062
     * @tc.desc Verify Array.from with mapper can map values from a concatenated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      const result = Array.from<number, number>(source, (value: number): number => value + 5);
      expect(result.toString()).assertEqual('6,7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6300
     * @tc.name testArrayFromThree063
     * @tc.desc Verify Array.from with mapper can map values after reverse reordered the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      source.reverse();
      const result = Array.from<number, number>(source, (value: number, index: int): number => value + index);
      expect(result.toString()).assertEqual('3,3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6400
     * @tc.name testArrayFromThree064
     * @tc.desc Verify Array.from with mapper can map values after sort reordered the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(3, 1, 2);
      source.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = Array.from<number, number>(source, (value: number, index: int): number => value * (index + 1));
      expect(result.toString()).assertEqual('1,4,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6500
     * @tc.name testArrayFromThree065
     * @tc.desc Verify Array.from with mapper can map values after shift removed the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      source.shift();
      const result = Array.from<number, string>(source, (value: number): string => value.toString() + '!');
      expect(result.toString()).assertEqual('2!,3!,4!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6600
     * @tc.name testArrayFromThree066
     * @tc.desc Verify Array.from with mapper can map values after pop removed the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      source.pop();
      const result = Array.from<number, number>(source, (value: number): number => value * value);
      expect(result.toString()).assertEqual('1,4,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6700
     * @tc.name testArrayFromThree067
     * @tc.desc Verify Array.from with mapper can map values after shrinkTo truncated the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      source.shrinkTo(2);
      const result = Array.from<number, number>(source, (value: number): number => value + 10);
      expect(result.toString()).assertEqual('11,12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6800
     * @tc.name testArrayFromThree068
     * @tc.desc Verify Array.from with mapper can map values from a rebuilt array after length reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      source.length = 0;
      source.pushOne(7);
      source.pushOne(8);
      const result = Array.from<number, number>(source, (value: number): number => value - 1);
      expect(result.toString()).assertEqual('6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_6900
     * @tc.name testArrayFromThree069
     * @tc.desc Verify Array.from with mapper can map values from Array.of output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Array.of<number>(4, 5, 6);
      const result = Array.from<number, string>(source, (value: number): string => '[' + value.toString() + ']');
      expect(result.toString()).assertEqual('[4],[5],[6]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7000
     * @tc.name testArrayFromThree070
     * @tc.desc Verify Array.from with mapper can map values from Array.from output again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Array.from<number>(new Array<number>(2, 4, 6));
      const result = Array.from<number, number>(source, (value: number, index: int): number => value + index);
      expect(result.toString()).assertEqual('2,5,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7100
     * @tc.name testArrayFromThree071
     * @tc.desc Verify Array.from with mapper can create object records from numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, FromMapObjA>(new Array<number>(1, 2), (value: number): FromMapObjA => {
        const item = new FromMapObjA();
        item.label = 'v' + value.toString();
        return item;
      });
      expect(result[0].label).assertEqual('v1');
      expect(result[1].label).assertEqual('v2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7200
     * @tc.name testArrayFromThree072
     * @tc.desc Verify Array.from with mapper can keep NaN identifiable after mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, number>(Array.create<number>(1, NaN), (value: number): number => value);
      expect(result.length).assertEqual(1);
      expect(result[0] !== result[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7300
     * @tc.name testArrayFromThree073
     * @tc.desc Verify Array.from with mapper can keep Infinity identifiable after mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        Array.from<number, number>(new Array<number>(Infinity, -Infinity), (value: number): number => value);
      expect(result.toString()).assertEqual('Infinity,-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7400
     * @tc.name testArrayFromThree074
     * @tc.desc Verify Array.from with mapper can transform Unicode strings from an iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        Array.from<string, string>('😀🌍b', (value: string, index: int): string => index.toString() + ':' + value);
      expect(result.toString()).assertEqual('0:😀,1:🌍,2:b');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7500
     * @tc.name testArrayFromThree075
     * @tc.desc Verify Array.from with mapper can transform empty strings in an array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<string, string>(new Array<string>('head', ''), (value: string): string => value + '!');
      expect(result.toString()).assertEqual('head!,!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7600
     * @tc.name testArrayFromThree076
     * @tc.desc Verify Array.from with mapper preserves zero-width space content in an array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<string, string>(new Array<string>('\u200B', 'x'), (value: string): string => value);
      expect(result[0].charCodeAt(0)).assertEqual(0x200B);
      expect(result[1]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7700
     * @tc.name testArrayFromThree077
     * @tc.desc Verify Array.from with mapper can transform values from a toReversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3).toReversed();
      const result = Array.from<number, number>(source, (value: number): number => value * 2);
      expect(result.toString()).assertEqual('6,4,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7800
     * @tc.name testArrayFromThree078
     * @tc.desc Verify Array.from with mapper can transform values from a toSorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(3, 1, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = Array.from<number, string>(source, (value: number): string => 's' + value.toString());
      expect(result.toString()).assertEqual('s1,s2,s3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_7900
     * @tc.name testArrayFromThree079
     * @tc.desc Verify Array.from with mapper can transform values from a with copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3).with(1, 9);
      const result = Array.from<number, number>(source, (value: number): number => value - 1);
      expect(result.toString()).assertEqual('0,8,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8000
     * @tc.name testArrayFromThree080
     * @tc.desc Verify Array.from with mapper can transform values from a toSpliced copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4).toSpliced(1, 2);
      const result = Array.from<number, number>(source, (value: number, index: int): number => value + index);
      expect(result.toString()).assertEqual('1,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8100
     * @tc.name testArrayFromThree081
     * @tc.desc Verify Array.from with mapper can process a long generated range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>();
      for (let i: int = 0; i < 6; i++) {
        source.pushOne(i);
      }
      const result = Array.from<number, number>(source, (value: number): number => value * 3);
      expect(result.toString()).assertEqual('0,3,6,9,12,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8200
     * @tc.name testArrayFromThree082
     * @tc.desc Verify Array.from with mapper can preserve source immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(4, 5, 6);
      const before = source.toString();
      const result = Array.from<number, number>(source, (value: number): number => value + 1);
      expect(result.toString()).assertEqual('5,6,7');
      expect(source.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8300
     * @tc.name testArrayFromThree083
     * @tc.desc Verify Array.from with mapper can compute cumulative text using the index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, string>(new Array<number>(9, 8, 7),
        (value: number, index: int): string => (value + index).toString());
      expect(result.toString()).assertEqual('9,9,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8400
     * @tc.name testArrayFromThree084
     * @tc.desc Verify Array.from with mapper can map a Set of booleans into strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      set.add(true);
      set.add(false);
      const result = Array.from<boolean, string>(set, (value: boolean): string => value ? 'T' : 'F');
      expect(result.toString()).assertEqual('T,F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8500
     * @tc.name testArrayFromThree085
     * @tc.desc Verify Array.from with mapper can map a Set of bigint values into numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<bigint>();
      set.add(2n);
      set.add(4n);
      const result = Array.from<bigint, string>(set, (value: bigint): string => value.toString());
      expect(result.toString()).assertEqual('2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8600
     * @tc.name testArrayFromThree086
     * @tc.desc Verify Array.from with mapper can map values into negative outputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, number>(new Array<number>(1, 2, 3), (value: number): number => -value);
      expect(result.toString()).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8700
     * @tc.name testArrayFromThree087
     * @tc.desc Verify Array.from with mapper can map values into a constant output shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, string>(new Array<number>(1, 2, 3), (_value: number): string => 'x');
      expect(result.toString()).assertEqual('x,x,x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8800
     * @tc.name testArrayFromThree088
     * @tc.desc Verify Array.from with mapper can map an empty array into an empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, number>(new Array<number>(), (value: number): number => value + 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_8900
     * @tc.name testArrayFromThree089
     * @tc.desc Verify Array.from with mapper can map a single-element array into a single result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, number>(Array.create<number>(1, 9), (value: number): number => value * 2);
      expect(result.toString()).assertEqual('18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_9000
     * @tc.name testArrayFromThree090
     * @tc.desc Verify Array.from with mapper can map iterable values into signed deltas using the index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>(new Array<number>(10, 20, 40));
      const result = Array.from<number, number>(source, (value: number, index: int): number => value - index * 5);
      expect(result.toString()).assertEqual('10,15,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_9100
     * @tc.name testArrayFromThree091
     * @tc.desc Verify Array.from with mapper can produce nested string labels from repeated numeric input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(2, 2, 2);
      const result = Array.from<number, string>(source,
        (value: number, index: int): string => 'slot' + index.toString() + ':' + value.toString());
      expect(result.toString()).assertEqual('slot0:2,slot1:2,slot2:2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_9200
     * @tc.name testArrayFromThree092
     * @tc.desc Verify Array.from with mapper can transform values from a Uint8Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array([1, 2, 3]);
      const result = Array.from<number, number>(source, (value: number): number => value * 10);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_9300
     * @tc.name testArrayFromThree093
     * @tc.desc Verify Array.from with mapper can expose indexes for emoji string iterables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        Array.from<string, string>('a🌍b', (value: string, index: int): string => index.toString() + ':' + value
        );
      expect(result.toString()).assertEqual('0:a,1:🌍,2:b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_9400
     * @tc.name testArrayFromThree094
     * @tc.desc Verify Array.from with mapper can create nested Array.from results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<number, Array<number>>(
        new Array<number>(1, 2),
        (_value: number): Array<number> => Array.from<number>(new Array<number>(1, 2))
      );
      expect(result.length).assertEqual(2);
      expect(result[0].toString()).assertEqual('1,2');
      expect(result[1].toString()).assertEqual('1,2');
      expect(result[0] === result[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_9500
     * @tc.name testArrayFromThree095
     * @tc.desc Verify Array.from with mapper can count typed-array iterations while returning source indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const source = new Uint8Array([4, 5, 6]);
      const result = Array.from<number, number>(source, (_value: number, index: int): number => {
        count += 1;
        return index;
      });
      expect(count).assertEqual(3);
      expect(result.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_THREE_9600
     * @tc.name testArrayFromThree096
     * @tc.desc Verify Array.from with mapper can create a simple even-number range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromThree096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(5, (_index: int): number => 0);
      const result = Array.from<number, number>(source, (_value: number, index: int): number => index * 2);
      expect(result.toString()).assertEqual('0,2,4,6,8');
    });

  });
}

