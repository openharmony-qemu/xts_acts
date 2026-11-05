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

class Person039 {
    name: string = "";
    age: int = 0;
}

class User019 {
    name: string = ""
    age: int = 0
  }

class Person033 {
    name: string = ""
    age: int = 0
  }

class Address034 {
    city: string = ""
  }

class Person034 {
    name: string = ""
    address: Address034 = new Address034()
  }

interface Person025 {
  name: string
  age: int
}

interface Nested027Inner { value: int }

interface Nested026 { inner: Nested027Inner }

interface Complex051Data {
  name: string
  tags: Array<string>
}

interface Complex049 {
  id: int
  data: Complex051Data
}

enum ColorSet055 {
  Red,
  Green,
  Blue
}

class IncludesRefObj {
  name: string;
  constructor(name: string) {
    this.name = name
  }
}

interface SparseArrayIncludesPartObjectValue {
  id: int;
}

// Merged from SparseArrayIncludesPart01Test + SparseArrayIncludesPart03Test (50 scenarios -> 5 cases, each <=10)

class Person037 {
    name: string;
    constructor(name: string) {
      this.name = name;
    }
  }

interface SparseArrayIndexOfPart01ObjVal {
  id: int;
}

class LastIndexOfName {
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}

class LastIndexOfIdBox {
  id: int;
  constructor(id: int) {
    this.id = id;
  }
}

class LastIndexOf2Id {
  id: int;
  constructor(id: int) {
    this.id = id;
  }
}

interface SparseArrayLastIndexOfPart01ObjVal {
  id: number;
}
// Consolidated SparseArrayLastIndexOfPart01Test (38 scenarios -> 4 cases, each <=10)

