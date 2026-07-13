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

class FindIdxPerson031 {
  id: string = '';
  name: string = '';
}

class FindIdxFieldBase039 {
  items: Array<number> = new Array<number>(10, 20, 30, 40);
}

class FindIdxFieldChild040 extends FindIdxFieldBase039 {
  items: Array<number> = new Array<number>(100, 200, 300);
}

class FindIdxAnimal041 {
  type: string = 'animal';
  sound: string = '';
}

class FindIdxDog041 extends FindIdxAnimal041 {
  type: string = 'dog';
  sound: string = 'bark';
}

class FindIdxCat041 extends FindIdxAnimal041 {
  type: string = 'cat';
  sound: string = 'meow';
}

class FindIdxReadonlyField106 {
  readonly arr: Array<number> = new Array<number>(5, 10, 15, 20);
}

class FindIdxStaticField107 {
  static numbers: Array<number> = new Array<number>(1, 3, 5, 7, 9);
}

class FindIdxInstanceField108 {
  numbers: Array<number> = new Array<number>(2, 4, 6, 8, 10);
}

class FindIdxPrivateField109 {
  public data: Array<number> = new Array<number>(100, 200, 300, 400);
}

class FindIdxGenericHolder114<T> {
  data: Array<T> = new Array<T>();
}

class FindIdxClosureScope121 {
  target: int = 5;
}

class FindIdxCustomMethod122 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
  findIndex(cb: (v: number) => boolean): number {
    return -2;
  }
}

class FindIdxSubArray123 extends Array<number> {
}

class FindIdxSendable124 {
  value: int = 0;
}

class FindIdxHybridA125 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
}

class FindIdxHybridB125 extends FindIdxHybridA125 {
  label: string = 'hybrid';
}

class FindIdxSideEffect126 {
  counter: int = 0;
}

class FindIdxPropertyDesc127 {
  data: string = '';
}

