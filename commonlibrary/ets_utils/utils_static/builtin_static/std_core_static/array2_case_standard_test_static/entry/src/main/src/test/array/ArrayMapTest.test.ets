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

class Item020 {
  value: number = 0;
}

class Profile032 {
  value: number = 0;
  name: string = '';
}

class Metrics036 {
  original: number = 0;
  doubled: number = 0;
  squared: number = 0;
}

class User051 {
  id: number = 0;
  name: string = '';
}

class MapValue062 {
  value: number = 0;
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function mapNumberArrayFromAny(value: Any): string {
  const arr = value as Array<number>;
  return arr.map((item: number): number => item * 10).toString();
}

export default function ArrayMapTest(): void {
  describe('ArrayMapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0010
     * @tc.name testArrayMap001
     * @tc.desc Verify map accepts a required callback parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let callbackfn =
        (value: number, _index: int, _array: Array<number>): number => value * 2;
      let result = arr.map(callbackfn);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0020
     * @tc.name testArrayMap002
     * @tc.desc Verify map accepts a callback with value index and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let callbackfn:
        (value: number, index: int, array: Array<number>) => number =
        (v: number, _i: int, _a: Array<number>): number => v * 2;
      let result = arr.map(callbackfn);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0030
     * @tc.name testArrayMap003
     * @tc.desc Verify map applies a valid arrow callback to every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): number => v * 2);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0040
     * @tc.name testArrayMap004
     * @tc.desc Verify the callback receives the current element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): number => {
        expect(typeof v).assertEqual('number');
        return v * 2;
      });
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0050
     * @tc.name testArrayMap005
     * @tc.desc Verify the callback receives the current int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let result = arr.map((v: number, i: int): number => {
        expect(typeof i).assertEqual('int');
        return v + i;
      });
      expect(result.toString()).assertEqual('10,21,32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0060
     * @tc.name testArrayMap006
     * @tc.desc Verify the callback receives the original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number, _i: int, a: Array<number>): number => {
        expect(a === arr).assertTrue();
        return v * 2;
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0070
     * @tc.name testArrayMap007
     * @tc.desc Verify the callback parameter order is value index and array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((value: number, index: int, array: Array<number>): number => {
        expect(typeof value).assertEqual('number');
        expect(typeof index).assertEqual('int');
        expect(Array.isArray(array)).assertTrue();
        return value;
      });
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0080
     * @tc.name testArrayMap008
     * @tc.desc Verify map returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): number => v * 2);
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0090
     * @tc.name testArrayMap009
     * @tc.desc Verify map does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalStr = arr.toString();
      arr.map((v: number): number => v * 2);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0100
     * @tc.name testArrayMap010
     * @tc.desc Verify map returns transformed values in the new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let result = arr.map((v: number): number => v * 2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0110
     * @tc.name testArrayMap011
     * @tc.desc Verify map can return an array with a different element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): string => 'value:' + v.toString());
      expect(typeof result[0]).assertEqual('string');
      expect(result.toString()).assertEqual('value:1,value:2,value:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0120
     * @tc.name testArrayMap012
     * @tc.desc Verify map returns an empty array for an empty source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.map((v: number): number => v * 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0130
     * @tc.name testArrayMap013
     * @tc.desc Verify map works with a single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      let result = arr.map((v: number): number => v * 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(84);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0140
     * @tc.name testArrayMap014
     * @tc.desc Verify map handles large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeNumberArray(10000);
      let result = arr.map((v: number): number => v * 2);
      expect(result.length).assertEqual(10000);
      expect(result[0]).assertEqual(0);
      expect(result[9999]).assertEqual(19998);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0150
     * @tc.name testArrayMap015
     * @tc.desc Verify map can return undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((_: number): number | undefined => undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0160
     * @tc.name testArrayMap016
     * @tc.desc Verify map can return null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((_: number): null => null);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0170
     * @tc.name testArrayMap017
     * @tc.desc Verify map transforms number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0180
     * @tc.name testArrayMap018
     * @tc.desc Verify map transforms string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.map((s: string): string => s.toUpperCase());
      expect(result.toString()).assertEqual('A,B,C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0190
     * @tc.name testArrayMap019
     * @tc.desc Verify map transforms boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false, true);
      let result = arr.map((b: boolean): boolean => !b);
      expect(result.toString()).assertEqual('false,true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0200
     * @tc.name testArrayMap020
     * @tc.desc Verify map transforms object arrays into new objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item020();
      item1.value = 1;
      let item2 = new Item020();
      item2.value = 2;
      let arr = new Array<Item020>(item1, item2);
      let result = arr.map((item: Item020): Item020 => {
        let mapped = new Item020();
        mapped.value = item.value * 2;
        return mapped;
      });
      expect(result[0].value).assertEqual(2);
      expect(result[1].value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0210
     * @tc.name testArrayMap021
     * @tc.desc Verify map can convert number arrays into string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): string => 'val:' + v.toString());
      expect(result.toString()).assertEqual('val:1,val:2,val:3');
      expect(typeof result[0]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0220
     * @tc.name testArrayMap022
     * @tc.desc Verify map supports a named callback variable without function expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let callbackfn = (v: number): number => {
        return v * 2;
      };
      let result = arr.map(callbackfn);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0230
     * @tc.name testArrayMap023
     * @tc.desc Verify map callbacks can use the index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number, i: int): number => v + i);
      expect(result.toString()).assertEqual('1,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0240
     * @tc.name testArrayMap024
     * @tc.desc Verify map callbacks can use the array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number, _i: int, a: Array<number>): number => v + a.length);
      expect(result.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0250
     * @tc.name testArrayMap025
     * @tc.desc Verify map callbacks can contain branch logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.map((v: number): number => {
        if (v % 2 === 0) {
          return v * 2;
        }
        return v;
      });
      expect(result.toString()).assertEqual('1,4,3,8,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0260
     * @tc.name testArrayMap026
     * @tc.desc Verify the source array remains unchanged after map completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalLength = arr.length;
      let originalFirst = arr[0];
      arr.map((v: number): number => v * 2);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0270
     * @tc.name testArrayMap027
     * @tc.desc Verify the returned array is independent from the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): number => v * 2);
      result[0] = 999;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0280
     * @tc.name testArrayMap028
     * @tc.desc Verify each map call returns a distinct new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result1 = arr.map((v: number): number => v * 2);
      let result2 = arr.map((v: number): number => v * 2);
      expect(result1 !== result2).assertTrue();
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0290
     * @tc.name testArrayMap029
     * @tc.desc Verify mutating the source array in the callback does not extend current map traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number, i: int, a: Array<number>): number => {
        if (i === 0) {
          a.pushOne(999);
        }
        return v;
      });
      expect(result.length).assertEqual(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0300
     * @tc.name testArrayMap030
     * @tc.desc Verify map can be used for basic data conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): string => 'Number:' + v.toString());
      expect(result.toString()).assertEqual('Number:1,Number:2,Number:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0310
     * @tc.name testArrayMap031
     * @tc.desc Verify map supports repeated math transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let doubled = arr.map((v: number): number => v * 2);
      let squared = arr.map((v: number): number => v * v);
      expect(doubled.toString()).assertEqual('2,4,6,8,10');
      expect(squared.toString()).assertEqual('1,4,9,16,25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0320
     * @tc.name testArrayMap032
     * @tc.desc Verify map can extract multiple properties from object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Profile032();
      item1.value = 1;
      item1.name = 'one';
      let item2 = new Profile032();
      item2.value = 2;
      item2.name = 'two';
      let arr = new Array<Profile032>(item1, item2);
      let values = arr.map((item: Profile032): number => item.value);
      let names = arr.map((item: Profile032): string => item.name);
      expect(values.toString()).assertEqual('1,2');
      expect(names.toString()).assertEqual('one,two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0330
     * @tc.name testArrayMap033
     * @tc.desc Verify map can participate in filter map slice chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.filter((v: number): boolean => v > 2)
        .map((v: number): number => v * 2)
        .slice(0, 2);
      expect(result.toString()).assertEqual('6,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0340
     * @tc.name testArrayMap034
     * @tc.desc Verify same type mappings preserve number results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): number => v * 2);
      expect(typeof result[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0350
     * @tc.name testArrayMap035
     * @tc.desc Verify map supports multiple output types from the same numeric source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let strings = arr.map((v: number): string => v.toString());
      let bools = arr.map((v: number): boolean => v > 2);
      expect(typeof strings[0]).assertEqual('string');
      expect(bools.toString()).assertEqual('false,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0360
     * @tc.name testArrayMap036
     * @tc.desc Verify map supports complex object results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): Metrics036 => {
        let metrics = new Metrics036();
        metrics.original = v;
        metrics.doubled = v * 2;
        metrics.squared = v * v;
        return metrics;
      });
      expect(result[0].original).assertEqual(1);
      expect(result[0].doubled).assertEqual(2);
      expect(result[0].squared).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0370
     * @tc.name testArrayMap037
     * @tc.desc Verify map handles large array transformations efficiently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeNumberArray(10000);
      let result = arr.map((v: number): number => v * 2);
      expect(result.length).assertEqual(10000);
      expect(result[9999]).assertEqual(19998);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0380
     * @tc.name testArrayMap038
     * @tc.desc Verify map allocates a new array rather than reusing the original reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let original = arr;
      let result = arr.map((v: number): number => v * 2);
      expect(result !== original).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0390
     * @tc.name testArrayMap039
     * @tc.desc Verify map works after filter in a method chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.filter((v: number): boolean => v % 2 === 0)
        .map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('4,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0400
     * @tc.name testArrayMap040
     * @tc.desc Verify reduce can consume map results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let sum = arr.map((v: number): number => v * 2)
        .reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0410
     * @tc.name testArrayMap041
     * @tc.desc Verify sort can consume mapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(3, 1, 4, 1, 5);
      let result = arr.map((v: number): number => v * 10)
        .sort((a: number, b: number): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
      expect(result.toString()).assertEqual('10,10,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0420
     * @tc.name testArrayMap042
     * @tc.desc Verify slice can consume mapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.map((v: number): number => v * 2).slice(1, 4);
      expect(result.toString()).assertEqual('4,6,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0430
     * @tc.name testArrayMap043
     * @tc.desc Verify map supports longer chains with multiple array methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5, 6);
      let result = arr.filter((v: number): boolean => v > 1)
        .map((v: number): number => v * 2)
        .filter((v: number): boolean => v < 10)
        .slice(0, 3);
      expect(result.toString()).assertEqual('4,6,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0440
     * @tc.name testArrayMap044
     * @tc.desc Verify callback exceptions are propagated by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let visited = new Array<number>();
      try {
        arr.map((v: number): number => {
          visited.pushOne(v);
          if (v === 2) {
            throw new Error('Test error');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('Test error');
        expect(visited.toString()).assertEqual('1,2');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0450
     * @tc.name testArrayMap045
     * @tc.desc Verify map preserves explicit undefined values in dense arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, undefined, 3);
      let result = arr.map((v: number | undefined): number | undefined => {
        if (v === undefined) {
          return undefined;
        }
        return v * 2;
      });
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0460
     * @tc.name testArrayMap046
     * @tc.desc Verify map visits explicit undefined elements and preserves the result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      let callbackCount = 0;
      let result = arr.map((v: number | undefined): number | undefined => {
        callbackCount++;
        if (v === undefined) {
          return undefined;
        }
        return v * 2;
      });
      expect(callbackCount).assertEqual(3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(6);
      expect(result.indexOf(undefined)).assertEqual(1);
      expect(result.toString()).assertEqual('2,,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0470
     * @tc.name testArrayMap047
     * @tc.desc Verify explicitly typed result arrays can receive mapped string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result: Array<string> = arr.map((v: number): string => 'val:' + v.toString());
      expect(typeof result[0]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0480
     * @tc.name testArrayMap048
     * @tc.desc Verify callback return values determine the numeric result type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.map((v: number): number => {
        return v * 2;
      });
      expect(typeof result[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0490
     * @tc.name testArrayMap049
     * @tc.desc Verify map can format data for output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let formatted = arr.map((v: number): string => 'Value: ' + v.toString());
      expect(formatted.toString()).assertEqual('Value: 1,Value: 2,Value: 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0500
     * @tc.name testArrayMap050
     * @tc.desc Verify map supports batch calculations across all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prices = new Array<int>(100, 200, 300);
      let withTax = prices.map((price: int): int => price * 110 / 100);
      expect(withTax[0]).assertEqual(110);
      expect(withTax[1]).assertEqual(220);
      expect(withTax[2]).assertEqual(330);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0510
     * @tc.name testArrayMap051
     * @tc.desc Verify map can extract fields from complex data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user1 = new User051();
      user1.id = 1;
      user1.name = 'Alice';
      let user2 = new User051();
      user2.id = 2;
      user2.name = 'Bob';
      let users = new Array<User051>(user1, user2);
      let ids = users.map((u: User051): number => u.id);
      let names = users.map((u: User051): string => u.name);
      expect(ids.toString()).assertEqual('1,2');
      expect(names.toString()).assertEqual('Alice,Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0520
     * @tc.name testArrayMap052
     * @tc.desc Verify map can validate and convert text values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('1', '2', '3', 'abc');
      let numbers = arr.map((s: string): number => {
        let num = Number.parseInt(s);
        return Number.isNaN(num) ? 0 : num;
      });
      expect(numbers.toString()).assertEqual('1,2,3,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0530
     * @tc.name testArrayMap053
     * @tc.desc Verify map returns a new array while forEach does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<number>(1, 2, 3);
      let mapped = arr1.map((v: number): number => v * 2);
      let sum = 0;
      arr2.forEach((v: number): void => {
        sum += v;
      });
      expect(mapped[0]).assertEqual(2);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0540
     * @tc.name testArrayMap054
     * @tc.desc Verify map is preferable for transformations while forEach is suitable for side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let doubled = arr.map((v: number): number => v * 2);
      let sum = 0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      expect(doubled.toString()).assertEqual('2,4,6');
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0550
     * @tc.name testArrayMap055
     * @tc.desc Verify map can combine values from multiple arrays by using the index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<number>(10, 20, 30);
      let combined = arr1.map((v: number, i: int): number => v + arr2[i]);
      expect(combined.toString()).assertEqual('11,22,33');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0560
     * @tc.name testArrayMap056
     * @tc.desc Verify map can apply conditional transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.map((v: number): number => {
        if (v < 4) {
          return v * 10;
        }
        return v * 100;
      });
      expect(result.toString()).assertEqual('10,20,30,400,500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0570
     * @tc.name testArrayMap057
     * @tc.desc Verify map callbacks can capture external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let multiplier = 2;
      let result = arr.map((v: number): number => v * multiplier);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0580
     * @tc.name testArrayMap058
     * @tc.desc Verify map can use dynamically generated callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let factor = 10;
      let callbackfn = (v: number): number => v * factor;
      let result = arr.map(callbackfn);
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0590
     * @tc.name testArrayMap059
     * @tc.desc Verify map can return stringified numeric values through the built-in String callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.map((value: number): string => value.toString());
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0600
     * @tc.name testArrayMap060
     * @tc.desc Verify map can coerce numeric values through the built-in Number callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const result = arr.map((value: number): number => value);
      expect(result.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0610
     * @tc.name testArrayMap061
     * @tc.desc Verify map can coerce numeric values through the built-in Boolean callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2);
      const result = arr.map((value: number): boolean => value !== 0);
      expect(result.toString()).assertEqual('false,true,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0620
     * @tc.name testArrayMap062
     * @tc.desc Verify map exposes all three callback arguments to classic functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.map((_value: number, _index: int, source: Array<number>): int => {
        return source.length;
      });
      expect(result.toString()).assertEqual('3,3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0630
     * @tc.name testArrayMap063
     * @tc.desc Verify map can return object literals from arrow callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number): MapValue062 => {
        let mapped = new MapValue062();
        mapped.value = value;
        return mapped;
      });
      expect(result.length).assertEqual(2);
      expect(result[0].value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0640
     * @tc.name testArrayMap064
     * @tc.desc Verify map can wrap each element into a nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number): Array<number> => Array.create<number>(1, value));
      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual(1);
      expect(result[1][0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0650
     * @tc.name testArrayMap065
     * @tc.desc Verify parseFloat ignores the extra callback arguments passed by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('1.1', '2.2', '3.3');
      const result = arr.map(Number.parseFloat);
      expect(result.toString()).assertEqual('1.1,2.2,3.3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0660
     * @tc.name testArrayMap066
     * @tc.desc Verify parseInt receives the index as radix when passed directly as the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('1', '2', '3');
      const result = arr.map((value: string, index: int): number => Number.parseInt(value, index));
      expect(result[0]).assertEqual(1);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(Number.isNaN(result[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0670
     * @tc.name testArrayMap067
     * @tc.desc Verify parseInt can produce mixed numeric and NaN results because the index becomes the radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('10', '10', '10');
      const result = arr.map((value: string, index: int): number => Number.parseInt(value, index));
      expect(result[0]).assertEqual(10);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0680
     * @tc.name testArrayMap068
     * @tc.desc Verify map can update not-yet-visited elements and observe the new value later in traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number, index: int, source: Array<number>): number => {
        if (index === 0) {
          source[1] = 9;
        }
        return value;
      });
      expect(result.toString()).assertEqual('1,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0690
     * @tc.name testArrayMap069
     * @tc.desc Verify map does not revisit already-processed elements when earlier slots are modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number, index: int, source: Array<number>): number => {
        if (index === 1) {
          source[0] = 9;
        }
        return value;
      });
      expect(result.toString()).assertEqual('1,2');
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0700
     * @tc.name testArrayMap070
     * @tc.desc Verify map can return the original object references unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new Item020();
      item.value = 7;
      const arr = Array.create<Item020>(1, item);
      const result = arr.map((value: Item020): Item020 => value);
      expect(result[0] === item).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0710
     * @tc.name testArrayMap071
     * @tc.desc Verify map can create fresh object references for every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new Item020();
      item.value = 1;
      const arr = Array.create<Item020>(1, item);
      const result = arr.map((value: Item020): Item020 => {
        let mapped = new Item020();
        mapped.value = value.value;
        return mapped;
      });
      expect(result[0] === item).assertFalse();
      expect(result[0].value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0720
     * @tc.name testArrayMap072
     * @tc.desc Verify map can return closures that capture each iteration value independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number): (() => number) => {
        return (): number => value;
      });
      expect(result[0]()).assertEqual(1);
      expect(result[1]()).assertEqual(2);
      expect(result[0] !== result[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0730
     * @tc.name testArrayMap073
     * @tc.desc Verify map can return NaN values without failing the iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.map((_: number): number => Number.NaN);
      expect(Number.isNaN(result[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0740
     * @tc.name testArrayMap074
     * @tc.desc Verify map preserves negative zero when the callback returns the original numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, -0);
      const result = arr.map((value: number): number => value);
      expect(1 / result[0]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0750
     * @tc.name testArrayMap075
     * @tc.desc Verify map can transform nested arrays through an inner map call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(Array.create<number>(1, 1), Array.create<number>(1, 2));
      const result = arr.map((item: Array<number>): Array<number> => item.map((value: number): number => value * 2));
      expect(result.length).assertEqual(2);
      expect(result[0][0]).assertEqual(2);
      expect(result[1][0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0760
     * @tc.name testArrayMap076
     * @tc.desc Verify map can return Promise objects as ordinary mapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number): Promise<number> => Promise.resolve(value));
      expect(result.length).assertEqual(2);
      expect(result[0] instanceof Promise).assertTrue();
      expect(result[1] instanceof Promise).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0770
     * @tc.name testArrayMap077
     * @tc.desc Verify map can transform bigint arrays with bigint arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1000n, 2000n);
      const result = arr.map((value: bigint): bigint => value * 2n);
      expect(result[0]).assertEqual(2000n);
      expect(result[1]).assertEqual(4000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0780
     * @tc.name testArrayMap078
     * @tc.desc Verify map preserves string values that look like symbol text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'Symbol(a)');
      const result = arr.map((value: string): string => value);
      expect(result[0]).assertEqual('Symbol(a)');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0790
     * @tc.name testArrayMap079
     * @tc.desc Verify map can derive string lengths through a property access callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'ab');
      const result = arr.map((value: string): int => value.length);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0800
     * @tc.name testArrayMap080
     * @tc.desc Verify map can convert nullable objects into booleans through logical coercion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Object | null>(new Item020(), null);
      const result = arr.map((value: Object | null): boolean => value !== null);
      expect(result.toString()).assertEqual('true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0810
     * @tc.name testArrayMap081
     * @tc.desc Verify map callback exceptions stop later elements from being processed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let count = 0;
      try {
        arr.map((value: number): number => {
          count++;
          if (value === 2) {
            throw new Error('map stop');
          }
          return value;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('map stop');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0820
     * @tc.name testArrayMap082
     * @tc.desc Verify map can preserve explicit undefined values while still invoking the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const result = arr.map((value: number | undefined): string => value === undefined ? 'U' : value.toString());
      expect(result.toString()).assertEqual('1,U,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0830
     * @tc.name testArrayMap083
     * @tc.desc Verify map can process explicit null values through the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const result = arr.map((value: number | null): string => value === null ? 'N' : value.toString());
      expect(result.toString()).assertEqual('1,N,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0840
     * @tc.name testArrayMap084
     * @tc.desc Verify map can compose parseInt safely when the radix is fixed inside a closure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('10', '10', '10');
      const result = arr.map((value: string): number => Number.parseInt(value, 10));
      expect(result.toString()).assertEqual('10,10,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0850
     * @tc.name testArrayMap085
     * @tc.desc Verify map can read the first source element from the array callback parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((_: number, _index: int, source: Array<number>): number => source[0]);
      expect(result.toString()).assertEqual('1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0860
     * @tc.name testArrayMap086
     * @tc.desc Verify map can return a constant boolean for every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((_: number): boolean => true);
      expect(result.toString()).assertEqual('true,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0870
     * @tc.name testArrayMap087
     * @tc.desc Verify map can keep the identity transform on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.map((value: number): number => value);
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0880
     * @tc.name testArrayMap088
     * @tc.desc Verify map can build a new array of arrays without flattening the structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number): Array<number> => new Array<number>(value, value));
      expect(result.length).assertEqual(2);
      expect(result[0].toString()).assertEqual('1,1');
      expect(result[1].toString()).assertEqual('2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0890
     * @tc.name testArrayMap089
     * @tc.desc Verify map can read string lengths while preserving the source strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '', 'a');
      const result = arr.map((value: string): int => value.length);
      expect(result.toString()).assertEqual('5,0,1');
      expect(arr.toString()).assertEqual('hello,,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0900
     * @tc.name testArrayMap090
     * @tc.desc Verify map can transform booleans into descriptive text values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      const result = arr.map((value: boolean): string => value ? 'yes' : 'no');
      expect(result.toString()).assertEqual('yes,no');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0910
     * @tc.name testArrayMap091
     * @tc.desc Verify map can stringify bigint values without losing iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 20n);
      const result = arr.map((value: bigint): string => 'v' + value.toString());
      expect(result.toString()).assertEqual('v10,v20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0920
     * @tc.name testArrayMap092
     * @tc.desc Verify map can convert every value to undefined explicitly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((_: number): undefined => undefined);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0930
     * @tc.name testArrayMap093
     * @tc.desc Verify map can convert every value to null explicitly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((_: number): null => null);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0940
     * @tc.name testArrayMap094
     * @tc.desc Verify map can keep array length aligned with object extraction results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new User051();
      item1.id = 1;
      item1.name = 'A';
      let item2 = new User051();
      item2.id = 2;
      item2.name = 'B';
      const arr = new Array<User051>(item1, item2);
      const result = arr.map((value: User051): number => value.id);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0950
     * @tc.name testArrayMap095
     * @tc.desc Verify map can use a branch that omits an explicit value on one side and returns undefined there
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number): string | undefined => {
        if (value > 1) {
          return 'a';
        }
        return undefined;
      });
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0960
     * @tc.name testArrayMap096
     * @tc.desc Verify map can transform all values to the same object reference when the callback returns a shared object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      let shared = new Item020();
      shared.value = 9;
      const result = arr.map((_: number): Item020 => shared);
      expect(result[0] === shared).assertTrue();
      expect(result[1] === shared).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0970
     * @tc.name testArrayMap097
     * @tc.desc Verify map can create distinct object wrappers for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.map((value: number): Item020 => {
        let item = new Item020();
        item.value = value;
        return item;
      });
      expect(result[0] === result[1]).assertFalse();
      expect(result[0].value).assertEqual(1);
      expect(result[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0980
     * @tc.name testArrayMap098
     * @tc.desc Verify map can return a stable array length when the callback appends to the source during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.map((value: number, index: int, source: Array<number>): number => {
        if (index === 0) {
          source.pushOne(4);
        }
        return value;
      });
      expect(result.length).assertEqual(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_0990
     * @tc.name testArrayMap099
     * @tc.desc Verify map can still return the original prefix when callback mutates the source length by pushing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.map((value: number, index: int, source: Array<number>): number => {
        if (index === 0) {
          source.pushArray(4, 5);
        }
        return value;
      });
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_1000
     * @tc.name testArrayMap100
     * @tc.desc Verify map supports consecutive chained calls that keep producing new arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.map((value: number): number => value * 2).map((value: number): number => value + 1);
      expect(result.toString()).assertEqual('3,5,7');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_1010
     * @tc.name testArrayMap101
     * @tc.desc Verify map works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(mapNumberArrayFromAny(anyValue)).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_MAP_1020
     * @tc.name testArrayMap102
     * @tc.desc Verify Array<Any> values can preserve mixed elements during map-related handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayMap102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const result = anyArr.map((_: Any, index: int, source: Array<Any>): Any => source[index]);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,two,true');
    });

  });
}
