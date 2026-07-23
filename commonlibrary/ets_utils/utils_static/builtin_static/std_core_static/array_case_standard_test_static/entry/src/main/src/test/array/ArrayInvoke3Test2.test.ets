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

class Invoke3Animal {
  kind: string = '';

  constructor(k: string) {
    this.kind = k;
  }
}

class Invoke3Dog extends Invoke3Animal {
  breed: string = '';

  constructor(k: string, b: string) {
    super(k);
    this.breed = b;
  }
}

class Invoke3Cat extends Invoke3Animal {
  color: string = '';

  constructor(k: string, c: string) {
    super(k);
    this.color = c;
  }
}

class Invoke3Data {
  id: int = 0;

  constructor(i: int) {
    this.id = i;
  }
}

class Invoke3Cfg {
  key: string = '';
  val: int = 0;
}

class Invoke3SubArray extends Array<int> {
}

export default function ArrayInvoke3Test2(): void {
  describe('ArrayInvoke3Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0100
     * @tc.name testArrayInvoke3001
     * @tc.desc Verify varargs creates Array<double> with double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.5, 1.5, 2.5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0.5);
      expect(arr[2]).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0200
     * @tc.name testArrayInvoke3002
     * @tc.desc Verify varargs with Array<Array<double>> nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<double>(1.5, 2.5);
      const inner2 = new Array<double>(3.5, 4.5);
      const arr = new Array<Array<double>>(inner1, inner2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][1]).assertEqual(2.5);
      expect(arr[1][0]).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0300
     * @tc.name testArrayInvoke3003
     * @tc.desc Verify varargs with 100 elements constructs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(arr.length).assertEqual(10);
      expect(arr[9]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0400
     * @tc.name testArrayInvoke3004
     * @tc.desc Verify varargs with filtered and mapped immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<int>(1, 2, 3, 4, 5, 6)
        .filter((v: int): boolean => v % 2 === 0)
        .map((v: int): int => v * 10);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(20);
      expect(result[2]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0500
     * @tc.name testArrayInvoke3005
     * @tc.desc Verify varargs with union int and string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(100, 'text', 200, 'data');
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual('text');
      expect(arr[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0600
     * @tc.name testArrayInvoke3006
     * @tc.desc Verify varargs with 50 contiguous integer elements constructs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50
      );
      expect(arr.length).assertEqual(50);
      expect(arr[0]).assertEqual(1);
      expect(arr[49]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0700
     * @tc.name testArrayInvoke3007
     * @tc.desc Verify varargs with all-negative integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(-10, -20, -30, -40, -50);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(-10);
      expect(arr[4]).assertEqual(-50);
      arr[2] = -99;
      expect(arr[2]).assertEqual(-99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0800
     * @tc.name testArrayInvoke3008
     * @tc.desc Verify varargs with polymorphic subclass instances assigned to base class array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Invoke3Animal>(
        new Invoke3Dog('mammal', 'husky'),
        new Invoke3Cat('mammal', 'orange'),
        new Invoke3Dog('mammal', 'poodle')
      );
      expect(arr.length).assertEqual(3);
      expect(arr[0] instanceof Invoke3Dog).assertTrue();
      expect(arr[1] instanceof Invoke3Cat).assertTrue();
      const dog = arr[0] as Invoke3Dog;
      expect(dog.breed).assertEqual('husky');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0900
     * @tc.name testArrayInvoke3009
     * @tc.desc Verify varargs with duplicate object reference stored at multiple positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new Invoke3Data(42);
      const arr = new Array<Invoke3Data>(shared, shared, shared);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(arr[1]);
      expect(arr[1]).assertEqual(arr[2]);
      arr[0].id = 99;
      expect(arr[1].id).assertEqual(99);
      expect(arr[2].id).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1000
     * @tc.name testArrayInvoke3010
     * @tc.desc Verify varargs array supports forEach reduce and sum after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 6, 8, 10);
      let sum = 0;
      arr.forEach((v: int): void => {
        sum += v;
      });
      expect(sum).assertEqual(30);
      const product = arr.reduce((acc: int, v: int): int => acc * v, 1);
      expect(product).assertEqual(3840);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1100
     * @tc.name testArrayInvoke3011
     * @tc.desc Verify two varargs arrays with identical elements are physically independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      const arr2 = new Array<int>(1, 2, 3);
      expect(arr1 !== arr2).assertTrue();
      arr1[0] = 99;
      expect(arr1[0]).assertEqual(99);
      expect(arr2[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1200
     * @tc.name testArrayInvoke3012
     * @tc.desc Verify varargs array of int | null | string with interleaved value types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null | string>(1, null, 'three', null, 5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertEqual('three');
      expect(arr[3]).assertNull();
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1300
     * @tc.name testArrayInvoke3013
     * @tc.desc Verify varargs array with negative zero -0 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, -0, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(-0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1400
     * @tc.name testArrayInvoke3014
     * @tc.desc Verify varargs with alternating boolean true false values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false, true, false);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[5]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1500
     * @tc.name testArrayInvoke3015
     * @tc.desc Verify varargs with class objects having different field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Invoke3Cfg();
      a.key = 'a';
      a.val = 1;
      const b = new Invoke3Cfg();
      b.key = 'b';
      b.val = 2;
      const c = new Invoke3Cfg();
      c.key = 'c';
      c.val = 3;
      const arr = new Array<Invoke3Cfg>(a, b, c);
      expect(arr.length).assertEqual(3);
      expect(arr[0].key).assertEqual('a');
      expect(arr[2].val).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1600
     * @tc.name testArrayInvoke3016
     * @tc.desc Verify varargs with long string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = 'x'.repeat(5000);
      const arr = new Array<string>('short', longStr, 'end');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('short');
      expect(arr[1].length).assertEqual(5000);
      expect(arr[2]).assertEqual('end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1700
     * @tc.name testArrayInvoke3017
     * @tc.desc Verify varargs array mixed with array literal elements produces nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2);
      const inner2 = new Array<int>(3, 4, 5);
      const arr = new Array<Array<int>>(inner1, inner2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1800
     * @tc.name testArrayInvoke3018
     * @tc.desc Verify varargs construction then chained filter map reduce all-in-one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        .filter((v: int): boolean => v % 2 === 0)
        .map((v: int): int => v * v)
        .reduce((acc: int, v: int): int => acc + v, 0);
      expect(result).assertEqual(220);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1900
     * @tc.name testArrayInvoke3019
     * @tc.desc Verify varargs constructed array can be immediately used as source for slice and concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Array<int>(10, 20, 30, 40, 50);
      const sliced = src.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual(20);
      expect(sliced[1]).assertEqual(30);
      const merged = src.concat(sliced);
      expect(merged.length).assertEqual(7);
      expect(merged[5]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2000
     * @tc.name testArrayInvoke3020
     * @tc.desc Verify varargs with BigInt elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2100
     * @tc.name testArrayInvoke3021
     * @tc.desc Verify varargs with function objects as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn1 = (): int => 10;
      const fn2 = (): int => 20;
      const arr = new Array<() => int>(fn1, fn2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]()).assertEqual(10);
      expect(arr[1]()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2200
     * @tc.name testArrayInvoke3022
     * @tc.desc Verify varargs constructed array: new Array<int>(10,20,30), length=3, elements at correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2300
     * @tc.name testArrayInvoke3023
     * @tc.desc Verify WeakRef wrapping of varargs constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 10, 15);
      const ref = new WeakRef<Array<int>>(arr);
      const deref = ref.deref();
      if (deref !== undefined) {
        expect(deref[1]).assertEqual(10);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2400
     * @tc.name testArrayInvoke3024
     * @tc.desc Verify subclass of Array with varargs construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Invoke3SubArray();
      arr.pushOne(10);
      arr.pushOne(20);
      arr.pushOne(30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2500
     * @tc.name testArrayInvoke3025
     * @tc.desc Verify high-throughput create and sum via reduce on varargs arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        const arr = new Array<int>(i, i + 1, i + 2);
        expect(arr.length).assertEqual(3);
        const sum = arr.reduce((acc: int, v: int): int => acc + v, 0);
        expect(sum).assertEqual(i * 3 + 3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2600
     * @tc.name testArrayInvoke3026
     * @tc.desc Verify varargs with all same string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'x', 'x', 'x', 'x');
      expect(arr.length).assertEqual(5);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual('x');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2700
     * @tc.name testArrayInvoke3027
     * @tc.desc Verify varargs with mixed double and int types under union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2.5, 3, 4.5);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2.5);
      expect(arr[3]).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2800
     * @tc.name testArrayInvoke3028
     * @tc.desc Verify varargs with integer MIN_VALUE and MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal = Number.MAX_SAFE_INTEGER.toInt();
      const minVal = Number.MIN_SAFE_INTEGER.toInt();
      const arr = new Array<int>(minVal, 0, maxVal);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(minVal);
      expect(arr[2]).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2900
     * @tc.name testArrayInvoke3029
     * @tc.desc Verify varargs with class object values of different shapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Invoke3Data>(new Invoke3Data(1), new Invoke3Data(2), new Invoke3Data(3));
      expect(arr.length).assertEqual(3);
      expect(arr[0].id).assertEqual(1);
      expect(arr[2].id).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3000
     * @tc.name testArrayInvoke3030
     * @tc.desc Verify varargs constructed array with 3 elements has correct length and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3100
     * @tc.name testArrayInvoke3031
     * @tc.desc Verify varargs constructed array with 2 elements has correct length and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3200
     * @tc.name testArrayInvoke3032
     * @tc.desc Verify varargs with 10 string elements constructs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke3032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j');
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual('a');
      expect(arr[9]).assertEqual('j');
    });
  });
}