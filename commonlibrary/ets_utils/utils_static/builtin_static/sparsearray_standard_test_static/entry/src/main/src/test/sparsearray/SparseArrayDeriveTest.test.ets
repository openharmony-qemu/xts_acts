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

class Person026 {
    name: string;
    age: int;
    constructor(name: string, age: int) {
      this.name = name;
      this.age = age;
    }
  }

interface ConcatProfile046 {
  id: int
  name: string
}

enum ConcatColor045 {
  Red,
  Green,
  Blue
}

interface SparseArrayConcatPart01Object {
  id: int;
}

class Test015 {
    value: number = 0;
  }

class Test026 {
    value: number = 0;
  }

class Point012 {
    x: int;
    y: int;
    constructor(x: int, y: int) {
      this.x = x;
      this.y = y;
    }
  }

interface ObjItem {
  id: int;
}

// Merged from SparseArrayToReversedPart01Test (23 scenarios -> 3 cases, each <=10)

class Person009 {
    name: string;
    age: int;
    constructor(name: string, age: int) {
      this.name = name;
      this.age = age;
    }
  }

class Item020 {
    id: int;
    name: string;
    constructor(id: int, name: string) {
      this.id = id;
      this.name = name;
    }
  }

interface Container021Item {
  value: int;
}

class Container021 {
    item: Container021Item;
    constructor(value: int) {
      this.item = { value: value };
    }
  }

class NullableItem022 {
    id: int | null;
    constructor(id: int | null) {
      this.id = id;
    }
  }

class Item034 {
    value: int;
    constructor(value: int) {
      this.value = value;
    }
  }

class StableItem038 {
    id: int;
    value: int;
    constructor(id: int, value: int) {
      this.id = id;
      this.value = value;
    }
  }