export default function SparseArrayAccessorTest(): void {
  describe('SparseArrayAccessorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0100
     * @tc.name testAccessAtNormal001
     * @tc.desc Test SparseArray.at method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessAtNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(0);
          expect(result).assertEqual(1);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(1);
          expect(result).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(4, 5, 3);
          const result = arr.at(0);
          expect(result).assertEqual(4);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(2);
          expect(result).assertEqual(3);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1);
          const result = arr.at(2147483647);
          expect(result).assertEqual(undefined);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1);
          const result = arr.at(-2147483648);
          expect(result).assertEqual(undefined);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(-1);
          expect(result).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(-2);
          expect(result).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 6, 5);
          const result = arr.at(1);
          expect(result).assertEqual(6);

      }
      {
          const arr = new SparseArray<int>(2, 2, 3);
          const result = arr.at(0);
          expect(result).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0200
     * @tc.name testAccessAtNormal002
     * @tc.desc Test SparseArray.at method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessAtNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(3);
          arr.push(10, 20, 30);
          const result = arr.at(0);
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(10);
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int | undefined>(1, 2, undefined);
          const result = arr.at(2);
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>();
          const result = arr.at(0);
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(2);
          expect(result).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(-3);
          expect(result).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.at(-10);
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result: int | undefined = arr.at(1);
          expect(result).assertEqual(2);


      }
      {
          const strArr = new SparseArray<string>("a", "b", "c");
          const strResult = strArr.at(0);
          expect(strResult).assertEqual("a");

          const boolArr = new SparseArray<boolean>(true, false);
          const boolResult = boolArr.at(0);
          expect(boolResult).assertTrue();


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[4] = 50;
          expect(arr.at(1)).assertEqual(undefined);
          expect(arr.at(2)).assertEqual(undefined);
          expect(arr.at(3)).assertEqual(undefined);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0300
     * @tc.name testAccessAtNormal003
     * @tc.desc Test SparseArray.at method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessAtNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(4);
          arr[0] = 10;
          arr[2] = 30;
          expect(arr.at(1)).assertEqual(undefined);
          expect(arr.at(3)).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 10;
          arr[5] = 50;
          expect(arr.at(5)).assertEqual(50);
          expect(arr.at(6)).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(3);
          arr.push(10, 20);
          const result = arr.at(-3);
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result1 = arr.at(1);
          const result2 = arr.at(1);
          const result3 = arr.at(1);
          expect(result1).assertEqual(result2);
          expect(result2).assertEqual(result3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr.at(0)).assertEqual(1);
          expect(arr.at(1)).assertEqual(2);
          expect(arr.at(2)).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          expect(arr.at(0)).assertEqual(1);
          expect(arr.at(-1)).assertEqual(5);
          expect(arr.at(2)).assertEqual(3);
          expect(arr.at(-3)).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(3);
          arr.push(10, 20, 30);
          expect(arr.length).assertEqual(6);
          expect(arr.at(0)).assertUndefined();
          expect(arr.at(3)).assertEqual(10);
          expect(arr.at(4)).assertEqual(20);
          expect(arr.at(5)).assertEqual(30);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          expect(arr.at(0)).assertEqual("a");
          expect(arr.at(-1)).assertEqual("c");
          expect(arr.at(10)).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          expect(arr.at(0)).assertEqual(true);
          expect(arr.at(1)).assertEqual(false);
          expect(arr.at(-1)).assertEqual(true);


      }
      {
          const arr = new SparseArray<int | string>(1, "hello", 3);
          expect(arr.at(0)).assertEqual(1);
          expect(arr.at(1)).assertEqual("hello");
          expect(arr.at(2)).assertEqual(3);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0400
     * @tc.name testAccessAtNormal004
     * @tc.desc Test SparseArray.at method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessAtNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<Person039>();
          const p1 = new Person039();
          p1.name = "Alice";
          p1.age = 25;
          const p2 = new Person039();
          p2.name = "Bob";
          p2.age = 30;
          arr.push(p1, p2);
          const result = arr.at(0);
          expect(result !== null && result !== undefined).assertTrue();
          expect(result!.name).assertEqual("Alice");
          expect(result!.age).assertEqual(25);


      }
      {
          const arr = new SparseArray<int>(42);
          expect(arr.length).assertEqual(42);
          expect(arr.at(0)).assertUndefined();
          expect(arr.at(-1)).assertUndefined();
          expect(arr.at(1)).assertUndefined();
          expect(arr.at(-2)).assertUndefined();


      }
      {
          const arr = new SparseArray<int>();
          arr[1000] = 999;
          const result = arr.at(1000);
          expect(result).assertEqual(999);
          expect(arr.at(999)).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>();
          expect(arr.length).assertEqual(0);
          expect(arr.at(0)).assertEqual(undefined);
          expect(arr.at(-1)).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<short>();
          arr.$_set(0, 32767 as short);
          expect(arr.at(0)).assertEqual(32767 as short);

      }
      {
          const arr = new SparseArray<float>(1.0f, 3.14f, 2.0f);
          expect(arr.at(1)).assertEqual(3.14f);
          expect(arr.at(-1)).assertEqual(2.0f);

      }
      {
          const arr = new SparseArray<int>(0, 1, 2, 3, 4, 5, 6, 7);
          expect(arr.at(0x7)).assertEqual(7);
          expect(arr.at(0b111)).assertEqual(7);

      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const overflowIndex: int = (2147483647 as int + 1 as int) as int;
          expect(arr.at(overflowIndex)).assertEqual(undefined);

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3);
          expect(arr.at(1)).assertEqual(null);
          expect(arr.at(0o5 - 0o5)).assertEqual(1);

      }
      {
          const arr = new SparseArray<string>("a", "");
          expect(arr.at(-1)).assertEqual("");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0500
     * @tc.name testAccessAtNormal005
     * @tc.desc Test SparseArray.at method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessAtNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. at(0) on (10,20,30) -> 10
        const arr1 = new SparseArray<int>(10, 20, 30);
        expect(arr1.at(0)).assertEqual(10);
        // 2. at(1) on (100,200) -> 200
        const arr2 = new SparseArray<int>(100, 200);
        expect(arr2.at(1)).assertEqual(200);
        // 3. at(length-2) on (5,10,15) -> 10
        const arr3 = new SparseArray<int>(5, 10, 15);
        expect(arr3.at(arr3.length - 2)).assertEqual(10);
        // 4. at(0) on len=5 sparse {1,3} -> undefined
        const arr4 = new SparseArray<int>(5);
        arr4[1] = 10;
        arr4[3] = 30;
        expect(arr4.at(0)).assertUndefined();
        // 5. at(0) after arr[0]=99 -> 99
        const arr5 = new SparseArray<int>();
        arr5[0] = 99;
        expect(arr5.at(0)).assertEqual(99);
        // 6. at(2) on len=4 sparse {0,2} -> 77
        const arr6 = new SparseArray<int>(4);
        arr6[0] = 55;
        arr6[2] = 77;
        expect(arr6.at(2)).assertEqual(77);
        // 7. at(lastIdx) on (11,22,33,44) -> 44
        const arr7 = new SparseArray<int>(11, 22, 33, 44);
        expect(arr7.at(arr7.length - 1)).assertEqual(44);
        // 8. at(lastIdx) on len=5 sparse {0,4} -> 50
        const arr8 = new SparseArray<int>(5);
        arr8[0] = 10;
        arr8[4] = 50;
        expect(arr8.at(arr8.length - 1)).assertEqual(50);
        // 9. at(0) on single-element ('only') -> 'only'
        const arr9 = new SparseArray<string>('only');
        expect(arr9.at(0)).assertEqual('only');
        // 10. from([100,200,300]) then at(0) -> 100
        const arr10 = SparseArray.from<int>([100, 200, 300]);
        expect(arr10.at(0)).assertEqual(100);

      }
      {
        // 1. at(-1) on ('x','y','z') -> 'z'
        const arr1 = new SparseArray<string>('x', 'y', 'z');
        expect(arr1.at(-1)).assertEqual('z');
        // 2. at(-2) on ('p','q','r','s') -> 'r'
        const arr2 = new SparseArray<string>('p', 'q', 'r', 's');
        expect(arr2.at(-2)).assertEqual('r');
        // 3. at(-length) on (100,200,300) -> 100
        const arr3 = new SparseArray<int>(100, 200, 300);
        expect(arr3.at(-arr3.length)).assertEqual(100);
        // 4. at(-length) after arr[0]=42 -> 42
        const arr4 = new SparseArray<int>();
        arr4[0] = 42;
        expect(arr4.at(-arr4.length)).assertEqual(42);
        // 5. at(-1) === at(length-1)
        const arr5 = new SparseArray<string>('first', 'middle', 'last');
        expect(arr5.at(-1)).assertEqual(arr5.at(arr5.length - 1));

      }
      {
        // 1. at(length) on (10,20,30) -> undefined
        const arr1 = new SparseArray<int>(10, 20, 30);
        expect(arr1.at(arr1.length)).assertUndefined();
        // 2. at(length+1) on (1,2,3,4,5) -> undefined
        const arr2 = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr2.at(arr2.length + 1)).assertUndefined();
        // 3. at(10000) on (1,2,3) -> undefined
        const arr3 = new SparseArray<int>(1, 2, 3);
        expect(arr3.at(10000)).assertUndefined();
        // 4. at(0x7fffffff) MAX on (10,20) -> undefined
        const arr4 = new SparseArray<int>(10, 20);
        expect(arr4.at(0x7fffffff)).assertUndefined();
        // 5. at(-2147483648) INT_MIN on ('a','b','c') -> undefined
        const arr5 = new SparseArray<string>('a', 'b', 'c');
        expect(arr5.at(-2147483648)).assertUndefined();
        // 6. at(4) after length=5 on (1,2,3) -> undefined
        const arr6 = new SparseArray<int>(1, 2, 3);
        arr6.length = 5;
        expect(arr6.at(4)).assertUndefined();
        // 7. at(4) after shrink length=2 on (10,20,30,40,50) -> undefined
        const arr7 = new SparseArray<int>(10, 20, 30, 40, 50);
        arr7.length = 2;
        expect(arr7.at(4)).assertUndefined();
        // 8. at(3) after length=5 on (10,20) -> undefined
        const arr8 = new SparseArray<int>(10, 20);
        arr8.length = 5;
        expect(arr8.at(3)).assertUndefined();

      }
      {
        // 1. at(-length-1) on (10,20,30) -> undefined
        const arr1 = new SparseArray<int>(10, 20, 30);
        expect(arr1.at(-arr1.length - 1)).assertUndefined();
        // 2. byte: at(length) on (1,2,3) -> undefined
        const arr2 = new SparseArray<byte>(Int.toByte(1), Int.toByte(2), Int.toByte(3));
        expect(arr2.at(arr2.length)).assertUndefined();
        // 3. char: at(length) on (A,B) -> undefined
        const arr3 = new SparseArray<char>(c'A', c'B');
        expect(arr3.at(arr3.length)).assertUndefined();
        // 4. Map: at(length) on (m) -> undefined
        const m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        const arr4 = new SparseArray<Map<string, int>>(m);
        expect(arr4.at(arr4.length)).assertUndefined();
        // 5. Array<int>: at(length) on (sub) -> undefined
        const sub: Array<int> = [100, 200];
        const arr5 = new SparseArray<Array<int>>(sub);
        expect(arr5.at(arr5.length)).assertUndefined();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0600
     * @tc.name testAccessAtError001
     * @tc.desc Test SparseArray.at method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessAtError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.at((null as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.at((undefined as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.at(("" as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.at((1.5 as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.at((4294967296 as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.at(("1" as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.at((true as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.at(({} as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0700
     * @tc.name testAccessGetNormal001
     * @tc.desc Test SparseArray.get method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessGetNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(3)
          arr[0] = 10
          expect(arr.$_get(0)).assertEqual(10)

          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(10)
          arr[5] = 100
          expect(arr.$_get(5)).assertEqual(100)

          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(100)
          arr[0x0A] = 10
          expect(arr.$_get(0x0A)).assertEqual(10)

          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>()
          const result = arr.$_get(2147483647)
          expect(result).assertUndefined()


      }
      {
          const arr = new SparseArray<int>()
          const result = arr.$_get(-2147483648)
          expect(result).assertUndefined()


      }
      {
          const arr = new SparseArray<int>(5, 3, 5);
          expect(arr.$_get(2)).assertEqual(5);

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 1
          const result = arr.$_get(-1)
          expect(result).assertUndefined()


      }
      {
          const arr = new SparseArray<int>()
          expect(arr.$_get((2147483647 + 1) as int)).assertUndefined()

      }
      {
          const arr = new SparseArray<string>(3)
          arr[0] = "hello"
          let result = arr.$_get(0)
          expect(result).assertEqual("hello")
          expect((typeof result == "string")).assertTrue()

      }
      {
          const arr = new SparseArray<number>(5)
          arr[2] = 42
          let result = arr.$_get(2)
          expect(result).assertEqual(42)
          expect((typeof result == "number")).assertTrue()

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0800
     * @tc.name testAccessGetNormal002
     * @tc.desc Test SparseArray.get method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessGetNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<boolean>(3)
          arr[0] = true
          let result = arr.$_get(0)
          expect(result).assertTrue()
          expect((typeof result == "boolean")).assertTrue()

      }
      {
        const arr = new SparseArray<User019>(1)
          arr[0] = new User019()
          let result = arr.$_get(0)
          expect(result !== null && result !== undefined).assertTrue()
          expect(result instanceof User019).assertTrue()

      }
      {
          const arr = new SparseArray<int>(5)
          arr[2] = 100
          let result1 = arr.$_get(2)
          let result2 = arr.$_get(10)
          expect(result1).assertEqual(100)
          expect(result2).assertUndefined()

      }
      {
          const arr = new SparseArray<int>(5)
          arr[4] = 5
          let result = arr.$_get(4)
          expect(result).assertEqual(5)

      }
      {
          const arr = new SparseArray<string>(3)
          arr[2] = "last"
          let result = arr.$_get(arr.length - 1)
          expect(result).assertEqual("last")

      }
      {
          const arr = new SparseArray<int>(3)
          let result = arr.$_get(arr.length)
          expect(result).assertUndefined()

      }
      {
          const arr = new SparseArray<int>(10)
          arr[0] = 0
          arr[3] = 3
          arr[7] = 7
          expect(arr.$_get(1)).assertUndefined()
          expect(arr.$_get(2)).assertUndefined()
          expect(arr.$_get(4)).assertUndefined()
          expect(arr.$_get(5)).assertUndefined()
          expect(arr.$_get(6)).assertUndefined()

      }
      {
          const arr = new SparseArray<int | undefined>(5)
          arr[2] = undefined
          expect(arr.$_get(2)).assertUndefined()
          expect(arr.$_get(1)).assertUndefined()

      }
      {
          const arr = new SparseArray<int>()
          expect(arr.length).assertEqual(0)
          expect(arr.$_get(0)).assertUndefined()
          expect(arr.$_get(-1)).assertUndefined()

      }
      {
          const arr = new SparseArray<int>(1)
          arr[0] = 42
          expect(arr.$_get(0)).assertEqual(42)
          expect(arr.$_get(1)).assertUndefined()
          expect(arr.$_get(-1)).assertUndefined()

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_0900
     * @tc.name testAccessGetNormal003
     * @tc.desc Test SparseArray.get method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessGetNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<number>(3)
          arr[1] = 3.14
          let result = arr.$_get(1)
          expect(result).assertEqual(3.14)
          expect((typeof result == "number")).assertTrue()

      }
      {
          const arr = new SparseArray<number>(3)
          arr[2] = 1.0e6
          let result = arr.$_get(2)
          expect(result).assertEqual(1000000)

      }
      {
          const arr = new SparseArray<string>(3)
          arr[1] = "测试"
          let result = arr.$_get(1)
          expect(result).assertEqual("测试")

      }
      {
          const arr = new SparseArray<string>(3)
          arr[2] = ""
          let result = arr.$_get(2)
          expect(result).assertEqual("")
          expect(result !== undefined).assertTrue()

      }
      {
          const arr = new SparseArray<boolean>(3)
          arr[1] = false
          let result = arr.$_get(1)
          expect(result).assertFalse()

      }
      {
        const arr = new SparseArray<Person033>(2)
          const p = new Person033()
          p.name = "Tom"
          p.age = 20
          arr[0] = p
          let result = arr.$_get(0)
          if (result === null || result === undefined) {
            expect(false).assertTrue()
            return
          }
          let pr033 = result as Person033
          expect(pr033.name).assertEqual("Tom")
          expect(pr033.age).assertEqual(20)

      }
      {
        const arr = new SparseArray<Person034>(1)
          const p = new Person034()
          p.name = "Alice"
          p.address.city = "Beijing"
          arr[0] = p
          let result = arr.$_get(0)
          if (result === null || result === undefined) {
            expect(false).assertTrue()
            return
          }
          let pr034 = result as Person034
          expect(pr034.address.city).assertEqual("Beijing")

      }
      {
          const arr = new SparseArray<Array<int>>(2)
          arr[0] = [1, 2, 3]
          let result = arr.$_get(0)
          expect(result !== null && result !== undefined).assertTrue()
          let row57 = result as Array<int>
          expect(row57.length).assertEqual(3)
          expect(row57[0]).assertEqual(1)

      }
      {
          const arr = new SparseArray<number | string>(3)
          arr[0] = 100
          arr[1] = "test"
          expect(arr.$_get(0)).assertEqual(100)
          expect(arr.$_get(1)).assertEqual("test")

      }
      {
          const arr = new SparseArray<number | string | undefined>(3)
          arr[0] = undefined
          expect(arr.$_get(0)).assertUndefined()
          expect(arr.$_get(1)).assertUndefined()

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1000
     * @tc.name testAccessGetNormal004
     * @tc.desc Test SparseArray.get method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessGetNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10000)
          arr[0] = 1
          arr[9999] = 9999
          expect(arr.$_get(0)).assertEqual(1)
          expect(arr.$_get(5000)).assertUndefined()
          expect(arr.$_get(9999)).assertEqual(9999)

      }
      {
          const arr = new SparseArray<int>()
          arr[10] = 10
          arr[20] = 20
          arr[30] = 30
          expect(arr.$_get(10)).assertEqual(10)
          expect(arr.$_get(15)).assertUndefined()
          expect(arr.$_get(30)).assertEqual(30)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[10] = 100
          expect(arr.length).assertEqual(11)
          expect(arr.$_get(10)).assertEqual(100)

      }
      {
          const arr = new SparseArray<int>(10)
          arr[5] = 50
          arr.length = 3
          expect(arr.$_get(5)).assertUndefined()

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 0
          expect(arr.$_get(0)).assertEqual(0)

      }
      {
          const arr = new SparseArray<long>();
          const val: long = 9223372036854775807 as long;
          arr.$_set(0, val);
          expect(arr.$_get(0)).assertEqual(val);

      }
      {
          const arr = new SparseArray<short>();
          arr.$_set(0, 32767 as short);
          expect(arr.$_get(0)).assertEqual(32767 as short);

      }
      {
          const arr = new SparseArray<string>();
          const bad = "\uFFFE";
          arr.$_set(0, bad);
          expect(arr.$_get(0)).assertEqual(bad);

      }
      {
          const arr = new SparseArray<int | null>();
          arr.$_set(0, 10);
          arr.$_set(1, null);
          expect(arr.$_get(1)).assertEqual(null);
          expect(arr.$_get(0)).assertEqual(10);

      }
      {
        // 1. arr[0]=42 on len=10 sparse@{0} -> 42
        const arr1 = new SparseArray<int>(10);
        arr1[0] = 42;
        expect(arr1[0]!).assertEqual(42);
        // 2. arr[0]=INT_MAX(2147483647) on len=5 sparse@{0} -> 2147483647
        const INT_MAX2: int = 2147483647;
        const arr2 = new SparseArray<int>(5);
        arr2[0] = INT_MAX2;
        expect(arr2[0]!).assertEqual(INT_MAX2);
        // 3. arr[0]=INT_MIN(-2147483648) on len=5 sparse@{0} -> -2147483648
        const INT_MIN3: int = -2147483647 - 1;
        const arr3 = new SparseArray<int>(5);
        arr3[0] = INT_MIN3;
        expect(arr3[0]!).assertEqual(INT_MIN3);
        // 4. arr[0]=3.14 on len=3 sparse@{0} -> 3.14
        const arr4 = new SparseArray<double>(3);
        arr4[0] = 3.14;
        expect(arr4[0]!).assertEqual(3.14);
        // 5. arr[0]=-0.0 on len=3 sparse@{0} -> 1/v is -Infinity
        const arr5 = new SparseArray<double>(3);
        arr5[0] = -0.0;
        const v5 = arr5[0]!;
        let actual5: number = 1.0 / v5;
        let expected5: number = Double.NEGATIVE_INFINITY;
        expect(actual5).assertEqual(expected5);
        // 6. arr[0]=NaN on len=3 sparse@{0} -> isNaN true
        const arr6 = new SparseArray<double>(3);
        arr6[0] = Double.NaN;
        const v6 = arr6[0]!;
        let actual6: boolean = isNaN(v6);
        expect(actual6).assertTrue();
        // 7. arr[0]=Infinity on len=3 sparse@{0} -> Infinity
        const arr7 = new SparseArray<double>(3);
        arr7[0] = Double.POSITIVE_INFINITY;
        expect(arr7[0]!).assertEqual(Double.POSITIVE_INFINITY);
        // 8. arr[0]=-Infinity on len=3 sparse@{0} -> -Infinity
        const arr8 = new SparseArray<double>(3);
        arr8[0] = Double.NEGATIVE_INFINITY;
        expect(arr8[0]!).assertEqual(Double.NEGATIVE_INFINITY);
        // 9. arr[0]=Number.MAX_VALUE on len=3 sparse@{0} -> Number.MAX_VALUE
        const arr9 = new SparseArray<double>(3);
        arr9[0] = Number.MAX_VALUE;
        expect(arr9[0]!).assertEqual(Number.MAX_VALUE);
        // 10. arr[0]=0n on len=3 sparse@{0} -> 0n
        const arr10 = new SparseArray<bigint>(3);
        arr10[0] = 0n;
        expect(arr10[0]!).assertEqual(0n);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1100
     * @tc.name testAccessGetNormal005
     * @tc.desc Test SparseArray.get method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessGetNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. arr[0]=bigint MAX on len=3 sparse@{0} -> bigint MAX
        const BIGINT_MAX1: bigint = 9223372036854775807n;
        const arr1 = new SparseArray<bigint>(3);
        arr1[0] = BIGINT_MAX1;
        expect(arr1[0]!).assertEqual(BIGINT_MAX1);
        // 2. arr[0]=0 as long on len=3 sparse@{0} -> 0 as long
        const arr2 = new SparseArray<long>(3);
        arr2[0] = 0 as long;
        expect(arr2[0]!).assertEqual(0 as long);
        // 3. arr[0]=long MAX on len=3 sparse@{0} -> long MAX
        const LARGE_LONG3: long = 9223372036854775807 as long;
        const arr3 = new SparseArray<long>(3);
        arr3[0] = LARGE_LONG3;
        expect(arr3[0]!).assertEqual(LARGE_LONG3);
        // 4. arr[0]=Date(0) on len=3 sparse@{0} -> getTime equal
        const dateA: Date = new Date(0);
        const arr4 = new SparseArray<Date>(3);
        arr4[0] = dateA;
        expect(arr4[0]!.getTime()).assertEqual(dateA.getTime());
        // 5. arr[0]=Date(5000) on SparseArray(d) -> equal d
        const dateB: Date = new Date(5000);
        const arr5 = new SparseArray<Date>(dateB);
        expect(arr5[0]!).assertEqual(dateB);
        // 6. arr[0]=true on len=3 sparse@{0} -> true
        const arr6 = new SparseArray<boolean>(3);
        arr6[0] = true;
        expect(arr6[0]!).assertTrue();
        // 7. arr[0]=false on len=3 sparse@{0} -> false
        const arr7 = new SparseArray<boolean>(3);
        arr7[0] = false;
        expect(arr7[0]!).assertFalse();
        // 8. arr[0]='hello' on len=3 sparse@{0} -> 'hello'
        const arr8 = new SparseArray<string>(3);
        arr8[0] = 'hello';
        expect(arr8[0]!).assertEqual('hello');
        // 9. arr[0]='😀' on len=3 sparse@{0} -> '😀'
        const arr9 = new SparseArray<string>(3);
        arr9[0] = '😀';
        expect(arr9[0]!).assertEqual('😀');
        // 10. arr[0]='中文' on len=3 sparse@{0} -> '中文'
        const arr10 = new SparseArray<string>(3);
        arr10[0] = '中文';
        expect(arr10[0]!).assertEqual('中文');

      }
      {
        // 1. arr[0]='\0' on len=3 sparse@{0} -> '\0'
        const nullChar1: string = '\0';
        const arr1 = new SparseArray<string>(3);
        arr1[0] = nullChar1;
        expect(arr1[0]!).assertEqual(nullChar1);
        // 2. arr[0]='\t\n' on len=3 sparse@{0} -> '\t\n'
        const arr2 = new SparseArray<string>(3);
        arr2[0] = '\t\n';
        expect(arr2[0]!).assertEqual('\t\n');
        // 3. arr[0] on new SparseArray<int>(3) -> undefined
        const arr3 = new SparseArray<int>(3);
        expect(arr3[0]).assertUndefined();
        // 4. arr[2] on len=5 sparse@{0,1} -> undefined
        const arr4 = new SparseArray<int>(5);
        arr4[0] = 10;
        arr4[1] = 20;
        expect(arr4[2]).assertUndefined();
        // 5. arr[4] after length=6 on len=3 sparse@{0} -> undefined
        const arr5 = new SparseArray<int>(3);
        arr5[0] = 1;
        arr5.length = 6;
        expect(arr5[4]).assertUndefined();
        // 6. arr[0] after length 0 then 5 on len=5 sparse@{0} -> undefined
        const arr6 = new SparseArray<int>(5);
        arr6[0] = 99;
        arr6.length = 0;
        arr6.length = 5;
        expect(arr6[0]).assertUndefined();
        // 7. arr[0] on new SparseArray<string>(2) -> undefined
        const arr7 = new SparseArray<string>(2);
        expect(arr7[0]).assertUndefined();
        // 8. arr[0] on new SparseArray<double>(1) -> undefined
        const arr8 = new SparseArray<double>(1);
        expect(arr8[0]).assertUndefined();
        // 9. arr[0] on new SparseArray<Date>(2) -> undefined
        const arr9 = new SparseArray<Date>(2);
        expect(arr9[0]).assertUndefined();
        // 10. arr[0] on new SparseArray<boolean>(2) -> undefined
        const arr10 = new SparseArray<boolean>(2);
        expect(arr10[0]).assertUndefined();

      }
      {
        // 1. arr[3] on len=3 sparse@{0,1,2} -> undefined
        const arr1 = new SparseArray<int>(3);
        arr1[0] = 10;
        arr1[1] = 20;
        arr1[2] = 30;
        expect(arr1[3]).assertUndefined();
        // 2. arr[4] on len=3 sparse@{0} -> undefined
        const arr2 = new SparseArray<int>(3);
        arr2[0] = 10;
        expect(arr2[4]).assertUndefined();
        // 3. arr[INT_MAX] on len=3 sparse@{0} -> undefined
        const INT_MAX3: int = 2147483647;
        const arr3 = new SparseArray<int>(3);
        arr3[0] = 10;
        expect(arr3[INT_MAX3]).assertUndefined();
        // 4. arr[3] after length=2 on len=5 sparse@{0..4} -> undefined
        const arr4 = new SparseArray<int>(5);
        arr4[0] = 10;
        arr4[1] = 20;
        arr4[2] = 30;
        arr4[3] = 40;
        arr4[4] = 50;
        arr4.length = 2;
        expect(arr4[3]).assertUndefined();
        // 5. arr[0] on empty -> undefined
        const arr5 = new SparseArray<int>();
        expect(arr5[0]).assertUndefined();
        // 6. arr[INT_MAX] on empty -> undefined
        const INT_MAX6: int = 2147483647;
        const arr6 = new SparseArray<int>();
        expect(arr6[INT_MAX6]).assertUndefined();
        // 7. arr[2] on len=2 string sparse@{0,1} -> undefined
        const arr7 = new SparseArray<string>(2);
        arr7[0] = 'a';
        arr7[1] = 'b';
        expect(arr7[2]).assertUndefined();
        // 8. arr[3] on len=2 string sparse@{0} -> undefined
        const arr8 = new SparseArray<string>(2);
        arr8[0] = 'x';
        expect(arr8[3]).assertUndefined();
        // 9. arr[2] on len=2 double sparse@{0,1} -> undefined
        const arr9 = new SparseArray<double>(2);
        arr9[0] = 1.5;
        arr9[1] = 2.5;
        expect(arr9[2]).assertUndefined();
        // 10. arr[INT_MIN] on len=3 sparse@{0} -> undefined
        const INT_MIN10: int = -2147483647 - 1;
        const arr10 = new SparseArray<int>(3);
        arr10[0] = 10;
        expect(arr10[INT_MIN10]).assertUndefined();

      }
      {
        // 1. arr[-5] on len=5 sparse@{0} -> undefined
        const arr1 = new SparseArray<int>(5);
        arr1[0] = 42;
        const NEG_LEN1: int = -5;
        expect(arr1[NEG_LEN1]).assertUndefined();
        // 2. arr[-1] on len=2 double sparse@{0} -> undefined
        const arr2 = new SparseArray<double>(2);
        arr2[0] = 3.14;
        expect(arr2[-1]).assertUndefined();
        // 3. arr[-1] on len=2 boolean sparse@{0} -> undefined
        const arr3 = new SparseArray<boolean>(2);
        arr3[0] = true;
        expect(arr3[-1]).assertUndefined();
        // 4. arr[-1] on len=2 bigint sparse@{0} -> undefined
        const arr4 = new SparseArray<bigint>(2);
        arr4[0] = 100n;
        expect(arr4[-1]).assertUndefined();
        // 5. arr[-1] on len=2 Date sparse@{0} -> undefined
        const arr5 = new SparseArray<Date>(2);
        arr5[0] = new Date(0);
        expect(arr5[-1]).assertUndefined();
        // 6. $_get(-1) on SparseArray(42) -> undefined
        const arr6 = new SparseArray<int>(42);
        const result6 = arr6.$_get(-1);
        expect(result6).assertUndefined();
        // 7. $_get(-1) on len=5 sparse@{0,4} -> undefined
        const arr7 = new SparseArray<int>(5);
        arr7[0] = 10;
        arr7[4] = 20;
        const result7 = arr7.$_get(-1);
        expect(result7).assertUndefined();
        // 8. $_get(-2) on (10,20,30,40) -> undefined
        const arr8 = new SparseArray<int>(10, 20, 30, 40);
        const result8 = arr8.$_get(-2);
        expect(result8).assertUndefined();
        // 9. $_get(-length) on (1,2,3) -> undefined
        const arr9 = new SparseArray<int>(1, 2, 3);
        const negLen9 = -arr9.length;
        const result9 = arr9.$_get(negLen9);
        expect(result9).assertUndefined();
        // 10. $_get(-length-1) on (1,2,3) -> undefined
        const arr10 = new SparseArray<int>(1, 2, 3);
        const negLenMinusOne10 = -arr10.length - 1;
        const result10 = arr10.$_get(negLenMinusOne10);
        expect(result10).assertUndefined();

      }
      {
        // 1. $_get(-100) on (1,2,3) -> undefined
        const arr1 = new SparseArray<int>(1, 2, 3);
        const result1 = arr1.$_get(-100);
        expect(result1).assertUndefined();
        // 2. $_get(length=0) on empty -> undefined
        const arr2 = new SparseArray<int>();
        const len2 = arr2.length;
        const result2 = arr2.$_get(len2);
        expect(result2).assertUndefined();
        // 3. $_get(length) on SparseArray(42) -> undefined
        const arr3 = new SparseArray<int>(42);
        const len3 = arr3.length;
        const result3 = arr3.$_get(len3);
        expect(result3).assertUndefined();
        // 4. $_get(length+1) on empty -> undefined
        const arr4 = new SparseArray<int>();
        const len4 = arr4.length;
        const result4 = arr4.$_get(len4 + 1);
        expect(result4).assertUndefined();
        // 5. $_get(length+5) on (1,2) -> undefined
        const arr5 = new SparseArray<int>(1, 2);
        const len5 = arr5.length;
        const result5 = arr5.$_get(len5 + 5);
        expect(result5).assertUndefined();
        // 6. $_get(0) on empty -> typeof 'undefined'
        const arr6 = new SparseArray<int>();
        const result6 = arr6.$_get(0);
        let actual6: string = typeof result6;
        let expected6: string = 'undefined';
        expect(actual6).assertEqual(expected6);
        // 7. $_get(0)/-1/100 on empty keeps length 0
        const arr7 = new SparseArray<int>();
        const r7a = arr7.$_get(0);
        const r7b = arr7.$_get(-1);
        const r7c = arr7.$_get(100);
        expect(r7a).assertUndefined();
        expect(r7b).assertUndefined();
        expect(r7c).assertUndefined();
        let actual7: int = arr7.length;
        let expected7: int = 0;
        expect(actual7).assertEqual(expected7);
        // 8. $_get(1) on SparseArray('only') -> typeof 'undefined'
        const arr8 = new SparseArray<string>('only');
        const result8 = arr8.$_get(1);
        let actual8: string = typeof result8;
        let expected8: string = 'undefined';
        expect(actual8).assertEqual(expected8);
        // 9. $_get(length) on (true,true,true) -> undefined
        const arr9 = new SparseArray<boolean>(true, true, true);
        const len9 = arr9.length;
        const result9 = arr9.$_get(len9);
        expect(result9).assertUndefined();
        // 10. $_get(1) on len=5 sparse@{0,2,4} -> undefined
        const arr10 = new SparseArray<int>(5);
        arr10[0] = 100;
        arr10[2] = 200;
        arr10[4] = 300;
        const result10 = arr10.$_get(1);
        expect(result10).assertUndefined();

      }
      {
        // 1. $_get(1)/2/3 on len=5 sparse@{0,4} -> undefined
        const arr1 = new SparseArray<int>(5);
        arr1[0] = 1;
        arr1[4] = 5;
        const r1a = arr1.$_get(1);
        const r1b = arr1.$_get(2);
        const r1c = arr1.$_get(3);
        expect(r1a).assertUndefined();
        expect(r1b).assertUndefined();
        expect(r1c).assertUndefined();
        // 2. $_get(length-1) on len=4 sparse(empty) -> undefined
        const arr2 = new SparseArray<int>(4);
        const lastIdx2 = arr2.length - 1;
        const result2 = arr2.$_get(lastIdx2);
        expect(result2).assertUndefined();
        // 3. $_get(3) after length=5 on (1,2) -> undefined
        const arr3 = new SparseArray<int>(1, 2);
        arr3.length = 5;
        const result3 = arr3.$_get(3);
        expect(result3).assertUndefined();
        // 4. $_get(1) on len=3 string sparse@{0,2} -> typeof 'undefined'
        const arr4 = new SparseArray<string>(3);
        arr4[0] = 'A';
        arr4[2] = 'C';
        const result4 = arr4.$_get(1);
        let actual4: string = typeof result4;
        let expected4: string = 'undefined';
        expect(actual4).assertEqual(expected4);
        // 5. $_get(3) after length=2 on (10,20,30,40,50) -> undefined
        const arr5 = new SparseArray<int>(10, 20, 30, 40, 50);
        arr5.length = 2;
        const result5 = arr5.$_get(3);
        expect(result5).assertUndefined();
        // 6. $_get(2) after push(3) on (1,2) -> 3
        const arr6 = new SparseArray<int>(1, 2);
        arr6.push(3);
        const result6 = arr6.$_get(2);
        expect(result6).assertEqual(3);
        // 7. $_get(length) after push(3) on (1,2) -> undefined
        const arr7 = new SparseArray<int>(1, 2);
        arr7.push(3);
        const len7 = arr7.length;
        const result7 = arr7.$_get(len7);
        expect(result7).assertUndefined();
        // 8. $_get(100)/-50 on (1,2,3) -> undefined
        const arr8 = new SparseArray<int>(1, 2, 3);
        const r8a = arr8.$_get(100);
        const r8b = arr8.$_get(-50);
        expect(r8a).assertUndefined();
        expect(r8b).assertUndefined();
        // 9. $_get(0)/10/-5/INT_MAX on empty keeps length 0
        const arr9 = new SparseArray<int>();
        const r9a = arr9.$_get(0);
        const r9b = arr9.$_get(10);
        const r9c = arr9.$_get(-5);
        const r9d = arr9.$_get(2147483647);
        expect(r9a).assertUndefined();
        expect(r9b).assertUndefined();
        expect(r9c).assertUndefined();
        expect(r9d).assertUndefined();
        let actual9: int = arr9.length;
        let expected9: int = 0;
        expect(actual9).assertEqual(expected9);
        // 10. $_get(100)/-1/INT_MAX no mutation; $_get(0..4) still 10..50
        const arr10 = new SparseArray<int>(10, 20, 30, 40, 50);
        arr10.$_get(100);
        arr10.$_get(-1);
        arr10.$_get(2147483647);
        let actual10a = arr10.$_get(0);
        let expected10a: int = 10;
        expect(actual10a).assertEqual(expected10a);
        let actual10b = arr10.$_get(1);
        let expected10b: int = 20;
        expect(actual10b).assertEqual(expected10b);
        let actual10c = arr10.$_get(2);
        let expected10c: int = 30;
        expect(actual10c).assertEqual(expected10c);
        let actual10d = arr10.$_get(3);
        let expected10d: int = 40;
        expect(actual10d).assertEqual(expected10d);
        let actual10e = arr10.$_get(4);
        let expected10e: int = 50;
        expect(actual10e).assertEqual(expected10e);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1200
     * @tc.name testAccessGetError001
     * @tc.desc Test SparseArray.get method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessGetError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int>()
            arr.$_get((null as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            const arr = new SparseArray<int>()
            arr.$_get((undefined as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            const arr = new SparseArray<int>()
            arr.$_get(("" as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>()
          expect(arr.$_get((-2147483648 - 1) as int)).assertUndefined()

      }
      {
          try {
            const arr = new SparseArray<int>()
            arr.$_get((true as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            const arr = new SparseArray<int>()
            arr.$_get(({} as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          try {
            const arr = new SparseArray<int>()
            const badArrIdx: Object = new Array<int>()
            arr.$_get((badArrIdx as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1300
     * @tc.name testAccessSetNormal001
     * @tc.desc Test SparseArray.set method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessSetNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 42)
          expect(arr.$_get(0)).assertEqual(42)

      }
      {
          const arr = new SparseArray<int | undefined>()
          arr.$_set(0, undefined)
          expect(arr instanceof SparseArray).assertTrue()
          expect(arr.$_get(0)).assertUndefined()

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(5, 100)
          expect(arr.$_get(5)).assertEqual(100)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 200)
          expect(arr.$_get(0)).assertEqual(200)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(2147483647, 1)
          expect(arr instanceof SparseArray).assertTrue()
          expect(arr.$_get(2147483647)).assertUndefined()

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(-2147483648, 1)
          expect(arr.$_get(0)).assertUndefined()
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(-1, 42)
          expect(arr.$_get(0)).assertUndefined()
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(-100, 42)
          expect(arr.$_get(0)).assertUndefined()
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr = new SparseArray<int>(2, 2, 3)
          arr.$_set(1, 7)
          expect(arr[1]).assertEqual(7)
          expect(arr[0]).assertEqual(2)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 999)
          expect(arr.$_get(0)).assertEqual(999)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1400
     * @tc.name testAccessSetNormal002
     * @tc.desc Test SparseArray.set method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessSetNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, -100)
          expect(arr.$_get(0)).assertEqual(-100)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 0)
          expect(arr.$_get(0)).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 2147483647)
          expect(arr.$_get(0)).assertEqual(2147483647)
          arr.$_set(1, -2147483648)
          expect(arr.$_get(1)).assertEqual(-2147483648)

      }
      {
          const arr = new SparseArray<string>()
          arr.$_set(0, "hello")
          expect(arr.$_get(0)).assertEqual("hello")

      }
      {
          const arr = new SparseArray<string>()
          arr.$_set(0, "")
          expect(arr.$_get(0)).assertEqual("")

      }
      {
          const arr = new SparseArray<string>()
          arr.$_set(0, "中文测试")
          expect(arr.$_get(0)).assertEqual("中文测试")

      }
      {
          const arr = new SparseArray<string>()
          arr.$_set(0, "!@#$%^&*()")
          expect(arr.$_get(0)).assertEqual("!@#$%^&*()")

      }
      {
          const arr = new SparseArray<boolean>()
          arr.$_set(0, true)
          expect(arr.$_get(0)).assertTrue()

      }
      {
          const arr = new SparseArray<boolean>()
          arr.$_set(0, false)
          expect(arr.$_get(0)).assertFalse()

      }
      {
          const arr = new SparseArray<Person025>()
          const _p025: Person025 = { name: "Alice", age: 30 }
          arr.$_set(0, _p025)
          expect(arr.$_get(0)!.name).assertEqual("Alice")

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1500
     * @tc.name testAccessSetNormal003
     * @tc.desc Test SparseArray.set method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessSetNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<Nested026>()
          const _i026: Nested027Inner = { value: 100 }
          const _o026: Nested026 = { inner: _i026 }
          arr.$_set(0, _o026)
          expect(arr.$_get(0)!.inner.value).assertEqual(100)

      }
      {
          const arr = new SparseArray<Array<int>>()
          arr.$_set(0, [1, 2, 3])
          expect(arr.$_get(0)!.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<Array<int>>()
          arr.$_set(0, [])
          expect(arr.$_get(0)!.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int | null>()
          arr.$_set(0, null)
          expect(arr.$_get(0)).assertNull()

      }
      {
          const arr = new SparseArray<string>()
          arr.$_set(0, "<script>alert(1)</script>")
          expect(arr.$_get(0)).assertEqual("<script>alert(1)</script>")

      }
      {
          const arr = new SparseArray<string>()
          let longStr = "a".repeat(10000)
          arr.$_set(0, longStr)
          expect(arr.$_get(0)!.length).assertEqual(10000)

      }
      {
          const arr = new SparseArray<string>()
          arr.$_set(0, "\u200B")
          expect(arr.$_get(0)).assertEqual("\u200B")

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 10)
          arr.$_set(1, 20)
          arr.$_set(2, 30)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 10)
          arr.$_set(100, 1000)
          expect(arr.$_get(0)).assertEqual(10)
          expect(arr.$_get(100)).assertEqual(1000)
          expect(arr.$_get(50)).assertUndefined()

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 10)
          arr.$_set(0, 20)
          expect(arr.$_get(0)).assertEqual(20)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1600
     * @tc.name testAccessSetNormal004
     * @tc.desc Test SparseArray.set method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessSetNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          let result = arr.$_set(0, 42)
          expect(result).assertUndefined()
          expect(arr.$_get(0)).assertEqual(42)

      }
      {
          const arr = new SparseArray<int>(5, 6, 3)
          arr.$_set(1, 14)
          expect(arr[1]).assertEqual(14)
          expect(arr[0]).assertEqual(5)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>(6, 2, 4)
          arr.$_set(1, 12)
          expect(arr[1]).assertEqual(12)
          expect(arr[0]).assertEqual(6)
          expect(arr[2]).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(-999, 42)
          expect(arr.$_get(0)).assertUndefined()
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 10)
          arr.$_set(1, 20)
          arr.$_set(-1, 99)
          expect(arr.$_get(0)).assertEqual(10)
          expect(arr.$_get(1)).assertEqual(20)
          expect(arr.length).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>()
          try {
            arr.$_set(("invalid" as Object as int), 42)
            expect().assertFail()
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError")
          }

      }
      {
          const arr = new SparseArray<int>()
          expect(arr.length).assertEqual(0)
          arr.$_set(0, 42)
          expect(arr.$_get(0)).assertEqual(42)

      }
      {
          const arr = new SparseArray<int>(10)
          arr.$_set(5, 42)
          expect(arr.$_get(5)).assertEqual(42)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          expect(arr.$_get(1)).assertEqual(2)
          arr.$_set(1, 99)
          expect(arr.$_get(1)).assertEqual(99)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(0, 1)
          arr.$_set(5, 6)
          expect(arr.$_get(0)).assertEqual(1)
          expect(arr.$_get(5)).assertEqual(6)
          expect(arr.$_get(1)).assertUndefined()
          expect(arr.$_get(2)).assertUndefined()
          expect(arr.$_get(3)).assertUndefined()
          expect(arr.$_get(4)).assertUndefined()

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1700
     * @tc.name testAccessSetNormal005
     * @tc.desc Test SparseArray.set method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessSetNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          for (let i = 0; i < 1000; i++) {
            arr.$_set(i, i * 2)
          }
          expect(arr.length).assertEqual(1000)
          expect(arr.$_get(999)).assertEqual(1998)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(100, 100)
          arr.$_set(1000, 1000)
          arr.$_set(10000, 10000)
          expect(arr.$_get(100)).assertEqual(100)
          expect(arr.$_get(1000)).assertEqual(1000)
          expect(arr.$_get(10000)).assertEqual(10000)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(999999, 42)
          expect(arr.$_get(999999)).assertEqual(42)

      }
      {
          const arr = new SparseArray<Complex049>()
          const _d049: Complex051Data = { name: "test", tags: ["a", "b"] }
          const _c049: Complex049 = { id: 1, data: _d049 }
          arr.$_set(0, _c049)
          expect(arr.$_get(0)!.data.tags.length).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>()
          arr.$_set(10, 100)
          expect(arr.$_get(10)).assertEqual(100)

      }
      {
          const arr = new SparseArray<int>()
          expect(arr.length).assertEqual(0)
          arr.$_set(5, 42)
          expect(arr.length).assertLarger(5)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(1, 2, 3)
          arr.$_set(5, 6)
          expect(arr.$_get(0)).assertEqual(1)
          expect(arr.$_get(5)).assertEqual(6)

      }
      {
          const arr = new SparseArray<byte>()
          arr.$_set(0, 127 as byte)
          arr.$_set(1, (-128 as byte))
          expect(arr.$_get(0)).assertEqual(127 as byte)
          expect(arr.$_get(1)).assertEqual(-128 as byte)

      }
      {
          const arr = new SparseArray<string>()
          arr.$_set(0, "\uFFFD")
          arr.$_set(1, "\xe4")
          expect(arr.$_get(0)).assertEqual("\uFFFD")
          expect(arr.$_get(1)).assertEqual("\xe4")

      }
      {
          const arr = new SparseArray<ColorSet055>()
          arr.$_set(0, ColorSet055.fromValue(1))
          expect(arr.$_get(0)).assertEqual(ColorSet055.Green)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1800
     * @tc.name testAccessSetNormal006
     * @tc.desc Test SparseArray.set method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessSetNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int | null>()
          arr.$_set(0x2, null)
          expect(arr.$_get(0x2)).assertEqual(null)

      }
      {
        // 1. empty int: arr[0]=42 grows length 0->1 and arr[0] reads 42
        const arr1 = new SparseArray<int>();
        expect(arr1.length).assertEqual(0);
        arr1[0] = 42;
        expect(arr1.length).assertEqual(1);
        expect(arr1[0]!).assertEqual(42);
        // 2. overwrite arr[0]=1 then 2 then 3 keeps length 1 and arr[0]==3
        const arr2 = new SparseArray<int>();
        arr2[0] = 1;
        arr2[0] = 2;
        arr2[0] = 3;
        expect(arr2.length).assertEqual(1);
        expect(arr2[0]!).assertEqual(3);
        // 3. arr[2]=3 on (1,2) grows length 2->3 and arr[2]==3
        const arr3 = new SparseArray<int>(1, 2);
        arr3[2] = 3;
        expect(arr3.length).assertEqual(3);
        expect(arr3[2]!).assertEqual(3);
        // 4. keys() after arr[0]=1 and arr[4]=5 yields 0 then 4 then done
        const arr4 = new SparseArray<int>();
        arr4[0] = 1;
        arr4[4] = 5;
        const iter4 = arr4.keys();
        let r4 = iter4.next();
        expect(r4.done).assertFalse();
        expect(r4.value!).assertEqual(0);
        r4 = iter4.next();
        expect(r4.done).assertFalse();
        expect(r4.value!).assertEqual(4);
        r4 = iter4.next();
        expect(r4.done).assertTrue();
        // 5. forEach after arr[0]=100 and arr[4]=500 runs callback twice
        const arr5 = new SparseArray<int>();
        arr5[0] = 100;
        arr5[4] = 500;
        let count5: int = 0;
        arr5.forEach((v: int, k: int) => {
          count5 = count5 + 1;
        });
        expect(count5).assertEqual(2);
        // 6. values() on (1,2) then arr[4]=5 yields 1,2,5 then done
        const arr6 = new SparseArray<int>(1, 2);
        const iter6 = arr6.values();
        arr6[4] = 5;
        let r6 = iter6.next();
        expect(r6.value!).assertEqual(1);
        r6 = iter6.next();
        expect(r6.value!).assertEqual(2);
        r6 = iter6.next();
        expect(r6.value!).assertEqual(5);
        r6 = iter6.next();
        expect(r6.done).assertTrue();
        // 7. live values() on ('a','b','c'): replace arr[2]='z' mid-iter yields a,b,z then done
        const arr7 = new SparseArray<string>('a', 'b', 'c');
        const iter7 = arr7.values();
        let r7 = iter7.next();
        expect(r7.value!).assertEqual('a');
        r7 = iter7.next();
        arr7[2] = 'z';
        expect(r7.value!).assertEqual('b');
        r7 = iter7.next();
        expect(r7.value!).assertEqual('z');
        r7 = iter7.next();
        expect(r7.done).assertTrue();
        // 8. live entries() on (10,20,30): replace arr[2]=99 mid-iter yields 10,20,99 then done
        const arr8 = new SparseArray<int>(10, 20, 30);
        const iter8 = arr8.entries();
        let r8 = iter8.next();
        expect(r8.value![1]).assertEqual(10);
        arr8[2] = 99;
        r8 = iter8.next();
        expect(r8.value![1]).assertEqual(20);
        r8 = iter8.next();
        expect(r8.value![1]).assertEqual(99);
        r8 = iter8.next();
        expect(r8.done).assertTrue();
        // 9. forEach on (1,2,3): adding arr[5]=6 at key 2 makes count 4 and arr[5]==6
        const arr9 = new SparseArray<int>(1, 2, 3);
        let count9: int = 0;
        arr9.forEach((v: int, k: int) => {
          count9 = count9 + 1;
          if (k === 2) {
            arr9[5] = 6;
          }
        });
        expect(count9).assertEqual(4);
        expect(arr9[5]!).assertEqual(6);
        // 10. arr[2]=arr[1] on (10,20,30) leaves both arr[2] and arr[1] equal to 20
        const arr10 = new SparseArray<int>(10, 20, 30);
        arr10[2] = arr10[1]!;
        expect(arr10[2]!).assertEqual(20);
        expect(arr10[1]!).assertEqual(20);

      }
      {
        // 1. arr[3]=99 after shrink length=2 on (10,20,30,40) keeps length 4, arr[2] undefined, arr[3]==99
        const arr1 = new SparseArray<int>(10, 20, 30, 40);
        arr1.length = 2;
        arr1[3] = 99;
        expect(arr1.length).assertEqual(4);
        expect(arr1[0]!).assertEqual(10);
        expect(arr1[1]!).assertEqual(20);
        expect(arr1[2]).assertUndefined();
        expect(arr1[3]!).assertEqual(99);
        // 2. arr[0]='a' and arr[2]='c' leaves middle hole so join() returns 'a,,c'
        const arr2 = new SparseArray<string>();
        arr2[0] = 'a';
        arr2[2] = 'c';
        expect(arr2.join()).assertEqual('a,,c');
        // 3. arr[0]='a' and arr[3]='d' makes length 4, includes('d') true, includes('b') false
        const arr3 = new SparseArray<string>();
        arr3[0] = 'a';
        arr3[3] = 'd';
        expect(arr3.length).assertEqual(4);
        expect(arr3.includes('d')).assertTrue();
        expect(arr3.includes('b')).assertFalse();
        // 4. arr[0]=1,arr[1]=2,arr[2]=3 then join() returns '1,2,3'
        const arr4 = new SparseArray<int>();
        arr4[0] = 1;
        arr4[1] = 2;
        arr4[2] = 3;
        expect(arr4.join()).assertEqual('1,2,3');
        // 5. arr[0]='hello',arr[1]='world' makes includes('hello') true and includes('missing') false
        const arr5 = new SparseArray<string>();
        arr5[0] = 'hello';
        arr5[1] = 'world';
        expect(arr5.includes('hello')).assertTrue();
        expect(arr5.includes('missing')).assertFalse();
        // 6. arr[0]=undefined on (1,2) of int|undefined keeps length 2, forEach count 2, arr[0] undefined
        const arr6 = new SparseArray<int | undefined>(1, 2);
        arr6[0] = undefined;
        let count6: int = 0;
        arr6.forEach((v: int | undefined, k: int) => {
          count6 = count6 + 1;
        });
        expect(arr6.length).assertEqual(2);
        expect(count6).assertEqual(2);
        expect(arr6[0]).assertUndefined();
        // 7. arr[0]='x',arr[1]='y' makes at(0)=='x' and at(1)=='y'
        const arr7 = new SparseArray<string>();
        arr7[0] = 'x';
        arr7[1] = 'y';
        expect(arr7.at(0)!).assertEqual('x');
        expect(arr7.at(1)!).assertEqual('y');

      }
      {
        // 1. arr[-1]=99 on (1,2,3) leaves length 3 with arr[0]==1 and arr[2]==3
        const arr1 = new SparseArray<int>(1, 2, 3);
        arr1[-1] = 99;
        expect(arr1.length).assertEqual(3);
        expect(arr1[0]!).assertEqual(1);
        expect(arr1[2]!).assertEqual(3);
        // 2. arr[0..2]='first','second','third' makes at(-1)=='third' and at(-3)=='first'
        const arr2 = new SparseArray<string>();
        arr2[0] = 'first';
        arr2[1] = 'second';
        arr2[2] = 'third';
        expect(arr2.at(-1)!).assertEqual('third');
        expect(arr2.at(-3)!).assertEqual('first');
        // 3. arr[0]=1.5,arr[1]=2.25 on double makes length 2 and both values read back unchanged
        const arr3 = new SparseArray<double>();
        arr3[0] = 1.5;
        arr3[1] = 2.25;
        expect(arr3.length).assertEqual(2);
        expect(arr3[0]!).assertEqual(1.5);
        expect(arr3[1]!).assertEqual(2.25);
        // 4. arr[0]=100n on bigint makes length 1 and arr[0] reads 100n
        const arr4 = new SparseArray<bigint>();
        arr4[0] = 100n;
        expect(arr4.length).assertEqual(1);
        expect(arr4[0]!).assertEqual(100n);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_1900
     * @tc.name testAccessSetError001
     * @tc.desc Test SparseArray.set method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessSetError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int | undefined>()
            arr.$_set((undefined as Object as int), undefined)
            expect().assertFail()
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError")
          }

      }
      {
          const arr = new SparseArray<int>()
          try {
            arr.$_set((null as Object as int), 42)
            expect().assertFail()
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError")
          }
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr = new SparseArray<int>()
          try {
            arr.$_set((undefined as Object as int), 42)
            expect().assertFail()
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError")
          }
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr = new SparseArray<int>()
          try {
            arr.$_set((3.14 as Object as int), 42)
            expect().assertFail()
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError")
          }
          expect(arr instanceof SparseArray).assertTrue()

      }
      {
          const arr = new SparseArray<int>()
          try {
            arr.$_set(("0" as Object as int), 42)
            expect().assertFail()
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError")
          }
          expect(arr instanceof SparseArray).assertTrue()

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2000
     * @tc.name testAccessIncludesNormal001
     * @tc.desc Test SparseArray.includes method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessIncludesNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10, 20, 30)
          let result = arr.includes(20)
          expect(result).assertEqual(true)
          expect(typeof result).assertEqual("boolean")

      }
      {
          const arr = new SparseArray<int>()
          arr.push(2147483647)
          let result = arr.includes(2147483647)
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          let result = arr.includes(0)
          expect(result).assertEqual(false)

      }
      {
          const arr = new SparseArray<number>(10, Double.NaN, 30)
          let result = arr.includes(Double.NaN)
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<boolean>(true, false, true)
          let result = arr.includes(true)
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<boolean>(false, true, false)
          let result = arr.includes(false)
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<string>("apple", "banana", "cherry")
          let result = arr.includes("banana")
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<string>("中文", "日本語", "한글")
          let result = arr.includes("中文")
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<string>("hello​world")
          let result = arr.includes("hello​world")
          expect(result).assertEqual(true)

      }
      {
          const obj = new IncludesRefObj("test")
          const arr = new SparseArray<IncludesRefObj>(obj)
          let result = arr.includes(obj)
          expect(result).assertEqual(true)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2100
     * @tc.name testAccessIncludesNormal002
     * @tc.desc Test SparseArray.includes method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessIncludesNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const first = new IncludesRefObj("test")
          const arr = new SparseArray<IncludesRefObj>(first)
          let result = arr.includes(new IncludesRefObj("test"))
          expect(result).assertEqual(false)

      }
      {
          const arr = new SparseArray<int | string>(10, "hello", 30)
          let result = arr.includes("hello")
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<int>()
          let result = arr.includes(1)
          expect(result).assertEqual(false)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 10
          arr[2] = 30
          arr[4] = 50
          let result = arr.includes(30)
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 10
          arr[2] = 30
          arr[4] = 50
          let result = arr.includes(20)
          expect(result).assertEqual(false)

      }
      {
          const arr = new SparseArray<int | undefined>()
          arr[0] = 10
          arr[1] = undefined
          let result = arr.includes(undefined)
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<int | undefined>()
          arr[0] = 10
          let result = arr.includes(undefined)
          expect(result).assertEqual(false)

      }
      {
          const arr = new SparseArray<int | undefined>()
          arr[0] = undefined
          let result = arr.includes(undefined)
          expect(result).assertEqual(true)

      }
      {
          const arr = new SparseArray<byte>(10 as byte, 127 as byte, 20 as byte)
          expect(arr.includes(127 as byte)).assertEqual(true)
          expect(arr.includes(99 as byte)).assertEqual(false)

      }
      {
          const arr = new SparseArray<float>(1.0f, 3.14f, 2.0f)
          expect(arr.includes(3.14f)).assertEqual(true)
          expect(arr.includes(9.9f)).assertEqual(false)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2200
     * @tc.name testAccessIncludesNormal003
     * @tc.desc Test SparseArray.includes method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessIncludesNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const nan = Double.toFloat(Double.NaN)
          const arr = new SparseArray<float>(1.0f, nan, 3.0f)
          expect(arr.includes(nan)).assertEqual(true)

      }
      {
          const xss = "<script>alert(1)</script>"
          const arr = new SparseArray<string>("ok", xss)
          expect(arr.includes(xss)).assertEqual(true)
          expect(arr.includes("missing")).assertEqual(false)

      }
      {
          const zw = "\u200B"
          const arr = new SparseArray<string>(zw, "x")
          expect(arr.includes(zw)).assertEqual(true)

      }
      {
          const withNull = new SparseArray<int | null>(1, null, 3)
          expect(withNull.includes(null)).assertEqual(true)

      }
      {
          const arr = new SparseArray<int>()
          arr[0] = 0xFF
          expect(arr.includes(0xFF)).assertEqual(true)
          expect(arr.includes(0xFE)).assertEqual(false)

      }
      {
          const arr = new SparseArray<string>("", "x")
          expect(arr.includes("")).assertEqual(true)
          expect(arr.includes("y")).assertEqual(false)

      }
      {
          const arr = new SparseArray<int>(2, 5, 9, 2)
          expect(arr.includes(2, 0)).assertEqual(true)
          expect(arr.includes(2, 1)).assertEqual(true)
          expect(arr.includes(2, 3)).assertEqual(true)
          expect(arr.includes(2, 4)).assertEqual(false)
          expect(arr.includes(5, 2)).assertEqual(false)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          expect(arr.includes(10, -3)).assertEqual(true)
          expect(arr.includes(20, -2)).assertEqual(true)
          expect(arr.includes(10, -2)).assertEqual(false)
          expect(arr.includes(30, -1)).assertEqual(true)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          expect(arr.includes(1, 100)).assertEqual(false)
          expect(arr.includes(3, 99)).assertEqual(false)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 10
          arr[2] = 20
          arr[4] = 30
          expect(arr.includes(10, 1)).assertEqual(false)
          expect(arr.includes(20, 2)).assertEqual(true)
          expect(arr.includes(30, 3)).assertEqual(true)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2300
     * @tc.name testAccessIncludesNormal004
     * @tc.desc Test SparseArray.includes method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessIncludesNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C')
          expect(arr.includes(c'B', 1)).assertEqual(true)
          expect(arr.includes(c'A', 1)).assertEqual(false)

      }
      {
          const arr = new SparseArray<int>(10, 20)
          expect(arr.includes(10, -100)).assertEqual(true)
          expect(arr.includes(20, -100)).assertEqual(true)

      }
      {
          const arr = new SparseArray<int | undefined>(4)
          arr[1] = undefined
          expect(arr.includes(undefined)).assertEqual(true)
          expect(arr.includes(undefined, 2)).assertEqual(false)

      }
      {
          const arr = new SparseArray<short>(8)
          arr[6] = 300 as short
          expect(arr.includes(300 as short)).assertEqual(true)
          expect(arr.includes(200 as short)).assertEqual(false)

      }
      {
        // 1. includes(40) on sparse int {0:10,3:40} -> true
        const arr1 = new SparseArray<int>(5);
        arr1[0] = 10;
        arr1[3] = 40;
        expect(arr1.includes(40)).assertTrue();
        // 2. includes(42) on len=42 sparse {0:42} -> true
        const arr2 = new SparseArray<int>(42);
        arr2[0] = 42;
        expect(arr2.includes(42)).assertTrue();
        // 3. includes(77) on len=6 sparse {5:77} -> true
        const arr3 = new SparseArray<int>(6);
        arr3[5] = 77;
        expect(arr3.includes(77)).assertTrue();
        // 4. includes(true) on (false,true,false) -> true
        const arr4 = new SparseArray<boolean>(false, true, false);
        expect(arr4.includes(true)).assertTrue();
        // 5. includes(false) on (true,false,true) -> true
        const arr5 = new SparseArray<boolean>(true, false, true);
        expect(arr5.includes(false)).assertTrue();
        // 6. includes('') on ('a','','b') -> true
        const arr6 = new SparseArray<string>('a', '', 'b');
        expect(arr6.includes('')).assertTrue();
        // 7. includes(' ') on ('x',' ','y') -> true
        const arr7 = new SparseArray<string>('x', ' ', 'y');
        expect(arr7.includes(' ')).assertTrue();
        // 8. includes('\t') on ('a','\t','b') -> true
        const arr8 = new SparseArray<string>('a', '\t', 'b');
        expect(arr8.includes('\t')).assertTrue();
        // 9. includes('中文') on ('hello','中文','world') -> true
        const arr9 = new SparseArray<string>('hello', '中文', 'world');
        expect(arr9.includes('中文')).assertTrue();
        // 10. includes('😀') on ('a','😀','b') -> true
        const arr10 = new SparseArray<string>('a', '😀', 'b');
        expect(arr10.includes('😀')).assertTrue();

      }
      {
        // 1. includes(99) on (10,20,30) -> false
        const arr1 = new SparseArray<int>(10, 20, 30);
        expect(arr1.includes(99)).assertFalse();
        // 2. includes(undefined) on sparse int|undef {0:10,3:40} -> false
        const arr2 = new SparseArray<int | undefined>(5);
        arr2[0] = 10;
        arr2[3] = 40;
        expect(arr2.includes(undefined)).assertFalse();
        // 3. includes(0) on len=42 empty -> false
        const arr3 = new SparseArray<int>(42);
        expect(arr3.includes(0)).assertFalse();
        // 4. includes('') on ('a','b','c') -> false
        const arr4 = new SparseArray<string>('a', 'b', 'c');
        expect(arr4.includes('')).assertFalse();
        // 5. includes(true) on (false,false,false) -> false
        const arr5 = new SparseArray<boolean>(false, false, false);
        expect(arr5.includes(true)).assertFalse();
        // 6. includes(1.5) on (1.0,2.0,3.0) -> false
        const arr6 = new SparseArray<double>(1.0, 2.0, 3.0);
        expect(arr6.includes(1.5)).assertFalse();
        // 7. includes(BigInt(0)) on (1n,2n,3n) -> false
        const arr7 = new SparseArray<bigint>(BigInt(1), BigInt(2), BigInt(3));
        expect(arr7.includes(BigInt(0))).assertFalse();
        // 8. includes(obj2) on (obj1,obj3) ref-mismatch -> false
        const obj1: SparseArrayIncludesPartObjectValue = { id: 1 };
        const obj2: SparseArrayIncludesPartObjectValue = { id: 2 };
        const obj3: SparseArrayIncludesPartObjectValue = { id: 3 };
        const arr8 = new SparseArray<SparseArrayIncludesPartObjectValue>(obj1, obj3);
        expect(arr8.includes(obj2)).assertFalse();
        // 9. includes('apple',3=length) on ('apple','banana','cherry') -> false
        const arr9 = new SparseArray<string>('apple', 'banana', 'cherry');
        expect(arr9.includes('apple', 3)).assertFalse();
        // 10. includes(r3) on (r1,r2) ref-mismatch -> false
        const r1: RegExp = new RegExp('\\d+');
        const r2: RegExp = new RegExp('\\d+');
        const r3: RegExp = new RegExp('\\d+');
        const arr10 = new SparseArray<RegExp>(r1, r2);
        expect(arr10.includes(r3)).assertFalse();

      }
      {
        // 1. includes(10,0) on (10,20,30) -> true
        const arr1 = new SparseArray<int>(10, 20, 30);
        expect(arr1.includes(10, 0)).assertTrue();
        // 2. includes(30,2) on (10,20,30,40) -> true
        const arr2 = new SparseArray<int>(10, 20, 30, 40);
        expect(arr2.includes(30, 2)).assertTrue();
        // 3. includes(10,1) on (10,20,30) skip first -> false
        const arr3 = new SparseArray<int>(10, 20, 30);
        expect(arr3.includes(10, 1)).assertFalse();
        // 4. includes(40,3) on sparse {0:10,2:30,3:40} -> true
        const arr4 = new SparseArray<int>(6);
        arr4[0] = 10;
        arr4[2] = 30;
        arr4[3] = 40;
        expect(arr4.includes(40, 3)).assertTrue();
        // 5. includes(40,1) on sparse {0:10,3:40} -> true
        const arr5 = new SparseArray<int>(5);
        arr5[0] = 10;
        arr5[3] = 40;
        expect(arr5.includes(40, 1)).assertTrue();
        // 6. includes(10,-1) on sparse {0:10} -> false
        const arr6 = new SparseArray<int>(5);
        arr6[0] = 10;
        expect(arr6.includes(10, -1)).assertFalse();
        // 7. includes(40,-2) on (10,20,30,40,50) -> true
        const arr7 = new SparseArray<int>(10, 20, 30, 40, 50);
        expect(arr7.includes(40, -2)).assertTrue();
        // 8. includes(42,4) on sparse {4:42} -> true
        const arr8 = new SparseArray<int>(5);
        arr8[4] = 42;
        expect(arr8.includes(42, 4)).assertTrue();
        // 9. includes(99,-1) on sparse {0:1,3:99} -> false
        const arr9 = new SparseArray<int>(5);
        arr9[0] = 1;
        arr9[3] = 99;
        expect(arr9.includes(99, -1)).assertFalse();
        // 10. includes('gamma',-1) on ('alpha','beta','gamma') -> true
        const arr10 = new SparseArray<string>('alpha', 'beta', 'gamma');
        expect(arr10.includes('gamma', -1)).assertTrue();

      }
      {
        // 1. includes(0.0) on (0.0,1.5,2.5) -> true
        const arr1 = new SparseArray<double>(0.0, 1.5, 2.5);
        expect(arr1.includes(0.0)).assertTrue();
        // 2. includes(Double.NaN) SameValueZero on (1.0,NaN,2.0) -> true
        const arr2 = new SparseArray<double>(1.0, Double.NaN, 2.0);
        expect(arr2.includes(Double.NaN)).assertTrue();
        // 3. includes(Double.NaN) on (1.0,2.0,3.0) no NaN -> false
        const arr3 = new SparseArray<double>(1.0, 2.0, 3.0);
        expect(arr3.includes(Double.NaN)).assertFalse();
        // 4. includes(+Inf) on (0.0,+Inf,1.0) -> true
        const arr4 = new SparseArray<double>(0.0, Double.POSITIVE_INFINITY, 1.0);
        expect(arr4.includes(Double.POSITIVE_INFINITY)).assertTrue();
        // 5. includes(-Inf) on (0.0,-Inf,1.0) -> true
        const arr5 = new SparseArray<double>(0.0, Double.NEGATIVE_INFINITY, 1.0);
        expect(arr5.includes(Double.NEGATIVE_INFINITY)).assertTrue();
        // 6. includes(MAX_VALUE) on (1.0,MAX_VALUE,2.0) -> true
        const arr6 = new SparseArray<double>(1.0, Number.MAX_VALUE, 2.0);
        expect(arr6.includes(Number.MAX_VALUE)).assertTrue();
        // 7. includes(EPSILON) on (1.0,EPSILON,2.0) -> true
        const arr7 = new SparseArray<double>(1.0, Number.EPSILON, 2.0);
        expect(arr7.includes(Number.EPSILON)).assertTrue();
        // 8. includes(BigInt(0)) on (0n,1n,2n) -> true
        const arr8 = new SparseArray<bigint>(BigInt(0), BigInt(1), BigInt(2));
        expect(arr8.includes(BigInt(0))).assertTrue();
        // 9. includes(Number.NaN,2) skip NaN at idx1 -> false
        const arr9 = new SparseArray<double>(0.5, Number.NaN, 2.0, 4.0);
        expect(arr9.includes(Number.NaN, 2)).assertFalse();
        // 10. includes(+Inf) on (1.0,2.0,3.0) -> false
        const arr10 = new SparseArray<double>(1.0, 2.0, 3.0);
        expect(arr10.includes(Number.POSITIVE_INFINITY)).assertFalse();

      }
      {
        // 1. includes(s='a\0b') on ('x',s,'y') -> true
        const s1: string = 'a\0b';
        const arr1 = new SparseArray<string>('x', s1, 'y');
        expect(arr1.includes(s1)).assertTrue();
        // 2. includes(1000-char str) on ('x',longStr,'y') -> true
        let longStr: string = '';
        for (let i = 0; i < 1000; i++) {
          longStr = longStr + 'A';
        }
        const arr2 = new SparseArray<string>('x', longStr, 'y');
        expect(arr2.includes(longStr)).assertTrue();
        // 3. includes('<script>...') on ('a','<script>...','b') -> true
        const arr3 = new SparseArray<string>('a', '<script>alert(1)</script>', 'b');
        expect(arr3.includes('<script>alert(1)</script>')).assertTrue();
        // 4. includes(null) on (null,obj1) -> true
        const obj1: SparseArrayIncludesPartObjectValue = { id: 1 };
        const arr4 = new SparseArray<SparseArrayIncludesPartObjectValue | null>(null, obj1);
        expect(arr4.includes(null)).assertTrue();
        // 5. includes(obj) on (obj) by ref -> true
        const obj2: SparseArrayIncludesPartObjectValue = { id: 42 };
        const arr5 = new SparseArray<SparseArrayIncludesPartObjectValue>(obj2);
        expect(arr5.includes(obj2)).assertTrue();
        // 6. includes(d) on (d) by ref -> true
        const dateA: Date = new Date(0);
        const arr6 = new SparseArray<Date>(dateA);
        expect(arr6.includes(dateA)).assertTrue();
        // 7. includes(epoch) on (epoch,later) -> true
        const epoch: Date = new Date(0);
        const later: Date = new Date(1000);
        const arr7 = new SparseArray<Date>(epoch, later);
        expect(arr7.includes(epoch)).assertTrue();
        // 8. includes(da2) on (da1,da3) ref-mismatch -> false
        const da1: Date = new Date(0);
        const da2: Date = new Date(1000);
        const da3: Date = new Date(2000);
        const arr8 = new SparseArray<Date>(da1, da3);
        expect(arr8.includes(da2)).assertFalse();
        // 9. includes(re) on (re) by ref -> true
        const re: RegExp = new RegExp('abc');
        const arr9 = new SparseArray<RegExp>(re);
        expect(arr9.includes(re)).assertTrue();
        // 10. includes(db2,-1) on (db1,db2) -> true
        const db1: Date = new Date(1000);
        const db2: Date = new Date(2000);
        const arr10 = new SparseArray<Date>(db1, db2);
        expect(arr10.includes(db2, -1)).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2400
     * @tc.name testAccessIndexOfNormal001
     * @tc.desc Test SparseArray.indexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessIndexOfNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          arr[0] = 10;
          arr[2] = 20;
          const index = arr.indexOf(20);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 10;
          arr[2] = 20;
          const index = arr.indexOf(20, 1);
          expect(index).assertEqual(2);


      }
      {
        const arr = new SparseArray<int>(2, 5, 9);
        const result = arr.indexOf(7);
        expect(result).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = -2147483648;
          const index = arr.indexOf(-2147483648);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int | null>();
          arr[0] = null;
          const index = arr.indexOf(null);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int | undefined>();
          arr[0] = undefined;
          const index = arr.indexOf(undefined);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 10;
          arr[2] = 20;
          arr[4] = 20;
          const index = arr.indexOf(20);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>();
          const index = arr.indexOf(10);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>(5);
          const index = arr.indexOf(10);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[4] = 20;
          const index = arr.indexOf(20);
          expect(index).assertEqual(4);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2500
     * @tc.name testAccessIndexOfNormal002
     * @tc.desc Test SparseArray.indexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessIndexOfNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[4] = 20;
          const index = arr.indexOf(20, 2);
          expect(index).assertEqual(4);


      }
      {
        const arr = new SparseArray<int>(2, 5, 9, 2);
        const result = arr.indexOf(2);
        expect(result).assertEqual(0);


      }
      {
        const arr = new SparseArray<int>(2, 5, 9, 2);
        const result = arr.indexOf(2, 1);
        expect(result).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[9] = 100;
          const index = arr.indexOf(100);
          expect(index).assertEqual(9);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 10;
          const index = arr.indexOf(10);
          expect(index).assertEqual(0);
          expect(Number.isInteger(index)).assertTrue();
          expect(arr[0]).assertEqual(10);


      }
      {
          const arr = new SparseArray<int>(42);
          const result = arr.indexOf(42);
          expect(result).assertEqual(-1);


      }
      {
          const arr = new SparseArray<Array<int>>();
          arr[0] = [1, 2, 3];
          const index = arr.indexOf([1, 2, 3]);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<Person037>();
          const p = new Person037("Alice");
          arr[0] = p;
          const index = arr.indexOf(p);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<number>();
          arr[0] = Double.NaN;
          const index = arr.indexOf(Double.NaN);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<number>();
          arr[0] = Double.POSITIVE_INFINITY;
          const index = arr.indexOf(Double.POSITIVE_INFINITY);
          expect(index).assertEqual(0);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2600
     * @tc.name testAccessIndexOfNormal003
     * @tc.desc Test SparseArray.indexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessIndexOfNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<number>();
          arr[0] = Double.NEGATIVE_INFINITY;
          const index = arr.indexOf(Double.NEGATIVE_INFINITY);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(1000);
          arr[0] = 10;
          arr[999] = 20;
          const index1 = arr.indexOf(10);
          const index2 = arr.indexOf(20);
          expect(index1).assertEqual(0);
          expect(index2).assertEqual(999);


      }
      {
          const arr = new SparseArray<int>(3);
          arr[0] = 10;
          const index = arr.indexOf(10, -3);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int | string | boolean>();
          arr[0] = 10;
          arr[2] = "hello";
          arr[4] = true;
          expect(arr.indexOf(10, 0)).assertEqual(0);
          expect(arr.indexOf("hello", 1)).assertEqual(2);
          expect(arr.indexOf(true, 3)).assertEqual(4);


      }
      {
          const arr = new SparseArray<long>();
          const target: long = 10000000000 as long;
          arr.$_set(0, 1 as long);
          arr.$_set(3, target);
          expect(arr.indexOf(target)).assertEqual(3);

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
          expect(arr.indexOf(2.5f)).assertEqual(1);
          expect(arr.indexOf(9.9f)).assertEqual(-1);

      }
      {
          const nan = Double.toFloat(Double.NaN);
          const arr = new SparseArray<float>();
          arr.$_set(0, nan);
          expect(arr.indexOf(nan)).assertEqual(-1);

      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 0x123;
          expect(arr.indexOf(0x123)).assertEqual(0);

      }
      {
          const token = "0x123";
          const arr = new SparseArray<string>("other", token);
          expect(arr.indexOf(token)).assertEqual(1);

      }
      {
          const zw = "\u200B";
          const arr = new SparseArray<string>("a", zw, "c");
          expect(arr.indexOf(zw)).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2700
     * @tc.name testAccessIndexOfNormal004
     * @tc.desc Test SparseArray.indexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessIndexOfNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<boolean>(true, false, true);
          expect(arr.indexOf(false, 1)).assertEqual(1);
          expect(arr.indexOf(false, 2)).assertEqual(-1);

      }
      {
          const arr = new SparseArray<char>(5);
          arr[1] = c'A';
          arr[4] = c'Z';
          expect(arr.indexOf(c'Z')).assertEqual(4);
          expect(arr.indexOf(c'A', 2)).assertEqual(-1);

      }
      {
          const arr = new SparseArray<int | undefined>(4);
          arr[1] = undefined;
          expect(arr.indexOf(undefined)).assertEqual(1);
          expect(arr.indexOf(undefined, 2)).assertEqual(-1);

      }
      {
          const arr = new SparseArray<int>(1, 2, 1);
          expect(arr.indexOf(1, 3)).assertEqual(-1);
          expect(arr.indexOf(2, 100)).assertEqual(-1);

      }
      {
        // 1. indexOf(10,0) on (10,20,30) -> 0
        const arr1 = new SparseArray<int>(10, 20, 30);
        expect(arr1.indexOf(10, 0)).assertEqual(0);
        // 2. indexOf('\t') on ('a','\t','b') -> 1
        const arr2 = new SparseArray<string>('a', '\t', 'b');
        expect(arr2.indexOf('\t')).assertEqual(1);
        // 3. indexOf('中文') on ('hello','中文','world') -> 1
        const arr3 = new SparseArray<string>('hello', '中文', 'world');
        expect(arr3.indexOf('中文')).assertEqual(1);
        // 4. indexOf('😀') on ('a','😀','b') -> 1
        const arr4 = new SparseArray<string>('a', '😀', 'b');
        expect(arr4.indexOf('😀')).assertEqual(1);
        // 5. indexOf(longStr 1000) on ('x',longStr,'y') -> 1
        let longStr5: string = '';
        for (let i = 0; i < 1000; i++) {
          longStr5 = longStr5 + 'A';
        }
        const arr5 = new SparseArray<string>('x', longStr5, 'y');
        expect(arr5.indexOf(longStr5)).assertEqual(1);
        // 6. indexOf('<script>...') on ('a','<script>alert(1)</script>','b') -> 1
        const arr6 = new SparseArray<string>('a', '<script>alert(1)</script>', 'b');
        expect(arr6.indexOf('<script>alert(1)</script>')).assertEqual(1);
        // 7. indexOf(true) on (false,true,false) -> 1
        const arr7 = new SparseArray<boolean>(false, true, false);
        expect(arr7.indexOf(true)).assertEqual(1);
        // 8. indexOf(false) on (true,false,true) -> 1
        const arr8 = new SparseArray<boolean>(true, false, true);
        expect(arr8.indexOf(false)).assertEqual(1);
        // 9. indexOf(MAX_BIGINT) on (1,MAX,2) -> 1
        const MAX_BIGINT9: bigint = 9223372036854775807n;
        const arr9 = new SparseArray<bigint>(BigInt(1), MAX_BIGINT9, BigInt(2));
        expect(arr9.indexOf(MAX_BIGINT9)).assertEqual(1);
        // 10. indexOf(MIN_BIGINT) on (1,MIN,2) -> 1
        const MIN_BIGINT10: bigint = -9223372036854775808n;
        const arr10 = new SparseArray<bigint>(BigInt(1), MIN_BIGINT10, BigInt(2));
        expect(arr10.indexOf(MIN_BIGINT10)).assertEqual(1);

      }
      {
        // 1. indexOf('') on ('x','y','z') -> -1
        const arr1 = new SparseArray<string>('x', 'y', 'z');
        expect(arr1.indexOf('')).assertEqual(-1);
        // 2. indexOf(zwsp) on ('a',zwsp,'b') -> 1
        const zws2: string = '​';
        const arr2 = new SparseArray<string>('a', zws2, 'b');
        expect(arr2.indexOf(zws2)).assertEqual(1);
        // 3. indexOf('a\0b') on ('x','a\0b','y') -> 1
        const s3: string = 'a\0b';
        const arr3 = new SparseArray<string>('x', s3, 'y');
        expect(arr3.indexOf(s3)).assertEqual(1);
        // 4. indexOf('grape') on ('apple','banana','cherry') -> -1
        const arr4 = new SparseArray<string>('apple', 'banana', 'cherry');
        expect(arr4.indexOf('grape')).assertEqual(-1);
        // 5. indexOf(true) on (false,false,false) -> -1
        const arr5 = new SparseArray<boolean>(false, false, false);
        expect(arr5.indexOf(true)).assertEqual(-1);
        // 6. indexOf(NaN) on (1.0,NaN,2.0) SameValueZero -> -1
        const arr6 = new SparseArray<double>(1.0, Double.NaN, 2.0);
        expect(arr6.indexOf(Double.NaN)).assertEqual(-1);
        // 7. indexOf(POSITIVE_INFINITY) on (0.0,+Inf,1.0) -> 1
        const arr7 = new SparseArray<double>(0.0, Double.POSITIVE_INFINITY, 1.0);
        expect(arr7.indexOf(Double.POSITIVE_INFINITY)).assertEqual(1);
        // 8. indexOf(NEGATIVE_INFINITY) on (0.0,-Inf,1.0) -> 1
        const arr8 = new SparseArray<double>(0.0, Double.NEGATIVE_INFINITY, 1.0);
        expect(arr8.indexOf(Double.NEGATIVE_INFINITY)).assertEqual(1);
        // 9. indexOf(Number.MAX_VALUE) on (0.0,MAX_VALUE,1.0) -> 1
        const arr9 = new SparseArray<double>(0.0, Number.MAX_VALUE, 1.0);
        expect(arr9.indexOf(Number.MAX_VALUE)).assertEqual(1);
        // 10. indexOf(Number.EPSILON) on (0.0,EPSILON,1.0) -> 1
        const arr10 = new SparseArray<double>(0.0, Number.EPSILON, 1.0);
        expect(arr10.indexOf(Number.EPSILON)).assertEqual(1);

      }
      {
        // 1. indexOf(obj same ref) on (obj) -> 0
        const obj1: SparseArrayIndexOfPart01ObjVal = { id: 1 };
        const arr1 = new SparseArray<SparseArrayIndexOfPart01ObjVal>(obj1);
        expect(arr1.indexOf(obj1)).assertEqual(0);
        // 2. indexOf(obj2 diff ref) on (obj1) -> -1
        const obj2a: SparseArrayIndexOfPart01ObjVal = { id: 1 };
        const obj2b: SparseArrayIndexOfPart01ObjVal = { id: 1 };
        const arr2 = new SparseArray<SparseArrayIndexOfPart01ObjVal>(obj2a);
        expect(arr2.indexOf(obj2b)).assertEqual(-1);
        // 3. indexOf(null) on (null,obj) -> 0
        const obj3: SparseArrayIndexOfPart01ObjVal = { id: 1 };
        const arr3 = new SparseArray<SparseArrayIndexOfPart01ObjVal | null>(null, obj3);
        expect(arr3.indexOf(null)).assertEqual(0);
        // 4. indexOf(d same ref) on (d) -> 0
        const dateA: Date = new Date(0);
        const arr4 = new SparseArray<Date>(dateA);
        expect(arr4.indexOf(dateA)).assertEqual(0);
        // 5. indexOf(d2 diff ref) on (d1) -> -1
        const dateB: Date = new Date(0);
        const dateC: Date = new Date(0);
        const arr5 = new SparseArray<Date>(dateB);
        expect(arr5.indexOf(dateC)).assertEqual(-1);
        // 6. indexOf(5,2) on (1,2,3,4,5) -> 4
        const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr6.indexOf(5, 2)).assertEqual(4);
        // 7. indexOf(1,0) on empty -> -1
        const arr7 = new SparseArray<int>();
        expect(arr7.indexOf(1, 0)).assertEqual(-1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2800
     * @tc.name testAccessLastIndexOfNormal001
     * @tc.desc Test SparseArray.lastIndexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLastIndexOfNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const index = arr.lastIndexOf(2);
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 2, 4);
          const index = arr.lastIndexOf(2);
          expect(index).assertEqual(3);


      }
      {
        const arr = new SparseArray<int>(2, 5, 9);
        const result = arr.lastIndexOf(7);
        expect(result).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 2147483647;
          const index = arr.lastIndexOf(2147483647);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(-1, -2, -3);
          const index = arr.lastIndexOf(-2);
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(0, 1, 2);
          const index = arr.lastIndexOf(0);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const index = arr.lastIndexOf("b");
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<string>("", "a", "");
          const index = arr.lastIndexOf("");
          expect(index).assertEqual(2);


      }
      {
          const obj1 = new LastIndexOfName("test");
          const obj2 = new LastIndexOfName("test");
          const arr = new SparseArray<LastIndexOfName>(obj1, obj2);
          const index = arr.lastIndexOf(obj1);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int | undefined>(undefined, 1, undefined);
          const index = arr.lastIndexOf(undefined);
          expect(index).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_2900
     * @tc.name testAccessLastIndexOfNormal002
     * @tc.desc Test SparseArray.lastIndexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLastIndexOfNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 2);
          const index = arr.lastIndexOf(2);
          expect(index).assertEqual(3);


      }
      {
          const arr100 = new SparseArray<int>(100);
          expect(arr100.lastIndexOf(100)).assertEqual(-1);
          const arr42 = new SparseArray<int>(42);
          expect(arr42.lastIndexOf(42)).assertEqual(-1);

      }
      {
          const arr = new SparseArray<int>(5, 5, 5, 5);
          const index = arr.lastIndexOf(5);
          expect(index).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const index = arr.lastIndexOf(999);
          expect(index).assertEqual(-1);


      }
      {
          const arr = new SparseArray<int>();
          const index = arr.lastIndexOf(1);
          expect(index).assertEqual(-1);


      }
      {
        const arr = new SparseArray<int>(2, 5, 9, 2);
        const result = arr.lastIndexOf(2, 2);
        expect(result).assertEqual(0);


      }
      {
          const arr = new SparseArray<boolean>(false, true);
          const index = arr.lastIndexOf(false);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const index = arr.lastIndexOf(10);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const index = arr.lastIndexOf(30);
          expect(index).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(6);
          arr[0] = 10;
          arr[2] = 20;
          arr[4] = 30;
          const index = arr.lastIndexOf(20);
          expect(index).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3000
     * @tc.name testAccessLastIndexOfNormal003
     * @tc.desc Test SparseArray.lastIndexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLastIndexOfNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          arr[0] = 1;
          arr[2] = 2;
          const index = arr.lastIndexOf(1);
          expect(index).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(1, 2, 1, 2, 1);
          const index = arr.lastIndexOf(1);
          expect(index).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 1;
          arr[2] = 1;
          arr[4] = 1;
          const index = arr.lastIndexOf(1);
          expect(index).assertEqual(4);


      }
      {
        const arr = new SparseArray<int>(2, 5, 9, 2);
        const result = arr.lastIndexOf(2);
        expect(result).assertEqual(3);


      }
      {
          const arr = new SparseArray<int | string>(1, "a", 2, "a");
          const index = arr.lastIndexOf("a");
          expect(index).assertEqual(3);


      }
      {
          const obj = new LastIndexOfIdBox(1);
          const arr = new SparseArray<LastIndexOfIdBox>(new LastIndexOfIdBox(0), obj);
          const index = arr.lastIndexOf(obj);
          expect(index).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr[i] = i % 10;
          }
          const index = arr.lastIndexOf(5);
          expect(index).assertEqual(995);


      }
      {
          const arr = new SparseArray<int>(10000);
          arr[0] = 1;
          arr[9999] = 1;
          const index = arr.lastIndexOf(1);
          expect(index).assertEqual(9999);


      }
      {
          const arr = new SparseArray<byte>(10 as byte, 20 as byte, 10 as byte);
          const index = arr.lastIndexOf(10 as byte);
          expect(index).assertEqual(2);

      }
      {
          const arr = new SparseArray<string | null>("a", null, "b", null);
          expect(arr.lastIndexOf(null)).assertEqual(3);
          expect(arr.lastIndexOf(null, 2)).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3100
     * @tc.name testAccessLastIndexOfNormal004
     * @tc.desc Test SparseArray.lastIndexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLastIndexOfNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 0o5, 3);
          expect(arr.lastIndexOf(0o5)).assertEqual(1);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 2, 4);
          expect(arr.lastIndexOf(2)).assertEqual(3);
          expect(arr.lastIndexOf(2, 2)).assertEqual(1);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 2);
          expect(arr.lastIndexOf(2)).assertEqual(3);
          expect(arr.lastIndexOf(2, 3)).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(5, 2, 9, 2);
          expect(arr.lastIndexOf(2)).assertEqual(3);
          expect(arr.lastIndexOf(2, 0)).assertEqual(-1);

      }
      {
          const arr = new SparseArray<int>(8);
          arr[0] = 7;
          arr[3] = 7;
          arr[6] = 7;
          expect(arr.lastIndexOf(7)).assertEqual(6);
          expect(arr.lastIndexOf(7, 4)).assertEqual(3);

      }
      {
          const arr = new SparseArray<string>("x", "y", "x", "z", "x");
          expect(arr.lastIndexOf("x")).assertEqual(4);
          expect(arr.lastIndexOf("x", 2)).assertEqual(2);

      }
      {
          const target = new LastIndexOfIdBox(7);
          const arr = new SparseArray<LastIndexOfIdBox>(target, new LastIndexOfIdBox(8), target);
          expect(arr.lastIndexOf(target)).assertEqual(2);
          expect(arr.lastIndexOf(target, 1)).assertEqual(0);

      }
      {
          const arr = new SparseArray<int>()
          arr[0] = 2147483647
          arr[2] = 2147483647
          const result = arr.lastIndexOf(2147483647)
          expect(result).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          const result = arr.lastIndexOf(5)
          expect(result).assertEqual(-1)

      }
      {
          const arr = new SparseArray<int>()
          arr[0] = 2
          arr[2] = 9
          arr[3] = 2
          const result = arr.lastIndexOf(2)
          expect(result).assertEqual(3)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3200
     * @tc.name testAccessLastIndexOfNormal005
     * @tc.desc Test SparseArray.lastIndexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLastIndexOfNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<int>(42);
        const result = arr.lastIndexOf(42);
        expect(result).assertEqual(-1);


      }
      {
        const arr = new SparseArray<string>("a", "b", "a");
        const result = arr.lastIndexOf("a", 1);
        expect(result).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>()
          const result = arr.lastIndexOf(1)
          expect(result).assertEqual(-1)

      }
      {
          const arr = new SparseArray<int>(100)
          const result = arr.lastIndexOf(100)
          expect(result).assertEqual(-1)

      }
      {
          const arr = new SparseArray<boolean>(false, true, false)
          const result = arr.lastIndexOf(false)
          expect(result).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 2)
          const result = arr.lastIndexOf(2)
          expect(result >= 0 && result < arr.length).assertTrue()

      }
      {
          const arr = new SparseArray<int>(2, 5, 9, 2)
          const result1 = arr.lastIndexOf(2)
          const result2 = arr.lastIndexOf(2, 3)
          expect(result1).assertEqual(result2)

      }
      {
          const arr = new SparseArray<int>(2, 5, 9, 2)
          const result = arr.lastIndexOf(2, undefined)
          expect(result).assertEqual(0)

      }
      {
          const arr = new SparseArray<string>("a", "b", "a")
          const result = arr.lastIndexOf("a", 2)
          expect(result).assertEqual(2)

      }
      {
          const arr = new SparseArray<boolean>(true, false, true)
          const result = arr.lastIndexOf(true, 2)
          expect(result).assertEqual(2)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3300
     * @tc.name testAccessLastIndexOfNormal006
     * @tc.desc Test SparseArray.lastIndexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLastIndexOfNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<number>(1.5, 2.5, 1.5)
          const result = arr.lastIndexOf(1.5, 2)
          expect(result).assertEqual(2)

      }
      {
          const obj = new LastIndexOf2Id(1)
          const arr = new SparseArray<LastIndexOf2Id>(obj, new LastIndexOf2Id(2), obj)
          const result = arr.lastIndexOf(obj, 2)
          expect(result).assertEqual(2)

      }
      {
          const arr = new SparseArray<int | string>(1, "a", 2, "a")
          const result = arr.lastIndexOf("a", 3)
          expect(result).assertEqual(3)

      }
      {
          const arr = new SparseArray<int | null>(null, 1, null)
          const result = arr.lastIndexOf(null, 2)
          expect(result).assertEqual(2)

      }
      {
          const arr = new SparseArray<int | undefined>(undefined, 1, undefined)
          const result = arr.lastIndexOf(undefined, 2)
          expect(result).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>(1, 2, 1, 2, 1)
          const first = arr.indexOf(1)
          const last = arr.lastIndexOf(1)
          expect(first).assertEqual(0)
          expect(last).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          for (let i = 0; i < 1000; i++) {
            arr[i] = i % 10
          }
          const result = arr.lastIndexOf(5)
          expect(result).assertEqual(995)

      }
      {
          const arr = new SparseArray<int>()
          for (let i = 0; i < 1000; i++) {
            arr[i] = i % 10
          }
          const result = arr.lastIndexOf(5, 500)
          expect(result).assertEqual(495)

      }
      {
          const arr = new SparseArray<int>(10000)
          arr[0] = 1
          arr[9999] = 1
          const result = arr.lastIndexOf(1)
          expect(result).assertEqual(9999)

      }
      {
          const arr = new SparseArray<int>()
          arr[1000000] = 42
          const result = arr.lastIndexOf(42, 1000000)
          expect(result).assertEqual(1000000)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3400
     * @tc.name testAccessLastIndexOfNormal007
     * @tc.desc Test SparseArray.lastIndexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLastIndexOfNormal007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          arr[0] = 2
          arr[2] = 5
          arr[3] = 9
          arr[5] = 2
          const result = arr.lastIndexOf(2, 4)
          expect(result).assertEqual(0)

      }
      {
          const arr = new SparseArray<int | string>()
          arr[0] = 1
          arr[2] = "a"
          arr[4] = 1
          const result = arr.lastIndexOf(1, 3)
          expect(result).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>()
          const result = arr.lastIndexOf(1, 0)
          expect(result).assertEqual(-1)

      }
      {
          const arr = new SparseArray<int>(100)
          const result = arr.lastIndexOf(100, 0)
          expect(result).assertEqual(-1)

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 1.0f, 3.0f);
          const index = arr.lastIndexOf(1.0f, 2);
          expect(index).assertEqual(2);

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3, null);
          expect(arr.lastIndexOf(null)).assertEqual(3);
          expect(arr.lastIndexOf(null, 2)).assertEqual(1);

      }
      {
          const arr = new SparseArray<int>(0xFF, 1, 0xFF);
          expect(arr.lastIndexOf(0xFF)).assertEqual(2);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'A', c'C');
          expect(arr.lastIndexOf(c'A')).assertEqual(2);
          expect(arr.lastIndexOf(c'A', 1)).assertEqual(0);

      }
      {
          const arr = new SparseArray<boolean>(false, true, false);
          expect(arr.lastIndexOf(false)).assertEqual(2);
          expect(arr.lastIndexOf(false, 0)).assertEqual(0);

      }
      {
          const arr = new SparseArray<int | undefined>(5);
          arr[1] = undefined;
          arr[4] = undefined;
          expect(arr.lastIndexOf(undefined)).assertEqual(4);
          expect(arr.lastIndexOf(undefined, 3)).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3500
     * @tc.name testAccessLastIndexOfNormal008
     * @tc.desc Test SparseArray.lastIndexOf method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLastIndexOfNormal008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const target: byte = 7 as byte;
          const arr = new SparseArray<byte>(8);
          arr[2] = target;
          arr[6] = target;
          expect(arr.lastIndexOf(target)).assertEqual(6);
          expect(arr.lastIndexOf(target, 5)).assertEqual(2);

      }
      {
        // 1. lastIndexOf(0) on len=0 sparse@{0} -> 0
        const arr1 = new SparseArray<int>(0);
        arr1[0] = 0;
        expect(arr1.lastIndexOf(0)).assertEqual(0);
        // 2. lastIndexOf(3) on (1,2,3) -> 2
        const arr2 = new SparseArray<int>(1, 2, 3);
        expect(arr2.lastIndexOf(3)).assertEqual(2);
        // 3. lastIndexOf(1) on (1,2,1,3,1) -> 4
        const arr3 = new SparseArray<int>(1, 2, 1, 3, 1);
        expect(arr3.lastIndexOf(1)).assertEqual(4);
        // 4. lastIndexOf(-1) on (5,-1,3,-1) -> 3
        const arr4 = new SparseArray<int>(5, -1, 3, -1);
        expect(arr4.lastIndexOf(-1)).assertEqual(3);
        // 5. lastIndexOf(1) on ten 1s -> 9
        const arr5 = new SparseArray<int>(1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
        expect(arr5.lastIndexOf(1)).assertEqual(9);
        // 6. lastIndexOf(1) on (9,8,7,6,5,4,3,2,1,3,2,1) -> 11
        const arr6 = new SparseArray<int>(9, 8, 7, 6, 5, 4, 3, 2, 1, 3, 2, 1);
        expect(arr6.lastIndexOf(1)).assertEqual(11);
        // 7. lastIndexOf(20) on (10,20,30,20) -> 3
        const arr7 = new SparseArray<int>(10, 20, 30, 20);
        expect(arr7.lastIndexOf(20)).assertEqual(3);
        // 8. lastIndexOf(10) on (5,10,15) -> 1
        const arr8 = new SparseArray<int>(5, 10, 15);
        expect(arr8.lastIndexOf(10)).assertEqual(1);
        // 9. lastIndexOf(1)->0 and lastIndexOf(3)->2 on (1,2,3)
        const arr9 = new SparseArray<int>(1, 2, 3);
        expect(arr9.lastIndexOf(1)).assertEqual(0);
        expect(arr9.lastIndexOf(3)).assertEqual(2);
        // 10. lastIndexOf(1) on len=3 sparse@{0,2} -> 2
        const arr10 = new SparseArray<int>(3);
        arr10[0] = 1;
        arr10[2] = 1;
        expect(arr10.lastIndexOf(1)).assertEqual(2);

      }
      {
        // 1. lastIndexOf(0) on empty -> -1
        const arr1 = new SparseArray<int>();
        expect(arr1.lastIndexOf(0)).assertEqual(-1);
        // 2. lastIndexOf(1) on single (6) -> -1
        const arr2 = new SparseArray<int>(6);
        expect(arr2.lastIndexOf(1)).assertEqual(-1);
        // 3. lastIndexOf(9) on len=5 sparse@{2} -> 2
        const arr3 = new SparseArray<int>(5);
        arr3[2] = 9;
        expect(arr3.lastIndexOf(9)).assertEqual(2);
        // 4. lastIndexOf('') on ('','a','','b') -> 2
        const arr4 = new SparseArray<string>('', 'a', '', 'b');
        expect(arr4.lastIndexOf('')).assertEqual(2);
        // 5. lastIndexOf('hello') on ('hello','world','hello') -> 2
        const arr5 = new SparseArray<string>('hello', 'world', 'hello');
        expect(arr5.lastIndexOf('hello')).assertEqual(2);
        // 6. lastIndexOf('你好') on ('你好','世界','你好') -> 2
        const arr6 = new SparseArray<string>('你好', '世界', '你好');
        expect(arr6.lastIndexOf('你好')).assertEqual(2);
        // 7. lastIndexOf('😀') on ('😀','abc','😀','xyz') -> 2
        const arr7 = new SparseArray<string>('😀', 'abc', '😀', 'xyz');
        expect(arr7.lastIndexOf('😀')).assertEqual(2);
        // 8. lastIndexOf('\t') on ('\t','x','\t','y') -> 2
        const arr8 = new SparseArray<string>('\t', 'x', '\t', 'y');
        expect(arr8.lastIndexOf('\t')).assertEqual(2);
        // 9. lastIndexOf('\n') on ('\n','x','\n') -> 2
        const arr9 = new SparseArray<string>('\n', 'x', '\n');
        expect(arr9.lastIndexOf('\n')).assertEqual(2);
        // 10. lastIndexOf('\0') on ('\0','a','\0') -> 2
        const arr10 = new SparseArray<string>('\0', 'a', '\0');
        expect(arr10.lastIndexOf('\0')).assertEqual(2);

      }
      {
        // 1. lastIndexOf(true) on (true,false,true,false) -> 2
        const arr1 = new SparseArray<boolean>(true, false, true, false);
        expect(arr1.lastIndexOf(true)).assertEqual(2);
        // 2. lastIndexOf(false) on (false,true,false,true) -> 2
        const arr2 = new SparseArray<boolean>(false, true, false, true);
        expect(arr2.lastIndexOf(false)).assertEqual(2);
        // 3. lastIndexOf(0.0) on (0.0,1.5,0.0,2.5) -> 2
        const arr3 = new SparseArray<double>(0.0, 1.5, 0.0, 2.5);
        expect(arr3.lastIndexOf(0.0)).assertEqual(2);
        // 4. lastIndexOf(-0.0) on (-0.0,1.5,-0.0) -> 2
        const arr4 = new SparseArray<double>(-0.0, 1.5, -0.0);
        expect(arr4.lastIndexOf(-0.0)).assertEqual(2);
        // 5. lastIndexOf(Number.NaN) on (NaN,1.0,NaN) -> -1
        const arr5 = new SparseArray<double>(Number.NaN, 1.0, Number.NaN);
        expect(arr5.lastIndexOf(Number.NaN)).assertEqual(-1);
        // 6. lastIndexOf(Number.POSITIVE_INFINITY) -> 2
        const arr6 = new SparseArray<double>(Number.POSITIVE_INFINITY, 1.0, Number.POSITIVE_INFINITY);
        expect(arr6.lastIndexOf(Number.POSITIVE_INFINITY)).assertEqual(2);
        // 7. lastIndexOf(-Number.POSITIVE_INFINITY) -> 2
        const arr7 = new SparseArray<double>(-Number.POSITIVE_INFINITY, 1.0, -Number.POSITIVE_INFINITY);
        expect(arr7.lastIndexOf(-Number.POSITIVE_INFINITY)).assertEqual(2);
        // 8. lastIndexOf(0n) on (0n,1n,0n,2n) -> 2
        const arr8 = new SparseArray<bigint>(0n, 1n, 0n, 2n);
        expect(arr8.lastIndexOf(0n)).assertEqual(2);
        // 9. lastIndexOf(100n) on (0n,1n,2n) -> -1
        const arr9 = new SparseArray<bigint>(0n, 1n, 2n);
        expect(arr9.lastIndexOf(100n)).assertEqual(-1);

      }
      {
        // 1. lastIndexOf(obj) on ({id:0},obj,{id:2}) -> 1
        const obj1: SparseArrayLastIndexOfPart01ObjVal = { id: 1 };
        const arr1 = new SparseArray<SparseArrayLastIndexOfPart01ObjVal>(
          { id: 0 } as SparseArrayLastIndexOfPart01ObjVal,
          obj1,
          { id: 2 } as SparseArrayLastIndexOfPart01ObjVal,
        );
        expect(arr1.lastIndexOf(obj1)).assertEqual(1);
        // 2. lastIndexOf({id:1} new) on ({id:1},{id:2}) -> -1
        const arr2 = new SparseArray<SparseArrayLastIndexOfPart01ObjVal>(
          { id: 1 } as SparseArrayLastIndexOfPart01ObjVal,
          { id: 2 } as SparseArrayLastIndexOfPart01ObjVal,
        );
        expect(arr2.lastIndexOf({ id: 1 } as SparseArrayLastIndexOfPart01ObjVal)).assertEqual(-1);
        // 3. lastIndexOf(target) on (target,{id:0},target) -> 2
        const target3: SparseArrayLastIndexOfPart01ObjVal = { id: 42 };
        const arr3 = new SparseArray<SparseArrayLastIndexOfPart01ObjVal>(
          target3,
          { id: 0 } as SparseArrayLastIndexOfPart01ObjVal,
          target3,
        );
        expect(arr3.lastIndexOf(target3)).assertEqual(2);
        // 4. lastIndexOf(d) on (Date(1000),d,Date(2000)) -> 1
        const dateA: Date = new Date(0);
        const arr4 = new SparseArray<Date>(new Date(1000), dateA, new Date(2000));
        expect(arr4.lastIndexOf(dateA)).assertEqual(1);
        // 5. lastIndexOf(new Date(1000)) on (Date(1000),Date(2000)) -> -1
        const arr5 = new SparseArray<Date>(new Date(1000), new Date(2000));
        expect(arr5.lastIndexOf(new Date(1000))).assertEqual(-1);
        // 6. lastIndexOf(d) on (Date(0),d,Date(10000),d) -> 3
        const dateB: Date = new Date(5000);
        const arr6 = new SparseArray<Date>(new Date(0), dateB, new Date(10000), dateB);
        expect(arr6.lastIndexOf(dateB)).assertEqual(3);
        // 7. lastIndexOf(re) on (RegExp(xyz),re,RegExp(123)) -> 1
        const re7: RegExp = new RegExp('abc');
        const arr7 = new SparseArray<RegExp>(new RegExp('xyz'), re7, new RegExp('123'));
        expect(arr7.lastIndexOf(re7)).assertEqual(1);
        // 8. lastIndexOf(new RegExp('abc')) on (RegExp(abc),RegExp(def)) -> -1
        const arr8 = new SparseArray<RegExp>(new RegExp('abc'), new RegExp('def'));
        expect(arr8.lastIndexOf(new RegExp('abc'))).assertEqual(-1);
        // 9. lastIndexOf(re) on (re,RegExp(a),re,RegExp(b)) -> 2
        const re9: RegExp = new RegExp('test');
        const arr9 = new SparseArray<RegExp>(re9, new RegExp('a'), re9, new RegExp('b'));
        expect(arr9.lastIndexOf(re9)).assertEqual(2);

      }
      {
        // 1. lastIndexOf(null, 3) on (0, null, 2, null, 4) -> 3
        const arr1 = new SparseArray<int | null>(0, null, 2, null, 4);
        expect(arr1.lastIndexOf(null, 3)).assertEqual(3);
        // 2. lastIndexOf(99) on (99, 1, 2, 99, 3) -> 3; (99, 0) -> 0
        const arr2 = new SparseArray<int>(99, 1, 2, 99, 3);
        expect(arr2.lastIndexOf(99)).assertEqual(3);
        expect(arr2.lastIndexOf(99, 0)).assertEqual(0);
        // 3. lastIndexOf('target') on ('target', 'other1', 'other2') -> 0; ('target', 0) -> 0
        const arr3 = new SparseArray<string>('target', 'other1', 'other2');
        expect(arr3.lastIndexOf('target')).assertEqual(0);
        expect(arr3.lastIndexOf('target', 0)).assertEqual(0);
        // 4. lastIndexOf(0.0) on (0.0, 1.1, 2.2, 3.3, 0.0) -> 4; (0.0, 0) -> 0
        const arr4 = new SparseArray<double>(0.0, 1.1, 2.2, 3.3, 0.0);
        expect(arr4.lastIndexOf(0.0)).assertEqual(4);
        expect(arr4.lastIndexOf(0.0, 0)).assertEqual(0);
        // 5. lastIndexOf('dog') on ('cat', 'dog', 'bird', 'dog') leaves elements unchanged
        const arr5 = new SparseArray<string>('cat', 'dog', 'bird', 'dog');
        arr5.lastIndexOf('dog');
        expect(arr5[0]!).assertEqual('cat');
        expect(arr5[1]!).assertEqual('dog');
        expect(arr5[2]!).assertEqual('bird');
        expect(arr5[3]!).assertEqual('dog');
        // 6. lastIndexOf('d', 4) on sparse {0:'a', 3:'d'} leaves holes at 1, 2 undefined
        const arr6 = new SparseArray<string>(4);
        arr6[0] = 'a';
        arr6[3] = 'd';
        arr6.lastIndexOf('d', 4);
        expect(arr6[1]).assertUndefined();
        expect(arr6[2]).assertUndefined();
        // 7. lastIndexOf(9) on (1, 2, 3) -> -1; (9, 2) -> -1
        const arr7 = new SparseArray<int>(1, 2, 3);
        expect(arr7.lastIndexOf(9)).assertEqual(-1);
        expect(arr7.lastIndexOf(9, 2)).assertEqual(-1);
        // 8. fromIndex 100 beyond length on (1, 2, 3, 1) -> 1 at 3, 2 at 1
        const arr8 = new SparseArray<int>(1, 2, 3, 1);
        expect(arr8.lastIndexOf(1, 100)).assertEqual(3);
        expect(arr8.lastIndexOf(2, 100)).assertEqual(1);
        // 9. fromIndex = length on (5, 6, 7, 5) -> 5 at 3, equals lastIndexOf(5) -> 3
        const arr9 = new SparseArray<int>(5, 6, 7, 5);
        expect(arr9.lastIndexOf(5, 4)).assertEqual(3);
        expect(arr9.lastIndexOf(5)).assertEqual(3);
        // 10. fromIndex 0 on ('a', 'b', 'c') -> 'c' at -1, 'a' at 0
        const arr10 = new SparseArray<string>('a', 'b', 'c');
        expect(arr10.lastIndexOf('c', 0)).assertEqual(-1);
        expect(arr10.lastIndexOf('a', 0)).assertEqual(0);

      }
      {
        // 1. lastIndexOf('x') on ('x', 'y', 'x', 'z') -> 2; ('x', 1) -> 0
        const arr1 = new SparseArray<string>('x', 'y', 'x', 'z');
        expect(arr1.lastIndexOf('x')).assertEqual(2);
        expect(arr1.lastIndexOf('x', 1)).assertEqual(0);
        // 2. lastIndexOf('yes') on ('yes', 'no', 'yes') -> 2; ('yes', 0) -> 0
        const arr2 = new SparseArray<string>('yes', 'no', 'yes');
        expect(arr2.lastIndexOf('yes')).assertEqual(2);
        expect(arr2.lastIndexOf('yes', 0)).assertEqual(0);
        // 3. lastIndexOf on (4, 5, 4, 5, 4): (4) -> 4, (4, 0) -> 0, (5) -> 3, (5, 1) -> 1
        const arr3 = new SparseArray<int>(4, 5, 4, 5, 4);
        expect(arr3.lastIndexOf(4)).assertEqual(4);
        expect(arr3.lastIndexOf(4, 0)).assertEqual(0);
        expect(arr3.lastIndexOf(5)).assertEqual(3);
        expect(arr3.lastIndexOf(5, 1)).assertEqual(1);
        // 4. lastIndexOf(7) on (7, 7, 7, 7) -> 3; (7, 1) -> 1
        const arr4 = new SparseArray<int>(7, 7, 7, 7);
        expect(arr4.lastIndexOf(7)).assertEqual(3);
        expect(arr4.lastIndexOf(7, 1)).assertEqual(1);
        // 5. negative fromIndex: lastIndexOf(3, -1) on (3, 1, 3, 2, 4) -> 2, equals lastIndexOf(3) -> 2
        const arr5 = new SparseArray<int>(3, 1, 3, 2, 4);
        expect(arr5.lastIndexOf(3, -1)).assertEqual(2);
        expect(arr5.lastIndexOf(3)).assertEqual(2);
        // 6. fromIndex INT_MAX 2147483647 on (8, 9, 8) -> 8 at 2, 9 at 1 (no overflow)
        const arr6 = new SparseArray<int>(8, 9, 8);
        expect(arr6.lastIndexOf(8, 2147483647)).assertEqual(2);
        expect(arr6.lastIndexOf(9, 2147483647)).assertEqual(1);
        // 7. booleans: lastIndexOf(true) on (false, true, false, true) -> 3; (false) -> 2
        const arr7 = new SparseArray<boolean>(false, true, false, true);
        expect(arr7.lastIndexOf(true)).assertEqual(3);
        expect(arr7.lastIndexOf(false)).assertEqual(2);
        // 8. bigints: lastIndexOf(200n) on (100n, 200n, 200n) -> 2; (100n) -> 0
        const arr8 = new SparseArray<bigint>(100n, 200n, 200n);
        expect(arr8.lastIndexOf(200n)).assertEqual(2);
        expect(arr8.lastIndexOf(100n)).assertEqual(0);
        const dateA: Date = new Date(0);
        const dateB: Date = new Date(1000);
        const arr9 = new SparseArray<Date>(dateA, dateB, dateA);
        expect(arr9.lastIndexOf(dateA)).assertEqual(2);
        expect(arr9.lastIndexOf(new Date(0))).assertEqual(-1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3600
     * @tc.name testAccessLengthGetNormal001
     * @tc.desc Test SparseArray.length getter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLengthGetNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10);
          const len: int = arr.length;
          expect(len).assertEqual(10);
          expect(arr.length).assertEqual(10 as int);
          expect(len + 5).assertEqual(15 as int);


      }
      {
          const arr1 = new SparseArray<int>();
          expect(arr1.length).assertEqual(0);
          const arr2 = new SparseArray<int>(5);
          expect(arr2.length).assertEqual(5);
          const arr3 = new SparseArray<int>(1, 2, 3);
          expect(arr3.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10);
          arr.length = 5;
          expect(arr.length).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>();
          arr.push(1);
          expect(arr.length).assertEqual(1);
          arr.push(2, 3);
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.pop();
          expect(arr.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30, 40, 50);
          arr.splice(2);
          expect(arr.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(10000);
          expect(arr.length).assertEqual(10000);


      }
      {
          const arr = new SparseArray<int>(6);
          arr[2] = 10;
          arr[4] = 20;
          expect(arr.length).assertEqual(6);


      }
      {
          const arr = SparseArray.of<int>(1, 2, 3, 4, 5);
          expect(arr.length).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(3, 4);
          arr.unshift(1, 2);
          expect(arr.length).assertEqual(4);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3700
     * @tc.name testAccessLengthGetNormal002
     * @tc.desc Test SparseArray.length getter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLengthGetNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.shift();
          expect(arr.length).assertEqual(2);


      }
      {
          const arr1 = new SparseArray<int>(5);
          expect(arr1.length).assertEqual(5);

          const arr2 = new SparseArray<string>(5);
          expect(arr2.length).assertEqual(5);

          const arr3 = new SparseArray<boolean>(5);
          expect(arr3.length).assertEqual(5);

          const arr4 = new SparseArray<SparseArray<int>>(5);
          expect(arr4.length).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr.length).assertEqual(3);
          arr.push(4);
          expect(arr.length).assertEqual(4);
          arr.pop();
          expect(arr.length).assertEqual(3);
          arr.shift();
          expect(arr.length).assertEqual(2);
          arr.unshift(0);
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10);
          expect(arr.length).assertEqual(10);

          arr[5] = 100;
          expect(arr.length).assertEqual(10);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[10] = 100;
          expect(arr.length).assertEqual(11);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const sliced = arr.slice(1, 3);
          expect(sliced.length).assertEqual(2);
          expect(arr.length).assertEqual(5);


      }
      {
          const arr1 = new SparseArray<int>(1, 2);
          const arr2 = [3, 4] as Array<int>;
          const newArr = arr1.concat(arr2);
          expect(arr1.length).assertEqual(2);
          expect(newArr.length).assertEqual(4);


      }
      {
          const arr = new SparseArray<long>();
          arr.push(10000000000 as long, 20000000000 as long);
          expect(arr.length).assertEqual(2);

      }
      {
          const arr = new SparseArray<long>();
          const nearMax: long = 9223372036854775806 as long;
          arr.push(nearMax);
          expect(arr.length).assertEqual(1);

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3);
          expect(arr.length).assertEqual(3);
          expect(arr[1]).assertEqual(null);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3800
     * @tc.name testAccessLengthGetNormal003
     * @tc.desc Test SparseArray.length getter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLengthGetNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(0x1, 0b10);
          expect(arr.length).assertEqual(2);
          expect(arr[0x1]).assertEqual(0b10);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          expect(arr.length).assertEqual(3);
          expect(arr[2]).assertEqual(c'C');

      }
      {
          const arr = new SparseArray<boolean>(true, false);
          expect(arr.length).assertEqual(2);
          expect(arr[1]).assertEqual(false);

      }
      {
          const arr = new SparseArray<string>();
          arr[31] = "tail";
          expect(arr.length).assertEqual(32);
          expect(arr[30]).assertUndefined();

      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const first = arr.shift();
          expect(first).assertEqual(10);
          expect(arr.length).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_3900
     * @tc.name testAccessLengthSetterNormal001
     * @tc.desc Test SparseArray.length setter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLengthSetterNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(7, 5, 4);
          arr.length = 5;
          expect(arr.length).assertEqual(5);
          expect(arr[0]).assertEqual(7);
          expect(arr[1]).assertEqual(5);
          expect(arr[2]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(3, 4, 5);
          arr.length = 1;
          expect(arr.length).assertEqual(1);
          expect(arr[0]).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.length = 0;
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>();
          arr.length = 10000;
          expect(arr.length).assertEqual(10000);


      }
      {
          const arr = new SparseArray<int>();
          arr.length = 0x7FFFFFFF;
          expect(arr.length).assertEqual(2147483647);


      }
      {
          const arr = new SparseArray<int>();
          const wrapped: int = ((-2147483648 as int) - (1 as int)) as int;
          expect(wrapped).assertEqual(2147483647 as int);
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(2, 2, 3);
          arr.length = 2;
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(2);
          expect(arr[1]).assertEqual(2);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.length = 10;
          expect(arr.length).assertEqual(10);
          expect(arr[0]).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.length = 5;
          expect(result).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.length = 5;
          expect(arr.length).assertEqual(5);
          arr.length = 2;
          expect(arr.length).assertEqual(2);
          arr.length = 8;
          expect(arr.length).assertEqual(8);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_4000
     * @tc.name testAccessLengthSetterNormal002
     * @tc.desc Test SparseArray.length setter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLengthSetterNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.length = 10;
          expect(arr.length).assertEqual(10);
          arr.length = 5;
          expect(arr.length).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          arr.length = 3;
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(2);
          arr[0] = 1;
          arr.length = 5;
          expect(arr.length).assertEqual(5);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(undefined);


      }
      {
          const intArr = new SparseArray<int>(1, 2, 3);
          intArr.length = 5;
          expect(intArr.length).assertEqual(5);

          const stringArr = new SparseArray<string>("a", "b", "c");
          stringArr.length = 10;
          expect(stringArr.length).assertEqual(10);

          const boolArr = new SparseArray<boolean>(true, false);
          boolArr.length = 3;
          expect(boolArr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<byte>(10 as byte, 20 as byte);
          arr.length = 4;
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertEqual(10 as byte);
          expect(arr[1]).assertEqual(20 as byte);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.length = 0o12;
          expect(arr.length).assertEqual(10);
          arr.length = 0b101;
          expect(arr.length).assertEqual(5);

      }
      {
          const arr = new SparseArray<int | null>(1, 2, 3, null, 5);
          arr.length = 0o10;
          expect(arr.length).assertEqual(8);
          expect(arr[0x3]).assertEqual(null);

      }
      {
          const arr = new SparseArray<string>(" ", "\t", "x");
          arr.length = 2;
          expect(arr[0]).assertEqual(" ");
          expect(arr[1]).assertEqual("\t");

      }
      {
          const arr = new SparseArray<char>(c'A', c'B', c'C');
          arr.length = 2;
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(c'A');
          expect(arr[2]).assertUndefined();

      }
      {
          const arr = new SparseArray<boolean>(false);
          arr.length = 4;
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertEqual(false);
          expect(arr[3]).assertUndefined();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_4100
     * @tc.name testAccessLengthSetterNormal003
     * @tc.desc Test SparseArray.length setter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLengthSetterNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[4] = 40;
          arr.length = 0;
          expect(arr.length).assertEqual(0);
          expect(arr[0]).assertUndefined();

      }
      {
          const arr = new SparseArray<string>();
          arr[8] = "tail";
          arr.length = 4;
          expect(arr.length).assertEqual(4);
          expect(arr[8]).assertUndefined();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ACCESSOR_4200
     * @tc.name testAccessLengthSetterError001
     * @tc.desc Test SparseArray.length setter method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAccessLengthSetterError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.length = -1;
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("RangeError");
          }
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>();
          try {
            arr.length = ((2147483647 as int) + (1 as int)) as int;
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("RangeError");
          }

      }
      {
          const arr = new SparseArray<int>();
          try {
            arr.length = ("" as Object as int);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

  });
}
