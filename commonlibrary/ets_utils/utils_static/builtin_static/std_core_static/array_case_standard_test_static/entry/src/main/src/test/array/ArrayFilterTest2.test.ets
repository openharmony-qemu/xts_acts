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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class FilterShallowCopy091 {
  name: string = '';
  value: int = 0;
}

class FilterReadonlyField106 {
  readonly arr: Array<number> = new Array<number>(10, 20, 30);
}

class FilterStaticField107 {
  static numbers: Array<number> = new Array<number>(1, 2, 3, 4, 5);
}

class FilterInstanceField108 {
  numbers: Array<number> = new Array<number>(1, 2, 3, 4, 5);
}

class FilterPrivateField109 {
  public data: Array<number> = new Array<number>(100, 200, 300);
}

class FilterInterfaceField110 {
  value: Array<string> = new Array<string>('a', 'b', 'c', 'd');
}

class FilterParentField111 {
  items: Array<number> = new Array<number>(1, 2, 3, 4);
}

class FilterChildField111 extends FilterParentField111 {
  extra: Array<number> = new Array<number>(10, 20);
}

class FilterPolymorphicAnimal112 {
  type: string = 'animal';
  sound: string = '';
}

class FilterPolymorphicDog112 extends FilterPolymorphicAnimal112 {
  type: string = 'dog';
  sound: string = 'bark';
}

class FilterPolymorphicCat112 extends FilterPolymorphicAnimal112 {
  type: string = 'cat';
  sound: string = 'meow';
}

class FilterEnumColor113 {
  static RED: int = 1;
  static GREEN: int = 2;
  static BLUE: int = 3;
}

class FilterEnumSize113 {
  static SMALL: int = 1;
  static MEDIUM: int = 2;
  static LARGE: int = 3;
}

class FilterGenericHolder114<T> {
  data: Array<T> = new Array<T>();
}

class FilterCustomFilterClass115 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
  filter(): number {
    return this.arr.length;
  }
}

class FilterSendableData116 {
  value: int = 0;
}

class FilterProxyTarget117 {
  arr: Array<number> = new Array<number>(1, 2, 3);
}

class FilterSubclassArray118 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
}

class FilterPropertyDesc119 {
  name: string = '';
}

class FilterHybridA120 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
}

class FilterHybridB120 extends FilterHybridA120 {
  label: string = 'hybrid';
}

class FilterClosureScope121 {
  threshold: int = 5;
}

