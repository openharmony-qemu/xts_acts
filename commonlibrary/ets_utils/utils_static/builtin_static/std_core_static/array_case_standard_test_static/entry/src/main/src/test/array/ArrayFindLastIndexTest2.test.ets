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

class FindLastIdxPerson {
  id: string = '';
  name: string = '';
}

class FindLastIdxFieldBase {
  items: Array<number> = new Array<number>(10, 20, 30, 40);
}

class FindLastIdxFieldChild extends FindLastIdxFieldBase {
  items: Array<number> = new Array<number>(100, 200, 300);
}

class FindLastIdxAnimal {
  type: string = 'animal';
  sound: string = '';
}

class FindLastIdxDog extends FindLastIdxAnimal {
  type: string = 'dog';
  sound: string = 'bark';
}

class FindLastIdxCat extends FindLastIdxAnimal {
  type: string = 'cat';
  sound: string = 'meow';
}

class FindLastIdxReadonlyField {
  readonly arr: Array<number> = new Array<number>(5, 10, 15, 20, 25);
}

class FindLastIdxStaticField {
  static numbers: Array<number> = new Array<number>(1, 3, 5, 7, 9);
}

class FindLastIdxInstanceField {
  numbers: Array<number> = new Array<number>(2, 4, 6, 8, 10);
}

class FindLastIdxPrivateField {
  data: Array<number> = new Array<number>(100, 200, 300, 400);
}

class FindLastIdxGenericHolder<T> {
  data: Array<T> = new Array<T>();
}

class FindLastIdxClosureScope {
  target: int = 5;
}

class FindLastIdxCustomMethod {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
  findLastIndex(cb: (v: number) => boolean): number {
    return -2;
  }
}

class FindLastIdxSubArray extends Array<number> {
}

class FindLastIdxHybridA {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
}

class FindLastIdxHybridB extends FindLastIdxHybridA {
  label: string = 'hybrid';
}

