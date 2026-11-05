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

class Person008 {
    name: string = "";
  }

class MyObject003 {
    name: string;
    constructor(name: string) {
      this.name = name;
    }
  }

enum Color003 {
    Red,
    Green,
    Blue
  }

class NullFieldUser021 {
    name: string | null = null;
    age: int | null = null;
}

class Point014 {
    x: number;
    y: number;
    constructor(x: number, y: number) {
      this.x = x;
      this.y = y;
    }
  }

class AbnormalUser024 {
    displayName: string = "x".repeat(256);
    email: string = "not-an-email";
  }

interface SparseArrayConstructorPartBox {
  id: int;
}

interface SparseArrayConstructorPartData {
  val: int;
}

class Person028 {
  name: string = '';
  age: number = 0;
  constructor(name: string = '', age: number = 0) {
    this.name = name
    this.age = age
  }
}

enum ColorOf050 {
  Red,
  Green,
  Blue
}

type SparseArrayFromIntKeyToStringFn = (v: int, k: int) => string;

type SparseArrayFromIntKeyToIntFn = (v: int, k: int) => int;

class CustomMapError025 extends Error {
    constructor(message: string) {
      super(message)
      this.name = "CustomMapError025"
    }
  }

class From2Bad029 {
  a: int = 1;
  b: int = 2;
}

interface Item00801 {
  id: int;
}

// Merged from SparseArrayFromPart01Test (10 scenarios -> 1 case, <=10 each)

class IsArrayPlainObj {
  name: string = '';
}

class IsArrayPlainArrayChild extends Array<int> {
  label: string = 'child';
}

function isArrayProcessSparseArray(arr: Any): void {
  expect(SparseArray.isArray(arr)).assertTrue();
}

interface SparseArrayIsArrayPartEmptyObject {}

interface SparseArrayIsArrayPartObjectItem {
  id: number;
}

// Merged from SparseArrayIsArrayPart01Test + SparseArrayIsArrayPart03Test (27 scenarios -> 3 cases, each <=10)

