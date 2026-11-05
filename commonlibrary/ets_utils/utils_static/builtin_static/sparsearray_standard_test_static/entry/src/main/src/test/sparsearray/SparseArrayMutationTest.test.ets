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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

import Utils from '../Util.test';

interface SparseArrayFillPart01Item {
  id: number;
  name: string;
}

interface SparseArrayFillPart03Object {
  id: int;
}

// Merged from SparseArrayFillPart01Test + SparseArrayFillPart03Test (39 scenarios -> 4 cases, each <=10)

function cmpNumber(a: number, b: number): int {
  if (a < b) {
    return -1;
  }
  if (a > b) {
    return 1;
  }
  return 0;
}

function cmpInt(a: int, b: int): int {
  if (a < b) {
    return -1;
  }
  if (a > b) {
    return 1;
  }
  return 0;
}

function cmpIntDesc(a: int, b: int): int {
  return cmpInt(b, a);
}

function cmpDouble(a: double, b: double): int {
  if (a < b) {
    return -1;
  }
  if (a > b) {
    return 1;
  }
  return 0;
}

function cmpDoubleDesc(a: double, b: double): int {
  return cmpDouble(b, a);
}

interface SortEntry029 {
  value: int;
  index: int;
}

function cmpSortEntryByValue(a: SortEntry029, b: SortEntry029): int {
  if (a.value < b.value) {
    return -1;
  }
  if (a.value > b.value) {
    return 1;
  }
  return 0;
}

function cmpStringLower(a: string, b: string): int {
  const la = a.toLowerCase();
  const lb = b.toLowerCase();
  if (la < lb) {
    return -1;
  }
  if (la > lb) {
    return 1;
  }
  return 0;
}

function cmpStringLocale(a: string, b: string): int {
  return a.localeCompare(b) as int;
}

function cmpStringLen(a: string, b: string): int {
  const d = a.length - b.length;
  if (d < 0) {
    return -1;
  }
  if (d > 0) {
    return 1;
  }
  return 0;
}

interface Person031 {
    name: string;
    age: number;
  }

function cmpPerson031ByAge(a: Person031, b: Person031): int {
  return cmpDouble(a.age as double, b.age as double);
}

class Product047 {
    name: string;
    price: number;
    constructor(name: string, price: number) {
      this.name = name;
      this.price = price;
    }
  }

function cmpProduct047Price(a: Product047, b: Product047): int {
  return cmpDouble(a.price as double, b.price as double);
}

class Item048 {
    name: string;
    price: number;
    constructor(name: string, price: number) {
      this.name = name;
      this.price = price;
    }
  }

function cmpItem048(a: Item048, b: Item048): int {
  if (a.price !== b.price) {
    return cmpDouble(a.price as double, b.price as double);
  }
  return a.name.localeCompare(b.name) as int;
}

class SortError01301 extends Error {
  errorCode: int = 100;
}

// Merged from SparseArraySortPart01Test (28 scenarios -> 3 cases, each <=10)

interface Person038 {
    name: string;
    age: int;
  }