export default function ArrayFindLastIndexTest2(): void {
  describe('ArrayFindLastIndexTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0100
     * @tc.name testArrayFindLastIndex001
     * @tc.desc Verify findLastIndex on Array<string> finds last matching string index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'bb', 'ccc', 'bb', 'a');
      const result = arr.findLastIndex((s: string): boolean => s === 'bb');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0200
     * @tc.name testArrayFindLastIndex002
     * @tc.desc Verify findLastIndex on Array<boolean> finds last true index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true, false, true, false);
      const result = arr.findLastIndex((v: boolean): boolean => v);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0300
     * @tc.name testArrayFindLastIndex003
     * @tc.desc Verify findLastIndex on Array<double> finds last matching threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.1, 0.5, 1.0, 1.5, 2.0);
      const result = arr.findLastIndex((v: double): boolean => v < 1.5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0400
     * @tc.name testArrayFindLastIndex004
     * @tc.desc Verify findLastIndex on Array<number | null> finds last non-null index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null, 1, null, 2, null);
      const result = arr.findLastIndex((v: number | null): boolean => v != null);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0500
     * @tc.name testArrayFindLastIndex005
     * @tc.desc Verify findLastIndex on large array finds last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      const result = arr.findLastIndex((v: int): boolean => v > 500);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0600
     * @tc.name testArrayFindLastIndex006
     * @tc.desc Verify findLastIndex predicate receives index and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLastIndex((v: number, i: int, a: Array<number>): boolean => {
        return i < a.length - 1 && v > 3;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0700
     * @tc.name testArrayFindLastIndex007
     * @tc.desc Verify findLastIndex with compound condition matches last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 6, 8, 10, 12, 14, 16);
      const result = arr.findLastIndex((v: int): boolean => v % 6 === 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0800
     * @tc.name testArrayFindLastIndex008
     * @tc.desc Verify findLastIndex on single-element array finds the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'only');
      expect(arr.findLastIndex((s: string): boolean => s.length > 0)).assertEqual(0);
      expect(arr.findLastIndex((s: string): boolean => s === 'missing')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0900
     * @tc.name testArrayFindLastIndex009
     * @tc.desc Verify findLastIndex with union typed array finds last string index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'a', 2, 'b', 3);
      const result = arr.findLastIndex((v: int | string): boolean => {
        const valueType = Class.of(v).getName().split('.');
        return valueType[valueType.length - 1] === 'String';
      });
      expect(result).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1000
     * @tc.name testArrayFindLastIndex010
     * @tc.desc Verify findLastIndex on instance field array: [2,4,6,8,10], v>5 → last index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastIdxInstanceField();
      const idx = obj.numbers.findLastIndex((v: number): boolean => v > 5);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1100
     * @tc.name testArrayFindLastIndex011
     * @tc.desc Verify findLastIndex on static field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const idx = FindLastIdxStaticField.numbers.findLastIndex((v: number): boolean => v > 5);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1200
     * @tc.name testArrayFindLastIndex012
     * @tc.desc Verify static field modified before findLastIndex uses latest data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      FindLastIdxStaticField.numbers = new Array<number>(2, 4, 6, 8);
      const idx = FindLastIdxStaticField.numbers.findLastIndex((v: number): boolean => v > 5);
      expect(idx).assertEqual(3);
      FindLastIdxStaticField.numbers = new Array<number>(1, 3, 5, 7, 9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1300
     * @tc.name testArrayFindLastIndex013
     * @tc.desc Verify findLastIndex on readonly field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastIdxReadonlyField();
      const idx = obj.arr.findLastIndex((v: number): boolean => v === 15);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1400
     * @tc.name testArrayFindLastIndex014
     * @tc.desc Verify findLastIndex on public field via Class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastIdxPrivateField();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('data');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const idx = arr.findLastIndex((v: number): boolean => v === 300);
        expect(idx).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1500
     * @tc.name testArrayFindLastIndex015
     * @tc.desc Verify findLastIndex on parent class field through child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastIdxFieldBase();
      const idx = obj.items.findLastIndex((v: number): boolean => v === 20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1600
     * @tc.name testArrayFindLastIndex016
     * @tc.desc Verify findLastIndex on subclass overridden field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastIdxFieldChild();
      const idx = obj.items.findLastIndex((v: number): boolean => v === 100);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1700
     * @tc.name testArrayFindLastIndex017
     * @tc.desc Verify findLastIndex on polymorphic array — find last Cat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FindLastIdxDog();
      const cat1 = new FindLastIdxCat();
      const cat2 = new FindLastIdxCat();
      const animals = new Array<FindLastIdxAnimal>(dog, cat1, dog, cat2);
      const idx = animals.findLastIndex((a: FindLastIdxAnimal): boolean => a.sound === 'meow');
      expect(idx).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1800
     * @tc.name testArrayFindLastIndex018
     * @tc.desc Verify last match at tail returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 999);
      const idx = arr.findLastIndex((v: number): boolean => v > 50);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_1900
     * @tc.name testArrayFindLastIndex019
     * @tc.desc Verify last match at head returns 0 after full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 10, 20, 30);
      const idx = arr.findLastIndex((v: number): boolean => v === 5);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2000
     * @tc.name testArrayFindLastIndex020
     * @tc.desc Verify findLastIndex finds last index of element matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findLastIndex((v: number): boolean => v === 3);
      expect(idx).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2100
     * @tc.name testArrayFindLastIndex021
     * @tc.desc Verify findLastIndex on Array<byte> finds last negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(-128, 0, 64, -64, 127);
      const idx = arr.findLastIndex((v: byte): boolean => v < 0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2200
     * @tc.name testArrayFindLastIndex022
     * @tc.desc Verify findLastIndex on Array<short>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(-32768, -1, 0, 32767);
      const idx = arr.findLastIndex((v: short): boolean => v < 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2300
     * @tc.name testArrayFindLastIndex023
     * @tc.desc Verify findLastIndex on Array<long> finds large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(0, 2147483648, 9223372036854775807);
      const idx = arr.findLastIndex((v: long): boolean => v > 1000000);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2400
     * @tc.name testArrayFindLastIndex024
     * @tc.desc Verify findLastIndex on Array<float>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.0, -1.5, 3.14, 999.99);
      const idx = arr.findLastIndex((v: double): boolean => v < 100.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2500
     * @tc.name testArrayFindLastIndex025
     * @tc.desc Verify findLastIndex on Array<char> finds last vowel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'e', c'f', c'i');
      const idx = arr.findLastIndex((c: char): boolean => c === c'e' || c === c'i');
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2600
     * @tc.name testArrayFindLastIndex026
     * @tc.desc Verify findLastIndex on Array<char> digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'5', c'Z', c'9', c'm');
      const idx = arr.findLastIndex((c: char): boolean => c >= c'0' && c <= c'9');
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2700
     * @tc.name testArrayFindLastIndex027
     * @tc.desc Verify findLastIndex on Array<bigint>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(30n, 10n, 20n, 10n);
      const idx = arr.findLastIndex((v: bigint): boolean => v === 10n);
      expect(idx).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2800
     * @tc.name testArrayFindLastIndex028
     * @tc.desc Verify push inside findLastIndex predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findLastIndex((v: number, i: int, a: Array<number>): boolean => {
        if (i === 4) {
          a.push(99);
        }
        return v === 3;
      });
      expect(idx).assertEqual(2);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_2900
     * @tc.name testArrayFindLastIndex029
     * @tc.desc Verify pop inside findLastIndex predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findLastIndex((v: number, i: int, a: Array<number>): boolean => {
        if (i === 4) {
          a.pop();
        }
        return v === 3;
      });
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3000
     * @tc.name testArrayFindLastIndex030
     * @tc.desc Verify unshift inside findLastIndex predicate: array mutated during reverse iteration, last index of v>3 is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findLastIndex((v: number, i: int, a: Array<number>): boolean => {
        if (i === 4) {
          a.unshift(0);
        }
        return v > 3;
      });
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3100
     * @tc.name testArrayFindLastIndex031
     * @tc.desc Verify length=0 during reverse iteration: last v>5 is 10 at index 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let visited = 0;
      const idx = arr.findLastIndex((v: number, i: int, a: Array<number>): boolean => {
        visited++;
        if (i === 7) {
          a.length = 0;
        }
        return v > 5;
      });
      expect(idx).assertEqual(9);
      expect(visited).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3200
     * @tc.name testArrayFindLastIndex032
     * @tc.desc Verify findLastIndex setting future element during reverse iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findLastIndex((v: number, i: int, a: Array<number>): boolean => {
        if (i === 4) {
          a[1] = 99;
        }
        return v > 3;
      });
      expect(arr[1]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3300
     * @tc.name testArrayFindLastIndex033
     * @tc.desc Verify findLastIndex closure captures threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FindLastIdxClosureScope();
      ctx.target = 3;
      const arr = new Array<number>(10, 20, 5, 30, 40);
      const idx = arr.findLastIndex((v: number): boolean => v > ctx.target);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3400
     * @tc.name testArrayFindLastIndex034
     * @tc.desc Verify findLastIndex with dynamic closure change: target=45, v>45 last match is 50 at index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FindLastIdxClosureScope();
      ctx.target = 4;
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const before = arr.findLastIndex((v: number): boolean => v > ctx.target);
      expect(before).assertEqual(4);
      ctx.target = 45;
      const after = arr.findLastIndex((v: number): boolean => v > ctx.target);
      expect(after).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3500
     * @tc.name testArrayFindLastIndex035
     * @tc.desc Verify findLastIndex on array with duplicate values returns last occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const idx = arr.findLastIndex((v: number): boolean => v === 20);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3600
     * @tc.name testArrayFindLastIndex036
     * @tc.desc Verify findLastIndex propagates exception thrown in predicate, then re-runs correctly after catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      try {
        arr.findLastIndex((v: number): boolean => {
          if (v === 5) {
            throw new Error('stop');
          }
          return v > 4;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const r2 = arr.findLastIndex((v: number): boolean => v > 4);
      expect(r2).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3700
     * @tc.name testArrayFindLastIndex037
     * @tc.desc Verify findLastIndex on 100000 array finds last element quickly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 100000; i++) {
        arr.pushOne(i);
      }
      const idx = arr.findLastIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3800
     * @tc.name testArrayFindLastIndex038
     * @tc.desc Verify repeated findLastIndex 1000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let result = -2;
      for (let i = 0; i < 1000; i++) {
        result = arr.findLastIndex((v: number): boolean => v === 3);
      }
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_3900
     * @tc.name testArrayFindLastIndex039
     * @tc.desc Verify findLastIndex counter on found mid-array element in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50, 60);
      let counter = 0;
      const idx = arr.findLastIndex((v: number): boolean => {
        counter++;
        return v === 30;
      });
      expect(idx).assertEqual(2);
      expect(counter).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4000
     * @tc.name testArrayFindLastIndex040
     * @tc.desc Verify findLastIndex counter equals length when predicate has no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let counter = 0;
      const idx = arr.findLastIndex((v: number): boolean => {
        counter++;
        return v > 100;
      });
      expect(idx).assertEqual(-1);
      expect(counter).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4100
     * @tc.name testArrayFindLastIndex041
     * @tc.desc Verify counter at tail match — reverse short-circuits at first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 999);
      let counter = 0;
      const idx = arr.findLastIndex((v: number): boolean => {
        counter++;
        return v > 50;
      });
      expect(idx).assertEqual(4);
      expect(counter).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4200
     * @tc.name testArrayFindLastIndex042
     * @tc.desc Verify findLastIndex on NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.NaN, 1, Double.NaN, 3);
      const idx = arr.findLastIndex((v: number): boolean => isNaN(v));
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4300
     * @tc.name testArrayFindLastIndex043
     * @tc.desc Verify findLastIndex on Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.POSITIVE_INFINITY, 2, Double.NEGATIVE_INFINITY);
      const idx = arr.findLastIndex((v: number): boolean => !isFinite(v));
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4400
     * @tc.name testArrayFindLastIndex044
     * @tc.desc Verify findLastIndex on 0 vs -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, -0, 2);
      const idx = arr.findLastIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4500
     * @tc.name testArrayFindLastIndex045
     * @tc.desc Verify findLastIndex on generic number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FindLastIdxGenericHolder<number>();
      holder.data = new Array<number>(10, 20, 30, 40, 50);
      const idx = holder.data.findLastIndex((v: number): boolean => v > 25);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4600
     * @tc.name testArrayFindLastIndex046
     * @tc.desc Verify findLastIndex on generic string field: ['cat','dog','elephant','fox'], s.length>3 → 'elephant' at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FindLastIdxGenericHolder<string>();
      holder.data = new Array<string>('cat', 'dog', 'elephant', 'fox');
      const idx = holder.data.findLastIndex((s: string): boolean => s.length > 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4700
     * @tc.name testArrayFindLastIndex047
     * @tc.desc Verify findLastIndex on nested Array<Array<number>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4, 5);
      const inner3 = Array.create<number>(1, 6);
      const arr = new Array<Array<number>>(inner1, inner2, inner3);
      const idx = arr.findLastIndex((inner: Array<number>): boolean => inner.length === 1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4800
     * @tc.name testArrayFindLastIndex048
     * @tc.desc Verify findLastIndex on Map<string, Array<number>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Array<number>>();
      map.set('a', new Array<number>(1, 2, 3, 4));
      const inner = map.get('a');
      if (inner !== undefined) {
        const idx = inner.findLastIndex((v: number): boolean => v === 3);
        expect(idx).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_4900
     * @tc.name testArrayFindLastIndex049
     * @tc.desc Verify custom findLastIndex does not conflict with Array API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastIdxCustomMethod();
      const custom = obj.findLastIndex((v: number): boolean => v > 2);
      expect(custom).assertEqual(-2);
      const real = obj.arr.findLastIndex((v: number): boolean => v > 2);
      expect(real).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5000
     * @tc.name testArrayFindLastIndex050
     * @tc.desc Verify findLastIndex on array finds index of matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findLastIndex((v: number): boolean => v === 2);
      expect(idx).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5100
     * @tc.name testArrayFindLastIndex051
     * @tc.desc Verify findLastIndex on object property match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FindLastIdxPerson();
      p1.id = '101';
      const p2 = new FindLastIdxPerson();
      p2.id = '102';
      const arr = new Array<FindLastIdxPerson>(p1, p2, p1);
      const idx = arr.findLastIndex((p: FindLastIdxPerson): boolean => p.id === '101');
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5200
     * @tc.name testArrayFindLastIndex052
     * @tc.desc Verify findLastIndex on phone-number format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('12345', '13800138000', '400-800-0000');
      const idx = arr.findLastIndex((s: string): boolean => s.length === 11);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5300
     * @tc.name testArrayFindLastIndex053
     * @tc.desc Verify findLastIndex on date strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('2026-01-01', 'not-date', '2026-12-31');
      const idx = arr.findLastIndex((s: string): boolean => s.includes('-'));
      expect(idx).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5400
     * @tc.name testArrayFindLastIndex054
     * @tc.desc Verify findLastIndex on zero-width strings: ['hello','​','world','﻿','test'], s.length>5 → -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '​', 'world', '﻿', 'test');
      const idx = arr.findLastIndex((s: string): boolean => s.length > 5);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5500
     * @tc.name testArrayFindLastIndex055
     * @tc.desc Verify findLastIndex on emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('test', '😀', '🔥🔥', '⭐⭐', 'end');
      const idx = arr.findLastIndex((s: string): boolean => s.length === 2);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5600
     * @tc.name testArrayFindLastIndex056
     * @tc.desc Verify findLastIndex on multi-language strings: English(idx0), Chinese(idx1), Korean(idx2), Arabic(idx3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '测试', '테스트', 'اختبار');
      const idxEn = arr.findLastIndex((s: string): boolean => s === 'hello');
      const idxZh = arr.findLastIndex((s: string): boolean => s === '测试');
      const idxKo = arr.findLastIndex((s: string): boolean => s === '테스트');
      const idxAr = arr.findLastIndex((s: string): boolean => s === 'اختبار');
      expect(idxEn).assertEqual(0);
      expect(idxZh).assertEqual(1);
      expect(idxKo).assertEqual(2);
      expect(idxAr).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5700
     * @tc.name testArrayFindLastIndex057
     * @tc.desc Verify findLastIndex on subclass of Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new FindLastIdxSubArray();
      arr.pushOne(10);
      arr.pushOne(20);
      arr.pushOne(30);
      arr.pushOne(20);
      const idx = arr.findLastIndex((v: number): boolean => v === 20);
      expect(idx).assertEqual(3);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5800
     * @tc.name testArrayFindLastIndex058
     * @tc.desc Verify consistent findLastIndex across multiple Field reflections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastIdxInstanceField();
      const clazz = Class.of(obj);
      const f1 = clazz.getInstanceField('numbers');
      const f2 = clazz.getInstanceField('numbers');
      if (f1 !== undefined && f2 !== undefined) {
        const a1 = f1.getValue(obj) as Array<number>;
        const a2 = f2.getValue(obj) as Array<number>;
        const r1 = a1.findLastIndex((v: number): boolean => v === 8);
        const r2 = a2.findLastIndex((v: number): boolean => v === 8);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_5900
     * @tc.name testArrayFindLastIndex059
     * @tc.desc Verify findLastIndex result satisfies -1 <= idx < length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const idx = arr.findLastIndex((v: number): boolean => v > 2);
      expect(idx >= -1).assertTrue();
      expect(idx < arr.length).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_6000
     * @tc.name testArrayFindLastIndex060
     * @tc.desc Verify findLastIndex on 1000 identical references returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FindLastIdxPerson();
      p.id = 'same';
      const arr = new Array<FindLastIdxPerson>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(p);
      }
      const idx = arr.findLastIndex((v: FindLastIdxPerson): boolean => v.id === 'same');
      expect(idx).assertEqual(999);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_6100
     * @tc.name testArrayFindLastIndex061
     * @tc.desc Verify findLastIndex on XSS strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '<script>alert(1)</script>', 'normal', '<script>');
      const idx = arr.findLastIndex((s: string): boolean => s.includes('<script>'));
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_6200
     * @tc.name testArrayFindLastIndex062
     * @tc.desc Verify findLastIndex on empty/whitespace strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'b', ' ', 'c');
      const idx = arr.findLastIndex((s: string): boolean => s.trim().length === 0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_6300
     * @tc.name testArrayFindLastIndex063
     * @tc.desc Verify findLastIndex on mixed null/undefined/valid: ['a',null,'b',undefined,'c'], v===null → undefined at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined | null>('a', null, 'b', undefined, 'c');
      const idx = arr.findLastIndex((v: string | undefined | null): boolean => v == null);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_6400
     * @tc.name testArrayFindLastIndex064
     * @tc.desc Verify findLastIndex on SparseArray with holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<number>();
      arr[0] = 10;
      arr[2] = 30;
      arr[4] = 50;
      const idx = arr.findLastIndex((v: number): boolean => v > 20);
      expect(idx).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_6500
     * @tc.name testArrayFindLastIndex065
     * @tc.desc Verify filter + findLastIndex hybrid chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 2, 7, 4, 5, 1, 8, 3, 6, 10);
      const filtered = arr.filter((v: number): boolean => v % 2 === 0);
      const idx = filtered.findLastIndex((v: number): boolean => v === 2);
      expect(filtered.length).assertEqual(5);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_6600
     * @tc.name testArrayFindLastIndex066
     * @tc.desc Verify hybrid of findLastIndex with closure on inherited field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLastIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastIdxHybridB();
      const idx = obj.arr.findLastIndex((v: number): boolean => v > 3 && obj.label === 'hybrid');
      expect(idx).assertEqual(4);
    });
  });
}