export default function ArrayFindIndexTest2(): void {
  describe('ArrayFindIndexTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0100
     * @tc.name testArrayFindIndex001
     * @tc.desc Verify findIndex on Array<string> finds index by string length condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('cat', 'dog', 'elephant', 'fox');
      const result = arr.findIndex((s: string): boolean => s.length > 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0200
     * @tc.name testArrayFindIndex002
     * @tc.desc Verify findIndex on Array<boolean> finds first true/false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, false, true, false);
      const firstTrue = arr.findIndex((v: boolean): boolean => v);
      expect(firstTrue).assertEqual(2);

      const allTrue = new Array<boolean>(true, true, true);
      expect(allTrue.findIndex((v: boolean): boolean => !v)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0300
     * @tc.name testArrayFindIndex003
     * @tc.desc Verify findIndex on Array<double> finds index by threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.5, 1.5, 2.5, 3.5, 4.5);
      const result = arr.findIndex((v: double): boolean => v > 3.0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0400
     * @tc.name testArrayFindIndex004
     * @tc.desc Verify findIndex on Array<number | null> finds null element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null, 5);
      const firstNull = arr.findIndex((v: number | null): boolean => v == null);
      expect(firstNull).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0500
     * @tc.name testArrayFindIndex005
     * @tc.desc Verify findIndex on large array (1000 elements) finds correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      const result = arr.findIndex((v: int): boolean => v === 500);
      expect(result).assertEqual(500);
      expect(arr.findIndex((v: int): boolean => v > 999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0600
     * @tc.name testArrayFindIndex006
     * @tc.desc Verify chained filter().findIndex() returns index in filtered result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 10, 15, 20, 25, 30);
      const filtered = arr.filter((v: number): boolean => v > 10);
      const result = filtered.findIndex((v: number): boolean => v === 25);
      expect(result).assertEqual(2);
      expect(filtered.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0700
     * @tc.name testArrayFindIndex007
     * @tc.desc Verify findIndex return type is int when used in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const idx: int = arr.findIndex((v: number): boolean => v === 30);
      expect(idx).assertEqual(2);
      expect(arr[idx]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0800
     * @tc.name testArrayFindIndex008
     * @tc.desc Verify findIndex with always-true predicate returns 0, always-false returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr.findIndex((v: number): boolean => true)).assertEqual(0);
      expect(arr.findIndex((v: number): boolean => false)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0900
     * @tc.name testArrayFindIndex009
     * @tc.desc Verify findIndex with compound condition using modulo and comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 7, 10, 14, 17, 21);
      const result = arr.findIndex((v: int): boolean => v % 2 === 1 && v > 10);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1000
     * @tc.name testArrayFindIndex010
     * @tc.desc Verify findIndex across union typed arrays finds matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(100, 'hello', 200, 'world');
      const stringIdx = arr.findIndex((v: int | string): boolean => {
        const valueType = Class.of(v).getName().split('.');
        return valueType[valueType.length - 1] === 'String';
      });
      expect(stringIdx).assertEqual(1);
      const numberIdx = arr.findIndex((v: int | string): boolean => {
        const valueType = Class.of(v).getName().split('.');
        return valueType[valueType.length - 1] === 'Int';
      });
      expect(numberIdx).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1100
     * @tc.name testArrayFindIndex011
     * @tc.desc Verify findIndex on instance field — first even number index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindIdxInstanceField108();
      const idx = obj.numbers.findIndex((v: number): boolean => v > 5);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1200
     * @tc.name testArrayFindIndex012
     * @tc.desc Verify findIndex on static field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const idx = FindIdxStaticField107.numbers.findIndex((v: number): boolean => v > 5);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1300
     * @tc.name testArrayFindIndex013
     * @tc.desc Verify static field modified before findIndex uses latest data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      FindIdxStaticField107.numbers = new Array<number>(2, 4, 6, 8);
      const idx = FindIdxStaticField107.numbers.findIndex((v: number): boolean => v > 5);
      expect(idx).assertEqual(2);
      FindIdxStaticField107.numbers = new Array<number>(1, 3, 5, 7, 9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1400
     * @tc.name testArrayFindIndex014
     * @tc.desc Verify findIndex on readonly field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindIdxReadonlyField106();
      const idx = obj.arr.findIndex((v: number): boolean => v === 15);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1500
     * @tc.name testArrayFindIndex015
     * @tc.desc Verify findIndex on private field via Class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindIdxPrivateField109();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('data');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const idx = arr.findIndex((v: number): boolean => v === 300);
        expect(idx).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1600
     * @tc.name testArrayFindIndex016
     * @tc.desc Verify findIndex on parent field through child instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindIdxFieldBase039();
      const idx = obj.items.findIndex((v: number): boolean => v === 30);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1700
     * @tc.name testArrayFindIndex017
     * @tc.desc Verify findIndex on subclass overridden field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindIdxFieldChild040();
      const idx = obj.items.findIndex((v: number): boolean => v === 200);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1800
     * @tc.name testArrayFindIndex018
     * @tc.desc Verify findIndex on polymorphic object array — find first dog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FindIdxDog041();
      const cat = new FindIdxCat041();
      const animals = new Array<FindIdxAnimal041>(cat, dog, cat);
      const idx = animals.findIndex((a: FindIdxAnimal041): boolean => a.sound === 'bark');
      expect(idx).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1900
     * @tc.name testArrayFindIndex019
     * @tc.desc Verify findIndex with value in middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number): boolean => v === 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2000
     * @tc.name testArrayFindIndex020
     * @tc.desc Verify findIndex short-circuits on first match, not last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 20, 10);
      const idx = arr.findIndex((v: number): boolean => v === 20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2100
     * @tc.name testArrayFindIndex021
     * @tc.desc Verify findIndex with v>0 predicate returns index of first positive element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number): boolean => v > 0);
      expect(idx).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2200
     * @tc.name testArrayFindIndex022
     * @tc.desc Verify findIndex on Array<byte> — find positive byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(-128, -64, 0, 64, 127);
      const idx = arr.findIndex((v: byte): boolean => v >= 0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2300
     * @tc.name testArrayFindIndex023
     * @tc.desc Verify findIndex on Array<short> — find negative short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(-32768, -1, 0, 32767);
      const idx = arr.findIndex((v: short): boolean => v === -1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2400
     * @tc.name testArrayFindIndex024
     * @tc.desc Verify findIndex on Array<long> — find large long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(0, 2147483648, 9223372036854775807);
      const idx = arr.findIndex((v: long): boolean => v > 1000000);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2500
     * @tc.name testArrayFindIndex025
     * @tc.desc Verify findIndex on Array<double> — find by double comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<double> = new Array<double>(0.0, -1.5, 3.14, 999.99);
      const idx = arr.findIndex((v: double): boolean => v > 100.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2600
     * @tc.name testArrayFindIndex026
     * @tc.desc Verify findIndex on Array<char> — find vowel char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'b', c'c', c'e', c'f', c'g');
      const idx = arr.findIndex((c: char): boolean => c === c'e');
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2700
     * @tc.name testArrayFindIndex027
     * @tc.desc Verify findIndex on Array<char> digit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'5', c'Z', c'9', c'm');
      const idx = arr.findIndex((c: char): boolean => c >= c'0' && c <= c'9');
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2800
     * @tc.name testArrayFindIndex028
     * @tc.desc Verify findIndex on Array<bigint> — find matching bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 20n, 30n, 40n);
      const idx = arr.findIndex((v: bigint): boolean => v === 30n);
      expect(idx).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_2900
     * @tc.name testArrayFindIndex029
     * @tc.desc Verify findIndex with push during predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number, i: int, a: Array<number>): boolean => {
        if (i === 2) {
          a.push(99);
        }
        return v > 4;
      });
      expect(idx).assertEqual(4);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3000
     * @tc.name testArrayFindIndex030
     * @tc.desc Verify findIndex with pop during predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a.pop();
        }
        return v > 3;
      });
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3100
     * @tc.name testArrayFindIndex031
     * @tc.desc Verify findIndex with unshift during predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a.unshift(0);
        }
        return v > 4;
      });
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3200
     * @tc.name testArrayFindIndex032
     * @tc.desc Verify findIndex when clearing array via length=0 during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let visited = 0;
      const idx = arr.findIndex((v: number, i: int, a: Array<number>): boolean => {
        visited++;
        if (i === 3) {
          a.length = 0;
        }
        return v > 5;
      });
      expect(idx).assertEqual(-1);
      expect(visited).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3300
     * @tc.name testArrayFindIndex033
     * @tc.desc Verify findIndex setting future element during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a[3] = 99;
        }
        return v > 4;
      });
      expect(arr[3]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3400
     * @tc.name testArrayFindIndex034
     * @tc.desc Verify findIndex captures closure variable as threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FindIdxClosureScope121();
      ctx.target = 3;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number): boolean => v > ctx.target);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3500
     * @tc.name testArrayFindIndex035
     * @tc.desc Verify findIndex with dynamically changing closure threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FindIdxClosureScope121();
      ctx.target = 4;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const before = arr.findIndex((v: number): boolean => v > ctx.target);
      expect(before).assertEqual(4);
      ctx.target = 2;
      const after = arr.findIndex((v: number): boolean => v > ctx.target);
      expect(after).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3600
     * @tc.name testArrayFindIndex036
     * @tc.desc Verify findIndex on array with threshold predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const idx = arr.findIndex((v: number): boolean => v > 25);
      expect(idx).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3700
     * @tc.name testArrayFindIndex037
     * @tc.desc Verify findIndex throws in predicate is caught and re-runnable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      try {
        arr.findIndex((v: number): boolean => {
          if (v === 3) {
            throw new Error('stop');
          }
          return v > 4;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const r2 = arr.findIndex((v: number): boolean => v > 4);
      expect(r2).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3800
     * @tc.name testArrayFindIndex038
     * @tc.desc Verify findIndex on 100000-element array finds last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 100000; i++) {
        arr.pushOne(i);
      }
      const idx = arr.findIndex((v: number): boolean => v === 99999);
      expect(idx).assertEqual(99999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_3900
     * @tc.name testArrayFindIndex039
     * @tc.desc Verify repeated findIndex on same array 1000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let result = -2;
      for (let i = 0; i < 1000; i++) {
        result = arr.findIndex((v: number): boolean => v === 3);
      }
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4000
     * @tc.name testArrayFindIndex040
     * @tc.desc Verify side effect counter equals match+1 when found mid-array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50, 60);
      let counter = 0;
      const idx = arr.findIndex((v: number): boolean => {
        counter++;
        return v === 30;
      });
      expect(idx).assertEqual(2);
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4100
     * @tc.name testArrayFindIndex041
     * @tc.desc Verify side effect counter equals length when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let counter = 0;
      const idx = arr.findIndex((v: number): boolean => {
        counter++;
        return v > 100;
      });
      expect(idx).assertEqual(-1);
      expect(counter).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4200
     * @tc.name testArrayFindIndex042
     * @tc.desc Verify findIndex on NaN using isNaN predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.NaN, 3, 4);
      const idx = arr.findIndex((v: number): boolean => isNaN(v));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4300
     * @tc.name testArrayFindIndex043
     * @tc.desc Verify findIndex filters out Infinity using isFinite predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.POSITIVE_INFINITY, 3, Double.NEGATIVE_INFINITY);
      const idx = arr.findIndex((v: number): boolean => !isFinite(v));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4400
     * @tc.name testArrayFindIndex044
     * @tc.desc Verify findIndex on 0 vs -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 0, 1, 2);
      const firstZero = arr.findIndex((v: number): boolean => v === 0);
      expect(firstZero).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4500
     * @tc.name testArrayFindIndex045
     * @tc.desc Verify findIndex on generic class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FindIdxGenericHolder114<number>();
      holder.data = new Array<number>(10, 20, 30, 40, 50);
      const idx = holder.data.findIndex((v: number): boolean => v > 25);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4600
     * @tc.name testArrayFindIndex046
     * @tc.desc Verify findIndex on generic String field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FindIdxGenericHolder114<string>();
      holder.data = new Array<string>('cat', 'dog', 'elephant', 'fox');
      const idx = holder.data.findIndex((s: string): boolean => s.length > 4);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4700
     * @tc.name testArrayFindIndex047
     * @tc.desc Verify findIndex on nested Array<Array<number>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4, 5);
      const inner3 = new Array<number>(6);
      const arr = new Array<Array<number>>(inner1, inner2, inner3);
      const idx = arr.findIndex((inner: Array<number>): boolean => inner.length > 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4800
     * @tc.name testArrayFindIndex048
     * @tc.desc Verify findIndex on Map<string, Array<number>> inner array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Array<number>>();
      map.set('a', new Array<number>(1, 2, 3));
      map.set('b', new Array<number>(4, 5, 6));
      const inner = map.get('b');
      if (inner !== undefined) {
        const idx = inner.findIndex((v: number): boolean => v === 5);
        expect(idx).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_4900
     * @tc.name testArrayFindIndex049
     * @tc.desc Verify class with its own findIndex does not conflict with Array.findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindIdxCustomMethod122();
      const custom = obj.findIndex((v: number): boolean => v > 2);
      expect(custom).assertEqual(-2);
      const real = obj.arr.findIndex((v: number): boolean => v > 2);
      expect(real).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5000
     * @tc.name testArrayFindIndex050
     * @tc.desc Verify findIndex on array with element match in middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number): boolean => v === 4);
      expect(idx).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5100
     * @tc.name testArrayFindIndex051
     * @tc.desc Verify findIndex on object property string match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FindIdxPerson031();
      p1.id = '101';
      p1.name = 'Alice';
      const p2 = new FindIdxPerson031();
      p2.id = '102';
      p2.name = 'Bob';
      const arr = new Array<FindIdxPerson031>(p1, p2);
      const idx = arr.findIndex((p: FindIdxPerson031): boolean => p.id === '102');
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5200
     * @tc.name testArrayFindIndex052
     * @tc.desc Verify findIndex on phone-number format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('13800138000', '400-800-0000', 'test@example.com');
      const idx = arr.findIndex((s: string): boolean => s.length === 11);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5300
     * @tc.name testArrayFindIndex053
     * @tc.desc Verify findIndex on UUID-like strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('short', '550e8400-e29b-41d4-a716-446655440000', 'tiny');
      const idx = arr.findIndex((s: string): boolean => s.length === 36);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5400
     * @tc.name testArrayFindIndex054
     * @tc.desc Verify findIndex on date format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('not_a_date', '2026-03-05', '2026/03/05');
      const idx = arr.findIndex((s: string): boolean => s.includes('-'));
      expect(idx).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5500
     * @tc.name testArrayFindIndex055
     * @tc.desc Verify findIndex on zero-width strings: ['hello','​','world','﻿','test'], s.length>5 → -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '​', 'world', '﻿', 'test');
      const idx = arr.findIndex((s: string): boolean => s.length > 5);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5600
     * @tc.name testArrayFindIndex056
     * @tc.desc Verify findIndex on emoji strings: ['test','😀','🔥🔥','⭐⭐','end'], s.length===2 → index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('test', '😀', '🔥🔥', '⭐⭐', 'end');
      const idx = arr.findIndex((s: string): boolean => s.length === 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5700
     * @tc.name testArrayFindIndex057
     * @tc.desc Verify findIndex on special symbol strings: ['safe','!@#$%^&*()','\\t\\n\\r','normal'], s.includes('!') → index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '!@#$%^&*()', '\t\n\r', 'normal');
      const idx = arr.findIndex((s: string): boolean => s.includes('!'));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5800
     * @tc.name testArrayFindIndex058
     * @tc.desc Verify findIndex on multi-language strings: English(idx0), Japanese(idx1), Korean(idx2), Arabic(idx3), Chinese(idx4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'テスト', '테스트', 'اختبار', '测试');
      const idxEn = arr.findIndex((s: string): boolean => s === 'hello');
      const idxJa = arr.findIndex((s: string): boolean => s === 'テスト');
      const idxKo = arr.findIndex((s: string): boolean => s === '테스트');
      const idxAr = arr.findIndex((s: string): boolean => s === 'اختبار');
      const idxZh = arr.findIndex((s: string): boolean => s === '测试');
      expect(idxEn).assertEqual(0);
      expect(idxJa).assertEqual(1);
      expect(idxKo).assertEqual(2);
      expect(idxAr).assertEqual(3);
      expect(idxZh).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_5900
     * @tc.name testArrayFindIndex059
     * @tc.desc Verify findIndex on subclass of Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new FindIdxSubArray123();
      arr.pushOne(10);
      arr.pushOne(20);
      arr.pushOne(30);
      const idx = arr.findIndex((v: number): boolean => v === 20);
      expect(idx).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6000
     * @tc.name testArrayFindIndex060
     * @tc.desc Verify findIndex on array finds index of matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const idx = arr.findIndex((v: number): boolean => v === 30);
      expect(idx).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6100
     * @tc.name testArrayFindIndex061
     * @tc.desc Verify consistent findIndex across multiple Field reflections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindIdxInstanceField108();
      const clazz = Class.of(obj);
      const f1 = clazz.getInstanceField('numbers');
      const f2 = clazz.getInstanceField('numbers');
      if (f1 !== undefined && f2 !== undefined) {
        const a1 = f1.getValue(obj) as Array<number>;
        const a2 = f2.getValue(obj) as Array<number>;
        const r1 = a1.findIndex((v: number): boolean => v === 8);
        const r2 = a2.findIndex((v: number): boolean => v === 8);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6200
     * @tc.name testArrayFindIndex062
     * @tc.desc Verify findIndex result always satisfies -1 <= idx < length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number): boolean => v > 2);
      expect(idx >= -1).assertTrue();
      expect(idx < arr.length).assertTrue();
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6300
     * @tc.name testArrayFindIndex063
     * @tc.desc Verify findIndex returns -1 for impossible condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findIndex((v: number, i: int): boolean => i < 0);
      expect(idx).assertEqual(-1);
      const idx2 = arr.findIndex((v: number, i: int, a: Array<number>): boolean => i >= a.length);
      expect(idx2).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6400
     * @tc.name testArrayFindIndex064
     * @tc.desc Verify findIndex + filter + sort hybrid chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 2, 7, 4, 5, 1, 8, 3, 6, 10);
      const filtered = arr.filter((v: number): boolean => v % 2 === 0);
      const idx = filtered.findIndex((v: number): boolean => v === 8);
      expect(filtered.length).assertEqual(5);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6500
     * @tc.name testArrayFindIndex065
     * @tc.desc Verify hybrid of findIndex with closure on inherited field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindIdxHybridB125();
      const idx = obj.arr.findIndex((v: number): boolean => v > 3 && obj.label === 'hybrid');
      expect(idx).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6600
     * @tc.name testArrayFindIndex066
     * @tc.desc Verify findIndex on XSS strings: ['safe','<script>alert(1)</script>','!@#$%^','normal'], s.includes('<script>') → index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '<script>alert(1)</script>', '!@#$%^', 'normal');
      const idx = arr.findIndex((s: string): boolean => s.includes('<script>'));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6700
     * @tc.name testArrayFindIndex067
     * @tc.desc Verify findIndex on special character strings: ['safe','!@#$%^','\\t\\n\\r','normal'], s.includes('!') → index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '!@#$%^', '\t\n\r', 'normal');
      const idx = arr.findIndex((s: string): boolean => s.includes('!'));
      expect(idx).assertEqual(1);
      const idxCtrl = arr.findIndex((s: string): boolean => s.includes('\t'));
      expect(idxCtrl).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6800
     * @tc.name testArrayFindIndex068
     * @tc.desc Verify findIndex on mixed empty/whitespace/control strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', '\t', '\n', 'a', 'b');
      const idx = arr.findIndex((s: string): boolean => s.trim().length === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_6900
     * @tc.name testArrayFindIndex069
     * @tc.desc Verify findIndex with null value: ['a', undefined, null, 'b'], v===null → index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined | null>('a', undefined, null, 'b');
      const idx = arr.findIndex((v: string | undefined | null): boolean => v === null);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_7000
     * @tc.name testArrayFindIndex070
     * @tc.desc Verify findIndex with undefined value: ['a', undefined, null, 'b'], v===undefined → index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined | null>('a', undefined, null, 'b');
      const idx = arr.findIndex((v: string | undefined | null): boolean => v === undefined);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_7100
     * @tc.name testArrayFindIndex071
     * @tc.desc Verify findIndex on 1000 identical object references returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FindIdxPerson031();
      p.id = 'same';
      p.name = 'ref';
      const arr = new Array<FindIdxPerson031>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(p);
      }
      const idx = arr.findIndex((v: FindIdxPerson031): boolean => v.id === 'same');
      expect(idx).assertEqual(0);
    });
  });
}