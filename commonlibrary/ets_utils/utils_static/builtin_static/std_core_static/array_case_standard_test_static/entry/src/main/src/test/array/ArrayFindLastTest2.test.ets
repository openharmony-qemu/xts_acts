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

class FindLastPerson031 {
  id: string = '';
  name: string = '';
}

class FindLastFieldBase039 {
  items: Array<number> = new Array<number>(10, 20, 30, 40);
}

class FindLastFieldChild040 extends FindLastFieldBase039 {
  items: Array<number> = new Array<number>(100, 200, 300);
}

class FindLastAnimal041 {
  type: string = 'animal';
  sound: string = '';
}

class FindLastDog041 extends FindLastAnimal041 {
  type: string = 'dog';
  sound: string = 'bark';
}

class FindLastCat041 extends FindLastAnimal041 {
  type: string = 'cat';
  sound: string = 'meow';
}

class FindLastReadonlyField106 {
  readonly arr: Array<number> = new Array<number>(5, 10, 15, 20, 25);
}

class FindLastStaticField107 {
  static numbers: Array<number> = new Array<number>(1, 3, 5, 7, 9);
}

class FindLastInstanceField108 {
  numbers: Array<number> = new Array<number>(2, 4, 6, 8, 10);
}

class FindLastPrivateField109 {
  data: Array<number> = new Array<number>(100, 200, 300, 400);
}

class FindLastGenericHolder114<T> {
  data: Array<T> = new Array<T>();
}

class FindLastClosureScope121 {
  target: int = 5;
}

class FindLastCustomMethod122 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
  findLast(cb: (v: number) => boolean): number {
    return -1;
  }
}

class FindLastSubArray123 extends Array<number> {
}

class FindLastHybridA125 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
}

class FindLastHybridB125 extends FindLastHybridA125 {
  label: string = 'hybrid';
}

class FindLastSideEffect126 {
  counter: int = 0;
}

