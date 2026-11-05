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

class CustomFindError016 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomFindError016";
    }
  }

interface Person021 {
    name: string;
    age: int;
  }

function findPredGreaterThanTwo004(value: int): boolean {
  return value > 2;
}

interface SparseArrayFindPartItem {
  id: int;
  name: string;
}

interface SparseArrayFindPartItemC {
  a: int;
  b: string;
}

// Merged from SparseArrayFindPart01Test + SparseArrayFindPart02Test (61 scenarios -> 7 cases, each <=10)

type SparseArrayIntFindIndexPred = (v: int) => boolean;

interface ItemData {
  id: int;
  name: string;
}
// Merged from 43 findIndex scenarios -> 5 cases, each <=10

type SparseArrayIntFindLastPred = (v: int) => boolean;

class Person009 {
    name: string = "";
    age: int = 0;
  }

interface SparseArrayFindLastPart01Point {
  x: int;
  y: int;
}

interface SparseArrayFindLastPart01NullableItem {
  key: int;
  val: string | null;
}

interface SparseArrayFindLastPart01Inner {
  count: int;
}

interface SparseArrayFindLastPart01Outer {
  label: string;
  detail: SparseArrayFindLastPart01Inner;
}

class SparseArrayFindLastPart01Item {
  id: int = 0;
  name: string = '';
}

type SparseArrayIntFindLastIndexPred = (v: int) => boolean;

interface Item024 {
    id: number;
    name: string;
  }

class CustomError021 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomError021";
    }
  }

class Item028 {
    id: int;
    name: string;
    constructor(id: int, name: string) {
      this.id = id;
      this.name = name;
    }
  }

type SparseArrayIntEveryPred = (v: int, i: int, a: SparseArray<int>) => boolean;

class CustomError028 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomError028";
    }
  }

class Person030 {
    name: string;
    age: int;
    constructor(name: string, age: int) {
      this.name = name;
      this.age = age;
    }
  }