export default function SparseArrayDeriveTest(): void {
  describe('SparseArrayDeriveTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0100
     * @tc.name testDeriveConcatNormal001
     * @tc.desc Test SparseArray.concat method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveConcatNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr1 = new SparseArray<int>(1, 2, 3);
          const newArr = arr1.concat();
          expect(newArr.length).assertEqual(3);
          expect(newArr[0]).assertEqual(1);


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const arr3 = [5, 6] as Array<int>;
          const newArr = arr1.concat(arr2, arr3);
          expect(newArr.length).assertEqual(6);
          expect(newArr.toString()).assertEqual("1,2,3,4,5,6");


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(2);
          expect(newArr.toString()).assertEqual("1,2");


      }
      {
          const arr1 = new SparseArray<int>(10);
          arr1[0] = 1;
          arr1[3] = 4;
          const arr2 = [5] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(11);


      }
      {
          const arr1 = new SparseArray<int | undefined>(1, 2);
          arr1.push(undefined);
          const arr2 = [undefined, undefined, undefined, undefined] as Array<int | undefined>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(7);


      }
      {
          const arr1 = new SparseArray<int | undefined>(1, undefined, 2);
          const arr2 = [] as Array<int | undefined>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(3);
          expect(newArr[0]).assertEqual(1);
          expect(newArr[1]).assertUndefined();
          expect(newArr[2]).assertEqual(2);


      }
      {
          const arr1 = new SparseArray<string>("a", "b");
          const arr2 = ["c", "d"] as Array<string>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(4);
          expect(newArr.toString()).assertEqual("a,b,c,d");


      }
      {
          const arr1 = new SparseArray<int | undefined>(1, 2);
          const arr2 = [undefined, 4] as Array<int | undefined>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(4);


      }
      {
          const arr1 = new SparseArray<int>();
          const arr2 = [1, 2, 3] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(3);
          expect(newArr.toString()).assertEqual("1,2,3");


      }
      {
          const arr1 = new SparseArray<int>(5);
          arr1[0] = 1;
          arr1[4] = 5;
          const arr2 = [6, 7] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(7);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0200
     * @tc.name testDeriveConcatNormal002
     * @tc.desc Test SparseArray.concat method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveConcatNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, undefined, undefined, undefined, 7] as Array<int | undefined>;
          const newArr = arr1.concat(arr2 as Array<int>);
          expect(newArr.length).assertEqual(7);
          expect(newArr[0]).assertEqual(1);
          expect(newArr[1]).assertEqual(2);
          expect(newArr[2]).assertEqual(3);
          expect(newArr[3]).assertUndefined();
          expect(newArr[4]).assertUndefined();
          expect(newArr[5]).assertUndefined();
          expect(newArr[6]).assertEqual(7);


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(newArr !== null && newArr !== undefined).assertTrue();
          expect(newArr instanceof SparseArray).assertTrue();
          expect(newArr.length).assertEqual(4);
          expect(newArr.toString()).assertEqual("1,2,3,4");


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(newArr !== arr1).assertTrue();
          expect(newArr.length).assertEqual(4);


      }
      {
          const arr1 = new SparseArray<int>();
          const arr2 = [] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(0);


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(3);
          expect(newArr[2]).assertEqual(3);


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const newArr: SparseArray<int> = arr1.concat(arr2);
          expect(newArr.length).assertEqual(4);
          expect(newArr[0]).assertEqual(1);


      }
      {
          const arr1 = new SparseArray<string>("1", "2");
          const arr2 = ["3", "4"] as Array<string>;
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(4);
          expect(typeof newArr[0]).assertEqual("string");


      }
      {
          const arr1 = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr1.push(i);
          }
          const arr2 = [] as Array<int>;
          for (let i = 1000; i < 2000; i++) {
            arr2.push(i);
          }
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(2000);


      }
      {
          const arr1 = new SparseArray<int>(1, 2, 3);
          const originalLength = arr1.length;
          const arr2 = [4, 5] as Array<int>;
          arr1.concat(arr2);
          expect(arr1.length).assertEqual(originalLength);


      }
      {
          const arr1 = new SparseArray<int>(1, 2, 3);
          const arr2 = [4, 5] as Array<int>;
          arr1.concat(arr2);
          expect(arr1[0]).assertEqual(1);
          expect(arr1[1]).assertEqual(2);
          expect(arr1[2]).assertEqual(3);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0300
     * @tc.name testDeriveConcatNormal003
     * @tc.desc Test SparseArray.concat method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveConcatNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          arr1.concat(arr2);
          expect(arr2.length).assertEqual(2);
          expect(arr2[0]).assertEqual(3);


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const newArr = arr1.concat(arr2);
          newArr[0] = 99;
          expect(newArr.length).assertEqual(4);
          expect(arr1[0]).assertEqual(1);


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const newArr = arr1.concat(arr2);
          arr1[0] = 99;
          expect(newArr.length).assertEqual(4);
          expect(newArr[0]).assertEqual(1);


      }
      {
          const arr1 = new SparseArray<int>();
          arr1.push(1);
          const newArr = arr1.concat([2, 3, 4] as Array<int>);
          expect(newArr.length).assertEqual(4);
          expect(newArr.toString()).assertEqual("1,2,3,4");


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const temp = arr1.concat(arr2);
          const arr3 = [5, 6] as Array<int>;
          const newArr = temp.concat(arr3);
          expect(newArr.length).assertEqual(6);
          expect(newArr.toString()).assertEqual("1,2,3,4,5,6");


      }
      {
        const arr1 = new SparseArray<Person026>(new Person026("Alice", 20));
          const arr2 = [new Person026("Bob", 25)] as Array<Person026>;
          const newArr = arr1.concat(arr2);
          const first = newArr[0];
          expect(newArr.length).assertEqual(2);
          expect(first !== null && first !== undefined).assertTrue();
          expect((first as Person026).name).assertEqual("Alice");


      }
      {
          const arr1 = new SparseArray<int | string>(1, "a");
          const arr2 = new Array<int | string>("b", 2);
          const newArr = arr1.concat(arr2);
          expect(newArr.length).assertEqual(4);


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2Sa = new SparseArray<int>(101);
          arr2Sa[100] = 100;
          const arr2 = [] as Array<int | undefined>;
          for (let i = 0; i < arr2Sa.length; i++) {
            arr2.push(arr2Sa[i] as int | undefined);
          }
          const newArr = arr1.concat(arr2 as Array<int>);
          expect(newArr.length).assertEqual(103);


      }
      {
          const arr1 = new SparseArray<int>();
          const arr2 = [] as Array<int>;
          for (let i = 0; i < 100; i++) {
            arr1.push(i);
            arr2.push(i + 100);
          }
          const start = Date.now();
          const newArr = arr1.concat(arr2);
          const end = Date.now();
          expect(newArr.length).assertEqual(200);
          expect(end - start).assertLess(5000);


      }
      {
          let arr = new SparseArray<int>();
          arr.push(1);
          const start = Date.now();
          for (let i = 2; i <= 100; i++) {
            arr = arr.concat([i] as Array<int>);
          }
          const end = Date.now();
          expect(arr.length).assertEqual(100);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0400
     * @tc.name testDeriveConcatNormal004
     * @tc.desc Test SparseArray.concat method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveConcatNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const concatArr = arr1.concat(arr2);
          const fromArr = new SparseArray<int>(1, 2, 3, 4);
          expect(concatArr.length).assertEqual(fromArr.length);
          expect(concatArr.toString()).assertEqual(fromArr.toString());


      }
      {
          const arr1 = new SparseArray<byte>(10 as byte, 20 as byte);
          const arr2 = [30 as byte, 40 as byte] as Array<byte>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(10 as byte);
          expect(result[3]).assertEqual(40 as byte);

      }
      {
          const s1 = new Set<int>([1, 2]);
          const s2 = new Set<int>([3]);
          const arr1 = new SparseArray<Set<int>>();
          arr1.push(s1);
          const arr2 = [s2] as Array<Set<int>>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(2);
          expect(result[0]!.size).assertEqual(2);
          expect(result[1]!.size).assertEqual(1);

      }
      {
          const inner = new SparseArray<int>();
          const outer = new SparseArray<SparseArray<int>>();
          outer.push(inner);
          const tailInner = new SparseArray<int>();
          tailInner[0] = 9;
          const tail = [tailInner] as Array<SparseArray<int>>;
          const result = outer.concat(tail);
          expect(result.length).assertEqual(2);
          expect(result[0]!.length).assertEqual(0);
          expect(result[1]![0]).assertEqual(9);

      }
      {
          const base = new SparseArray<int>(1, 2);
          const tail = [0xFF] as Array<int>;
          const result = base.concat(tail);
          expect(result.length).assertEqual(3);
          expect(result[2]).assertEqual(0xFF);

      }
      {
          const arr1 = new SparseArray<short>(10 as short, 20 as short);
          const arr2 = [30 as short, 40 as short] as Array<short>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(10 as short);
          expect(result[3]).assertEqual(40 as short);

      }
      {
          const arr1 = new SparseArray<long>(100 as long, 200 as long);
          const arr2 = [300 as long, 400 as long] as Array<long>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(100 as long);
          expect(result[3]).assertEqual(400 as long);

      }
      {
          const arr1 = new SparseArray<float>(1.0f, 2.5f);
          const arr2 = [3.5f, 4.5f] as Array<float>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(1.0f);
          expect(result[3]).assertEqual(4.5f);

      }
      {
          const arr1 = new SparseArray<double>(1.1, 2.2);
          const arr2 = [3.3, 4.4] as Array<double>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(1.1);
          expect(result[3]).assertEqual(4.4);

      }
      {
          const arr1 = new SparseArray<number>(1.5, 2.5);
          const arr2 = [3.5, 4.5] as Array<number>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(1.5);
          expect(result[3]).assertEqual(4.5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0500
     * @tc.name testDeriveConcatNormal005
     * @tc.desc Test SparseArray.concat method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveConcatNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr1 = new SparseArray<boolean>(true, false);
          const arr2 = [false, true] as Array<boolean>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(true);
          expect(result[3]).assertEqual(true);

      }
      {
          const arr1 = new SparseArray<char>(c'A', c'B');
          const arr2 = [c'C', c'D'] as Array<char>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(c'A');
          expect(result[3]).assertEqual(c'D');

      }
      {
          const arr1 = new SparseArray<ConcatColor045>(ConcatColor045.Red, ConcatColor045.Green);
          const arr2 = [ConcatColor045.Blue] as Array<ConcatColor045>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(3);
          expect(result[0]).assertEqual(ConcatColor045.Red);
          expect(result[2]).assertEqual(ConcatColor045.Blue);

      }
      {
          const first: ConcatProfile046 = { id: 1, name: "Alice" };
          const second: ConcatProfile046 = { id: 2, name: "Bob" };
          const arr1 = new SparseArray<ConcatProfile046>(first);
          const arr2 = [second] as Array<ConcatProfile046>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(2);
          expect(result[0]!.name).assertEqual("Alice");
          expect(result[1]!.id).assertEqual(2);

      }
      {
          const first = new Map<string, int>();
          first.set("id", 1);
          const second = new Map<string, int>();
          second.set("id", 2);
          const arr1 = new SparseArray<Map<string, int>>(first);
          const arr2 = [second] as Array<Map<string, int>>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(2);
          expect(result[0]!.get("id")).assertEqual(1);
          expect(result[1]!.get("id")).assertEqual(2);

      }
      {
          const first = [1, 2] as Array<int>;
          const second = [3, 4] as Array<int>;
          const arr1 = new SparseArray<Array<int>>(first);
          const arr2 = [second] as Array<Array<int>>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(2);
          expect(result[0]![1]).assertEqual(2);
          expect(result[1]![0]).assertEqual(3);

      }
      {
          const arr1 = new SparseArray<int | null>(1, null);
          const arr2 = [2, null] as Array<int | null>;
          const result = arr1.concat(arr2);
          expect(result.length).assertEqual(4);
          expect(result[0]).assertEqual(1);
          expect(result[1]).assertNull();
          expect(result[3]).assertNull();

      }
      {
        // 1. concat([]) on (1,2,3) -> length 3, [0]=1
        const arr1 = new SparseArray<int>(1, 2, 3);
        const item1: Array<int> = [];
        const result1 = arr1.concat(item1);
        expect(result1.length).assertEqual(3);
        expect(result1[0]).assertEqual(1);
        // 2. concat([0,99,0]) on (1,2) -> length 5, [0..4]=1,2,0,99,0
        const arr2 = new SparseArray<int>(1, 2);
        const item2: Array<int> = [0, 99, 0];
        const result2 = arr2.concat(item2);
        expect(result2.length).assertEqual(5);
        expect(result2[0]).assertEqual(1);
        expect(result2[1]).assertEqual(2);
        expect(result2[2]).assertEqual(0);
        expect(result2[3]).assertEqual(99);
        expect(result2[4]).assertEqual(0);
        // 3. concat([2147483647]) on (1) -> length 2, [1]=2147483647
        const arr3 = new SparseArray<int>(1);
        const item3: Array<int> = [2147483647];
        const result3 = arr3.concat(item3);
        expect(result3.length).assertEqual(2);
        expect(result3[1]).assertEqual(2147483647);
        // 4. concat([20]) on sparse src [0]=10 (len 2) -> length 3, [0]=10, [1]=hole, [2]=20
        const arr4 = new SparseArray<int>(2);
        arr4[0] = 10;
        const item4: Array<int> = [20];
        const result4 = arr4.concat(item4);
        expect(result4.length).assertEqual(3);
        expect(result4[0]).assertEqual(10);
        expect(result4[1]).assertUndefined();
        expect(result4[2]).assertEqual(20);
        // 5. concat(len-100 Array<int> with 999@50) on [0]=1 -> length 101, [0]=1, [51]=999, [52]=0
        const arr5 = new SparseArray<int>();
        arr5[0] = 1;
        const item5: Array<int> = Array.create<int>(100, 0);
        item5[50] = 999;
        const result5 = arr5.concat(item5);
        expect(result5.length).assertEqual(101);
        expect(result5[0]).assertEqual(1);
        expect(result5[51]).assertEqual(999);
        expect(result5[52]).assertEqual(0);
        // 6. concat([10,20]) on empty src -> length 2, [0]=10, [1]=20
        const arr6 = new SparseArray<int>();
        const item6: Array<int> = [10, 20];
        const result6 = arr6.concat(item6);
        expect(result6.length).assertEqual(2);
        expect(result6[0]).assertEqual(10);
        expect(result6[1]).assertEqual(20);
        // 7. concat([BigInt('99999999999999999999')]) on (1n) -> length 2
        const arr7 = new SparseArray<bigint>(1n);
        const item7: Array<bigint> = [BigInt('99999999999999999999')];
        const result7 = arr7.concat(item7);
        expect(result7.length).assertEqual(2);
        // 8. concat([2048-char 'x...']) on ('start') -> length 2, [1].length=2048
        let longStr8: string = 'x';
        for (let i: int = 0; i < 11; i++) {
          longStr8 = longStr8 + longStr8;
        }
        const arr8 = new SparseArray<string>('start');
        const item8: Array<string> = [longStr8];
        const result8 = arr8.concat(item8);
        expect(result8.length).assertEqual(2);
        expect(result8[1]!.length).assertEqual(2048);
        // 9. concat(shared).concat(shared) on [0]=1 with shared=[99] -> length 3, [0..2]=1,99,99
        const arr9 = new SparseArray<int>();
        arr9[0] = 1;
        const shared9: Array<int> = [99];
        const result9 = arr9.concat(shared9).concat(shared9);
        expect(result9.length).assertEqual(3);
        expect(result9[0]).assertEqual(1);
        expect(result9[1]).assertEqual(99);
        expect(result9[2]).assertEqual(99);
        // 10. concat([10]) then item[0]=999 -> result[1] stays 10 (independence)
        const arr10 = new SparseArray<int>(1);
        const item10: Array<int> = [10];
        const result10 = arr10.concat(item10);
        item10[0] = 999;
        expect(result10.length).assertEqual(2);
        expect(result10[1]).assertEqual(10);

      }
      {
        // 1. concat(['hello']) on ('a') -> length 2, [1]='hello'
        const arr1 = new SparseArray<string>('a');
        const item1: Array<string> = ['hello'];
        const result1 = arr1.concat(item1);
        expect(result1.length).assertEqual(2);
        expect(result1[1]).assertEqual('hello');
        // 2. concat([true,false]) on (false) -> length 3, [0..2]=false,true,false
        const arr2 = new SparseArray<boolean>(false);
        const item2: Array<boolean> = [true, false];
        const result2 = arr2.concat(item2);
        expect(result2.length).assertEqual(3);
        expect(result2[0]).assertFalse();
        expect(result2[1]).assertTrue();
        expect(result2[2]).assertFalse();
        // 3. concat([NaN]) on (1.0) -> length 2, isNaN([1])
        const arr3 = new SparseArray<double>(1.0);
        const item3: Array<double> = [Number.NaN];
        const result3 = arr3.concat(item3);
        expect(result3.length).assertEqual(2);
        const value3 = result3[1];
        expect(value3 === undefined).assertFalse();
        expect(isNaN(value3!)).assertTrue();
        // 4. concat([+Infinity]) on (1.0) -> length 2, [1]=+Infinity
        const arr4 = new SparseArray<double>(1.0);
        const item4: Array<double> = [Number.POSITIVE_INFINITY];
        const result4 = arr4.concat(item4);
        expect(result4.length).assertEqual(2);
        expect(result4[1]).assertEqual(Number.POSITIVE_INFINITY);
        // 5. concat([-0.0]) on (0.0) -> length 2, [0]=0.0, [1]=-0.0
        const arr5 = new SparseArray<double>(0.0);
        const item5: Array<double> = [-0.0];
        const result5 = arr5.concat(item5);
        expect(result5.length).assertEqual(2);
        expect(result5[0]).assertEqual(0.0);
        expect(result5[1]).assertEqual(-0.0);
        // 6. concat([MAX_VALUE]) on (1.0) -> length 2
        const arr6 = new SparseArray<double>(1.0);
        const item6: Array<double> = [Number.MAX_VALUE];
        const result6 = arr6.concat(item6);
        expect(result6.length).assertEqual(2);
        // 7. concat([127,-128]) on (0x01) byte -> length 3, [1]=127, [2]=-128
        const arr7 = new SparseArray<byte>(0x01);
        const item7: Array<byte> = [127, -128];
        const result7 = arr7.concat(item7);
        expect(result7.length).assertEqual(3);
        expect(result7[1]).assertEqual(127);
        expect(result7[2]).assertEqual(-128);
        // 8. concat([c'Z']) on (c'A') char -> length 2, [0]=A, [1]=Z
        const arr8 = new SparseArray<char>(c'A');
        const item8: Array<char> = [c'Z'];
        const result8 = arr8.concat(item8);
        expect(result8.length).assertEqual(2);
        expect(result8[0]!).assertEqual(c'A');
        expect(result8[1]!).assertEqual(c'Z');

      }
      {
        // 1. concat([Date(1000)]) on (Date(0)) -> length 2, [1].getTime()=1000
        const dateB: Date = new Date(1000);
        const arr1 = new SparseArray<Date>(new Date(0));
        const item1: Array<Date> = [dateB];
        const result1 = arr1.concat(item1);
        expect(result1.length).assertEqual(2);
        const appendedDate1 = result1[1];
        expect(appendedDate1 === undefined).assertFalse();
        expect(appendedDate1!.getTime()).assertEqual(1000);
        // 2. concat([/abc/]) on (/def/) RegExp -> length 2, [1].source='abc'
        const re2: RegExp = new RegExp('abc');
        const arr2 = new SparseArray<RegExp>(new RegExp('def'));
        const item2: Array<RegExp> = [re2];
        const result2 = arr2.concat(item2);
        expect(result2.length).assertEqual(2);
        const appendedPattern2 = result2[1];
        expect(appendedPattern2 === undefined).assertFalse();
        expect(appendedPattern2!.source).assertEqual('abc');
        // 3. concat([{id:42}]) on ({id:1}) interface -> length 2, [1].id=42
        const o3: SparseArrayConcatPart01Object = { id: 42 };
        const arr3 = new SparseArray<SparseArrayConcatPart01Object>({ id: 1 });
        const item3: Array<SparseArrayConcatPart01Object> = [o3];
        const result3 = arr3.concat(item3);
        expect(result3.length).assertEqual(2);
        const appendedObject3 = result3[1];
        expect(appendedObject3 === undefined).assertFalse();
        expect(appendedObject3!.id).assertEqual(42);
        // 4. concat([inner(10,20)]) on ((1)) nested SparseArray<int> -> length 2, [1].length=2, [1][0..1]=10,20
        const inner4 = new SparseArray<int>(10, 20);
        const arr4 = new SparseArray<SparseArray<int>>(new SparseArray<int>(1));
        const item4: Array<SparseArray<int>> = [inner4];
        const result4 = arr4.concat(item4);
        expect(result4.length).assertEqual(2);
        expect(result4[1]!.length).assertEqual(2);
        expect(result4[1]![0]).assertEqual(10);
        expect(result4[1]![1]).assertEqual(20);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0600
     * @tc.name testDeriveConcatError001
     * @tc.desc Test SparseArray.concat method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveConcatError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr1 = new SparseArray<int>(1, 2);
          try {
            arr1.concat((null as Object as Array<int>));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          try {
            arr1.concat(("invalid" as Object as Array<int>));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0700
     * @tc.name testDeriveSliceNormal001
     * @tc.desc Test SparseArray.slice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveSliceNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice();
          expect(result!.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.slice(1);
          expect(result.toString()).assertEqual("2,3,4");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.slice(1, 3);
          expect(result.toString()).assertEqual("2,3");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.slice(2);
          expect(result.toString()).assertEqual("3,4,5");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice(0, 2);
          expect(result.toString()).assertEqual("1,2");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice(10);
          expect(result!.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice(1, 1);
          expect(result!.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.slice(3, 1);
          expect(result.toString()).assertEqual("");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.slice(1, 4);
          expect(result.toString()).assertEqual("2,3,4");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.slice(2);
          expect(result.toString()).assertEqual("3,4");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0800
     * @tc.name testDeriveSliceNormal002
     * @tc.desc Test SparseArray.slice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveSliceNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          const result = arr.slice(0, 5);
          expect(result.toString()).assertEqual("1,,3,,5");


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          const result = arr.slice(1, 4);
          expect(result.toString()).assertEqual(",3,");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.slice(1, 3);
          expect(result instanceof SparseArray).assertTrue();
          expect(result.toString()).assertEqual("2,3");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.slice(1, 3);
          expect(arr.toString()).assertEqual("1,2,3,4");
          expect(arr.length).assertEqual(4);


      }
      {
        const arr = new SparseArray<Test015>();
          const obj1 = new Test015();
          obj1.value = 1;
          arr.push(obj1);
          const result = arr.slice();
          const r0 = result[0];
          expect(r0 != null).assertTrue();
          (r0 as Test015).value = 2;
          const a0 = arr[0];
          expect(a0 != null).assertTrue();
          expect((a0 as Test015).value).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice(3, 1);
          expect(result!.length).assertEqual(0);
          expect(result.toString()).assertEqual("");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result1 = arr.slice();
          const result2 = arr.slice(0, arr.length);
          expect(result1.toString()).assertEqual(arr.toString());
          expect(result2.toString()).assertEqual(arr.toString());


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice(1, 2);
          expect(result instanceof SparseArray).assertTrue();
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual(2);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.slice(0, 2);
          const firstOpt = result[0];
          expect(firstOpt != null).assertTrue();
          expect(firstOpt as string).assertEqual("a");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result1 = arr.slice(-3, -1);
          expect(result1.toString()).assertEqual("3,4");
          const result2 = arr.slice(-10, 10);
          expect(result2.toString()).assertEqual("1,2,3,4,5");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_0900
     * @tc.name testDeriveSliceNormal003
     * @tc.desc Test SparseArray.slice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveSliceNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice(1);
          expect(result.toString()).assertEqual("2,3");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice(1, arr.length);
          expect(result.toString()).assertEqual("2,3");


      }
      {
          const arr = new SparseArray<number>(1.5, 2.5, 3.5);
          const result = arr.slice(1, 3);
          expect(result.toString()).assertEqual("2.5,3.5");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c", "d");
          const result = arr.slice(1, 3);
          expect(result.toString()).assertEqual("b,c");


      }
      {
          const arr = new SparseArray<Test026>();
          arr.push(new Test026());
          arr.push(new Test026());
          const result = arr.slice(0, 2);
          expect(result!.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int | string>(1, "a", 2, "b");
          const result = arr.slice(1, 3);
          expect(result.toString()).assertEqual("a,2");


      }
      {
          const arr = new SparseArray<int>(5);
          const result1 = arr.slice();
          expect(result1.toString()).assertEqual(",,,,");
          const result2 = arr.slice(0, 1);
          expect(result2.toString()).assertEqual("");
          const result3 = arr.slice(1);
          expect(result3.length).assertEqual(4);
          expect(result3.toString()).assertEqual(",,,");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.slice(0, 2147483647);
          expect(result.toString()).assertEqual("1,2,3");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result1 = arr.slice(0, 5);
          const result2 = result1.slice(1, 4);
          const result3 = result2.slice(0, 2);
          expect(result3.toString()).assertEqual("2,3");


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 10000; i++) {
            arr.push(i);
          }
          const result = arr.slice(1000, 9000);
          expect(result!.length).assertEqual(8000);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1000
     * @tc.name testDeriveSliceNormal004
     * @tc.desc Test SparseArray.slice method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveSliceNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          for (let i = 0; i < 100; i++) {
            const result = arr.slice(1, 4);
            expect(result.toString()).assertEqual("2,3,4");
          }

      }
      {
          const arr = new SparseArray<long>(10000000000 as long, 20000000000 as long, 30000000000 as long);
          const result = arr.slice(1, 3);
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertEqual(20000000000 as long);
          expect(result![1]).assertEqual(30000000000 as long);

      }
      {
          const arr = new SparseArray<int>(0, 1, 2, 3, 4, 5);
          const result = arr.slice(0x1, 0b100);
          expect(result!.length).assertEqual(3);
          expect(result![0]).assertEqual(1);
          expect(result![2]).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const part = arr.slice(0, -1);
          expect(part.length).assertEqual(2);
          expect(part[1]).assertEqual(2);

      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          const result = arr.slice(1, 3);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertFalse();
          expect(result[1]).assertTrue();

      }
      {
          const arr = new SparseArray<byte>(0 as byte, (-128 as byte), 127 as byte);
          const result = arr.slice(1);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(-128 as byte);
          expect(result[1]).assertEqual(127 as byte);

      }
      {
          const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
          const result = arr.slice(0, 2);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(10 as short);
          expect(result[1]).assertEqual(20 as short);

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
          const result = arr.slice(1, 3);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(2.5f);
          expect(result[1]).assertEqual(3.0f);

      }
      {
          const arr = new SparseArray<double>(1.25, 2.5, 3.75);
          const result = arr.slice(0, 2);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(1.25);
          expect(result[1]).assertEqual(2.5);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          const result = arr.slice(1);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(c'B');
          expect(result[1]).assertEqual(c'C');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1100
     * @tc.name testDeriveSliceError001
     * @tc.desc Test SparseArray.slice method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveSliceError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            const result = arr.slice((null as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1200
     * @tc.name testDeriveJoinNormal001
     * @tc.desc Test SparseArray.join method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveJoinNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.join();
          expect(result).assertEqual("a,b,c");


      }
      {
          const arr = new SparseArray<int>(4, 5, 3);
          const result = arr.join();
          expect(result).assertEqual("4,5,3");

      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.join("");
          expect(result).assertEqual("abc");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.join("😀");
          expect(result).assertEqual("a😀b😀c");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.join("\u200B");
          expect(result).assertEqual("a\u200Bb\u200Bc");


      }
      {
          const arr = new SparseArray<string>("a", "b");
          const longSep = "x".repeat(10000);
          const result = arr.join(longSep);
          expect(result!.length).assertEqual(2 + 10000);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.join("\n\t");
          expect(result).assertEqual("a\n\tb\n\tc");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.join("分隔");
          expect(result).assertEqual("a分隔b分隔c");


      }
      {
          const arr = new SparseArray<string>("a", "b");
          const sep = "-";
          const result = arr.join(`${sep}${sep}`);
          expect(result).assertEqual("a--b");


      }
      {
          const arr = new SparseArray<string>("a", "b");
          const result = arr.join("\udc04");
          expect(result !== null && result !== undefined).assertTrue();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1300
     * @tc.name testDeriveJoinNormal002
     * @tc.desc Test SparseArray.join method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveJoinNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>("a", "b");
          const result = arr.join("<script>alert(1)</script>");
          expect(result).assertEqual("a<script>alert(1)</script>b");


      }
      {
          const arr = new SparseArray<string>();
          const result = arr.join("-");
          expect(result).assertEqual("");


      }
      {
          const arr = new SparseArray<string>(3);
          const result = arr.join("-");
          expect(result).assertEqual("--");


      }
      {
          const arr = new SparseArray<string>(3);
          arr[1] = "b";
          const result = arr.join("-");
          expect(result).assertEqual("-b-");


      }
      {
          const arr = new SparseArray<string>(2);
          arr[0] = "a";
          const result = arr.join("-");
          expect(result).assertEqual("a-");


      }
      {
          const arr = new SparseArray<string>();
          arr.push("a", "b", "c", "d");
          const result = arr.join(",");
          expect(result).assertEqual("a,b,c,d");


      }
      {
          const arr = new SparseArray<string>(5);
          arr[0] = "a";
          arr[2] = "c";
          arr[4] = "e";
          const result = arr.join("-");
          expect(result).assertEqual("a--c--e");


      }
      {
          const arr = new SparseArray<int>(2, 4, 4);
          const result = arr.join("-");
          expect(result).assertEqual("2-4-4");

      }
      {
          const arr = new SparseArray<int>(3, 5, 5);
          const result = arr.join("|");
          expect(result).assertEqual("3|5|5");

      }
      {
          const arr = new SparseArray<string>("only");
          const result = arr.join("-");
          expect(result).assertEqual("only");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1400
     * @tc.name testDeriveJoinNormal003
     * @tc.desc Test SparseArray.join method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveJoinNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>(3);
          arr[0] = "a";
          arr[2] = "c";
          const result = arr.join(",");
          expect(result).assertEqual("a,,c");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.join("-");
          expect(typeof result).assertEqual("string");
          expect(result!.length).assertEqual(5);
          expect(result).assertEqual("a-b-c");


      }
      {
          const arr = new SparseArray<string>();
          for (let i = 0; i < 10000; i++) {
            arr.push(i.toString());
          }
          const result = arr.join(",");
          expect(result.split(",").length).assertEqual(10000);


      }
      {
          const arr = new SparseArray<string>();
          const longStr = "x".repeat(10000);
          arr.push(longStr, longStr);
          const result = arr.join("-");
          expect(result!.length).assertEqual(20001);


      }
      {
          const arr = new SparseArray<string>("a\nb", "c\td", "e\rf");
          const result = arr.join("|");
          expect(result).assertEqual("a\nb|c\td|e\rf");


      }
      {
          const arr = new SparseArray<string>("中文", "日本語", "한글");
          const result = arr.join("-");
          expect(result).assertEqual("中文-日本語-한글");


      }
      {
          const arr = new SparseArray<string>("a", "b");
          arr.push("c");
          const result = arr.join("-");
          expect(result).assertEqual("a-b-c");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          arr.pop();
          const result = arr.join("-");
          expect(result).assertEqual("a-b");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          arr.length = 0;
          const result = arr.join("-");
          expect(result).assertEqual("");


      }
      {
          const arr = new SparseArray<string>("\u200B", "\t", "a");
          const result = arr.join("|");
          expect(result).assertEqual("\u200B|\t|a");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1500
     * @tc.name testDeriveJoinNormal004
     * @tc.desc Test SparseArray.join method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveJoinNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
          const result = arr.join("-");
          expect(result).assertEqual("10-20-30");

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
          const result = arr.join("|");
          expect(result).assertEqual("1|2.5|3");

      }
      {
          const longElem = "z".repeat(65535);
          const arr = new SparseArray<string>("a", longElem);
          const result = arr.join(",");
          expect(result.startsWith("a,")).assertTrue();
          expect(result.length).assertEqual(1 + 65535 + 1);

      }
      {
          const arr = new SparseArray<string>("13800138000", "user@test.com", "110101199001011234");
          const result = arr.join("|");
          expect(result).assertEqual("13800138000|user@test.com|110101199001011234");

      }
      {
          const arr = new SparseArray<string | undefined>("a", undefined, "c");
          const result = arr.join(",");
          expect(result.indexOf("a")).assertEqual(0);
          expect(result.indexOf("c")).assertLarger(0);

      }
      {
          const arr = new SparseArray<int>(0, 1, 2, 3, 4, 5);
          const joined = arr.join("\u4e2d");
          expect(joined).assertEqual("0\u4e2d1\u4e2d2\u4e2d3\u4e2d4\u4e2d5");

      }
      {
          const chunk = "j".repeat(8192);
          const arr = new SparseArray<string>("head", chunk);
          const result = arr.join("|");
          expect(result.startsWith("head|")).assertTrue();
          expect(result.length).assertEqual(5 + 8192);

      }
      {
          const chunk = "L".repeat(131072);
          const arr = new SparseArray<string>(chunk);
          const result = arr.join(",");
          expect(result.length).assertEqual(131072);

      }
      {
        // 1. join() on int (101,202,303) default comma -> '101,202,303'
        const arr1 = new SparseArray<int>(101, 202, 303);
        expect(arr1.join()).assertEqual('101,202,303');
        // 2. join() on string ('alpha','beta','gamma') default comma -> 'alpha,beta,gamma'
        const arr2 = new SparseArray<string>('alpha', 'beta', 'gamma');
        expect(arr2.join()).assertEqual('alpha,beta,gamma');
        // 3. join() on int (3) all-hole default comma -> ',,'
        const arr3 = new SparseArray<int>(3);
        expect(arr3.join()).assertEqual(',,');

      }
      {
        // 1. join('-') on int (101,202,303) -> '101-202-303'
        const arr1 = new SparseArray<int>(101, 202, 303);
        expect(arr1.join('-')).assertEqual('101-202-303');
        // 2. join('') on string ('alpha','beta') -> 'alphabeta'
        const arr2 = new SparseArray<string>('alpha', 'beta');
        expect(arr2.join('')).assertEqual('alphabeta');
        // 3. join('') on int (101,202,303) -> '101202303'
        const arr3 = new SparseArray<int>(101, 202, 303);
        expect(arr3.join('')).assertEqual('101202303');
        // 4. join('') on boolean (true,false,true) -> 'truefalsetrue'
        const arr4 = new SparseArray<boolean>(true, false, true);
        expect(arr4.join('')).assertEqual('truefalsetrue');
        // 5. join('') on bigint (50n,100n,150n) -> '50100150'
        const arr5 = new SparseArray<bigint>(50n, 100n, 150n);
        expect(arr5.join('')).assertEqual('50100150');
        // 6. join('|') on int (101,202,303) -> '101|202|303'
        const arr6 = new SparseArray<int>(101, 202, 303);
        expect(arr6.join('|')).assertEqual('101|202|303');
        // 7. join(' ') on int (101,202,303) -> '101 202 303'
        const arr7 = new SparseArray<int>(101, 202, 303);
        expect(arr7.join(' ')).assertEqual('101 202 303');
        // 8. join('::') on int (101,202,303) -> '101::202::303'
        const arr8 = new SparseArray<int>(101, 202, 303);
        expect(arr8.join('::')).assertEqual('101::202::303');
        // 9. join('\t') on int (101,202,303) -> '101\t202\t303'
        const arr9 = new SparseArray<int>(101, 202, 303);
        expect(arr9.join('\t')).assertEqual('101\t202\t303');
        // 10. join('\t \n') on int (101,202,303) -> '101\t \n202\t \n303'
        const arr10 = new SparseArray<int>(101, 202, 303);
        expect(arr10.join('\t \n')).assertEqual('101\t \n202\t \n303');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1600
     * @tc.name testDeriveJoinNormal005
     * @tc.desc Test SparseArray.join method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveJoinNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. join('\0') on int (101,202,303) -> '101\0' + '202\0' + '303'
        const arr1 = new SparseArray<int>(101, 202, 303);
        expect(arr1.join('\0')).assertEqual('101' + '\0' + '202' + '\0' + '303');
        // 2. join('中文') on int (101,202,303) -> '101中文202中文303'
        const arr2 = new SparseArray<int>(101, 202, 303);
        expect(arr2.join('中文')).assertEqual('101中文202中文303');
        // 3. join('⭐') on int (101,202,303) -> '101⭐202⭐303'
        const arr3 = new SparseArray<int>(101, 202, 303);
        expect(arr3.join('⭐')).assertEqual('101⭐202⭐303');
        // 4. join('分隔符') on int (101,202,303) -> '101分隔符202分隔符303'
        const arr4 = new SparseArray<int>(101, 202, 303);
        expect(arr4.join('分隔符')).assertEqual('101分隔符202分隔符303');
        // 5. join('😀') on int (101,202,303) -> '101😀202😀303'
        const arr5 = new SparseArray<int>(101, 202, 303);
        expect(arr5.join('😀')).assertEqual('101😀202😀303');
        // 6. join('<script>alert(1)</script>') on int (101,202,303) -> '101<script>alert(1)</script>202<script>alert(1)</script>303'
        const arr6 = new SparseArray<int>(101, 202, 303);
        expect(arr6.join('<script>alert(1)</script>')).assertEqual('101<script>alert(1)</script>202<script>alert(1)</script>303');
        // 7. join(longSep) on int (101,202) -> '101' + longSep + '202'
        const longSep7: string =
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        const arr7 = new SparseArray<int>(101, 202);
        expect(arr7.join(longSep7)).assertEqual('101' + longSep7 + '202');
        // 8. join('0') on int (101,202,303) -> '10102020303'
        const arr8 = new SparseArray<int>(101, 202, 303);
        expect(arr8.join('0')).assertEqual('10102020303');
        // 9. join('$.^') on int (101,202,303) -> '101$.^202$.^303'
        const arr9 = new SparseArray<int>(101, 202, 303);
        expect(arr9.join('$.^')).assertEqual('101$.^202$.^303');
        // 10. join('\\d\\w') on int (101,202,303) -> '101\\d\\w202\\d\\w303'
        const arr10 = new SparseArray<int>(101, 202, 303);
        expect(arr10.join('\\d\\w')).assertEqual('101\\d\\w202\\d\\w303');

      }
      {
        // 1. join('-') on int 4 sparse@{2,3} -> '--303-404'
        const arr1 = new SparseArray<int>(4);
        arr1[2] = 303;
        arr1[3] = 404;
        expect(arr1.join('-')).assertEqual('--303-404');
        // 2. join('') on int 4 sparse@{2,3} -> '303404'
        const arr2 = new SparseArray<int>(4);
        arr2[2] = 303;
        arr2[3] = 404;
        expect(arr2.join('')).assertEqual('303404');
        // 3. join('|') on int 3 sparse@{0,2} -> '101||303'
        const arr3 = new SparseArray<int>(3);
        arr3[0] = 101;
        arr3[2] = 303;
        expect(arr3.join('|')).assertEqual('101||303');
        // 4. join('::') on int 4 sparse@{1,3} -> '::202::::404'
        const arr4 = new SparseArray<int>(4);
        arr4[1] = 202;
        arr4[3] = 404;
        expect(arr4.join('::')).assertEqual('::202::::404');
        // 5. join('\n') on int 3 sparse@{1} -> '\n202\n'
        const arr5 = new SparseArray<int>(3);
        arr5[1] = 202;
        expect(arr5.join('\n')).assertEqual('\n202\n');
        // 6. join(zero-width) on int 3 sparse@{0,2} -> '101' + '​' + '​' + '303'
        const arr6 = new SparseArray<int>(3);
        arr6[0] = 101;
        arr6[2] = 303;
        expect(arr6.join('​')).assertEqual('101' + '​' + '​' + '303');
        // 7. join('\0') on int 3 sparse@{0,2} -> '101' + '\0' + '\0' + '303'
        const arr7 = new SparseArray<int>(3);
        arr7[0] = 101;
        arr7[2] = 303;
        expect(arr7.join('\0')).assertEqual('101' + '\0' + '\0' + '303');
        // 8. join('⭐') on int 4 sparse@{2,3} -> '⭐⭐303⭐404'
        const arr8 = new SparseArray<int>(4);
        arr8[2] = 303;
        arr8[3] = 404;
        expect(arr8.join('⭐')).assertEqual('⭐⭐303⭐404');
        // 9. join('-') on string ('alpha','beta','gamma') -> 'alpha-beta-gamma'
        const arr9 = new SparseArray<string>('alpha', 'beta', 'gamma');
        expect(arr9.join('-')).assertEqual('alpha-beta-gamma');
        // 10. join('::') on bigint (50n,100n,150n) -> '50::100::150'
        const arr10 = new SparseArray<bigint>(50n, 100n, 150n);
        expect(arr10.join('::')).assertEqual('50::100::150');

      }
      {
        // 1. join('|') on number (1.5,2.5,3.5) -> '1.5|2.5|3.5'
        const arr1 = new SparseArray<number>(1.5, 2.5, 3.5);
        expect(arr1.join('|')).assertEqual('1.5|2.5|3.5');
        // 2. join('\t') on boolean (true,false) -> 'true\tfalse'
        const arr2 = new SparseArray<boolean>(true, false);
        expect(arr2.join('\t')).assertEqual('true\tfalse');
        // 3. join('---') on int single (77) -> '77'
        const arr3 = SparseArray.of<int>(77);
        expect(arr3.join('---')).assertEqual('77');
        // 4. join('') on string single ('solo') -> 'solo'
        const arr4 = new SparseArray<string>('solo');
        expect(arr4.join('')).assertEqual('solo');
        // 5. join('-') on int empty -> ''
        const arr5 = new SparseArray<int>();
        expect(arr5.join('-')).assertEqual('');
        // 6. join('') on int empty -> ''
        const arr6 = new SparseArray<int>();
        expect(arr6.join('')).assertEqual('');
        // 7. join('-') on string ('ab-cd','ef-gh') -> 'ab-cd-ef-gh'
        const arr7 = new SparseArray<string>('ab-cd', 'ef-gh');
        expect(arr7.join('-')).assertEqual('ab-cd-ef-gh');
        // 8. join('|') on string ('a|b','c|d') -> 'a|b|c|d'
        const arr8 = new SparseArray<string>('a|b', 'c|d');
        expect(arr8.join('|')).assertEqual('a|b|c|d');
        // 9. join('::') on string ('a::b','c::d') -> 'a::b::c::d'
        const arr9 = new SparseArray<string>('a::b', 'c::d');
        expect(arr9.join('::')).assertEqual('a::b::c::d');
        // 10. join(',') on string ('x,y','z,w') -> 'x,y,z,w'
        const arr10 = new SparseArray<string>('x,y', 'z,w');
        expect(arr10.join(',')).assertEqual('x,y,z,w');

      }
      {
        // 1. join() on empty array -> ''
        const arr1 = new SparseArray<int>();
        expect(arr1.join()).assertEqual('');
        // 2. join() on sparse {0:10,3:40} -> '10,,,40'
        const arr2 = new SparseArray<int>(4);
        arr2[0] = 10;
        arr2[3] = 40;
        expect(arr2.join()).assertEqual('10,,,40');
        // 3. join() on ('hello','world') -> 'hello,world'
        const arr3 = new SparseArray<string>('hello', 'world');
        expect(arr3.join()).assertEqual('hello,world');
        // 4. join() on (1,2,3) -> '1,2,3'
        const arr4 = new SparseArray<int>(1, 2, 3);
        expect(arr4.join()).assertEqual('1,2,3');
        // 5. join() on (false,false) -> 'false,false'
        const arr5 = new SparseArray<boolean>(false, false);
        expect(arr5.join()).assertEqual('false,false');
        // 6. join() on (Infinity,5.5) -> 'Infinity,5.5'
        const arr6 = new SparseArray<double>(Double.POSITIVE_INFINITY, 5.5);
        expect(arr6.join()).assertEqual('Infinity,5.5');
        // 7. join('') on sparse {0:1} -> '1'
        const arr7 = new SparseArray<int>(2);
        arr7[0] = 1;
        expect(arr7.join('')).assertEqual('1');
        // 8. join(',') explicit == join() implicit on (4,5) -> '4,5'
        const arr8 = new SparseArray<int>(4, 5);
        expect(arr8.join(',')).assertEqual('4,5');
        expect(arr8.join()).assertEqual('4,5');
        // 9. join('-') leaves source unmodified on (1,2,3) -> '1-2-3' & length 3
        const arr9 = new SparseArray<int>(1, 2, 3);
        expect(arr9.join('-')).assertEqual('1-2-3');
        expect(arr9.length).assertEqual(3);
        expect(arr9[0]).assertEqual(1);
        expect(arr9[1]).assertEqual(2);
        expect(arr9[2]).assertEqual(3);
        // 10. join() trailing hole -> '1,' but explicit undefined element -> '1,undefined'
        const arr10 = new SparseArray<int>(2);
        arr10[0] = 1;
        expect(arr10.join()).assertEqual('1,');
        const arr10u = new SparseArray<int | undefined>(1, undefined);
        expect(arr10u.join()).assertEqual('1,undefined');

      }
      {
        // 1. join('::') on (5,7) -> '5::7'
        const arr1 = new SparseArray<int>(5, 7);
        expect(arr1.join('::')).assertEqual('5::7');
        // 2. join('::') on (100,20,3) -> '100::20::3'
        const arr2 = new SparseArray<int>(100, 20, 3);
        expect(arr2.join('::')).assertEqual('100::20::3');
        // 3. join('|') on bigints (100n,200n) -> '100|200'
        const arr3 = new SparseArray<bigint>(100n, 200n);
        expect(arr3.join('|')).assertEqual('100|200');
        // 4. join('|') on two Dates -> toString|toString
        const arr4 = new SparseArray<Date>(new Date(0), new Date(1000));
        const exp4 = arr4[0]!.toString() + '|' + arr4[1]!.toString();
        expect(arr4.join('|')).assertEqual(exp4);
        // 5. join('') on (1,2) -> '12'
        const arr5 = new SparseArray<int>(1, 2);
        expect(arr5.join('')).assertEqual('12');
        // 6. join('\t') on (1,2,3) -> '1\t2\t3'
        const arr6 = new SparseArray<int>(1, 2, 3);
        expect(arr6.join('\t')).assertEqual('1\t2\t3');
        // 7. join() on two Dates -> toString,toString
        const arr7 = new SparseArray<Date>(new Date(0), new Date(1000));
        const exp7 = arr7[0]!.toString() + ',' + arr7[1]!.toString();
        expect(arr7.join()).assertEqual(exp7);
        // 8. join('::') on single element (7) -> '7'
        const arr8 = SparseArray.of<int>(7);
        expect(arr8.join('::')).assertEqual('7');
        // 9. join('::') on (10,20,30) -> '10::20::30' & result.length == 10
        const arr9 = new SparseArray<int>(10, 20, 30);
        const res9 = arr9.join('::');
        expect(res9).assertEqual('10::20::30');
        expect(res9.length).assertEqual(10);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1700
     * @tc.name testDeriveJoinError001
     * @tc.desc Test SparseArray.join method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveJoinError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>("a", "b");
          try {
            arr.join((null as Object as string));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<string>("a", "b");
          try {
            arr.join(undefined as string);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<string>("a", "b");
          try {
            arr.join((123 as Object as string));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1800
     * @tc.name testDeriveToStringNormal001
     * @tc.desc Test SparseArray.toString method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToStringNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          let result: string = arr.toString()
          expect(typeof result).assertEqual('string')

      }
      {
          const arr = new SparseArray<int>()
          expect(typeof arr.toString()).assertEqual('string')

      }
      {
          const arr = new SparseArray<int>()
          let result = arr.toString()
          expect(result).assertEqual('')

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          let result = arr.toString()
          expect(result).assertEqual('1,2,3')

      }
      {
          const arr = new SparseArray<int>(1)
          arr.push(1, 2, 3)
          let result = arr.toString()
          expect(result).assertEqual(',1,2,3')

      }
      {
          const arr = new SparseArray<int>(5)
          arr[1] = 10
          arr[3] = 30
          let result = arr.toString()
          expect(result).assertEqual(',10,,30,')

      }
      {
          const arr = new SparseArray<string>('a', 'b', 'c')
          let result = arr.toString()
          expect(result).assertEqual('a,b,c')

      }
      {
          const arr = new SparseArray<int>(3)
          arr[0] = 100
          arr[2] = 200
          let result = arr.toString()
          expect(result).assertEqual('100,,200')

      }
      {
          const arr = new SparseArray<int>(10)
          arr[0] = 1
          arr[9] = 10
          let result = arr.toString()
          expect(result).assertEqual('1,,,,,,,,,10')

      }
      {
          const arr = new SparseArray<int>()
          arr.push(42)
          let result = arr.toString()
          expect(result).assertEqual('42')

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_1900
     * @tc.name testDeriveToStringNormal002
     * @tc.desc Test SparseArray.toString method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToStringNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int | undefined>(1, 2, undefined)
          let result = arr.toString()
          expect(result).assertEqual('1,2,undefined')

      }
      {
          const arr = new SparseArray<int | null>(null, 1, null)
          let result = arr.toString()
          expect(result).assertEqual('null,1,null')

      }
      {
          const arr = new SparseArray<int>(0, 1, 0)
          let result = arr.toString()
          expect(result).assertEqual('0,1,0')

      }
      {
          const arr = new SparseArray<int>(-1, -2, 3)
          let result = arr.toString()
          expect(result).assertEqual('-1,-2,3')

      }
      {
          const arr = new SparseArray<string>('', 'hello', '')
          let result = arr.toString()
          expect(result).assertEqual(',hello,')

      }
      {
          const arr = new SparseArray<string>(',', 'test', 'a,b')
          let result = arr.toString()
          expect(result).assertEqual(',,test,a,b')

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          let result = arr.toString()
          expect(typeof result).assertEqual('string')

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          let result = arr.toString()
          expect(result!.length).assertLarger(0)
          expect(result.split(',').length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>(1000)
          for (let i = 0; i < 1000; i++) {
            arr[i] = i
          }
          let result = arr.toString()
          expect(result.split(',').length).assertEqual(1000)

      }
      {
          const arr = new SparseArray<int>(16)
          arr[0] = 1
          let result = arr.toString()
          expect(result.indexOf('1')).assertEqual(0)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2000
     * @tc.name testDeriveToStringNormal003
     * @tc.desc Test SparseArray.toString method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToStringNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10)
          let result = arr.toString()
          expect(result).assertEqual(',,,,,,,,,')

      }
      {
          const arr = new SparseArray<int>()
          expect(arr.length).assertEqual(0)
          let result = arr.toString()
          expect(result).assertEqual('')

      }
      {
          const arr = new SparseArray<int>(3, 5, 5);
          const result = arr.toString();
          expect(result).assertEqual("3,5,5");

      }
      {
          const arr = new SparseArray<int>(6, 3, 5);
          const result = arr.toString();
          expect(result).assertEqual("6,3,5");

      }
      {
          const arr = new SparseArray<int>(7, 4, 3);
          const result = arr.toString();
          expect(result).assertEqual("7,4,3");

      }
      {
          const arr = new SparseArray<int>(1, 5, 4);
          const result = arr.toString();
          expect(result).assertEqual("1,5,4");

      }
      {
          const arr = new SparseArray<int>(1)
          arr.push(1, 2, 3)
          expect(arr.toString()).assertEqual(',1,2,3')

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 10
          arr[2] = 20
          arr[4] = 40
          let debugStr = arr.toString()
          expect(debugStr).assertEqual('10,,20,,40')

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          let csv = arr.toString()
          let values = csv.split(',')
          expect(values.length).assertEqual(5)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          let serialized = arr.toString()
          expect(serialized).assertEqual('10,20,30')

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2100
     * @tc.name testDeriveToStringNormal004
     * @tc.desc Test SparseArray.toString method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToStringNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10000)
          for (let i = 0; i < 10000; i++) {
            arr[i] = i
          }
          let startTime = Date.now()
          let result = arr.toString()
          let endTime = Date.now()
          expect(endTime - startTime).assertLarger(0)

      }
      {
          const arr = new SparseArray<int>(1000)
          for (let i = 0; i < 1000; i++) {
            arr[i] = i
          }
          let result = arr.toString()
          expect(result!.length).assertLarger(0)

      }
      {
          const arr = new SparseArray<number>(1.5, 2.5, 3.5)
          let result = arr.toString()
          expect(result).assertEqual('1.5,2.5,3.5')

      }
      {
          const arr = new SparseArray<boolean>(true, false, true)
          let result = arr.toString()
          expect(result).assertEqual('true,false,true')

      }
      {
          const arr = new SparseArray<bigint>(1n, 2n, 3n)
          let result = arr.toString()
          expect(result).assertEqual('1,2,3')

      }
      {
          const arr = new SparseArray<int | string | boolean>(1, 'two', true)
          let result = arr.toString()
          expect(result).assertEqual('1,two,true')

      }
      {
          const arr = new SparseArray<byte>(10 as byte, 127 as byte, 20 as byte);
          const result = arr.toString();
          expect(result).assertEqual('10,127,20');

      }
      {
          const arr = new SparseArray<short>(100 as short, 200 as short, 300 as short);
          expect(arr.toString()).assertEqual('100,200,300');

      }
      {
          const longElem = "y".repeat(65535);
          const arr = new SparseArray<string>(longElem);
          const result = arr.toString();
          expect(result.length).assertEqual(65535);

      }
      {
          const chunk = "m".repeat(32768);
          const arr = new SparseArray<string>(chunk);
          expect(arr.toString().length).assertEqual(32768);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2200
     * @tc.name testDeriveToStringNormal005
     * @tc.desc Test SparseArray.toString method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToStringNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const chunk = "t".repeat(65536);
          const arr = new SparseArray<string>(chunk);
          expect(arr.toString().length).assertEqual(65536);

      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 0xFF;
          expect(arr.toString()).assertEqual("255");

      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long);
          expect(arr.toString()).assertEqual("1,10000000000");

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f);
          expect(arr.toString()).assertEqual("1,2.5");

      }
      {
          const arr = new SparseArray<double>(1.25, 2.5);
          expect(arr.toString()).assertEqual("1.25,2.5");

      }
      {
          const arr = new SparseArray<char>(c'A', c'B');
          expect(arr.toString()).assertEqual("A,B");

      }
      {
        // 1. toString on (foo,bar,baz) -> "foo,bar,baz"
        const arr1 = new SparseArray<string>('foo', 'bar', 'baz');
        expect(arr1.toString()).assertEqual('foo,bar,baz');
        // 2. toString on emoji (😀,🚀) -> "😀,🚀"
        const arr2 = new SparseArray<string>('😀', '🚀');
        expect(arr2.toString()).assertEqual('😀,🚀');
        // 3. toString on (\t,\n) -> "\t,\n"
        const arr3 = new SparseArray<string>('\t', '\n');
        expect(arr3.toString()).assertEqual('\t,\n');
        // 4. toString on (-1,-2) -> "-1,-2"
        const arr4 = new SparseArray<int>(-1, -2);
        expect(arr4.toString()).assertEqual('-1,-2');
        // 5. toString on (1,22,333) -> "1,22,333" (length 8)
        const arr5 = new SparseArray<int>(1, 22, 333);
        expect(arr5.toString()).assertEqual('1,22,333');
        expect(arr5.toString().length).assertEqual(8);
        // 6. toString on single "a,b" -> "a,b" (comma inside element unescaped)
        const arr6 = new SparseArray<string>('a,b');
        expect(arr6.toString()).assertEqual('a,b');
        // 7. toString on double (3.14) -> "3.14"
        const arr7 = new SparseArray<double>(3.14);
        expect(arr7.toString()).assertEqual('3.14');
        // 8. toString on bigint (100n,200n) -> "100,200"
        const arr8 = new SparseArray<bigint>(100n, 200n);
        expect(arr8.toString()).assertEqual('100,200');
        const dateA: Date = new Date(0);
        const dateB: Date = new Date(1000);
        const arr9 = new SparseArray<Date>(dateA, dateB);
        expect(arr9.toString()).assertEqual(dateA.toString() + ',' + dateB.toString());
        // 10. toString after push(7) on empty -> "7"
        const arr10 = new SparseArray<int>();
        arr10.push(7);
        expect(arr10.toString()).assertEqual('7');

      }
      {
        // 1. toString on len-2 string {0} hole at 1 -> "a,"
        const arr1 = new SparseArray<string>(2);
        arr1[0] = 'a';
        expect(arr1.toString()).assertEqual('a,');
        // 2. toString on len-4 int {0,2,3} hole at 1 -> "10,,30,40"
        const arr2 = new SparseArray<int>(4);
        arr2[0] = 10;
        arr2[2] = 30;
        arr2[3] = 40;
        expect(arr2.toString()).assertEqual('10,,30,40');
        // 3. toString on len-5 int {0,4} -> "1,,,,5"
        const arr3 = new SparseArray<int>(5);
        arr3[0] = 1;
        arr3[4] = 5;
        expect(arr3.toString()).assertEqual('1,,,,5');
        // 4. toString on len-3 int {1,2} leading hole -> ",2,3"
        const arr4 = new SparseArray<int>(3);
        arr4[1] = 2;
        arr4[2] = 3;
        expect(arr4.toString()).assertEqual(',2,3');
        // 5. toString on len-3 int all holes -> ",,"
        const arr5 = new SparseArray<int>(3);
        expect(arr5.toString()).assertEqual(',,');
        // 6. toString on ("",'x') empty-like -> ",x"
        const arr6 = new SparseArray<string>('', 'x');
        expect(arr6.toString()).assertEqual(',x');
        // 7. toString on double (0.0) -> "0"
        const arr7 = new SparseArray<double>(0.0);
        expect(arr7.toString()).assertEqual('0');
        // 8. toString on double (-Infinity) -> "-Infinity"
        const arr8 = new SparseArray<double>(-Double.POSITIVE_INFINITY);
        expect(arr8.toString()).assertEqual('-Infinity');
        // 9. toString on double (NaN) -> "NaN"
        const arr9 = new SparseArray<double>(Number.NaN);
        expect(arr9.toString()).assertEqual('NaN');
        // 10. toString on double (Infinity) -> "Infinity"
        const arr10 = new SparseArray<double>(Double.POSITIVE_INFINITY);
        expect(arr10.toString()).assertEqual('Infinity');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2300
     * @tc.name testDeriveToReversedNormal001
     * @tc.desc Test SparseArray.toReversed method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToReversedNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3)
          const reversed = arr.toReversed()
          expect(reversed[0]).assertEqual(3);
          expect(reversed[1]).assertEqual(2);
          expect(reversed[2]).assertEqual(1);
          expect(arr[0]).assertEqual(1)
          const value = reversed[0]
          expect(value !== undefined).assertTrue();


      }
      {
          const arr = new SparseArray<int>(2)
          arr.push(1, 3, 4)
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(5);
          expect(reversed[0]).assertEqual(4);
          expect(reversed[2]).assertEqual(1);
          expect(reversed[4]).assertUndefined();


      }
      {
          const arr = new SparseArray<int>()
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(42)
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(42);


      }
      {
          const arr = new SparseArray<int>(5, 5, 5, 5)
          const reversed = arr.toReversed()
          expect(reversed[0]).assertEqual(5);
          expect(reversed[3]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int | null>(1, null, 3)
          const reversed = arr.toReversed()
          expect(reversed[0]).assertEqual(3);
          expect(reversed[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined, 3)
          const reversed = arr.toReversed()
          expect(reversed[0]).assertEqual(3);
          expect(reversed[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(2147483647, -2147483648, 0, 1, -1)
          const reversed = arr.toReversed()
          expect(reversed[0]).assertEqual(-1);
          expect(reversed[4]).assertEqual(2147483647);


      }
      {
          const arr = new SparseArray<int>()
          for (let i = 0; i < 1000; i++) {
            arr.push(i)
          }
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(1000);
          expect(reversed[0]).assertEqual(999);
          expect(reversed[999]).assertEqual(0);


      }
      {
          const arr = new SparseArray<string>("apple", "banana", "cherry")
          const reversed = arr.toReversed()
          expect(reversed[0]).assertEqual("cherry");
          expect(reversed[2]).assertEqual("apple");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2400
     * @tc.name testDeriveToReversedNormal002
     * @tc.desc Test SparseArray.toReversed method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToReversedNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3)
          const originalString = arr.toString()
          const reversed = arr.toReversed()
          expect(arr.toString()).assertEqual(originalString);
          expect(reversed[0]).assertEqual(3);
          expect(reversed[2]).assertEqual(1);


      }
      {
        const arr = new SparseArray<Point012>(new Point012(1, 2), new Point012(3, 4))
        expect(arr instanceof SparseArray).assertTrue();
          const reversed = arr.toReversed()
          const r0 = reversed[0];
          expect(r0 !== null && r0 !== undefined).assertTrue();


      }
      {
          const arr = new SparseArray<int>(6, 6, 4);
          const reversed = arr.toReversed();
          expect(reversed[0]).assertEqual(4);
          expect(reversed[1]).assertEqual(6);
          expect(reversed[2]).assertEqual(6);
          expect(arr[0]).assertEqual(6);

      }
      {
          const arr = new SparseArray<int>()
          arr.push(99)
          expect(arr instanceof SparseArray).assertTrue();
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(1);
          expect(reversed[0]).assertEqual(99);


      }
      {
          const arr = new SparseArray<int>(10)
          expect(arr instanceof SparseArray).assertTrue();
          arr[5] = 100
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(10);
          expect(reversed[4]).assertEqual(100);


      }
      {
          const arr = new SparseArray<int>(1, 2)
          expect(arr instanceof SparseArray).assertTrue();
          arr.push(3)
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(3);
          expect(reversed[0]).assertEqual(3);
          expect(reversed[1]).assertEqual(2);
          expect(reversed[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(10000)
          expect(arr instanceof SparseArray).assertTrue();
          arr[5000] = 999
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(10000);
          expect(reversed[4999]).assertEqual(999);


      }
      {
          const arr = new SparseArray<int>(-1, -2, -3)
          expect(arr instanceof SparseArray).assertTrue();
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(3);
          expect(reversed[0]).assertEqual(-3);
          expect(reversed[1]).assertEqual(-2);
          expect(reversed[2]).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>(0, 0, 0)
          expect(arr instanceof SparseArray).assertTrue();
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(3);
          expect(reversed[0]).assertEqual(0);
          expect(reversed[1]).assertEqual(0);
          expect(reversed[2]).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(2147483647, 100, 0)
          expect(arr instanceof SparseArray).assertTrue();
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(3);
          expect(reversed[0]).assertEqual(0);
          expect(reversed[1]).assertEqual(100);
          expect(reversed[2]).assertEqual(2147483647);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2500
     * @tc.name testDeriveToReversedNormal003
     * @tc.desc Test SparseArray.toReversed method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToReversedNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5)
          expect(arr instanceof SparseArray).assertTrue();
          arr[1] = 10
          arr[3] = 30
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(5);
          expect(reversed[3]).assertEqual(10);
          expect(reversed[1]).assertEqual(30);


      }
      {
          const arr = new SparseArray<int>(10)
          expect(arr instanceof SparseArray).assertTrue();
          arr[0] = 1
          arr[2] = 3
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(10);
          expect(reversed[7]).assertEqual(arr[2]);
          expect(reversed[9]).assertEqual(arr[0]);


      }
      {
        const arr = new SparseArray<int>(1, 2, 5);
        expect(arr.length).assertEqual(3);
        const reversed = arr.toReversed();
        expect(reversed[0]).assertEqual(5);
        expect(reversed[1]).assertEqual(2);
        expect(reversed[2]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(5)
          expect(arr instanceof SparseArray).assertTrue();
          arr[0] = 1
          arr[2] = 3
          arr[4] = 5
          const reversed = arr.toReversed()
          expect(reversed.length).assertEqual(5);
          expect(reversed[4]).assertEqual(arr[0]);
          expect(reversed[2]).assertEqual(arr[2]);
          expect(reversed[0]).assertEqual(arr[4]);


      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long);
          const reversed = arr.toReversed();
          expect(reversed[0]).assertEqual(10000000000 as long);
          expect(reversed[1]).assertEqual(1 as long);
          expect(arr[0]).assertEqual(1 as long);

      }
      {
          const arr = new SparseArray<int>(0x1, 0b10);
          const reversed = arr.toReversed();
          expect(reversed[0]).assertEqual(0b10);
          expect(reversed[1]).assertEqual(0x1);

      }
      {
          const arr = new SparseArray<boolean>(true, false);
          const reversed = arr.toReversed();
          expect(reversed[0]).assertFalse();
          expect(reversed[1]).assertTrue();
          expect(arr[0]).assertTrue();

      }
      {
          const arr = new SparseArray<byte>((-128 as byte), 0 as byte, 127 as byte);
          const reversed = arr.toReversed();
          expect(reversed[0]).assertEqual(127 as byte);
          expect(reversed[2]).assertEqual(-128 as byte);

      }
      {
          const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
          const reversed = arr.toReversed();
          expect(reversed[0]).assertEqual(30 as short);
          expect(reversed[2]).assertEqual(10 as short);

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
          const reversed = arr.toReversed();
          expect(reversed[0]).assertEqual(3.0f);
          expect(reversed[1]).assertEqual(2.5f);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2600
     * @tc.name testDeriveToReversedNormal004
     * @tc.desc Test SparseArray.toReversed method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToReversedNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<double>(1.25, 2.5, 3.75);
          const reversed = arr.toReversed();
          expect(reversed[0]).assertEqual(3.75);
          expect(reversed[2]).assertEqual(1.25);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          const reversed = arr.toReversed();
          expect(reversed[0]).assertEqual(c'C');
          expect(reversed[2]).assertEqual(c'A');

      }
      {
        // 1. toReversed on ('中文','测试','hello') -> ['hello','测试','中文']
        const arr1 = new SparseArray<string>('中文', '测试', 'hello');
        const res1 = arr1.toReversed();
        expect(res1[0]).assertEqual('hello');
        expect(res1[1]).assertEqual('测试');
        expect(res1[2]).assertEqual('中文');
        // 2. toReversed on ('start',LONG_STR,'end') -> ['end',LONG_STR,'start'] with 200x repeated payload
        const LONG_STR: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.repeat(200);
        const arr2 = new SparseArray<string>('start', LONG_STR, 'end');
        const res2 = arr2.toReversed();
        expect(res2[0]).assertEqual('end');
        expect(res2[1]).assertEqual(LONG_STR);
        expect(res2[2]).assertEqual('start');
        // 3. toReversed on push(1,2,3) -> length 3
        const arr3 = new SparseArray<int>();
        arr3.push(1);
        arr3.push(2);
        arr3.push(3);
        const res3 = arr3.toReversed();
        expect(res3.length).assertEqual(3);
        // 4. toReversed on (10,20,30,40,50) -> result[0]=50, result[4]=10
        const arr4 = new SparseArray<int>(10, 20, 30, 40, 50);
        const res4 = arr4.toReversed();
        expect(res4[0]).assertEqual(50);
        expect(res4[4]).assertEqual(10);
        // 5. toReversed on ('x','') -> ['','x']
        const arr5 = new SparseArray<string>('x', '');
        const res5 = arr5.toReversed();
        expect(res5[0]).assertEqual('');
        expect(res5[1]).assertEqual('x');
        // 6. toReversed on ('a\nb','c\td') -> ['c\td','a\nb']
        const arr6 = new SparseArray<string>('a\nb', 'c\td');
        const res6 = arr6.toReversed();
        expect(res6[0]).assertEqual('c\td');
        expect(res6[1]).assertEqual('a\nb');
        // 7. toReversed on (2147483647,2,1) -> [1,2,2147483647], length 3, source[0] unchanged
        const arr7 = new SparseArray<int>(2147483647, 2, 1);
        const res7 = arr7.toReversed();
        expect(res7.length).assertEqual(3);
        expect(res7[0]).assertEqual(1);
        expect(res7[1]).assertEqual(2);
        expect(res7[2]).assertEqual(2147483647);
        expect(arr7[0]).assertEqual(2147483647);
        // 8. toReversed on (10,20,30,40) -> [40,30,20,10], length 4
        const arr8 = new SparseArray<int>(10, 20, 30, 40);
        const res8 = arr8.toReversed();
        expect(res8.length).assertEqual(4);
        expect(res8[0]).assertEqual(40);
        expect(res8[1]).assertEqual(30);
        expect(res8[2]).assertEqual(20);
        expect(res8[3]).assertEqual(10);
        // 9. toReversed on ('1','2','3') -> ['3','2','1'] no numeric conversion
        const arr9 = new SparseArray<string>('1', '2', '3');
        const res9 = arr9.toReversed();
        expect(res9[0]).assertEqual('3');
        expect(res9[1]).assertEqual('2');
        expect(res9[2]).assertEqual('1');

      }
      {
        // 1. toReversed on boolean (true,false,true) -> [true,false,true]
        const arr1 = new SparseArray<boolean>(true, false, true);
        const res1 = arr1.toReversed();
        expect(res1[0]).assertTrue();
        expect(res1[1]).assertFalse();
        expect(res1[2]).assertTrue();
        // 2. toReversed on double (1.0,NaN,3.0) -> [3.0,NaN,1.0] with middle element isNaN
        const arr2 = new SparseArray<double>(1.0, Double.NaN, 3.0);
        const res2 = arr2.toReversed();
        expect(res2[0]).assertEqual(3.0);
        expect(res2[2]).assertEqual(1.0);
        expect(isNaN(res2[1]!)).assertTrue();
        // 3. toReversed on double (1.1,2.2,3.3) -> [3.3,2.2,1.1]
        const arr3 = new SparseArray<double>(1.1, 2.2, 3.3);
        const res3 = arr3.toReversed();
        expect(res3[0]).assertEqual(3.3);
        expect(res3[1]).assertEqual(2.2);
        expect(res3[2]).assertEqual(1.1);
        // 4. toReversed on SparseArray<ObjItem> keeps object references (result[0]===o3, [1]===o2, [2]===o1)
        const o1: ObjItem = { id: 1 };
        const o2: ObjItem = { id: 2 };
        const o3: ObjItem = { id: 3 };
        const arr4 = new SparseArray<ObjItem>(o1, o2, o3);
        const res4 = arr4.toReversed();
        expect(res4[0] === o3).assertTrue();
        expect(res4[1] === o2).assertTrue();
        expect(res4[2] === o1).assertTrue();
        // 5. toReversed on bigint (100n,200n,300n) -> [300n,200n,100n]
        const arr5 = new SparseArray<bigint>(100n, 200n, 300n);
        const res5 = arr5.toReversed();
        expect(res5[0]).assertEqual(300n);
        expect(res5[1]).assertEqual(200n);
        expect(res5[2]).assertEqual(100n);

      }
      {
        // 1. toReversed on empty SparseArray returns a distinct new array (result === arr is false)
        const arr1 = new SparseArray<int>();
        const res1 = arr1.toReversed();
        expect(res1 === arr1).assertFalse();
        // 2. calling toReversed twice on (1,2,3) returns two distinct arrays (r1 === r2 is false)
        const arr2 = new SparseArray<int>(1, 2, 3);
        const res2a = arr2.toReversed();
        const res2b = arr2.toReversed();
        expect(res2a === res2b).assertFalse();
        // 3. toReversed on len-4 sparse {0,1,2} -> result[0] undefined, [300,200,100] at indexes 1,2,3
        const arr3 = new SparseArray<int>(4);
        arr3[0] = 100;
        arr3[1] = 200;
        arr3[2] = 300;
        const res3 = arr3.toReversed();
        expect(res3[0]).assertUndefined();
        expect(res3[1]).assertEqual(300);
        expect(res3[2]).assertEqual(200);
        expect(res3[3]).assertEqual(100);
        // 4. toReversed on SparseArray.of<int>(42) -> result[0]=42
        const arr4 = SparseArray.of<int>(42);
        const res4 = arr4.toReversed();
        expect(res4[0]).assertEqual(42);
        // 5. toReversed on len-3 filled only at index 2 -> result[0]=300, [1],[2] undefined
        const arr5 = new SparseArray<int>(3);
        arr5[2] = 300;
        const res5 = arr5.toReversed();
        expect(res5[0]).assertEqual(300);
        expect(res5[1]).assertUndefined();
        expect(res5[2]).assertUndefined();
        // 6. calling toReversed twice on (1,2,3) -> each returns [3,2,1] independently
        const arr6 = new SparseArray<int>(1, 2, 3);
        const res6a = arr6.toReversed();
        const res6b = arr6.toReversed();
        expect(res6a[0]).assertEqual(3);
        expect(res6b[0]).assertEqual(3);
        expect(res6a[2]).assertEqual(1);
        expect(res6b[2]).assertEqual(1);
        // 7. toReversed returns independent array: overwrite result[0]=99 leaves source[2]=3 unchanged
        const arr7 = new SparseArray<int>(1, 2, 3);
        const res7 = arr7.toReversed();
        res7[0] = 99;
        expect(res7[0]).assertEqual(99);
        expect(arr7[2]).assertEqual(3);
        // 8. toReversed on len-1 all-hole SparseArray<int>(1) -> length 1, result[0] undefined
        const arr8 = new SparseArray<int>(1);
        const res8 = arr8.toReversed();
        expect(res8.length).assertEqual(1);
        expect(res8[0]).assertUndefined();
        // 9. toReversed on len-3 filled only at middle index 1 -> result[0] undef, [1]=2, [2] undef
        const arr9 = new SparseArray<int>(3);
        arr9[1] = 2;
        const res9 = arr9.toReversed();
        expect(res9[0]).assertUndefined();
        expect(res9[1]).assertEqual(2);
        expect(res9[2]).assertUndefined();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2700
     * @tc.name testDeriveToSortedNormal001
     * @tc.desc Test SparseArray.toSorted method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSortedNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5, 6, 4);
          const sorted = arr.toSorted((x: int, y: int): int => x - y);
          expect(sorted[0]).assertEqual(4);
          expect(sorted[1]).assertEqual(5);
          expect(sorted[2]).assertEqual(6);
          expect(arr[0]).assertEqual(5);

      }
      {
          const arr = new SparseArray<int>(3, 1);
          const sorted = arr.toSorted((a: int, b: int): int => 1);
          expect(sorted[0]).assertEqual(3);
          expect(sorted[1]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(3, 1);
          const sorted = arr.toSorted((a: int, b: int): int => -1);
          expect(sorted[0]).assertEqual(1);
          expect(sorted[1]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(3, 1, 2);
          const sorted = arr.toSorted((a: int, b: int): int => 0);
          expect(sorted[0]).assertEqual(3);
          expect(sorted[1]).assertEqual(1);
          expect(sorted[2]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(5, 2, 8, 1, 9);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted.toString()).assertEqual("1,2,5,8,9");


      }
      {
          const arr = new SparseArray<int>(5, 2, 8, 1, 9);
          const sorted = arr.toSorted((a: int, b: int): int => b - a);
          expect(sorted.toString()).assertEqual("9,8,5,2,1");


      }
      {
          const arr = new SparseArray<int>(3, 1, 4, 1, 5);
          const sorted = arr.toSorted((a: int, b: int): int => {
            if (a % 2 === 0 && b % 2 === 0) {
              return a - b;
            }
            if (a % 2 === 0) {
              return -1;
            }
            if (b % 2 === 0) {
              return 1;
            }
            return a - b;
          });
          expect(sorted[0]).assertEqual(4);


      }
      {
          const arr = new SparseArray<string>("banana", "apple", "cherry");
          const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
          expect(sorted[0]).assertEqual("apple");
          expect(sorted[2]).assertEqual("cherry");


      }
      {
        const arr = new SparseArray<Person009>(
            new Person009("Alice", 30),
            new Person009("Bob", 25),
            new Person009("Charlie", 35)
          );
          const sorted = arr.toSorted((a: Person009, b: Person009): int => a.age - b.age);
          const s0 = sorted[0];
          const s2 = sorted[2];
          expect(s0 != null && s2 != null).assertTrue();
          expect((s0 as Person009).name).assertEqual("Bob");
          expect((s2 as Person009).name).assertEqual("Charlie");


      }
      {
          const arr = new SparseArray<int>(3, 1);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted[0]).assertEqual(1);
          expect(sorted[1]).assertEqual(3);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2800
     * @tc.name testDeriveToSortedNormal002
     * @tc.desc Test SparseArray.toSorted method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSortedNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(-3, 1, -5, 2, 0);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted[0]).assertEqual(-5);
          expect(sorted[4]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(0, 1, 0, -1, 0);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted[0]).assertEqual(-1);
          expect(sorted[4]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(2147483647, 1, 100, 2147483647);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(-10, -1, 0);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted[0]).assertEqual(-10);
          expect(sorted[1]).assertEqual(-1);
          expect(sorted[2]).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(3, 1, 3, 2, 1);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted.toString()).assertEqual("1,1,2,3,3");


      }
      {
          const arr = new SparseArray<string>("test", "abc", "123", "local");
          const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
          expect(sorted[0]).assertEqual("123");
          expect(sorted[3]).assertEqual("test");


      }
      {
          const arr = new SparseArray<string>("", "a", "", "b");
          const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
          expect(sorted[0]).assertEqual("");


      }
      {
          let longStr = "a".repeat(10000);
          const arr = new SparseArray<string>(longStr, "z", longStr);
          const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
          expect(sorted[0]).assertEqual(longStr);


      }
      {
          const arr = new SparseArray<string>("!hello", "@world", "#test");
          const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
          expect(sorted[0]).assertEqual("!hello");
          expect(sorted[2]).assertEqual("#test");


      }
      {
        const arr = new SparseArray<Item020>(
            new Item020(3, "C"),
            new Item020(1, "A"),
            new Item020(2, "B")
          );
          const sorted = arr.toSorted((a: Item020, b: Item020): int => a.id - b.id);
          const head = sorted[0] as Item020;
          expect(head.id).assertEqual(1);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_2900
     * @tc.name testDeriveToSortedNormal003
     * @tc.desc Test SparseArray.toSorted method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSortedNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<Container021>(
            new Container021(3),
            new Container021(1),
            new Container021(2)
          );
          const sorted = arr.toSorted((a: Container021, b: Container021): int => a.item.value - b.item.value);
          const head = sorted[0] as Container021;
          expect(head.item.value).assertEqual(1);


      }
      {
          const arr = new SparseArray<NullableItem022>(
            new NullableItem022(3),
            new NullableItem022(null),
            new NullableItem022(1)
          );
          const sorted = arr.toSorted((a: NullableItem022, b: NullableItem022): int => {
            const valA = a.id ?? -1;
            const valB = b.id ?? -1;
            return valA - valB;
          });
          expect(sorted.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>();
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(5);
          const sorted = arr.toSorted((a: int | undefined, b: int | undefined): int => {
            if (a === undefined) {
              return 1;
            }
            if (b === undefined) {
              return -1;
            }
            return a - b;
          });
          expect(sorted.length).assertEqual(5);
          expect(sorted.toString()).assertEqual(",,,,");


      }
      {
          const arr = new SparseArray<int>(5);
          arr[2] = 10;
          arr[4] = 20;
          const sorted = arr.toSorted((a: int | undefined, b: int | undefined): int => {
            if (a === undefined) {
              return 1;
            }
            if (b === undefined) {
              return -1;
            }
            return a - b;
          });
          expect(sorted.toString()).assertEqual(",,10,,20");


      }
      {
          const arr = new SparseArray<int>(3, 1, 4, 1, 5);
          const originalLength = arr.length;
          const originalFirst = arr[0];
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(arr.length).assertEqual(originalLength);
          expect(arr[0]).assertEqual(originalFirst);
          expect(sorted.length).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(3, 1, 4);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted.length).assertEqual(3);
          expect(sorted[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(3, 1, 4, 1, 5);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted[0]).assertEqual(1);
          expect(sorted.length).assertEqual(5);

          expect(sorted[1]).assertEqual(1);
          expect(sorted[2]).assertEqual(3);
          expect(sorted[3]).assertEqual(4);
          expect(sorted[4]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(3, 1, 4, 1, 5);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(arr.toString()).assertEqual("3,1,4,1,5");
          expect(sorted.toString()).assertEqual("1,1,3,4,5");


      }
      {
          const arr = new SparseArray<int>(3, 1, 4);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted[0]).assertEqual(1);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3000
     * @tc.name testDeriveToSortedNormal004
     * @tc.desc Test SparseArray.toSorted method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSortedNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(3, 1, 4);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted === arr).assertFalse();
          sorted[0] = 100;
          expect(arr[0]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr.push(1000 - i);
          }
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted[0]).assertEqual(1);
          expect(sorted[999]).assertEqual(1000);


      }
      {
          const arr = new SparseArray<int>(
            2147483647,
            -100,
            0,
            -1,
            1
          );
          const sorted = arr.toSorted((a: int, b: int): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(sorted[0]).assertEqual(-100);
          expect(sorted[4]).assertEqual(2147483647);


      }
      {
          const arr1 = new SparseArray<int>(3, 1, 4);
          const arr2 = new SparseArray<int>(3, 1, 4);
          const sorted = arr1.toSorted((a: int, b: int): int => a - b);
          arr2.sort((a: int, b: int): int => a - b);
          expect(arr1.toString()).assertEqual("3,1,4");
          expect(arr2.toString()).assertEqual("1,3,4");
          expect(sorted.toString()).assertEqual("1,3,4");


      }
      {
          const arr1 = new SparseArray<int>(3, 1, 4);
          const arr2 = new SparseArray<int>(3, 1, 4);
          const sorted = arr1.toSorted((a: int, b: int): int => a - b);
          const sorted2 = arr2.sort((a: int, b: int): int => a - b);
          expect(sorted === arr1).assertFalse();
          expect(sorted.toString()).assertEqual("1,3,4");
          expect(sorted2.toString()).assertEqual("1,3,4");
          expect(arr2.toString()).assertEqual("1,3,4");


      }
      {
        const arr = new SparseArray<StableItem038>(
            new StableItem038(1, 3),
            new StableItem038(2, 1),
            new StableItem038(3, 1),
            new StableItem038(4, 2)
          );
          const sorted = arr.toSorted((a: StableItem038, b: StableItem038): int => a.value - b.value);
          const s1 = sorted[1] as StableItem038;
          const s2 = sorted[2] as StableItem038;
          expect(s1.id).assertEqual(3);
          expect(s2.id).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>();
          for (let i: int = 0; i < 100; i++) {
            arr.push(100 - i);
          }
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          expect(sorted.length).assertEqual(100);
          expect(sorted[0]).assertEqual(1);
          expect(sorted[99]).assertEqual(100);


      }
      {
          const arr = new SparseArray<int>(5, 2, 8, 1, 9);
          const sorted1 = arr.toSorted((a: int, b: int): int => a - b);
          const sorted2 = sorted1.toSorted((a: int, b: int): int => b - a);
          expect(sorted2.toString()).assertEqual("9,8,5,2,1");


      }
      {
          const arr = new SparseArray<int>(5, 2, 8, 1, 9);
          const sorted = arr.toSorted((a: int, b: int): int => a - b);
          const filtered = sorted.filter((v: int): boolean => v > 3);
          expect(filtered.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<float>(3.0f, 1.0f, 2.0f);
          const sorted = arr.toSorted((a: float, b: float): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(3.0f);
          expect(sorted[0]).assertEqual(1.0f);
          expect(sorted[2]).assertEqual(3.0f);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3100
     * @tc.name testDeriveToSortedNormal005
     * @tc.desc Test SparseArray.toSorted method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSortedNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(0x7, 0b10, 0x3, 1);
          const sorted = arr.toSorted((a: int, b: int): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(0x7);
          expect(sorted[0]).assertEqual(1);
          expect(sorted[1]).assertEqual(0b10);
          expect(sorted[2]).assertEqual(0x3);

      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          const sorted = arr.toSorted((a: boolean, b: boolean): int => {
            if (a === b) {
              return 0;
            }
            if (!a && b) {
              return -1;
            }
            return 1;
          });
          expect(arr[0]).assertTrue();
          expect(sorted[0]).assertFalse();
          expect(sorted[1]).assertTrue();

      }
      {
          const arr = new SparseArray<byte>(127 as byte, 0 as byte, (-128 as byte));
          const sorted = arr.toSorted((a: byte, b: byte): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(127 as byte);
          expect(sorted[0]).assertEqual(-128 as byte);
          expect(sorted[2]).assertEqual(127 as byte);

      }
      {
          const arr = new SparseArray<short>(300 as short, 100 as short, 200 as short);
          const sorted = arr.toSorted((a: short, b: short): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(sorted[0]).assertEqual(100 as short);
          expect(sorted[2]).assertEqual(300 as short);

      }
      {
          const arr = new SparseArray<long>(30000000000 as long, 10000000000 as long, 20000000000 as long);
          const sorted = arr.toSorted((a: long, b: long): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(arr[0]).assertEqual(30000000000 as long);
          expect(sorted[0]).assertEqual(10000000000 as long);
          expect(sorted[2]).assertEqual(30000000000 as long);

      }
      {
          const arr = new SparseArray<double>(3.75, 1.25, 2.5);
          const sorted = arr.toSorted((a: double, b: double): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(sorted[0]).assertEqual(1.25);
          expect(sorted[2]).assertEqual(3.75);

      }
      {
          const arr = new SparseArray<char>(c'C', c'A', c'B');
          const sorted = arr.toSorted((a: char, b: char): int => {
            if (a < b) {
              return -1;
            }
            if (a > b) {
              return 1;
            }
            return 0;
          });
          expect(sorted[0]).assertEqual(c'A');
          expect(sorted[2]).assertEqual(c'C');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3200
     * @tc.name testDeriveToSortedError001
     * @tc.desc Test SparseArray.toSorted method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSortedError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<Item034>(new Item034(1), new Item034(2));
            arr.toSorted((a: Item034, b: Item034): int => {
              throw new Error("Comparator error");
            });
            expect().assertFail();
          } catch (error) {
            expect((error as Error).name).assertEqual("Error");
          }

      }
      {
          const arr = new SparseArray<int>(3, 1, 4);
          try {
            arr.toSorted((a: int, b: int): int => {
              throw new Error("Test error");
            });
            expect().assertFail();
          } catch (error) {
            const caughtError = error as Error;
            expect(caughtError.message).assertEqual("Test error");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3300
     * @tc.name testDeriveToSplicedNormal001
     * @tc.desc Test SparseArray.toSpliced method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSplicedNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(0, 1);
          expect(result!.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, 1);
          expect(result!.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, 1, 10);
          expect(result!.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, 1, 10, 20, 30);
          expect(result!.length).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, 1);
          expect(result.toString()).assertEqual("1,3");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(0, 1);
          expect(result.toString()).assertEqual("2,3");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(100, 1, 10);
          expect(result.toString()).assertEqual("1,2,3,10");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.toSpliced(-2, 1, 20);
          expect(result.toString()).assertEqual("1,2,3,20,5");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(-1, 1);
          expect(result.toString()).assertEqual("1,2");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, 0, 10, 20);
          expect(result.toString()).assertEqual("1,10,20,2,3");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3400
     * @tc.name testDeriveToSplicedNormal002
     * @tc.desc Test SparseArray.toSpliced method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSplicedNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, -1, 10);
          expect(result.toString()).assertEqual("1,10,2,3");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, 100);
          expect(result.toString()).assertEqual("1");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.toSpliced(1, 2, 100);
          expect(result.toString()).assertEqual("1,100,4,5");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, 1, 10, 20, 30);
          expect(result.toString()).assertEqual("1,10,20,30,3");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.toSpliced(1, 1, "x", "y");
          expect(result.toString()).assertEqual("a,x,y,c");


      }
      {
          const arr = new SparseArray<string | number>(1, 2, 3);
          const result = arr.toSpliced(1, 1, "a", "b");
          expect(result.toString()).assertEqual("1,a,b,3");


      }
      {
          const arr = new SparseArray<int | null>(1, 2, 3);
          const result = arr.toSpliced(1, 1, null, null);
          expect(result!.length).assertEqual(4);


      }
      {
          const arr = new SparseArray<int | undefined>(1, 2, 3);
          const result = arr.toSpliced(1, 1, undefined);
          expect(result!.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.toSpliced(1, 2, 10, 20);
          expect(result instanceof SparseArray).assertTrue();
          expect(result.toString()).assertEqual("1,10,20,4,5");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.toSpliced(1, 2, 10);
          expect(arr.toString()).assertEqual("1,2,3,4,5");
          expect(result.toString()).assertEqual("1,10,4,5");
          expect(arr !== result).assertTrue();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3500
     * @tc.name testDeriveToSplicedNormal003
     * @tc.desc Test SparseArray.toSpliced method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSplicedNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(0, 3);
          expect(result!.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>();
          const result = arr.toSpliced(0, 0, 10);
          expect(result.toString()).assertEqual("10");


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          const result = arr.toSpliced(1, 2, 10);
          expect(result.toString()).assertEqual("1,10,,5");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(1, 1);
          expect(result instanceof SparseArray).assertTrue();
          expect(result[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.toSpliced(1, 1, "x");
          expect(typeof result[1]).assertEqual("string");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(2, 10, 10);
          expect(result.toString()).assertEqual("1,2,10");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(10, 0, 10, 20);
          expect(result.toString()).assertEqual("1,2,3,10,20");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.toSpliced(3, 5);
          expect(result.toString()).assertEqual("1,2,3");


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[3] = 4;
          const result = arr.toSpliced(1, 2, 10);
          expect(result![0]).assertEqual(1);
          expect(result[1]).assertEqual(10);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[4] = 5;
          const result = arr.toSpliced(2, 1, 10);
          expect(result!.length).assertEqual(5);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3600
     * @tc.name testDeriveToSplicedNormal004
     * @tc.desc Test SparseArray.toSpliced method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSplicedNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6);
          const result = arr.toSpliced(1, 3, 10, 20, 30, 40);
          expect(result.toString()).assertEqual("1,10,20,30,40,5,6");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(3, 0, 4, 5);
          expect(result.toString()).assertEqual("1,2,3,4,5");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.toSpliced(-3, 2);
          expect(result.toString()).assertEqual("1,2,5");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.toSpliced(-2, 0, 100);
          expect(result.toString()).assertEqual("1,2,3,100,4,5");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(-10, 1, 10);
          expect(result.toString()).assertEqual("10,2,3");


      }
      {
          const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short, 40 as short);
          const result = arr.toSpliced(1, 2);
          expect(arr.length).assertEqual(4);
          expect(result.toString()).assertEqual("10,40");

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(0x1, 0, 99);
          expect(arr.length).assertEqual(3);
          expect(result[1]).assertEqual(99);
          expect(result[2]).assertEqual(2);

      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          const result = arr.toSpliced(1, 1, true);
          expect(arr[1]).assertFalse();
          expect(result[1]).assertTrue();

      }
      {
          const arr = new SparseArray<byte>(0 as byte, 127 as byte);
          const result = arr.toSpliced(1, 0, (-128 as byte));
          expect(arr.length).assertEqual(2);
          expect(result[1]).assertEqual(-128 as byte);
          expect(result[2]).assertEqual(127 as byte);

      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
          const result = arr.toSpliced(1, 1, 20000000000 as long);
          expect(arr[1]).assertEqual(10000000000 as long);
          expect(result[1]).assertEqual(20000000000 as long);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3700
     * @tc.name testDeriveToSplicedNormal005
     * @tc.desc Test SparseArray.toSpliced method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSplicedNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
          const result = arr.toSpliced(1, 1, 4.5f);
          expect(arr[1]).assertEqual(2.5f);
          expect(result[1]).assertEqual(4.5f);

      }
      {
          const arr = new SparseArray<double>(1.25, 2.5, 3.75);
          const result = arr.toSpliced(1, 1, 4.5);
          expect(arr[1]).assertEqual(2.5);
          expect(result[1]).assertEqual(4.5);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          const result = arr.toSpliced(1, 1, c'Z');
          expect(arr[1]).assertEqual(c'B');
          expect(result[1]).assertEqual(c'Z');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_DERIVE_3800
     * @tc.name testDeriveToSplicedError001
     * @tc.desc Test SparseArray.toSpliced method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeriveToSplicedError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            const result = arr.toSpliced((null as Object as int), 1);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            const result = arr.toSpliced(0, (null as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            const result = arr.toSpliced(0, (undefined as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

  });
}