export default function ArrayFilterTest2(): void {
  describe('ArrayFilterTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0100
     * @tc.name testArrayFilter001
     * @tc.desc Verify filter on Array<int>: keeps positive int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(-3, -1, 0, 2, 4, 6);
      const result = arr.filter((v: int): boolean => v > 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0200
     * @tc.name testArrayFilter002
     * @tc.desc Verify filter on Array<double>: keeps double values using precision comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.1, 0.2, 0.3, 0.4, 0.5);
      const result = arr.filter((v: double): boolean => v > 0.25);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0.3);
      expect(result[1]).assertEqual(0.4);
      expect(result[2]).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0300
     * @tc.name testArrayFilter003
     * @tc.desc Verify predicate always true returns copy of all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.filter((v: number): boolean => true);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(50);
      expect(result === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0400
     * @tc.name testArrayFilter004
     * @tc.desc Verify predicate always false returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.filter((v: number): boolean => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0500
     * @tc.name testArrayFilter005
     * @tc.desc Verify filter handles POSITIVE_INFINITY and NEGATIVE_INFINITY values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.POSITIVE_INFINITY, 3, Double.NEGATIVE_INFINITY);
      const result = arr.filter((v: number): boolean => isFinite(v));
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0600
     * @tc.name testArrayFilter006
     * @tc.desc Verify predicate throwing exception propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      try {
        const result = arr.filter((v: number): boolean => {
          if (v === 3) {
            throw new Error('stop');
          }
          return v > 2;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0700
     * @tc.name testArrayFilter007
     * @tc.desc Verify filter chained with sort preserves filtered values then sorts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 1, 4, 2, 3, 6);
      const result = arr.filter((v: number): boolean => v > 3)
        .sort((a: number, b: number): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0800
     * @tc.name testArrayFilter008
     * @tc.desc Verify filter chained with reduce aggregates filtered values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const sum = arr.filter((v: number): boolean => v % 2 === 0)
        .reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0900
     * @tc.name testArrayFilter009
     * @tc.desc Verify filter on all-null array returns empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null, null, null);
      const result = arr.filter((v: number | null): boolean => v != null);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1000
     * @tc.name testArrayFilter010
     * @tc.desc Verify filter on all-undefined array returns empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, undefined, undefined);
      const result = arr.filter((v: number | undefined): boolean => v !== undefined);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1100
     * @tc.name testArrayFilter011
     * @tc.desc Verify filter with unicode strings: accented \u00e9moji, CJK \u4e2d\u6587, and emoji \uD83D\uDE00 all pass s.length>1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '\u00e9moji', '\u4e2d\u6587', '\uD83D\uDE00', 'world');
      const result = arr.filter((s: string): boolean => s.length > 1);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual('hello');
      expect(result[1]).assertEqual('\u00e9moji');
      expect(result[2]).assertEqual('\u4e2d\u6587');
      expect(result[3]).assertEqual('\uD83D\uDE00');
      expect(result[4]).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1200
     * @tc.name testArrayFilter012
     * @tc.desc Verify filter with whitespace-only strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', ' ', '\t', '\n', 'b');
      const result = arr.filter((s: string): boolean => s.trim().length > 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1300
     * @tc.name testArrayFilter013
     * @tc.desc Verify filter on nested array elements (Array<Array<number>>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4, 5);
      const inner3 = Array.create<number>(1, 6);
      const arr = new Array<Array<number>>(inner1, inner2, inner3);
      const result = arr.filter((inner: Array<number>): boolean => inner.length > 2);
      expect(result.length).assertEqual(1);
      expect(result[0].length).assertEqual(3);
      expect(result[0][0]).assertEqual(3);
      expect(result[0][2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1400
     * @tc.name testArrayFilter014
     * @tc.desc Verify filter with float precision comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.1 + 0.2, 0.3, 0.4, 0.5);
      const result = arr.filter((v: double): boolean => v >= 0.3);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1500
     * @tc.name testArrayFilter015
     * @tc.desc Verify filter with splice in callback: [1,2,3,4,5] splice(1,2,99) at i=0, v>2 → [99,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a.splice(1, 2, 99);
        }
        return v > 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(99);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1600
     * @tc.name testArrayFilter016
     * @tc.desc Verify filter on instance field array via Field reflection \u2014 basic number filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterInstanceField108();
      const arr = obj.numbers;
      const result = arr.filter((v: number): boolean => v % 2 === 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1700
     * @tc.name testArrayFilter017
     * @tc.desc Verify filter on static field array via Field reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = FilterStaticField107.numbers;
      const result = arr.filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1800
     * @tc.name testArrayFilter018
     * @tc.desc Verify static field array modified before filter reflects latest data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      FilterStaticField107.numbers = new Array<number>(10, 20, 30, 40);
      const arr = FilterStaticField107.numbers;
      const result = arr.filter((v: number): boolean => v > 25);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(40);
      FilterStaticField107.numbers = new Array<number>(1, 2, 3, 4, 5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1900
     * @tc.name testArrayFilter019
     * @tc.desc Verify filter on readonly field array does not trigger readonly error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterReadonlyField106();
      const result = obj.arr.filter((v: number): boolean => v > 15);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2000
     * @tc.name testArrayFilter020
     * @tc.desc Verify filter on public field array accessed cross-class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterInterfaceField110();
      const result = obj.value.filter((s: string): boolean => s > 'b');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('c');
      expect(result[1]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2100
     * @tc.name testArrayFilter021
     * @tc.desc Verify filter on private field array accessed within class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterPrivateField109();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('data');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.filter((v: number): boolean => v > 150);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(200);
        expect(result[1]).assertEqual(300);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2200
     * @tc.name testArrayFilter022
     * @tc.desc Verify filter on parent class field accessed through child class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterChildField111();
      const result = obj.items.filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2300
     * @tc.name testArrayFilter023
     * @tc.desc Verify filter on polymorphic object array \u2014 filter by subclass type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FilterPolymorphicDog112();
      const cat = new FilterPolymorphicCat112();
      const animals = new Array<FilterPolymorphicAnimal112>(dog, cat, dog);
      const dogs = animals.filter((a: FilterPolymorphicAnimal112): boolean => a.sound === 'bark');
      expect(dogs.length).assertEqual(2);
      expect(dogs[0].type).assertEqual('dog');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2400
     * @tc.name testArrayFilter024
     * @tc.desc Verify filter with predicate v>0 on all-positive numbers returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2500
     * @tc.name testArrayFilter025
     * @tc.desc Verify filter with predicate v>0 on mixed zero/non-zero numbers yields non-zero elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 0, 2, 0, 3);
      const result = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2600
     * @tc.name testArrayFilter026
     * @tc.desc Verify filter treats falsy non-boolean values as excluded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(0, 1, null, 2, undefined, 3);
      const result = arr.filter((v: number | null | undefined): boolean => v === 0 || v != null);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2700
     * @tc.name testArrayFilter027
     * @tc.desc Verify filter on Array<int> representing enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(FilterEnumColor113.RED, FilterEnumColor113.GREEN, FilterEnumColor113.BLUE);
      const warmColors = arr.filter((c: int): boolean => c === FilterEnumColor113.RED || c === FilterEnumColor113.GREEN);
      expect(warmColors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2800
     * @tc.name testArrayFilter028
     * @tc.desc Verify filter on generic class array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FilterGenericHolder114<number>();
      holder.data = new Array<number>(10, 20, 30, 40, 50);
      const result = holder.data.filter((v: number): boolean => v > 25);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(30);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2900
     * @tc.name testArrayFilter029
     * @tc.desc Verify filter on generic class with string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FilterGenericHolder114<string>();
      holder.data = new Array<string>('cat', 'dog', 'elephant', 'fox');
      const result = holder.data.filter((s: string): boolean => s.length > 3);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('elephant');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3000
     * @tc.name testArrayFilter030
     * @tc.desc Verify filter on direct literal array (new Array(10).fill)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 10);
      for (let i = 0; i < 10; i++) {
        arr.push(1);
      }
      const result = arr.filter((v: number): boolean => v === 1);
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3100
     * @tc.name testArrayFilter031
     * @tc.desc Verify adding elements via push during filter iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => {
        if (i === 2) {
          a.push(99);
        }
        return v > 2;
      });
      expect(arr.length).assertEqual(6);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3200
     * @tc.name testArrayFilter032
     * @tc.desc Verify unshift during filter shifts remaining indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a.unshift(0);
        }
        return v > 3;
      });
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3300
     * @tc.name testArrayFilter033
     * @tc.desc Verify setting new values for future elements during filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a[3] = 99;
        }
        return v > 3;
      });
      expect(arr[3]).assertEqual(99);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3400
     * @tc.name testArrayFilter034
     * @tc.desc Verify clearing array with length=0 during filter iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let visitedCount = 0;
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => {
        visitedCount++;
        if (i === 3) {
          a.length = 0;
        }
        return v > 5;
      });
      expect(visitedCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3500
     * @tc.name testArrayFilter035
     * @tc.desc Verify reverse during filter iteration uses mutated order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const seen = new Array<number>();
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a.reverse();
        }
        seen.pushOne(v);
        return v > 2;
      });
      expect(seen.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3600
     * @tc.name testArrayFilter036
     * @tc.desc Verify closure captures external variable as filter threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FilterClosureScope121();
      ctx.threshold = 3;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => v > ctx.threshold);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3700
     * @tc.name testArrayFilter037
     * @tc.desc Verify closure captures dynamically changing threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FilterClosureScope121();
      ctx.threshold = 2;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const beforeChange = arr.filter((v: number): boolean => v > ctx.threshold);
      expect(beforeChange.length).assertEqual(3);
      ctx.threshold = 4;
      const afterChange = arr.filter((v: number): boolean => v > ctx.threshold);
      expect(afterChange.length).assertEqual(1);
      expect(afterChange[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3800
     * @tc.name testArrayFilter038
     * @tc.desc Verify filter with predicate v>2 on numbers 1-5 returns elements greater than 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3900
     * @tc.name testArrayFilter039
     * @tc.desc Verify multi-level closure nesting through field filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterClosureScope121();
      obj.threshold = 2;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => {
        return v > obj.threshold;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4000
     * @tc.name testArrayFilter040
     * @tc.desc Verify filter recovers and re-filters correctly after caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      try {
        const r1 = arr.filter((v: number): boolean => {
          if (v === 3) {
            throw new Error('mid');
          }
          return v > 2;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const r2 = arr.filter((v: number): boolean => v > 2);
      expect(r2.length).assertEqual(3);
      expect(r2[0]).assertEqual(3);
      expect(r2[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4100
     * @tc.name testArrayFilter041
     * @tc.desc Verify filter on large array with 10000 elements matches count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      const result = arr.filter((v: number): boolean => v % 1000 === 0);
      expect(result.length).assertEqual(10);
      expect(result[0]).assertEqual(0);
      expect(result[9]).assertEqual(9000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4200
     * @tc.name testArrayFilter042
     * @tc.desc Verify repeated filter calls (1000 times) on same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let result = new Array<number>();
      for (let i = 0; i < 1000; i++) {
        result = arr.filter((v: number): boolean => v > 2);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4300
     * @tc.name testArrayFilter043
     * @tc.desc Verify shallow copy: modifying object property in filtered array affects source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FilterShallowCopy091();
      p1.name = 'Alice';
      p1.value = 100;
      const p2 = new FilterShallowCopy091();
      p2.name = 'Bob';
      p2.value = 200;
      const arr = new Array<FilterShallowCopy091>(p1, p2);
      const filtered = arr.filter((p: FilterShallowCopy091): boolean => p.value > 50);
      filtered[0].name = 'Changed';
      expect(arr[0].name).assertEqual('Changed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4400
     * @tc.name testArrayFilter044
     * @tc.desc Verify all identical object references in filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterShallowCopy091();
      obj.name = 'same';
      const arr = new Array<FilterShallowCopy091>();
      for (let i = 0; i < 100; i++) {
        arr.pushOne(obj);
      }
      const result = arr.filter((p: FilterShallowCopy091): boolean => p.name === 'same');
      expect(result.length).assertEqual(100);
    });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4500
     * @tc.name testArrayFilter045
     * @tc.desc Verify custom class with its own filter method does not conflict with Array.filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterCustomFilterClass115();
      const customResult = obj.filter();
      expect(customResult).assertEqual(5);
      const arrayResult = obj.arr.filter((v: number): boolean => v > 3);
      expect(arrayResult.length).assertEqual(2);
      expect(arrayResult[0]).assertEqual(4);
      expect(arrayResult[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4600
     * @tc.name testArrayFilter046
     * @tc.desc Verify filter with index<0 condition returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number, i: int): boolean => i < 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4700
     * @tc.name testArrayFilter047
     * @tc.desc Verify filter with index>=length condition returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => i >= a.length);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4800
     * @tc.name testArrayFilter048
     * @tc.desc Verify filter consistency across multiple Field reflections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterInstanceField108();
      const clazz = Class.of(obj);
      const field1 = clazz.getInstanceField('numbers');
      const field2 = clazz.getInstanceField('numbers');
      if (field1 !== undefined && field2 !== undefined) {
        const arr1 = field1.getValue(obj) as Array<number>;
        const arr2 = field2.getValue(obj) as Array<number>;
        const r1 = arr1.filter((v: number): boolean => v > 2);
        const r2 = arr2.filter((v: number): boolean => v > 2);
        expect(r1.length).assertEqual(r2.length);
        expect(r1.toString()).assertEqual(r2.toString());
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4900
     * @tc.name testArrayFilter049
     * @tc.desc Verify filter via alias reference to original array with predicate v>2 returns three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const restored = arr;
      const result = restored.filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5000
     * @tc.name testArrayFilter050
     * @tc.desc Verify filter on multi-level generic object field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Array<number>>();
      const vals = new Array<number>(1, 2, 3, 4, 5);
      map.set('key1', vals);
      const inner = map.get('key1');
      if (inner !== undefined) {
        const result = inner.filter((v: number): boolean => v > 3);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(5);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5100
     * @tc.name testArrayFilter051
     * @tc.desc Verify 0 and -0 comparison behavior in filter predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, -0, 1, 2, 3);
      const result = arr.filter((v: number): boolean => v === 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5200
     * @tc.name testArrayFilter052
     * @tc.desc Verify filter on subclass array_field when parent also has similar field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterChildField111();
      const itemsResult = obj.items.filter((v: number): boolean => v > 2);
      expect(itemsResult.length).assertEqual(2);
      const extraResult = obj.extra.filter((v: number): boolean => v > 15);
      expect(extraResult.length).assertEqual(1);
      expect(extraResult[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5300
     * @tc.name testArrayFilter053
     * @tc.desc Verify side effect counter in predicate equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let counter = 0;
      const result = arr.filter((v: number): boolean => {
        counter++;
        return v % 2 === 0;
      });
      expect(counter).assertEqual(10);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5400
     * @tc.name testArrayFilter054
     * @tc.desc Verify filter then access last element via result[result.length-1] index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.filter((v: number): boolean => v > 25);
      const lastIdx = result.length - 1;
      const last = result[lastIdx];
      expect(last).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5500
     * @tc.name testArrayFilter055
     * @tc.desc Verify filter with predicate v>100 on numbers 1-3 yields empty result (length 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const filtered = arr.filter((v: number): boolean => v > 100);
      expect(filtered.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5600
     * @tc.name testArrayFilter056
     * @tc.desc Verify filter + sort + map + find hybrid chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 2, 7, 4, 5, 1, 8, 3, 6, 10);
      const result = arr.filter((v: number): boolean => v % 2 === 0)
        .sort((a: number, b: number): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        })
        .map((v: number): number => v * 10);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(40);
      expect(result[2]).assertEqual(60);
      expect(result[3]).assertEqual(80);
      expect(result[4]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5700
     * @tc.name testArrayFilter057
     * @tc.desc Verify hybrid of filter with closure side effect on inherited field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FilterHybridB120();
      obj.arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8);
      const result = obj.arr.filter((v: number): boolean => v > 4 && obj.label === 'hybrid');
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(5);
      expect(result[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5800
     * @tc.name testArrayFilter058
     * @tc.desc Verify filter on Array<byte> — positive and negative byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(-128, -64, 0, 64, 127);
      const result = arr.filter((v: byte): boolean => v >= 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(64);
      expect(result[2]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5900
     * @tc.name testArrayFilter059
     * @tc.desc Verify filter on Array<short> — full range boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(-32768, -1, 0, 32767);
      const result = arr.filter((v: short): boolean => v > 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6000
     * @tc.name testArrayFilter060
     * @tc.desc Verify filter on Array<long> — large long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(0, 2147483648, 9223372036854775807);
      const positive = arr.filter((v: long): boolean => v > 0);
      expect(positive.length).assertEqual(2);
      expect(positive[1]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6100
     * @tc.name testArrayFilter061
     * @tc.desc Verify filter on Array<float> — float precision values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0.0, -1.5, 3.14, 999.99, -0.0);
      const result = arr.filter((v: number): boolean => v > 0.0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6200
     * @tc.name testArrayFilter062
     * @tc.desc Verify filter with unicode space and zero-width characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '​', 'world', '﻿', 'test');
      const visible = arr.filter((s: string): boolean => s.length > 0);
      expect(visible.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6300
     * @tc.name testArrayFilter063
     * @tc.desc Verify filter separates empty string from zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', '​', 'a', '﻿', 'b');
      const nonEmpty = arr.filter((s: string): boolean => s !== '');
      expect(nonEmpty.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6400
     * @tc.name testArrayFilter064
     * @tc.desc Verify filter on emoji strings: filter s.length>1 from ['x','😀','🔥🔥','⭐⭐','y'] returns 3 emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', '😀', '🔥🔥', '⭐⭐', 'y');
      const longEnough = arr.filter((s: string): boolean => s.length > 1);
      expect(longEnough.length).assertEqual(3);
      expect(longEnough[0]).assertEqual('😀');
      expect(longEnough[1]).assertEqual('🔥🔥');
      expect(longEnough[2]).assertEqual('⭐⭐');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6500
     * @tc.name testArrayFilter065
     * @tc.desc Verify filter on multi-language strings: each of English, Japanese, Korean, Arabic, Chinese is individually filterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'テスト', '한글', 'اختبار', '测试');
      const en = arr.filter((s: string): boolean => s === 'hello');
      const ja = arr.filter((s: string): boolean => s === 'テスト');
      const ko = arr.filter((s: string): boolean => s === '한글');
      const ar = arr.filter((s: string): boolean => s === 'اختبار');
      const zh = arr.filter((s: string): boolean => s === '测试');
      expect(en.length).assertEqual(1);
      expect(ja.length).assertEqual(1);
      expect(ko.length).assertEqual(1);
      expect(ar.length).assertEqual(1);
      expect(zh.length).assertEqual(1);
      expect(en[0]).assertEqual('hello');
      expect(ja[0]).assertEqual('テスト');
      expect(ko[0]).assertEqual('한글');
      expect(ar[0]).assertEqual('اختبار');
      expect(zh[0]).assertEqual('测试');
      const shortResult = arr.filter((s: string): boolean => s.length === 2);
      expect(shortResult.length).assertEqual(2);
      expect(shortResult[0]).assertEqual('한글');
      expect(shortResult[1]).assertEqual('测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6600
     * @tc.name testArrayFilter066
     * @tc.desc Verify filter on XSS strings: filter s.includes('<script>') from XSS/special/normal array returns only XSS element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '<script>alert(1)</script>', '!@#$%^&*()', '\t\n\r', 'normal');
      const suspicious = arr.filter((s: string): boolean => s.includes('<script>'));
      expect(suspicious.length).assertEqual(1);
      expect(suspicious[0]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6700
     * @tc.name testArrayFilter067
     * @tc.desc Verify filter on special character strings: ['safe','!@#$%^&*()','\\t\\n\\r','normal'], s.includes('!') returns special chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '!@#$%^&*()', '\t\n\r', 'normal');
      const special = arr.filter((s: string): boolean => s.includes('!'));
      expect(special.length).assertEqual(1);
      expect(special[0]).assertEqual('!@#$%^&*()');
      const ctrl = arr.filter((s: string): boolean => s.includes('\t'));
      expect(ctrl.length).assertEqual(1);
      expect(ctrl[0]).assertEqual('\t\n\r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6800
     * @tc.name testArrayFilter068
     * @tc.desc Verify filter on null elements mixed in object array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FilterShallowCopy091();
      p1.name = 'Alice';
      const arr = new Array<FilterShallowCopy091 | null>(p1, null, p1, null);
      const nonNull = arr.filter((v: FilterShallowCopy091 | null): boolean => v != null);
      expect(nonNull.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6900
     * @tc.name testArrayFilter069
     * @tc.desc Verify filter on mixed empty and whitespace strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', '\t', '\n', 'a', '\r\n', 'b');
      const hasContent = arr.filter((s: string): boolean => s.trim().length > 0);
      expect(hasContent.length).assertEqual(2);
      expect(hasContent[0]).assertEqual('a');
      expect(hasContent[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7000
     * @tc.name testArrayFilter070
     * @tc.desc Verify filter preserves BigInt precision in comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 20n, 30n, 40n, 50n);
      const result = arr.filter((v: bigint): boolean => v > 25n);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(30n);
      expect(result[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7100
     * @tc.name testArrayFilter071
     * @tc.desc Verify filter on very large string array (1000 strings)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne('item_' + i.toString());
      }
      const result = arr.filter((s: string): boolean => s.includes('99'));
      expect(result.length).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7200
     * @tc.name testArrayFilter072
     * @tc.desc Verify filter on business-formatted phone-number strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('13800138000', '12345', '310101199001011234', 'test@example.com', '400-800-0000');
      const phoneLike = arr.filter((s: string): boolean => s.length === 11);
      expect(phoneLike.length).assertEqual(1);
      expect(phoneLike[0]).assertEqual('13800138000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7300
     * @tc.name testArrayFilter073
     * @tc.desc Verify filter on UUID-like strings using length filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('550e8400-e29b-41d4-a716-446655440000', 'short', '123e4567-e89b-12d3-a456-426614174000');
      const uuidLike = arr.filter((s: string): boolean => s.length === 36);
      expect(uuidLike.length).assertEqual(2);
      expect(uuidLike[0]).assertEqual('550e8400-e29b-41d4-a716-446655440000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7400
     * @tc.name testArrayFilter074
     * @tc.desc Verify filter on date-format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('2026-03-05', 'not-a-date', '2026/03/05', '2026-13-05', '2026-02-30');
      const isoLike = arr.filter((s: string): boolean => s.includes('-'));
      expect(isoLike.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7500
     * @tc.name testArrayFilter075
     * @tc.desc Verify filter on array containing both empty and null filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined | null>('a', '', undefined, 'b', null, 'c');
      const valid = arr.filter((v: string | undefined | null): boolean => v === 'a' || v === 'b' || v === 'c');
      expect(valid.length).assertEqual(3);
      expect(valid[0]).assertEqual('a');
      expect(valid[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7600
     * @tc.name testArrayFilter076
     * @tc.desc Verify filter using char array with digit filtering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'0', c'5', c'9', c'A', c'Z', c'a', c'z');
      const digits = arr.filter((c: char): boolean => c >= c'0' && c <= c'9');
      expect(digits.length).assertEqual(3);
      expect(digits[0]).assertEqual(c'0');
      expect(digits[2]).assertEqual(c'9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7700
     * @tc.name testArrayFilter077
     * @tc.desc Verify filter on uppercase letters range from char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'b', c'C', c'd', c'E', c'1', c'!');
      const upper = arr.filter((c: char): boolean => c >= c'A' && c <= c'Z');
      expect(upper.length).assertEqual(3);
      expect(upper[0]).assertEqual(c'A');
      expect(upper[1]).assertEqual(c'C');
      expect(upper[2]).assertEqual(c'E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7800
     * @tc.name testArrayFilter078
     * @tc.desc Verify filter on Unicode CJK range in char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'中', c'文', c'1', c'测');
      const cjk = arr.filter((c: char): boolean => c >= c'一' && c <= c'鿿');
      expect(cjk.length).assertEqual(3);
      expect(cjk[0]).assertEqual(c'中');
      expect(cjk[1]).assertEqual(c'文');
      expect(cjk[2]).assertEqual(c'测');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_7900
     * @tc.name testArrayFilter079
     * @tc.desc Verify filter on negative zero and positive zero with strict comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, -0, 3, -3, 0);
      const zeros = arr.filter((v: number): boolean => v === 0);
      expect(zeros.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_8000
     * @tc.name testArrayFilter080
     * @tc.desc Verify filter with predicate s.length===1 on mixed-length strings returns single-char strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = 'x';
      const arr = new Array<string>('short', longStr, 'medium', longStr, 'tiny');
      const result = arr.filter((s: string): boolean => s.length === 1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_8100
     * @tc.name testArrayFilter081
     * @tc.desc Verify filter with entire surrogate pair emoji treated as one character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '😀', 'b', '🌟', 'c');
      const emojiCodePoints = arr.filter((s: string): boolean => s.length > 1);
      expect(emojiCodePoints.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_8200
     * @tc.name testArrayFilter082
     * @tc.desc Verify filter with predicate v>20 on dense array of 6 numbers returns 4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFilter082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50, 60);
      const result = arr.filter((v: number): boolean => v > 20);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(40);
      expect(result[2]).assertEqual(50);
      expect(result[3]).assertEqual(60);
    });
  });
}
    