export default function SparseArraySearchTest(): void {
  describe('SparseArraySearchTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0100
     * @tc.name testSearchFindNormal001
     * @tc.desc Test SparseArray.find method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5);
          expect(arr.length).assertEqual(5);
          arr.push(1, 2, 3, 4);
          const found = arr.find((v) => v > 2);
          expect(found).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[1] = 2;
          arr[2] = 3;
          arr[3] = 4;
          const found = arr.find((value, index, array) => {
            return value > 2 && index < 4;
          });
          expect(found).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          const found = arr.find(findPredGreaterThanTwo004);
          expect(found).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          const found = arr.find(() => true);
          expect(found).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          const found = arr.find(() => false);
          expect(found).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>();
          const found = arr.find((v) => v > 2);
          expect(found).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(5);
          arr.push(0, 2, 3, 4);
          const found = arr.find((v) => v < 1);
          expect(found).assertEqual(0);


      }
      {
          const arr = new SparseArray<int | undefined>(5);
          arr.push(undefined, 2, 3, 4);
          const found = arr.find((v) => v === undefined);
          expect(found).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          let found: int | undefined = arr.find((v) => v > 2);
          expect(found).assertEqual(3);
          found = arr.find((v) => v > 10);
          expect(found).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(1);
          arr[0] = 5;
          const found = arr.find((v) => v > 2);
          expect(found).assertEqual(5);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0200
     * @tc.name testSearchFindNormal002
     * @tc.desc Test SparseArray.find method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1000);
          for (let i = 0; i < 1000; i++) {
            arr[i] = i;
          }
          const found = arr.find((v) => v === 500);
          expect(found).assertEqual(500);


      }
      {
          const arr = new SparseArray<int>(10);
          arr.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
          const found = arr.find((v, i) => v % 3 === 0 && i > 3);
          expect(found).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          const found = arr.find((v) => v > 2);
          expect(found).assertEqual(3);
          expect(arr.length).assertEqual(9);


      }
      {
          const arr = new SparseArray<string>(3);
          arr.push("apple", "banana", "cherry");
          const found = arr.find((s) => s.length > 5);
          expect(found).assertEqual("banana");


      }
      {
          const arr = new SparseArray<boolean>(5);
          arr.push(false, false, true, true);
          const found = arr.find((b) => b === true);
          expect(found).assertEqual(true);


      }
      {
          const arr = new SparseArray<char>(5);
          arr[0] = c'A';
          arr[2] = c'C';
          arr[4] = c'E';
          const found = arr.find((ch) => ch > c'B');
          expect(found).assertEqual(c'C');


      }
      {
        const arr = new SparseArray<Person021>(3);
          arr[0] = { name: "Alice", age: 25 };
          arr[1] = { name: "Bob", age: 30 };
          arr[2] = { name: "Charlie", age: 35 };
          const found = arr.find((p) => p.age > 30);
          expect(found!.name).assertEqual("Charlie");
          expect(found!.age).assertEqual(35);


      }
      {
          const arr = new SparseArray<int | string>(5);
          arr.push(1, "hello", 3, "world", 5);
          const found = arr.find((item) => (typeof item == "string"));
          expect(found).assertEqual("hello");


      }
      {
          const arr = new SparseArray<int | undefined>(5);
          arr.push(1, undefined, 3, undefined, 5);
          const found = arr.find((item) => item !== undefined && item > 3);
          expect(found).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[1] = 2;
          arr[2] = 3;
          arr[3] = 4;
          const found = arr.find((v, i) => i === 2);
          expect(found).assertEqual(3);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0300
     * @tc.name testSearchFindNormal003
     * @tc.desc Test SparseArray.find method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          const found = arr.find((v, i, a) => a.length > 3 && v > 2);
          expect(found).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(6);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          let callCount = 0;
          const found = arr.find((v) => {
            callCount++;
            return v > 20;
          });
          expect(found).assertEqual(30);
          expect(callCount).assertLessOrEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const calledIndices: Array<int> = [];
          arr.find((v, i) => {
            calledIndices.push(i);
            return v > 40;
          });
          expect(calledIndices.length).assertEqual(3);
          expect(calledIndices[0]).assertEqual(0);
          expect(calledIndices[1]).assertEqual(2);
          expect(calledIndices[2]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(5);
          const found = arr.find((v) => v > 2);
          expect(found).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(10000);
          for (let i = 0; i < 10000; i++) {
            arr[i] = i;
          }
          const startTime = Date.now();
          const found = arr.find((v) => v === 9999);
          const endTime = Date.now();
          expect(found).assertEqual(9999);


      }
      {
          const arr = new SparseArray<int>(10000);
          for (let i = 0; i < 10000; i += 100) {
            arr[i] = i;
          }
          const found = arr.find((v) => v === 5000);
          expect(found).assertEqual(5000);


      }
      {
          const arr = new SparseArray<int>(10);
          arr.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
          let callCount = 0;
          const found = arr.find((v) => {
            callCount++;
            return v === 3;
          });
          expect(found).assertEqual(3);
          expect(callCount).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(100);
          for (let i = 0; i < 100; i++) {
            arr[i] = i;
          }
          const found = arr.find((v) => {
            let sum = 0;
            for (let j = 0; j < v; j++) {
              sum += j;
            }
            return sum > 100;
          });
          expect(found).assertEqual(15);


      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
          const threshold: long = 1000000000 as long;
          const found = arr.find((v: long): boolean => v > threshold);
          expect(found).assertEqual(10000000000 as long);

      }
      {
          const arr = new SparseArray<short>(100 as short, 200 as short, 30000 as short);
          const found = arr.find((v: short): boolean => v > (10000 as short));
          expect(found).assertEqual(30000 as short);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0400
     * @tc.name testSearchFindNormal004
     * @tc.desc Test SparseArray.find method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int | null>(1, null, 3);
          const found = arr.find((v: int | null): boolean => v === null);
          expect(found).assertEqual(null);

      }
      {
          const xss = "<script>alert(1)</script>";
          const arr = new SparseArray<string>("a", xss);
          const found = arr.find((v: string): boolean => v === xss);
          expect(found).assertEqual(xss);

      }
      {
          const arr = new SparseArray<int>(1, 0b111, 3);
          const found = arr.find((v: int): boolean => v === 0b111);
          expect(found).assertEqual(0b111);

      }
      {
        // 1. find on (1,2,3) with value > 0 -> 1
        const arr1 = new SparseArray<int>(1, 2, 3);
        const result1 = arr1.find((value: int) => value > 0);
        expect(result1).assertEqual(1);
        // 2. find on (5,10,15) with value >= 10 -> 10
        const arr2 = new SparseArray<int>(5, 10, 15);
        const result2 = arr2.find((value: int) => value >= 10);
        expect(result2).assertEqual(10);
        // 3. find on (7,1,2) with value === 7 -> 7
        const arr3 = new SparseArray<int>(7, 1, 2);
        const result3 = arr3.find((value: int) => value === 7);
        expect(result3).assertEqual(7);
        // 4. find on (1,2,2,3) with value === 2 -> 2
        const arr4 = new SparseArray<int>(1, 2, 2, 3);
        const result4 = arr4.find((value: int) => value === 2);
        expect(result4).assertEqual(2);
        // 5. find on (3,8,15,4,2) with value > 5 && value < 10 -> 8
        const arr5 = new SparseArray<int>(3, 8, 15, 4, 2);
        const result5 = arr5.find((value: int) => value > 5 && value < 10);
        expect(result5).assertEqual(8);
        // 6. find on (1,3,5) with value * 2 === 6 -> 3
        const arr6 = new SparseArray<int>(1, 3, 5);
        const result6 = arr6.find((value: int) => value * 2 === 6);
        expect(result6).assertEqual(3);
        // 7. find on (5,-3,7,-8) with value < 0 -> -3
        const arr7 = new SparseArray<int>(5, -3, 7, -8);
        const result7 = arr7.find((value: int) => value < 0);
        expect(result7).assertEqual(-3);
        // 8. find on (10,20,30) with value > 15 -> 20
        const arr8 = new SparseArray<int>(10, 20, 30);
        const result8 = arr8.find((value: int) => value > 15);
        expect(result8).assertEqual(20);
        // 9. find on (33,-7,0,128) with value < 0 -> -7, array unchanged
        const arr9 = new SparseArray<int>(33, -7, 0, 128);
        const result9 = arr9.find((value: int) => value < 0);
        expect(result9).assertEqual(-7);
        expect(arr9[0]).assertEqual(33);
        expect(arr9[1]).assertEqual(-7);
        expect(arr9[2]).assertEqual(0);
        expect(arr9[3]).assertEqual(128);
        // 10. find on (100,200,300) with value > 150 -> 200, length 3
        const arr10 = new SparseArray<int>(100, 200, 300);
        const result10 = arr10.find((value: int) => value > 150);
        expect(result10).assertEqual(200);
        expect(arr10.length).assertEqual(3);

      }
      {
        // 1. string: find on ('alpha','beta','gamma') with value.length > 4 -> 'alpha'
        const arr1 = new SparseArray<string>('alpha', 'beta', 'gamma');
        const result1 = arr1.find((value: string) => value.length > 4);
        expect(result1).assertEqual('alpha');
        // 2. boolean: find on (false,true,false) with value -> true
        const arr2 = new SparseArray<boolean>(false, true, false);
        const result2 = arr2.find((value: boolean) => value);
        expect(result2).assertTrue();
        // 3. double: find on (1.5,2.5,3.5) with value > 2.0 -> 2.5
        const arr3 = new SparseArray<double>(1.5, 2.5, 3.5);
        const result3 = arr3.find((value: double) => value > 2.0);
        expect(result3).assertEqual(2.5);
        // 4. bigint: find on (0n,100n,200n) with value > 50n -> 100n
        const arr4 = new SparseArray<bigint>(0n, 100n, 200n);
        const result4 = arr4.find((value: bigint) => value > 50n);
        expect(result4).assertEqual(100n);
        // 5. object: find on (o1,o2) with value.id > 1 -> o2
        const o1_5: SparseArrayFindPartItem = { id: 1, name: 'a' };
        const o2_5: SparseArrayFindPartItem = { id: 2, name: 'b' };
        const arr5 = new SparseArray<SparseArrayFindPartItem>(o1_5, o2_5);
        const result5 = arr5.find((value: SparseArrayFindPartItem) => value.id > 1);
        expect(result5).assertEqual(o2_5);
        // 6. object c: find on (o1,o2) with value.a > 1 -> o2, elements verified
        const o1_6: SparseArrayFindPartItemC = { a: 1, b: 'one' };
        const o2_6: SparseArrayFindPartItemC = { a: 2, b: 'two' };
        const arr6 = new SparseArray<SparseArrayFindPartItemC>(o1_6, o2_6);
        const result6 = arr6.find((value: SparseArrayFindPartItemC) => value.a > 1);
        expect(result6).assertEqual(o2_6);
        expect(arr6[0]!.a).assertEqual(1);
        expect(arr6[0]!.b).assertEqual('one');
        expect(arr6[1]!.a).assertEqual(2);
        expect(arr6[1]!.b).assertEqual('two');
        // 7. double NaN: find on (NaN,10.0,20.0) with value > 5.0 -> 10.0, arr[0] isNaN
        const arr7 = new SparseArray<double>(Double.NaN, 10.0, 20.0);
        const result7 = arr7.find((value: double) => value > 5.0);
        expect(result7).assertEqual(10.0);
        expect(isNaN(arr7[0] as double)).assertTrue();
        // 8. string: find on ('a','b','c') with value.length > 0 -> 'a', pop 'c'
        const arr8 = new SparseArray<string>('a', 'b', 'c');
        const result8 = arr8.find((value: string) => value.length > 0);
        expect(result8).assertEqual('a');
        const popped8: string = arr8.pop() as string;
        expect(popped8).assertEqual('c');
        expect(arr8.length).assertEqual(2);
        // 9. string: find on ('cat','dog','bird') with value === 'dog' -> 'dog', includes
        const arr9 = new SparseArray<string>('cat', 'dog', 'bird');
        const result9 = arr9.find((value: string) => value === 'dog');
        expect(result9).assertEqual('dog');
        expect(arr9.includes('dog')).assertTrue();
        expect(arr9.includes('fish')).assertFalse();
        // 10. Array<int>: find on (nested1,nested2) with value.length > 2 -> nested1
        const nested1_10: Array<int> = [1, 2, 3];
        const nested2_10: Array<int> = [4, 5, 6];
        const arr10 = new SparseArray<Array<int>>(nested1_10, nested2_10);
        const result10 = arr10.find((value: Array<int>) => value.length > 2);
        expect(result10).assertEqual(nested1_10);
        expect(arr10[0]!.length).assertEqual(3);
        expect(arr10[1]!.length).assertEqual(3);

      }
      {
        // 1. find on (10,20,30) with false -> undefined
        const arr1 = new SparseArray<int>(10, 20, 30);
        const result1 = arr1.find((value: int) => false);
        expect(result1).assertUndefined();
        // 2. value 0 boundary: find on (0,1,2) receives value 0
        const arr2 = new SparseArray<int>(0, 1, 2);
        let receivedZero2: boolean = false;
        arr2.find((value: int) => {
          if (value === 0) {
            receivedZero2 = true;
          }
          return false;
        });
        expect(receivedZero2).assertTrue();
        // 3. value MAX boundary: find on (2147483647,0) receives value MAX
        const arr3 = new SparseArray<int>(2147483647, 0);
        let receivedMax3: boolean = false;
        arr3.find((value: int) => {
          if (value === 2147483647) {
            receivedMax3 = true;
          }
          return false;
        });
        expect(receivedMax3).assertTrue();
        // 4. string no-match: find on ('x','y') with value.length > 10 -> undefined
        const arr4 = new SparseArray<string>('x', 'y');
        const result4 = arr4.find((value: string) => value.length > 10);
        expect(result4).assertUndefined();
        // 5. sparse empty: find on SparseArray(4) no values with value > 0 -> undefined
        const arr5 = new SparseArray<int>(4);
        const result5 = arr5.find((value: int) => value > 0);
        expect(result5).assertUndefined();
        // 6. int MAX present: find on (2147483647,-1,0) with value < 0 -> -1
        const arr6 = new SparseArray<int>(2147483647, -1, 0);
        const result6 = arr6.find((value: int) => value < 0);
        expect(result6).assertEqual(-1);
        expect(arr6[0]).assertEqual(2147483647);
        // 7. int MIN present: find on (-2147483648,0,1) with value > 0 -> 1
        const arr7 = new SparseArray<int>(-2147483648, 0, 1);
        const result7 = arr7.find((value: int) => value > 0);
        expect(result7).assertEqual(1);
        expect(arr7[0]).assertEqual(-2147483648);
        // 8. empty array: find on empty with value > 0 -> undefined, then push(100) -> 100
        const arr8 = new SparseArray<int>();
        const r8a = arr8.find((value: int) => value > 0);
        expect(r8a).assertUndefined();
        arr8.push(100);
        const result8 = arr8.find((value: int) => value > 50);
        expect(result8).assertEqual(100);

      }
      {
        // 1. find on sparse(4){0=10,3=40} with value > 0 -> 10
        const arr1 = new SparseArray<int>(4);
        arr1[0] = 10;
        arr1[3] = 40;
        const result1 = arr1.find((value: int) => value > 0);
        expect(result1).assertEqual(10);
        // 2. find on sparse(3){0=1,2=3} collects indices [0,2]
        const arr2 = new SparseArray<int>(3);
        arr2[0] = 1;
        arr2[2] = 3;
        let indices2: int[] = [];
        arr2.find((value: int, index: int) => {
          indices2.push(index);
          return false;
        });
        expect(indices2[0]).assertEqual(0);
        expect(indices2[1]).assertEqual(2);
        // 3. find on sparse(3){1=20,2=30} leading hole, callCount=2 firstIndex=1
        const arr3 = new SparseArray<int>(3);
        arr3[1] = 20;
        arr3[2] = 30;
        let callCount3: int = 0;
        let firstIndex3: int = -1;
        arr3.find((value: int, index: int) => {
          callCount3 = callCount3 + 1;
          if (firstIndex3 === -1) {
            firstIndex3 = index;
          }
          return false;
        });
        expect(callCount3).assertEqual(2);
        expect(firstIndex3).assertEqual(1);
        // 4. find on sparse(4){0=10,2=30,3=40} middle hole, indices [0,2,3]
        const arr4 = new SparseArray<int>(4);
        arr4[0] = 10;
        arr4[2] = 30;
        arr4[3] = 40;
        let indices4: int[] = [];
        arr4.find((value: int, index: int) => {
          indices4.push(index);
          return false;
        });
        expect(indices4.length).assertEqual(3);
        expect(indices4[0]).assertEqual(0);
        expect(indices4[1]).assertEqual(2);
        expect(indices4[2]).assertEqual(3);
        // 5. find on sparse(5){0=1,2=3,4=5} callCount=3
        const arr5 = new SparseArray<int>(5);
        arr5[0] = 1;
        arr5[2] = 3;
        arr5[4] = 5;
        let callCount5: int = 0;
        arr5.find((value: int) => {
          callCount5 = callCount5 + 1;
          return false;
        });
        expect(callCount5).assertEqual(3);
        // 6. find on sparse(4){0=5,3=8} with index === 3 -> 8
        const arr6 = new SparseArray<int>(4);
        arr6[0] = 5;
        arr6[3] = 8;
        const result6 = arr6.find((value: int, index: int) => index === 3);
        expect(result6).assertEqual(8);
        // 7. find on sparse(5){4=100} with value > 50 -> 100
        const arr7 = new SparseArray<int>(5);
        arr7[4] = 100;
        const result7 = arr7.find((value: int) => value > 50);
        expect(result7).assertEqual(100);
        // 8. find on sparse(5){0=10,2=30,4=50} with value > 20 -> 30, length stable
        const arr8 = new SparseArray<int>(5);
        arr8[0] = 10;
        arr8[2] = 30;
        arr8[4] = 50;
        const lenBefore8: int = arr8.length;
        const result8 = arr8.find((value: int) => value > 20);
        expect(result8).assertEqual(30);
        expect(arr8.length).assertEqual(lenBefore8);
        // 9. find on sparse(4){1=10,2=20,3=30} with value > 15 -> 20, arr[0] undefined
        const arr9 = new SparseArray<int>(4);
        arr9[1] = 10;
        arr9[2] = 20;
        arr9[3] = 30;
        const result9 = arr9.find((value: int) => value > 15);
        expect(result9).assertEqual(20);
        expect(arr9[0]).assertUndefined();
        // 10. find on sparse(3){1=99} with value > 50 -> 99, alias verified
        const arr10 = new SparseArray<int>(3);
        arr10[1] = 99;
        const alias10: SparseArray<int> = arr10;
        const result10 = arr10.find((value: int) => value > 50);
        expect(result10).assertEqual(99);
        expect(alias10[1]).assertEqual(99);
        expect(alias10.length).assertEqual(3);

      }
      {
        // 1. find on (1,2,3) captures firstValue=1
        const arr1 = new SparseArray<int>(1, 2, 3);
        let firstValue1: int = 0;
        arr1.find((value: int) => {
          firstValue1 = value;
          return true;
        });
        expect(firstValue1).assertEqual(1);
        // 2. find on (11,22,33) collects all values [11,22,33]
        const arr2 = new SparseArray<int>(11, 22, 33);
        let values2: int[] = [];
        arr2.find((value: int) => {
          values2.push(value);
          return false;
        });
        expect(values2[0]).assertEqual(11);
        expect(values2[1]).assertEqual(22);
        expect(values2[2]).assertEqual(33);
        // 3. find on sparse(100){0=100} typeof value='int', callCount=1, result=100
        const arr3 = new SparseArray<int>(100);
        arr3[0] = 100;
        let callCount3: int = 0;
        const result3 = arr3.find((value: int) => {
          callCount3++;
          let actualValue1: string = typeof value;
          let expectedValue1: string = 'int';
          expect(actualValue1).assertEqual(expectedValue1);
          return true;
        });
        expect(callCount3).assertEqual(1);
        expect(result3).assertEqual(100);
        // 4. find on sparse(4){1=20,2=30} leading hole, firstIndex=1
        const arr4 = new SparseArray<int>(4);
        arr4[1] = 20;
        arr4[2] = 30;
        let firstIndex4: int = -1;
        arr4.find((value: int, index: int) => {
          firstIndex4 = index;
          return true;
        });
        expect(firstIndex4).assertEqual(1);
        // 5. find on sparse(50){0=50} typeof index='int', callCount=1, result=50
        const arr5 = new SparseArray<int>(50);
        arr5[0] = 50;
        let callCount5: int = 0;
        const result5 = arr5.find((value: int, index: int) => {
          callCount5++;
          let actualValue1: string = typeof index;
          let expectedValue1: string = 'int';
          expect(actualValue1).assertEqual(expectedValue1);
          return true;
        });
        expect(callCount5).assertEqual(1);
        expect(result5).assertEqual(50);
        // 6. find on (100,200,300) collects all indices [0,1,2]
        const arr6 = new SparseArray<int>(100, 200, 300);
        let indices6: int[] = [];
        arr6.find((value: int, index: int) => {
          indices6.push(index);
          return false;
        });
        expect(indices6[0]).assertEqual(0);
        expect(indices6[1]).assertEqual(1);
        expect(indices6[2]).assertEqual(2);
        // 7. find on sparse(){0=99} singleIndex=0
        const arr7 = new SparseArray<int>();
        arr7[0] = 99;
        let singleIndex7: int = -1;
        arr7.find((value: int, index: int) => {
          singleIndex7 = index;
          return true;
        });
        expect(singleIndex7).assertEqual(0);
        // 8. find on (10,20,30) with 2-arg index === 1 -> 20
        const arr8 = new SparseArray<int>(10, 20, 30);
        const result8 = arr8.find((value: int, index: int) => index === 1);
        expect(result8).assertEqual(20);

      }
      {
        // 1. find on (1,2,3) 3-arg mutates array[0]=999
        const arr1 = new SparseArray<int>(1, 2, 3);
        arr1.find((value: int, index: int, array: SparseArray<int>) => {
          array[0] = 999;
          return true;
        });
        expect(arr1[0]).assertEqual(999);
        // 2. find on (3,6,9) 3-arg array[index]===value, allMatch
        const arr2 = new SparseArray<int>(3, 6, 9);
        let allMatch2: boolean = true;
        arr2.find((value: int, index: int, array: SparseArray<int>) => {
          if (array[index] !== value) {
            allMatch2 = false;
          }
          return false;
        });
        expect(allMatch2).assertTrue();
        // 3. find on (10,20,30) 3-arg value===20 && index===1 && array.length===3
        const arr3 = new SparseArray<int>(10, 20, 30);
        let allAvailable3: boolean = false;
        arr3.find((value: int, index: int, array: SparseArray<int>) => {
          if (value === 20 && index === 1 && array.length === 3) {
            allAvailable3 = true;
          }
          return false;
        });
        expect(allAvailable3).assertTrue();
        // 4. find on (1,2,3) 3-arg mutates array[0]=999 at index 0, returns index===1 -> 2
        const arr4 = new SparseArray<int>(1, 2, 3);
        const result4 = arr4.find((value: int, index: int, array: SparseArray<int>) => {
          if (index === 0) {
            array[0] = 999;
          }
          return index === 1;
        });
        expect(result4).assertEqual(2);
        // 5. find on (1,2,3,4,5) 3-arg sets array.length=2 at index 1, callCount=2
        const arr5 = new SparseArray<int>(1, 2, 3, 4, 5);
        let callCount5: int = 0;
        arr5.find((value: int, index: int, array: SparseArray<int>) => {
          callCount5 = callCount5 + 1;
          if (index === 1) {
            array.length = 2;
          }
          return false;
        });
        expect(callCount5).assertEqual(2);
        // 6. find on (1,2,3,4,5) 3-arg array.length===5 && index===0 -> lengthChecked
        const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
        let lengthChecked6: boolean = false;
        arr6.find((value: int, index: int, array: SparseArray<int>) => {
          if (array.length === 5 && index === 0) {
            lengthChecked6 = true;
          }
          return lengthChecked6;
        });
        expect(lengthChecked6).assertTrue();
        // 7. find on (1,2,3) 3-arg array reference stable, referenceChanged=false
        const arr7 = new SparseArray<int>(1, 2, 3);
        let referenceChanged7: boolean = false;
        let firstArrayRef7: SparseArray<int> | null = null;
        arr7.find((value: int, index: int, array: SparseArray<int>) => {
          if (firstArrayRef7 === null) {
            firstArrayRef7 = array;
          } else if (firstArrayRef7 !== array) {
            referenceChanged7 = true;
          }
          return false;
        });
        expect(referenceChanged7).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0500
     * @tc.name testSearchFindError001
     * @tc.desc Test SparseArray.find method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int>(5);
            arr.push(1, 2, 3, 4);
            arr.find((v) => {
              if (v === 2) throw new Error("Test error");
              return v > 2;
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          try {
            const arr = new SparseArray<int>(5);
            arr.push(1, 2, 3, 4);
            arr.find((v) => {
              throw new Error("predicate error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          try {
            const arr = new SparseArray<int>(5);
            arr.push(1, 2, 3, 4);
            arr.find((v) => {
              if (v === 2) throw new CustomFindError016("custom error");
              return v > 2;
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("CustomFindError016");
          }

      }
      {
        // 1. named function predicate isPositive on (-1,2,-3) -> 2
        const isPositive1 = (value: int): boolean => value > 0;
        const arr1 = new SparseArray<int>(-1, 2, -3);
        const result1 = arr1.find(isPositive1);
        expect(result1).assertEqual(2);
        // 2. always-true predicate on (10,20,30) -> 10
        const arr2 = new SparseArray<int>(10, 20, 30);
        const result2 = arr2.find((value: int) => true);
        expect(result2).assertEqual(10);
        // 3. predicate throws Error('second element')
        const arr3 = new SparseArray<int>(1, 2, 3);
        try {
          arr3.find((value: int) => {
            if (value === 2) {
              throw new Error('second element');
            }
            return value === 999;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        // 4. predicate throws RangeError('test range')
        const arr4 = new SparseArray<int>(1, 2, 3);
        try {
          arr4.find((value: int) => {
            throw new RangeError('test range');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        // 5. find on (1,2) with value > 1 -> 2, then push(3)
        const arr5 = new SparseArray<int>(1, 2);
        const result5 = arr5.find((value: int) => value > 1);
        expect(result5).assertEqual(2);
        arr5.push(3);
        expect(arr5.length).assertEqual(3);
        expect(arr5[2]).assertEqual(3);
        // 6. find on (1,2,3) with value > 0 -> 1, $_iterator sum=6
        const arr6 = new SparseArray<int>(1, 2, 3);
        const result6 = arr6.find((value: int) => value > 0);
        expect(result6).assertEqual(1);
        let sum6: int = 0;
        const iter6 = arr6.$_iterator();
        let r6 = iter6.next();
        while (!r6.done) {
          sum6 = sum6 + (r6.value as int);
          r6 = iter6.next();
        }
        expect(sum6).assertEqual(6);
        // 7. find on (1,2,3) with value > 0 -> 1, then arr[1]=99
        const arr7 = new SparseArray<int>(1, 2, 3);
        const result7 = arr7.find((value: int) => value > 0);
        expect(result7).assertEqual(1);
        arr7[1] = 99;
        expect(arr7[1]).assertEqual(99);
        // 8. find on (10,20,30,40) with value > 25 -> 30, then length=2
        const arr8 = new SparseArray<int>(10, 20, 30, 40);
        const result8 = arr8.find((value: int) => value > 25);
        expect(result8).assertEqual(30);
        arr8.length = 2;
        expect(arr8.length).assertEqual(2);
        expect(arr8[0]).assertEqual(10);
        expect(arr8[1]).assertEqual(20);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0600
     * @tc.name testSearchFindIndexNormal001
     * @tc.desc Test SparseArray.findIndex method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindIndexNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(6);
          arr[0] = 1;
          const index = arr.findIndex((v) => v === 1);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(4, 5, 3);
          const index = arr.findIndex((v) => v === 5);
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(6);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const index = arr.findIndex((v) => v > 100);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>();
          const index = arr.findIndex((v) => v > 0);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>(6);
          arr[0] = 10;
          arr[2] = 30;
          const index = arr.findIndex((v): boolean => true);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(6);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const index = arr.findIndex((v, i) => i > 2);
          expect(index).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(6);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const index = arr.findIndex((v, i, a) => a.length === 6);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<string>(4);
          arr[0] = "apple";
          arr[1] = "banana";
          arr[2] = "cherry";
          const index = arr.findIndex((v) => v.startsWith("b"));
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(4);
          arr[0] = -10;
          arr[1] = 20;
          arr[2] = -30;
          const index = arr.findIndex((v) => v < 0);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(4);
          arr[0] = 10;
          arr[1] = 0;
          arr[2] = 30;
          const index = arr.findIndex((v) => v === 0);
          expect(index).assertEqual(1);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0700
     * @tc.name testSearchFindIndexNormal002
     * @tc.desc Test SparseArray.findIndex method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindIndexNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(4);
          arr[0] = 50;
          arr[1] = 20;
          arr[2] = 30;
          const index = arr.findIndex((v) => v > 40);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(4);
          arr[0] = 10;
          arr[1] = 20;
          arr[2] = 50;
          const index = arr.findIndex((v) => v > 40);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(6);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          let callCount = 0;
          const index = arr.findIndex((v, i) => {
            callCount++;
            return v > 20;
          });
          expect(index).assertEqual(2);
          expect(callCount).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(2, 4, 4);
          const index = arr.findIndex((v, i) => i === 2);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[9] = 100;
          arr[5] = 50;
          const index = arr.findIndex((v) => v === 100);
          expect(index).assertEqual(9);


      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
          const threshold: long = 1000000000 as long;
          const index = arr.findIndex((v: long): boolean => v > threshold);
          expect(index).assertEqual(1);

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3);
          const index = arr.findIndex((v: int | null): boolean => v === null);
          expect(index).assertEqual(1);

      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined, 3);
          const index = arr.findIndex((v: int | undefined): boolean => v === undefined);
          expect(index).assertEqual(1);

      }
      {
          const xss = "<script>alert(1)</script>";
          const arr = new SparseArray<string>("safe", xss, "tail");
          const index = arr.findIndex((v: string): boolean => v === xss);
          expect(index).assertEqual(1);

      }
      {
          const arr = new SparseArray<int>(1, 0b1010, 3);
          const index = arr.findIndex((v: int): boolean => v === 0b1010);
          expect(index).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0800
     * @tc.name testSearchFindIndexNormal003
     * @tc.desc Test SparseArray.findIndex method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindIndexNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<boolean>(5);
          arr[1] = false;
          arr[3] = true;
          const index = arr.findIndex((v: boolean): boolean => v === false);
          expect(index).assertEqual(1);

      }
      {
          const arr = new SparseArray<char>(4);
          arr[0] = c'A';
          arr[2] = c'C';
          const index = arr.findIndex((v: char): boolean => v > c'B');
          expect(index).assertEqual(2);

      }
      {
          const arr = new SparseArray<string>();
          arr[0] = "head";
          arr[16] = "tail";
          const index = arr.findIndex((v: string, i: int, a: SparseArray<string>): boolean => {
            return a.length === 17 && i === 16 && v === "tail";
          });
          expect(index).assertEqual(16);

      }
      {
          const arr = new SparseArray<int>(8);
          arr[1] = 10;
          arr[6] = 60;
          let callCount = 0;
          const index = arr.findIndex((v: int): boolean => {
            callCount++;
            return v > 100;
          });
          expect(index).assertEqual(-1);
          expect(callCount).assertEqual(2);

      }
      {
        // 1. findIndex index===2 on (10,20,30) -> 2
        const arr1 = new SparseArray<int>(10, 20, 30);
        const r1 = arr1.findIndex((value: int, index: int): boolean => index === 2);
        expect(r1).assertEqual(2);
        // 2. findIndex predicate true on (5,6,7) -> 0
        const arr2 = new SparseArray<int>(5, 6, 7);
        const r2 = arr2.findIndex((value: int): boolean => true);
        expect(r2).assertEqual(0);
        // 3. findIndex value===42 on (1,2,42,3,4) -> 2
        const arr3 = new SparseArray<int>(1, 2, 42, 3, 4);
        const r3 = arr3.findIndex((value: int): boolean => value === 42);
        expect(r3).assertEqual(2);
        // 4. findIndex value>0 on (5,-1,-2) -> 0
        const arr4 = new SparseArray<int>(5, -1, -2);
        const r4 = arr4.findIndex((value: int): boolean => value > 0);
        expect(r4).assertEqual(0);
        // 5. findIndex value.name==='x' first-match on (objA,objC,objB) -> 0
        const objA: ItemData = { id: 1, name: 'x' } as ItemData;
        const objC: ItemData = { id: 2, name: 'y' } as ItemData;
        const objB: ItemData = { id: 1, name: 'x' } as ItemData;
        const arr5 = new SparseArray<ItemData>(objA, objC, objB);
        const r5 = arr5.findIndex((value: ItemData): boolean => value.name === 'x');
        expect(r5).assertEqual(0);
        // 6. findIndex value>15 && index===1 on (10,20,30) -> 1
        const arr6 = new SparseArray<int>(10, 20, 30);
        const r6 = arr6.findIndex((value: int, index: int): boolean => {
          return value > 15 && index === 1;
        });
        expect(r6).assertEqual(1);
        // 7. findIndex typeof index==='int' on (100,200) -> 0
        const arr7 = new SparseArray<int>(100, 200);
        const r7 = arr7.findIndex((value: int, index: int): boolean => {
          return typeof index === 'int';
        });
        expect(r7).assertEqual(0);
        // 8. findIndex value===100 on sparse {2,4} len=5 -> 2
        const arr8 = new SparseArray<int>(5);
        arr8[2] = 100;
        arr8[4] = 200;
        const r8 = arr8.findIndex((value: int): boolean => value === 100);
        expect(r8).assertEqual(2);
        // 9. findIndex value===42 after arr[0]=42 -> 0
        const arr9 = new SparseArray<int>();
        arr9[0] = 42;
        const r9 = arr9.findIndex((value: int): boolean => value === 42);
        expect(r9).assertEqual(0);
        // 10. findIndex value>3 on (1,5,3,8,2) -> 1
        const arr10 = new SparseArray<int>(1, 5, 3, 8, 2);
        const r10 = arr10.findIndex((value: int): boolean => value > 3);
        expect(r10).assertEqual(1);

      }
      {
        // 1. findIndex string==='banana' on (apple,banana,cherry) -> 1
        const arr1 = new SparseArray<string>('apple', 'banana', 'cherry');
        const r1 = arr1.findIndex((value: string): boolean => value === 'banana');
        expect(r1).assertEqual(1);
        // 2. findIndex string==='' on (a,'',b) -> 1
        const arr2 = new SparseArray<string>('a', '', 'b');
        const r2 = arr2.findIndex((value: string): boolean => value === '');
        expect(r2).assertEqual(1);
        // 3. findIndex string Unicode '中文测试' on (hello,中文测试,world) -> 1
        const arr3 = new SparseArray<string>('hello', '中文测试', 'world');
        const r3 = arr3.findIndex((value: string): boolean => value === '中文测试');
        expect(r3).assertEqual(1);
        // 4. findIndex string case-sensitive 'hello' on (Hello,hello) -> 1
        const arr4 = new SparseArray<string>('Hello', 'hello');
        const r4 = arr4.findIndex((value: string): boolean => value === 'hello');
        expect(r4).assertEqual(1);
        // 5. findIndex string===' ' on (a,' ',b) -> 1
        const arr5 = new SparseArray<string>('a', ' ', 'b');
        const r5 = arr5.findIndex((value: string): boolean => value === ' ');
        expect(r5).assertEqual(1);
        // 6. findIndex string length===10 on (x,abcdefghij,y) -> 1
        const arr6 = new SparseArray<string>('x', 'abcdefghij', 'y');
        const r6 = arr6.findIndex((value: string): boolean => value.length === 10);
        expect(r6).assertEqual(1);
        // 7. findIndex boolean===true on (false,true,false) -> 1
        const arr7 = new SparseArray<boolean>(false, true, false);
        const r7 = arr7.findIndex((value: boolean): boolean => value === true);
        expect(r7).assertEqual(1);
        // 8. findIndex boolean===false on (true,false,true) -> 1
        const arr8 = new SparseArray<boolean>(true, false, true);
        const r8 = arr8.findIndex((value: boolean): boolean => value === false);
        expect(r8).assertEqual(1);
        // 9. findIndex boolean===true all-true on (true,true,true) -> 0
        const arr9 = new SparseArray<boolean>(true, true, true);
        const r9 = arr9.findIndex((value: boolean): boolean => value === true);
        expect(r9).assertEqual(0);
        // 10. findIndex boolean===true all-false on (false,false,false) -> -1
        const arr10 = new SparseArray<boolean>(false, false, false);
        const r10 = arr10.findIndex((value: boolean): boolean => value === true);
        expect(r10).assertEqual(-1);

      }
      {
        // 1. findIndex double===0.0 on (1.5,0.0,3.5) -> 1
        const arr1 = new SparseArray<double>(1.5, 0.0, 3.5);
        const r1 = arr1.findIndex((value: double): boolean => value === 0.0);
        expect(r1).assertEqual(1);
        // 2. findIndex double isNaN on (1.0,NaN,3.0) -> 1
        const arr2 = new SparseArray<double>(1.0, Double.NaN, 3.0);
        const r2 = arr2.findIndex((value: double): boolean => isNaN(value));
        expect(r2).assertEqual(1);
        // 3. findIndex double===Infinity on (1.0,Infinity,2.0) -> 1
        const arr3 = new SparseArray<double>(1.0, Double.POSITIVE_INFINITY, 2.0);
        const r3 = arr3.findIndex((value: double): boolean => value === Double.POSITIVE_INFINITY);
        expect(r3).assertEqual(1);
        // 4. findIndex double isFinite on (Infinity,3.14,2.72) -> 1
        const arr4 = new SparseArray<double>(Double.POSITIVE_INFINITY, 3.14, 2.72);
        const r4 = arr4.findIndex((value: double): boolean => isFinite(value));
        expect(r4).assertEqual(1);
        // 5. findIndex bigint===0n on (1n,0n,2n) -> 1
        const arr5 = new SparseArray<bigint>(1n, 0n, 2n);
        const r5 = arr5.findIndex((value: bigint): boolean => value === 0n);
        expect(r5).assertEqual(1);
        // 6. findIndex bigint===MAX on (1n,MAX,2n) -> 1
        const MAX_BIGINT: bigint = 9223372036854775807n;
        const arr6 = new SparseArray<bigint>(1n, MAX_BIGINT, 2n);
        const r6 = arr6.findIndex((value: bigint): boolean => value === MAX_BIGINT);
        expect(r6).assertEqual(1);
        // 7. findIndex object id===2 on (o1,o2,o3) -> 1
        const o1: ItemData = { id: 1, name: 'a' } as ItemData;
        const o2: ItemData = { id: 2, name: 'b' } as ItemData;
        const o3: ItemData = { id: 3, name: 'c' } as ItemData;
        const arr7 = new SparseArray<ItemData>(o1, o2, o3);
        const r7 = arr7.findIndex((value: ItemData): boolean => value.id === 2);
        expect(r7).assertEqual(1);
        // 8. findIndex object|null ===null on (oNull,null) -> 1
        const oNull: ItemData = { id: 1, name: 'a' } as ItemData;
        const arr8 = new SparseArray<ItemData | null>(oNull, null);
        const r8 = arr8.findIndex((value: ItemData | null): boolean => value === null);
        expect(r8).assertEqual(1);
        // 9. findIndex object id===99 no-match on (oNo1,oNo2) -> -1
        const oNo1: ItemData = { id: 1, name: 'a' } as ItemData;
        const oNo2: ItemData = { id: 2, name: 'b' } as ItemData;
        const arr9 = new SparseArray<ItemData>(oNo1, oNo2);
        const r9 = arr9.findIndex((value: ItemData): boolean => value.id === 99);
        expect(r9).assertEqual(-1);
        const dateA: Date = new Date(5000);
        const dateB: Date = new Date(5000);
        const arr10 = new SparseArray<Date>(dateA, dateB);
        const r10 = arr10.findIndex((value: Date): boolean => value.getTime() === 5000);
        expect(r10).assertEqual(0);

      }
      {
        // 1. findIndex array.length===3 on (10,20,30) -> 0
        const arr1 = new SparseArray<int>(10, 20, 30);
        const r1 = arr1.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
          return array.length === 3;
        });
        expect(r1).assertEqual(0);
        // 2. findIndex index===3 on sparse {0,3} len=5 -> 3
        const arr2 = new SparseArray<int>(5);
        arr2[0] = 10;
        arr2[3] = 40;
        const r2 = arr2.findIndex((value: int, index: int): boolean => index === 3);
        expect(r2).assertEqual(3);
        // 3. findIndex predicate true on sparse {1,3} len=4 -> 1
        const arr3 = new SparseArray<int>(4);
        arr3[1] = 10;
        arr3[3] = 30;
        const r3 = arr3.findIndex((value: int): boolean => true);
        expect(r3).assertEqual(1);
        // 4. findIndex index===4 on sparse {0,1,4} len=5 -> 4
        const arr4 = new SparseArray<int>(5);
        arr4[0] = 1;
        arr4[1] = 2;
        arr4[4] = 5;
        const r4 = arr4.findIndex((value: int, index: int): boolean => index === 4);
        expect(r4).assertEqual(4);
        // 5. findIndex array===arr on (1,2,3) -> 0
        const arr5 = new SparseArray<int>(1, 2, 3);
        const r5 = arr5.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
          return array === arr5;
        });
        expect(r5).assertEqual(0);
        // 6. findIndex array.length===4 on (1,2,3,4) -> 0
        const arr6 = new SparseArray<int>(1, 2, 3, 4);
        const r6 = arr6.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
          return array.length === 4;
        });
        expect(r6).assertEqual(0);
        // 7. findIndex array[2]===3 on (1,2,3) -> 0
        const arr7 = new SparseArray<int>(1, 2, 3);
        const r7 = arr7.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
          return array[2] === 3;
        });
        expect(r7).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_0900
     * @tc.name testSearchFindIndexError001
     * @tc.desc Test SparseArray.findIndex method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindIndexError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int>(6);
            arr[0] = 10;
            arr.findIndex((v) => {
              if (v > 5) {
                throw new Error("Test error");
              }
              return false;
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.findIndex(null as SparseArrayIntFindIndexPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.findIndex(undefined as SparseArrayIntFindIndexPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
        // 1. findIndex index>99 on (10,20,30) -> -1
        const arr1 = new SparseArray<int>(10, 20, 30);
        const r1 = arr1.findIndex((value: int, index: int): boolean => index > 99);
        expect(r1).assertEqual(-1);
        // 2. findIndex array.length>999 on (10,20,30) -> -1
        const arr2 = new SparseArray<int>(10, 20, 30);
        const r2 = arr2.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
          return array.length > 999;
        });
        expect(r2).assertEqual(-1);
        // 3. findIndex predicate false on (1,2,3) -> -1
        const arr3 = new SparseArray<int>(1, 2, 3);
        const r3 = arr3.findIndex((value: int): boolean => false);
        expect(r3).assertEqual(-1);
        // 4. findIndex predicate true on empty len=5 -> -1
        const arr4 = new SparseArray<int>(5);
        const r4 = arr4.findIndex((value: int): boolean => true);
        expect(r4).assertEqual(-1);
        // 5. findIndex throw at first -> callCount 1
        let callCount1: int = 0;
        const arr5 = new SparseArray<int>(1, 2, 3);
        try {
          arr5.findIndex((value: int): boolean => {
            callCount1 = callCount1 + 1;
            throw new Error('fail at first');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(callCount1).assertEqual(1);
        }
        // 6. findIndex throw at middle -> callCount 3
        let callCount2: int = 0;
        const arr6 = new SparseArray<int>(10, 20, 30, 40);
        try {
          arr6.findIndex((value: int): boolean => {
            callCount2 = callCount2 + 1;
            if (value === 30) {
              throw new Error('fail at middle');
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(callCount2).assertEqual(3);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1000
     * @tc.name testSearchFindLastNormal001
     * @tc.desc Test SparseArray.findLast method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const found = arr.findLast((v) => v > 1);
          expect(found).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const found = arr.findLast((v) => v > 20);
          expect(found).assertEqual(50);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const found = arr.findLast((v) => v > 100);
          expect(found).assertUndefined();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const found = arr.findLast((v, i) => v % 2 === 0 && i > 2);
          expect(found).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[1] = 10;
          arr[3] = 20;
          arr[5] = 30;
          const found = arr.findLast((v, i) => i === 3);
          expect(found).assertEqual(20);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const found = arr.findLast((v, i, a) => a.length > 4);
          expect(found).assertEqual(5);


      }
      {
          const arr = new SparseArray<string>("apple", "banana", "cherry");
          const found = arr.findLast((v) => v.startsWith("c"));
          expect(found).assertEqual("cherry");

          const arr2 = new SparseArray<string>("a", "b", "c");
          const found2 = arr2.findLast((v) => v > "b");
          expect(found2).assertEqual("c");


      }
      {
          const arr = new SparseArray<number>(1.5, 2.5, 3.5);
          const found = arr.findLast((v) => v > 2.0);
          expect(found).assertEqual(3.5);


      }
      {
        const arr = new SparseArray<Person009>();
          let p1 = new Person009();
          p1.name = "Alice";
          p1.age = 20;
          let p2 = new Person009();
          p2.name = "Bob";
          p2.age = 30;
          arr.push(p1, p2);
          const found = arr.findLast((v) => v.age > 25);
          expect(found).assertEqual(p2);


      }
      {
          const arr = new SparseArray<int>();
          const found = arr.findLast((v) => v > 0);
          expect(found).assertUndefined();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1100
     * @tc.name testSearchFindLastNormal002
     * @tc.desc Test SparseArray.findLast method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          arr[0] = 42;
          const found = arr.findLast((v) => v > 0);
          expect(found).assertEqual(42);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const found = arr.findLast((v) => v < 2);
          expect(found).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(5);
          const found = arr.findLast((v) => v > 0);
          expect(found).assertUndefined();


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 10;
          arr[2] = 20;
          arr[4] = 30;
          arr[6] = 40;
          const found = arr.findLast((v) => v > 25);
          expect(found).assertEqual(40);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const found = arr.findLast((v) => v > 2);
          expect(found).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 2, 1);
          const found = arr.findLast((v) => v === 2);
          expect(found).assertEqual(2);


      }
      {
          const arr = new SparseArray<int | null | undefined>(1, null, 2);
          const found = arr.findLast((v) => v === null);
          expect(found).assertNull();


      }
      {
          const arr = new SparseArray<int | undefined>();
          arr[0] = 1;
          arr[1] = undefined;
          arr[2] = 2;
          const found = arr.findLast((v) => v === undefined);
          expect(found).assertUndefined();


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 2147483647;
          const found = arr.findLast((v) => v > 0);
          expect(found).assertEqual(2147483647);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = -2147483648;
          const found = arr.findLast((v) => v < 0);
          expect(found).assertEqual(-2147483648);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1200
     * @tc.name testSearchFindLastNormal003
     * @tc.desc Test SparseArray.findLast method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 10000; i++) {
            arr.push(i);
          }
          const startTime = Date.now();
          const found = arr.findLast((v) => v === 9999);
          const endTime = Date.now();
          expect(found).assertEqual(9999);
          expect(endTime - startTime).assertLess(1000);


      }
      {
          const arr = new SparseArray<int>(10000);
          arr[0] = 1;
          arr[9999] = 2;
          const found = arr.findLast((v) => v === 2);
          expect(found).assertEqual(2);


      }
      {
          const arr = new SparseArray<short>(100 as short, 200 as short, 300 as short);
          const found = arr.findLast((v: short): boolean => v >= 300 as short);
          expect(found).assertEqual(300 as short);

      }
      {
          const arr = new SparseArray<int>(1, 0xFF, 0xFF, 2);
          const found = arr.findLast((v: int): boolean => v === 0xFF);
          expect(found).assertEqual(0xFF);

      }
      {
          const arr = new SparseArray<char>(8);
          arr[0] = c'A';
          arr[7] = c'Z';
          const found = arr.findLast((v: char): boolean => v > c'M');
          expect(found).assertEqual(c'Z');

      }
      {
          const arr = new SparseArray<boolean>(5);
          arr[1] = true;
          arr[3] = false;
          const found = arr.findLast((v: boolean, i: int): boolean => i === 3 && !v);
          expect(found).assertFalse();

      }
      {
          const arr = new SparseArray<byte>(10 as byte, 20 as byte, 30 as byte);
          const threshold: byte = 15 as byte;
          const found = arr.findLast((v: byte): boolean => v > threshold);
          expect(found).assertEqual(30 as byte);

      }
      {
          const arr = new SparseArray<int>(10);
          arr[2] = 20;
          arr[7] = 70;
          let callCount = 0;
          const found = arr.findLast((v: int): boolean => {
            callCount++;
            return v > 100;
          });
          expect(found).assertUndefined();
          expect(callCount).assertEqual(2);

      }
      {
        // 1. findLast elem>15 on (10,20,30) -> 30
        const arr1 = new SparseArray<int>(10, 20, 30);
        expect(arr1.findLast((elem: int): boolean => elem > 15)).assertEqual(30);
        // 2. findLast index===0 on (10,20,30) -> 10
        const arr2 = new SparseArray<int>(10, 20, 30);
        expect(arr2.findLast((elem: int, index: int): boolean => index === 0)).assertEqual(10);
        // 3. findLast index===1 on (10,20,30,40) -> 20
        const arr3 = new SparseArray<int>(10, 20, 30, 40);
        expect(arr3.findLast((elem: int, index: int): boolean => index === 1)).assertEqual(20);
        // 4. findLast string length>5 on ('apple','banana','cherry') -> 'cherry'
        const arr4 = new SparseArray<string>('apple', 'banana', 'cherry');
        expect(arr4.findLast((elem: string): boolean => elem.length > 5)).assertEqual('cherry');
        // 5. findLast typeof string on ('test') -> 'test'
        const arr5 = new SparseArray<string>('test');
        expect(arr5.findLast((elem: string): boolean => typeof elem === 'string')).assertEqual('test');
        // 6. findLast typeof boolean on (true) -> true
        const arr6 = new SparseArray<boolean>(true);
        expect(arr6.findLast((elem: boolean): boolean => typeof elem === 'boolean')).assertTrue();
        // 7. findLast typeof double on (3.14) -> 3.14
        const arr7 = new SparseArray<double>(3.14);
        expect(arr7.findLast((elem: double): boolean => typeof elem === 'number')).assertEqual(3.14);
        const date8: Date = new Date(5000);
        const arr8 = new SparseArray<Date>(date8);
        expect(arr8.findLast((elem: Date): boolean => typeof elem === 'object')).assertEqual(date8);
        // 9. right-to-left traversal through holes visits indices 4,2,0
        const arr9 = new SparseArray<int>(5);
        arr9[0] = 10;
        arr9[2] = 30;
        arr9[4] = 50;
        let visited9: int[] = [];
        arr9.findLast((elem: int, index: int): boolean => {
          visited9.push(index);
          return false;
        });
        expect(visited9[0]).assertEqual(4);
        expect(visited9[1]).assertEqual(2);
        expect(visited9[2]).assertEqual(0);
        // 10. all-hole length=3 array -> predicate not called
        const arr10 = new SparseArray<int>(3);
        let called10: boolean = false;
        arr10.findLast((elem: int, index: int): boolean => {
          called10 = true;
          return false;
        });
        expect(called10).assertFalse();

      }
      {
        // 1. predicate receives elem int=0 on (7,0,3)
        const arr1 = new SparseArray<int>(7, 0, 3);
        let receivedZero1: boolean = false;
        arr1.findLast((elem: int): boolean => {
          if (elem === 0) {
            receivedZero1 = true;
          }
          return false;
        });
        expect(receivedZero1).assertTrue();
        // 2. predicate receives elem int=-2147483648 on (-2147483648,5,10)
        const arr2 = new SparseArray<int>(-2147483648, 5, 10);
        let lastElem2: int = 0;
        arr2.findLast((elem: int): boolean => {
          lastElem2 = elem;
          return false;
        });
        expect(lastElem2).assertEqual(-2147483648);
        // 3. predicate receives empty string '' on ('hello','','world')
        const arr3 = new SparseArray<string>('hello', '', 'world');
        let receivedEmpty3: boolean = false;
        arr3.findLast((elem: string): boolean => {
          if (elem.length === 0) {
            receivedEmpty3 = true;
          }
          return false;
        });
        expect(receivedEmpty3).assertTrue();
        // 4. predicate receives Unicode string on ('start','中文测试','end')
        const arr4 = new SparseArray<string>('start', '中文测试', 'end');
        let receivedUnicode4: boolean = false;
        arr4.findLast((elem: string): boolean => {
          if (elem === '中文测试') {
            receivedUnicode4 = true;
          }
          return false;
        });
        expect(receivedUnicode4).assertTrue();
        // 5. predicate receives '\0' on ('a','\0','b')
        const arr5 = new SparseArray<string>('a', '\0', 'b');
        let receivedNullChar5: boolean = false;
        arr5.findLast((elem: string): boolean => {
          if (elem === '\0') {
            receivedNullChar5 = true;
          }
          return false;
        });
        expect(receivedNullChar5).assertTrue();
        // 6. predicate receives 1000-char string on ('x',longStr,'y')
        let longStr6: string = '';
        for (let i6: int = 0; i6 < 1000; i6++) {
          longStr6 = longStr6 + 'a';
        }
        const arr6 = new SparseArray<string>('x', longStr6, 'y');
        let receivedLong6: boolean = false;
        arr6.findLast((elem: string): boolean => {
          if (elem.length === 1000) {
            receivedLong6 = true;
          }
          return false;
        });
        expect(receivedLong6).assertTrue();
        // 7. predicate receives boolean true on (false,true,false)
        const arr7 = new SparseArray<boolean>(false, true, false);
        let receivedTrue7: boolean = false;
        arr7.findLast((elem: boolean): boolean => {
          if (elem === true) {
            receivedTrue7 = true;
          }
          return false;
        });
        expect(receivedTrue7).assertTrue();
        // 8. predicate receives boolean false on (true,false,true)
        const arr8 = new SparseArray<boolean>(true, false, true);
        let receivedFalse8: boolean = false;
        arr8.findLast((elem: boolean): boolean => {
          if (elem === false) {
            receivedFalse8 = true;
          }
          return false;
        });
        expect(receivedFalse8).assertTrue();
        // 9. predicate receives double NaN on (1.0,NaN,2.0)
        const arr9 = new SparseArray<double>(1.0, Double.NaN, 2.0);
        let receivedNan9: boolean = false;
        arr9.findLast((elem: double): boolean => {
          if (isNaN(elem)) {
            receivedNan9 = true;
          }
          return false;
        });
        expect(receivedNan9).assertTrue();
        // 10. predicate receives double Infinity on (0.5,POSITIVE_INFINITY,1.5)
        const arr10 = new SparseArray<double>(0.5, Double.POSITIVE_INFINITY, 1.5);
        let receivedInf10: boolean = false;
        arr10.findLast((elem: double): boolean => {
          if (elem === Double.POSITIVE_INFINITY) {
            receivedInf10 = true;
          }
          return false;
        });
        expect(receivedInf10).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1300
     * @tc.name testSearchFindLastNormal004
     * @tc.desc Test SparseArray.findLast method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. predicate receives RegExp source='abc' on (r1,r2)
        const reg1: RegExp = new RegExp('abc', 'g');
        const reg2: RegExp = new RegExp('def');
        const arr1 = new SparseArray<RegExp>(reg1, reg2);
        let receivedPattern1: boolean = false;
        arr1.findLast((elem: RegExp): boolean => {
          if (elem.source === 'abc') {
            receivedPattern1 = true;
          }
          return false;
        });
        expect(receivedPattern1).assertTrue();
        // 2. predicate receives nested int[] length===0 on (arrOne,arrEmpty,arrTwo)
        const subEmpty: int[] = [];
        const subOne: int[] = [1];
        const subTwo: int[] = [2, 3];
        const arr2 = new SparseArray<int[]>(subOne, subEmpty, subTwo);
        let receivedEmpty2: boolean = false;
        arr2.findLast((elem: int[]): boolean => {
          if (elem.length === 0) {
            receivedEmpty2 = true;
          }
          return false;
        });
        expect(receivedEmpty2).assertTrue();
        // 3. predicate receives interface Point x=5,y=10 on (p1,p2,p3)
        const pt1: SparseArrayFindLastPart01Point = { x: 1 as int, y: 2 as int };
        const pt2: SparseArrayFindLastPart01Point = { x: 5 as int, y: 10 as int };
        const pt3: SparseArrayFindLastPart01Point = { x: 3 as int, y: 6 as int };
        const arr3 = new SparseArray<SparseArrayFindLastPart01Point>(pt1, pt2, pt3);
        let foundPt3: boolean = false;
        arr3.findLast((elem: SparseArrayFindLastPart01Point): boolean => {
          if (elem.x === (5 as int) && elem.y === (10 as int)) {
            foundPt3 = true;
          }
          return false;
        });
        expect(foundPt3).assertTrue();
        // 4. predicate receives interface with null val on (it1,it2)
        const ni1: SparseArrayFindLastPart01NullableItem = { key: 1 as int, val: 'a' };
        const ni2: SparseArrayFindLastPart01NullableItem = { key: 2 as int, val: null };
        const arr4 = new SparseArray<SparseArrayFindLastPart01NullableItem>(ni1, ni2);
        let receivedNull4: boolean = false;
        arr4.findLast((elem: SparseArrayFindLastPart01NullableItem): boolean => {
          if (elem.val === null) {
            receivedNull4 = true;
          }
          return false;
        });
        expect(receivedNull4).assertTrue();
        // 5. predicate receives nested interface count=20 on (out1,out2)
        const inner1: SparseArrayFindLastPart01Inner = { count: 10 as int };
        const outer1: SparseArrayFindLastPart01Outer = { label: 'A', detail: inner1 };
        const inner2: SparseArrayFindLastPart01Inner = { count: 20 as int };
        const outer2: SparseArrayFindLastPart01Outer = { label: 'B', detail: inner2 };
        const arr5 = new SparseArray<SparseArrayFindLastPart01Outer>(outer1, outer2);
        let receivedNested5: boolean = false;
        arr5.findLast((elem: SparseArrayFindLastPart01Outer): boolean => {
          if (elem.detail.count === (20 as int)) {
            receivedNested5 = true;
          }
          return false;
        });
        expect(receivedNested5).assertTrue();
        // 6. predicate receives Error message='beta' on (e1,e2)
        const err1: Error = new Error('alpha');
        const err2: Error = new Error('beta');
        const arr6 = new SparseArray<Error>(err1, err2);
        let receivedBeta6: boolean = false;
        arr6.findLast((elem: Error): boolean => {
          if (elem.message === 'beta') {
            receivedBeta6 = true;
          }
          return false;
        });
        expect(receivedBeta6).assertTrue();
        // 7. predicate receives class name='second' on (it1,it2)
        const item1: SparseArrayFindLastPart01Item = new SparseArrayFindLastPart01Item();
        item1.id = 1;
        item1.name = 'first';
        const item2: SparseArrayFindLastPart01Item = new SparseArrayFindLastPart01Item();
        item2.id = 2;
        item2.name = 'second';
        const arr7 = new SparseArray<SparseArrayFindLastPart01Item>(item1, item2);
        let receivedClass7: boolean = false;
        arr7.findLast((elem: SparseArrayFindLastPart01Item): boolean => {
          if (elem.name === 'second') {
            receivedClass7 = true;
          }
          return false;
        });
        expect(receivedClass7).assertTrue();
        // 8. predicate receives typeof int 'int' on arr[0]=42
        const arr8 = new SparseArray<int>();
        arr8[0] = 42;
        let typeMatches8: boolean = false;
        arr8.findLast((elem: int): boolean => {
          if (typeof elem === 'int') {
            typeMatches8 = true;
          }
          return false;
        });
        expect(typeMatches8).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1400
     * @tc.name testSearchFindLastError001
     * @tc.desc Test SparseArray.findLast method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            arr.findLast(() => {
              throw new Error("predicate error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            arr.findLast((v) => {
              if (v === 2) {
                throw new Error("found 2");
              }
              return false;
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.findLast(null as SparseArrayIntFindLastPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.findLast(undefined as SparseArrayIntFindLastPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
        // 1. callback receives (elem, index, array.length) on (5,15,25)
        const arr1 = new SparseArray<int>(5, 15, 25);
        let allThree1: boolean = false;
        arr1.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
          if (elem === 15 && index === 1 && array.length === 3) {
            allThree1 = true;
          }
          return false;
        });
        expect(allThree1).assertTrue();
        // 2. callback index typeof 'int' on (100) arr[0]=1
        const arr2 = new SparseArray<int>(100);
        arr2[0] = 1;
        let typeMatches2: boolean = false;
        arr2.findLast((elem: int, index: int): boolean => {
          if (typeof index === 'int') {
            typeMatches2 = true;
          }
          return false;
        });
        expect(typeMatches2).assertTrue();
        // 3. callback array === arr on (7,14,21)
        const arr3 = new SparseArray<int>(7, 14, 21);
        let sameRef3: boolean = false;
        arr3.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
          sameRef3 = array === arr3;
          return true;
        });
        expect(sameRef3).assertTrue();
        // 4. callback array[index] === elem matchCount=3 on (5,10,15)
        const arr4 = new SparseArray<int>(5, 10, 15);
        let matchCount4: int = 0;
        arr4.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
          if (array[index] === elem) {
            matchCount4 = matchCount4 + 1;
          }
          return false;
        });
        expect(matchCount4).assertEqual(3);
        // 5. callback array[0] hole undefined on (4) arr[1]=20,arr[2]=30
        const arr5 = new SparseArray<int>(4);
        arr5[1] = 20;
        arr5[2] = 30;
        let holeUndef5: boolean = false;
        arr5.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
          if (index === 2) {
            let holeVal5 = array[0];
            holeUndef5 = holeVal5 === undefined;
          }
          return false;
        });
        expect(holeUndef5).assertTrue();
        // 6. callback mutates array[0]=999 during iteration on (1,2,3)
        const arr6 = new SparseArray<int>(1, 2, 3);
        arr6.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
          array[0] = 999;
          return true;
        });
        expect(arr6[0]).assertEqual(999);
        // 7. findLast propagates FormatError thrown by callback
        const dNormal7: Date = new Date(5000);
        const dAnother7: Date = new Date(10000);
        const arr7 = new SparseArray<Date>(dNormal7, dAnother7);
        try {
          arr7.findLast((elem: Date): boolean => {
            throw new FormatError('invalid date');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('FormatError');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1500
     * @tc.name testSearchFindLastIndexNormal001
     * @tc.desc Test SparseArray.findLastIndex method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastIndexNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const index = arr.findLastIndex((_v: int, _i: int, _a: SparseArray<int>) => false);
          expect(index).assertEqual(-1);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const index = arr.findLastIndex((v) => v > 1);
          expect(index).assertEqual(2);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const index = arr.findLastIndex((elem, index, array) => {
            return elem > 15 && index > 0;
          });
          expect(index).assertEqual(2);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const index = arr.findLastIndex((v) => v === 2);
          expect(index).assertEqual(1);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const index = arr.findLastIndex((v) => v === 3);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(5, 3, 5);
          const index = arr.findLastIndex((v) => v === 5);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(5, 5, 3);
          const index = arr.findLastIndex((v) => v === 5);
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(-1, -2, -3);
          const index = arr.findLastIndex((v) => v < -2);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(2147483640, 100, 200);
          const index = arr.findLastIndex((v) => v > 150);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const index = arr.findLastIndex((v) => v > "b");
          expect(index).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1600
     * @tc.name testSearchFindLastIndexNormal002
     * @tc.desc Test SparseArray.findLastIndex method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastIndexNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>("a", "", "c");
          const index = arr.findLastIndex((v) => v === "");
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          const index = arr.findLastIndex((v) => v === true);
          expect(index).assertEqual(2);


      }
      {
        const arr = new SparseArray<Item024>();
          arr[0] = { id: 1, name: "a" };
          arr[2] = { id: 2, name: "b" };
          const index = arr.findLastIndex((v) => v.id > 1);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 2, 1);
          const index = arr.findLastIndex((v) => v === 2);
          expect(index).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const index = arr.findLastIndex((v) => v > 2);
          expect(index).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const index = arr.findLastIndex((v) => v > 10);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>();
          const index = arr.findLastIndex((v) => true);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int | undefined>(10);
          arr[5] = 100;
          arr[0] = undefined;
          const index = arr.findLastIndex((v) => v !== undefined && v > 50);
          expect(index).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const index = arr.findLastIndex((v) => v > 20);
          expect(index).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 10;
          arr[2] = 20;
          arr[4] = 30;
          arr[6] = 40;
          const index = arr.findLastIndex((v) => v > 25);
          expect(index).assertEqual(6);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1700
     * @tc.name testSearchFindLastIndexNormal003
     * @tc.desc Test SparseArray.findLastIndex method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastIndexNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(6, 5, 3);
          const index = arr.findLastIndex((v) => v === 5);
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const index = arr.findLastIndex((elem, index, array) => {
            return array === arr && elem === 30;
          });
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 4, 3);
          const index = arr.findLastIndex((v) => v === 3);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int | undefined>(2);
          arr[0] = 1;
          arr[1] = undefined;
          const index = arr.findLastIndex((v) => v === undefined);
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<number | string>(1, "a", 3);
          const index = arr.findLastIndex((v): boolean => {
            if (typeof v === "string") {
              return false;
            }
            const n = v as number;
            return n > 2;
          });
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(10000);
          for (let i = 0; i < 10000; i++) {
            arr[i] = i;
          }
          const index = arr.findLastIndex((v) => v > 9990);
          expect(index).assertEqual(9999);


      }
      {
          const arr = new SparseArray<int>(1000);
          arr[0] = 1;
          arr[999] = 999;
          const index = arr.findLastIndex((v) => v > 500);
          expect(index).assertEqual(999);


      }
      {
          const arr = new SparseArray<int>(100);
          const index = arr.findLastIndex((v) => v > 50);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const index = arr.findLastIndex((v) => v === 3);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(2, 2, 5);
          const index = arr.findLastIndex((v) => v === 2);
          expect(index).assertEqual(1);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1800
     * @tc.name testSearchFindLastIndexNormal004
     * @tc.desc Test SparseArray.findLastIndex method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastIndexNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(3, 3, 3);
          const index = arr.findLastIndex((v) => v === 3);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const index = arr.findLastIndex((v) => v < 5);
          expect(index).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 10;
          arr[2] = 20;
          arr[4] = 30;
          arr[6] = 40;
          arr[8] = 50;
          const index = arr.findLastIndex((v) => v === 40);
          expect(index).assertEqual(6);


      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
          const threshold: long = 1000000000 as long;
          const index = arr.findLastIndex((v: long): boolean => v > threshold);
          expect(index).assertEqual(1);

      }
      {
          const arr = new SparseArray<int | null>(1, null, 2, null);
          const index = arr.findLastIndex((v: int | null): boolean => v === null);
          expect(index).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(0o5, 0o7, 0o12);
          const index = arr.findLastIndex((v: int): boolean => v === 0o12);
          expect(index).assertEqual(2);

      }
      {
        // 1. true predicate on single sparse {42} -> 0
        const arr1 = new SparseArray<int>();
        arr1[0] = 42;
        expect(arr1.findLastIndex((_elem: int): boolean => true)).assertEqual(0);
        // 2. true predicate on (5,10,15) -> 2
        const arr2 = new SparseArray<int>(5, 10, 15);
        expect(arr2.findLastIndex((_elem: int): boolean => true)).assertEqual(2);
        // 3. elem>1 on (1,2,3) -> 2
        const arr3 = new SparseArray<int>(1, 2, 3);
        expect(arr3.findLastIndex((elem: int): boolean => elem > 1)).assertEqual(2);
        // 4. elem<15 on (5,10,15,20) -> 1
        const arr4 = new SparseArray<int>(5, 10, 15, 20);
        expect(arr4.findLastIndex((elem: int): boolean => elem < 15)).assertEqual(1);
        // 5. elem!==8 on (8,8,8,9) -> 3
        const arr5 = new SparseArray<int>(8, 8, 8, 9);
        expect(arr5.findLastIndex((elem: int): boolean => elem !== 8)).assertEqual(3);
        // 6. elem>3 && elem<12 on (1,4,7,10,13) -> 3
        const arr6 = new SparseArray<int>(1, 4, 7, 10, 13);
        expect(arr6.findLastIndex((elem: int): boolean => elem > 3 && elem < 12)).assertEqual(3);
        // 7. elem<3 || elem>12 on (2,5,8,11,14) -> 4
        const arr7 = new SparseArray<int>(2, 5, 8, 11, 14);
        expect(arr7.findLastIndex((elem: int): boolean => elem < 3 || elem > 12)).assertEqual(4);
        // 8. elem>3 on (5,4,3,2,1) -> 1
        const arr8 = new SparseArray<int>(5, 4, 3, 2, 1);
        expect(arr8.findLastIndex((elem: int): boolean => elem > 3)).assertEqual(1);
        // 9. elem<4 on (1,2,3,4,5) -> 2
        const arr9 = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr9.findLastIndex((elem: int): boolean => elem < 4)).assertEqual(2);
        // 10. elem===7 on (6,7,8,6,7) -> 4 (duplicate, last index)
        const arr10 = new SparseArray<int>(6, 7, 8, 6, 7);
        expect(arr10.findLastIndex((elem: int): boolean => elem === 7)).assertEqual(4);

      }
      {
        // 1. true predicate on sparse {0,2,4} -> 4 (last assigned index)
        const arr1 = new SparseArray<int>(5);
        arr1[0] = 1;
        arr1[2] = 3;
        arr1[4] = 5;
        expect(arr1.findLastIndex((_elem: int): boolean => true)).assertEqual(4);
        // 2. elem>=0 on sparse {0} -> 0
        const arr2 = new SparseArray<int>();
        arr2[0] = 0;
        expect(arr2.findLastIndex((elem: int): boolean => elem >= 0)).assertEqual(0);
        // 3. elem===INT_MAX on sparse {MAX} -> 0 (typed int max)
        const arr3 = new SparseArray<int>();
        arr3[0] = 2147483647;
        expect(arr3.findLastIndex((elem: int): boolean => elem === 2147483647)).assertEqual(0);
        // 4. elem<0 on sparse {-1} -> 0 (typed negative)
        const arr4 = new SparseArray<int>();
        arr4[0] = -1;
        expect(arr4.findLastIndex((elem: int): boolean => elem < 0)).assertEqual(0);
        // 5. true predicate on sparse {2,4} -> 4
        const arr5 = new SparseArray<int>(5);
        arr5[2] = 10;
        arr5[4] = 20;
        expect(arr5.findLastIndex((_elem: int): boolean => true)).assertEqual(4);
        // 6. elem>10 on sparse {0,2,4} -> 4
        const arr6 = new SparseArray<int>(6);
        arr6[0] = 5;
        arr6[2] = 15;
        arr6[4] = 25;
        expect(arr6.findLastIndex((elem: int): boolean => elem > 10)).assertEqual(4);
        // 7. elem>20 on sparse {0,1} -> 1
        const arr7 = new SparseArray<int>(4);
        arr7[0] = 30;
        arr7[1] = 40;
        expect(arr7.findLastIndex((elem: int): boolean => elem > 20)).assertEqual(1);
        // 8. true predicate on sparse {0} -> 0
        const arr8 = new SparseArray<int>(5);
        arr8[0] = 7;
        expect(arr8.findLastIndex((_elem: int): boolean => true)).assertEqual(0);
        // 9. elem%2===0 on sparse {0,1,3,4} -> 3
        const arr9 = new SparseArray<int>(5);
        arr9[0] = 1;
        arr9[1] = 2;
        arr9[3] = 4;
        arr9[4] = 5;
        expect(arr9.findLastIndex((elem: int): boolean => elem % 2 === 0)).assertEqual(3);
        // 10. elem===888 on sparse {0,50,99} -> 50 (large sparse)
        const arr10 = new SparseArray<int>(100);
        arr10[0] = 999;
        arr10[50] = 888;
        arr10[99] = 777;
        expect(arr10.findLastIndex((elem: int): boolean => elem === 888)).assertEqual(50);

      }
      {
        // 1. false predicate on (42) -> -1 (no-match)
        const arr1 = new SparseArray<int>(42);
        expect(arr1.findLastIndex((_elem: int): boolean => false)).assertEqual(-1);
        // 2. false predicate on sparse {0,2,4} -> -1 (no-match sparse)
        const arr2 = new SparseArray<int>(5);
        arr2[0] = 1;
        arr2[2] = 3;
        arr2[4] = 5;
        expect(arr2.findLastIndex((_elem: int): boolean => false)).assertEqual(-1);
        // 3. elem>0 on (0) -> -1 (no-match single/empty)
        const arr3 = new SparseArray<int>(0);
        expect(arr3.findLastIndex((elem: int): boolean => elem > 0)).assertEqual(-1);
        // 4. elem!==0 on (0,0,0) -> -1 (no-match all-zero)
        const arr4 = new SparseArray<int>(0, 0, 0);
        expect(arr4.findLastIndex((elem: int): boolean => elem !== 0)).assertEqual(-1);
        // 5. callback elem: elem>=10 on (5,10,15) -> 2
        const arr5 = new SparseArray<int>(5, 10, 15);
        expect(arr5.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => elem >= 10)).assertEqual(2);
        // 6. callback index: index===1 on (100,200,300) -> 1
        const arr6 = new SparseArray<int>(100, 200, 300);
        expect(arr6.findLastIndex((_elem: int, index: int, _array: SparseArray<int>): boolean => index === 1)).assertEqual(1);
        // 7. callback array: array.length===3 on (7,8,9) -> 2
        const arr7 = new SparseArray<int>(7, 8, 9);
        expect(arr7.findLastIndex((_elem: int, _index: int, array: SparseArray<int>): boolean => array.length === 3)).assertEqual(2);
        // 8. callback elem+index: elem===(index+1)*3 on (3,6,9,12) -> 3
        const arr8 = new SparseArray<int>(3, 6, 9, 12);
        expect(arr8.findLastIndex((elem: int, index: int, _array: SparseArray<int>): boolean => elem === (index + 1) * 3)).assertEqual(3);
        // 9. callback elem+array: elem>0 && array.length===arrLen on (1,3,5,7) -> 3
        const arr9 = new SparseArray<int>(1, 3, 5, 7);
        const arrLen9: int = arr9.length;
        expect(arr9.findLastIndex((elem: int, _index: int, array: SparseArray<int>): boolean => elem > 0 && array.length === arrLen9)).assertEqual(3);
        // 10. callback index+array: index===array.length-1 on (2,4,6) -> 2
        const arr10 = new SparseArray<int>(2, 4, 6);
        expect(arr10.findLastIndex((_elem: int, index: int, array: SparseArray<int>): boolean => index === array.length - 1)).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_1900
     * @tc.name testSearchFindLastIndexError001
     * @tc.desc Test SparseArray.findLastIndex method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchFindLastIndexError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.findLastIndex((v) => {
              throw new Error("predicate error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.findLastIndex(null as SparseArrayIntFindLastIndexPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.findLastIndex(undefined as SparseArrayIntFindLastIndexPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
        // 1. callback all three: elem%2===1 && index<len && index>=0 on (1,3,5,7) -> 3
        const arr1 = new SparseArray<int>(1, 3, 5, 7);
        const result1 = arr1.findLastIndex((elem: int, index: int, array: SparseArray<int>): boolean => {
          const len1: int = array.length;
          return elem % 2 === 1 && index < len1 && index >= 0;
        });
        expect(result1).assertEqual(3);
        // 2. throw Error on second callback call (right-to-left, second invocation throws)
        const arr2 = new SparseArray<int>(10, 20, 30, 40);
        try {
          let callCount2: int = 0;
          arr2.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
            callCount2 = callCount2 + 1;
            if (callCount2 >= 2) {
              throw new Error('second call throws');
            }
            return false;
          });
          expect().assertFail();
        } catch (e2) {
          expect(e2.name).assertEqual('Error');
        }
        // 3. throw Error when elem===3 ('stop at 3')
        const arr3 = new SparseArray<int>(1, 2, 3, 4);
        let reached3: boolean = false;
        try {
          arr3.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => {
            if (elem === 3) {
              throw new Error('stop at 3');
            }
            return false;
          });
          expect().assertFail();
        } catch (e3) {
          expect(e3.name).assertEqual('Error');
          expect(e3.message).assertEqual('stop at 3');
          reached3 = true;
        }
        expect(reached3).assertTrue();
        // 4. throw RangeError in predicate
        const arr4 = new SparseArray<int>(5, 10, 15);
        try {
          arr4.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
            throw new RangeError('range error in predicate');
          });
          expect().assertFail();
        } catch (e4) {
          expect(e4.name).assertEqual('RangeError');
        }
        // 5. throw TypeError in predicate
        const arr5 = new SparseArray<int>(1, 2, 3);
        try {
          arr5.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
            throw new TypeError('type error in predicate');
          });
          expect().assertFail();
        } catch (e5) {
          expect(e5.name).assertEqual('TypeError');
        }
        // 6. right-to-left: count===1 on match (stops at first from right)
        const arr6 = new SparseArray<int>(10, 20, 30);
        let count6: int = 0;
        const result6 = arr6.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
          count6 = count6 + 1;
          return true;
        });
        expect(result6).assertEqual(2);
        expect(count6).assertEqual(1);
        // 7. right-to-left: callCount===1 on no-match sparse {0} -> -1
        const arr7 = new SparseArray<int>();
        arr7[0] = 42;
        let callCount7: int = 0;
        const result7 = arr7.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
          callCount7 = callCount7 + 1;
          return false;
        });
        expect(result7).assertEqual(-1);
        expect(callCount7).assertEqual(1);
        // 8. elem>threshold(10) on (3,8,15,22) -> 3
        const arr8 = new SparseArray<int>(3, 8, 15, 22);
        const threshold8: int = 10;
        expect(arr8.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => elem > threshold8)).assertEqual(3);
        // 9. elem%3===0 on (1,2,3,4,5,6) -> 5
        const arr9 = new SparseArray<int>(1, 2, 3, 4, 5, 6);
        expect(arr9.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => elem % 3 === 0)).assertEqual(5);
        // 10. elem===5||elem===7 on (1,3,5,7,9) -> 3
        const arr10 = new SparseArray<int>(1, 3, 5, 7, 9);
        const values10: int[] = [5, 7];
        const result10 = arr10.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => {
          const v10a: int = values10[0];
          const v10b: int = values10[1];
          return elem === v10a || elem === v10b;
        });
        expect(result10).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2000
     * @tc.name testSearchSomeNormal001
     * @tc.desc Test SparseArray.some method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchSomeNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const ok = arr.some((v: int, _i: int, _a: SparseArray<int>): boolean => v > 0);
          expect(ok).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.some((v: int, _i: int, _a: SparseArray<int>): boolean => v > 2);
          expect(result).assertEqual(true);
          expect(typeof result).assertEqual("boolean");
          expect(result === true).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(5, 6, 4);
          const ok = arr.some((v: int): boolean => v > 3);
          expect(ok).assertTrue();

      }
      {
          const arr = new SparseArray<int>(6, 2, 5);
          const ok = arr.some((v: int): boolean => v > 7);
          expect(ok).assertFalse();

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const ok = arr.some((v: int, _i: int, _a: SparseArray<int>): boolean => v === 2);
          expect(ok).assertTrue();


      }
      {
          const arr = new SparseArray<int>(3, 6, 3);
          const ok = arr.some((v: int): boolean => v >= 6);
          expect(ok).assertTrue();

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.some((value: int, index: int, array: SparseArray<int>): boolean => {
            expect(array === arr).assertTrue();
            return false;
          });
          expect(result).assertEqual(false);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.some((v: int, i: int): boolean => v > 1 && i > 0);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.some((v: int): boolean => v > 5);
          expect(result).assertEqual(false);
          expect(result === false).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>();
          const result = arr.some((v: int): boolean => v > 0);
          expect(result).assertEqual(false);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2100
     * @tc.name testSearchSomeNormal002
     * @tc.desc Test SparseArray.some method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchSomeNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          const result = arr.some((v: int): boolean => v > 2);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 2;
          arr[4] = 3;
          const result = arr.some((v: int): boolean => v > 5);
          expect(result).assertEqual(false);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          let count = 0;
          const result = arr.some((v: int, i: int): boolean => {
            count++;
            return v > 2;
          });
          expect(count).assertEqual(2);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(5);
          const result = arr.some((v: int): boolean => v > 2);
          expect(result).assertEqual(false);


      }
      {
          const arr = new SparseArray<int>(1);
          const result = arr.some((v: int): boolean => v > 2);
          expect(result).assertEqual(false);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.some((v: int): boolean => false);
          expect(result).assertEqual(false);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.some((v: int): boolean => true);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr.push(i);
          }
          const result = arr.some((v: int): boolean => v > 500);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(1000);
          arr[0] = 1;
          arr[500] = 2;
          arr[999] = 3;
          const result = arr.some((v: int): boolean => v > 2);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          const visited: int[] = [];
          const result = arr.some((v: int, i: int): boolean => {
            visited.push(i);
            return v > 2;
          });
          expect(visited.length).assertEqual(2);
          expect(visited[0]).assertEqual(0);
          expect(visited[1]).assertEqual(2);
          expect(result).assertEqual(true);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2200
     * @tc.name testSearchSomeNormal003
     * @tc.desc Test SparseArray.some method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchSomeNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10);
          arr[2] = 20;
          arr[5] = 50;
          arr[8] = 80;
          const indices: int[] = [];
          const result = arr.some((v: int, i: int): boolean => {
            indices.push(i);
            return v > 40;
          });
          expect(indices.length).assertEqual(2);
          expect(indices[0]).assertEqual(2);
          expect(indices[1]).assertEqual(5);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 10;
          arr[3] = 30;
          arr[6] = 60;
          const indices: int[] = [];
          arr.some((v: int, i: int): boolean => {
            indices.push(i);
            return false;
          });
          expect(indices.length).assertEqual(3);
          expect(indices[0]).assertEqual(0);
          expect(indices[1]).assertEqual(3);
          expect(indices[2]).assertEqual(6);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.some((v: int, i: int, a: SparseArray<int>): boolean => {
            if (i === 0) {
              a[i] = 100;
            }
            return false;
          });
          expect(arr[0]).assertEqual(100);


      }
      {
          const arr = new SparseArray<string>("apple", "banana", "cherry");
          const result = arr.some((v: string): boolean => v.length > 5);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<Item028>(new Item028(1, "one"), new Item028(2, "two"));
          const result = arr.some((v: Item028): boolean => v.id > 1);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int | string>(1, "two", 3);
          const result = arr.some((v: int | string): boolean => typeof v == "string");
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const visited: int[] = [];
          const result = arr.some((v: int): boolean => {
            visited.push(v);
            return v === 3;
          });
          expect(visited.length).assertEqual(3);
          expect(visited[0]).assertEqual(1);
          expect(visited[1]).assertEqual(2);
          expect(visited[2]).assertEqual(3);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(5, 1, 2, 3, 4);
          let count = 0;
          const result = arr.some((v: int): boolean => {
            count++;
            return v > 2;
          });
          expect(count).assertEqual(1);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const visited: int[] = [];
          const result = arr.some((v: int): boolean => {
            visited.push(v);
            return v === 5;
          });
          expect(visited.length).assertEqual(5);
          for (let i = 0; i < 5; i++) {
            expect(visited[i]).assertEqual(i + 1);
          }
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const visited: int[] = [];
          const result = arr.some((v: int): boolean => {
            visited.push(v);
            return v > 10;
          });
          expect(visited.length).assertEqual(5);
          for (let i = 0; i < 5; i++) {
            expect(visited[i]).assertEqual(i + 1);
          }
          expect(result).assertEqual(false);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2300
     * @tc.name testSearchSomeNormal004
     * @tc.desc Test SparseArray.some method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchSomeNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          let called = false;
          const result = arr.some((_v: int, _i: int, _a: SparseArray<int>): boolean => {
            called = true;
            return true;
          });
          expect(called).assertEqual(false);
          expect(result).assertEqual(false);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const originalLength = arr.length;
          const original0 = arr[0];
          const original1 = arr[1];
          const original2 = arr[2];
          arr.some((v: int): boolean => v > 2);
          expect(arr.length).assertEqual(originalLength);
          expect(arr[0]).assertEqual(original0);
          expect(arr[1]).assertEqual(original1);
          expect(arr[2]).assertEqual(original2);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr.some((v: int): boolean => v > 2);
          expect(arr[0]).assertEqual(1);
          expect(arr[1] === undefined).assertEqual(true);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result1 = arr.some((v: int): boolean => v > 2);
          const result2 = arr.some((v: int): boolean => v < 3);
          const result3 = arr.some((v: int): boolean => v === 10);
          expect(result1).assertEqual(true);
          expect(result2).assertEqual(true);
          expect(result3).assertEqual(false);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 10000; i++) {
            arr.push(i);
          }
          const result = arr.some((v: int): boolean => v > 9999);
          expect(result).assertEqual(false);


      }
      {
          const arr = new SparseArray<int>(10000);
          for (let i = 0; i < 10000; i += 1000) {
            arr[i] = i;
          }
          const result = arr.some((v: int): boolean => v > 5000);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>();
          arr.push(100000);
          for (let i = 0; i < 99999; i++) {
            arr.push(i);
          }
          let count = 0;
          const result = arr.some((v: int): boolean => {
            count++;
            return v > 50000;
          });
          expect(count).assertEqual(1);
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<short>(100 as short, 200 as short, 30000 as short);
          const result = arr.some((v: short): boolean => v > (10000 as short));
          expect(result).assertTrue();

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
          const result = arr.some((v: float): boolean => v > 2.0f);
          expect(result).assertTrue();

      }
      {
          const arr = new SparseArray<int | null>(10, null, 20);
          expect(arr.some((v: int | null): boolean => v === null)).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2400
     * @tc.name testSearchSomeNormal005
     * @tc.desc Test SparseArray.some method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchSomeNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 0xFF);
          expect(arr.some((v: int): boolean => v === 0xFF)).assertTrue();

      }
      {
          const arr = new SparseArray<string>("a", " ", "b");
          expect(arr.some((v: string): boolean => v === " ")).assertTrue();

      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          const result = arr.some((v: boolean): boolean => !v);
          expect(result).assertTrue();

      }
      {
          const arr = new SparseArray<byte>(0 as byte, (-128 as byte), 127 as byte);
          const result = arr.some((v: byte): boolean => v === (-128 as byte));
          expect(result).assertTrue();

      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long);
          const result = arr.some((v: long): boolean => v > (9999999999 as long));
          expect(result).assertTrue();

      }
      {
          const arr = new SparseArray<double>(1.25, 2.5, 3.75);
          const result = arr.some((v: double): boolean => v > 3.0);
          expect(result).assertTrue();

      }
      {
          const arr = new SparseArray<char>(c'A', c'_', c'Z');
          const result = arr.some((v: char): boolean => v === c'_');
          expect(result).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2500
     * @tc.name testSearchSomeError001
     * @tc.desc Test SparseArray.some method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchSomeError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          try {
            arr.some((v: int): boolean => {
              if (v === 2) {
                throw new Error("test error");
              }
              return v > 2;
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }


      }
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            arr.some((v: int): boolean => {
              throw new CustomError021("custom error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("CustomError021");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          let finallyExecuted = false;
          try {
            arr.some((v: int): boolean => {
              throw new Error("error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          } finally {
            finallyExecuted = true;
          }
          expect(finallyExecuted).assertEqual(true);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2600
     * @tc.name testSearchEveryNormal001
     * @tc.desc Test SparseArray.every method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchEveryNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.every((v, i, a) => v > 0);
          expect(result).assertTrue();
          expect(typeof result).assertEqual("boolean");
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.every(() => true);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.every(() => false);
          expect(result).assertFalse();


      }
      {
          const arr = new SparseArray<int>(1, -2, 3);
          const result = arr.every((v) => v > 0);
          expect(result).assertFalse();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.every((v: int): boolean => v < 3);
          expect(result).assertFalse();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const values: Array<int> = [];
          arr.every((v) => {
            values.push(v);
            return true;
          });
          expect(values.length).assertEqual(3);
          expect(values[0]).assertEqual(1);
          expect(values[1]).assertEqual(2);
          expect(values[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(2147483647, 2147483647);
          const result = arr.every((v) => v === 2147483647);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>(0, 1, 2);
          const result = arr.every((v) => v >= 0);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>(-1, -2, -3);
          const result = arr.every((v) => v < 0);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.every((v) => v.length > 0);
          expect(result).assertTrue();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2700
     * @tc.name testSearchEveryNormal002
     * @tc.desc Test SparseArray.every method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchEveryNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<boolean>(true, true, false);
          const result = arr.every((v) => v === true);
          expect(result).assertFalse();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const indices: Array<int> = [];
          arr.every((v, i) => {
            indices.push(i);
            return true;
          });
          expect(indices.length).assertEqual(3);
          expect(indices[0]).assertEqual(0);
          expect(indices[1]).assertEqual(1);
          expect(indices[2]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1);
          arr[0] = 1;
          let firstIndex: int = -1;
          arr.every((v, i) => {
            firstIndex = i;
            return true;
          });
          expect(firstIndex).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          let lastIndex: int = -1;
          arr.every((v, i) => {
            lastIndex = i;
            return true;
          });
          expect(lastIndex).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          let receivedArray: SparseArray<int> | null = null;
          arr.every((v, i, a) => {
            receivedArray = a;
            return true;
          });
          expect(receivedArray !== null && receivedArray !== undefined).assertTrue();
          expect(receivedArray).assertEqual(arr);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.every((v, i, a) => {
            a[0] = 100;
            return true;
          });
          expect(arr[0]).assertEqual(100);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          let arrayLength: int = -1;
          arr.every((v, i, a) => {
            arrayLength = a.length;
            return true;
          });
          expect(arrayLength).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          let callCount: int = 0;
          const result = arr.every((v) => {
            callCount++;
            return v > 0;
          });
          expect(callCount).assertEqual(3);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>();
          const result = arr.every((v) => v > 0);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>(-1, 2, 3);
          let callCount: int = 0;
          const result = arr.every((v) => {
            callCount++;
            return v > 0;
          });
          expect(callCount).assertEqual(1);
          expect(result).assertFalse();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2800
     * @tc.name testSearchEveryNormal003
     * @tc.desc Test SparseArray.every method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchEveryNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, -3, 4);
          let callCount: int = 0;
          const result = arr.every((v) => {
            callCount++;
            return v > 0;
          });
          expect(callCount).assertEqual(3);
          expect(result).assertFalse();


      }
      {
          const arr = new SparseArray<string>("a", "b", "");
          const result = arr.every((v) => v.length > 0);
          expect(result).assertFalse();


      }
      {
          const arr = new SparseArray<boolean>(true, true, true);
          const result = arr.every((v) => v === true);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>(-1);
          expect(arr.length === 0).assertTrue();
          const result = arr.every((v) => v > 0);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1000);
          for (let i = 0; i < 1000; i++) {
            arr[i] = i;
          }
          const result = arr.every((v) => v >= 0);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.every(() => {
              throw new Error("error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
            expect(error.message).assertEqual("error");
          }


      }
      {
        const arr = new SparseArray<Person030>(new Person030("Alice", 20), new Person030("Bob", 25));
          const result = arr.every((p: Person030) => p.age > 18);
          expect(result).assertTrue();


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const visitedIndices: Array<int> = [];
          arr.every((v, i) => {
            visitedIndices.push(i);
            return true;
          });
          expect(visitedIndices.length).assertEqual(3);
          expect(visitedIndices[0]).assertEqual(0);
          expect(visitedIndices[1]).assertEqual(2);
          expect(visitedIndices[2]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.every((v, i, a) => {
            a[i] = v * 2;
            return true;
          });
          expect(arr[0]).assertEqual(2);
          expect(arr[1]).assertEqual(4);
          expect(arr[2]).assertEqual(6);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          arr.every((v, i, a) => {
            if (i === 2) {
              a.length = 2;
            }
            return true;
          });
          expect(arr.length).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_2900
     * @tc.name testSearchEveryNormal004
     * @tc.desc Test SparseArray.every method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchEveryNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.every((v, i, a) => {
            if (i === 0) {
              a.push(4);
            }
            return true;
          });
          expect(arr.length).assertEqual(4);
          expect(arr[3]).assertEqual(4);


      }
      {
          const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
          const allPositive = arr.every((v: short): boolean => v > 0 as short);
          expect(allPositive).assertTrue();

      }
      {
          const arr = new SparseArray<byte>(10 as byte, 127 as byte, 20 as byte);
          const ok = arr.every((v: byte): boolean => Byte.toInt(v) < 128);
          expect(ok).assertTrue();

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3);
          const allNonNull = arr.every((v: int | null): boolean => v !== null);
          expect(allNonNull).assertFalse();

      }
      {
          const arr = new SparseArray<int>(0xA, 0b101, 0);
          const ok = arr.every((v: int): boolean => v >= 0);
          expect(ok).assertTrue();

      }
      {
          const arr = new SparseArray<string>("", "", "");
          const ok = arr.every((v: string): boolean => v.length === 0);
          expect(ok).assertTrue();

      }
      {
        // 1. every arity=1 on sparse len=4 {0:10, 3:40} value>0 -> true
        const arr1 = new SparseArray<int>(4);
        arr1[0] = 10;
        arr1[3] = 40;
        const result1 = arr1.every((value: int): boolean => value > 0);
        expect(result1).assertTrue();
        // 2. every T=string ('a','b','c') nonEmpty length>0 -> true
        const nonEmpty2 = (value: string): boolean => value.length > 0;
        const arr2 = new SparseArray<string>('a', 'b', 'c');
        const result2 = arr2.every(nonEmpty2);
        expect(result2).assertTrue();
        // 3. every T=boolean (true,true) value -> true (firstVal captured true)
        const arr3 = new SparseArray<boolean>(true, true);
        let firstVal3: boolean = false;
        const result3 = arr3.every((value: boolean): boolean => {
          firstVal3 = value;
          return value;
        });
        expect(firstVal3).assertTrue();
        expect(result3).assertTrue();
        // 4. every T=bigint (9223372036854775807n) value===max -> true (receivedMax true)
        const maxBig4: bigint = 9223372036854775807n;
        const arr4 = new SparseArray<bigint>(maxBig4);
        let receivedMax4: boolean = false;
        const result4 = arr4.every((value: bigint): boolean => {
          if (value === 9223372036854775807n) {
            receivedMax4 = true;
          }
          return value === 9223372036854775807n;
        });
        expect(receivedMax4).assertTrue();
        expect(result4).assertTrue();
        // 5. every null predicate [null] value===null -> true
        const arr5 = new SparseArray<int | null>();
        arr5[0] = null;
        const result5 = arr5.every(
          (value: int | null, _index: int, _array: SparseArray<int | null>): boolean => value === null,
        );
        expect(result5).assertTrue();
        // 6. every NaN predicate [NaN,NaN,NaN] isNaN -> true
        const arr6 = new SparseArray<number>();
        arr6[0] = Number.NaN;
        arr6[1] = Number.NaN;
        arr6[2] = Number.NaN;
        const result6 = arr6.every((value: number, _index: int, _array: SparseArray<number>): boolean => isNaN(value));
        expect(result6).assertTrue();
        // 7. every MAX_VALUE predicate value>0 -> true
        const arr7 = new SparseArray<number>();
        arr7[0] = Number.MAX_VALUE;
        const result7 = arr7.every((value: number, _index: int, _array: SparseArray<number>): boolean => value > 0);
        expect(result7).assertTrue();
        // 8. every bigint (-9223372036854775808n) value<0n -> true
        const arr8 = new SparseArray<bigint>(-9223372036854775808n);
        const result8 = arr8.every((value: bigint, _index: int, _array: SparseArray<bigint>): boolean => value < 0n);
        expect(result8).assertTrue();

      }
      {
        // 1. every T=int (0,1,2) receivedZero value!==0 -> false
        const arr1 = new SparseArray<int>(0, 1, 2);
        let receivedZero1: boolean = false;
        const result1 = arr1.every((value: int): boolean => {
          if (value === 0) {
            receivedZero1 = true;
          }
          return value !== 0;
        });
        expect(receivedZero1).assertTrue();
        expect(result1).assertFalse();
        // 2. every T=int (2147483647, 1) receivedMax value!==MAX -> false
        const maxInt2: int = 2147483647;
        const arr2 = new SparseArray<int>(maxInt2, 1);
        let receivedMax2: boolean = false;
        const result2 = arr2.every((value: int): boolean => {
          if (value === 2147483647) {
            receivedMax2 = true;
          }
          return value !== 2147483647;
        });
        expect(receivedMax2).assertTrue();
        expect(result2).assertFalse();
        // 3. every T=string ('','a','b') receivedEmpty length>0 -> false
        const arr3 = new SparseArray<string>('', 'a', 'b');
        let receivedEmpty3: boolean = false;
        const result3 = arr3.every((value: string): boolean => {
          if (value.length === 0) {
            receivedEmpty3 = true;
          }
          return value.length > 0;
        });
        expect(receivedEmpty3).assertTrue();
        expect(result3).assertFalse();
        // 4. every T=boolean (false,false) value -> false (firstVal false)
        const arr4 = new SparseArray<boolean>(false, false);
        let firstVal4: boolean = true;
        const result4 = arr4.every((value: boolean): boolean => {
          firstVal4 = value;
          return value;
        });
        expect(firstVal4).assertFalse();
        expect(result4).assertFalse();
        // 5. every T=double (NaN, 1.0) receivedNaN !isNaN -> false
        const arr5 = new SparseArray<double>(Number.NaN, 1.0);
        let receivedNaN5: boolean = false;
        const result5 = arr5.every((value: double): boolean => {
          let d: double = value;
          if (d != d) {
            receivedNaN5 = true;
          }
          return !isNaN(value);
        });
        expect(receivedNaN5).assertTrue();
        expect(result5).assertFalse();
        // 6. every T=double (Infinity, 1.0) receivedInf value!==Infinity -> false
        const arr6 = new SparseArray<double>(Number.POSITIVE_INFINITY, 1.0);
        let receivedInf6: boolean = false;
        const result6 = arr6.every((value: double): boolean => {
          if (value == 1.0 / 0.0) {
            receivedInf6 = true;
          }
          return value !== Number.POSITIVE_INFINITY;
        });
        expect(receivedInf6).assertTrue();
        expect(result6).assertFalse();
        // 7. every T=boolean (false,false,false) value -> false
        const arr7 = new SparseArray<boolean>(false, false, false);
        const result7 = arr7.every((value: boolean, _index: int, _array: SparseArray<boolean>): boolean => value);
        expect(result7).assertFalse();
        // 8. every T=int (1,-2,3) value>0 -> false
        const arr8 = new SparseArray<int>(1, -2, 3);
        const result8 = arr8.every((value: int, _index: int, _array: SparseArray<int>): boolean => value > 0);
        expect(result8).assertFalse();
        // 9. every T=boolean (true,false) value -> false
        const arr9 = new SparseArray<boolean>(true, false);
        const result9 = arr9.every((value: boolean, _index: int, _array: SparseArray<boolean>): boolean => value);
        expect(result9).assertFalse();

      }
      {
        // 1. every arity=2 (value, index) on (10,20,30) captures index 1 value 20 -> indexUsed true
        const arr1 = new SparseArray<int>(10, 20, 30);
        let indexUsed1: boolean = false;
        arr1.every((value: int, index: int): boolean => {
          if (index === 1 && value === 20) {
            indexUsed1 = true;
          }
          return true;
        });
        expect(indexUsed1).assertTrue();
        // 2. every arity=3 (value, index, array) on (10,20,30) captures value 20 index 1 array.length 3 -> allAvailable true
        const arr2 = new SparseArray<int>(10, 20, 30);
        let allAvailable2: boolean = false;
        arr2.every((value: int, index: int, array: SparseArray<int>): boolean => {
          if (value === 20 && index === 1 && array.length === 3) {
            allAvailable2 = true;
          }
          return true;
        });
        expect(allAvailable2).assertTrue();
        // 3. every T=int on (100,200,300) checks arr[index]===value for all -> allMatch true
        const arr3 = new SparseArray<int>(100, 200, 300);
        let allMatch3: boolean = true;
        arr3.every((value: int, index: int): boolean => {
          if (arr3[index] !== value) {
            allMatch3 = false;
          }
          return true;
        });
        expect(allMatch3).assertTrue();
        // 4. every T=double (1.5,2.5,3.5) invokes predicate through last value -> lastVal 3.5
        const arr4 = new SparseArray<double>(1.5, 2.5, 3.5);
        let lastVal4: double = 0.0;
        arr4.every((value: double): boolean => {
          lastVal4 = value;
          return true;
        });
        expect(lastVal4).assertEqual(3.5);
        // 5. every on sparse len=100 {99:777} captures index 99 -> capturedIndex 99
        const arr5 = new SparseArray<int>(100);
        arr5[99] = 777;
        let capturedIndex5 = -1;
        arr5.every((_value: int, index: int, _array: SparseArray<int>): boolean => {
          capturedIndex5 = index;
          return true;
        });
        expect(capturedIndex5).assertEqual(99);
        // 6. every on (10,20,30) passes values 10,20,30 indexes 0,1,2 array ref; callCount 3 -> true
        const arr6 = new SparseArray<int>(10, 20, 30);
        let callCount6: int = 0;
        let visitedIndexes6: int[] = [];
        let visitedValues6: int[] = [];
        let callbackArray6 = new SparseArray<int>();
        const result6 = arr6.every((value: int, index: int, array: SparseArray<int>): boolean => {
          callCount6++;
          callbackArray6 = array;
          visitedIndexes6.push(index);
          visitedValues6.push(value);
          return true;
        });
        expect(result6).assertTrue();
        expect(callCount6).assertEqual(3);
        expect(visitedIndexes6[0]).assertEqual(0);
        expect(visitedIndexes6[1]).assertEqual(1);
        expect(visitedIndexes6[2]).assertEqual(2);
        expect(visitedValues6[0]).assertEqual(10);
        expect(visitedValues6[1]).assertEqual(20);
        expect(visitedValues6[2]).assertEqual(30);
        expect(callbackArray6).assertEqual(arr6);
        // 7. every on sparse len=10 {0:1, 9:9} visits stored entries indexes 0,9; callCount 2 -> true
        const arr7 = new SparseArray<int>(10);
        arr7[0] = 1;
        arr7[9] = 9;
        let callCount7: int = 0;
        let visitedIndexes7: int[] = [];
        let visitedValues7: int[] = [];
        let callbackArray7 = new SparseArray<int>();
        const result7 = arr7.every((value: int, index: int, array: SparseArray<int>): boolean => {
          callCount7++;
          callbackArray7 = array;
          visitedIndexes7.push(index);
          visitedValues7.push(value);
          return true;
        });
        expect(result7).assertTrue();
        expect(callCount7).assertEqual(2);
        expect(visitedIndexes7[0]).assertEqual(0);
        expect(visitedIndexes7[1]).assertEqual(9);
        expect(visitedValues7[0]).assertEqual(1);
        expect(visitedValues7[1]).assertEqual(9);
        expect(callbackArray7).assertEqual(arr7);
        // 8. every on (1,2,-1,4,5) value>0 stops at -1; visited length 3 [1,2,-1] -> false
        const arr8 = new SparseArray<int>(1, 2, -1, 4, 5);
        let visited8: int[] = [];
        const result8 = arr8.every((value: int, _index: int, _array: SparseArray<int>): boolean => {
          visited8.push(value);
          return value > 0;
        });
        expect(result8).assertFalse();
        let actualValue8a: int = visited8.length;
        let expectedValue8a: int = 3;
        expect(actualValue8a).assertEqual(expectedValue8a);
        let actualValue8b: number = visited8[0];
        let expectedValue8b: int = 1;
        expect(actualValue8b).assertEqual(expectedValue8b);
        let actualValue8c: number = visited8[1];
        let expectedValue8c: int = 2;
        expect(actualValue8c).assertEqual(expectedValue8c);
        let actualValue8d: number = visited8[2];
        let expectedValue8d: int = -1;
        expect(actualValue8d).assertEqual(expectedValue8d);
        // 9. every on sparse len=10 {0:1, 5:0, 9:3} value>0 stops at index 5; visited length 2 -> false
        const arr9 = new SparseArray<int>(10);
        arr9[0] = 1;
        arr9[5] = 0;
        arr9[9] = 3;
        let visited9: int[] = [];
        const result9 = arr9.every((value: int, _index: int, _array: SparseArray<int>): boolean => {
          visited9.push(value);
          return value > 0;
        });
        expect(result9).assertFalse();
        let actualValue9a: int = visited9.length;
        let expectedValue9a: int = 2;
        expect(actualValue9a).assertEqual(expectedValue9a);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SEARCH_3000
     * @tc.name testSearchEveryError001
     * @tc.desc Test SparseArray.every method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearchEveryError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.every(null as SparseArrayIntEveryPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.every(undefined as SparseArrayIntEveryPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            arr.every(() => {
              throw new CustomError028("custom error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("CustomError028");
          }

      }
      {
        // 1. every predicate throws TypeError on (100,200) -> propagates TypeError
        const arr1 = new SparseArray<int>(100, 200);
        try {
          arr1.every((_value: int, _index: int, _array: SparseArray<int>): boolean => {
            throw new TypeError('type mismatch');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        // 2. every predicate throws RangeError at callCount 2 on (10,20,30,40) -> propagates RangeError
        const arr2 = new SparseArray<int>(10, 20, 30, 40);
        try {
          let callCount2 = 0;
          arr2.every((_value: int, _index: int, _array: SparseArray<int>): boolean => {
            callCount2++;
            if (callCount2 === 2) {
              throw new RangeError('out of range');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        // 3. every propagates Error after preceding callback returns true (throw at value 2) on (1,2,3)
        const arr3 = new SparseArray<int>(1, 2, 3);
        try {
          arr3.every((value: int, _index: int, _array: SparseArray<int>): boolean => {
            if (value === 2) {
              throw new Error('throw at value 2');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        // 4. every propagates Error thrown after callback modifies arr[0] on (1,2,3)
        const arr4 = new SparseArray<int>(1, 2, 3);
        try {
          arr4.every((_value: int, _index: int, _array: SparseArray<int>): boolean => {
            arr4[0] = 999;
            throw new Error('modify and throw');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        // 5. every on (1,2,3) supplies first two values before callback overwrites arr[2]=999
        const arr5 = new SparseArray<int>(1, 2, 3);
        let values5: int[] = [];
        arr5.every((value: int, _index: int, _array: SparseArray<int>): boolean => {
          values5.push(value);
          arr5[2] = 999;
          return true;
        });
        let actualValue5a: number = values5[0];
        let expectedValue5a: int = 1;
        expect(actualValue5a).assertEqual(expectedValue5a);
        let actualValue5b: number = values5[1];
        let expectedValue5b: int = 2;
        expect(actualValue5b).assertEqual(expectedValue5b);
        expect(arr5[2]).assertEqual(999);
        // 6. every on (1,2,3,4,5) clearing length=0 stops further callbacks; callCount 1
        const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
        let callCount6 = 0;
        arr6.every((_value: int, _index: int, _array: SparseArray<int>): boolean => {
          callCount6++;
          arr6.length = 0;
          return true;
        });
        expect(callCount6).assertEqual(1);
        // 7. every on (1,2,3) observes item appended during traversal; callCount 4 -> true
        const arr7 = new SparseArray<int>(1, 2, 3);
        let callCount7 = 0;
        const result7 = arr7.every((_value: int, index: int, _array: SparseArray<int>): boolean => {
          callCount7++;
          if (index === 0) {
            arr7[arr7.length] = 999;
          }
          return true;
        });
        expect(result7).assertTrue();
        expect(callCount7).assertEqual(4);
        // 8. every null predicate [null,null,null] value!==null -> false
        const arr8 = new SparseArray<int | null>();
        arr8[0] = null;
        arr8[1] = null;
        arr8[2] = null;
        const result8 = arr8.every(
          (value: int | null, _index: int, _array: SparseArray<int | null>): boolean => value !== null,
        );
        expect(result8).assertFalse();
        // 9. every null predicate [1,null,3] value!==null -> false
        const arr9 = new SparseArray<int | null>();
        arr9[0] = 1 as int;
        arr9[1] = null;
        arr9[2] = 3 as int;
        const result9 = arr9.every(
          (value: int | null, _index: int, _array: SparseArray<int | null>): boolean => value !== null,
        );
        expect(result9).assertFalse();

      }
    });

  });
}
