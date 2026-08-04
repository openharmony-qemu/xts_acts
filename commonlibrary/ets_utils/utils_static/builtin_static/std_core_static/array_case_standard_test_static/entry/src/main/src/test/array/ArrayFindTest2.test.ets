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

class FindItem2 {
  id: int = 0;
  name: string = '';
}

class FindPerson031 {
  id: string = '';
  name: string = '';
}

class FindFieldBase039 {
  items: Array<number> = new Array<number>(10, 20, 30, 40);
}

class FindFieldChild040 extends FindFieldBase039 {
  items: Array<number> = new Array<number>(100, 200, 300);
}

class FindAnimal041 {
  type: string = 'animal';
  sound: string = '';
}

class FindDog041 extends FindAnimal041 {
  type: string = 'dog';
  sound: string = 'bark';
}

class FindCat041 extends FindAnimal041 {
  type: string = 'cat';
  sound: string = 'meow';
}

class FindReadonlyField106 {
  readonly arr: Array<number> = new Array<number>(5, 10, 15, 20, 25);
}

class FindStaticField107 {
  static numbers: Array<number> = new Array<number>(1, 3, 5, 7, 9);
}

class FindInstanceField108 {
  numbers: Array<number> = new Array<number>(2, 4, 6, 8, 10);
}

class FindPrivateField109 {
  data: Array<number> = new Array<number>(100, 200, 300, 400);
}

class FindGenericHolder114<T> {
  data: Array<T> = new Array<T>();
}

class FindClosureScope121 {
  target: int = 5;
}

class FindCustomMethod122 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
  find(cb: (v: number) => boolean): number {
    return -1;
  }
}

class FindSubArray123 extends Array<number> {
}

class FindHybridA125 {
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
}

class FindHybridB125 extends FindHybridA125 {
  label: string = 'hybrid';
}