export default function ArrayFindLastTest2(): void {
  describe('ArrayFindLastTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0100
     * @tc.name testArrayFindLast001
     * @tc.desc Verify findLast on Array<string> returns last matching string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'y', 'z', 'y', 'x');
      const result = arr.findLast((s: string): boolean => s === 'y');
      expect(result).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0200
     * @tc.name testArrayFindLast002
     * @tc.desc Verify findLast on Array<boolean> returns last true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true, false, true, false);
      const result = arr.findLast((v: boolean): boolean => v);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0300
     * @tc.name testArrayFindLast003
     * @tc.desc Verify findLast on Array<double> returns last matching double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.5, 1.5, 2.5, 1.5, 0.5);
      const result = arr.findLast((v: double): boolean => v < 1.0);
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0400
     * @tc.name testArrayFindLast004
     * @tc.desc Verify findLast on Array<number | null> finds last null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null, 1, null, 2, null);
      const result = arr.findLast((v: number | null): boolean => v == null);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0500
     * @tc.name testArrayFindLast005
     * @tc.desc Verify findLast on large array returns last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      const result = arr.findLast((v: int): boolean => v < 500);
      expect(result).assertEqual(499);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0600
     * @tc.name testArrayFindLast006
     * @tc.desc Verify findLast predicate receives index and source array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLast((v: number, i: int, a: Array<number>): boolean => {
        return i === a.length - 1 && v === 5;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0700
     * @tc.name testArrayFindLast007
     * @tc.desc Verify findLast with compound condition on union typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(10, 'hello', 20, 'world', 30);
      const result = arr.findLast((v: int | string): boolean => {
        const valueType = Class.of(v).getName().split('.');
        return valueType[valueType.length - 1] === 'String';
      });
      expect(result).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0800
     * @tc.name testArrayFindLast008
     * @tc.desc Verify findLast result can be used with filter for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const filtered = arr.filter((v: number): boolean => v === 20);
      const last = arr.findLast((v: number): boolean => v === 20);
      expect(filtered.length).assertEqual(2);
      expect(last).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0900
     * @tc.name testArrayFindLast009
     * @tc.desc Verify findLast on single-element array returns the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true);
      expect(arr.findLast((v: boolean): boolean => v)).assertTrue();
      expect(arr.findLast((v: boolean): boolean => !v)).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1000
     * @tc.name testArrayFindLast010
     * @tc.desc Verify findLast on instance field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastInstanceField108();
      const result = obj.numbers.findLast((v: number): boolean => v > 5);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1100
     * @tc.name testArrayFindLast011
     * @tc.desc Verify findLast on static field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = FindLastStaticField107.numbers.findLast((v: number): boolean => v > 5);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1200
     * @tc.name testArrayFindLast012
     * @tc.desc Verify static field modified before findLast uses latest data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      FindLastStaticField107.numbers = new Array<number>(2, 4, 6, 8);
      const result = FindLastStaticField107.numbers.findLast((v: number): boolean => v > 5);
      expect(result).assertEqual(8);
      FindLastStaticField107.numbers = new Array<number>(1, 3, 5, 7, 9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1300
     * @tc.name testArrayFindLast013
     * @tc.desc Verify findLast on readonly field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastReadonlyField106();
      const result = obj.arr.findLast((v: number): boolean => v > 10);
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1400
     * @tc.name testArrayFindLast014
     * @tc.desc Verify findLast on public field via Class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastPrivateField109();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('data');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.findLast((v: number): boolean => v > 200);
        expect(result).assertEqual(400);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1500
     * @tc.name testArrayFindLast015
     * @tc.desc Verify findLast on parent class field through child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastFieldBase039();
      const result = obj.items.findLast((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1600
     * @tc.name testArrayFindLast016
     * @tc.desc Verify findLast on subclass overridden field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastFieldChild040();
      const result = obj.items.findLast((v: number): boolean => v === 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1700
     * @tc.name testArrayFindLast017
     * @tc.desc Verify findLast on polymorphic array — find last Cat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FindLastDog041();
      const cat1 = new FindLastCat041();
      const cat2 = new FindLastCat041();
      const animals = new Array<FindLastAnimal041>(dog, cat1, dog, cat2);
      const result = animals.findLast((a: FindLastAnimal041): boolean => a.sound === 'meow');
      if (result !== undefined) {
        expect(result).assertEqual(cat2);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1800
     * @tc.name testArrayFindLast018
     * @tc.desc Verify last match at tail returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 999);
      const result = arr.findLast((v: number): boolean => v > 50);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1900
     * @tc.name testArrayFindLast019
     * @tc.desc Verify last match at head returns head value after full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 10, 20, 30);
      const result = arr.findLast((v: number): boolean => v === 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2000
     * @tc.name testArrayFindLast020
     * @tc.desc Verify findLast with always-false predicate block returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLast((v: number): boolean => false);
      expect(result).assertUndefined();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2100
     * @tc.name testArrayFindLast021
     * @tc.desc Verify findLast on Array<byte> finds last negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(-128, 0, 64, -64, 127);
      const result = arr.findLast((v: byte): boolean => v < 0);
      expect(result).assertEqual(-64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2200
     * @tc.name testArrayFindLast022
     * @tc.desc Verify findLast on Array<short>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(-32768, -1, 0, 32767);
      const result = arr.findLast((v: short): boolean => v === 32767);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2300
     * @tc.name testArrayFindLast023
     * @tc.desc Verify findLast on Array<long>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(0, 2147483648, 9223372036854775807);
      const result = arr.findLast((v: long): boolean => v > 1000000);
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2400
     * @tc.name testArrayFindLast024
     * @tc.desc Verify findLast on Array<float>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(0.0 as float, -1.5 as float, 3.14 as float, 999.99 as float);
      const result = arr.findLast((v: float): boolean => v < 100.0 as float);
      expect(result).assertEqual(3.14 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2500
     * @tc.name testArrayFindLast025
     * @tc.desc Verify findLast on Array<char> finds last vowel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'e', c'f', c'i');
      const result = arr.findLast((c: char): boolean => c === c'e' || c === c'i');
      expect(result).assertEqual(c'i');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2600
     * @tc.name testArrayFindLast026
     * @tc.desc Verify findLast on Array<char> digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'5', c'Z', c'9', c'm');
      const result = arr.findLast((c: char): boolean => c >= c'0' && c <= c'9');
      expect(result).assertEqual(c'9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2700
     * @tc.name testArrayFindLast027
     * @tc.desc Verify findLast on Array<bigint>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(30n, 10n, 20n, 10n);
      const result = arr.findLast((v: bigint): boolean => v === 10n);
      expect(result).assertEqual(10n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2800
     * @tc.name testArrayFindLast028
     * @tc.desc Verify push inside findLast predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLast((v: number, i: int, a: Array<number>): boolean => {
        if (i === 4) {
          a.pushOne(99);
        }
        return v === 3;
      });
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_2900
     * @tc.name testArrayFindLast029
     * @tc.desc Verify pop inside findLast predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLast((v: number, i: int, a: Array<number>): boolean => {
        if (i === 4) {
          a.pop();
        }
        return v === 3;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3000
     * @tc.name testArrayFindLast030
     * @tc.desc Verify unshift inside findLast predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLast((v: number, i: int, a: Array<number>): boolean => {
        if (i === 4) {
          a.unshift(0);
        }
        return v > 3;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3100
     * @tc.name testArrayFindLast031
     * @tc.desc Verify length=0 during reverse iteration: last v>5 element is 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let visited = 0;
      const result = arr.findLast((v: number, i: int, a: Array<number>): boolean => {
        visited++;
        if (i === 7) {
          a.length = 0;
        }
        return v > 5;
      });
      expect(result).assertEqual(10);
      expect(visited).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3200
     * @tc.name testArrayFindLast032
     * @tc.desc Verify setting future element during reverse iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLast((v: number, i: int, a: Array<number>): boolean => {
        if (i === 4) {
          a[1] = 99;
        }
        return v > 3;
      });
      expect(arr[1]).assertEqual(99);
      expect(result).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3300
     * @tc.name testArrayFindLast033
     * @tc.desc Verify findLast closure captures threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FindLastClosureScope121();
      ctx.target = 3;
      const arr = new Array<number>(10, 20, 5, 30, 40);
      const result = arr.findLast((v: number): boolean => v > ctx.target);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3400
     * @tc.name testArrayFindLast034
     * @tc.desc Verify findLast with dynamic closure change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FindLastClosureScope121();
      ctx.target = 4;
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const before = arr.findLast((v: number): boolean => v > ctx.target);
      expect(before).assertEqual(50);
      ctx.target = 45;
      const after = arr.findLast((v: number): boolean => v > ctx.target);
      expect(after).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3500
     * @tc.name testArrayFindLast035
     * @tc.desc Verify findLast with wrapper function as alternative to bind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const fn = (cb: (v: number) => boolean): number | undefined => {
        return arr.findLast(cb);
      };
      const result = fn((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3600
     * @tc.name testArrayFindLast036
     * @tc.desc Verify findLast propagates exception thrown in predicate, then re-runs correctly after catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      try {
        arr.findLast((v: number): boolean => {
          if (v === 5) {
            throw new Error('stop');
          }
          return v > 4;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const r2 = arr.findLast((v: number): boolean => v > 4);
      expect(r2).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3700
     * @tc.name testArrayFindLast037
     * @tc.desc Verify findLast on 100000 array finds last element quickly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 100000; i++) {
        arr.pushOne(i);
      }
      const result = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3800
     * @tc.name testArrayFindLast038
     * @tc.desc Verify repeated findLast 1000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let result: number | undefined = undefined;
      for (let i = 0; i < 1000; i++) {
        result = arr.findLast((v: number): boolean => v === 3);
      }
      expect(result).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_3900
     * @tc.name testArrayFindLast039
     * @tc.desc Verify counter on found mid-array in reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50, 60);
      let counter = 0;
      const result = arr.findLast((v: number): boolean => {
        counter++;
        return v === 30;
      });
      expect(result).assertEqual(30);
      expect(counter).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4000
     * @tc.name testArrayFindLast040
     * @tc.desc Verify counter equals length when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let counter = 0;
      const result = arr.findLast((v: number): boolean => {
        counter++;
        return v > 100;
      });
      expect(result).assertUndefined();
      expect(counter).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4100
     * @tc.name testArrayFindLast041
     * @tc.desc Verify counter short-circuits at tail match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 999);
      let counter = 0;
      const result = arr.findLast((v: number): boolean => {
        counter++;
        return v > 50;
      });
      expect(result).assertEqual(999);
      expect(counter).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4200
     * @tc.name testArrayFindLast042
     * @tc.desc Verify findLast on NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.NaN, 1, Double.NaN, 3);
      const result = arr.findLast((v: number): boolean => isNaN(v));
      if (result !== undefined) {
        expect(isNaN(result)).assertTrue();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4300
     * @tc.name testArrayFindLast043
     * @tc.desc Verify findLast on Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.POSITIVE_INFINITY, 2, Double.NEGATIVE_INFINITY);
      const result = arr.findLast((v: number): boolean => !isFinite(v));
      if (result !== undefined) {
        expect(isFinite(result)).assertFalse();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4400
     * @tc.name testArrayFindLast044
     * @tc.desc Verify findLast on 0 vs -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, -0, 2);
      const result = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4500
     * @tc.name testArrayFindLast045
     * @tc.desc Verify findLast on generic number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FindLastGenericHolder114<number>();
      holder.data = new Array<number>(10, 20, 30, 40, 50);
      const result = holder.data.findLast((v: number): boolean => v > 25);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4600
     * @tc.name testArrayFindLast046
     * @tc.desc Verify findLast on generic string field: ['cat','dog','elephant','fox'], s.length>3 → 'elephant'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FindLastGenericHolder114<string>();
      holder.data = new Array<string>('cat', 'dog', 'elephant', 'fox');
      const result = holder.data.findLast((s: string): boolean => s.length > 3);
      expect(result).assertEqual('elephant');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4700
     * @tc.name testArrayFindLast047
     * @tc.desc Verify findLast on nested Array<Array<number>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4, 5);
      const inner3 = new Array<number>(6);
      const arr = new Array<Array<number>>(inner1, inner2, inner3);
      const result = arr.findLast((inner: Array<number>): boolean => inner.length === 1);
      expect(result).assertEqual(inner3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4800
     * @tc.name testArrayFindLast048
     * @tc.desc Verify findLast on Map<string, Array<number>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Array<number>>();
      map.set('a', new Array<number>(1, 2, 3, 4));
      const inner = map.get('a');
      if (inner !== undefined) {
        const result = inner.findLast((v: number): boolean => v === 3);
        expect(result).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_4900
     * @tc.name testArrayFindLast049
     * @tc.desc Verify custom findLast does not conflict with Array API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastCustomMethod122();
      const custom = obj.findLast((v: number): boolean => v > 2);
      expect(custom).assertEqual(-1);
      const real = obj.arr.findLast((v: number): boolean => v > 2);
      expect(real).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5000
     * @tc.name testArrayFindLast050
     * @tc.desc Verify findLast on plain array returns last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLast((v: number): boolean => v === 2);
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5100
     * @tc.name testArrayFindLast051
     * @tc.desc Verify findLast on object property match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FindLastPerson031();
      p1.id = '101';
      const p2 = new FindLastPerson031();
      p2.id = '102';
      const arr = new Array<FindLastPerson031>(p1, p2, p1);
      const result = arr.findLast((p: FindLastPerson031): boolean => p.id === '101');
      if (result !== undefined) {
        expect(result).assertEqual(p1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5200
     * @tc.name testArrayFindLast052
     * @tc.desc Verify findLast on phone-number format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('12345', '13800138000', '400-800-0000');
      const result = arr.findLast((s: string): boolean => s.length === 11);
      expect(result).assertEqual('13800138000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5300
     * @tc.name testArrayFindLast053
     * @tc.desc Verify findLast on date strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('2026-01-01', 'not-date', '2026-12-31');
      const result = arr.findLast((s: string): boolean => s.includes('-'));
      expect(result).assertEqual('2026-12-31');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5400
     * @tc.name testArrayFindLast054
     * @tc.desc Verify findLast on zero-width strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '​', 'world', '﻿', 'test');
      const result = arr.findLast((s: string): boolean => s.length > 5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5500
     * @tc.name testArrayFindLast055
     * @tc.desc Verify findLast on emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('test', '😀', '🔥🔥', '⭐⭐', 'end');
      const result = arr.findLast((s: string): boolean => s.length === 2);
      expect(result).assertEqual('⭐⭐');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5600
     * @tc.name testArrayFindLast056
     * @tc.desc Verify findLast on multi-language strings: English, Chinese, Korean, Arabic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '测试', '테스트', 'اختبار');
      const en = arr.findLast((s: string): boolean => s === 'hello');
      const zh = arr.findLast((s: string): boolean => s === '测试');
      const ko = arr.findLast((s: string): boolean => s === '테스트');
      const ar = arr.findLast((s: string): boolean => s === 'اختبار');
      expect(en).assertEqual('hello');
      expect(zh).assertEqual('测试');
      expect(ko).assertEqual('테스트');
      expect(ar).assertEqual('اختبار');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5700
     * @tc.name testArrayFindLast057
     * @tc.desc Verify findLast on subclass of Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new FindLastSubArray123();
      arr.pushOne(10);
      arr.pushOne(20);
      arr.pushOne(30);
      arr.pushOne(20);
      const result = arr.findLast((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5800
     * @tc.name testArrayFindLast058
     * @tc.desc Verify findLast on array with duplicate values: [10,20,30,20,10], v===20 → 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const result = arr.findLast((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_5900
     * @tc.name testArrayFindLast059
     * @tc.desc Verify consistent findLast across multiple Field reflections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastInstanceField108();
      const clazz = Class.of(obj);
      const f1 = clazz.getInstanceField('numbers');
      const f2 = clazz.getInstanceField('numbers');
      if (f1 !== undefined && f2 !== undefined) {
        const a1 = f1.getValue(obj) as Array<number>;
        const a2 = f2.getValue(obj) as Array<number>;
        const r1 = a1.findLast((v: number): boolean => v === 8);
        const r2 = a2.findLast((v: number): boolean => v === 8);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(8);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6000
     * @tc.name testArrayFindLast060
     * @tc.desc Verify findLast returns same object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FindLastPerson031();
      p.id = 'ref';
      const arr = new Array<FindLastPerson031>(p);
      const result = arr.findLast((v: FindLastPerson031): boolean => v.id === 'ref');
      expect(result).assertEqual(p);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6100
     * @tc.name testArrayFindLast061
     * @tc.desc Verify findLast on 1000 identical references returns last one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FindLastPerson031();
      p.id = 'same';
      const arr = new Array<FindLastPerson031>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(p);
      }
      const result = arr.findLast((v: FindLastPerson031): boolean => v.id === 'same');
      if (result !== undefined) {
        expect(result).assertEqual(p);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6200
     * @tc.name testArrayFindLast062
     * @tc.desc Verify findLast on XSS strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '<script>alert(1)</script>', 'normal', '<script>');
      const result = arr.findLast((s: string): boolean => s.includes('<script>'));
      expect(result).assertEqual('<script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6300
     * @tc.name testArrayFindLast063
     * @tc.desc Verify findLast on empty/whitespace strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'b', ' ', 'c');
      const result = arr.findLast((s: string): boolean => s.trim().length === 0);
      expect(result).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6400
     * @tc.name testArrayFindLast064
     * @tc.desc Verify findLast on mixed null/undefined/valid: ['a',null,'b',undefined,'c'], v===null finds undefined last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined | null>('a', null, 'b', undefined, 'c');
      const result = arr.findLast((v: string | undefined | null): boolean => v == null);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6500
     * @tc.name testArrayFindLast065
     * @tc.desc Verify findLast on SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<number>();
      arr[0] = 10;
      arr[2] = 30;
      arr[4] = 50;
      const result = arr.findLast((v: number): boolean => v > 20);
      expect(result).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6600
     * @tc.name testArrayFindLast066
     * @tc.desc Verify filter + findLast hybrid chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 2, 7, 4, 5, 1, 8, 3, 6, 10);
      const filtered = arr.filter((v: number): boolean => v % 2 === 0);
      const result = filtered.findLast((v: number): boolean => v === 2);
      expect(result).assertEqual(2);
      expect(filtered.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6700
     * @tc.name testArrayFindLast067
     * @tc.desc Verify hybrid findLast with closure on inherited field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindLastHybridB125();
      const result = obj.arr.findLast((v: number): boolean => v > 3 && obj.label === 'hybrid');
      expect(result).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_6800
     * @tc.name testArrayFindLast068
     * @tc.desc Verify findLast(always-true) equals at(-1) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFindLast068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const fl = arr.findLast((v: number): boolean => true);
      const atNeg1 = arr.at(-1);
      expect(fl).assertEqual(atNeg1);
    });
  });
}