export default function SparseArrayCreationTest(): void {
  describe('SparseArrayCreationTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0100
     * @tc.name testCreateConstructorNormal001
     * @tc.desc Test SparseArray.constructor method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateConstructorNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr1 = new SparseArray<int>(1);
          expect(arr1.length).assertEqual(1);
          const arr2 = new SparseArray<int>(10000);
          expect(arr2.length).assertEqual(10000);
          const arr3 = new SparseArray<int>((2147483647 + 1) as int);
          expect(arr3 instanceof SparseArray).assertTrue();
          expect(arr3.length).assertEqual(0);
          const arr4 = new SparseArray<int>((-2147483648 - 1) as int);
          expect(arr4 instanceof SparseArray).assertTrue();
          expect(arr4.length).assertEqual(2147483647);


      }
      {
          const arrHex = new SparseArray<int>(0x1234);
          expect(arrHex.length).assertEqual(4660);
          const arrBin = new SparseArray<int>(0b1010);
          expect(arrBin.length).assertEqual(10);


      }
      {
          const arr = new SparseArray<int>(-2147483648);
          expect(arr.length).assertEqual(0);


      }
      {
          try {
            const arr1 = new SparseArray<int>(("" as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }
          try {
            const arr2 = new SparseArray<int>((null as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }
          try {
            const arr3 = new SparseArray<int>((undefined as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }
          try {
            const arr4 = new SparseArray<int>(("invalid" as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(0);
          expect(arr.length).assertEqual(0);
          const arrNeg = new SparseArray<int>(-1);
          expect(arrNeg.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(5);
          expect(arr !== null && arr !== undefined).assertTrue();
          expect(arr instanceof SparseArray).assertTrue();
          expect(arr instanceof Array).assertFalse();
          expect(typeof arr).assertEqual("object");
          expect(arr.length).assertEqual(5);
          expect(arr[0]).assertEqual(undefined);
          expect(arr[1]).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(10);
          expect(arr.length).assertEqual(10);
          arr[5] = 42;
          expect(arr[5]).assertEqual(42);


      }
      {
          expect(new SparseArray<int>(5).length).assertEqual(5);
          expect(new SparseArray<string>(5).length).assertEqual(5);
          expect(new SparseArray<Person008>(5).length).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(2147483647);
          expect(arr.length).assertEqual(2147483647);


      }
      {
          const arr = new SparseArray<float>(2);
          arr[0] = 1.5f;
          arr[1] = 2.5f;
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(1.5f);
          expect(arr[1]).assertEqual(2.5f);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0200
     * @tc.name testCreateConstructorNormal002
     * @tc.desc Test SparseArray.constructor method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateConstructorNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(0o10);
          expect(arr.length).assertEqual(8);
          arr[0x7] = 99;
          expect(arr[0x7]).assertEqual(99);

      }
      {
          const arr = new SparseArray<boolean>(3);
          arr[0] = false;
          arr[2] = true;
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertFalse();
          expect(arr[1]).assertUndefined();
          expect(arr[2]).assertTrue();

      }
      {
          const arr = new SparseArray<char>(2);
          arr[0] = c'A';
          arr[1] = c'B';
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(c'A');
          expect(arr[1]).assertEqual(c'B');

      }
      {
          const arr = new SparseArray<int | null>(2);
          arr[0] = null;
          arr[1] = 42;
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(null);
          expect(arr[1]).assertEqual(42);

      }
      {
          const arr = new SparseArray<string>(4);
          arr[3] = "tail";
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertUndefined();
          expect(arr[2]).assertUndefined();
          expect(arr[3]).assertEqual("tail");

      }
      {
          const arr = new SparseArray<int>();
          expect(arr instanceof SparseArray).assertTrue();
          expect(arr.length).assertEqual(0);


      }
      {
          const arr1 = new SparseArray<int>();
          const arr2 = new SparseArray<int>();
          arr1[0] = 10;
          expect(arr2[0]).assertUndefined();
          expect(arr1.length).assertEqual(1);
          expect(arr2.length).assertEqual(0);


      }
      {
        const arr = new SparseArray<MyObject003>();
          arr[0] = new MyObject003("test");
          const el = arr[0];
          expect(el !== null && el !== undefined).assertTrue();
          expect((el as MyObject003).name).assertEqual("test");


      }
      {
          const arr = new SparseArray<int | string>();
          arr[0] = 42;
          arr[1] = "hello";
          expect(arr[0]).assertEqual(42);
          expect(arr[1]).assertEqual("hello");


      }
      {
          const arr = new SparseArray<int>();
          expect(arr[0]).assertUndefined();
          expect(arr[100]).assertUndefined();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0300
     * @tc.name testCreateConstructorNormal003
     * @tc.desc Test SparseArray.constructor method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateConstructorNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          arr[5] = 10;
          expect(arr.length).assertEqual(6);
          expect(arr[0]).assertUndefined();


      }
      {
          const arr = new SparseArray<int>();
          const val = arr.$_get(0);
          expect(val).assertUndefined();


      }
      {
          const arr = new SparseArray<int>();
          arr.$_set(0, 100);
          expect(arr[0]).assertEqual(100);


      }
      {
          const arr = new SparseArray<int>();
          arr[999999] = 1;
          expect(arr[999999]).assertEqual(1);
          expect(arr.length).assertEqual(1000000);


      }
      {
          const arr = new SparseArray<int>();
          expect(arr[-1]).assertUndefined();
          const val = arr.$_get(-1);
          expect(val).assertUndefined();
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>();
          arr.$_set(0x2, 0b11);
          expect(arr.$_get(0x2)).assertEqual(0b11);
          expect(arr.length).assertEqual(3);

      }
      {
          const arr = new SparseArray<boolean>();
          arr[0] = false;
          arr[2] = true;
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertFalse();
          expect(arr[1]).assertUndefined();
          expect(arr[2]).assertTrue();

      }
      {
          const arr = new SparseArray<char>();
          arr[0] = c'Z';
          expect(arr.length).assertEqual(1);
          expect(arr[0]).assertEqual(c'Z');

      }
      {
          const arr = new SparseArray<long>();
          arr[1] = 10000000000 as long;
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertUndefined();
          expect(arr[1]).assertEqual(10000000000 as long);

      }
      {
          const arr = new SparseArray<int | null>();
          arr[0] = null;
          arr[1] = 7;
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(null);
          expect(arr[1]).assertEqual(7);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0400
     * @tc.name testCreateConstructorNormal004
     * @tc.desc Test SparseArray.constructor method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateConstructorNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>("apple", "banana", "cherry");
          expect(arr instanceof SparseArray).assertTrue();
          expect(arr.length).assertEqual(3);


      }
      {
          const inner1 = new SparseArray<int>(1, 2, 3);
          const inner2 = new SparseArray<int>(4, 5, 6);
          const arr = new SparseArray<SparseArray<int>>(inner1, inner2);
          const first = arr[0];
          expect(arr instanceof SparseArray).assertTrue();
          expect(arr.length).assertEqual(2);
          expect(first instanceof SparseArray).assertTrue();
          expect(first!.length).assertEqual(3);
          expect(first![0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<Color003>(Color003.Red, Color003.Green, Color003.Blue);
          expect(arr instanceof SparseArray).assertTrue();
          expect(arr.length).assertEqual(3);


      }
      {
          try {
            const arr = new SparseArray<string>((null as Object as string));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            const arr = new SparseArray<string>("hello", (123 as Object as string));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          let longStr = "a".repeat(10000);
          const arr = new SparseArray<string>(longStr);
          const s0 = arr[0];
          expect(arr instanceof SparseArray).assertTrue();
          expect(arr.length).assertEqual(1);
          expect(s0).assertEqual(longStr);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          expect(SparseArray.isArray(arr)).assertEqual(true);
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          expect(arr[0]).assertEqual(10);
          expect(arr[1]).assertEqual(20);
          expect(arr[2]).assertEqual(30);


      }
      {
          const arr = new SparseArray<number | null>(1, null, 3);
          expect(arr[1]).assertEqual(null);


      }
      {
          const arr = new SparseArray<number | undefined>(1, undefined, 3);
          expect(arr[1]).assertEqual(undefined);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0500
     * @tc.name testCreateConstructorNormal005
     * @tc.desc Test SparseArray.constructor method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateConstructorNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(0, 1, 0);
          expect(arr[0]).assertEqual(0);
          expect(arr[2]).assertEqual(0);


      }
      {
          const arr = new SparseArray<boolean>(false, true, false);
          expect(arr[0]).assertEqual(false);


      }
      {
          const arr = new SparseArray<string>("", "hello", "");
          expect(arr[0]).assertEqual("");


      }
      {
        const arr = new SparseArray<Point014>(new Point014(1, 2));
          const p = arr[0];
          expect(p !== null && p !== undefined).assertTrue();
          expect((p as Point014).x).assertEqual(1);
          expect((p as Point014).y).assertEqual(2);


      }
      {
          const arr = new SparseArray<string>();
          expect(arr.length).assertEqual(0);
          expect(arr[0]).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(42);
          expect(arr.length).assertEqual(42);
          expect(arr[0]).assertUndefined();


      }
      {
          const hugeArray: Array<int> = [];
          for (let i = 0; i < 2000; i++) {
            hugeArray.push(i);
          }
          const arr = new SparseArray<int>(...hugeArray);
          expect(arr.length).assertEqual(2000);
          expect(arr[0]).assertEqual(0);
          expect(arr[1999]).assertEqual(1999);


      }
      {
          const arr = new SparseArray<byte>(10 as byte, 127 as byte, (-128 as byte));
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(10 as byte);
          expect(arr[1]).assertEqual(127 as byte);
          expect(arr[2]).assertEqual(-128 as byte);

      }
      {
          const arr = new SparseArray<short>(32767 as short, (-32768 as short));
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(32767 as short);
          expect(arr[1]).assertEqual(-32768 as short);

      }
      {
          const a: long = 10000000000 as long;
          const b: long = 9223372036854775807 as long;
          const arr = new SparseArray<long>(a, b);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(a);
          expect(arr[1]).assertEqual(b);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0600
     * @tc.name testCreateConstructorNormal006
     * @tc.desc Test SparseArray.constructor method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateConstructorNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const user = new NullFieldUser021();
          const arr = new SparseArray<NullFieldUser021>(user);
          expect(arr.length).assertEqual(1);
          expect(arr[0]!.name).assertEqual(null);
          expect(arr[0]!.age).assertEqual(null);

      }
      {
          const token = "0x123";
          const arr = new SparseArray<string>("plain", token);
          expect(arr[1]).assertEqual(token);

      }
      {
          const arr = new SparseArray<string>("\u65e5\u672c", "\ud55c\uad6d", "\u0627\u0644\u0639\u0631\u0628\u064a\u0629");
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual("\u65e5\u672c");
          expect(arr[2]).assertEqual("\u0627\u0644\u0639\u0631\u0628\u064a\u0629");

      }
      {
          const user = new AbnormalUser024();
          const arr = new SparseArray<AbnormalUser024>(user);
          expect(arr[0]!.displayName.length).assertEqual(256);
          expect(arr[0]!.email).assertEqual("not-an-email");

      }
      {
          const arr = new SparseArray<int | string | boolean>(42, "mix", true);
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(42);
          expect(arr[1]).assertEqual("mix");
          expect(arr[2]).assertEqual(true);

      }
      {
          const token = "0b1010";
          const arr = new SparseArray<string>(token, "end");
          expect(arr[0]).assertEqual(token);
          expect(arr.indexOf("0b1010")).assertEqual(0);

      }
      {
          const zw = "\u200B";
          const arr = new SparseArray<string>(zw, "visible");
          expect(arr[0]).assertEqual(zw);
          expect(arr.length).assertEqual(2);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr[0]).assertEqual(1);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const val: int = arr[0] as int;
          expect(val).assertEqual(1);

      }
      {
        // 1. length setter on empty SparseArray creates holes (arr[0] undefined)
        const arr1 = new SparseArray<int>();
        arr1.length = 3;
        expect(arr1[0]).assertUndefined();
        // 2. two empty SparseArrays are distinct instances
        const arr2a = new SparseArray<int>();
        const arr2b = new SparseArray<int>();
        expect(arr2a === arr2b).assertFalse();
        // 3. empty SparseArray arr[0]=5 -> length 1
        const arr3 = new SparseArray<int>();
        arr3[0] = 5;
        expect(arr3.length).assertEqual(1);
        // 4. empty SparseArray arr[0]=7 -> arr[0]=7
        const arr4 = new SparseArray<int>();
        arr4[0] = 7;
        expect(arr4[0]).assertEqual(7);
        // 5. empty SparseArray push(11) -> length 1
        const arr5 = new SparseArray<int>();
        arr5.push(11);
        expect(arr5.length).assertEqual(1);
        // 6. empty SparseArray arr[-1]=1 -> length 0, arr[0] undefined
        const arr6 = new SparseArray<int>();
        arr6[-1] = 1;
        expect(arr6.length).assertEqual(0);
        expect(arr6[0]).assertUndefined();
        // 7. empty SparseArray b[0]=99 -> b[0]=99
        const arr7 = new SparseArray<int>();
        arr7[0] = 99;
        expect(arr7[0]).assertEqual(99);
        // 8. two SparseArray<int>(1,2) are distinct instances
        const arr8a = new SparseArray<int>(1, 2);
        const arr8b = new SparseArray<int>(1, 2);
        expect(arr8a === arr8b).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0700
     * @tc.name testCreateConstructorNormal007
     * @tc.desc Test SparseArray.constructor method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateConstructorNormal007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. SparseArray<long>() -> length 0
        const arr1 = new SparseArray<long>();
        expect(arr1.length).assertEqual(0);
        // 2. SparseArray<string>() -> length 0
        const arr2 = new SparseArray<string>();
        expect(arr2.length).assertEqual(0);
        // 3. SparseArray<boolean>() -> length 0
        const arr3 = new SparseArray<boolean>();
        expect(arr3.length).assertEqual(0);
        // 4. SparseArray<number>() -> length 0
        const arr4 = new SparseArray<number>();
        expect(arr4.length).assertEqual(0);
        // 5. SparseArray<int[]>() -> length 0
        const arr5 = new SparseArray<int[]>();
        expect(arr5.length).assertEqual(0);
        // 6. SparseArray<Map<string, int>>() -> length 0
        const arr6 = new SparseArray<Map<string, int>>();
        expect(arr6.length).assertEqual(0);
        // 7. SparseArray<Set<int>>() -> length 0
        const arr7 = new SparseArray<Set<int>>();
        expect(arr7.length).assertEqual(0);
        // 8. SparseArray<Uint8Array>() -> length 0
        const arr8 = new SparseArray<Uint8Array>();
        expect(arr8.length).assertEqual(0);
        // 9. SparseArray<SparseArray<int>>() -> length 0
        const arr9 = new SparseArray<SparseArray<int>>();
        expect(arr9.length).assertEqual(0);
        // 10. SparseArray<Record<string, int>>() -> length 0
        const arr10 = new SparseArray<Record<string, int>>();
        expect(arr10.length).assertEqual(0);

      }
      {
        // 1. empty SparseArray<string> arr[0]='hello' -> 'hello'
        const arr1 = new SparseArray<string>();
        arr1[0] = 'hello';
        expect(arr1[0]).assertEqual('hello');
        // 2. empty SparseArray<boolean> arr[0]=true -> true
        const arr2 = new SparseArray<boolean>();
        arr2[0] = true;
        expect(arr2[0]).assertTrue();
        // 3. empty SparseArray<bigint> arr[0]=max bigint -> max bigint
        const arr3 = new SparseArray<bigint>();
        arr3[0] = 9223372036854775807n;
        expect(arr3[0]).assertEqual(9223372036854775807n);
        // 4. empty SparseArray<Date> arr[0]=Date(0) -> same reference
        const arr4 = new SparseArray<Date>();
        const dateA: Date = new Date(0);
        arr4[0] = dateA;
        expect(arr4[0] === dateA).assertTrue();
        // 5. empty SparseArray<Box> arr[0]=obj -> same reference
        const arr5 = new SparseArray<SparseArrayConstructorPartBox>();
        const obj5: SparseArrayConstructorPartBox = { id: 1 };
        arr5[0] = obj5;
        expect(arr5[0] === obj5).assertTrue();
        // 6. empty SparseArray<double> arr[0]=NaN -> NaN
        const arr6 = new SparseArray<double>();
        arr6[0] = Number.NaN;
        expect(arr6[0]).assertNaN();
        // 7. empty SparseArray<double> arr[0]=Infinity -> +Infinity
        const arr7 = new SparseArray<double>();
        arr7[0] = Number.POSITIVE_INFINITY;
        expect(arr7[0]).assertPosUnlimited();
        // 8. new SparseArray<string>('hello') -> length 1, arr[0]='hello'
        const arr8 = new SparseArray<string>('hello');
        expect(arr8.length).assertEqual(1);
        expect(arr8[0]).assertEqual('hello');
        // 9. new SparseArray<boolean>(true) -> length 1, arr[0]=true
        const arr9 = new SparseArray<boolean>(true);
        expect(arr9.length).assertEqual(1);
        expect(arr9[0]).assertTrue();
        // 10. new SparseArray<boolean>(false) -> length 1, arr[0]=false
        const arr10 = new SparseArray<boolean>(false);
        expect(arr10.length).assertEqual(1);
        expect(arr10[0]).assertFalse();

      }
      {
        // 1. new SparseArray<Box>(obj) -> length 1, arr[0]===obj
        const obj1: SparseArrayConstructorPartBox = { id: 99 };
        const arr1 = new SparseArray<SparseArrayConstructorPartBox>(obj1);
        expect(arr1.length).assertEqual(1);
        expect(arr1[0] === obj1).assertTrue();
        // 2. new SparseArray<Date>(d) -> length 1, arr[0]===d
        const dateA: Date = new Date(0);
        const arr2 = new SparseArray<Date>(dateA);
        expect(arr2.length).assertEqual(1);
        expect(arr2[0] === dateA).assertTrue();
        // 3. new SparseArray<bigint>(0n) -> length 1, arr[0]=0n
        const arr3 = new SparseArray<bigint>(0n);
        expect(arr3.length).assertEqual(1);
        expect(arr3[0]).assertEqual(0n);
        // 4. new SparseArray<double>(0.0) -> length 1, arr[0]=0.0
        const arr4 = new SparseArray<double>(0.0);
        expect(arr4.length).assertEqual(1);
        expect(arr4[0]).assertEqual(0.0);
        // 5. new SparseArray<double>(NaN) -> length 1, arr[0]=NaN
        const arr5 = new SparseArray<double>(Number.NaN);
        expect(arr5.length).assertEqual(1);
        expect(arr5[0]).assertNaN();
        // 6. new SparseArray<number | string | boolean>(42, 'hello', true) -> length 3
        const arr6 = new SparseArray<number | string | boolean>(42, 'hello', true);
        expect(arr6.length).assertEqual(3);
        expect(arr6[0]).assertEqual(42);
        expect(arr6[1]).assertEqual('hello');
        expect(arr6[2]).assertTrue();
        // 7. new SparseArray<int>(1,2,3).slice(0, 2) -> length 2, [1,2]
        const arr7 = new SparseArray<int>(1, 2, 3);
        const result7: SparseArray<int> = arr7.slice(0, 2);
        expect(result7.length).assertEqual(2);
        expect(result7[0]).assertEqual(1);
        expect(result7[1]).assertEqual(2);
        // 8. new SparseArray<int>(1,2,3).pop() -> 3
        const arr8 = new SparseArray<int>(1, 2, 3);
        expect(arr8.pop()).assertEqual(3);
        // 9. new SparseArray<int>(3).push(99) -> length 4, arr[3]=99
        const arr9 = new SparseArray<int>(3);
        arr9.push(99);
        expect(arr9.length).assertEqual(4);
        expect(arr9[3]).assertEqual(99);
        // 10. new SparseArray<Data>(obj) -> arr[0]===obj
        const obj10: SparseArrayConstructorPartData = { val: 10 };
        const arr10 = new SparseArray<SparseArrayConstructorPartData>(obj10);
        expect(arr10[0] === obj10).assertTrue();

      }
      {
        // 1. new SparseArray<int>(3).values().next().done -> true (holes skipped)
        const arr1 = new SparseArray<int>(3);
        expect(arr1.values().next().done).assertTrue();
        // 2. new SparseArray<int>(3).keys().next().done -> true (holes skipped)
        const arr2 = new SparseArray<int>(3);
        expect(arr2.keys().next().done).assertTrue();
        // 3. push(obj) then mutate obj -> arr[0].val reflects mutation (88)
        const obj3: SparseArrayConstructorPartData = { val: 5 };
        const arr3 = new SparseArray<SparseArrayConstructorPartData>();
        arr3.push(obj3);
        obj3.val = 88;
        expect(arr3[0]!.val).assertEqual(88);
        // 4. new SparseArray<Data>(obj), mutate arr[0].val -> original obj.val updated (77)
        const obj4: SparseArrayConstructorPartData = { val: 5 };
        const arr4 = new SparseArray<SparseArrayConstructorPartData>(obj4);
        arr4[0]!.val = 77;
        expect(obj4.val).assertEqual(77);
        // 5. values() on sparse {1:11, 3:33} -> 11, 33, done
        const arr5 = new SparseArray<int>(4);
        arr5[1] = 11;
        arr5[3] = 33;
        const iter5 = arr5.values();
        const first5 = iter5.next();
        expect(first5.done).assertFalse();
        expect(first5.value).assertEqual(11);
        const second5 = iter5.next();
        expect(second5.done).assertFalse();
        expect(second5.value).assertEqual(33);
        const done5 = iter5.next();
        expect(done5.done).assertTrue();
        expect(done5.value).assertUndefined();
        // 6. entries() on sparse {1:11, 3:33} -> [1,11], [3,33], done
        const arr6 = new SparseArray<int>(4);
        arr6[1] = 11;
        arr6[3] = 33;
        const iter6 = arr6.entries();
        const first6 = iter6.next();
        expect(first6.done).assertFalse();
        const firstE6 = first6.value!;
        expect(firstE6[0]).assertEqual(1);
        expect(firstE6[1]).assertEqual(11);
        const second6 = iter6.next();
        expect(second6.done).assertFalse();
        const secondE6 = second6.value!;
        expect(secondE6[0]).assertEqual(3);
        expect(secondE6[1]).assertEqual(33);
        const done6 = iter6.next();
        expect(done6.done).assertTrue();
        expect(done6.value).assertUndefined();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0800
     * @tc.name testCreateOfNormal001
     * @tc.desc Test SparseArray.of method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateOfNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.of<int>()
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = SparseArray.of<int>(1)
          expect(arr.length).assertEqual(1)
          expect(arr[0]).assertEqual(1)

      }
      {
          const arr = SparseArray.of<int>(1, 2, 3, 4, 5)
          expect(arr[0]).assertEqual(1)
          expect(arr[4]).assertEqual(5)

      }
      {
          const arr = SparseArray.of<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
          expect(arr.length).assertEqual(10)

      }
      {
          const arr = SparseArray.of<number>(100, 200, 300)
          expect(arr[0]).assertEqual(100)

      }
      {
          const arr = SparseArray.of<number>(Number.MAX_VALUE)
          expect(arr[0]).assertEqual(Number.MAX_VALUE)

      }
      {
          const arr = SparseArray.of<number>(Number.MIN_VALUE)
          expect(arr[0]).assertEqual(Number.MIN_VALUE)

      }
      {
          const arr = SparseArray.of<number>(0)
          expect(arr[0]).assertEqual(0)

      }
      {
          const arr = SparseArray.of<number>(-1, -100)
          expect(arr[0]).assertEqual(-1)

      }
      {
          const arr = SparseArray.of<string>("hello", "world")
          expect(arr[0]).assertEqual("hello")

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_0900
     * @tc.name testCreateOfNormal002
     * @tc.desc Test SparseArray.of method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateOfNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.of<string>("")
          expect(arr[0]).assertEqual("")

      }
      {
          const arr = SparseArray.of<string>("你好", "世界")
          expect(arr[0]).assertEqual("你好")

      }
      {
          const arr = SparseArray.of<boolean>(true)
          expect(arr[0]).assertEqual(true)

      }
      {
          const arr = SparseArray.of<boolean>(false)
          expect(arr[0]).assertEqual(false)

      }
      {
          const obj1 = new Person028("Alice", 20)
          const obj2 = new Person028("Bob", 30)
          const arr = SparseArray.of<Person028>(obj1, obj2)
          expect(arr[0]).assertEqual(obj1)

      }
      {
          const empty = new Person028()
          const arr = SparseArray.of<Person028>(empty)
          expect(arr[0]).assertEqual(empty)

      }
      {
          const arr1: Array<int> = [1, 2, 3]
          const arr2: Array<int> = [4, 5, 6]
          const arr = SparseArray.of<Array<int>>(arr1, arr2)
          expect(arr[0]).assertEqual(arr1)

      }
      {
          const empty: Array<int> = []
          const arr = SparseArray.of<Array<int>>(empty)
          expect(arr.length).assertEqual(1)
          expect(arr[0]!.length).assertEqual(0)

      }
      {
          const arr = SparseArray.of<number | string>(1, "hello", 2, "world")
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual("hello")

      }
      {
          const arr = SparseArray.of<number | null>(null)
          expect(arr[0]).assertEqual(null)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1000
     * @tc.name testCreateOfNormal003
     * @tc.desc Test SparseArray.of method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateOfNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.of<number | undefined>(undefined)
          expect(arr[0]).assertEqual(undefined)

      }
      {
          const values: Array<int> = [1, 2, 3]
          const arr = SparseArray.of<int>(...values)
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual(1)

      }
      {
          const values: Array<int> = [2, 3]
          const arr = SparseArray.of<int>(1, ...values, 4)
          expect(arr.length).assertEqual(4)
          expect(arr[0]).assertEqual(1)
          expect(arr[3]).assertEqual(4)

      }
      {
          const arr = SparseArray.of<int>(4, 6, 3)
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual(4)
          expect(arr[1]).assertEqual(6)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = SparseArray.of<string>("a", "b", "c")
          expect(arr[2]).assertEqual("c")

      }
      {
          const a1: Array<int> = [1, 2]
          const a2: Array<int> = [3, 4]
          const arr = SparseArray.of<Array<int>>(a1, a2)
          expect(arr[0]).assertEqual(a1)

      }
      {
          const p = new Person028("Alice", 20)
          const arr = SparseArray.of<Person028>(p)
          const head = arr[0] as Person028
          expect(head.name).assertEqual("Alice")

      }
      {
          const arr = SparseArray.of<int>(1, 2, 3)
          expect(arr !== null && arr !== undefined).assertTrue()
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr = SparseArray.of<string>("a", "b", "c")
          expect(arr[0]).assertEqual("a")
          expect(typeof arr[0]).assertEqual("string")

      }
      {
          const arr = SparseArray.of<int>(10, 20, 30, 40, 50)
          expect(arr[0]).assertEqual(10)
          expect(arr[1]).assertEqual(20)
          expect(arr[2]).assertEqual(30)
          expect(arr[3]).assertEqual(40)
          expect(arr[4]).assertEqual(50)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1100
     * @tc.name testCreateOfNormal004
     * @tc.desc Test SparseArray.of method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateOfNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.of<int>(1, 2, 3, 4, 5)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = SparseArray.of<int>(6, 5, 3)
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual(6)
          expect(arr[1]).assertEqual(5)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = SparseArray.of<int>(1, 2, 3)
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr1 = SparseArray.of<int>(1, 2, 3)
          const arr2 = SparseArray.of<int>(4, 5, 6)
          expect((arr1 === arr2)).assertFalse()
          expect(arr1[0]).assertEqual(1)
          expect(arr2[0]).assertEqual(4)

      }
      {
          const arr = SparseArray.of<int>(42)
          expect(arr.length).assertEqual(1)
          expect(arr[0]).assertEqual(42)

      }
      {
          const arr = SparseArray.of<int>(1, 1, 1, 1)
          expect(arr.length).assertEqual(4)
          expect(arr[0]).assertEqual(1)
          expect(arr[3]).assertEqual(1)

      }
      {
          const arr = SparseArray.of<int>(1, 2, 3)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = SparseArray.of<string>("test")
          expect(arr[0]).assertEqual("test")

      }
      {
          const arr = SparseArray.of<number>(1, 2, 3)
          const val: number = arr[0] as number
          expect(val).assertEqual(1)

      }
      {
          const arr = SparseArray.of<int>(1, 2, 3)
          arr.push(4)
          expect(arr.length).assertEqual(4)
          expect(arr[3]).assertEqual(4)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1200
     * @tc.name testCreateOfNormal005
     * @tc.desc Test SparseArray.of method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateOfNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.of<int>(1, 2, 3)
          const iterator = arr.$_iterator()
          expect(iterator.next().value).assertEqual(1)

      }
      {
          const arr = SparseArray.of<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
          expect(arr.length).assertEqual(20)
          expect(arr[19]).assertEqual(20)

      }
      {
          const arr = SparseArray.of<string>("a", "b", "c")
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual("a")
          expect(arr[1]).assertEqual("b")
          expect(arr[2]).assertEqual("c")

      }
      {
          const arr = SparseArray.of<number>(10, 20, 30, 40, 50)
          expect(arr.length).assertEqual(5)
          expect(arr[0]).assertEqual(10)

      }
      {
          const arr = SparseArray.of<boolean>(true, false, true)
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual(true)
          expect(arr[1]).assertEqual(false)

      }
      {
          const arr = SparseArray.of<short>(32767 as short, (-32768 as short))
          expect(arr.length).assertEqual(2)
          expect(arr[0]).assertEqual(32767 as short)

      }
      {
          const big: long = 9223372036854775807 as long
          const arr = SparseArray.of<long>(big)
          expect(arr[0]).assertEqual(big)

      }
      {
          const arr = SparseArray.of<ColorOf050 | null>(ColorOf050.Red, null, ColorOf050.Blue)
          expect(arr.length).assertEqual(3);
          expect(arr[1]).assertEqual(null);

      }
      {
          const nearMax: long = 9223372036854775806 as long
          const arr = SparseArray.of<long>(nearMax)
          expect(arr[0]).assertEqual(nearMax)

      }
      {
          const arr = SparseArray.of<int>(0x1, 0b10, 0o3)
          expect(arr.length).assertEqual(3)
          expect(arr[2]).assertEqual(0o3)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1300
     * @tc.name testCreateOfNormal006
     * @tc.desc Test SparseArray.of method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateOfNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.of<char>(c'A', c'Z')
          expect(arr.length).assertEqual(2)
          expect(arr[0]).assertEqual(c'A')
          expect(arr[1]).assertEqual(c'Z')

      }
      {
          const arr = SparseArray.of<int | undefined>(1, undefined, 3)
          expect(arr.length).assertEqual(3)
          expect(arr[1]).assertUndefined()

      }
      {
          const arr = SparseArray.of<byte>(127 as byte, (-128 as byte))
          expect(arr.length).assertEqual(2)
          expect(arr[0]).assertEqual(127 as byte)
          expect(arr[1]).assertEqual(-128 as byte)

      }
      {
        // 1. of<double>() with no args -> length 0, arr[0] undefined
        const arr1 = SparseArray.of<double>();
        expect(arr1.length).assertEqual(0);
        expect(arr1[0]).assertUndefined();
        // 2. of<RegExp>() with no args -> length 0, values()/entries() iterators done
        const arr2 = SparseArray.of<RegExp>();
        expect(arr2.length).assertEqual(0);
        expect(arr2.values().next().done).assertTrue();
        expect(arr2.entries().next().done).assertTrue();
        // 3. of<string>() with no args -> arr[0] undefined
        const arr3 = SparseArray.of<string>();
        expect(arr3[0]).assertUndefined();
        // 4. of<byte>(0x7f) -> length 1, arr[0] equals 127
        const arr4 = SparseArray.of<byte>(0x7f as byte);
        expect(arr4.length).assertEqual(1);
        expect(arr4[0] as byte).assertEqual(127 as byte);
        // 5. of<double>(3.14) -> length 1, arr[0] equals 3.14
        const arr5 = SparseArray.of<double>(3.14);
        expect(arr5.length).assertEqual(1);
        expect(arr5[0]!).assertEqual(3.14);
        // 6. of<char>('A'.charAt(0)) -> length 1, arr[0] equals 'A'
        const arr6 = SparseArray.of<char>('A'.charAt(0));
        expect(arr6.length).assertEqual(1);
        expect(arr6[0]!).assertEqual('A'.charAt(0));
        // 7. of<boolean>(true) -> length 1, arr[0] is true
        const arr7 = SparseArray.of<boolean>(true);
        expect(arr7.length).assertEqual(1);
        expect(arr7[0]!).assertTrue();
        // 8. of<int>(-2147483647-1) INT_MIN -> length 1, arr[0] equals -2147483648
        const arr8 = SparseArray.of<int>(-2147483647 - 1);
        expect(arr8.length).assertEqual(1);
        expect(arr8[0]!).assertEqual(-2147483648);
        // 9. of<int>(2147483647) INT_MAX -> length 1, arr[0] equals 2147483647
        const arr9 = SparseArray.of<int>(2147483647);
        expect(arr9.length).assertEqual(1);
        expect(arr9[0]!).assertEqual(2147483647);
        // 10. of<double>(1.5, 2.5) -> length 2
        const arr10 = SparseArray.of<double>(1.5, 2.5);
        expect(arr10.length).assertEqual(2);

      }
      {
        // 1. of<float>(0.0, -3.14, 2.71) -> length 3, values preserved in order
        const arr1 = SparseArray.of<float>(0.0 as float, -3.14 as float, 2.71 as float);
        expect(arr1.length).assertEqual(3);
        expect(arr1[0] as float).assertEqual(0.0 as float);
        expect(arr1[1] as float).assertEqual(-3.14 as float);
        expect(arr1[2] as float).assertEqual(2.71 as float);
        // 2. of<int>(8,3,15,1,7,12,4,19) -> length 8, arr[0]=8, arr[3]=1, arr[7]=19
        const arr2 = SparseArray.of<int>(8, 3, 15, 1, 7, 12, 4, 19);
        expect(arr2.length).assertEqual(8);
        expect(arr2[0]!).assertEqual(8);
        expect(arr2[3]!).assertEqual(1);
        expect(arr2[7]!).assertEqual(19);
        // 3. of<string>('a','b','c','d') -> length 4
        const arr3 = SparseArray.of<string>('a', 'b', 'c', 'd');
        expect(arr3.length).assertEqual(4);
        // 4. of<string>("","","") -> length 3, arr[0] and arr[2] equal ''
        const arr4 = SparseArray.of<string>("", "", "");
        expect(arr4.length).assertEqual(3);
        expect(arr4[0]!).assertEqual('');
        expect(arr4[2]!).assertEqual('');
        // 5. of<double>(0.0..9.9) -> length 10, arr[0]=0.0, arr[9]=9.9
        const arr5 = SparseArray.of<double>(0.0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9);
        expect(arr5.length).assertEqual(10);
        expect(arr5[0]!).assertEqual(0.0);
        expect(arr5[9]!).assertEqual(9.9);
        // 6. of<boolean>(alternating x10) -> length 10, arr[0] true, arr[1] false, arr[9] false
        const arr6 = SparseArray.of<boolean>(true, false, true, false, true, false, true, false, true, false);
        expect(arr6.length).assertEqual(10);
        expect(arr6[0]!).assertTrue();
        expect(arr6[1]!).assertFalse();
        expect(arr6[9]!).assertFalse();
        // 7. of<bigint>(100n, 200n) -> length 2, arr[0]=100n, arr[1]=200n
        const arr7 = SparseArray.of<bigint>(100n, 200n);
        expect(arr7.length).assertEqual(2);
        expect(arr7[0]!).assertEqual(100n);
        expect(arr7[1]!).assertEqual(200n);
        // 8. of<int>(-1, 0, 1) -> arr[0]=-1, arr[1]=0, arr[2]=1
        const arr8 = SparseArray.of<int>(-1, 0, 1);
        expect(arr8[0]!).assertEqual(-1);
        expect(arr8[1]!).assertEqual(0);
        expect(arr8[2]!).assertEqual(1);
        // 9. of<string>("aa","bb","aa","cc","bb") -> length 5, no dedup
        const arr9 = SparseArray.of<string>("aa", "bb", "aa", "cc", "bb");
        expect(arr9.length).assertEqual(5);
        expect(arr9[0]!).assertEqual("aa");
        expect(arr9[2]!).assertEqual("aa");
        expect(arr9[4]!).assertEqual("bb");
        // 10. of<int>(4,4,4,4,4) -> length 5, arr[0] and arr[4] equal 4
        const arr10 = SparseArray.of<int>(4, 4, 4, 4, 4);
        expect(arr10.length).assertEqual(5);
        expect(arr10[0]!).assertEqual(4);
        expect(arr10[4]!).assertEqual(4);

      }
      {
        // 1. of<double>(Double.POSITIVE_INFINITY) -> arr[0] equals positive infinity
        const arr1 = SparseArray.of<double>(Double.POSITIVE_INFINITY);
        expect(arr1[0]!).assertEqual(Double.POSITIVE_INFINITY);
        // 2. of<double>(Double.NEGATIVE_INFINITY) -> length 1, arr[0] negative infinity
        const arr2 = SparseArray.of<double>(Double.NEGATIVE_INFINITY);
        expect(arr2.length).assertEqual(1);
        expect(arr2[0]).assertNegUnlimited();
        // 3. of<double>(Number.NaN) -> length 1, arr[0] is NaN
        const arr3 = SparseArray.of<double>(Number.NaN);
        expect(arr3.length).assertEqual(1);
        expect(isNaN(arr3[0]!)).assertTrue();
        // 4. of<string>('\n','\t') -> arr[0] equals newline, arr[1] equals tab
        const arr4 = SparseArray.of<string>('\n', '\t');
        expect(arr4[0]!).assertEqual('\n');
        expect(arr4[1]!).assertEqual('\t');
        // 5. of<string>('\u200B' zero-width space) -> length 1
        const arr5 = SparseArray.of<string>('\u200B');
        expect(arr5.length).assertEqual(1);
        // 6. of<string>("a,b") -> arr[0] equals "a,b"
        const arr6 = SparseArray.of<string>("a,b");
        expect(arr6[0]!).assertEqual("a,b");
        // 7. of<string>('😀') -> length 1, arr[0] equals the emoji
        const arr7 = SparseArray.of<string>('😀');
        expect(arr7.length).assertEqual(1);
        expect(arr7[0]!).assertEqual('😀');
        // 8. of<int>(1,2) then arr[0]=99 -> arr[0] overwritten, length stays 2
        const arr8 = SparseArray.of<int>(1, 2);
        arr8[0] = 99;
        expect(arr8[0]!).assertEqual(99);
        expect(arr8.length).assertEqual(2);
        // 9. of<string>('a') then push('b') -> length grows to 2, arr[1] equals 'b'
        const arr9 = SparseArray.of<string>('a');
        arr9.push('b');
        expect(arr9.length).assertEqual(2);
        expect(arr9[1]!).assertEqual('b');
        // 10. two of<int>(1) calls return distinct instances
        const arr10a = SparseArray.of<int>(1);
        const arr10b = SparseArray.of<int>(1);
        expect(arr10a === arr10b).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1400
     * @tc.name testCreateFromNormal001
     * @tc.desc Test SparseArray.from method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateFromNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.from<int, string>([1, 2, 3], (v: int, k: int): string => v.toString())
          expect(arr !== null && arr !== undefined).assertTrue()
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual("1")
          expect(arr[1]).assertEqual("2")
          expect(arr[2]).assertEqual("3")
          expect(typeof arr[0]).assertEqual("string")
          expect(SparseArray.isArray(arr)).assertEqual(true)
          expect(arr instanceof SparseArray).assertEqual(true)


      }
      {
          const arr = SparseArray.from<int, int>([42], (v: int, k: int): int => v)
          expect(arr.length).assertEqual(1)
          expect(arr[0]).assertEqual(42)

      }
      {
          const set = new Set<int>([1, 2, 3])
          const arr = SparseArray.from<int, string>(set, (v: int, k: int): string => v.toString())
          expect(arr.length).assertEqual(3)

      }
      {
          const set = new Set<int>()
          const arr = SparseArray.from<int, int>(set, (v: int, k: int): int => v)
          expect(arr.length).assertEqual(0)

      }
      {
          const map = new Map<int, string>([[1, "a"], [2, "b"]])
          const arr = SparseArray.from<[int, string], string>(map, (v: [int, string], k: int): string => v[1])
          expect(arr.length).assertEqual(2)

      }
      {
          const srcStrs: Array<string> = ["a", "b", "c"]
          const arr = SparseArray.from<string, string>(srcStrs, (v: string, k: int): string => v.toUpperCase())
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual("A")

      }
      {
          const arr = SparseArray.from<int, int>([10, 20, 30], (v: int, k: int): int => v + k)
          expect(arr[0]).assertEqual(10)
          expect(arr[1]).assertEqual(21)
          expect(arr[2]).assertEqual(32)

      }
      {
          const arr = SparseArray.from<int, string>([1, 2, 3], (v: int, k: int): string => `num:${v}`)
          expect(arr[0]).assertEqual("num:1")

      }
      {
          const arr = SparseArray.from<int, int | null>([1, 2, 3], (v: int, k: int): int | null => v > 2 ? v : null)
          expect(arr[0]).assertEqual(null)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = SparseArray.from<string, string>(["1", "2", "3"], (v: string, k: int): string =>
            Double.toInt(Number.parseInt(v)).toString())
          expect(arr[0]).assertEqual("1")
          expect(arr[1]).assertEqual("2")
          expect(arr[2]).assertEqual("3")

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1500
     * @tc.name testCreateFromNormal002
     * @tc.desc Test SparseArray.from method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateFromNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.from<boolean, string>([true, false, true], (v: boolean, k: int): string => v.toString())
          expect(arr[0]).assertEqual("true")
          expect(arr[1]).assertEqual("false")
          expect(arr[2]).assertEqual("true")

      }
      {
          const arr = SparseArray.from<int, boolean>([0, 1, 2], (v: int, k: int): boolean => v > 1)
          expect(arr[0]).assertEqual(false)
          expect(arr[1]).assertEqual(false)
          expect(arr[2]).assertEqual(true)

      }
      {
          const arr = SparseArray.from<string, string>(["1", "a", "3"], (v: string, k: int): string => {
            const n = Number.parseInt(v);
            return isNaN(n) ? v : Double.toInt(n).toString();
          })
          expect(arr[0]).assertEqual("1")
          expect(arr[1]).assertEqual("a")
          expect(arr[2]).assertEqual("3")

      }
      {
          const arr = SparseArray.from<int, int | null>([1, 2, 3], (v: int, k: int): int | null => v === 2 ? null : v)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(null)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = SparseArray.from<int, int | undefined>([1, 2, 3], (v: int, k: int): int | undefined => undefined)
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertUndefined()

      }
      {
          const arr = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => 0)
          expect(arr[0]).assertEqual(0)
          expect(arr[1]).assertEqual(0)
          expect(arr[2]).assertEqual(0)

      }
      {
          const arr = SparseArray.from<int, boolean>([1, 2, 3], (v: int, k: int): boolean => false)
          expect(arr[0]).assertEqual(false)
          expect(arr[1]).assertEqual(false)
          expect(arr[2]).assertEqual(false)

      }
      {
          const arr = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => v)
          let count = 0
          for (const item of arr) {
            expect(item).assertEqual(count + 1)
            count++
          }
          expect(count).assertEqual(3)

      }
      {
          const input: Array<int> = [1, 2, 3]
          const arr = SparseArray.from<int, int>(input, (v: int, k: int): int => v)
          expect(arr.length).assertEqual(input.length)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(2)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = SparseArray.from<double, string>([Number.MAX_VALUE], (v: double, k: int): string => v.toString())
          expect(arr[0]).assertEqual(Number.MAX_VALUE.toString())

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1600
     * @tc.name testCreateFromNormal003
     * @tc.desc Test SparseArray.from method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateFromNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.from<double, string>([Number.MIN_VALUE], (v: double, k: int): string => v.toString())
          expect(arr[0]).assertEqual(Number.MIN_VALUE.toString())

      }
      {
          const arr = SparseArray.from<int, string>(new Array<int>(), (v: int, k: int): string => v.toString())
          expect(arr.length).assertEqual(0)
          expect(SparseArray.isArray(arr)).assertEqual(true)

      }
      {
          const result = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => v * 2)
            .map((v: int): int => v + 1)
            .filter((v: int): boolean => v > 2)
          expect(result!.length).assertEqual(3)
          expect(result![0]).assertEqual(3)
          expect(result[1]).assertEqual(5)
          expect(result[2]).assertEqual(7)

      }
      {
          const arr1 = SparseArray.from<int, string>([1, 2, 3], (v: int, k: int): string => v.toString())
          const arr2 = ["4", "5"] as Array<string>
          const arr3 = arr1.concat(arr2)
          expect(arr3.length).assertEqual(5)

      }
      {
          let startTime = Date.now()
          let largeArr: Array<int> = []
          for (let i = 0; i < 10000; i++) {
            largeArr.push(i)
          }
          const arr = SparseArray.from<int, int>(largeArr, (v: int, k: int): int => v * 2)
          let endTime = Date.now()
          expect(arr.length).assertEqual(10000)
          expect(arr[9999]).assertEqual(19998)
          expect(endTime - startTime).assertLess(3000)


      }
      {
          const arr = SparseArray.from<int, int>([1, 2, 3, 4, 5], (v: int, k: int): int => {
            let result = 1
            for (let i = 0; i < v; i++) {
              result *= 2
            }
            return result
          })
          expect(arr[0]).assertEqual(2)
          expect(arr[1]).assertEqual(4)
          expect(arr[2]).assertEqual(8)
          expect(arr[3]).assertEqual(16)
          expect(arr[4]).assertEqual(32)

      }
      {
          const arr = SparseArray.from<int, string>([1, 2, 3], (v: int, k: int): string => {
            return `${k}:${v}`
          })
          expect(arr[0]).assertEqual("0:1")
          expect(arr[1]).assertEqual("1:2")
          expect(arr[2]).assertEqual("2:3")

      }
      {
          const src: Array<byte> = [10 as byte, 20 as byte, 30 as byte];
          const arr = SparseArray.from<byte>(src);
          expect(arr.length).assertEqual(3);
          expect(arr[1]).assertEqual(20 as byte);

      }
      {
          const src: Array<short> = [100 as short, 32767 as short];
          const arr = SparseArray.from<short>(src);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(100 as short);
          expect(arr[1]).assertEqual(32767 as short);

      }
      {
          const a: long = 10000000000 as long;
          const b: long = 20000000000 as long;
          const src: Array<long> = [a, b];
          const arr = SparseArray.from<long>(src);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(a);
          expect(arr[1]).assertEqual(b);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1700
     * @tc.name testCreateFromNormal004
     * @tc.desc Test SparseArray.from method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateFromNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const src: Array<float> = [1.0f, 2.5f, 3.0f];
          const arr = SparseArray.from<float>(src);
          expect(arr.length).assertEqual(3);
          expect(arr[1]).assertEqual(2.5f);

      }
      {
          const src: Array<int> = [0x7F, 0b10, 100];
          const arr = SparseArray.from<int, int>(src, (v: int, _k: int): int => v);
          expect(arr[0]).assertEqual(127);
          expect(arr[1]).assertEqual(2);

      }
      {
          const arr = SparseArray.from<string>(["a", "b", "c"])
          expect(arr[0]).assertEqual("a")
          expect(arr[1]).assertEqual("b")
          expect(arr[2]).assertEqual("c")

      }
      {
          const arr = SparseArray.from<double>([1.1, 2.2, 3.3])
          expect(arr[0]).assertEqual(1.1)
          expect(arr[1]).assertEqual(2.2)
          expect(arr[2]).assertEqual(3.3)

      }
      {
          const src = [] as Array<int>;
          const arr = SparseArray.from<int>(src);
          expect(arr.length).assertEqual(0);

      }
      {
          const src = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] as Array<int>;
          const arr = SparseArray.from<int>(src);
          expect(arr.length).assertEqual(10);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);
          expect(arr[3]).assertEqual(4);
          expect(arr[4]).assertEqual(5);

      }
      {
          const arr = SparseArray.from<int | null>([1, null, 3])
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertNull()

      }
      {
          const typedArr = new Uint8Array([1, 2, 3])
          const plain: Array<int> = []
          for (let i = 0; i < typedArr.length; i++) {
            plain.push(Double.toInt(typedArr[i]))
          }
          const arr = SparseArray.from<int>(plain)
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual(1)

      }
      {
          const typedArr = new Int32Array([100, 200, 300])
          const plain: Array<int> = []
          for (let i = 0; i < typedArr.length; i++) {
            plain.push(Double.toInt(typedArr[i]))
          }
          const arr = SparseArray.from<int>(plain)
          expect(arr[0]).assertEqual(100)

      }
      {
          const typedArr = new Float64Array([1.1, 2.2, 3.3])
          const plain: Array<float> = []
          for (let i = 0; i < typedArr.length; i++) {
            plain.push(Double.toFloat(typedArr[i]))
          }
          const arr = SparseArray.from<float>(plain)
          expect(arr[0]).assertClose(1.1, 0.0001)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1800
     * @tc.name testCreateFromNormal005
     * @tc.desc Test SparseArray.from method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateFromNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = SparseArray.from<string>(["你", "好"])
          expect(arr.length).assertEqual(2)
          expect(arr[0]).assertEqual("你")

      }
      {
          const set = new Set<int>([1, 2, 3])
          const arr = SparseArray.from<int>(set)
          expect(arr.length).assertEqual(3)

      }
      {
          const set = new Set<int>()
          const arr = SparseArray.from<int>(set)
          expect(arr.length).assertEqual(0)

      }
      {
          const map = new Map<string, int>()
          map.set("a", 1)
          map.set("b", 2)
          const arr = SparseArray.from<int>(map.values())
          expect(arr.length).assertEqual(2)

      }
      {
          const largeArr = [] as Array<int>
          for (let i = 0; i < 1000; i++) {
            largeArr.push(i)
          }
          const arr = SparseArray.from<int>(largeArr)
          expect(arr.length).assertEqual(1000)
          expect(arr[999]).assertEqual(999)

      }
      {
          const arr = SparseArray.from<double>([Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY])
          expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY)
          expect(arr[1]).assertEqual(Double.NEGATIVE_INFINITY)

      }
      {
          const arr = SparseArray.from<double>([Double.NaN])
          expect(isNaN(arr[0] as number)).assertTrue()

      }
      {
          const arr = SparseArray.from<int | undefined>([1, 2, undefined, undefined, undefined])
          expect(arr.length).assertEqual(5)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(2)
          expect(arr[2]).assertUndefined()

      }
      {
          const arr = SparseArray.from<int | undefined>([1, undefined, 3, undefined, 5])
          expect(arr.length).assertEqual(5)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertUndefined()
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = SparseArray.from<int | string>([1, "hello", 2, "world"])
          expect(arr.length).assertEqual(4)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual("hello")

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_1900
     * @tc.name testCreateFromNormal006
     * @tc.desc Test SparseArray.from method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateFromNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const inner1 = new SparseArray<int>(1, 2)
          const inner2 = new SparseArray<int>(3, 4)
          const arr = SparseArray.from<SparseArray<int>>([inner1, inner2])
          expect(arr.length).assertEqual(2)
          expect(arr[0] === inner1).assertTrue()

      }
      {
          const arr = SparseArray.from<string>(["line1\nline2", "tab\there"])
          expect(arr[0]).assertEqual("line1\nline2")
          expect(arr[1]).assertEqual("tab\there")

      }
      {
          const arr = SparseArray.from<string>(["😀", "🎉", "❤️"])
          expect(arr[0]).assertEqual("😀")
          expect(arr[1]).assertEqual("🎉")

      }
      {
          const largeArr = [] as Array<int>
          for (let i = 0; i < 10000; i++) {
            largeArr.push(i)
          }
          const arr = SparseArray.from<int>(largeArr)
          expect(arr.length).assertEqual(10000)
          expect(arr[0]).assertEqual(0)
          expect(arr[9999]).assertEqual(9999)

      }
      {
          // const arr = SparseArray.from<string>([1, 2, 3])
          const arr = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => v)
          expect(arr instanceof SparseArray).assertTrue()
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(2)
          expect(arr[2]).assertEqual(3)

      }
      {
          const src: Array<short> = [10 as short, 20 as short];
          const arr = SparseArray.from<short, short>(src, (v: short, _k: int): short => (Short.toInt(v) * 2).toShort());
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(20 as short);
          expect(arr[1]).assertEqual(40 as short);

      }
      {
          const src: Array<string | null> = [null, "", "ok"];
          const arr = SparseArray.from<string | null>(src);
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(null);
          expect(arr[1]).assertEqual("");

      }
      {
          const xss = "<script>alert(1)</script>";
          const arr = SparseArray.from<string>(["safe", xss]);
          expect(arr[1]).assertEqual(xss);

      }
      {
          const src: Array<int> = [0x10, 0b11, 5];
          const arr = SparseArray.from<int, int>(src, (v: int, _k: int): int => v);
          expect(arr[0]).assertEqual(16);
          expect(arr[1]).assertEqual(3);

      }
      {
          const src: Array<int> = [1, 2, 3];
          const overflow: int = (2147483647 as int + 1 as int) as int;
          const arr = SparseArray.from<int, int>(src, (v: int, k: int): int => {
            if (k === 1) {
              return overflow;
            }
            return v;
          });
          expect(arr[1]).assertEqual(overflow);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_2000
     * @tc.name testCreateFromNormal007
     * @tc.desc Test SparseArray.from method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateFromNormal007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const src: Array<int | undefined> = [1, undefined, 3];
          const arr = SparseArray.from<int | undefined>(src);
          expect(arr.length).assertEqual(3);
          expect(arr[1]).assertEqual(undefined);

      }
      {
        // 1. from(Item00801[]) preserves object id fields [1,2]
        const obj1: Item00801 = { id: 1 };
        const obj2: Item00801 = { id: 2 };
        const src1: Item00801[] = [obj1, obj2];
        const arr1 = SparseArray.from<Item00801>(src1);
        expect(arr1[0]!.id).assertEqual(1);
        expect(arr1[1]!.id).assertEqual(2);
        // 2. from(boolean[]) and from with mapFn both preserve [true,false]
        const src2: boolean[] = [true, false];
        const arr2 = SparseArray.from<boolean>(src2);
        const arr2m = SparseArray.from<boolean, boolean>(src2, (v: boolean, k: int): boolean => v);
        expect(arr2[0]!).assertEqual(arr2m[0]!);
        expect(arr2[1]!).assertEqual(arr2m[1]!);
        // 3. from(Set<string>) and from with mapFn both preserve ['p','q','r']
        const set3: Set<string> = new Set<string>(['p', 'q', 'r']);
        const arr3 = SparseArray.from<string>(set3);
        const arr3m = SparseArray.from<string, string>(set3, (v: string, k: int): string => v);
        expect(arr3[0]!).assertEqual(arr3m[0]!);
        expect(arr3[1]!).assertEqual(arr3m[1]!);
        expect(arr3[2]!).assertEqual(arr3m[2]!);
        // 4. from(Map.keys()) creates [10,20] with length 2 in insertion order
        const map4: Map<int, string> = new Map<int, string>();
        map4.set(10, 'x');
        map4.set(20, 'y');
        const arr4 = SparseArray.from<int>(map4.keys());
        expect(arr4.length).assertEqual(2);
        expect(arr4[0]!).assertEqual(10);
        expect(arr4[1]!).assertEqual(20);
        // 5. from(int[]) on [10,20,30] yields length 3 with elements 10,20,30
        const arr5 = SparseArray.from<int>([10, 20, 30]);
        expect(arr5.length).assertEqual(3);
        expect(arr5[0]!).assertEqual(10);
        expect(arr5[1]!).assertEqual(20);
        expect(arr5[2]!).assertEqual(30);
        // 6. from(int[], mapFn doubler) on [1,2,3] yields [2,4,6]
        const arr6 = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => v * 2);
        expect(arr6.length).assertEqual(3);
        expect(arr6[0]!).assertEqual(2);
        expect(arr6[1]!).assertEqual(4);
        expect(arr6[2]!).assertEqual(6);
        // 7. from(string[], mapFn index) on ['a','b','c'] yields [0,1,2]
        const arr7 = SparseArray.from<string, int>(['a', 'b', 'c'], (v: string, k: int): int => k);
        expect(arr7.length).assertEqual(3);
        expect(arr7[0]!).assertEqual(0);
        expect(arr7[1]!).assertEqual(1);
        expect(arr7[2]!).assertEqual(2);
        // 8. from(int[]) on [-1,0,1] preserves negative and zero
        const arr8 = SparseArray.from<int>([-1, 0, 1]);
        expect(arr8[0]!).assertEqual(-1);
        expect(arr8[1]!).assertEqual(0);
        expect(arr8[2]!).assertEqual(1);
        // 9. from(int[]) copies elements so result mutation leaves source unchanged
        const src9: int[] = [1, 2, 3];
        const arr9 = SparseArray.from<int>(src9);
        arr9[0] = 99;
        expect(arr9[0]!).assertEqual(99);
        expect(src9[0]).assertEqual(1);
        // 10. from(Date[]) keeps element references (same Date instance)
        const date1: Date = new Date(0);
        const date2: Date = new Date(1000);
        const src10: Date[] = [date1, date2];
        const arr10 = SparseArray.from<Date>(src10);
        expect(arr10[0]! === date1).assertEqual(true);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_2100
     * @tc.name testCreateFromError001
     * @tc.desc Test SparseArray.from method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateFromError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            SparseArray.from<int, string>([1, 2, 3], null as SparseArrayFromIntKeyToStringFn)
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            SparseArray.from<int, int>([1, 2, 3], (undefined as SparseArrayFromIntKeyToIntFn))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => { throw new Error("map error"); })
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error")
          }

      }
      {
        try {
            SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => { throw new CustomMapError025("map failed"); })
            expect().assertFail();
          } catch (error) {
            expect(error instanceof CustomMapError025).assertEqual(true)
            expect((error as Error).name).assertEqual("CustomMapError025")
          }

      }
      {
          try {
            SparseArray.from<int>(null as Array<int>)
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => {
              throw new Error('invalid map path')
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          try {
            SparseArray.from<int>(undefined as Array<int>)
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            SparseArray.from<int>((new From2Bad029()) as Object as Array<int>)
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_2200
     * @tc.name testCreateIsArrayNormal001
     * @tc.desc Test SparseArray.isArray method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateIsArrayNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          expect(SparseArray.isArray(new SparseArray<int>())).assertTrue();


      }
      {
          const arr = [] as Array<int>
          const result = SparseArray.isArray(arr)
          expect(result).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(100)).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(0)).assertEqual(false)

      }
      {
          expect(SparseArray.isArray("test")).assertEqual(false)

      }
      {
          expect(SparseArray.isArray("")).assertEqual(false)

      }
      {
          expect(SparseArray.isArray("测试")).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(true)).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(c'A')).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(100n)).assertEqual(false)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_2300
     * @tc.name testCreateIsArrayNormal002
     * @tc.desc Test SparseArray.isArray method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateIsArrayNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          expect(SparseArray.isArray(new Object())).assertEqual(false)

      }
      {
          const o = new IsArrayPlainObj()
          o.name = 'test'
          expect(SparseArray.isArray(o)).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(null)).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(undefined)).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(() => {})).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(new Map<string, int>())).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(new Set<int>())).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(new Date())).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(new Promise<void>(() => {}))).assertEqual(false)

      }
      {
          const arr = new SparseArray<string>()
          expect(SparseArray.isArray(arr)).assertEqual(true)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_2400
     * @tc.name testCreateIsArrayNormal003
     * @tc.desc Test SparseArray.isArray method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateIsArrayNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<object>()
          expect(SparseArray.isArray(arr)).assertEqual(true)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          expect(SparseArray.isArray(arr)).assertEqual(true)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[2] = 10
          expect(SparseArray.isArray(arr)).assertEqual(true)

      }
      {
          const arr = new SparseArray<int>()
          const result = SparseArray.isArray(arr)
          expect(typeof result).assertEqual('boolean')
          expect(result).assertEqual(true)

      }
      {
          const arr = [] as Array<int>
          const result = SparseArray.isArray(arr)
          expect(typeof result).assertEqual('boolean')
          expect(result).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(Double.POSITIVE_INFINITY)).assertEqual(false)
          expect(SparseArray.isArray(Double.NEGATIVE_INFINITY)).assertEqual(false)
          expect(SparseArray.isArray(Double.NaN)).assertEqual(false)

      }
      {
          expect(SparseArray.isArray(String(123))).assertEqual(false)
          expect(SparseArray.isArray(Number("123"))).assertEqual(false)
          expect(SparseArray.isArray(Boolean(1))).assertEqual(false)

      }
      {
          const value: Any = 1
          expect(SparseArray.isArray(value)).assertEqual(false)

      }
      {
          const sparseArr = new SparseArray<int>()
          const normalArr = [] as Array<int>

          expect(SparseArray.isArray(sparseArr)).assertEqual(true)
          expect(Array.isArray(sparseArr)).assertEqual(false)

          expect(SparseArray.isArray(normalArr)).assertEqual(false)
          expect(Array.isArray(normalArr)).assertEqual(true)

      }
      {
          const testCount = 10000
          const arr = new SparseArray<int>()
          for (let i = 0; i < testCount; i++) {
            expect(SparseArray.isArray(arr)).assertTrue()
          }
          expect(SparseArray.isArray(arr)).assertTrue();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_2500
     * @tc.name testCreateIsArrayNormal004
     * @tc.desc Test SparseArray.isArray method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateIsArrayNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const sparseArr = new SparseArray<int>(1, 2, 3)
          expect(sparseArr instanceof SparseArray).assertTrue()
          isArrayProcessSparseArray(sparseArr)

      }
      {
          expect(SparseArray.isArray(new SparseArray<byte>(10 as byte, 20 as byte))).assertTrue();

      }
      {
          expect(SparseArray.isArray(new SparseArray<long>(100 as long))).assertTrue();

      }
      {
          expect(SparseArray.isArray(new SparseArray<int>(0x1, 0b10))).assertTrue();

      }
      {
          const arr = new IsArrayPlainArrayChild()
          arr.push(1)
          expect(arr.label).assertEqual('child')
          expect(SparseArray.isArray(arr)).assertEqual(false)

      }
      {
          const arr = Array.create<int>(3, 7)
          expect(arr.length).assertEqual(3)
          expect(arr[0]).assertEqual(7)
          expect(SparseArray.isArray(arr)).assertEqual(false)
          expect(Array.isArray(arr)).assertEqual(true)

      }
      {
          const arr = [1, 2, 3] as Array<int>
          expect(SparseArray.isArray(arr)).assertEqual(false)
          expect(Array.isArray(arr)).assertEqual(true)

      }
      {
          const first = [1, 2] as Array<int>
          const second = [3, 4] as Array<int>
          const arr = [first, second] as Array<Array<int>>
          expect(SparseArray.isArray(arr)).assertEqual(false)
          expect(Array.isArray(arr)).assertEqual(true)

      }
      {
          const arr = [new IsArrayPlainObj(), new IsArrayPlainObj()] as Array<IsArrayPlainObj>
          expect(SparseArray.isArray(arr)).assertEqual(false)
          expect(Array.isArray(arr)).assertEqual(true)

      }
      {
          const sparseArr = new SparseArray<int>(1, 2, 3)
          const arr = [sparseArr[0], sparseArr[1], sparseArr[2]] as Array<int | undefined>
          expect(SparseArray.isArray(sparseArr)).assertTrue()
          expect(SparseArray.isArray(arr)).assertEqual(false)
          expect(Array.isArray(arr)).assertEqual(true)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CREATION_2600
     * @tc.name testCreateIsArrayNormal005
     * @tc.desc Test SparseArray.isArray method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateIsArrayNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. new SparseArray<int>(5) -> true
        const arr1: SparseArray<int> = new SparseArray<int>(5);
        expect(SparseArray.isArray(arr1)).assertTrue();
        // 2. new SparseArray<string>('a','b') -> true
        const arr2: SparseArray<string> = new SparseArray<string>('a', 'b');
        expect(SparseArray.isArray(arr2)).assertTrue();
        // 3. new SparseArray<bigint>(0n,1n) -> true
        const arr3: SparseArray<bigint> = new SparseArray<bigint>(0n, 1n);
        expect(SparseArray.isArray(arr3)).assertTrue();
        // 4. SparseArray.from(int[]) -> true
        const like1: int[] = [];
        const arr4: SparseArray<int> = SparseArray.from<int>(like1);
        expect(SparseArray.isArray(arr4)).assertTrue();
        // 5. SparseArray.of(42) -> true
        const arr5: SparseArray<int> = SparseArray.of<int>(42);
        expect(SparseArray.isArray(arr5)).assertTrue();
        // 6. SparseArray.from(SparseArray) -> true
        const src1: SparseArray<int> = new SparseArray<int>(1, 2, 3);
        const arr6: SparseArray<int> = SparseArray.from<int>(src1);
        expect(SparseArray.isArray(arr6)).assertTrue();
        // 7. SparseArray.from(Array) -> true
        const srcArr1: int[] = [100, 200];
        const arr7: SparseArray<int> = SparseArray.from<int>(srcArr1);
        expect(SparseArray.isArray(arr7)).assertTrue();
        // 8. SparseArray.map() -> true
        const base1: SparseArray<int> = new SparseArray<int>(1, 2, 3);
        const arr8: SparseArray<int> = base1.map((v: int, k: int, a: SparseArray<int>): int => v * 2);
        expect(SparseArray.isArray(arr8)).assertTrue();
        // 9. SparseArray.flat() -> true
        const inner1: SparseArray<int> = new SparseArray<int>(1, 2);
        const wrap1: SparseArray<SparseArray<int>> = new SparseArray<SparseArray<int>>();
        wrap1.push(inner1);
        const arr9: SparseArray<int> = wrap1.flat<int>(1);
        expect(SparseArray.isArray(arr9)).assertTrue();
        // 10. SparseArray as Object -> true
        const arr10: SparseArray<int> = new SparseArray<int>(1, 2);
        const obj10: Object = arr10;
        expect(SparseArray.isArray(obj10)).assertTrue();

      }
      {
        // 1. isArray(42) -> false (number primitive)
        expect(SparseArray.isArray(42)).assertFalse();
        // 2. isArray(Number.NaN) -> false (NaN)
        expect(SparseArray.isArray(Number.NaN)).assertFalse();
        // 3. isArray(0n) -> false (bigint primitive)
        expect(SparseArray.isArray(0n)).assertFalse();
        // 4. isArray('​') -> false (zero-width space string)
        expect(SparseArray.isArray('​')).assertFalse();
        // 5. isArray('\0') -> false (null char string)
        expect(SparseArray.isArray('\0')).assertFalse();
        // 6. isArray(Date) -> false
        const date1: Date = new Date(0);
        expect(SparseArray.isArray(date1)).assertFalse();
        // 7. isArray(RegExp) -> false
        const regex1: RegExp = new RegExp('abc');
        expect(SparseArray.isArray(regex1)).assertFalse();
        // 8. isArray(Error) -> false
        const err1: Error = new Error('test');
        expect(SparseArray.isArray(err1)).assertFalse();
        // 9. isArray({}) -> false (empty plain object)
        const emptyObj1: SparseArrayIsArrayPartEmptyObject = {};
        expect(SparseArray.isArray(emptyObj1)).assertFalse();
        // 10. isArray(Int8Array) -> false (typed array)
        const ta1: Int8Array = new Int8Array(1);
        expect(SparseArray.isArray(ta1)).assertFalse();

      }
      {
        // 1. SparseArray<object-element> -> true
        const obj1: SparseArrayIsArrayPartObjectItem = { id: 1 as number };
        const arr1: SparseArray<SparseArrayIsArrayPartObjectItem> = new SparseArray<SparseArrayIsArrayPartObjectItem>(obj1);
        expect(SparseArray.isArray(arr1)).assertTrue();
        // 2. SparseArray<Date> -> true
        const dateA: Date = new Date(0);
        const arr2: SparseArray<Date> = new SparseArray<Date>(dateA);
        expect(SparseArray.isArray(arr2)).assertTrue();
        // 3. SparseArray<int[]> -> true
        const inner1: int[] = [1, 2];
        const arr3: SparseArray<int[]> = new SparseArray<int[]>(inner1);
        expect(SparseArray.isArray(arr3)).assertTrue();
        // 4. isArray(function) -> false
        const fn1: () => number = () => 0;
        expect(SparseArray.isArray(fn1)).assertFalse();
        // 5. isArray(ArrayBuffer) -> false
        const ab1: ArrayBuffer = new ArrayBuffer(8);
        expect(SparseArray.isArray(ab1)).assertFalse();
        // 6. isArray(DataView) -> false
        const ab2: ArrayBuffer = new ArrayBuffer(8);
        const dv1: DataView = new DataView(ab2);
        expect(SparseArray.isArray(dv1)).assertFalse();
        // 7. isArray(keys() iterator) -> false
        const arr4: SparseArray<int> = new SparseArray<int>(1, 2);
        const iter1: IterableIterator<int> = arr4.keys();
        expect(SparseArray.isArray(iter1)).assertFalse();

      }
    });

  });
}
