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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class Item016 {
  value: number = 0;

  constructor(v: number) {
    this.value = v;
  }
}

interface Point017 {
  x: number;
  y: number;
}

interface PlainObject028 {
  a: number;
  b: number;
}

class FromLikeObjA {
  value: number = 0;
}

type NumberArrayLike020 = Array<number>;
type OptionalNumberArrayLike020 = Array<number | undefined>;
type StringArrayLike020 = Array<string>;

function createNumberArray(size: int): Array<number> {
  return new Array<number>(size, (index: int): number => index);
}

function createSequentialArrayLike(size: int): Array<number> {
  return new Array<number>(size, (index: int): number => index);
}

function isValueNaN(value: number): boolean {
  return value !== value;
}

export default function ArrayFrom2Test(): void {
  const invokeArrayFromArrayLike = (source: Any): Array<number> => {
    return Array.from<number>(source as NumberArrayLike020);
  };

  describe('ArrayFrom2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0100
     * @tc.name testArrayFromTwo001
     * @tc.desc Verify Array from accepts the required array like parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<string>('foo', 'bar', 'baz');
      let arr = Array.from<string>(sourceArr);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('bar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0200
     * @tc.name testArrayFromTwo002
     * @tc.desc Verify Array from uses a standard array like source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number>(1, 2, 3, 4, 5);
      let arr = Array.from<number>(sourceArr);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0300
     * @tc.name testArrayFromTwo003
     * @tc.desc Verify Array from supports a single element array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = Array.create<number>(1, 42);
      let arr = Array.from<number>(sourceArr);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0400
     * @tc.name testArrayFromTwo004
     * @tc.desc Verify Array from supports large array sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = createNumberArray(1000);
      let arr = Array.from<number>(sourceArr);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0500
     * @tc.name testArrayFromTwo005
     * @tc.desc Verify Array from keeps zero values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number>(0, 1, 0);
      let arr = Array.from<number>(sourceArr);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0600
     * @tc.name testArrayFromTwo006
     * @tc.desc Verify Array from preserves null values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number | null>(1, null, 3);
      let arr = Array.from<number | null>(sourceArr);
      expect(arr[1] === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0700
     * @tc.name testArrayFromTwo007
     * @tc.desc Verify Array from preserves undefined values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number | undefined>(1, undefined, 3);
      let arr = Array.from<number | undefined>(sourceArr);
      expect(arr[1] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0800
     * @tc.name testArrayFromTwo008
     * @tc.desc Verify Array from preserves negative numbers in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number>(-100, 0, 100);
      let arr = Array.from<number>(sourceArr);
      expect(arr[0]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_0900
     * @tc.name testArrayFromTwo009
     * @tc.desc Verify Array from preserves NaN values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number>(1, Double.NaN, 3);
      let arr = Array.from<number>(sourceArr);
      expect(isValueNaN(arr[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1000
     * @tc.name testArrayFromTwo010
     * @tc.desc Verify Array from preserves infinity values in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number>(Double.POSITIVE_INFINITY, -Double.POSITIVE_INFINITY);
      let arr = Array.from<number>(sourceArr);
      expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr[1]).assertEqual(-Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1100
     * @tc.name testArrayFromTwo011
     * @tc.desc Verify Array from preserves xss like string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = Array.create<string>(1, '<script>alert(1)</script>');
      let arr = Array.from<string>(sourceArr);
      expect(arr[0]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1200
     * @tc.name testArrayFromTwo012
     * @tc.desc Verify Array from preserves unicode strings in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<string>('你好', '世界');
      let arr = Array.from<string>(sourceArr);
      expect(arr[0]).assertEqual('你好');
      expect(arr[1]).assertEqual('世界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1300
     * @tc.name testArrayFromTwo013
     * @tc.desc Verify Array from preserves empty strings in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<string>('', 'a', '');
      let arr = Array.from<string>(sourceArr);
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1400
     * @tc.name testArrayFromTwo014
     * @tc.desc Verify Array from preserves object instances in the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<Item016>(new Item016(1), new Item016(2));
      let arr = Array.from<Item016>(sourceArr);
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1500
     * @tc.name testArrayFromTwo015
     * @tc.desc Verify Array from preserves interface typed objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<Point017>({ x: 1, y: 2 }, { x: 3, y: 4 });
      let arr = Array.from<Point017>(sourceArr);
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].y).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1600
     * @tc.name testArrayFromTwo016
     * @tc.desc Verify Array from preserves union typed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number | string>(1, 'two', 3);
      let arr = Array.from<number | string>(sourceArr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1700
     * @tc.name testArrayFromTwo017
     * @tc.desc Verify Array from converts objects implementing ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike: NumberArrayLike020 = new Array<number>(10, 20, 30);
      let arr = Array.from<number>(arrayLike);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1800
     * @tc.name testArrayFromTwo018
     * @tc.desc Verify Array from supports array like objects with zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike: NumberArrayLike020 = new Array<number>();
      let arr = Array.from<number>(arrayLike);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_1900
     * @tc.name testArrayFromTwo019
     * @tc.desc Verify Array from supports single element array like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike: StringArrayLike020 = Array.create<string>(1, 'single');
      let arr = Array.from<string>(arrayLike);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('single');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2000
     * @tc.name testArrayFromTwo020
     * @tc.desc Verify Array from supports large array like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike: OptionalNumberArrayLike020 = new Array<number | undefined>(
        10000,
        (_index: int): number | undefined => undefined
      );
      arrayLike[0] = 1;
      arrayLike[1] = 2;
      let arr = Array.from<number | undefined>(arrayLike);
      expect(arr.length).assertEqual(10000);
      expect(arr[0]).assertEqual(1);
      expect(arr[9999] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2100
     * @tc.name testArrayFromTwo021
     * @tc.desc Verify Array.from copies explicit undefined values at unassigned positions in a dense array-like source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike: OptionalNumberArrayLike020 = new Array<number | undefined>(
        5,
        (_index: int): number | undefined => undefined
      );
      arrayLike[0] = 1;
      arrayLike[2] = 3;
      let arr = Array.from<number | undefined>(arrayLike);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1] === undefined).assertTrue();
      expect(arr[2]).assertEqual(3);
      expect(arr[3] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2200
     * @tc.name testArrayFromTwo022
     * @tc.desc Verify Array.from copies values populated by index writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(4, (_index: int): number => 0);
      for (let i: int = 0; i < source.length; i++) {
        source[i] = (i + 1) * (i + 1);
      }
      let arr = Array.from<number>(source);
      expect(arr.length).assertEqual(4);
      expect(arr.toString()).assertEqual('1,4,9,16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2300
     * @tc.name testArrayFromTwo023
     * @tc.desc Verify Array.from preserves source order after reverse mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<string>('head', 'middle', 'tail');
      source.reverse();
      let arr = Array.from<string>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('tail');
      expect(arr[2]).assertEqual('head');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2400
     * @tc.name testArrayFromTwo024
     * @tc.desc Verify Array.from copies a source containing repeated edge values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(Number.MIN_VALUE, 0, Number.MIN_VALUE);
      let arr = Array.from<number>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(Number.MIN_VALUE);
      expect(arr[2]).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2500
     * @tc.name testArrayFromTwo025
     * @tc.desc Verify Array.from performs a shallow copy for object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new FromLikeObjA();
      first.value = 10;
      let second = new FromLikeObjA();
      second.value = 20;
      let source = new Array<FromLikeObjA>(first, second);
      let arr = Array.from<FromLikeObjA>(source);
      expect(arr.length).assertEqual(2);
      expect(arr[0] === first).assertTrue();
      expect(arr[1].value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2600
     * @tc.name testArrayFromTwo026
     * @tc.desc Verify Array from can process string input through array like access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str = 'hello';
      let arr = Array.from<string>(str);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual('h');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2700
     * @tc.name testArrayFromTwo027
     * @tc.desc Verify Array from returns a new array containing source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<string>('foo', 'bar', 'baz');
      let arr = Array.from<string>(sourceArr);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('foo');
      expect(arr[1]).assertEqual('bar');
      expect(arr[2]).assertEqual('baz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2800
     * @tc.name testArrayFromTwo028
     * @tc.desc Verify Array from returns a new array instead of the source reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number>(1, 2, 3);
      let arr = Array.from<number>(sourceArr);
      arr[0] = 999;
      sourceArr[1] = 888;
      expect(sourceArr[0]).assertEqual(1);
      expect(arr[0]).assertEqual(999);
      expect(sourceArr[1]).assertEqual(888);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_2900
     * @tc.name testArrayFromTwo029
     * @tc.desc Verify Array from returns arrays of the requested generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr = new Array<number>(1, 2, 3);
      let arr = Array.from<number>(sourceArr);
      let val: number = arr[0];
      expect(typeof val).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3000
     * @tc.name testArrayFromTwo030
     * @tc.desc Verify Array from converts array like objects into arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number>(3, (index: int): number => (index + 1) * 10);
      let arr = Array.from<number>(arrayLike);
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.map((x: number): number => x * 2)[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3100
     * @tc.name testArrayFromTwo031
     * @tc.desc Verify Array from supports explicit generic syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArr = new Array<number>(1, 2, 3);
      let result = Array.from<number>(numArr);
      let strArr = new Array<string>('a', 'b', 'c');
      let result2 = Array.from<string>(strArr);
      expect(result[0]).assertEqual(1);
      expect(result2[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3200
     * @tc.name testArrayFromTwo032
     * @tc.desc Verify Array from copies all indexed values from complete array like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number>(5, (index: int): number => index + 1);
      let arr = Array.from<number>(arrayLike);
      expect(arr.length).assertEqual(5);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3300
     * @tc.name testArrayFromTwo033
     * @tc.desc Verify Array.from keeps explicit undefined values in unassigned positions of a dense array-like source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number | undefined>(
        5,
        (_index: int): number | undefined => undefined
      );
      arrayLike[0] = 1;
      arrayLike[2] = 3;
      arrayLike[4] = 5;
      let arr = Array.from<number | undefined>(arrayLike);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1] === undefined).assertTrue();
      expect(arr[2]).assertEqual(3);
      expect(arr[3] === undefined).assertTrue();
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3400
     * @tc.name testArrayFromTwo034
     * @tc.desc Verify Array.from copies a large dense array-like source containing explicit undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number | undefined>(
        100,
        (_index: int): number | undefined => undefined
      );
      arrayLike[0] = 1;
      arrayLike[50] = 50;
      arrayLike[99] = 99;
      let arr = Array.from<number | undefined>(arrayLike);
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(1);
      expect(arr[50]).assertEqual(50);
      expect(arr[99]).assertEqual(99);
      expect(arr[1] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3500
     * @tc.name testArrayFromTwo035
     * @tc.desc Verify argument like objects can be converted into arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let args = new Array<number>(3, (index: int): number => (index + 1) * 10);
      let arr = Array.from<number>(args);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3600
     * @tc.name testArrayFromTwo036
     * @tc.desc Verify Array from creates a shallow copy of arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Array<number>(1, 2, 3, 4, 5);
      let copy = Array.from<number>(original);
      expect(copy === original).assertFalse();
      expect(copy.length).assertEqual(original.length);
      for (let i: int = 0; i < copy.length; i++) {
        expect(copy[i]).assertEqual(original[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3700
     * @tc.name testArrayFromTwo037
     * @tc.desc Verify Array from performs shallow copies for nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Array<number>(1, 2, 3);
      let original = new Array<Array<number>>(
        new Array<number>(1, 2),
        inner,
        new Array<number>(7, 8)
      );
      let copy = Array.from<Array<number>>(original);
      inner[0] = 999;
      expect(copy[1] === inner).assertTrue();
      expect(original[1][0]).assertEqual(999);
      expect(copy[1][0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3800
     * @tc.name testArrayFromTwo038
     * @tc.desc Verify Array from keeps element order for array like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number>(5, (index: int): number => (index + 1) * 10);
      let arr = Array.from<number>(arrayLike);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual((i + 1) * 10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_3900
     * @tc.name testArrayFromTwo039
     * @tc.desc Verify Array from copies only numeric index properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrayLike = new Array<number>(1, 2, 3);
      let arr = Array.from<number>(arrayLike);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4000
     * @tc.name testArrayFromTwo040
     * @tc.desc Verify Array.from can copy array-like numeric sources built from 1, 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = Array.from<number>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4100
     * @tc.name testArrayFromTwo041
     * @tc.desc Verify Array.from can copy array-like numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(2, 3, 4);
      const arr = Array.from<number>(source);
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4200
     * @tc.name testArrayFromTwo042
     * @tc.desc Verify Array.from can copy an object with numeric keys and matching length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: StringArrayLike020 = new Array<string>('a', 'b', 'c');
      const result = Array.from<string>(source);
      expect(result.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4300
     * @tc.name testArrayFromTwo043
     * @tc.desc Verify Array.from can copy an array-like source containing an explicit undefined middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: OptionalNumberArrayLike020 = new Array<number | undefined>(
        3,
        (_index: int): number | undefined => undefined
      );
      source[0] = 1;
      source[2] = 3;
      const result = Array.from<number | undefined>(source);
      expect(result.length).assertEqual(3);
      expect(result[1] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4400
     * @tc.name testArrayFromTwo044
     * @tc.desc Verify Array.from can copy an array-like object with length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>();
      const result = Array.from<number>(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4500
     * @tc.name testArrayFromTwo045
     * @tc.desc Verify Array.from can copy an array-like object with one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Array.create<number>(1, 42);
      const result = Array.from<number>(source);
      expect(result.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4600
     * @tc.name testArrayFromTwo046
     * @tc.desc Verify Array.from can copy an array-like object with boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<boolean>(true, false);
      const result = Array.from<boolean>(source);
      expect(result.toString()).assertEqual('true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4700
     * @tc.name testArrayFromTwo047
     * @tc.desc Verify Array.from can copy an array-like object with bigint elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<bigint>(1n, 3n);
      const result = Array.from<bigint>(source);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4800
     * @tc.name testArrayFromTwo048
     * @tc.desc Verify Array.from can copy a source array with null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number | null>(1, null, 3);
      const result = Array.from<number | null>(source);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1] === null).assertTrue();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_4900
     * @tc.name testArrayFromTwo049
     * @tc.desc Verify Array.from can copy an array-like object with undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number | undefined>(1, undefined, 3);
      const result = Array.from<number | undefined>(source);
      expect(result[1] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5000
     * @tc.name testArrayFromTwo050
     * @tc.desc Verify Array.from can copy an array-like object with negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(-3, 0, 5);
      const result = Array.from<number>(source);
      expect(result.toString()).assertEqual('-3,0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5100
     * @tc.name testArrayFromTwo051
     * @tc.desc Verify Array.from can copy an array-like object with duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(2, 2, 2);
      const result = Array.from<number>(source);
      expect(result.toString()).assertEqual('2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5200
     * @tc.name testArrayFromTwo052
     * @tc.desc Verify Array.from can copy an array-like object containing object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new FromLikeObjA();
      const second = new FromLikeObjA();
      const source = new Array<FromLikeObjA>(first, second);
      const result = Array.from<FromLikeObjA>(source);
      expect(result[0] === first).assertTrue();
      expect(result[1] === second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5300
     * @tc.name testArrayFromTwo053
     * @tc.desc Verify Array.from can copy an array-like object after values are concatenated into a plain object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const merged = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      const result = Array.from<number>(merged);
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5400
     * @tc.name testArrayFromTwo054
     * @tc.desc Verify Array.from can copy an array-like object after reverse reordered the backing array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5500
     * @tc.name testArrayFromTwo055
     * @tc.desc Verify Array.from can copy an array-like object after sort reordered the backing array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5600
     * @tc.name testArrayFromTwo056
     * @tc.desc Verify Array.from can copy an array-like object after shift removed the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shift();
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5700
     * @tc.name testArrayFromTwo057
     * @tc.desc Verify Array.from can copy an array-like object after pop removed the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.pop();
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5800
     * @tc.name testArrayFromTwo058
     * @tc.desc Verify Array.from can copy an array-like object after shrinkTo truncated the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_5900
     * @tc.name testArrayFromTwo059
     * @tc.desc Verify Array.from can copy an array-like object after length reset and rebuild
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6000
     * @tc.name testArrayFromTwo060
     * @tc.desc Verify Array.from can copy an array-like object with a non-zero length and trailing empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<string>('head', '');
      const result = Array.from<string>(source);
      expect(result.toString()).assertEqual('head,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6100
     * @tc.name testArrayFromTwo061
     * @tc.desc Verify Array.from can copy an array-like object with unicode strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<string>('\u4E2D', '\u6587');
      const result = Array.from<string>(source);
      expect(result.toString()).assertEqual('\u4E2D,\u6587');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6200
     * @tc.name testArrayFromTwo062
     * @tc.desc Verify Array.from can copy an array-like object with zero-width space strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<string>('\u200B', 'x');
      const result = Array.from<string>(source);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('\u200B');
      expect(result[0].length).assertEqual(1);
      expect(result[1]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6300
     * @tc.name testArrayFromTwo063
     * @tc.desc Verify Array.from can copy an array-like object with Infinity and NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(Double.POSITIVE_INFINITY, Double.NaN);
      const result = Array.from<number>(source);
      expect(result[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(result[1] !== result[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6400
     * @tc.name testArrayFromTwo064
     * @tc.desc Verify Array.from can copy an array-like object backed by Array.of output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(7, 8, 9);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6500
     * @tc.name testArrayFromTwo065
     * @tc.desc Verify Array.from can copy an array-like object backed by a filtered array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value > 2);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6600
     * @tc.name testArrayFromTwo066
     * @tc.desc Verify Array.from can copy an array-like object backed by a sliced array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).slice(1, 4);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6700
     * @tc.name testArrayFromTwo067
     * @tc.desc Verify Array.from can copy an array-like object backed by a toReversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6800
     * @tc.name testArrayFromTwo068
     * @tc.desc Verify Array.from can copy an array-like object backed by a with replacement copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_6900
     * @tc.name testArrayFromTwo069
     * @tc.desc Verify Array.from can copy an array-like object backed by a toSpliced copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toSpliced(1, 2);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7000
     * @tc.name testArrayFromTwo070
     * @tc.desc Verify Array.from can copy an array-like object with a longer declared length than populated keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number | undefined>(4, (_index: int): number | undefined => undefined);
      source[0] = 1;
      source[3] = 4;
      const result = Array.from<number | undefined>(source);
      expect(result.length).assertEqual(4);
      expect(result[1] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7100
     * @tc.name testArrayFromTwo071
     * @tc.desc Verify Array.from can copy an array-like object without mutating the source fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(4, 5, 6);
      const result = Array.from<number>(source);
      expect(result.toString()).assertEqual('4,5,6');
      expect(source[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7200
     * @tc.name testArrayFromTwo072
     * @tc.desc Verify Array.from can copy an array-like object whose length is computed from another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 8, 7);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('9,8,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7300
     * @tc.name testArrayFromTwo073
     * @tc.desc Verify Array.from can copy an array-like object with only the last populated key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: OptionalNumberArrayLike020 = new Array<number | undefined>(
        3,
        (_index: int): number | undefined => undefined
      );
      source[2] = 9;
      const result = Array.from<number | undefined>(source);
      expect(result[0] === undefined).assertTrue();
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7400
     * @tc.name testArrayFromTwo074
     * @tc.desc Verify Array.from can copy an array-like object with many generated keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(0, 1, 2, 3, 4, 5);
      const result = Array.from<number>(source);
      expect(result.toString()).assertEqual('0,1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7500
     * @tc.name testArrayFromTwo075
     * @tc.desc Verify Array.from can copy an array-like object with values rebuilt after concat and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4)).slice(1, 4);
      const result = Array.from<number>(arr);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7600
     * @tc.name testArrayFromTwo076
     * @tc.desc Verify Array.from can copy an array-like object with explicit zero length even if keys exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2);
      source.length = 0;
      const result = Array.from<number>(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7700
     * @tc.name testArrayFromTwo077
     * @tc.desc Verify Array.from can copy an array-like object with character strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<string>('A', 'B', 'C');
      const result = Array.from<string>(source);
      expect(result.toString()).assertEqual('A,B,C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7800
     * @tc.name testArrayFromTwo078
     * @tc.desc Verify Array.from can copy an array-like object with alternating number and string union values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number | string>(1, 'two', 3);
      const result = Array.from<number | string>(source);
      expect(result.toString()).assertEqual('1,two,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_7900
     * @tc.name testArrayFromTwo079
     * @tc.desc Verify Array.from can copy an array-like object with large boundary magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1000, 0, -1000);
      const result = Array.from<number>(source);
      expect(result.toString()).assertEqual('1000,0,-1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_8000
     * @tc.name testArrayFromTwo080
     * @tc.desc Verify Array.from can copy values from a Uint8Array subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Uint8Array([10, 20, 30, 40]);
      const source = base.subarray(1, 3);
      const result = Array.from<number>(source);
      source[0] = 99;
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('20,30');
      expect(base.toString()).assertEqual('10,99,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_8100
     * @tc.name testArrayFromTwo081
     * @tc.desc Verify Array.from can copy values from an Int16Array source containing negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Int16Array([-3, 0, 5]);
      const result = Array.from<number>(source);
      expect(result.toString()).assertEqual('-3,0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_8200
     * @tc.name testArrayFromTwo082
     * @tc.desc Verify repeated Array.from calls on the same typed array source return independent arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Uint8Array([4, 5, 6]);
      const first = Array.from<number>(source);
      const second = Array.from<number>(source);
      first[0] = 99;
      expect(source[0]).assertEqual(4);
      expect(second[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_8300
     * @tc.name testArrayFromTwo083
     * @tc.desc Verify Array.from returns a mutable result array that can be updated and extended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2);
      const result = Array.from<number>(source);
      result[0] = 9;
      result.push(3);
      expect(result.toString()).assertEqual('9,2,3');
      expect(source.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_8400
     * @tc.name testArrayFromTwo084
     * @tc.desc Verify Array.from throws ClassCastError when the array-like source is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeArrayFromArrayLike(null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_8500
     * @tc.name testArrayFromTwo085
     * @tc.desc Verify Array.from throws ClassCastError when the array-like source is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeArrayFromArrayLike(undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_TWO_8600
     * @tc.name testArrayFromTwo086
     * @tc.desc Verify Array.from throws ClassCastError when the array-like source is a non-iterable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalid = new FromLikeObjA();
      try {
        invokeArrayFromArrayLike(invalid);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

  });
}

