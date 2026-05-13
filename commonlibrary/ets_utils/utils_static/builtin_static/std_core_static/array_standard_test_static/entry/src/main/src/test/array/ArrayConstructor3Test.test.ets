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
  afterAll, afterEach, beforeAll, beforeEach, describe,
  expect, it, Level, Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Item013 {
  value: number;

  constructor(v: number) {
    this.value = v;
  }
}

interface Point014 {
  x: number;
  y: number;
}

class ComplexItem034 {
  data: number;

  constructor(d: number) {
    this.data = d;
  }
}

function buildThousandsSource(): Array<number> {
  const source = new Array<number>();
  for (let i = 1; i <= 1000; i++) {
    source.pushOne(i);
  }
  return source;
}

function buildWeekDays(): Array<string> {
  return new Array<string>(
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  );
}

export default function ArrayConstructor3Test(): void {
  describe('ArrayConstructor3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0100
     * @tc.name testArrayConstructor3001
     * @tc.desc Verify the element-initializing overload accepts one non-number element or multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('one');
      expect(arr1.length).assertEqual(1);
      expect(arr1[0]).assertEqual('one');

      const arr2 = new Array<number>(1, 2, 3);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0200
     * @tc.name testArrayConstructor3002
     * @tc.desc Verify the first element can be initialized with common primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>(42, 43);
      expect(numArr[0]).assertEqual(42);

      const strArr = new Array<string>('hello');
      expect(strArr[0]).assertEqual('hello');

      const boolArr = new Array<boolean>(true);
      expect(boolArr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0300
     * @tc.name testArrayConstructor3003
     * @tc.desc Verify zero can be used as the first initialized element when multiple arguments are present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0400
     * @tc.name testArrayConstructor3004
     * @tc.desc Verify an empty string can be used as the first initialized element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('');
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0500
     * @tc.name testArrayConstructor3005
     * @tc.desc Verify false can be used as the first initialized element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false);
      expect(arr[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0600
     * @tc.name testArrayConstructor3006
     * @tc.desc Verify negative numbers can be used as initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-100, -200);
      expect(arr[0]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0700
     * @tc.name testArrayConstructor3007
     * @tc.desc Verify null can be used as an initialized element in a nullable array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null);
      expect(arr[0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0800
     * @tc.name testArrayConstructor3008
     * @tc.desc Verify undefined can be used as an initialized element in an optional array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined);
      expect(arr[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_0900
     * @tc.name testArrayConstructor3009
     * @tc.desc Verify NaN can be used as an initialized numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, 1);
      expect(arr[0] != arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1000
     * @tc.name testArrayConstructor3010
     * @tc.desc Verify Infinity can be used as an initialized numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Infinity, 1);
      expect(arr[0]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1100
     * @tc.name testArrayConstructor3011
     * @tc.desc Verify negative Infinity can be used as an initialized numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-Infinity, 1);
      expect(arr[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1200
     * @tc.name testArrayConstructor3012
     * @tc.desc Verify Number.MAX_VALUE can be used as an initialized numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Number.MAX_VALUE, 1);
      expect(arr[0]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1300
     * @tc.name testArrayConstructor3013
     * @tc.desc Verify Number.MIN_VALUE can be used as an initialized numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Number.MIN_VALUE, 1);
      expect(arr[0]).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1400
     * @tc.name testArrayConstructor3014
     * @tc.desc Verify object instances can be used as initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item013>(new Item013(1));
      expect(arr[0].value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1500
     * @tc.name testArrayConstructor3015
     * @tc.desc Verify interface-based objects can be used as initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point014>({ x: 1, y: 2 });
      expect(arr[0].x).assertEqual(1);
      expect(arr[0].y).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1600
     * @tc.name testArrayConstructor3016
     * @tc.desc Verify nested arrays can be passed as initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1700
     * @tc.name testArrayConstructor3017
     * @tc.desc Verify the variadic parameter list preserves all provided elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1800
     * @tc.name testArrayConstructor3018
     * @tc.desc Verify omitting rest parameters still creates a one-element array for non-number first values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('forty-two');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('forty-two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_1900
     * @tc.name testArrayConstructor3019
     * @tc.desc Verify a single initialized element is equivalent to an empty rest parameter list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2000
     * @tc.name testArrayConstructor3020
     * @tc.desc Verify union-typed variadic parameters preserve mixed values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'two', 3, 'four');
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual('four');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2100
     * @tc.name testArrayConstructor3021
     * @tc.desc Verify null values can appear inside variadic initialized arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2200
     * @tc.name testArrayConstructor3022
     * @tc.desc Verify undefined values can appear inside variadic initialized arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2300
     * @tc.name testArrayConstructor3023
     * @tc.desc Verify zero values can appear inside variadic initialized arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 0, 3);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2400
     * @tc.name testArrayConstructor3024
     * @tc.desc Verify empty strings can appear inside variadic initialized arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'c');
      expect(arr[1]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2500
     * @tc.name testArrayConstructor3025
     * @tc.desc Verify false values can appear inside variadic initialized arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2600
     * @tc.name testArrayConstructor3026
     * @tc.desc Verify the variadic constructor handles a larger fixed set of initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(arr.length).assertEqual(10);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2700
     * @tc.name testArrayConstructor3027
     * @tc.desc Verify the variadic constructor handles exactly two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2800
     * @tc.name testArrayConstructor3028
     * @tc.desc Verify the variadic constructor returns an Array instance containing every argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_2900
     * @tc.name testArrayConstructor3029
     * @tc.desc Verify the variadic constructor returns different lengths based on argument count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('one');
      expect(arr1.length).assertEqual(1);

      const arr2 = new Array<number>(1, 2);
      expect(arr2.length).assertEqual(2);

      const arr3 = new Array<number>(1, 2, 3, 4, 5);
      expect(arr3.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3000
     * @tc.name testArrayConstructor3030
     * @tc.desc Verify the variadic constructor preserves declared generic element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>(1, 2, 3);
      const strArr = new Array<string>('a', 'b', 'c');
      const boolArr = new Array<boolean>(true, false);
      expect(numArr.length).assertEqual(3);
      expect(strArr.length).assertEqual(3);
      expect(boolArr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3100
     * @tc.name testArrayConstructor3031
     * @tc.desc Verify multiple initialized elements preserve order and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3200
     * @tc.name testArrayConstructor3032
     * @tc.desc Verify arrays can be initialized with identical repeated element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 5, 5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3300
     * @tc.name testArrayConstructor3033
     * @tc.desc Verify number arrays can be initialized directly with element lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3400
     * @tc.name testArrayConstructor3034
     * @tc.desc Verify string arrays can be initialized directly with element lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world', '!');
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
      expect(arr[2]).assertEqual('!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3500
     * @tc.name testArrayConstructor3035
     * @tc.desc Verify boolean arrays can be initialized directly with element lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3600
     * @tc.name testArrayConstructor3036
     * @tc.desc Verify custom class arrays can be initialized directly with object lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item013>(new Item013(1), new Item013(2), new Item013(3));
      expect(arr.length).assertEqual(3);
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(2);
      expect(arr[2].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3700
     * @tc.name testArrayConstructor3037
     * @tc.desc Verify interface arrays can be initialized directly with object lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point014>({ x: 1, y: 2 }, { x: 3, y: 4 }, { x: 5, y: 6 });
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].y).assertEqual(4);
      expect(arr[2].x).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3800
     * @tc.name testArrayConstructor3038
     * @tc.desc Verify union arrays can be initialized directly with mixed element lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'two', 3, 'four', 5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual('four');
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_3900
     * @tc.name testArrayConstructor3039
     * @tc.desc Verify two-dimensional arrays can be initialized directly with nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4), new Array<number>(5, 6));
      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[0][1]).assertEqual(2);
      expect(arr[1][0]).assertEqual(3);
      expect(arr[2][1]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4000
     * @tc.name testArrayConstructor3040
     * @tc.desc Verify three-dimensional arrays can be initialized directly with nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<Array<number>>>(
        new Array<Array<number>>(
          new Array<number>(1, 2),
          new Array<number>(3, 4)
        )
      );
      expect(arr[0][0][0]).assertEqual(1);
      expect(arr[0][1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4100
     * @tc.name testArrayConstructor3041
     * @tc.desc Verify constructor behavior changes predictably as the argument count increases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('one');
      const arr2 = new Array<number>(1, 2);
      const arr3 = new Array<number>(1, 2, 3);
      const arr4 = new Array<number>(1, 2, 3, 4);

      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(2);
      expect(arr3.length).assertEqual(3);
      expect(arr4.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4200
     * @tc.name testArrayConstructor3042
     * @tc.desc Verify the variadic constructor accepts elements expanded from an existing array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = new Array<number>(source[0], source[1], source[2]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4300
     * @tc.name testArrayConstructor3043
     * @tc.desc Verify the variadic constructor accepts a mix of expanded arrays and direct elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const part1 = new Array<number>(1, 2);
      const part2 = new Array<number>();
      part2.pushOne(5);
      const arr = new Array<number>(part1[0], part1[1], 3, 4, part2[0]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4400
     * @tc.name testArrayConstructor3044
     * @tc.desc Verify multiple numeric parameters are treated as initialized elements rather than a length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 10, 15);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4500
     * @tc.name testArrayConstructor3045
     * @tc.desc Verify a single numeric argument selects the length overload while multiple
     * numeric arguments select element initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(5);
      expect(arr1.length).assertEqual(5);

      const arr2 = new Array<number>(5, 10);
      expect(arr2.length).assertEqual(2);
      expect(arr2[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4600
     * @tc.name testArrayConstructor3046
     * @tc.desc Verify union element types allow mixed values while preserving order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixedArr = new Array<number | string>(1, 'string', 3);
      expect(mixedArr[1]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4700
     * @tc.name testArrayConstructor3047
     * @tc.desc Verify overload selection differs for zero arguments, one numeric argument, and multiple arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr0 = new Array<number>();
      expect(arr0.length).assertEqual(0);

      const arr1 = new Array<number>(5);
      expect(arr1.length).assertEqual(5);

      const arr3 = new Array<number>(1, 2, 3);
      expect(arr3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4800
     * @tc.name testArrayConstructor3048
     * @tc.desc Verify arrays can be initialized directly when all element values are already known
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weekDays = buildWeekDays();
      expect(weekDays.length).assertEqual(7);
      expect(weekDays[0]).assertEqual('Monday');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_4900
     * @tc.name testArrayConstructor3049
     * @tc.desc Verify element-initializing constructor usage remains type-safe at compile time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>(1, 2, 3);
      const strArr = new Array<string>('a', 'b', 'c');
      expect(numArr.length).assertEqual(3);
      expect(strArr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5000
     * @tc.name testArrayConstructor3050
     * @tc.desc Verify all initialized elements must match the declared generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const itemArr = new Array<Item013>(new Item013(1), new Item013(2), new Item013(3));
      expect(itemArr[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5100
     * @tc.name testArrayConstructor3051
     * @tc.desc Verify the variadic constructor can accept a large expanded list of initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = buildThousandsSource();
      expect(source.length).assertEqual(1000);
      expect(source[0]).assertEqual(1);
      expect(source[999]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_THREE_5200
     * @tc.name testArrayConstructor3052
     * @tc.desc Verify arrays can be initialized directly with multiple complex objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor3052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ComplexItem034>(new ComplexItem034(1), new ComplexItem034(2), new ComplexItem034(3));
      expect(arr.length).assertEqual(3);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i].data).assertEqual(i + 1);
      }
    });
  });
}