export default function ArrayFindTest2(): void {
  describe('ArrayFindTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0100
     * @tc.name testArrayFind001
     * @tc.desc Verify find on Array<string> returns first matching string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('apple', 'banana', 'cherry', 'date');
      const result = arr.find((s: string): boolean => s.startsWith('b'));
      expect(result).assertEqual('banana');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0200
     * @tc.name testArrayFind002
     * @tc.desc Verify find on Array<boolean> returns first true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, false, true, false);
      const result = arr.find((v: boolean): boolean => v);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0300
     * @tc.name testArrayFind003
     * @tc.desc Verify find on Array<double> returns first matching double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.1, 0.2, 0.3, 0.4);
      const result = arr.find((v: double): boolean => v > 0.25);
      expect(result).assertEqual(0.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0400
     * @tc.name testArrayFind004
     * @tc.desc Verify find on Array<number | undefined> returns first defined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, undefined, 10, 20);
      const result = arr.find((v: number | undefined): boolean => v !== undefined);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0500
     * @tc.name testArrayFind005
     * @tc.desc Verify find on large array returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      const result = arr.find((v: int): boolean => v > 500);
      expect(result).assertEqual(501);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0600
     * @tc.name testArrayFind006
     * @tc.desc Verify find with compound condition on object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FindItem2();
      p1.id = 1;
      p1.name = 'Alice';
      const p2 = new FindItem2();
      p2.id = 2;
      p2.name = 'Bob';
      const p3 = new FindItem2();
      p3.id = 3;
      p3.name = 'Charlie';
      const arr = new Array<FindItem2>(p1, p2, p3);
      const result = arr.find((item: FindItem2): boolean => item.id > 1 && item.name !== 'Bob');
      if (result !== undefined) {
        expect(result.name).assertEqual('Charlie');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0700
     * @tc.name testArrayFind007
     * @tc.desc Verify chained filter().find() works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const result = arr.filter((v: int): boolean => v > 25).find((v: int): boolean => v > 35);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0800
     * @tc.name testArrayFind008
     * @tc.desc Verify find on single-element array returns the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'hello');
      expect(arr.find((s: string): boolean => s.length > 0)).assertEqual('hello');
      expect(arr.find((s: string): boolean => s.length > 10)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0900
     * @tc.name testArrayFind009
     * @tc.desc Verify find on union typed array returns first int or string match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(100, 'hello', 200, 'world');
      const firstStr = arr.find((v: int | string): boolean => {
        const valueType = Class.of(v).getName().split('.');
        return valueType[valueType.length - 1] === 'String';
      });
      expect(firstStr).assertEqual('hello');
      const firstBig = arr.find((v: int | string): boolean => {
        const valueType = Class.of(v).getName().split('.');
        if (valueType[valueType.length - 1] === 'Int') {
          return (v as int) > 150;
        }
        return false;
      });
      expect(firstBig).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1000
     * @tc.name testArrayFind010
     * @tc.desc Verify find on instance field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindInstanceField108();
      const result = obj.numbers.find((v: number): boolean => v > 6);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1100
     * @tc.name testArrayFind011
     * @tc.desc Verify find on static field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = FindStaticField107.numbers.find((v: number): boolean => v > 5);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1200
     * @tc.name testArrayFind012
     * @tc.desc Verify static field modified before find uses latest data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      FindStaticField107.numbers = new Array<number>(2, 4, 6, 8);
      const result = FindStaticField107.numbers.find((v: number): boolean => v > 5);
      expect(result).assertEqual(6);
      FindStaticField107.numbers = new Array<number>(1, 3, 5, 7, 9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1300
     * @tc.name testArrayFind013
     * @tc.desc Verify find on readonly field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindReadonlyField106();
      const result = obj.arr.find((v: number): boolean => v > 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1400
     * @tc.name testArrayFind014
     * @tc.desc Verify find on public field via Class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindPrivateField109();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('data');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.find((v: number): boolean => v > 200);
        expect(result).assertEqual(300);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1500
     * @tc.name testArrayFind015
     * @tc.desc Verify find on parent class field through child instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindFieldBase039();
      const result = obj.items.find((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1600
     * @tc.name testArrayFind016
     * @tc.desc Verify find on subclass overridden field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindFieldChild040();
      const result = obj.items.find((v: number): boolean => v === 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1700
     * @tc.name testArrayFind017
     * @tc.desc Verify find on polymorphic array — find first Cat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FindDog041();
      const cat1 = new FindCat041();
      const cat2 = new FindCat041();
      const animals = new Array<FindAnimal041>(dog, cat1, dog, cat2);
      const result = animals.find((a: FindAnimal041): boolean => a.sound === 'meow');
      if (result !== undefined) {
        expect(result).assertEqual(cat1);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1800
     * @tc.name testArrayFind018
     * @tc.desc Verify find returns first element at index 0 when match at head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(999, 10, 20, 30);
      const result = arr.find((v: number): boolean => v > 50);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1900
     * @tc.name testArrayFind019
     * @tc.desc Verify find returns last element at length-1 when match at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 999);
      const result = arr.find((v: number): boolean => v === 999);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2000
     * @tc.name testArrayFind020
     * @tc.desc Verify find with always-false predicate block returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.find((v: number): boolean => {
        const t = v * 2;
        return false;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2100
     * @tc.name testArrayFind021
     * @tc.desc Verify find on Array<byte> finds first positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(-128, 0, 64, -64, 127);
      const result = arr.find((v: byte): boolean => v > 0);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2200
     * @tc.name testArrayFind022
     * @tc.desc Verify find on Array<short>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(-32768, -1, 0, 32767);
      const result = arr.find((v: short): boolean => v >= 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2300
     * @tc.name testArrayFind023
     * @tc.desc Verify find on Array<long>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(0, 2147483648, 9223372036854775807);
      const result = arr.find((v: long): boolean => v > 1000000);
      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2400
     * @tc.name testArrayFind024
     * @tc.desc Verify find on Array<float>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(0.0 as float, -1.5 as float, 3.14 as float, 999.99 as float);
      const result = arr.find((v: float): boolean => v >= 0.0 as float);
      expect(result).assertEqual(0.0 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2500
     * @tc.name testArrayFind025
     * @tc.desc Verify find on Array<char> finds first vowel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'e', c'f', c'i');
      const result = arr.find((c: char): boolean => c === c'e' || c === c'i');
      expect(result).assertEqual(c'e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2600
     * @tc.name testArrayFind026
     * @tc.desc Verify find on Array<char> digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'5', c'Z', c'9', c'm');
      const result = arr.find((c: char): boolean => c >= c'0' && c <= c'9');
      expect(result).assertEqual(c'5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2700
     * @tc.name testArrayFind027
     * @tc.desc Verify find on Array<bigint>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(30n, 10n, 20n, 10n);
      const result = arr.find((v: bigint): boolean => v === 10n);
      expect(result).assertEqual(10n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2800
     * @tc.name testArrayFind028
     * @tc.desc Verify push inside find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.find((v: number, i: int, a: Array<number>): boolean => {
        if (i === 2) {
          a.pushOne(99);
        }
        return v > 4;
      });
      expect(result).assertEqual(5);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_2900
     * @tc.name testArrayFind029
     * @tc.desc Verify pop inside find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.find((v: number, i: int, a: Array<number>): boolean => {
        if (i === 2) {
          a.pop();
        }
        return v > 3;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3000
     * @tc.name testArrayFind030
     * @tc.desc Verify unshift inside find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let foundValue: number | undefined = undefined;
      const result = arr.find((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a.unshift(0);
        }
        return v > 4;
      });
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3100
     * @tc.name testArrayFind031
     * @tc.desc Verify length=0 during forward iteration returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let visited = 0;
      const result = arr.find((v: number, i: int, a: Array<number>): boolean => {
        visited++;
        if (i === 3) {
          a.length = 0;
        }
        return v > 5;
      });
      expect(result).assertUndefined();
      expect(visited).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3200
     * @tc.name testArrayFind032
     * @tc.desc Verify setting future element during forward iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.find((v: number, i: int, a: Array<number>): boolean => {
        if (i === 0) {
          a[3] = 99;
        }
        return v > 4;
      });
      expect(arr[3]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3300
     * @tc.name testArrayFind033
     * @tc.desc Verify find closure captures threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FindClosureScope121();
      ctx.target = 3;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.find((v: number): boolean => v > ctx.target);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3400
     * @tc.name testArrayFind034
     * @tc.desc Verify find with dynamic closure change: target=4, v>4 first match is 10; target=45, v>45 first match is 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FindClosureScope121();
      ctx.target = 4;
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const before = arr.find((v: number): boolean => v > ctx.target);
      expect(before).assertEqual(10);
      ctx.target = 45;
      const after = arr.find((v: number): boolean => v > ctx.target);
      expect(after).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3500
     * @tc.name testArrayFind035
     * @tc.desc Verify find with wrapper function as alternative to bind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const fn = (cb: (v: number) => boolean): number | undefined => {
        return arr.find(cb);
      };
      const result = fn((v: number): boolean => v === 30);
      expect(result).assertEqual(30);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3600
     * @tc.name testArrayFind036
     * @tc.desc Verify find throws then re-runs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      try {
        arr.find((v: number): boolean => {
          if (v === 3) {
            throw new Error('stop');
          }
          return v > 4;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const r2 = arr.find((v: number): boolean => v > 4);
      expect(r2).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3700
     * @tc.name testArrayFind037
     * @tc.desc Verify find on 100000 array returns first element immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 100000; i++) {
        arr.pushOne(i);
      }
      const result = arr.find((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3800
     * @tc.name testArrayFind038
     * @tc.desc Verify repeated find 1000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let result: number | undefined = undefined;
      for (let i = 0; i < 1000; i++) {
        result = arr.find((v: number): boolean => v === 3);
      }
      expect(result).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_3900
     * @tc.name testArrayFind039
     * @tc.desc Verify counter on found early in forward scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50, 60);
      let counter = 0;
      const result = arr.find((v: number): boolean => {
        counter++;
        return v === 20;
      });
      expect(result).assertEqual(20);
      expect(counter).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4000
     * @tc.name testArrayFind040
     * @tc.desc Verify find counter equals length when predicate has no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let counter = 0;
      const result = arr.find((v: number): boolean => {
        counter++;
        return v > 100;
      });
      expect(result).assertUndefined();
      expect(counter).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4100
     * @tc.name testArrayFind041
     * @tc.desc Verify counter short-circuits at head match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(999, 10, 20, 30);
      let counter = 0;
      const result = arr.find((v: number): boolean => {
        counter++;
        return v > 50;
      });
      expect(result).assertEqual(999);
      expect(counter).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4200
     * @tc.name testArrayFind042
     * @tc.desc Verify find on NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.NaN, 3, Double.NaN);
      const result = arr.find((v: number): boolean => isNaN(v));
      if (result !== undefined) {
        expect(isNaN(result)).assertTrue();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4300
     * @tc.name testArrayFind043
     * @tc.desc Verify find on Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.POSITIVE_INFINITY, 2, Double.NEGATIVE_INFINITY);
      const result = arr.find((v: number): boolean => !isFinite(v));
      if (result !== undefined) {
        expect(isFinite(result)).assertFalse();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4400
     * @tc.name testArrayFind044
     * @tc.desc Verify find on 0 vs -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 1, 0, 2);
      const result = arr.find((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4500
     * @tc.name testArrayFind045
     * @tc.desc Verify find on generic number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FindGenericHolder114<number>();
      holder.data = new Array<number>(10, 20, 30, 40, 50);
      const result = holder.data.find((v: number): boolean => v > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4600
     * @tc.name testArrayFind046
     * @tc.desc Verify find on generic string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FindGenericHolder114<string>();
      holder.data = new Array<string>('cat', 'dog', 'elephant', 'fox');
      const result = holder.data.find((s: string): boolean => s.length > 3);
      expect(result).assertEqual('elephant');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4700
     * @tc.name testArrayFind047
     * @tc.desc Verify find on nested Array<Array<number>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4, 5);
      const inner3 = Array.create<number>(1, 6);
      const arr = new Array<Array<number>>(inner1, inner2, inner3);
      const result = arr.find((inner: Array<number>): boolean => inner.length > 2);
      expect(result).assertEqual(inner2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4800
     * @tc.name testArrayFind048
     * @tc.desc Verify find on Map<string, Array<number>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Array<number>>();
      map.set('a', new Array<number>(1, 2, 3, 4));
      const inner = map.get('a');
      if (inner !== undefined) {
        const result = inner.find((v: number): boolean => v === 3);
        expect(result).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_4900
     * @tc.name testArrayFind049
     * @tc.desc Verify custom find does not conflict with Array API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindCustomMethod122();
      const custom = obj.find((v: number): boolean => v > 2);
      expect(custom).assertEqual(-1);
      const real = obj.arr.find((v: number): boolean => v > 2);
      expect(real).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5000
     * @tc.name testArrayFind050
     * @tc.desc Verify find on array with element match in middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.find((v: number): boolean => v === 2);
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5100
     * @tc.name testArrayFind051
     * @tc.desc Verify find on object property string match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FindPerson031();
      p1.id = '101';
      const p2 = new FindPerson031();
      p2.id = '102';
      const arr = new Array<FindPerson031>(p1, p2);
      const result = arr.find((p: FindPerson031): boolean => p.id === '102');
      if (result !== undefined) {
        expect(result).assertEqual(p2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5200
     * @tc.name testArrayFind052
     * @tc.desc Verify find on phone-number format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('12345', '13800138000', '400-800-0000');
      const result = arr.find((s: string): boolean => s.length === 11);
      expect(result).assertEqual('13800138000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5300
     * @tc.name testArrayFind053
     * @tc.desc Verify find on date strings: ['not-date','2026-03-05','2026/03/05'], s.includes('-') first matches 'not-date'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('not-date', '2026-03-05', '2026/03/05');
      const result = arr.find((s: string): boolean => s.includes('-'));
      expect(result).assertEqual('not-date');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5400
     * @tc.name testArrayFind054
     * @tc.desc Verify find on zero-width strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '​', 'world', '﻿', 'test');
      const result = arr.find((s: string): boolean => s.length > 5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5500
     * @tc.name testArrayFind055
     * @tc.desc Verify find on emoji strings: ['test','😀','🔥🔥','⭐⭐','end'], s.length===2 first matches '😀'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('test', '😀', '🔥🔥', '⭐⭐', 'end');
      const result = arr.find((s: string): boolean => s.length === 2);
      expect(result).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5600
     * @tc.name testArrayFind056
     * @tc.desc Verify find on multi-language strings: English, Chinese, Korean, Arabic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '测试', '테스트', 'اختبار');
      const en = arr.find((s: string): boolean => s === 'hello');
      const zh = arr.find((s: string): boolean => s === '测试');
      const ko = arr.find((s: string): boolean => s === '테스트');
      const ar = arr.find((s: string): boolean => s === 'اختبار');
      expect(en).assertEqual('hello');
      expect(zh).assertEqual('测试');
      expect(ko).assertEqual('테스트');
      expect(ar).assertEqual('اختبار');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5700
     * @tc.name testArrayFind057
     * @tc.desc Verify find on subclass of Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new FindSubArray123();
      arr.pushOne(10);
      arr.pushOne(20);
      arr.pushOne(30);
      const result = arr.find((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5800
     * @tc.name testArrayFind058
     * @tc.desc Verify find on array with duplicate values: [10,20,30,20,10], v===20 → 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const result = arr.find((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_5900
     * @tc.name testArrayFind059
     * @tc.desc Verify consistent find across multiple Field reflections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindInstanceField108();
      const clazz = Class.of(obj);
      const f1 = clazz.getInstanceField('numbers');
      const f2 = clazz.getInstanceField('numbers');
      if (f1 !== undefined && f2 !== undefined) {
        const a1 = f1.getValue(obj) as Array<number>;
        const a2 = f2.getValue(obj) as Array<number>;
        const r1 = a1.find((v: number): boolean => v === 6);
        const r2 = a2.find((v: number): boolean => v === 6);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6000
     * @tc.name testArrayFind060
     * @tc.desc Verify find returns same object reference for complex objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FindPerson031();
      p.id = 'ref';
      const arr = Array.create<FindPerson031>(1, p);
      const result = arr.find((v: FindPerson031): boolean => v.id === 'ref');
      expect(result).assertEqual(p);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6100
     * @tc.name testArrayFind061
     * @tc.desc Verify find on 1000 identical references returns first index matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FindPerson031();
      p.id = 'same';
      const arr = new Array<FindPerson031>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(p);
      }
      const result = arr.find((v: FindPerson031): boolean => v.id === 'same');
      if (result !== undefined) {
        expect(result).assertEqual(p);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6200
     * @tc.name testArrayFind062
     * @tc.desc Verify find on XSS strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '<script>alert(1)</script>', 'normal');
      const result = arr.find((s: string): boolean => s.includes('<script>'));
      expect(result).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6300
     * @tc.name testArrayFind063
     * @tc.desc Verify find on empty/whitespace strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'b', ' ', 'c');
      const result = arr.find((s: string): boolean => s.trim().length === 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6400
     * @tc.name testArrayFind064
     * @tc.desc Verify find on mixed null/undefined/valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined | null>('a', null, 'b', undefined);
      const result = arr.find((v: string | undefined | null): boolean => v == null);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6500
     * @tc.name testArrayFind065
     * @tc.desc Verify find on SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<number>();
      arr[0] = 10;
      arr[2] = 30;
      arr[4] = 50;
      const result = arr.find((v: number): boolean => v > 20);
      expect(result).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6600
     * @tc.name testArrayFind066
     * @tc.desc Verify filter + find hybrid chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 2, 7, 4, 5, 1, 8, 3, 6, 10);
      const filtered = arr.filter((v: number): boolean => v % 2 === 0);
      const result = filtered.find((v: number): boolean => v === 4);
      expect(result).assertEqual(4);
      expect(filtered.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6700
     * @tc.name testArrayFind067
     * @tc.desc Verify hybrid find with closure on inherited field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FindHybridB125();
      const result = obj.arr.find((v: number): boolean => v > 3 && obj.label === 'hybrid');
      expect(result).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_6800
     * @tc.name testArrayFind068
     * @tc.desc Verify find(always-true) equals at(0) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFind068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const f = arr.find((v: number): boolean => true);
      const at0 = arr.at(0);
      expect(f).assertEqual(at0);
    });
  });
}