export default function SparseArrayMutationTest(): void {
  describe('SparseArrayMutationTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0100
     * @tc.name testMutateFillNormal001
     * @tc.desc Test SparseArray.fill method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateFillNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(3, 4, 5);
          arr.fill(7, 0, 2);
          expect(arr[0]).assertEqual(7);
          expect(arr[1]).assertEqual(7);
          expect(arr[2]).assertEqual(5);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.fill(9, 2);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(9);
          expect(arr[3]).assertEqual(9);
          expect(arr[4]).assertEqual(9);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.fill(9, 0, 3);
          expect(arr[0]).assertEqual(9);
          expect(arr[1]).assertEqual(9);
          expect(arr[2]).assertEqual(9);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.fill(9, 1, 3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(9);
          expect(arr[2]).assertEqual(9);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<number | string>(1, "a", 2);
          arr.fill(3);
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(3);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(0, 0, 0);
          arr.fill(2147483647);
          expect(arr[0]).assertEqual(2147483647);
          expect(arr[1]).assertEqual(2147483647);
          expect(arr[2]).assertEqual(2147483647);


      }
      {
          const arr = new SparseArray<int>(0, 0, 0);
          arr.fill(-2147483648);
          expect(arr[0]).assertEqual(-2147483648);
          expect(arr[1]).assertEqual(-2147483648);
          expect(arr[2]).assertEqual(-2147483648);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.fill(0);
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(0);
          expect(arr[2]).assertEqual(0);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          arr.fill("");
          expect(arr[0]).assertEqual("");
          expect(arr[1]).assertEqual("");
          expect(arr[2]).assertEqual("");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          arr.fill("\u4e2d\u6587");
          expect(arr[0]).assertEqual("\u4e2d\u6587");
          expect(arr[1]).assertEqual("\u4e2d\u6587");
          expect(arr[2]).assertEqual("\u4e2d\u6587");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0200
     * @tc.name testMutateFillNormal002
     * @tc.desc Test SparseArray.fill method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateFillNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>("a", "b", "c");
          arr.fill("<script>alert(1)</script>");
          expect(arr[0]).assertEqual("<script>alert(1)</script>");
          expect(arr[1]).assertEqual("<script>alert(1)</script>");
          expect(arr[2]).assertEqual("<script>alert(1)</script>");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.fill(9, 2, 4);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(9);
          expect(arr[3]).assertEqual(9);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.fill(9, -3, 5);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(9);
          expect(arr[3]).assertEqual(9);
          expect(arr[4]).assertEqual(9);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.fill(9, 3, 5);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.fill(4, 1);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(4);
          expect(arr[2]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.fill(9, 0, 3);
          expect(arr[0]).assertEqual(9);
          expect(arr[1]).assertEqual(9);
          expect(arr[2]).assertEqual(9);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.fill(9, 1, 10);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(9);
          expect(arr[2]).assertEqual(9);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.fill(9, 0, -2);
          expect(arr[0]).assertEqual(9);
          expect(arr[1]).assertEqual(9);
          expect(arr[2]).assertEqual(9);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.fill(9, 1, 1);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.fill(9, 2, 1);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0300
     * @tc.name testMutateFillNormal003
     * @tc.desc Test SparseArray.fill method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateFillNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.fill(9, 1, 4);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(9);
          expect(arr[2]).assertEqual(9);
          expect(arr[3]).assertEqual(9);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.fill(4);
          expect(result).assertEqual(arr);
          expect(arr[0]).assertEqual(4);
          expect(arr[1]).assertEqual(4);
          expect(arr[2]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.fill(4).fill(5);
          expect(arr[0]).assertEqual(5);
          expect(arr[1]).assertEqual(5);
          expect(arr[2]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>();
          arr.fill(1);
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[4] = 5;
          arr.fill(9, 1, 4);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(9);
          expect(arr[2]).assertEqual(9);
          expect(arr[3]).assertEqual(9);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<char>(3);
          arr.fill(c'X');
          expect(arr[0]).assertEqual(c'X');
          expect(arr[1]).assertEqual(c'X');
          expect(arr[2]).assertEqual(c'X');

      }
      {
          const arr = new SparseArray<short>(3);
          arr.fill(100 as short);
          expect(arr[0]).assertEqual(100 as short);
          expect(arr[1]).assertEqual(100 as short);
          expect(arr[2]).assertEqual(100 as short);

      }
      {
          const arr = new SparseArray<long>(2);
          const val: long = 10000000000 as long;
          arr.fill(val);
          expect(arr[0]).assertEqual(val);
          expect(arr[1]).assertEqual(val);

      }
      {
          const arr = new SparseArray<int | null>(1, 2, 3);
          arr.fill(null);
          expect(arr[0]).assertEqual(null);
          expect(arr[1]).assertEqual(null);
          expect(arr[2]).assertEqual(null);

      }
      {
          const arr = new SparseArray<int | undefined>(1, 2, 3);
          arr.fill(undefined);
          expect(arr[0]).assertEqual(undefined);
          expect(arr[1]).assertEqual(undefined);
          expect(arr[2]).assertEqual(undefined);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0400
     * @tc.name testMutateFillNormal004
     * @tc.desc Test SparseArray.fill method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateFillNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(0, 0, 0, 0, 0);
          arr.fill(7, 0x1, 0b100);
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(7);
          expect(arr[2]).assertEqual(7);
          expect(arr[3]).assertEqual(7);
          expect(arr[4]).assertEqual(0);

      }
      {
          const arr = new SparseArray<string>(3);
          arr.fill("\u200B");
          expect(arr[0]).assertEqual("\u200B");
          expect(arr[1]).assertEqual("\u200B");
          expect(arr[2]).assertEqual("\u200B");

      }
      {
          const arr = new SparseArray<string>(3);
          arr.fill(" ");
          expect(arr[0]).assertEqual(" ");
          expect(arr[1]).assertEqual(" ");
          expect(arr[2]).assertEqual(" ");

      }
      {
          const arr = new SparseArray<boolean>(true, true, true, true);
          arr.fill(false, 1, 3);
          expect(arr[0]).assertEqual(true);
          expect(arr[1]).assertEqual(false);
          expect(arr[2]).assertEqual(false);
          expect(arr[3]).assertEqual(true);

      }
      {
          const value: byte = 7 as byte;
          const arr = new SparseArray<byte>(4);
          arr[3] = 1 as byte;
          arr.fill(value, 1);
          expect(arr[0]).assertUndefined();
          expect(arr[1]).assertEqual(value);
          expect(arr[2]).assertEqual(value);
          expect(arr[3]).assertEqual(value);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.fill(9, 2, 2);
          expect(result).assertEqual(arr);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          arr.fill(c'Z', -2);
          expect(arr[0]).assertEqual(c'A');
          expect(arr[1]).assertEqual(c'Z');
          expect(arr[2]).assertEqual(c'Z');

      }
      {
        // 1. fill(9) on empty -> length 0, returns this
        const arr1 = new SparseArray<int>();
        const r1 = arr1.fill(9);
        expect(r1).assertEqual(arr1);
        expect(arr1.length).assertEqual(0);
        // 2. fill(5) default on empty -> length 0 (no-op)
        const arr2 = new SparseArray<int>();
        arr2.fill(5);
        expect(arr2.length).assertEqual(0);
        // 3. fill(9) on (1,2,3,4) -> 9,9,9,9
        const arr3 = new SparseArray<int>(1, 2, 3, 4);
        arr3.fill(9);
        expect(arr3[0]).assertEqual(9);
        expect(arr3[3]).assertEqual(9);
        // 4. fill(9) on len=5 sparse@{0,4} -> 9,9,9
        const arr4 = new SparseArray<int>(5);
        arr4[0] = 1;
        arr4[4] = 5;
        arr4.fill(9);
        expect(arr4[0]).assertEqual(9);
        expect(arr4[1]).assertEqual(9);
        expect(arr4[4]).assertEqual(9);
        // 5. fill(INT_MAX) on (1,2) -> INT_MAX,INT_MAX
        const arr5 = new SparseArray<int>(1, 2);
        arr5.fill(2147483647);
        expect(arr5[0]).assertEqual(2147483647);
        expect(arr5[1]).assertEqual(2147483647);
        // 6. fill('中文') on ('en','us') -> '中文','中文'
        const arr6 = new SparseArray<string>('en', 'us');
        arr6.fill('中文');
        expect(arr6[0]).assertEqual('中文');
        expect(arr6[1]).assertEqual('中文');
        // 7. fill(0.0) on (1.5,2.5) -> 0.0,0.0
        const arr7 = new SparseArray<number>(1.5, 2.5);
        arr7.fill(0.0);
        expect(arr7[0]).assertEqual(0.0);
        expect(arr7[1]).assertEqual(0.0);
        // 8. fill(0n) on (1n,2n,3n) -> 0n,0n,0n
        const arr8 = new SparseArray<bigint>(1n, 2n, 3n);
        arr8.fill(0n);
        expect(arr8[0]).assertEqual(0n);
        expect(arr8[2]).assertEqual(0n);
        // 9. fill(9,0,2) on (1,2,3) -> 9,9,3, result===arr (returns this)
        const arr9 = new SparseArray<int>(1, 2, 3);
        const r9 = arr9.fill(9, 0, 2);
        expect(r9).assertEqual(arr9);
        expect(arr9[0]).assertEqual(9);
        expect(arr9[1]).assertEqual(9);
        expect(arr9[2]).assertEqual(3);

      }
      {
        // 1. fill(true) on (false,false,false) -> true,true,true
        const arr1 = new SparseArray<boolean>(false, false, false);
        arr1.fill(true);
        expect(arr1[0]).assertTrue();
        expect(arr1[2]).assertTrue();
        // 2. fill(false) on (true,true,true) -> false,false,false
        const arr2 = new SparseArray<boolean>(true, true, true);
        arr2.fill(false);
        expect(arr2[0]).assertFalse();
        expect(arr2[2]).assertFalse();
        // 3. fill(Double.NaN) on (1.0,2.0) -> NaN,NaN
        const arr3 = new SparseArray<number>(1.0, 2.0);
        arr3.fill(Double.NaN);
        expect(isNaN(arr3[0]!)).assertTrue();
        expect(isNaN(arr3[1]!)).assertTrue();
        // 4. fill(Double.POSITIVE_INFINITY) on (1.0,2.0)
        const arr4 = new SparseArray<number>(1.0, 2.0);
        arr4.fill(Double.POSITIVE_INFINITY);
        expect(arr4[0]).assertEqual(Double.POSITIVE_INFINITY);
        expect(arr4[1]).assertEqual(Double.POSITIVE_INFINITY);
        // 5. fill(Double.MAX_VALUE) on (1.0,2.0)
        const arr5 = new SparseArray<number>(1.0, 2.0);
        arr5.fill(Double.MAX_VALUE);
        expect(arr5[0]).assertEqual(Double.MAX_VALUE);
        expect(arr5[1]).assertEqual(Double.MAX_VALUE);
        // 6. fill(bigint MIN) on (0n,0n) -> MIN,MIN
        const arr6 = new SparseArray<bigint>(0n, 0n);
        arr6.fill(-9223372036854775807n - 1n);
        expect(arr6[0]).assertEqual(-9223372036854775807n - 1n);
        expect(arr6[1]).assertEqual(-9223372036854775807n - 1n);
        // 7. fill(replacement obj) on (obj,obj) -> 99,'filled'
        const obj7: SparseArrayFillPart01Item = { id: 1, name: 'test' };
        const arr7 = new SparseArray<SparseArrayFillPart01Item>(obj7, obj7);
        const rep7: SparseArrayFillPart01Item = { id: 99, name: 'filled' };
        arr7.fill(rep7);
        expect(arr7[0]!.id).assertEqual(99);
        expect(arr7[0]!.name).assertEqual('filled');
        expect(arr7[1]!.id).assertEqual(99);
        expect(arr7[1]!.name).assertEqual('filled');
        // 8. fill(fillDate) on (d1,d2) -> 5000,5000
        const arr8 = new SparseArray<Date>(new Date(1000), new Date(2000));
        const fd8: Date = new Date(5000);
        arr8.fill(fd8);
        expect(arr8[0]!.getTime()).assertEqual(5000);
        expect(arr8[1]!.getTime()).assertEqual(5000);
        // 9. fill(fillRe) on (r1,r2) -> 'fill','fill'
        const arr9 = new SparseArray<RegExp>(new RegExp('abc'), new RegExp('xyz'));
        const fr9: RegExp = new RegExp('fill');
        arr9.fill(fr9);
        expect(arr9[0]!.source).assertEqual('fill');
        expect(arr9[1]!.source).assertEqual('fill');
        // 10. fill(fillArr) on (inner1,inner2) -> 9,9,9,9
        const arr10 = new SparseArray<int[]>([1, 2], [3, 4]);
        const fa10: int[] = [9, 9];
        arr10.fill(fa10);
        expect(arr10[0]![0]).assertEqual(9);
        expect(arr10[0]![1]).assertEqual(9);
        expect(arr10[1]![0]).assertEqual(9);
        expect(arr10[1]![1]).assertEqual(9);

      }
      {
        // 1. fill(9,1) on (1,2,3) -> 1,9,9
        const arr1 = new SparseArray<int>(1, 2, 3);
        arr1.fill(9, 1);
        expect(arr1[0]).assertEqual(1);
        expect(arr1[1]).assertEqual(9);
        expect(arr1[2]).assertEqual(9);
        // 2. fill(9,0,-2) on (1,2,3,4) -> 9,9,3,4
        const arr2 = new SparseArray<int>(1, 2, 3, 4);
        arr2.fill(9, 0, -2);
        expect(arr2[0]).assertEqual(9);
        expect(arr2[1]).assertEqual(9);
        expect(arr2[2]).assertEqual(3);
        expect(arr2[3]).assertEqual(4);
        // 3. fill(9,0,5) on len=5 sparse@{0,4} -> 9,9,9
        const arr3 = new SparseArray<int>(5);
        arr3[0] = 1;
        arr3[4] = 5;
        arr3.fill(9, 0, 5);
        expect(arr3[0]).assertEqual(9);
        expect(arr3[1]).assertEqual(9);
        expect(arr3[4]).assertEqual(9);
        expect(arr3.length).assertEqual(5);
        // 4. fill(9,2,200) on len=6 sparse@{0,5} -> 1,9,9,9,9,9 (end clamp)
        const arr4 = new SparseArray<int>(6);
        arr4[0] = 1;
        arr4[5] = 6;
        arr4.fill(9, 2, 200);
        expect(arr4[0]).assertEqual(1);
        expect(arr4[2]).assertEqual(9);
        expect(arr4[3]).assertEqual(9);
        expect(arr4[4]).assertEqual(9);
        expect(arr4[5]).assertEqual(9);
        // 5. fill(5,0,3) on empty -> no extend, length 0
        const arr5 = new SparseArray<int>();
        arr5.fill(5, 0, 3);
        expect(arr5.length).assertEqual(0);
        expect(arr5[0]).assertUndefined();
        expect(arr5[2]).assertUndefined();
        // 6. fill(5,2,5) on len=5 sparse arr[0]=99 -> preserve 99, fill arr[2..4]=5
        const arr6 = new SparseArray<int>(5);
        arr6[0] = 99;
        arr6.fill(5, 2, 5);
        expect(arr6.length).assertEqual(5);
        expect(arr6[0]).assertEqual(99);
        expect(arr6[1]).assertUndefined();
        expect(arr6[2]).assertEqual(5);
        expect(arr6[4]).assertEqual(5);
        // 7. fill(0,4,5) on (1,2,3,4,5) -> only last becomes 0
        const arr7 = new SparseArray<int>(1, 2, 3, 4, 5);
        arr7.fill(0, 4, 5);
        expect(arr7.length).assertEqual(5);
        expect(arr7[3]).assertEqual(4);
        expect(arr7[4]).assertEqual(0);
        // 8. fill(7,1,5) on len=5 sparse@{0,4} -> arr[1]=7,arr[3]=7,arr[4]=7
        const arr8 = new SparseArray<int>(5);
        arr8[0] = 1;
        arr8[4] = 5;
        arr8.fill(7, 1, 5);
        expect(arr8[1]).assertEqual(7);
        expect(arr8[3]).assertEqual(7);
        expect(arr8[4]).assertEqual(7);
        // 9. fill(7,2,8) on len=6 sparse@{0,5} arr[0]=10,arr[5]=50 -> clamp end, length 6
        const arr9 = new SparseArray<int>(6);
        arr9[0] = 10;
        arr9[5] = 50;
        arr9.fill(7, 2, 8);
        expect(arr9.length).assertEqual(6);
        expect(arr9[1]).assertUndefined();
        expect(arr9[2]).assertEqual(7);
        expect(arr9[5]).assertEqual(7);
        expect(arr9[7]).assertUndefined();
        // 10. compound: fill(5,0,6) on (1,2); length=4; fill(7,0,4) -> 7,7,7,7
        const arr10 = new SparseArray<int>(1, 2);
        arr10.fill(5, 0, 6);
        arr10.length = 4;
        arr10.fill(7, 0, 4);
        expect(arr10.length).assertEqual(4);
        expect(arr10[0]).assertEqual(7);
        expect(arr10[3]).assertEqual(7);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0500
     * @tc.name testMutateFillNormal005
     * @tc.desc Test SparseArray.fill method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateFillNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. fill(0,-2,5) on (8,8,8,8,8) -> 8,8,8,0,0 (negative start)
        const arr1 = new SparseArray<int>(8, 8, 8, 8, 8);
        arr1.fill(0, -2, 5);
        expect(arr1[0]).assertEqual(8);
        expect(arr1[2]).assertEqual(8);
        expect(arr1[3]).assertEqual(0);
        expect(arr1[4]).assertEqual(0);
        // 2. fill(0,5,8) on (4,4,4) -> no-op, length 3
        const arr2 = new SparseArray<int>(4, 4, 4);
        arr2.fill(0, 5, 8);
        expect(arr2.length).assertEqual(3);
        expect(arr2[0]).assertEqual(4);
        expect(arr2[4]).assertUndefined();
        expect(arr2[5]).assertUndefined();
        expect(arr2[7]).assertUndefined();
        // 3. fill(1,0,6) on (6,6,6) -> clamp end, length 3, all 1
        const arr3 = new SparseArray<int>(6, 6, 6);
        arr3.fill(1, 0, 6);
        expect(arr3.length).assertEqual(3);
        expect(arr3[0]).assertEqual(1);
        expect(arr3[2]).assertEqual(1);
        // 4. fill(7,-3,6) on (11,22,33,44,55,66) -> 11,22,33,7,7,7 (negative start)
        const arr4 = new SparseArray<int>(11, 22, 33, 44, 55, 66);
        arr4.fill(7, -3, 6);
        expect(arr4[0]).assertEqual(11);
        expect(arr4[2]).assertEqual(33);
        expect(arr4[3]).assertEqual(7);
        expect(arr4[5]).assertEqual(7);
        // 5. fill(7,INT_MAX) on (1,2,3) -> no-op (start boundary)
        const arr5 = new SparseArray<int>(1, 2, 3);
        arr5.fill(7, 2147483647);
        expect(arr5[0]).assertEqual(1);
        expect(arr5[2]).assertEqual(3);
        expect(arr5.length).assertEqual(3);
        // 6. fill(7,-2,7) on (10,20,30,40,50) -> clamp both, length 5, arr[3..4]=7
        const arr6 = new SparseArray<int>(10, 20, 30, 40, 50);
        arr6.fill(7, -2, 7);
        expect(arr6.length).assertEqual(5);
        expect(arr6[1]).assertEqual(20);
        expect(arr6[3]).assertEqual(7);
        expect(arr6[4]).assertEqual(7);
        expect(arr6[6]).assertUndefined();
        // 7. fill('x',2,5) on ('a','b') -> no extend, length 2 (string)
        const arr7 = new SparseArray<string>('a', 'b');
        arr7.fill('x', 2, 5);
        expect(arr7.length).assertEqual(2);
        expect(arr7[0]).assertEqual('a');
        expect(arr7[2]).assertUndefined();
        expect(arr7[4]).assertUndefined();
        // 8. fill(true,0,4) on (true,false) -> clamp end, length 2, arr[0]=true (boolean)
        const arr8 = new SparseArray<boolean>(true, false);
        arr8.fill(true, 0, 4);
        expect(arr8.length).assertEqual(2);
        expect(arr8[0]).assertTrue();
        expect(arr8[3]).assertUndefined();
        // 9. fill(newObj,1,4) on (obj) -> no extend, length 1 (object)
        const obj9: SparseArrayFillPart03Object = { id: 99 };
        const arr9 = new SparseArray<SparseArrayFillPart03Object>(obj9);
        const newObj9: SparseArrayFillPart03Object = { id: 88 };
        arr9.fill(newObj9, 1, 4);
        expect(arr9.length).assertEqual(1);
        expect(arr9[0]!.id).assertEqual(99);
        expect(arr9[1]).assertUndefined();
        expect(arr9[3]).assertUndefined();
        // 10. fill(d,0,3) on (new Date(0)) -> clamp end, length 1, arr[0].getTime()=5000 (Date)
        const dateA: Date = new Date(5000);
        const arr10 = new SparseArray<Date>(new Date(0));
        arr10.fill(dateA, 0, 3);
        expect(arr10.length).assertEqual(1);
        expect(arr10[0]!.getTime()).assertEqual(5000);
        expect(arr10[2]).assertUndefined();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0600
     * @tc.name testMutateCopyWithinNormal001
     * @tc.desc Test SparseArray.copyWithin method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateCopyWithinNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          expect(arr instanceof SparseArray).assertTrue();
          arr.copyWithin(0)
          expect(arr.length).assertEqual(5);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(3, 4, 5);
          arr.copyWithin(2, 0, 2);
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(4);
          expect(arr[2]).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          expect(arr instanceof SparseArray).assertTrue();
          arr.copyWithin(0, 2)
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(4);
          expect(arr[2]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          expect(arr instanceof SparseArray).assertTrue()
          const originalLength = arr.length
          const result = arr.copyWithin(0, 3, 4)
          expect(result === arr).assertTrue()
          expect(arr.length === originalLength).assertTrue()
          expect(arr[0]).assertEqual(4)
          expect(arr[1]).assertEqual(2)
          expect(arr[2]).assertEqual(3)
          expect(arr[3]).assertEqual(4)
          expect(arr[4]).assertEqual(5)


      }
      {
          const arr = new SparseArray<int>()
          expect(arr instanceof SparseArray).assertTrue()
          let result = arr.copyWithin(0)
          expect(arr.length).assertEqual(0)
          expect(result.length === 0).assertTrue()
          const arr2 = new SparseArray<int>()
          result = arr2.copyWithin(0, 2147483647)
          expect(arr2.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>(4, 2, 4);
          arr.copyWithin(1, 0, 1);
          expect(arr[0]).assertEqual(4);
          expect(arr[1]).assertEqual(4);
          expect(arr[2]).assertEqual(4);

      }
      {
          const arr = new SparseArray<int>(2, 2, 3);
          arr.copyWithin(0, 1, 2);
          expect(arr[0]).assertEqual(2);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          expect(arr instanceof SparseArray).assertTrue();
          arr.copyWithin(0, -2)
          expect(arr[0]).assertEqual(4);
          expect(arr[1]).assertEqual(5);
          expect(arr[2]).assertEqual(3);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          expect(arr instanceof SparseArray).assertTrue();
          arr.copyWithin(0, 0, -2)
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          expect(arr instanceof SparseArray).assertTrue();
          arr.copyWithin(0, 4, 2)
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0700
     * @tc.name testMutateCopyWithinNormal002
     * @tc.desc Test SparseArray.copyWithin method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateCopyWithinNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5)
          expect(arr instanceof SparseArray).assertTrue();
          arr[0] = 1
          arr[2] = 3
          arr[4] = 5
          arr.copyWithin(0, 2, 5)
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(undefined);
          expect(arr[2]).assertEqual(5);
          expect(arr[3]).assertEqual(undefined);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          expect(arr instanceof SparseArray).assertTrue();
          arr.copyWithin(0, 1, 4)
          expect(arr[0]).assertEqual(2);
          expect(arr[1]).assertEqual(3);
          expect(arr[2]).assertEqual(4);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          expect(arr instanceof SparseArray).assertTrue();
          arr.copyWithin(3, 0, 3)
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);
          expect(arr[3]).assertEqual(1);
          expect(arr[4]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          expect(arr instanceof SparseArray).assertTrue()
          arr.copyWithin(5, 0, 3)
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(2)
          expect(arr[2]).assertEqual(3)
          const arr2 = new SparseArray<int>(1, 2, 3)
          arr2.copyWithin(0, 5)
          expect(arr2.length).assertEqual(3)
          expect(arr2[0]).assertEqual(1)
          expect(arr2[1]).assertEqual(2)
          expect(arr2[2]).assertEqual(3)
          const arr3 = new SparseArray<int>(1, 2, 3)
          arr3.copyWithin(0, 0, 10)
          expect(arr3.length).assertEqual(3)
          expect(arr3[0]).assertEqual(1)
          expect(arr3[1]).assertEqual(2)
          expect(arr3[2]).assertEqual(3)
          const arr4 = new SparseArray<int>(1, 2, 3)
          arr4.copyWithin(2147483647)
          expect(arr4.length).assertEqual(3)
          expect(arr4[0]).assertEqual(1)
          expect(arr4[1]).assertEqual(2)
          expect(arr4[2]).assertEqual(3)
          const arr5 = new SparseArray<int>(1, 2, 3)
          arr5.copyWithin(0, -2147483648)
          expect(arr5.length).assertEqual(3)
          expect(arr5[0]).assertEqual(1)
          expect(arr5[1]).assertEqual(2)
          expect(arr5[2]).assertEqual(3)


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          const result = arr.copyWithin(0, 3, 4).copyWithin(1, 0, 2)
          expect(result === arr).assertTrue()

      }
      {
          const arr = new SparseArray<int>(42)
          const result = arr.copyWithin(0)
          expect(result === arr).assertTrue()
          expect(result.length === 42).assertTrue()

      }
      {
          const arr = new SparseArray<int>(10000)
          expect(arr instanceof SparseArray).assertTrue();
          arr.copyWithin(0, 5000, 10000)
          expect(arr.length).assertEqual(10000);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6, 7)
          arr.copyWithin(0, 2, 5)
          expect(arr[0] === 3).assertTrue()
          expect(arr[1] === 4).assertTrue()
          expect(arr[2] === 5).assertTrue()

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          arr.copyWithin(2, 0, 4)
          expect(arr[2] === 1).assertTrue()
          expect(arr[3] === 2).assertTrue()

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 1
          arr[2] = 3
          arr[4] = 5
          arr.copyWithin(0, 0, 5)
          expect(arr[0] === 1).assertTrue()
          expect(arr[2] === 3).assertTrue()
          expect(arr[4] === 5).assertTrue()

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0800
     * @tc.name testMutateCopyWithinNormal003
     * @tc.desc Test SparseArray.copyWithin method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateCopyWithinNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          arr.copyWithin(0, 3, 5)
          arr.copyWithin(2, 0, 2)
          expect(arr[2] === 4).assertTrue()

      }
      {
          const arr = new SparseArray<string>("a", "b", "c", "d", "e")
          arr.copyWithin(0, 3, 4)
          expect(arr[0] === "d").assertTrue()

      }
      {
          const arr = new SparseArray<boolean>(true, false, true, false)
          arr.copyWithin(0, 2, 4)
          expect(arr[0] === true).assertTrue()
          expect(arr[1] === false).assertTrue()

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          const original = arr.toString()
          arr.copyWithin(0, 2, 2)
          expect(arr.toString() === original).assertTrue()

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          arr.copyWithin(4, 0, 1)
          expect(arr[4] === 1).assertTrue()

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.0f, 3.0f, 4.0f);
          arr.copyWithin(0, 2, 4);
          expect(arr[0]).assertEqual(3.0f);
          expect(arr[1]).assertEqual(4.0f);

      }
      {
          const arr = new SparseArray<byte>(10 as byte, 20 as byte, 30 as byte, 40 as byte);
          arr.copyWithin(0, 2, 4);
          expect(arr[0]).assertEqual(30 as byte);
          expect(arr[1]).assertEqual(40 as byte);

      }
      {
          const arr = new SparseArray<byte>(130 as int);
          arr[2] = 30 as byte;
          arr[3] = 40 as byte;
          arr.copyWithin(0x0, (-128) as int, 0x4);
          expect(arr[0]).assertEqual(30 as byte);
          expect(arr[1]).assertEqual(40 as byte);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6, 7, 8);
          arr.copyWithin(0, 0x7F as int, 0x80 as int);
          expect(arr[0]).assertEqual(1);
          expect(arr[7]).assertEqual(8);

      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          arr.copyWithin(-1, 0, 1);
          expect(arr[2]).assertEqual(10);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_0900
     * @tc.name testMutateCopyWithinError001
     * @tc.desc Test SparseArray.copyWithin method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateCopyWithinError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          try {
            arr.copyWithin((null as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.copyWithin((undefined as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.copyWithin(("1" as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.copyWithin(0, (null as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.copyWithin(0, (undefined as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.copyWithin(0, 1, (null as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.copyWithin(0, 1, ("2" as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1000
     * @tc.name testMutateReverseNormal001
     * @tc.desc Test SparseArray.reverse method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateReverseNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reverse();
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.reverse();
          expect(result).assertEqual(arr);
          expect(arr[0]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>();
          const result = arr.reverse();
          expect(result).assertEqual(arr);
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(42);
          arr.reverse();
          expect(arr.length).assertEqual(42);


      }
      {
          const arr = new SparseArray<int | undefined>(3);
          arr[0] = 1;
          arr[1] = undefined;
          arr[2] = 3;
          arr.reverse();
          expect(arr[0]).assertEqual(3);
          expect(arr[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          arr.reverse().reverse();
          expect(arr[0]).assertEqual(1);
          expect(arr[3]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.reverse().push(4);
          expect(arr[0]).assertEqual(3);
          expect(arr[3]).assertEqual(4);
          expect(result).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr.push(i);
          }
          arr.reverse();
          expect(arr.length).assertEqual(1000);
          expect(arr[0]).assertEqual(999);
          expect(arr[999]).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[2] = 10;
          arr[4] = 20;
          arr.reverse();
          expect(arr.length).assertEqual(5);
          expect(arr[0]).assertEqual(20);
          expect(arr[2]).assertEqual(10);


      }
      {
          const arr = new SparseArray<int>(3);
          arr[0] = 10;
          arr[2] = 30;
          arr.reverse();
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(30);
          expect(arr[2]).assertEqual(10);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1100
     * @tc.name testMutateReverseNormal002
     * @tc.desc Test SparseArray.reverse method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateReverseNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10);
          arr[9] = 100;
          arr.reverse();
          expect(arr.length).assertEqual(10);
          expect(arr[0]).assertEqual(100);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.reverse();
          expect(arr[0]).assertEqual(5);
          expect(arr[4]).assertEqual(1);


      }
      {
          const arr = new SparseArray<number>(1.1, 2.2, 3.3);
          arr.reverse();
          expect(arr[0]).assertEqual(3.3);
          expect(arr[2]).assertEqual(1.1);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          arr.reverse();
          expect(arr[0]).assertEqual("c");
          expect(arr[2]).assertEqual("a");


      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          arr.reverse();
          expect(arr[0]).assertEqual(true);
          expect(arr[1]).assertEqual(false);
          expect(arr[2]).assertEqual(true);


      }
      {
          const arr = new SparseArray<int | string | boolean>(1, "a", true);
          arr.reverse();
          expect(arr[0]).assertEqual(true);
          expect(arr[1]).assertEqual("a");
          expect(arr[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.reverse();
          arr.reverse();
          expect(arr[0]).assertEqual(1);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reverse().reverse().reverse();
          expect(arr[0]).assertEqual(3);
          expect(arr[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reverse();
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(1);
          arr.push(4);
          expect(arr.length).assertEqual(4);
          expect(arr[3]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reverse();
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(1);
          const popped = arr.pop();
          expect(popped).assertEqual(1);
          expect(arr.length).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1200
     * @tc.name testMutateReverseNormal003
     * @tc.desc Test SparseArray.reverse method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateReverseNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.reverse();
          arr.splice(1, 2, 99);
          expect(arr[0]).assertEqual(5);
          expect(arr[1]).assertEqual(99);
          expect(arr[2]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(10000);
          arr[9999] = 42;
          arr.reverse();
          expect(arr.length).assertEqual(10000);
          expect(arr[0]).assertEqual(42);


      }
      {
          const arr = new SparseArray<int>(1000);
          arr[0] = 1;
          arr[999] = 2;
          arr.reverse();
          expect(arr[0]).assertEqual(2);
          expect(arr[999]).assertEqual(1);


      }
      {
          const arr1 = new SparseArray<int>(1, 2, 3);
          const arr2 = arr1;
          arr1.reverse();
          expect(arr2[0]).assertEqual(3);
          expect(arr2[2]).assertEqual(1);


      }
      {
          const arr1 = new SparseArray<int>(1, 2, 3);
          const reversed = arr1.reverse();
          expect(reversed).assertEqual(arr1);
          expect(arr1[0]).assertEqual(3);

          const arr2 = new SparseArray<int>(1, 2, 3);
          const toReversedArr = arr2.toReversed();
          expect(toReversedArr[0]).assertEqual(3);
          expect(arr2[0]).assertEqual(1);


      }
      {
          const arr1 = new SparseArray<int>(1, 2, 3);
          arr1.reverse();
          expect(arr1[0]).assertEqual(3);

          const arr2 = new SparseArray<int>();
          arr2.push(1, 2, 3);
          arr2.reverse();
          expect(arr2[0]).assertEqual(3);

          const arr3 = SparseArray.of<int>(1, 2, 3);
          arr3.reverse();
          expect(arr3[0]).assertEqual(3);


      }
      {
          const arr1 = new SparseArray<int>(1, 2, 3);
          arr1.reverse();
          expect(arr1.toString()).assertEqual('3,2,1');
          const arr2 = new SparseArray<int>();
          arr2.push(1, 2, 3);
          arr2.reverse();
          expect(arr2.toString()).assertEqual('3,2,1');
          const arr3 = SparseArray.of<int>(1, 2, 3);
          arr3.reverse();
          expect(arr3.toString()).assertEqual('3,2,1');


      }
      {
          const arr = SparseArray.from<int>([1, 2, 3, 4, 5]);
          arr.reverse();
          expect(arr.toString()).assertEqual('5,4,3,2,1');


      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long);
          arr.reverse();
          expect(arr[0]).assertEqual(10000000000 as long);
          expect(arr[1]).assertEqual(1 as long);

      }
      {
          const arr = new SparseArray<int>(0x3, 0b10, 0o5);
          arr.reverse();
          expect(arr[0]).assertEqual(0o5);
          expect(arr[2]).assertEqual(0x3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1300
     * @tc.name testMutateReverseNormal004
     * @tc.desc Test SparseArray.reverse method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateReverseNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          const result = arr.reverse();
          expect(result).assertEqual(arr);
          expect(arr[0]).assertEqual(c'C');
          expect(arr[2]).assertEqual(c'A');

      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          arr.reverse();
          expect(arr.length).assertEqual(3);
          expect(arr[1]).assertEqual(false);

      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined, 3);
          arr.reverse();
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertUndefined();
          expect(arr[2]).assertEqual(1);

      }
      {
          const arr = new SparseArray<string>(6);
          arr[5] = "tail";
          arr.reverse();
          expect(arr.length).assertEqual(6);
          expect(arr[0]).assertEqual("tail");
          expect(arr[5]).assertUndefined();

      }
      {
        // 1. reverse mutates in place; arr and returned share first element 3
        const arr1 = new SparseArray<int>(1, 2, 3);
        const returned1 = arr1.reverse();
        expect(arr1[0]!).assertEqual(3);
        expect(returned1[0]!).assertEqual(3);
        expect(arr1[0]!).assertEqual(returned1[0]!);
        // 2. reverse twice on (1,2,3) restores 1,2,3
        const arr2 = new SparseArray<int>(1, 2, 3);
        arr2.reverse();
        arr2.reverse();
        expect(arr2[0]!).assertEqual(1);
        expect(arr2[1]!).assertEqual(2);
        expect(arr2[2]!).assertEqual(3);
        // 3. reverse three times on (1..5) yields 5,4,3,2,1
        const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
        arr3.reverse();
        arr3.reverse();
        arr3.reverse();
        expect(arr3[0]!).assertEqual(5);
        expect(arr3[1]!).assertEqual(4);
        expect(arr3[2]!).assertEqual(3);
        expect(arr3[3]!).assertEqual(2);
        expect(arr3[4]!).assertEqual(1);
        // 4. reverse on (10,20,30,40,50): arr[1..3] = 40,30,20
        const arr4 = new SparseArray<int>(10, 20, 30, 40, 50);
        arr4.reverse();
        expect(arr4[1]!).assertEqual(40);
        expect(arr4[2]!).assertEqual(30);
        expect(arr4[3]!).assertEqual(20);
        // 5. reverse on (10,20) -> 20,10; length stays 2
        const arr5 = new SparseArray<int>(10, 20);
        arr5.reverse();
        expect(arr5[0]!).assertEqual(20);
        expect(arr5[1]!).assertEqual(10);
        expect(arr5.length).assertEqual(2);
        // 6. reverse on (-1,-2,-3) -> -3,-2,-1
        const arr6 = new SparseArray<int>(-1, -2, -3);
        arr6.reverse();
        expect(arr6[0]!).assertEqual(-3);
        expect(arr6[1]!).assertEqual(-2);
        expect(arr6[2]!).assertEqual(-1);
        // 7. reverse on (1,2,3,4) -> 4,3,2,1
        const arr7 = new SparseArray<int>(1, 2, 3, 4);
        arr7.reverse();
        expect(arr7[0]!).assertEqual(4);
        expect(arr7[1]!).assertEqual(3);
        expect(arr7[2]!).assertEqual(2);
        expect(arr7[3]!).assertEqual(1);
        // 8. reverse on (1..6): length 6, arr[0]=6, arr[5]=1
        const arr8 = new SparseArray<int>(1, 2, 3, 4, 5, 6);
        arr8.reverse();
        expect(arr8.length).assertEqual(6);
        expect(arr8[0]!).assertEqual(6);
        expect(arr8[5]!).assertEqual(1);
        // 9. reverse before join() -> "3,2,1"
        const arr9 = new SparseArray<int>(1, 2, 3);
        arr9.reverse();
        expect(arr9.join()).assertEqual('3,2,1');
        // 10. reverse then toReversed() restores 1,2,3
        const arr10 = new SparseArray<int>(1, 2, 3);
        arr10.reverse();
        const result10 = arr10.toReversed();
        expect(result10[0]!).assertEqual(1);
        expect(result10[1]!).assertEqual(2);
        expect(result10[2]!).assertEqual(3);

      }
      {
        // 1. reverse on (start, LONG_STR, end) -> end, LONG_STR, start
        const LONG_STR: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.repeat(200);
        const arr1 = new SparseArray<string>('start', LONG_STR, 'end');
        arr1.reverse();
        expect(arr1[0]!).assertEqual('end');
        expect(arr1[1]!).assertEqual(LONG_STR);
        expect(arr1[2]!).assertEqual('start');
        // 2. reverse on (false, false): both stay false
        const arr2 = new SparseArray<boolean>(false, false);
        arr2.reverse();
        expect(arr2[0]!).assertFalse();
        expect(arr2[1]!).assertFalse();
        // 3. reverse on (1.0, Double.MAX_VALUE, 2.0) -> 2.0, MAX, 1.0
        const arr3 = new SparseArray<double>(1.0, Double.MAX_VALUE, 2.0);
        arr3.reverse();
        expect(arr3[0]!).assertEqual(2.0);
        expect(arr3[1]!).assertEqual(Double.MAX_VALUE);
        expect(arr3[2]!).assertEqual(1.0);
        // 4. reverse on (MIN_BIGINT, 0n, 100n) -> 100n, 0n, MIN_BIGINT
        const MIN_BIGINT: bigint = -9223372036854775808n;
        const arr4 = new SparseArray<bigint>(MIN_BIGINT, 0n, 100n);
        arr4.reverse();
        expect(arr4[0]!).assertEqual(100n);
        expect(arr4[1]!).assertEqual(0n);
        expect(arr4[2]!).assertEqual(MIN_BIGINT);
        // 5. reverse on (true, false, false): [0] false, [2] true
        const arr5 = new SparseArray<boolean>(true, false, false);
        const returned5 = arr5.reverse();
        expect(returned5[0]!).assertFalse();
        expect(returned5[2]!).assertTrue();
        // 6. reverse on (Date 0, Date 1000) swaps getTime -> 1000, 0
        const arr6 = new SparseArray<Date>(new Date(0), new Date(1000));
        arr6.reverse();
        expect(arr6[0]!.getTime()).assertEqual(1000);
        expect(arr6[1]!.getTime()).assertEqual(0);
        // 7. reverse on (1.0, NaN, 3.0) -> 3.0, NaN, 1.0
        const arr7 = new SparseArray<double>(1.0, Double.NaN, 3.0);
        arr7.reverse();
        expect(arr7[0]!).assertEqual(3.0);
        expect(arr7[2]!).assertEqual(1.0);
        expect(isNaN(arr7[1]!)).assertTrue();
        // 8. reverse on (中文, abc, 😀) -> 😀, abc, 中文
        const arr8 = new SparseArray<string>('中文', 'abc', '😀');
        arr8.reverse();
        expect(arr8[0]!).assertEqual('😀');
        expect(arr8[1]!).assertEqual('abc');
        expect(arr8[2]!).assertEqual('中文');
        // 9. reverse on long (10, 20) -> 20, 10
        const arr9 = new SparseArray<long>(10 as long, 20 as long);
        arr9.reverse();
        expect(arr9[0]!).assertEqual(20 as long);
        expect(arr9[1]!).assertEqual(10 as long);
        // 10. reverse on (aa, bb) -> bb, aa
        const arr10 = new SparseArray<string>('aa', 'bb');
        arr10.reverse();
        expect(arr10[0]!).assertEqual('bb');
        expect(arr10[1]!).assertEqual('aa');

      }
      {
        // 1. reverse on empty array keeps length 0
        const arr1 = new SparseArray<int>();
        arr1.reverse();
        expect(arr1.length).assertEqual(0);
        // 2. reverse on SparseArray.of(7): length 1, arr[0]=7
        const arr2 = SparseArray.of<int>(7);
        arr2.reverse();
        expect(arr2.length).assertEqual(1);
        expect(arr2[0]!).assertEqual(7);
        // 3. reverse on all-hole len=4 array: all undefined, length 4
        const arr3 = new SparseArray<int>(4);
        arr3.reverse();
        expect(arr3[0]).assertUndefined();
        expect(arr3[1]).assertUndefined();
        expect(arr3[2]).assertUndefined();
        expect(arr3[3]).assertUndefined();
        expect(arr3.length).assertEqual(4);
        // 4. reverse on sparse {0:1, 3:4} len=4: arr[0]=4, arr[3]=1, middle undefined
        const arr4 = new SparseArray<int>(4);
        arr4[0] = 1;
        arr4[3] = 4;
        arr4.reverse();
        expect(arr4.length).assertEqual(4);
        expect(arr4[0]!).assertEqual(4);
        expect(arr4[1]).assertUndefined();
        expect(arr4[2]).assertUndefined();
        expect(arr4[3]!).assertEqual(1);
        // 5. reverse on sparse {0:100, 1:200} len=4: arr[2]=200, arr[3]=100, [0..1] undefined
        const arr5 = new SparseArray<int>(4);
        arr5[0] = 100;
        arr5[1] = 200;
        arr5.reverse();
        expect(arr5[0]).assertUndefined();
        expect(arr5[1]).assertUndefined();
        expect(arr5[2]!).assertEqual(200);
        expect(arr5[3]!).assertEqual(100);
        // 6. reverse on len=3 filled only at index 1 (5): arr[1]=5, [0]&[2] undefined
        const arr6 = new SparseArray<int>(3);
        arr6[1] = 5;
        arr6.reverse();
        expect(arr6[0]).assertUndefined();
        expect(arr6[1]!).assertEqual(5);
        expect(arr6[2]).assertUndefined();
        // 7. reverse on sparse {0:1, 100:2}: arr[0]=2, arr[100]=1, length 101
        const arr7 = new SparseArray<int>();
        arr7[0] = 1;
        arr7[100] = 2;
        arr7.reverse();
        expect(arr7.length).assertEqual(101);
        expect(arr7[0]!).assertEqual(2);
        expect(arr7[100]!).assertEqual(1);
        // 8. reverse on (MAX_INT, 2, 1) -> 1, 2, MAX_INT; length 3
        const arr8 = new SparseArray<int>(2147483647, 2, 1);
        arr8.reverse();
        expect(arr8[0]!).assertEqual(1);
        expect(arr8[1]!).assertEqual(2);
        expect(arr8[2]!).assertEqual(2147483647);
        expect(arr8.length).assertEqual(3);
        // 9. reverse on ('', 'a') -> 'a', ''
        const arr9 = new SparseArray<string>('', 'a');
        arr9.reverse();
        expect(arr9[0]!).assertEqual('a');
        expect(arr9[1]!).assertEqual('');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1400
     * @tc.name testMutateSortNormal001
     * @tc.desc Test SparseArray.sort method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSortNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<number>(10, 2, 8, 5);
          const result = arr.sort(cmpNumber);
          expect(result).assertEqual(arr);
          expect(arr[0]).assertEqual(2);


      }
      {
          const arr = new SparseArray<number>(3, 1, 4, 1, 5);
          const result = arr.sort(cmpDouble);
          expect(result).assertEqual(arr);
          expect(arr[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<number>(5, 3, 1, 4, 2);
          arr.sort(cmpDouble);
          expect(arr[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<number>(3, 2, 1);
          arr.sort(cmpDouble);
          expect(arr[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<number>(1, 2);
          expect(arr instanceof SparseArray).assertTrue();
          arr.sort(cmpDouble);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(7, 3, 3);
          arr.sort((x: int, y: int): int => x - y);
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(3);
          expect(arr[2]).assertEqual(7);

      }
      {
          const arr = new SparseArray<number>(1, 2, 3);
          arr.sort(cmpDouble);
          expect(arr[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<number>(10, 2, 5);
          expect(arr instanceof SparseArray).assertTrue();
          arr.sort(cmpNumber);
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(2);
          expect(arr[1]).assertEqual(5);
          expect(arr[2]).assertEqual(10);


      }
      {
          const arr = new SparseArray<int>(3, 6, 3);
          arr.sort((x: int, y: int): int => x - y);
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(3);
          expect(arr[2]).assertEqual(6);

      }
      {
          const arr = new SparseArray<number>(1, 2);
          arr.sort(cmpDouble);
          expect(arr[0]).assertEqual(1);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1500
     * @tc.name testMutateSortNormal002
     * @tc.desc Test SparseArray.sort method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSortNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<number>(5, 3, 1, 4, 2);
          arr.sort(cmpDouble);
          expect(arr[0]).assertEqual(1);
          expect(arr[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<string>("banana", "apple", "cherry");
          arr.sort(cmpStringLocale);
          expect(arr[0]).assertEqual("apple");
          expect(arr[1]).assertEqual("banana");
          expect(arr[2]).assertEqual("cherry");


      }
      {
          const arr = new SparseArray<number>();
          const result = arr.sort();
          expect(result).assertEqual(arr);
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<number>();
          arr.push(42);
          const result = arr.sort();
          expect(result).assertEqual(arr);
          expect(arr[0]).assertEqual(42);


      }
      {
          const arr = new SparseArray<number>(6);
          expect(arr instanceof SparseArray).assertTrue();
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 20;
          arr.sort(cmpDouble);
          expect(arr.length).assertEqual(6);
          expect(arr[0]).assertEqual(10);
          expect(arr[2]).assertEqual(20);
          expect(arr[4]).assertEqual(30);


      }
      {
          const arr = new SparseArray<number>(3, 1, 4, 1, 5, 9, 2, 6, 5);
          arr.sort(cmpDouble);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(1);


      }
      {
          const arr = new SparseArray<number>(3, 1, 4, 1, 5);
          const result = arr.sort(cmpDouble);
          expect(result).assertEqual(arr);
          expect(result === arr).assertTrue();


      }
      {
          const arr = new SparseArray<number>(3, 1, 4);
          arr.sort(cmpDouble)
             .sort(cmpDoubleDesc);
          expect(arr[0]).assertEqual(4);
          expect(arr[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<number>(2, 1);
          const originalRef = arr;
          arr.sort();
          expect(arr).assertEqual(originalRef);


      }
      {
          const arr1 = new SparseArray<number>(3, 1, 2);
          const arr2 = arr1;
          arr1.sort(cmpDouble);
          expect(arr2[0]).assertEqual(1);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1600
     * @tc.name testMutateSortNormal003
     * @tc.desc Test SparseArray.sort method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSortNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<number>(3, 1, 2);
          const result: SparseArray<number> = arr.sort();
          expect(result!.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<number>();
          for (let i = 1000; i >= 1; i--) {
            arr.push(i);
          }
          arr.sort(cmpDouble);
          expect(arr[0]).assertEqual(1);
          expect(arr[999]).assertEqual(1000);


      }
      {
          const arr = new SparseArray<number>(
            Number.MAX_VALUE,
            Number.MIN_VALUE,
            0,
            -1,
            1
          );
          arr.sort(cmpDouble);
          expect(arr[0]).assertEqual(-1);
          expect(arr[4]).assertEqual(Number.MAX_VALUE);


      }
      {
          const arr = new SparseArray<int>(5, 2, 4);
          arr.sort((x: int, y: int): int => x - y);
          expect(arr[0]).assertEqual(2);
          expect(arr[1]).assertEqual(4);
          expect(arr[2]).assertEqual(5);

      }
      {
          const arr = new SparseArray<int>(6, 3, 5);
          arr.sort((x: int, y: int): int => x - y);
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(5);
          expect(arr[2]).assertEqual(6);

      }
      {
          const arr = new SparseArray<SortEntry029>();
          arr.push({ value: 1, index: 0 }, { value: 1, index: 1 }, { value: 1, index: 2 });
          arr.sort(cmpSortEntryByValue);
          const e0 = arr[0];
          const e1 = arr[1];
          const e2 = arr[2];
          expect(e0 != null && e1 != null && e2 != null).assertTrue();
          expect((e0 as SortEntry029).index).assertEqual(0);
          expect((e1 as SortEntry029).index).assertEqual(1);
          expect((e2 as SortEntry029).index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.sort(cmpIntDesc);
          expect(arr[0]).assertEqual(5);
          expect(arr[4]).assertEqual(1);


      }
      {
        const arr = new SparseArray<Person031>();
          arr.push({name: "Alice", age: 30}, {name: "Bob", age: 25});
          arr.sort(cmpPerson031ByAge);
          const head = arr[0];
          expect(head != null).assertTrue();
          expect((head as Person031).name).assertEqual("Bob");
          expect((head as Person031).age).assertEqual(25);


      }
      {
          const arr = new SparseArray<string>("Zebra", "apple", "Banana");
          arr.sort(cmpStringLower);
          expect(arr[0]).assertEqual("apple");
          expect(arr[1]).assertEqual("Banana");


      }
      {
          const arr = new SparseArray<int>(10, 2, 100, 1);
          arr.sort(cmpInt);
          expect(arr[0]).assertEqual(1);
          expect(arr[3]).assertEqual(100);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1700
     * @tc.name testMutateSortNormal004
     * @tc.desc Test SparseArray.sort method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSortNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          arr.sort();


      }
      {
          const arr = new SparseArray<double>(1.0, Double.NaN, 3.0, 2.0);
          arr.sort((a: double, b: double): int => {
            if (isNaN(a)) {
              return 1;
            }
            if (isNaN(b)) {
              return -1;
            }
            return cmpDouble(a, b);
          });
          expect(arr[0]).assertEqual(1.0);


      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined, 3);
          arr.sort((a: int | undefined, b: int | undefined): int => {
            if (a === undefined) {
              return 1;
            }
            if (b === undefined) {
              return -1;
            }
            return cmpInt(a, b);
          });
          expect(arr[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>();
          const size = 10000;
          for (let i = 0; i < size; i++) {
            arr.push(Double.toInt(Math.floor(Math.random() * size)));
          }
          const startTime = Date.now();
          arr.sort(cmpInt);
          const endTime = Date.now();
          expect(endTime - startTime).assertLess(13500);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr.push(i);
          }
          arr.sort(cmpInt);
          expect(arr[0]).assertEqual(0);
          expect(arr[999]).assertEqual(999);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 1000; i > 0; i--) {
            arr.push(i);
          }
          arr.sort(cmpInt);
          expect(arr[0]).assertEqual(1);
          expect(arr[999]).assertEqual(1000);


      }
      {
          const arr = new SparseArray<int>(3, 1, 4);
          const original = arr.toString();
          arr.sort((a: int, b: int): int => 0);
          expect(arr.toString()).assertEqual(original);


      }
      {
          const arr = new SparseArray<int>(1, 2);
          let callCount = 0;
          arr.sort((a: int, b: int): int => {
            callCount++;
            return callCount % 2 === 0 ? 1 : -1;
          });
          expect(callCount).assertLarger(0);


      }
      {
          const arr = new SparseArray<int>(5, 3, 8, 1, 9, 2, 7, 4, 6);
          arr.sort(cmpInt);
          expect(arr.toString()).assertEqual("1,2,3,4,5,6,7,8,9");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.sort(cmpIntDesc);
          expect(arr.toString()).assertEqual("5,4,3,2,1");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1800
     * @tc.name testMutateSortNormal005
     * @tc.desc Test SparseArray.sort method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSortNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(3, -1, -5, 2, -4, 0);
          arr.sort(cmpInt);
          expect(arr[0]).assertEqual(-5);
          expect(arr[5]).assertEqual(3);


      }
      {
          const arr = new SparseArray<string>("a", "ccc", "bb", "dddd", "e");
          arr.sort(cmpStringLen);
          expect(arr[0]).assertEqual("a");
          expect(arr[4]).assertEqual("dddd");


      }
      {
        const arr = new SparseArray<Product047>();
          arr.push(new Product047("A", 100), new Product047("B", 50), new Product047("C", 75));
          arr.sort(cmpProduct047Price);
          const p0 = arr[0];
          const p1 = arr[1];
          const p2 = arr[2];
          expect(p0 != null && p1 != null && p2 != null).assertTrue();
          expect((p0 as Product047).price).assertEqual(50);
          expect((p1 as Product047).price).assertEqual(75);
          expect((p2 as Product047).price).assertEqual(100);


      }
      {
        const arr = new SparseArray<Item048>();
          arr.push(new Item048("B", 100), new Item048("A", 100), new Item048("C", 50));
          arr.sort(cmpItem048);
          const i0 = arr[0];
          const i1 = arr[1];
          const i2 = arr[2];
          expect(i0 != null && i1 != null && i2 != null).assertTrue();
          expect((i0 as Item048).name).assertEqual("C");
          expect((i1 as Item048).name).assertEqual("A");
          expect((i2 as Item048).name).assertEqual("B");


      }
      {
          const nan = Double.toFloat(Double.NaN);
          const arr = new SparseArray<float>(1.0f, nan, 3.0f, 2.0f);
          arr.sort((a: float, b: float): int => {
            if (a !== a) {
              return 1;
            }
            if (b !== b) {
              return -1;
            }
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(1.0f);
          expect(arr[1]).assertEqual(2.0f);
          expect(arr[2]).assertEqual(3.0f);

      }
      {
          const arr = new SparseArray<int>(0x7, 0b10, 0x3, 1);
          arr.sort((a: int, b: int): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(0b10);
          expect(arr[2]).assertEqual(0x3);
          expect(arr[3]).assertEqual(0x7);

      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          arr.sort((a: boolean, b: boolean): int => {
            if (a === b) {
              return 0;
            }
            if (!a && b) {
              return -1;
            }
            return 1;
          });
          expect(arr[0]).assertFalse();
          expect(arr[1]).assertTrue();
          expect(arr[2]).assertTrue();

      }
      {
          const arr = new SparseArray<byte>(127 as byte, 0 as byte, (-128 as byte));
          arr.sort((a: byte, b: byte): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(-128 as byte);
          expect(arr[1]).assertEqual(0 as byte);
          expect(arr[2]).assertEqual(127 as byte);

      }
      {
          const arr = new SparseArray<short>(300 as short, 100 as short, 200 as short);
          arr.sort((a: short, b: short): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(100 as short);
          expect(arr[1]).assertEqual(200 as short);
          expect(arr[2]).assertEqual(300 as short);

      }
      {
          const arr = new SparseArray<long>(30000000000 as long, 10000000000 as long, 20000000000 as long);
          arr.sort((a: long, b: long): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(10000000000 as long);
          expect(arr[1]).assertEqual(20000000000 as long);
          expect(arr[2]).assertEqual(30000000000 as long);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_1900
     * @tc.name testMutateSortNormal006
     * @tc.desc Test SparseArray.sort method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSortNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<char>(c'C', c'A', c'B');
          arr.sort((a: char, b: char): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(c'A');
          expect(arr[1]).assertEqual(c'B');
          expect(arr[2]).assertEqual(c'C');

      }
      {
        // 1. default sort strings ['z','a','M','A'] -> 'A' at [0], 'z' at [3]
        const arr1 = new SparseArray<string>('z', 'a', 'M', 'A');
        const result1 = arr1.sort();
        expect(result1[0]).assertEqual('A');
        expect(result1[3]).assertEqual('z');
        // 2. default sort three Chinese name strings keeps first at index 0
        const arr2 = new SparseArray<string>('张三', '李四', '王五');
        const result2 = arr2.sort();
        expect(result2[0]).assertEqual('张三');
        // 3. default sort doubles [10.5,2.3,100.1] -> arr[0] equal 10.5
        const arr3 = new SparseArray<double>(10.5, 2.3, 100.1);
        const result3 = arr3.sort();
        expect(result3[0]).assertEqual(10.5);
        // 4. default sort strings ['z','a','m'] -> ['a','m','z']
        const arr4 = new SparseArray<string>('z', 'a', 'm');
        const result4 = arr4.sort();
        expect(result4[0]).assertEqual('a');
        expect(result4[1]).assertEqual('m');
        expect(result4[2]).assertEqual('z');
        // 5. default sort ints [100,2,20,3] preserving original order
        const arr5 = new SparseArray<int>(100, 2, 20, 3);
        const result5 = arr5.sort();
        expect(result5[0]).assertEqual(100);
        expect(result5[1]).assertEqual(2);
        expect(result5[2]).assertEqual(20);
        expect(result5[3]).assertEqual(3);
        // 6. ascending comparator (a-b) ints [7,3,9,1] -> [1,3,7,9]
        const arr6 = new SparseArray<int>(7, 3, 9, 1);
        const result6 = arr6.sort((a: int, b: int): int => a - b);
        expect(result6[0]).assertEqual(1);
        expect(result6[1]).assertEqual(3);
        expect(result6[2]).assertEqual(7);
        expect(result6[3]).assertEqual(9);
        // 7. ascending comparator ints [8,3,6,1,9,2] -> 1,2,3,6,8,9
        const arr7 = new SparseArray<int>(8, 3, 6, 1, 9, 2);
        const result7 = arr7.sort((a: int, b: int): int => a - b);
        expect(result7[0]).assertEqual(1);
        expect(result7[1]).assertEqual(2);
        expect(result7[2]).assertEqual(3);
        expect(result7[3]).assertEqual(6);
        expect(result7[4]).assertEqual(8);
        expect(result7[5]).assertEqual(9);
        // 8. ascending comparator two ints [20,10] -> callCount=1, [10,20]
        let callCount8: int = 0;
        const arr8 = new SparseArray<int>(20, 10);
        const result8 = arr8.sort((a: int, b: int): int => {
          callCount8 = callCount8 + 1;
          return a - b;
        });
        expect(callCount8).assertEqual(1);
        expect(result8[0]).assertEqual(10);
        expect(result8[1]).assertEqual(20);
        // 9. ascending comparator ints [60,40,20] -> [20,40,60] with trailing holes undefined
        const arr9 = new SparseArray<int>(60, 40, 20);
        const result9 = arr9.sort((a: int, b: int): int => {
          return a - b;
        });
        expect(result9[0]).assertEqual(20);
        expect(result9[1]).assertEqual(40);
        expect(result9[2]).assertEqual(60);
        expect(result9[3]).assertUndefined();
        expect(result9[4]).assertUndefined();
        expect(result9[5]).assertUndefined();
        // 10. ascending comparator five duplicate ints 5 -> every element equal 5
        const arr10 = new SparseArray<int>(5, 5, 5, 5, 5);
        const result10 = arr10.sort((a: int, b: int): int => {
          return a - b;
        });
        expect(result10[0]).assertEqual(5);
        expect(result10[1]).assertEqual(5);
        expect(result10[2]).assertEqual(5);
        expect(result10[3]).assertEqual(5);
        expect(result10[4]).assertEqual(5);

      }
      {
        // 1. ascending comparator doubles [3.5,1.2,4.8,2.0] -> arr[0]=1.2, arr[3]=4.8
        const arr1 = new SparseArray<double>(3.5, 1.2, 4.8, 2.0);
        const result1 = arr1.sort((a: double, b: double): int => (a < b ? -1 : a > b ? 1 : 0));
        expect(result1[0]).assertEqual(1.2);
        expect(result1[3]).assertEqual(4.8);
        // 2. comparator doubles [1.0,Infinity,100.0] placing POSITIVE_INFINITY at arr[2]
        const arr2 = new SparseArray<double>(1.0, Double.POSITIVE_INFINITY, 100.0);
        const result2 = arr2.sort((a: double, b: double): int => (a < b ? -1 : a > b ? 1 : 0));
        expect(result2[2]).assertEqual(Double.POSITIVE_INFINITY);
        // 3. lexicographic comparator strings [hello,abc,xyz] returns same instance -> abc,hello,xyz
        const arr3 = new SparseArray<string>('hello', 'abc', 'xyz');
        const result3 = arr3.sort((a: string, b: string): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(result3[0]).assertEqual('abc');
        expect(result3[1]).assertEqual('hello');
        expect(result3[2]).assertEqual('xyz');
        // 4. ascending comparator bigints [3n,1n,2n] returns same instance -> 1n,2n,3n
        const arr4 = new SparseArray<bigint>(3n, 1n, 2n);
        const result4 = arr4.sort((a: bigint, b: bigint): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(result4[0]).assertEqual(1n);
        expect(result4[1]).assertEqual(2n);
        expect(result4[2]).assertEqual(3n);
        // 5. comparator booleans [false,true,false] returns same instance -> true,false,false
        const arr5 = new SparseArray<boolean>(false, true, false);
        const result5 = arr5.sort((a: boolean, b: boolean): int => {
          if (a === b) {
            return 0;
          }
          return a ? -1 : 1;
        });
        expect(result5[0]).assertTrue();
        expect(result5[1]).assertFalse();
        expect(result5[2]).assertFalse();
        // 6. comparator booleans [false,true,false,true] -> true,true,false,false
        const arr6 = new SparseArray<boolean>(false, true, false, true);
        const result6 = arr6.sort((a: boolean, b: boolean): int => {
          if (a === b) {
            return 0;
          }
          return a ? -1 : 1;
        });
        expect(result6[0]).assertTrue();
        expect(result6[1]).assertTrue();
        expect(result6[2]).assertFalse();
        expect(result6[3]).assertFalse();
        // 7. sparse SparseArray {0:30,3:10} returns same instance, holes undefined -> [10,undef,undef,30]
        const arr7 = new SparseArray<int>(4);
        arr7[0] = 30;
        arr7[3] = 10;
        const result7 = arr7.sort((a: int, b: int): int => a - b);
        expect(result7.length).assertEqual(4);
        expect(result7[0]).assertEqual(10);
        expect(result7[1]).assertUndefined();
        expect(result7[2]).assertUndefined();
        expect(result7[3]).assertEqual(30);
        // 8. single-element SparseArray.of<int>(99) keeps arr[0]=99 and arr.length=1
        const arr8 = SparseArray.of<int>(99);
        const result8 = arr8.sort();
        expect(result8[0]).assertEqual(99);
        expect(result8.length).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2000
     * @tc.name testMutateSortError001
     * @tc.desc Test SparseArray.sort method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSortError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            arr.sort((a: int, b: int): int => {
              throw new Error("Comparison error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          const arr = new SparseArray<int>(3, 1, 2);
          try {
            arr.sort((a: int, b: int): int => {
              if (a === 2) {
                throw new Error("Stop");
              }
              return cmpInt(a, b);
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
            expect(arr.length).assertEqual(3);
          }

      }
      {
          try {
            const arr = new SparseArray<int>(1, 2);
            arr.sort((a: int, b: int): int => {
              throw new Error("string error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
        // 1. descending comparator (b-a) ints [3,1,4,1,5] -> arr[0] equal 5
        const cmpFn1: (a: int, b: int) => int = (a: int, b: int): int => b - a;
        const arr1 = new SparseArray<int>(3, 1, 4, 1, 5);
        const result1 = arr1.sort(cmpFn1);
        expect(result1[0]).assertEqual(5);
        // 2. descending comparator (b-a) ints [4,3,2,1] -> arr[0] equal 4
        const arr2 = new SparseArray<int>(4, 3, 2, 1);
        const result2 = arr2.sort((a: int, b: int): int => b - a);
        expect(result2[0]).assertEqual(4);
        // 3. comparator always returning 0 ints [2,1,3] keeps original order
        const arr3 = new SparseArray<int>(2, 1, 3);
        const result3 = arr3.sort((a: int, b: int): int => 0);
        expect(result3[0]).assertEqual(2);
        expect(result3[1]).assertEqual(1);
        expect(result3[2]).assertEqual(3);
        // 4. descending comparator strings [apple,banana,cherry] -> cherry,banana,apple
        const arr4 = new SparseArray<string>('apple', 'banana', 'cherry');
        const result4 = arr4.sort((a: string, b: string): int => {
          if (a > b) {
            return -1;
          }
          if (a < b) {
            return 1;
          }
          return 0;
        });
        expect(result4[0]).assertEqual('cherry');
        expect(result4[1]).assertEqual('banana');
        expect(result4[2]).assertEqual('apple');
        // 5. sort surfaces Error when comparator throws 'sort failed' on [3,1,4]
        const arr5 = new SparseArray<int>(3, 1, 4);
        try {
          arr5.sort((a: int, b: int): int => {
            throw new Error('sort failed');
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('Error');
        }
        // 6. sort surfaces Error when comparator throws custom SortError01301 on [5,1,3]
        const arr6 = new SparseArray<int>(5, 1, 3);
        try {
          arr6.sort((a: int, b: int): int => {
            throw new SortError01301();
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('Error');
        }
        // 7. sort surfaces Error when string comparator throws 'compare failed' on ['c','a','b']
        const arr7 = new SparseArray<string>('c', 'a', 'b');
        try {
          arr7.sort((a: string, b: string): int => {
            throw new Error('compare failed');
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('Error');
        }
        // 8. sort surfaces Error when Date comparator throws 'Date cmp fail'
        const arr8 = new SparseArray<Date>(new Date(1000), new Date(0), new Date(500));
        try {
          arr8.sort((a: Date, b: Date): int => {
            throw new Error('Date cmp fail');
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('Error');
        }
        // 9. descending comparator (b-a) ints [5,3,1,4,2] -> 5,4,3,2,1
        const arr9 = new SparseArray<int>(5, 3, 1, 4, 2);
        const result9 = arr9.sort((a: int, b: int): int => {
          return b - a;
        });
        expect(result9.length).assertEqual(5);
        expect(result9[0]).assertEqual(5);
        expect(result9[1]).assertEqual(4);
        expect(result9[2]).assertEqual(3);
        expect(result9[3]).assertEqual(2);
        expect(result9[4]).assertEqual(1);
        // 10. comparator returning extreme ints 2147483647/-2147483648 on [3,1,4,2] -> 1,2,3,4
        const arr10 = new SparseArray<int>(3, 1, 4, 2);
        const result10 = arr10.sort((a: int, b: int): int => {
          if (a > b) {
            return 2147483647;
          }
          if (a < b) {
            return -2147483648;
          }
          return 0;
        });
        expect(result10[0]).assertEqual(1);
        expect(result10[1]).assertEqual(2);
        expect(result10[2]).assertEqual(3);
        expect(result10[3]).assertEqual(4);
        expect(result10.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2100
     * @tc.name testMutateSpliceNormal001
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(2);
          expect(result.length).assertEqual(3);
          expect(result[0]).assertEqual(3);
          expect(result[1]).assertEqual(4);
          expect(result[2]).assertEqual(5);

          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(2, 2);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(3);
          expect(result[1]).assertEqual(4);
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(2, 2, 100, 200);
          expect(arr.length).assertEqual(5);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(100);
          expect(arr[3]).assertEqual(200);
          expect(arr[4]).assertEqual(5);



      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, 1);
          expect(result instanceof SparseArray).assertTrue();
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual(2);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(2147483647, 1);
          expect(result.length).assertEqual(0);
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);


      }
      {
        const arr = new SparseArray<int>(10, 20, 30);
        arr.splice(1, 0, 15);
        expect(arr.length).assertEqual(4);
        expect(arr[1]).assertEqual(15);


      }
      {
        const arr = new SparseArray<int>(10, 20, 30);
        const deleted = arr.splice(1, 1);
        expect(deleted.length).assertEqual(1);
        expect(deleted[0]).assertEqual(20);
        expect(arr.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, 100);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(2);
          expect(result[1]).assertEqual(3);
          expect(arr.length).assertEqual(1);
          expect(arr[0]).assertEqual(1);


      }
      {
        const arr = new SparseArray<int>(10, 20, 30);
        arr.splice(0, 2, 5, 6);
        expect(arr[0]).assertEqual(5);
        expect(arr[1]).assertEqual(6);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30, 40);
          const deleted = arr.splice(-2, 1);
          expect(deleted[0]).assertEqual(30);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2200
     * @tc.name testMutateSpliceNormal002
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(2);
          expect(result[1]).assertEqual(3);
          expect(arr.length).assertEqual(1);
          expect(arr[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, undefined);
          expect(result.length).assertEqual(0);
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, 1, " ", "  ");
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual("b");
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertEqual("a");
          expect(arr[1]).assertEqual(" ");
          expect(arr[2]).assertEqual("  ");
          expect(arr[3]).assertEqual("c");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, 1, "\u200B");
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual("b");
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual("a");
          expect(arr[1]).assertEqual("​");
          expect(arr[2]).assertEqual("c");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, 1, "<script>alert(1)</script>");
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual("b");
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual("a");
          expect(arr[1]).assertEqual("<script>alert(1)</script>");
          expect(arr[2]).assertEqual("c");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          expect(arr instanceof SparseArray).assertTrue();
          const longStr = "x".repeat(10000);
          const result = arr.splice(1, 1, longStr);
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual("b");
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual("a");
          expect(arr[1]).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
          expect(arr[2]).assertEqual("c");


      }
      {
          const arr = new SparseArray<int | string>(1, "b", 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, 1, 100);
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual("b");
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(100);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int | string>(1, "b", 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, 1, "x");
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual("b");
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual("x");
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int | string | null>(1, "b", 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.splice(1, 1, null);
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual("b");
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(null);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const items: int[] = [100, 200, 300];
          const result = arr.splice(1, 1, ...items);
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual(2);
          expect(arr.length).assertEqual(5);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(100);
          expect(arr[2]).assertEqual(200);
          expect(arr[3]).assertEqual(300);
          expect(arr[4]).assertEqual(3);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2300
     * @tc.name testMutateSpliceNormal003
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(1, 3);
          expect(deleted.length).assertEqual(3);
          expect(deleted[0]).assertEqual(2);
          expect(deleted[1]).assertEqual(3);
          expect(deleted[2]).assertEqual(4);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(1, 0, 100);
          expect(deleted.length).assertEqual(0);
          expect(deleted.toString()).assertEqual('');
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(100);
          expect(arr[2]).assertEqual(2);
          expect(arr[3]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(6);
          expect(arr instanceof SparseArray).assertTrue();
          arr[2] = 10;
          arr[4] = 20;
          const deleted = arr.splice(2, 2, 50);
          expect(deleted.length).assertEqual(2);
          expect(deleted[0]).assertEqual(10);
          expect(arr.length).assertEqual(5);
          expect(arr[2]).assertEqual(50);
          expect(arr[3]).assertEqual(20);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(0, 3);
          expect(deleted.length).assertEqual(3);
          expect(deleted[0]).assertEqual(1);
          expect(deleted[1]).assertEqual(2);
          expect(deleted[2]).assertEqual(3);
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(-1, 1);
          expect(deleted.length).assertEqual(1);
          expect(deleted[0]).assertEqual(5);
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);
          expect(arr[3]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(3, 100);
          expect(deleted.length).assertEqual(2);
          expect(deleted[0]).assertEqual(4);
          expect(deleted[1]).assertEqual(5);
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10);
          expect(arr instanceof SparseArray).assertTrue();
          arr[2] = 100;
          arr[5] = 200;
          const deleted = arr.splice(3, 2, 300);
          expect(deleted.length).assertEqual(2);
          expect(arr.length).assertEqual(9);
          expect(arr[2]).assertEqual(100);
          expect(arr[3]).assertEqual(300);
          expect(arr[4]).assertEqual(200);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.splice(1, 1, 99);
          expect(result.length).assertEqual(1);
          expect(arr[1]).assertEqual(99);


      }
      {
          const arr = new SparseArray<int>();
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(0, 0);
          expect(deleted.length).assertEqual(0);
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>();
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(0, 0, 100, 200);
          expect(deleted.length).assertEqual(0);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(100);
          expect(arr[1]).assertEqual(200);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2400
     * @tc.name testMutateSpliceNormal004
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10);
          expect(arr instanceof SparseArray).assertTrue();
          arr[1] = 100;
          arr[3] = 200;
          arr[5] = 300;
          const deleted = arr.splice(1, 5);
          expect(deleted.length).assertEqual(5);
          expect(deleted[0]).assertEqual(100);
          expect(deleted[2]).assertEqual(200);
          expect(deleted[4]).assertEqual(300);
          expect(arr.length).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(10);
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(5, 0, 100);
          expect(deleted.length).assertEqual(0);
          expect(arr.length).assertEqual(11);
          expect(arr[5]).assertEqual(100);


      }
      {
          const arr = new SparseArray<int>(10);
          expect(arr instanceof SparseArray).assertTrue();
          arr[3] = 100;
          const deleted = arr.splice(2, 2, 200);
          expect(deleted.length).assertEqual(2);
          expect(deleted[1]).assertEqual(100);
          expect(arr.length).assertEqual(9);
          expect(arr[2]).assertEqual(200);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6);
          expect(arr instanceof SparseArray).assertTrue();
          arr.splice(0, 2);
          arr.splice(1, 1, 100);
          arr.splice(3, 0, 200);
          expect(arr.length).assertEqual(5);
          expect(arr[0]).assertEqual(3);
          expect(arr[1]).assertEqual(100);
          expect(arr[2]).assertEqual(5);
          expect(arr[3]).assertEqual(200);
          expect(arr[4]).assertEqual(6);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c", "d");
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(1, 2, "x", "y");
          expect(deleted.length).assertEqual(2);
          expect(deleted[0]).assertEqual("b");
          expect(deleted[1]).assertEqual("c");
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertEqual("a");
          expect(arr[1]).assertEqual("x");
          expect(arr[2]).assertEqual("y");
          expect(arr[3]).assertEqual("d");


      }
      {
          const arr = new SparseArray<int | string>(1, "b", 3, "d");
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(1, 2, 100, "x");
          expect(deleted.length).assertEqual(2);
          expect(deleted[0]).assertEqual("b");
          expect(deleted[1]).assertEqual(3);
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(100);
          expect(arr[2]).assertEqual("x");
          expect(arr[3]).assertEqual("d");


      }
      {
        const arr = new SparseArray<Person038>();
        expect(arr instanceof SparseArray).assertTrue();
          arr.push({ name: "Alice", age: 25 });
          arr.push({ name: "Bob", age: 30 });
          const deleted = arr.splice(0, 1, { name: "Charlie", age: 35 });
          const d0 = deleted[0];
          const a0 = arr[0];
          expect(d0 !== null && d0 !== undefined).assertTrue();
          expect(a0 !== null && a0 !== undefined).assertTrue();


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr.push(i);
          }
          const deleted = arr.splice(500, 100);
          expect(deleted.length).assertEqual(100);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const items: int[] = [];
          for (let i = 0; i < 1000; i++) {
            items.push(i);
          }
          const deleted = arr.splice(1, 0, ...items);
          expect(arr.length).assertEqual(1003);


      }
      {
          const arr = new SparseArray<byte>(10 as byte, 20 as byte, 30 as byte);
          const deleted = arr.splice(1, 1, 99 as byte);
          expect(deleted.length).assertEqual(1);
          expect(deleted[0]).assertEqual(20 as byte);
          expect(arr[1]).assertEqual(99 as byte);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2500
     * @tc.name testMutateSpliceNormal005
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<float>(1.0f, 3.0f);
          arr.splice(1, 0, 2.0f);
          expect(arr.length).assertEqual(3);
          expect(arr[1]).assertEqual(2.0f);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const deleted = arr.splice((2147483647 as int + 1 as int) as int, 1);
          expect(deleted.length).assertEqual(1);
          expect(deleted[0]).assertEqual(1);
          expect(arr.length).assertEqual(2);

      }
      {
          const arr = new SparseArray<int>(10, 20, 30, 40, 50);
          const deleted = arr.splice(0x7F as int, 0b1);
          expect(deleted.length).assertEqual(0);
          expect(arr.length).assertEqual(5);

      }
      {
          const arr = new SparseArray<string>("a", "c");
          const removed = arr.splice(1, 0, "");
          expect(removed.length).assertEqual(0);
          expect(arr[1]).assertEqual("");
          expect(arr.toString()).assertEqual("a,,c");

      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          const removed = arr.splice(1, 1, true);
          expect(removed.length).assertEqual(1);
          expect(removed[0]).assertFalse();
          expect(arr[1]).assertTrue();

      }
      {
          const arr = new SparseArray<short>(10 as short, 30 as short);
          const removed = arr.splice(1, 0, 20 as short);
          expect(removed.length).assertEqual(0);
          expect(arr[1]).assertEqual(20 as short);
          expect(arr[2]).assertEqual(30 as short);

      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
          const removed = arr.splice(1, 1, 20000000000 as long);
          expect(removed[0]).assertEqual(10000000000 as long);
          expect(arr[1]).assertEqual(20000000000 as long);

      }
      {
          const arr = new SparseArray<double>(1.25, 2.5, 3.75);
          const removed = arr.splice(1, 1, 4.5);
          expect(removed[0]).assertEqual(2.5);
          expect(arr[1]).assertEqual(4.5);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          const removed = arr.splice(1, 1, c'Z');
          expect(removed[0]).assertEqual(c'B');
          expect(arr[1]).assertEqual(c'Z');

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          arr.splice(1)
          expect(arr.length).assertEqual(1)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2600
     * @tc.name testMutateSpliceNormal006
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10, 20, 30)
          const deleted = arr.splice(0)
          expect(deleted.length).assertEqual(3)
          expect(deleted[0]).assertEqual(10)
          expect(arr.length).assertEqual(0)
          expect(typeof deleted).assertEqual("object")
          expect(deleted !== null && deleted !== undefined).assertTrue()


      }
      {
          const arr = new SparseArray<int>(10, 20, 30, 40, 50)
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(-2)
          expect(deleted.length).assertEqual(2)
          expect(deleted[0]).assertEqual(40)
          expect(deleted[1]).assertEqual(50)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(2147483647)
          expect(deleted.length).assertEqual(0)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          const deleted = arr.splice(3)
          expect(deleted.length).assertEqual(0)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice((2147483647 + 1) as int)
          expect(deleted instanceof SparseArray).assertTrue();
          expect(deleted.length).assertEqual(3);
          expect(deleted[0]).assertEqual(10);
          expect(deleted[1]).assertEqual(20);
          expect(deleted[2]).assertEqual(30);
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice((-2147483648 - 1) as int)
          expect(deleted instanceof SparseArray).assertTrue();
          expect(deleted.length).assertEqual(0);
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const deleted = arr.splice(10, 1);
          expect(deleted.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          const deleted = arr.splice(5)
          expect(deleted.length).assertEqual(0)
          expect(deleted instanceof SparseArray).assertTrue()

      }
      {
          const arr = new SparseArray<int>(6)
          expect(arr instanceof SparseArray).assertTrue();
          arr[2] = 10
          arr[4] = 20
          const deleted = arr.splice(1)
          expect(deleted.length).assertEqual(5)
          expect(deleted[1]).assertEqual(10)
          expect(deleted[3]).assertEqual(20)

      }
      {
          const arr = new SparseArray<string>("apple", "banana", "cherry")
          const deleted: SparseArray<string> = arr.splice(1)
          expect(deleted[0]).assertEqual("banana")
          expect(deleted[1]).assertEqual("cherry")

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2700
     * @tc.name testMutateSpliceNormal007
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10, 20, 30)
          let finallyExecuted = false
          try {
            arr.splice(1)
          } finally {
            finallyExecuted = true
          }
          expect(finallyExecuted).assertTrue()

      }
      {
          const arr = new SparseArray<int>()
          const deleted = arr.splice(0)
          expect(deleted.length).assertEqual(0)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>(6)
          expect(arr instanceof SparseArray).assertTrue();
          arr[2] = 10
          arr[4] = 20
          const deleted = arr.splice(3)
          expect(deleted.length).assertEqual(3);
          expect(deleted[1]).assertEqual(20);
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          const deleted: SparseArray<int> = arr.splice(1)
          expect(deleted[0]).assertEqual(20)
          expect(deleted[1]).assertEqual(30)
          expect(typeof deleted).assertEqual("object")
          expect(deleted !== null && deleted !== undefined).assertTrue()


      }
      {
          const arr = new SparseArray<SparseArray<int>>()
          const inner = new SparseArray<int>(1, 2, 3)
          arr.push(inner)
          const deleted: SparseArray<SparseArray<int>> = arr.splice(0)
          expect(deleted[0]).assertEqual(inner)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          expect(arr instanceof SparseArray).assertTrue();
          const deleted = arr.splice(-100)
          expect(deleted.length).assertEqual(3)
          expect(deleted[0]).assertEqual(10)
          expect(deleted[1]).assertEqual(20)
          expect(deleted[2]).assertEqual(30)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30, 40, 50)
          let deleted1 = arr.splice(2)
          expect(deleted1.length).assertEqual(3)
          let deleted2 = arr.splice(0)
          expect(deleted2.length).assertEqual(2)
          let deleted3 = arr.splice(0)
          expect(deleted3.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30, 40, 50)
          const deleted = arr.splice(2)
          expect(deleted === arr).assertFalse()

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
          const deleted = arr.splice(5)
          expect(arr.length).assertEqual(5)
          expect(deleted.length).assertEqual(5)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          const deleted = arr.splice(2)
          expect(arr.length).assertEqual(2)
          expect(deleted.length).assertEqual(1)
          expect(deleted[0]).assertEqual(30)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2800
     * @tc.name testMutateSpliceNormal008
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
          const deleted = arr.splice(1);
          expect(arr.length).assertEqual(1);
          expect(deleted.length).assertEqual(2);
          expect(deleted[0]).assertEqual(20 as short);

      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const deleted = arr.splice(0x0, 0b1);
          expect(deleted.length).assertEqual(1);
          expect(deleted[0]).assertEqual(10);
          expect(arr[0]).assertEqual(20);

      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          const deleted = arr.splice(1);
          expect(arr.length).assertEqual(1);
          expect(deleted.length).assertEqual(2);
          expect(deleted[0]).assertFalse();
          expect(deleted[1]).assertTrue();

      }
      {
          const arr = new SparseArray<byte>(0 as byte, (-128 as byte), 127 as byte);
          const deleted = arr.splice(1);
          expect(arr.length).assertEqual(1);
          expect(deleted[0]).assertEqual(-128 as byte);
          expect(deleted[1]).assertEqual(127 as byte);

      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long, 20000000000 as long);
          const deleted = arr.splice(1);
          expect(arr.length).assertEqual(1);
          expect(deleted[0]).assertEqual(10000000000 as long);
          expect(deleted[1]).assertEqual(20000000000 as long);

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
          const deleted = arr.splice(1);
          expect(arr.length).assertEqual(1);
          expect(deleted[0]).assertEqual(2.5f);
          expect(deleted[1]).assertEqual(3.0f);

      }
      {
          const arr = new SparseArray<double>(1.25, 2.5, 3.75);
          const deleted = arr.splice(1);
          expect(arr.length).assertEqual(1);
          expect(deleted[0]).assertEqual(2.5);
          expect(deleted[1]).assertEqual(3.75);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          const deleted = arr.splice(1);
          expect(arr.length).assertEqual(1);
          expect(deleted[0]).assertEqual(c'B');
          expect(deleted[1]).assertEqual(c'C');

      }
      {
        // 1. splice(1) on [10,20,30,40,50] -> deletes tail, deleted.length=4, arr.length=1
        const arr1 = new SparseArray<int>(10, 20, 30, 40, 50);
        const deleted1 = arr1.splice(1);
        expect(arr1.length).assertEqual(1);
        expect(deleted1.length).assertEqual(4);
        expect(deleted1[0]).assertEqual(20);
        expect(arr1[0]).assertEqual(10);
        // 2. splice(start,0) on 3/5-elem arrays -> deletes nothing, keeps length & middle
        const arr2a = new SparseArray<int>(10, 20, 30);
        const deleted2a = arr2a.splice(1, 0);
        expect(deleted2a.length).assertEqual(0);
        expect(arr2a.length).assertEqual(3);
        expect(arr2a[1]).assertEqual(20);
        const arr2b = new SparseArray<int>(10, 20, 30, 40, 50);
        const deleted2b = arr2b.splice(2, 0);
        expect(deleted2b.length).assertEqual(0);
        expect(arr2b.length).assertEqual(5);
        expect(arr2b[2]).assertEqual(30);
        // 3. splice(0,1) on [10,20,30] -> removes first, deleted[0]=10, arr[0]=20
        const arr3 = new SparseArray<int>(10, 20, 30);
        const deleted3 = arr3.splice(0, 1);
        expect(deleted3[0]).assertEqual(10);
        expect(arr3[0]).assertEqual(20);
        expect(arr3.length).assertEqual(2);
        // 4. splice(len-1,1) on [10,20,30] -> removes last, deleted[0]=30, arr.length=2
        const arr4 = new SparseArray<int>(10, 20, 30);
        const deleted4 = arr4.splice(arr4.length - 1, 1);
        expect(deleted4[0]).assertEqual(30);
        expect(arr4.length).assertEqual(2);
        // 5. splice(2,2) on [10,20,30,40,50] -> removes two, deleted.length=2, arr.length=3
        const arr5 = new SparseArray<int>(10, 20, 30, 40, 50);
        const deleted5 = arr5.splice(2, 2);
        expect(deleted5.length).assertEqual(2);
        expect(arr5.length).assertEqual(3);
        // 6. splice(1,2) on [10,20,30,40] -> removes [20,30], deleted.length=2, arr[1]=40
        const arr6 = new SparseArray<int>(10, 20, 30, 40);
        const deleted6 = arr6.splice(1, 2);
        expect(deleted6.length).assertEqual(2);
        expect(arr6[0]).assertEqual(10);
        expect(arr6[1]).assertEqual(40);
        // 7. splice(2) on [10,20,30,40] -> deletes tail, deleted.length=2, arr.length=2
        const arr7 = new SparseArray<int>(10, 20, 30, 40);
        const deleted7 = arr7.splice(2);
        expect(arr7.length).assertEqual(2);
        expect(deleted7.length).assertEqual(2);
        expect(deleted7[0]).assertEqual(30);
        expect(deleted7[1]).assertEqual(40);
        // 8. splice(-1) and splice(2) on [10,20,30] -> both delete only 30, length 2
        const arr8a = new SparseArray<int>(10, 20, 30);
        const deleted8a = arr8a.splice(-1);
        expect(deleted8a.length).assertEqual(1);
        expect(deleted8a[0]).assertEqual(30);
        expect(arr8a.length).assertEqual(2);
        const arr8b = new SparseArray<int>(10, 20, 30);
        const deleted8b = arr8b.splice(2);
        expect(deleted8b.length).assertEqual(1);
        expect(deleted8b[0]).assertEqual(30);
        expect(arr8b.length).assertEqual(2);
        // 9. splice(-5,2) on [10,20,30,40,50] -> negative start, deleted[0]=10, deleted.length=2
        const arr9 = new SparseArray<int>(10, 20, 30, 40, 50);
        const deleted9 = arr9.splice(-5, 2);
        expect(deleted9.length).assertEqual(2);
        expect(deleted9[0]).assertEqual(10);
        // 10. splice(999,1) on [10,20,30] -> out-of-range, deleted.length=0
        const arr10 = new SparseArray<int>(10, 20, 30);
        const deleted10 = arr10.splice(999, 1);
        expect(deleted10.length).assertEqual(0);

      }
      {
        // 1. splice(0,0,10,20) on empty -> inserts 10,20, deleted.length=0, arr.length=2
        const arr1 = new SparseArray<int>();
        const deleted1 = arr1.splice(0, 0, 10, 20);
        expect(deleted1.length).assertEqual(0);
        expect(arr1.length).assertEqual(2);
        expect(arr1[0]).assertEqual(10);
        expect(arr1[1]).assertEqual(20);
        // 2. splice(1,0,30,40,50) on [10,20] -> inserts 3, deleted.length=0, arr.length=5
        const arr2 = new SparseArray<int>(10, 20);
        const deleted2 = arr2.splice(1, 0, 30, 40, 50);
        expect(deleted2.length).assertEqual(0);
        expect(arr2.length).assertEqual(5);
        expect(arr2[1]).assertEqual(30);
        expect(arr2[2]).assertEqual(40);
        expect(arr2[3]).assertEqual(50);
        // 3. splice(1,0,20,30) on [10,40] -> inserts 2, deleted.length=0, arr.length=4
        const arr3 = new SparseArray<int>(10, 40);
        const deleted3 = arr3.splice(1, 0, 20, 30);
        expect(deleted3.length).assertEqual(0);
        expect(arr3.length).assertEqual(4);
        expect(arr3[0]).assertEqual(10);
        expect(arr3[1]).assertEqual(20);
        expect(arr3[2]).assertEqual(30);
        expect(arr3[3]).assertEqual(40);
        // 4. splice(1,0,99) on sparse holes [10,_,30] -> inserts 99, deleted.length=0, arr.length=4
        const arr4 = new SparseArray<int>(3);
        arr4[0] = 10;
        arr4[2] = 30;
        const deleted4 = arr4.splice(1, 0, 99);
        expect(deleted4.length).assertEqual(0);
        expect(arr4.length).assertEqual(4);
        expect(arr4[1]).assertEqual(99);
        // 5. splice(1,0,2147483647) on [10,20] -> inserts INT_MAX, arr[1]=2147483647, arr.length=3
        const arr5 = new SparseArray<int>(10, 20);
        const deleted5 = arr5.splice(1, 0, 2147483647);
        expect(deleted5.length).assertEqual(0);
        expect(arr5[1]).assertEqual(2147483647);
        expect(arr5.length).assertEqual(3);
        // 6. splice(1,0,2,3,4,5,6,7) on [1,8] -> inserts 6, deleted.length=0, arr.length=8
        const arr6 = new SparseArray<int>(1, 8);
        const deleted6 = arr6.splice(1, 0, 2, 3, 4, 5, 6, 7);
        expect(deleted6.length).assertEqual(0);
        expect(arr6.length).assertEqual(8);
        // 7. splice(0,2,100,200) on [10,20,30,40] -> replaces first two, deleted[0]=10, arr[0]=100
        const arr7 = new SparseArray<int>(10, 20, 30, 40);
        const deleted7 = arr7.splice(0, 2, 100, 200);
        expect(deleted7.length).assertEqual(2);
        expect(deleted7[0]).assertEqual(10);
        expect(arr7[0]).assertEqual(100);
        expect(arr7[1]).assertEqual(200);
        // 8. splice(1,10,40,50) on [10,20,30] -> count exceeds tail, deleted.length=2, arr.length=3
        const arr8 = new SparseArray<int>(10, 20, 30);
        const deleted8 = arr8.splice(1, 10, 40, 50);
        expect(deleted8.length).assertEqual(2);
        expect(arr8.length).assertEqual(3);
        expect(arr8[1]).assertEqual(40);
        expect(arr8[2]).assertEqual(50);
        // 9. splice(1,2,71,72) on [10,20,30,40,50] -> replaces two, deleted.length=2, arr[1]=71
        const arr9 = new SparseArray<int>(10, 20, 30, 40, 50);
        const deleted9 = arr9.splice(1, 2, 71, 72);
        expect(deleted9.length).assertEqual(2);
        expect(arr9[1]).assertEqual(71);
        expect(arr9[2]).assertEqual(72);
        // 10. splice(1,1,99) on [10,20,30] -> replaces one, deleted[0]=20, arr[1]=99
        const arr10 = new SparseArray<int>(10, 20, 30);
        const deleted10 = arr10.splice(1, 1, 99);
        expect(deleted10.length).assertEqual(1);
        expect(deleted10[0]).assertEqual(20);
        expect(arr10.length).assertEqual(3);
        expect(arr10[0]).assertEqual(10);
        expect(arr10[1]).assertEqual(99);
        expect(arr10[2]).assertEqual(30);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_2900
     * @tc.name testMutateSpliceNormal009
     * @tc.desc Test SparseArray.splice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceNormal009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. splice(1,0,99) and splice(1,-1,99) on [10,20,30] -> both delete nothing, arr.length=4
        const arr1a = new SparseArray<int>(10, 20, 30);
        const deleted1a = arr1a.splice(1, 0, 99);
        expect(deleted1a.length).assertEqual(0);
        expect(arr1a.length).assertEqual(4);
        expect(arr1a[1]).assertEqual(99);
        expect(arr1a[2]).assertEqual(20);
        const arr1b = new SparseArray<int>(10, 20, 30);
        const deleted1b = arr1b.splice(1, -1, 99);
        expect(deleted1b.length).assertEqual(0);
        expect(arr1b.length).assertEqual(4);
        expect(arr1b[1]).assertEqual(99);
        expect(arr1b[2]).assertEqual(20);
        // 2. splice(1) vs splice(1,0) vs splice(1,undefined) on [10,20,30] -> omitted deletes 2, 0/undefined deletes 0
        const arr2a = new SparseArray<int>(10, 20, 30);
        const deleted2a = arr2a.splice(1);
        const arr2b = new SparseArray<int>(10, 20, 30);
        const deleted2b = arr2b.splice(1, 0);
        expect(deleted2a.length).assertEqual(2);
        expect(deleted2b.length).assertEqual(0);
        expect(arr2a.length).assertEqual(1);
        expect(arr2b.length).assertEqual(3);
        const arr2c = new SparseArray<int>(10, 20, 30);
        const deleted2c = arr2c.splice(1, undefined);
        expect(deleted2c.length).assertEqual(deleted2b.length);
        expect(arr2c.length).assertEqual(arr2b.length);
        // 3. splice(1) vs splice(1,0) on [10,20] -> omitted length 1, count 0 length 2
        const arr3a = new SparseArray<int>(10, 20);
        arr3a.splice(1);
        const arr3b = new SparseArray<int>(10, 20);
        arr3b.splice(1, 0);
        expect(arr3a.length).assertEqual(1);
        expect(arr3b.length).assertEqual(2);
        // 4. splice(1) vs splice(1,3) and splice(1,100) on [10,20,30] -> omitted matches count 3 and 100
        const arr4a = new SparseArray<int>(10, 20, 30);
        const deleted4a = arr4a.splice(1);
        const arr4b = new SparseArray<int>(10, 20, 30);
        const deleted4b = arr4b.splice(1, 3);
        expect(deleted4a.length).assertEqual(deleted4b.length);
        expect(arr4a.length).assertEqual(arr4b.length);
        const arr4c = new SparseArray<int>(10, 20, 30);
        const deleted4c = arr4c.splice(1, 100);
        expect(deleted4a.length).assertEqual(deleted4c.length);
        expect(arr4a.length).assertEqual(arr4c.length);
        // 5. splice(1) vs splice(1,3) on [10,20,30,40] -> identical toString
        const arr5a = new SparseArray<int>(10, 20, 30, 40);
        arr5a.splice(1);
        const arr5b = new SparseArray<int>(10, 20, 30, 40);
        arr5b.splice(1, 3);
        expect(arr5a.toString()).assertEqual(arr5b.toString());
        // 6. splice(1,-1) vs splice(1,0) on [10,20,30] -> negative count matches count 0
        const arr6a = new SparseArray<int>(10, 20, 30);
        const deleted6a = arr6a.splice(1, -1);
        const arr6b = new SparseArray<int>(10, 20, 30);
        const deleted6b = arr6b.splice(1, 0);
        expect(deleted6a.length).assertEqual(deleted6b.length);
        expect(arr6a.length).assertEqual(arr6b.length);
        // 7. splice(1,2) on [10,20,30] -> deleted modifiable to 999, arr[0] stays 10
        const arr7 = new SparseArray<int>(10, 20, 30);
        const deleted7 = arr7.splice(1, 2);
        deleted7[0] = 999;
        expect(deleted7[0]).assertEqual(999);
        expect(arr7[0]).assertEqual(10);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MUTATION_3000
     * @tc.name testMutateSpliceError001
     * @tc.desc Test SparseArray.splice method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMutateSpliceError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            const result = arr.splice((null as Object as int), 1);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          try {
            arr.splice((null as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

  });
}
