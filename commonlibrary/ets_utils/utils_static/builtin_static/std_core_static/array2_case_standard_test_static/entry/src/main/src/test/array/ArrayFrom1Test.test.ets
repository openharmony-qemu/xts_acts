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

class Item021 {
  value: number = 0;

  constructor(v: number) {
    this.value = v;
  }
}

interface Point022 {
  x: number;
  y: number;
}

class FromIterObjA {
  value: number = 0;
}

type NumberArrayLike001 = Array<number>;

function createFilledNumberArray(size: int): Array<number> {
  return new Array<number>(size, (index: int): number => index);
}

export default function ArrayFrom1Test(): void {
  const invokeArrayFromIterable = (source: Any): Array<number> => {
    return Array.from<number>(source as Set<number>);
  };

  describe('ArrayFrom1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0100
     * @tc.name testArrayFromOne001
     * @tc.desc Verify Array from accepts the required iterable parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(10, 20, 30);
      let arr = Array.from<number>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0200
     * @tc.name testArrayFromOne002
     * @tc.desc Verify Array from creates an array from an ArrayLike object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike: NumberArrayLike001 = new Array<number>(10, 20, 30);
      let arr = Array.from<number>(arrayLike);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0300
     * @tc.name testArrayFromOne003
     * @tc.desc Verify Array from creates an array from an iterable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 3, 4, 5]);
      let arr = Array.from<number>(set);
      expect(arr.length).assertEqual(5);
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0400
     * @tc.name testArrayFromOne004
     * @tc.desc Verify Array from creates an array from map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, number>([
        ['a', 1],
        ['b', 2],
        ['c', 3]
      ]);
      let arr = Array.from<[string, number]>(map.entries());
      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual('a');
      expect(arr[0][1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0500
     * @tc.name testArrayFromOne005
     * @tc.desc Verify Array from creates an array from a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str = 'hello';
      let arr = Array.from<string>(str);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual('h');
      expect(arr[4]).assertEqual('o');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0600
     * @tc.name testArrayFromOne006
     * @tc.desc Verify Array from uses a standard array as the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0700
     * @tc.name testArrayFromOne007
     * @tc.desc Verify Array from supports an empty array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>();
      let arr = Array.from<number>(source);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0800
     * @tc.name testArrayFromOne008
     * @tc.desc Verify Array from supports large array sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = createFilledNumberArray(1000);
      let arr = Array.from<number>(source);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_0900
     * @tc.name testArrayFromOne009
     * @tc.desc Verify Array from keeps null values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number | null>(1, null, 3);
      let arr = Array.from<number | null>(source);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1000
     * @tc.name testArrayFromOne010
     * @tc.desc Verify Array from keeps undefined values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number | undefined>(1, undefined, 3);
      let arr = Array.from<number | undefined>(source);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1100
     * @tc.name testArrayFromOne011
     * @tc.desc Verify Array from keeps negative numbers in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, -100, 3);
      let arr = Array.from<number>(source);
      expect(arr[1]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1200
     * @tc.name testArrayFromOne012
     * @tc.desc Verify Array from keeps max and min number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(Number.MAX_VALUE, Number.MIN_VALUE);
      let arr = Array.from<number>(source);
      expect(arr[0]).assertEqual(Number.MAX_VALUE);
      expect(arr[1]).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1300
     * @tc.name testArrayFromOne013
     * @tc.desc Verify Array from keeps NaN values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, Double.NaN, 3);
      let arr = Array.from<number>(source);
      expect(isNaN(arr[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1400
     * @tc.name testArrayFromOne014
     * @tc.desc Verify Array from keeps Infinity values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, Double.POSITIVE_INFINITY, -Double.POSITIVE_INFINITY);
      let arr = Array.from<number>(source);
      expect(arr[1]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr[2]).assertEqual(-Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1500
     * @tc.name testArrayFromOne015
     * @tc.desc Verify Array from keeps Unicode string content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = Array.create<string>(1, 'hello🌍');
      let arr = Array.from<string>(source);
      expect(arr[0]).assertEqual('hello🌍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1600
     * @tc.name testArrayFromOne016
     * @tc.desc Verify Array from keeps zero width space characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = Array.create<string>(1, 'visible\u200B');
      let arr = Array.from<string>(source);
      expect(arr[0]).assertEqual('visible\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1700
     * @tc.name testArrayFromOne017
     * @tc.desc Verify Array from keeps object instances in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<Item021>(
        new Item021(1),
        new Item021(2),
        new Item021(3)
      );
      let arr = Array.from<Item021>(source);
      expect(arr[0].value).assertEqual(1);
      expect(arr[2].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1800
     * @tc.name testArrayFromOne018
     * @tc.desc Verify Array from keeps interface typed entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<Point022>(
        { x: 1, y: 2 },
        { x: 3, y: 4 }
      );
      let arr = Array.from<Point022>(source);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].y).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_1900
     * @tc.name testArrayFromOne019
     * @tc.desc Verify Array from keeps union typed entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number | string>(1, 'two', 3, 'four');
      let arr = Array.from<number | string>(source);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual('four');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2000
     * @tc.name testArrayFromOne020
     * @tc.desc Verify Array from supports an empty Set source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      let arr = Array.from<number>(set);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2100
     * @tc.name testArrayFromOne021
     * @tc.desc Verify Array from supports an empty Map source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, number>();
      let arr = Array.from<[string, number]>(map.entries());
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2200
     * @tc.name testArrayFromOne022
     * @tc.desc Verify Array from keeps Set deduplication behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 2, 3, 3, 3]);
      let arr = Array.from<number>(set);
      expect(arr.length).assertEqual(3);
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2300
     * @tc.name testArrayFromOne023
     * @tc.desc Verify Array from keeps special characters in strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str = 'a\u200Bb\tc\nd';
      let arr = Array.from<string>(str);
      expect(arr.length > 4).assertTrue();
      expect(arr[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2400
     * @tc.name testArrayFromOne024
     * @tc.desc Verify Array.from creates an independent copy that does not change after the source array is mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(10, 20, 30);
      let arr = Array.from<number>(source);
      source[0] = 99;
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('10,20,30');
      expect(source.toString()).assertEqual('99,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2500
     * @tc.name testArrayFromOne025
     * @tc.desc Verify Array.from preserves empty string elements when copying string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<string>('', 'middle', '');
      let arr = Array.from<string>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('middle');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2600
     * @tc.name testArrayFromOne026
     * @tc.desc Verify Array.from copies union-typed array values in their original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number | string>(1, 'two', 3);
      let arr = Array.from<number | string>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2700
     * @tc.name testArrayFromOne027
     * @tc.desc Verify Array.from copies nullable values without dropping undefined entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number | undefined>(1, undefined, 3);
      let arr = Array.from<number | undefined>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2800
     * @tc.name testArrayFromOne028
     * @tc.desc Verify Array from supports ArrayLike sources with zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike: NumberArrayLike001 = new Array<number>();
      let arr = Array.from<number>(arrayLike);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_2900
     * @tc.name testArrayFromOne029
     * @tc.desc Verify Array from respects ArrayLike length larger than entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number | undefined>(
        5,
        (_index: int): number | undefined => undefined
      );
      arrayLike[0] = 1;
      arrayLike[1] = 2;
      let arr = Array.from<number | undefined>(arrayLike);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3000
     * @tc.name testArrayFromOne030
     * @tc.desc Verify Array from supports ArrayLike sources with very large length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number | undefined>(
        100000,
        (_index: int): number | undefined => undefined
      );
      arrayLike[0] = 1;
      arrayLike[1] = 2;
      let arr = Array.from<number | undefined>(arrayLike);
      expect(arr.length).assertEqual(100000);
      expect(arr[0]).assertEqual(1);
      expect(arr[99999]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3100
     * @tc.name testArrayFromOne031
     * @tc.desc Verify Array from returns a new array with source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(10, 20, 30);
      let arr = Array.from<number>(source);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3200
     * @tc.name testArrayFromOne032
     * @tc.desc Verify Array from returns an independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number>(source);
      arr[0] = 999;
      expect(source[0]).assertEqual(1);
      expect(arr[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3300
     * @tc.name testArrayFromOne033
     * @tc.desc Verify the static method is called through the Array class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number>(source);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3400
     * @tc.name testArrayFromOne034
     * @tc.desc Verify Array from supports explicit generic syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 3);
      let arr = Array.from<number>(source);
      let strArr = Array.from<string>(new Array<string>('a', 'b', 'c'));
      expect(arr.length).assertEqual(3);
      expect(strArr[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3500
     * @tc.name testArrayFromOne035
     * @tc.desc Verify Array from preserves the Set deduplication characteristic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 2, 3, 3, 3]);
      let arr = Array.from<number>(set);
      expect(arr.length).assertEqual(3);
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3600
     * @tc.name testArrayFromOne036
     * @tc.desc Verify Array from splits strings into character arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str = 'hello world';
      let chars = Array.from<string>(str);
      let upper = chars.map((c: string): string => c.toUpperCase());
      let result = upper.join('');
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3700
     * @tc.name testArrayFromOne037
     * @tc.desc Verify Array from can be used to create an array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Array<number>(1, 2, 3, 4, 5);
      let copy = Array.from<number>(original);
      expect(copy === original).assertEqual(false);
      expect(copy.length).assertEqual(original.length);
      for (let i: int = 0; i < copy.length; i++) {
        expect(copy[i]).assertEqual(original[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3800
     * @tc.name testArrayFromOne038
     * @tc.desc Verify Array from converts a Set into an array for data processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(['a', 'b', 'c']);
      let arr = Array.from<string>(set);
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.includes('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_3900
     * @tc.name testArrayFromOne039
     * @tc.desc Verify Array.from can copy set-based iterables built from 1, 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>(new Array<number>(1, 2, 3));
      const arr = Array.from<number>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4000
     * @tc.name testArrayFromOne040
     * @tc.desc Verify Array.from can copy set-based iterable 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>(new Array<number>(2, 3, 4));
      const arr = Array.from<number>(source);
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4100
     * @tc.name testArrayFromOne041
     * @tc.desc Verify Array.from can copy a Set iterator after values are added in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(3);
      set.add(1);
      set.add(2);
      const result = Array.from<number>(set);
      expect(result.toString()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4200
     * @tc.name testArrayFromOne042
     * @tc.desc Verify Array.from can copy a string iterable containing repeated characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<string>('level');
      expect(result.toString()).assertEqual('l,e,v,e,l');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4300
     * @tc.name testArrayFromOne043
     * @tc.desc Verify Array.from can copy a string iterable containing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<string>('a b');
      expect(result.toString()).assertEqual('a, ,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4400
     * @tc.name testArrayFromOne044
     * @tc.desc Verify Array.from can copy keys from a Map iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('left', 1);
      map.set('right', 2);
      const result = Array.from<string>(map.keys());
      expect(result.toString()).assertEqual('left,right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4500
     * @tc.name testArrayFromOne045
     * @tc.desc Verify Array.from can copy values from a Map iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('left', 1);
      map.set('right', 2);
      const result = Array.from<number>(map.values());
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4600
     * @tc.name testArrayFromOne046
     * @tc.desc Verify Array.from can copy an array values iterator after shift changed the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      source.shift();
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4700
     * @tc.name testArrayFromOne047
     * @tc.desc Verify Array.from can copy an array values iterator after pop changed the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      source.pop();
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4800
     * @tc.name testArrayFromOne048
     * @tc.desc Verify Array.from can copy an array values iterator after reverse reordered the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      source.reverse();
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_4900
     * @tc.name testArrayFromOne049
     * @tc.desc Verify Array.from can copy an array values iterator after sort reordered the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(4, 1, 3, 2);
      source.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5000
     * @tc.name testArrayFromOne050
     * @tc.desc Verify Array.from can copy a concatenated array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5100
     * @tc.name testArrayFromOne051
     * @tc.desc Verify Array.from can copy a filtered array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value >= 3);
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5200
     * @tc.name testArrayFromOne052
     * @tc.desc Verify Array.from can copy a sliced array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4, 5).slice(1, 4);
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5300
     * @tc.name testArrayFromOne053
     * @tc.desc Verify Array.from can copy a toReversed array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3).toReversed();
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5400
     * @tc.name testArrayFromOne054
     * @tc.desc Verify Array.from can copy a toSorted array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(3, 1, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5500
     * @tc.name testArrayFromOne055
     * @tc.desc Verify Array.from can copy a toSpliced array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4).toSpliced(1, 2);
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5600
     * @tc.name testArrayFromOne056
     * @tc.desc Verify Array.from can copy a with replacement array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3).with(1, 9);
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5700
     * @tc.name testArrayFromOne057
     * @tc.desc Verify Array.from can copy a Set containing negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(-3);
      set.add(0);
      set.add(5);
      const result = Array.from<number>(set);
      expect(result.toString()).assertEqual('-3,0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5800
     * @tc.name testArrayFromOne058
     * @tc.desc Verify Array.from can copy a Set containing duplicates only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(2);
      set.add(2);
      set.add(3);
      const result = Array.from<number>(set);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_5900
     * @tc.name testArrayFromOne059
     * @tc.desc Verify Array.from can copy a Set containing bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<bigint>();
      set.add(1n);
      set.add(3n);
      const result = Array.from<bigint>(set);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6000
     * @tc.name testArrayFromOne060
     * @tc.desc Verify Array.from can copy a Set containing boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      set.add(true);
      set.add(false);
      const result = Array.from<boolean>(set);
      expect(result.toString()).assertEqual('true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6100
     * @tc.name testArrayFromOne061
     * @tc.desc Verify Array.from can copy a Set containing object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new FromIterObjA();
      const second = new FromIterObjA();
      const set = new Set<FromIterObjA>();
      set.add(first);
      set.add(second);
      const result = Array.from<FromIterObjA>(set);
      expect(result[0] === first).assertTrue();
      expect(result[1] === second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6200
     * @tc.name testArrayFromOne062
     * @tc.desc Verify Array.from can copy an iterator from Array.of output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Array.of<number>(7, 8, 9).values();
      const result = Array.from<number>(source);
      expect(result.toString()).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6300
     * @tc.name testArrayFromOne063
     * @tc.desc Verify Array.from can copy an iterator from a rebuilt array after length reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      source.length = 0;
      source.pushOne(7);
      source.pushOne(8);
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6400
     * @tc.name testArrayFromOne064
     * @tc.desc Verify Array.from can copy an empty string iterable into an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<string>('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6500
     * @tc.name testArrayFromOne065
     * @tc.desc Verify Array.from can copy a one-character iterable into a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<string>('Z');
      expect(result.toString()).assertEqual('Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6600
     * @tc.name testArrayFromOne066
     * @tc.desc Verify Array.from can copy a map key iterator after one key is deleted and re-added
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.delete('a');
      map.set('a', 3);
      const result = Array.from<string>(map.keys());
      expect(result.toString()).assertEqual('b,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6700
     * @tc.name testArrayFromOne067
     * @tc.desc Verify Array.from can copy values from a Set built from a filtered source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value % 2 !== 0);
      const set = new Set<number>(source);
      const result = Array.from<number>(set);
      expect(result.toString()).assertEqual('1,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6800
     * @tc.name testArrayFromOne068
     * @tc.desc Verify Array.from can copy iterable data without mutating the original array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(4, 5, 6);
      const before = source.toString();
      const result = Array.from<number>(source.values());
      expect(result.toString()).assertEqual('4,5,6');
      expect(source.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_6900
     * @tc.name testArrayFromOne069
     * @tc.desc Verify Array.from can copy iterable data from an empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      const result = Array.from<number>(set);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7000
     * @tc.name testArrayFromOne070
     * @tc.desc Verify Array.from can copy iterable data from a single-entry Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(9);
      const result = Array.from<number>(set);
      expect(result.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7100
     * @tc.name testArrayFromOne071
     * @tc.desc Verify Array.from can copy iterable data from a Set built with Array.from output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Array.from<number>(new Array<number>(2, 4, 6));
      const set = new Set<number>(base);
      const result = Array.from<number>(set);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7200
     * @tc.name testArrayFromOne072
     * @tc.desc Verify Array.from can copy iterable data from a Set containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(Infinity);
      set.add(-Infinity);
      const result = Array.from<number>(set);
      expect(result.toString()).assertEqual('Infinity,-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7300
     * @tc.name testArrayFromOne073
     * @tc.desc Verify Array.from can copy iterable data from a Set containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(Double.NaN);
      const result = Array.from<number>(set);
      expect(result.length).assertEqual(1);
      expect(result[0] !== result[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7400
     * @tc.name testArrayFromOne074
     * @tc.desc Verify Array.from can copy iterable data from a Set containing empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add('');
      set.add('tail');
      const result = Array.from<string>(set);
      expect(result.toString()).assertEqual(',tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7500
     * @tc.name testArrayFromOne075
     * @tc.desc Verify Array.from can copy iterable data from a Set containing emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add('😀');
      set.add('🌍');
      const result = Array.from<string>(set);
      expect(result.toString()).assertEqual('😀,🌍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7600
     * @tc.name testArrayFromOne076
     * @tc.desc Verify Array.from can copy iterable data from a Set containing a zero-width space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add('\u200B');
      set.add('x');
      const result = Array.from<string>(set);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7700
     * @tc.name testArrayFromOne077
     * @tc.desc Verify Array.from can copy iterable data from a Set built after shrinkTo truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      source.shrinkTo(2);
      const set = new Set<number>(source);
      const result = Array.from<number>(set);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7800
     * @tc.name testArrayFromOne078
     * @tc.desc Verify Array.from can preserve wrapped Uint8Array values larger than 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array([255, 256, 257]);
      const result = Array.from<number>(source);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('255,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_7900
     * @tc.name testArrayFromOne079
     * @tc.desc Verify Array.from can split emoji strings using iterable semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.from<string>('a🌍b');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('🌍');
      expect(result[2]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_8000
     * @tc.name testArrayFromOne080
     * @tc.desc Verify repeated Array.from calls on the same source return independent arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const first = Array.from<number>(source);
      const second = Array.from<number>(source);
      first[0] = 9;
      expect(source[0]).assertEqual(1);
      expect(second[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_8100
     * @tc.name testArrayFromOne081
     * @tc.desc Verify Array.from can convert a long string into a same-length character array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = '';
      for (let i: int = 0; i < 10; i++) {
        text += 'a';
      }
      const result = Array.from<string>(text);
      expect(result.length).assertEqual(10);
      expect(result[0]).assertEqual('a');
      expect(result[9]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_8200
     * @tc.name testArrayFromOne082
     * @tc.desc Verify Array.from throws ClassCastError when the iterable source is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeArrayFromIterable(null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_8300
     * @tc.name testArrayFromOne083
     * @tc.desc Verify Array.from throws ClassCastError when the iterable source is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeArrayFromIterable(undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_ONE_8400
     * @tc.name testArrayFromOne084
     * @tc.desc Verify Array.from throws ClassCastError when the iterable source is a non-iterable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalid = new FromIterObjA();
      try {
        invokeArrayFromIterable(invalid);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

  });
}

