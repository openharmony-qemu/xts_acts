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

enum Color019 {
    Red,
    Green,
    Blue
  }

enum Color020 {
    Red,
    Green,
    Blue
  }

interface Obj04902 {
  id: int;
}

// Consolidated SparseArrayPushPart01Test (28 scenarios -> 3 merged cases, each <=10)

class TestObj017 {
    value: int = 0
  }

class Person029 {
    name: string = ""
    age: int = 0
  }

class TestClass040 {
    value: int = 0
  }

class TestClass042 {
    value: int = 0
  }

class UndoStack063 {
    private history: SparseArray<string> = new SparseArray<string>()

    pushState(state: string): void {
      this.history.push(state)
    }

    undo(): string | undefined {
      return this.history.pop()
    }

    canUndo(): boolean {
      return this.history.length > 0
    }
  }

class TaskQueue064 {
    private tasks: SparseArray<int> = new SparseArray<int>()

    addTask(taskId: int): void {
      this.tasks.push(taskId)
    }

    getNextTask(): int | undefined {
      return this.tasks.pop()
    }

    hasTasks(): boolean {
      return this.tasks.length > 0
    }
  }

interface SimpleObj04501 {
  id: number;
}

// Consolidated SparseArrayPopPart01Test (35 scenarios -> 4 merged cases, each <=10)

class TestClass007 {
    public value: int = 100;
  }

class Person025 {
    public name: string = "test";
    public age: int = 30;
  }

export default function SparseArrayStackTest(): void {
  describe('SparseArrayStackTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0100
     * @tc.name testStackPushNormal001
     * @tc.desc Test SparseArray.push method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          let length = arr.push()
          expect(length).assertEqual(0)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>()
          let length = arr.push(10)
          expect(length).assertEqual(1)

      }
      {
          const arr = new SparseArray<int>()
          let length = arr.push(10, 20)
          expect(length).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>()
          let length = arr.push(10, 20, 30, 40, 50)
          expect(length).assertEqual(5)

      }
      {
          const arr = new SparseArray<int>()
          let length = arr.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
          expect(length).assertEqual(10)

      }
      {
          const arr = new SparseArray<int | null>()
          let length = arr.push(null, 10)
          expect(length).assertEqual(2)

      }
      {
          const arr = new SparseArray<int | undefined>()
          let length = arr.push(undefined, 20)
          expect(length).assertEqual(2)

      }
      {
          const arr = new SparseArray<string>()
          let length = arr.push("hello", "world")
          expect(length).assertEqual(2)

      }
      {
          const arr = new SparseArray<string>()
          let length = arr.push("")
          expect(length).assertEqual(1)

      }
      {
          const arr = new SparseArray<string>()
          let length = arr.push("\n", "\t", "\\")
          expect(length).assertEqual(3)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0200
     * @tc.name testStackPushNormal002
     * @tc.desc Test SparseArray.push method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>()
          let length = arr.push("\udc04", "\xe4")
          expect(length).assertEqual(2)

      }
      {
          const arr = new SparseArray<boolean>()
          let length = arr.push(true, false, true)
          expect(length).assertEqual(3)

      }
      {
          const arr = new SparseArray<char>()
          let length = arr.push(c'A', c'B', c'C')
          expect(length).assertEqual(3)

      }
      {
          const arr = new SparseArray<char>()
          let length = arr.push(c'\n')
          expect(length).assertEqual(1)

      }
      {
          const arr = new SparseArray<int | string>()
          let length = arr.push(100, "hello", 200)
          expect(length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int | null>()
          let length = arr.push(100, null, 200)
          expect(length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int | undefined>()
          let length = arr.push(100, undefined, 200)
          expect(length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int | string | boolean>()
          let length = arr.push(10, "hello", true, 20)
          expect(length).assertEqual(4)

      }
      {
          const arr = new SparseArray<Color019>()
          let length = arr.push(Color019.Red, Color019.Green, Color019.Blue)
          expect(length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>()
          let source = [10, 20, 30]
          let length = arr.push(...source)
          expect(length).assertEqual(3)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0300
     * @tc.name testStackPushNormal003
     * @tc.desc Test SparseArray.push method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          let source1 = [10, 20]
          let source2 = [30, 40]
          let length = arr.push(...source1, ...source2)
          expect(length).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          let source = [20, 30]
          let length = arr.push(10, ...source, 40)
          expect(length).assertEqual(4)

      }
      {
          const source = new SparseArray<int>(1, 2, 3)
          const target = new SparseArray<int>()
          let length = target.length
          source.forEach((value: int, index: int): void => {
            length = target.push(value)
          })
          expect(length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>()
          let length = arr.push(10, 20, 30)
          expect(length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>(5, 10)
          let length = arr.push(15, 20)
          expect(length).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          let length1 = arr.push(10, 20)
          let length2 = arr.push(30, 40)
          expect(length1).assertEqual(2)
          expect(length2).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          let length: int = arr.push(10, 20)
          expect(length).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>()
          for (let i = 0; i < 100; i++) {
            arr.push(i)
          }
          expect(arr.length).assertEqual(100)

      }
      {
          const arr = new SparseArray<int>()
          for (let i = 0; i < 100; i++) {
            let length = arr.push(i)
            expect(length).assertEqual(i + 1)
          }

      }
      {
          const arr = new SparseArray<int>()
          let length = arr.push(10)
          expect(length >= 0).assertTrue()

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0400
     * @tc.name testStackPushNormal004
     * @tc.desc Test SparseArray.push method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr1 = new SparseArray<int>()
          const len1 = arr1.push(10)
          expect(len1).assertEqual(1)

          const arr2 = new SparseArray<string>()
          const len2 = arr2.push("hello")
          expect(len2).assertEqual(1)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 10
          arr[2] = 30
          let length = arr.push(40, 50)
          expect(length).assertEqual(7)
          expect(arr[5]).assertEqual(40)
          expect(arr[6]).assertEqual(50)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 10
          arr[4] = 50
          arr.push(60, 70)
          expect(arr[1]).assertEqual(undefined)
          expect(arr[2]).assertEqual(undefined)
          expect(arr[3]).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<int>(10)
          arr[0] = 100
          arr[9] = 900
          let length = arr.push(1000)
          expect(length).assertEqual(11)
          expect(arr.length).assertEqual(11)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(10, 20, 30)
          expect(arr[0]).assertEqual(10)
          expect(arr[1]).assertEqual(20)
          expect(arr[2]).assertEqual(30)

      }
      {
          const arr = new SparseArray<int>(5, 10)
          arr.push(15, 20)
          expect(arr[2]).assertEqual(15)
          expect(arr[3]).assertEqual(20)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(10, 20)
          arr.push(30, 40)
          expect(arr[0]).assertEqual(10)
          expect(arr[1]).assertEqual(20)
          expect(arr[2]).assertEqual(30)
          expect(arr[3]).assertEqual(40)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(100, 200, 300)
          expect(arr[0] === 100).assertTrue()
          expect(arr[1] === 200).assertTrue()
          expect(arr[2] === 300).assertTrue()

      }
      {
          const arr = new SparseArray<int>(10, 20)
          let beforeLength = arr.length
          arr.push()
          let afterLength = arr.length
          expect(beforeLength).assertEqual(afterLength)

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          arr.push()
          expect(arr[0]).assertEqual(10)
          expect(arr[1]).assertEqual(20)
          expect(arr[2]).assertEqual(30)
          expect(arr.length).assertEqual(3)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0500
     * @tc.name testStackPushNormal005
     * @tc.desc Test SparseArray.push method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          arr.push(10, 20, 30)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(10)
          expect(arr.length).assertEqual(1)
          arr.push(20, 30)
          expect(arr.length).assertEqual(3)
          arr.push(40)
          expect(arr.length).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          let returnLength = arr.push(10, 20, 30)
          expect(returnLength).assertEqual(arr.length)

      }
      {
          const arr = new SparseArray<string>()
          arr.push("a", "b", "c")
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<boolean>()
          arr.push(true, false, true)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<char>()
          arr.push(c'A', c'B', c'C')
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int | string>()
          arr.push(1, "hello", 2, "world")
          expect(arr.length).assertEqual(4)

      }
      {
          const arr = new SparseArray<Array<int>>()
          arr.push([1, 2], [3, 4])
          expect(arr.length).assertEqual(2)

      }
      {
          const arr = new SparseArray<number>()
          arr.push(1.5, 2.5, 3.5)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>()
          const startTime = Date.now()
          for (let i = 0; i < 10000; i++) {
            arr.push(i)
          }
          const endTime = Date.now()
          expect(arr.length).assertEqual(10000)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0600
     * @tc.name testStackPushNormal006
     * @tc.desc Test SparseArray.push method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          const startTime = Date.now()
          for (let i = 0; i < 10000; i++) {
            arr.push(i, i + 1, i + 2, i + 3, i + 4)
          }
          const endTime = Date.now()
          expect(arr.length).assertEqual(50000)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(10, 20, 30)
          const found = arr.find((v) => v > 15)
          expect(found).assertEqual(20)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(1, 2, 3, 4)
          const filtered = arr.filter((v) => v % 2 === 0)
          expect(filtered.length).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>(5)
          arr.push(1, 2, 3)
          const str = arr.toString()
          expect(str).assertEqual(",,,,,1,2,3")

      }
      {
          const arr = new SparseArray<int>()
          arr.push(10, 20)
          expect(arr[2]).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<int>()
          arr.length = 3
          let length = arr.push(100, 200)
          expect(length).assertEqual(5)

      }
      {
          const arr = new SparseArray<byte>();
          arr.push(127 as byte, (-128 as byte));
          expect(arr[0]).assertEqual(127 as byte);
          expect(arr[1]).assertEqual(-128 as byte);

      }
      {
          const arr = new SparseArray<short>();
          arr.push(32767 as short, (-32768 as short));
          expect(arr[0]).assertEqual(32767 as short);
          expect(arr[1]).assertEqual(-32768 as short);

      }
      {
          const arr = new SparseArray<long>();
          const big: long = 10000000000 as long;
          arr.push(big);
          expect(arr[0]).assertEqual(big);

      }
      {
          const arr = new SparseArray<float>();
          arr.push(3.14f);
          expect(arr[0]).assertEqual(3.14f);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0700
     * @tc.name testStackPushNormal007
     * @tc.desc Test SparseArray.push method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushNormal007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const set = new Set<int>([1, 2, 3]);
          const arr = new SparseArray<Set<int>>();
          arr.push(set);
          expect(arr.length).assertEqual(1);
          expect(arr[0]!.size).assertEqual(3);

      }
      {
          const arr = new SparseArray<string>();
          for (let i = 0; i < 9; i++) {
            arr.push("\uD83D\uDE00");
          }
          expect(arr.length).assertEqual(9);
          expect(arr.$_get(0o10 - 1)).assertEqual("\uD83D\uDE00");

      }
      {
          const arr = new SparseArray<Color019 | null>();
          const len = arr.push(Color019.Red, null, Color019.Blue);
          expect(len).assertEqual(3);
          expect(arr[1]).assertEqual(null);

      }
      {
          const arr = new SparseArray<long>();
          const nearMax: long = 9223372036854775806 as long;
          arr.push(nearMax);
          expect(arr[0]).assertEqual(nearMax);

      }
      {
          const arr = new SparseArray<Color019>();
          arr.push(0x1 as Color019);
          expect(arr[0]).assertEqual(Color019.Green);

      }
      {
          const arr = new SparseArray<char>();
          const len = arr.push(c'A', c'B');
          expect(len).assertEqual(2);
          expect(arr[0]).assertEqual(c'A');
          expect(arr[1]).assertEqual(c'B');

      }
      {
          const arr = new SparseArray<int | undefined>();
          const len = arr.push(undefined, 7);
          expect(len).assertEqual(2);
          expect(arr[0]).assertUndefined();
          expect(arr[1]).assertEqual(7);

      }
      {
          const arr = new SparseArray<byte>();
          const len = arr.push(127 as byte, (-128 as byte));
          expect(len).assertEqual(2);
          expect(arr[0]).assertEqual(127 as byte);
          expect(arr[1]).assertEqual(-128 as byte);

      }
      {
        // 1. push(0) on empty SparseArray<int> -> 1
        const arr1 = new SparseArray<int>();
        expect(arr1.push(0)).assertEqual(1);
        // 2. push zero-width space on empty SparseArray<string> -> 1
        const arr2 = new SparseArray<string>();
        expect(arr2.push('\u200B')).assertEqual(1);
        // 3. push(0.0) on empty SparseArray<double> -> 1
        const arr3 = new SparseArray<double>();
        expect(arr3.push(0.0)).assertEqual(1);
        // 4. push(0n) on empty SparseArray<bigint> -> 1
        const arr4 = new SparseArray<bigint>();
        expect(arr4.push(0n)).assertEqual(1);
        // 5. push(new Date(0)) on empty SparseArray<Date> -> 1
        const arr5 = new SparseArray<Date>();
        expect(arr5.push(new Date(0))).assertEqual(1);
        // 6. push empty number[] on empty SparseArray<number[]> -> 1
        const arr6 = new SparseArray<number[]>();
        const emptyArr6: number[] = [];
        expect(arr6.push(emptyArr6)).assertEqual(1);
        // 7. push(1000) on empty SparseArray<int> stores 1000 at index 0
        const arr7 = new SparseArray<int>();
        arr7.push(1000);
        expect(arr7[0]!).assertEqual(1000);
        // 8. push('中文') on empty SparseArray<string> stores at index 0
        const arr8 = new SparseArray<string>();
        arr8.push('\u4E2D\u6587');
        expect(arr8[0]!).assertEqual('\u4E2D\u6587');
        // 9. push 10000-char string on empty SparseArray<string> -> length 1, intact
        const longStr9: string = 'a'.repeat(10000);
        const arr9 = new SparseArray<string>();
        arr9.push(longStr9);
        expect(arr9.length).assertEqual(1);
        expect(arr9[0]!).assertEqual(longStr9);
        // 10. push('hello') on empty SparseArray<string> -> 1, stores hello
        const arr10 = new SparseArray<string>();
        expect(arr10.push('hello')).assertEqual(1);
        expect(arr10[0]!).assertEqual('hello');

      }
      {
        // 1. push(1,2,3) on empty SparseArray<int> -> 3, in order
        const arr1 = new SparseArray<int>();
        expect(arr1.push(1, 2, 3)).assertEqual(3);
        expect(arr1[0]!).assertEqual(1);
        expect(arr1[1]!).assertEqual(2);
        expect(arr1[2]!).assertEqual(3);
        // 2. push(40,50,60) on SparseArray<int>(10,20,30) -> 6
        const arr2 = new SparseArray<int>(10, 20, 30);
        expect(arr2.push(40, 50, 60)).assertEqual(6);
        expect(arr2.length).assertEqual(6);
        // 3. push(4,5) on SparseArray<int>(1,2,3) -> 5, stores 4,5 at indices 3,4
        const arr3 = new SparseArray<int>(1, 2, 3);
        expect(arr3.push(4, 5)).assertEqual(5);
        expect(arr3.length).assertEqual(5);
        expect(arr3[3]!).assertEqual(4);
        expect(arr3[4]!).assertEqual(5);
        // 4. push(true,false,true) on empty SparseArray<boolean> -> 3, in order
        const arr4 = new SparseArray<boolean>();
        arr4.push(true, false, true);
        expect(arr4.length).assertEqual(3);
        expect(arr4[0]!).assertTrue();
        expect(arr4[1]!).assertFalse();
        expect(arr4[2]!).assertTrue();
        // 5. push(true,false) on empty SparseArray<boolean> -> 2
        const arr5 = new SparseArray<boolean>();
        expect(arr5.push(true, false)).assertEqual(2);
        expect(arr5[0]!).assertTrue();
        expect(arr5[1]!).assertFalse();
        // 6. sequential push(10) then push(20,30) on empty SparseArray<int> -> 3, values 10,20,30
        const arr6 = new SparseArray<int>();
        arr6.push(10);
        arr6.push(20, 30);
        expect(arr6.length).assertEqual(3);
        expect(arr6[0]!).assertEqual(10);
        expect(arr6[1]!).assertEqual(20);
        expect(arr6[2]!).assertEqual(30);
        // 7. push two SparseArray<int> on empty SparseArray<SparseArray<int>> -> 2, nested 10,20
        const arr7 = new SparseArray<SparseArray<int>>();
        const innerArr7a: SparseArray<int> = SparseArray.of<int>(10);
        const innerArr7b: SparseArray<int> = SparseArray.of<int>(20);
        expect(arr7.push(innerArr7a, innerArr7b)).assertEqual(2);
        expect(arr7[0]![0]!).assertEqual(10);
        expect(arr7[1]![0]!).assertEqual(20);
        // 8. push(0) on SparseArray<int>(-2147483648, 2147483647) -> 3
        const arr8 = new SparseArray<int>(-2147483648, 2147483647);
        expect(arr8.push(0)).assertEqual(3);
        // 9. push(new Date(0)) on empty SparseArray<Date> -> 1, getTime 0
        const arr9 = new SparseArray<Date>();
        expect(arr9.push(new Date(0))).assertEqual(1);
        expect(arr9[0]!.getTime()).assertEqual(0);
        // 10. push(99) on length-3 SparseArray<int> with index 1 empty -> index 1 stays undefined
        const arr10 = new SparseArray<int>(3);
        arr10[0] = 1;
        arr10.push(99);
        expect(arr10[1]).assertUndefined();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0800
     * @tc.name testStackPushNormal008
     * @tc.desc Test SparseArray.push method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushNormal008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. push() no args on SparseArray<int>(1,2,3) -> length 3, ret 3, unchanged
        const arr1 = new SparseArray<int>(1, 2, 3);
        expect(arr1.push()).assertEqual(3);
        expect(arr1.length).assertEqual(3);
        expect(arr1[0]!).assertEqual(1);
        expect(arr1[1]!).assertEqual(2);
        expect(arr1[2]!).assertEqual(3);
        // 2. push() then push(30) on SparseArray<int>(10,20) -> length 3, ret 3, 30 at index 2
        const arr2 = new SparseArray<int>(10, 20);
        expect(arr2.push()).assertEqual(2);
        expect(arr2.push(30)).assertEqual(3);
        expect(arr2.length).assertEqual(3);
        expect(arr2[2]!).assertEqual(30);
        // 3. push() on length-5 SparseArray<int> with [2]=99 -> ret 5, preserves 99
        const arr3 = new SparseArray<int>(5);
        arr3[2] = 99;
        expect(arr3.push()).assertEqual(5);
        expect(arr3.length).assertEqual(5);
        expect(arr3[2]!).assertEqual(99);
        // 4. push() on SparseArray<double>(1.1) -> ret 1, value unchanged
        const arr4 = new SparseArray<double>(1.1);
        expect(arr4.push()).assertEqual(1);
        expect(arr4[0]!).assertEqual(1.1);
        // 5. push() on SparseArray<Date>(firstDate, secondDate) -> ret 2, identity preserved
        const firstDate5: Date = new Date(1);
        const secondDate5: Date = new Date(2);
        const arr5 = new SparseArray<Date>(firstDate5, secondDate5);
        expect(arr5.push()).assertEqual(2);
        const sameHead5: boolean = arr5[0]! === firstDate5;
        expect(sameHead5).assertTrue();
        const sameTail5: boolean = arr5[1]! === secondDate5;
        expect(sameTail5).assertTrue();
        // 6. push(Double.NaN) on empty SparseArray<double> -> length 1, NaN
        const arr6 = new SparseArray<double>();
        arr6.push(Double.NaN);
        expect(arr6.length).assertEqual(1);
        const nan6: boolean = isNaN(arr6[0]!);
        expect(nan6).assertTrue();
        // 7. push(Double.EPSILON) on empty SparseArray<double> -> length 1, > 0
        const arr7 = new SparseArray<double>();
        arr7.push(Double.EPSILON);
        expect(arr7.length).assertEqual(1);
        const positive7: boolean = arr7[0]! > 0;
        expect(positive7).assertTrue();
        // 8. push(undefined) on empty SparseArray<Obj04902 | undefined> -> length 1, index 0 undefined
        const arr8 = new SparseArray<Obj04902 | undefined>();
        arr8.push(undefined);
        expect(arr8.length).assertEqual(1);
        expect(arr8[0]).assertUndefined();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_0900
     * @tc.name testStackPushError001
     * @tc.desc Test SparseArray.push method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPushError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<Color020>()
          let threw = false
          try {
            arr.push(999 as Color020)
          } catch (_e) {
            threw = true
          }
          expect(threw).assertTrue()
          expect(arr.length).assertEqual(0)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1000
     * @tc.name testStackPopNormal001
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3)
          expect(arr instanceof SparseArray).assertTrue()
          const oldLength = arr.length
          const result = arr.pop()
          expect(result).assertEqual(3)
          expect(arr.length).assertEqual(2)
          expect(arr.length).assertEqual(oldLength - 1)
          expect(arr[2]).assertEqual(undefined)


      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          const result = arr.pop()
          expect(result).assertEqual(30)
          expect(arr.length).assertEqual(2)
          expect(arr[2]).assertEqual(undefined)
          expect(arr[0]).assertEqual(10)
          expect(arr[1]).assertEqual(20)


      }
      {
          const arr = new SparseArray<number>(1, 2, 3)
          const result = arr.pop()
          expect(result).assertEqual(3)
          expect(typeof result).assertEqual('number')

      }
      {
          const arr = new SparseArray<string>("a", "b", "c")
          const result = arr.pop()
          expect(result).assertEqual("c")
          expect(typeof result).assertEqual('string')

      }
      {
          const arr = new SparseArray<boolean>(true, false, true)
          const result = arr.pop()
          expect(result).assertEqual(true)
          expect(typeof result).assertEqual('boolean')

      }
      {
          const arr = new SparseArray<int>()
          expect(arr.length).assertEqual(0)
          const result = arr.pop()
          expect(result).assertEqual(undefined)
          expect(arr.length).assertEqual(0)


      }
      {
          const arr = new SparseArray<int | undefined>(1, 2, undefined)
          arr.length = 4
          const result = arr.pop()
          expect(result).assertEqual(undefined)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int | undefined>(1, 2, undefined)
          const result = arr.pop()
          expect(result).assertEqual(undefined)
          expect(arr.length).assertEqual(2)

      }
      {
          const arr1 = new SparseArray<int>(1, 2)
          arr1.length = 3
          const result1 = arr1.pop()
          expect(result1).assertEqual(undefined)

          const arr2 = new SparseArray<int | undefined>(1, 2, undefined)
          const result2 = arr2.pop()
          expect(result2).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<int | null>(1, 2, null)
          const result = arr.pop()
          expect(result).assertEqual(null)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1100
     * @tc.name testStackPopNormal002
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 0, 3)
          const result = arr.pop()
          expect(result).assertEqual(3)
          const result2 = arr.pop()
          expect(result2).assertEqual(0)

      }
      {
          const arr = new SparseArray<boolean>(true, false, false)
          const result = arr.pop()
          expect(result).assertEqual(false)
          expect(typeof result).assertEqual('boolean')

      }
      {
          const arr = new SparseArray<string>("a", "", "c")
          const result = arr.pop()
          expect(result).assertEqual("c")
          const result2 = arr.pop()
          expect(result2).assertEqual("")

      }
      {
          const arr = new SparseArray<int>(10, 20, 30, 40, 50)
          const result = arr.pop()
          expect(result).assertEqual(50)
          expect(arr.length).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(42)
          const result = arr.pop()
          expect(result).assertEqual(42)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>()
          for (let i = 0; i < 10000; i++) {
            arr.push(i)
          }
          const start = Date.now()
          const result = arr.pop()
          const end = Date.now()
          expect(result).assertEqual(9999)
          expect(arr.length).assertEqual(9999)
          expect(end - start).assertLess(100)


      }
      {
          const arr = new SparseArray<TestObj017>()
          const obj1 = new TestObj017()
          obj1.value = 1
          const obj2 = new TestObj017()
          obj2.value = 2
          arr.push(obj1, obj2)
          const result = arr.pop()
          expect(result!.value).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 10
          arr[2] = 30
          arr.length = 5
          const result = arr.pop()
          expect(result).assertEqual(undefined)
          expect(arr.length).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[0] = 10
          arr[4] = 50
          const result = arr.pop()
          expect(result).assertEqual(50)
          expect(arr.length).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(1, 2)
          arr.length = 5
          const result = arr.pop()
          expect(result).assertEqual(undefined)
          expect(arr.length).assertEqual(4)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1200
     * @tc.name testStackPopNormal003
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10)
          arr[0] = 10
          arr[5] = 50
          arr[9] = 90
          const result = arr.pop()
          expect(result).assertEqual(90)
          expect(arr.length).assertEqual(9)

      }
      {
          const arr = new SparseArray<int | undefined>(1, 2, undefined)
          const result1 = arr.pop()
          expect(result1).assertEqual(undefined)
          expect(result1 === undefined).assertTrue()

          const arr2 = new SparseArray<int>(1, 2, 3)
          const result2 = arr2.pop()
          expect(result2).assertEqual(3)
          expect(result2 !== undefined).assertTrue()

      }
      {
          const arr = new SparseArray<int | undefined>(1, 2)
          const result = arr.pop()
          expect(result === 2).assertTrue()

      }
      {
          const arr = new SparseArray<int>(10, 20, 30)
          expect(arr.pop()).assertEqual(30)
          expect(arr.pop()).assertEqual(20)
          expect(arr.pop()).assertEqual(10)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined, 3)
          arr.length = 4
          const result1 = arr.pop()
          expect(result1).assertEqual(undefined)
          const result2 = arr.pop()
          expect(result2).assertEqual(3)
          const result3 = arr.pop()
          expect(result3).assertEqual(undefined)
          const result4 = arr.pop()
          expect(result4).assertEqual(1)

      }
      {
          const arr = new SparseArray<int>()
          arr.push(1, 2, 3)
          expect(arr.pop()).assertEqual(3)
          arr.push(4, 5)
          expect(arr.pop()).assertEqual(5)
          expect(arr.pop()).assertEqual(4)
          expect(arr.pop()).assertEqual(2)
          expect(arr.pop()).assertEqual(1)
          expect(arr.pop()).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<number>(1.5, 2.5, 3.5)
          const result = arr.pop()
          expect(result).assertEqual(3.5)

      }
      {
          const arr = new SparseArray<bigint>(1n, 2n, 3n)
          const result = arr.pop()
          expect(result).assertEqual(3n)

      }
      {
          const p1 = new Person029()
          p1.name = "Alice"
          p1.age = 25
          const p2 = new Person029()
          p2.name = "Bob"
          p2.age = 30
          const arr = new SparseArray<Person029>(p1, p2)
          const result = arr.pop()
          expect(result!.name).assertEqual("Bob")
          expect(result!.age).assertEqual(30)

      }
      {
          const arr = new SparseArray<int | string | null>(1, "hello", null)
          const result1 = arr.pop()
          expect(result1).assertEqual(null)
          const result2 = arr.pop()
          expect(result2).assertEqual("hello")
          const result3 = arr.pop()
          expect(result3).assertEqual(1)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1300
     * @tc.name testStackPopNormal004
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1)
          const result = arr.pop()
          expect(result).assertEqual(undefined)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = SparseArray.of<int>(100, 200, 300)
          const result = arr.pop()
          expect(result).assertEqual(300)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          arr.length = 3
          const result = arr.pop()
          expect(result).assertEqual(3)
          expect(arr.length).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          arr.length = 0
          const result = arr.pop()
          expect(result).assertEqual(undefined)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>(1, 2)
          arr.length = 5
          const result = arr.pop()
          expect(result).assertEqual(undefined)
          expect(arr.length).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          arr.pop()
          arr.push(4)
          expect(arr[arr.length - 1]).assertEqual(4)
          expect(arr.length).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4)
          const last = arr.pop()
          const first = arr.shift()
          expect(last).assertEqual(4)
          expect(first).assertEqual(1)
          expect(arr.length).assertEqual(2)

      }
      {
          const arr = new SparseArray<int>()
            for (let i = 0; i < 10000; i++) {
            arr.push(i)
          }
            for (let i = 0; i < 1000; i++) {
            arr.pop()
          }
          expect(arr.length).assertEqual(9000)
          expect(arr[arr.length - 1]).assertEqual(8999)

      }
      {
          const obj = new TestClass040()
          obj.value = 42
          const arr = new SparseArray<TestClass040>(obj)
          const result = arr.pop()
          expect(result!.value).assertEqual(42)
          expect(result === obj).assertTrue()

      }
      {
          const innerArray: Array<int> = [1, 2, 3]
          const arr = new SparseArray<Array<int>>(innerArray)
          const result = arr.pop()
          expect(result !== undefined).assertTrue()
          const r = result as Array<int>
          expect(r[0]).assertEqual(1)
          expect(r[1]).assertEqual(2)
          expect(r[2]).assertEqual(3)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1400
     * @tc.name testStackPopNormal005
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const obj = new TestClass042()
          obj.value = 42
          const arr = new SparseArray<TestClass042>(obj)
          const result = arr.pop()
          expect(result !== undefined).assertTrue()
          const r = result as TestClass042
          r.value = 100
          expect(arr[0]).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<number>(1, 2, Number.MAX_VALUE)
          const result = arr.pop()
          expect(result).assertEqual(Number.MAX_VALUE)

      }
      {
          const arr = new SparseArray<number>(1, Number.MIN_VALUE, 3)
          arr.pop()
          const result = arr.pop()
          expect(result).assertEqual(Number.MIN_VALUE)

      }
      {
          const arr = new SparseArray<number>(1, Double.POSITIVE_INFINITY, 3)
          arr.pop()
          const result = arr.pop()
          expect(result).assertEqual(Double.POSITIVE_INFINITY)

      }
      {
          const arr = new SparseArray<number>(1, Double.NaN, 3)
          arr.pop()
          const result = arr.pop()
          expect(result !== undefined).assertTrue()
          expect(isNaN(result as number)).assertTrue()

      }
      {
          const arr = new SparseArray<string>("hello", "", "world")
          arr.pop()
          const result = arr.pop()
          expect(result).assertEqual("")
          expect(typeof result).assertEqual('string')

      }
      {
          let longStr = ""
            for (let i = 0; i < 10000; i++) {
            longStr += "a"
          }
          const arr = new SparseArray<string>("short", longStr)
          const result = arr.pop()
          expect(result).assertEqual(longStr)
          expect(result!.length).assertEqual(10000)

      }
      {
          const arr = new SparseArray<string>("a", "\n\t\r", "c")
          arr.pop()
          const result = arr.pop()
          expect(result).assertEqual("\n\t\r")

      }
      {
          const arr = new SparseArray<string>("中文", "日本語", "한글")
          const result = arr.pop()
          expect(result).assertEqual("한글")

      }
      {
          const arr = new SparseArray<int>(5)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.length).assertEqual(0)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1500
     * @tc.name testStackPopNormal006
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1000)
          arr[0] = 1
          arr[500] = 2
          arr[999] = 3
          const result = arr.pop()
          expect(result).assertEqual(3)
          const result2 = arr.pop()
          expect(result2).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<int>()
          arr[0] = 10
          arr[100] = 20
          arr[999] = 30
          const result = arr.pop()
          expect(result).assertEqual(30)

      }
      {
          const arr = new SparseArray<string>("a", "b", "c")
          const result = arr.pop()
            if (result !== undefined) {
            expect(result!.length).assertEqual(1)
          }

      }
      {
          const arr = new SparseArray<int>(6, 5, 5);
          const val = arr.pop();
          expect(val).assertEqual(5);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(6);
          expect(arr[1]).assertEqual(5);

      }
      {
          const arr = new SparseArray<number | string>(1, "hello", 2)
          const result = arr.pop()
          expect(result === 2).assertTrue()

      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined)
          expect(arr instanceof SparseArray).assertTrue();
          arr.length = 3
          const result = arr.pop()
          expect(result).assertUndefined();
          expect(arr.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5)
          let sum = 0
            while (arr.length > 0) {
            const value = arr.pop()
            if (value !== undefined) {
              sum += value
            }
          }
          expect(sum).assertEqual(15)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>()
            for (let i = 0; i < 100; i++) {
            arr.push(i)
          }
            for (let i = 99; i >= 0; i--) {
            expect(arr.pop()).assertEqual(i)
          }
          expect(arr.length).assertEqual(0)

      }
      {
          const arr1 = new SparseArray<int>()
          expect(arr1.pop()).assertEqual(undefined)

          const arr2 = new SparseArray<int>(1)
          expect(arr2.pop()).assertEqual(undefined)

          const arr3 = new SparseArray<int | undefined>(undefined)
          expect(arr3.pop()).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<number | undefined>(1.5, 2.5, 3.5)
          const result = arr.pop()
          expect(result === 3.5).assertTrue()

          const arr2 = new SparseArray<number>()
          const result2 = arr2.pop()
          expect(result2 === undefined).assertTrue()

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1600
     * @tc.name testStackPopNormal007
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int | undefined>(1, 2, undefined)
          arr.length = 4
          const last = arr.pop()
          expect(last).assertEqual(undefined)
          const newlast = arr.pop()
          expect(newlast).assertEqual(undefined)
          expect(arr.length).assertEqual(2)

      }
      {
          const stack = new UndoStack063()
          stack.pushState("Action1")
          stack.pushState("Action2")
          stack.pushState("Action3")

          expect(stack.canUndo()).assertTrue()
          expect(stack.undo()).assertEqual("Action3")
          expect(stack.undo()).assertEqual("Action2")
          expect(stack.undo()).assertEqual("Action1")
          expect(stack.undo()).assertEqual(undefined)
          expect(stack.canUndo()).assertFalse()

      }
      {
          const queue = new TaskQueue064()
          queue.addTask(1)
          queue.addTask(2)
          queue.addTask(3)

          expect(queue.hasTasks()).assertTrue()
          expect(queue.getNextTask()).assertEqual(3)
          expect(queue.getNextTask()).assertEqual(2)
          expect(queue.getNextTask()).assertEqual(1)
          expect(queue.hasTasks()).assertFalse()

      }
      {
          const arr = new SparseArray<int | undefined>()
          arr.push(1)
          arr.push(2)
          arr.push(undefined)
          arr.length = 5
          arr[4] = 100

          expect(arr.pop()).assertEqual(100)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.pop()).assertEqual(2)
          expect(arr.pop()).assertEqual(1)
          expect(arr.pop()).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<undefined>(undefined, undefined, undefined)
          const result1 = arr.pop()
          const result2 = arr.pop()
          const result3 = arr.pop()
          expect(result1).assertEqual(undefined)
          expect(result2).assertEqual(undefined)
          expect(result3).assertEqual(undefined)
          expect(arr.length).assertEqual(0)

      }
      {
          const arr = new SparseArray<int>()
          arr[0] = 1
          arr[2] = 2
          arr[4] = 3
          arr[6] = 4
          const result1 = arr.pop()
          expect(result1).assertEqual(4)
          const result2 = arr.pop()
          expect(result2).assertEqual(undefined)
          const result3 = arr.pop()
          expect(result3).assertEqual(3)
          const result4 = arr.pop()
          expect(result4).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<int | undefined>()
          arr.push(undefined)
          arr.push(undefined)
          arr.push(42)
          arr.push(undefined)
          arr.push(undefined)

          expect(arr.pop()).assertEqual(undefined)
          expect(arr.pop()).assertEqual(undefined)
          expect(arr.pop()).assertEqual(42)

      }
      {
          const arr = new SparseArray<number>(1, 2.5, 3)
          const result = arr.pop()
          expect(result).assertEqual(3)
          expect(typeof result).assertEqual('number')

      }
      {
          const arr = new SparseArray<string>("hello", "world")
          const result = arr.pop()
          expect(result).assertEqual("world")
          expect(typeof result).assertEqual('string')

      }
      {
          const arr1 = new SparseArray<string>("test")
          const r1 = arr1.pop()
            if (r1 !== undefined) {
            expect(r1.length).assertLarger(0)
            } else {
            expect(r1).assertEqual(undefined)
          }

          const arr2 = new SparseArray<string>()
          const r2 = arr2.pop()
            if (r2 !== undefined) {
            expect(r2.length).assertLarger(0)
            } else {
            expect(r2).assertEqual(undefined)
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1700
     * @tc.name testStackPopNormal008
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
            for (let i = 0; i < 1000; i++) {
            arr.push(i)
          }
            for (let i = 0; i < 500; i++) {
            arr.pop()
            arr.push(1000 + i)
          }
            for (let j = 0; j < 10; j++) {
            for (let k = 0; k < 100; k++) {
              arr.pop()
            }
            for (let k = 0; k < 100; k++) {
              arr.push(k)
            }
          }
          expect(arr.length).assertEqual(1000)

      }
      {
          const big: long = 9223372036854775807 as long;
          const arr = new SparseArray<long>(10000000000 as long, big);
          const result = arr.pop();
          expect(result).assertEqual(big);
          expect(arr.length).assertEqual(1);

      }
      {
          const arr = new SparseArray<float>(1.0f, 3.14f);
          const result = arr.pop();
          expect(result).assertEqual(3.14f);
          expect(arr.length).assertEqual(1);

      }
      {
          const arr = new SparseArray<int | null>(1, 2, null);
          const v = arr.pop();
          expect(v).assertEqual(null);
          expect(arr.length).assertEqual(2);

      }
      {
          const arr = new SparseArray<int>(0x1, 0b10, 0o7);
          const v = arr.pop();
          expect(v).assertEqual(0o7);
          expect(arr.length).assertEqual(2);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B');
          const v = arr.pop();
          expect(v).assertEqual(c'B');
          expect(arr.length).assertEqual(1);

      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined);
          const v = arr.pop();
          expect(v).assertUndefined();
          expect(arr.length).assertEqual(1);

      }
      {
          const arr = new SparseArray<byte>(127 as byte, (-128 as byte));
          const v = arr.pop();
          expect(v).assertEqual(-128 as byte);
          expect(arr.length).assertEqual(1);

      }
      {
        // 1. pop reduces length from 6 to 5 on six-element SparseArray<string>
        const arr1 = new SparseArray<string>('a', 'b', 'c', 'd', 'e', 'f');
        arr1.pop();
        let actualInt1: int = arr1.length;
        let expectedInt1: int = 5;
        expect(actualInt1).assertEqual(expectedInt1);
        // 2. pop reduces length from 5 to 4 on five-element SparseArray<Date>
        const date2a = new Date(100);
        const date2b = new Date(200);
        const date2c = new Date(300);
        const date2d = new Date(400);
        const date2e = new Date(500);
        const arr2 = new SparseArray<Date>(date2a, date2b, date2c, date2d, date2e);
        arr2.pop();
        let actualInt2: int = arr2.length;
        let expectedInt2: int = 4;
        expect(actualInt2).assertEqual(expectedInt2);
        // 3. pop returns 42 stored at huge index 0x7ffffffe in SparseArray<int>
        const arr3 = new SparseArray<int>(1);
        arr3[0x7ffffffe as int] = 42;
        const result3 = arr3.pop();
        expect(result3).assertEqual(42);
        // 4. pop removes last element so forEach counts 2 remaining elements in SparseArray<int>
        const arr4 = new SparseArray<int>(1, 2, 3);
        arr4.pop();
        let count4: int = 0;
        arr4.forEach((_value: int, _index: int, _array: SparseArray<int>): void => {
          count4 = count4 + 1;
        });
        expect(count4).assertEqual(2);
        // 5. pop reduces length from 5 to 4 after removing the value at index 4
        const arr5 = new SparseArray<int>(5);
        arr5[4] = 77;
        arr5.pop();
        let actualInt5: int = arr5.length;
        let expectedInt5: int = 4;
        expect(actualInt5).assertEqual(expectedInt5);
        // 6. pop removes last element so index 3 becomes undefined in SparseArray<int>
        const arr6 = new SparseArray<int>(1, 2, 3, 0);
        arr6.pop();
        const result6 = arr6[3];
        expect(result6).assertUndefined();
        // 7. pop removes last element then flat(0) yields length 3 in SparseArray<int>
        const arr7 = new SparseArray<int>(1, 2, 3, 4);
        arr7.pop();
        const flat7 = arr7.flat(0);
        let actualInt7: int = flat7.length;
        let expectedInt7: int = 3;
        expect(actualInt7).assertEqual(expectedInt7);
        // 8. pop followed by push(9) on SparseArray<int>(1, 2, 3) restores length 3 with 9 back at index 2
        const arr8 = new SparseArray<int>(1, 2, 3);
        arr8.pop();
        arr8.push(9);
        let len8: int = arr8.length;
        expect(len8).assertEqual(3);
        expect(arr8[2]).assertEqual(9);
        // 9. pop removing the last element 3 of SparseArray<int>(1, 2, 3) makes lastIndexOf(3) return -1
        const arr9 = new SparseArray<int>(1, 2, 3);
        arr9.pop();
        let actualInt9: int = arr9.lastIndexOf(3);
        let expectedInt9: int = -1;
        expect(actualInt9).assertEqual(expectedInt9);
        // 10. pop on SparseArray<int>(1, 2, 3) shortened to length 2 by the length property returns 2 and leaves length 1
        const arr10 = new SparseArray<int>(1, 2, 3);
        arr10.length = 2;
        const result10 = arr10.pop();
        expect(result10).assertEqual(2);
        let len10: int = arr10.length;
        expect(len10).assertEqual(1);

      }
      {
        // 1. pop returns last boolean true from SparseArray<boolean> holding true, false, true
        const arr1 = new SparseArray<boolean>(true, false, true);
        const result1 = arr1.pop();
        expect(result1).assertTrue();
        // 2. pop returns +Infinity from SparseArray<double> holding Double.POSITIVE_INFINITY
        const arr2 = new SparseArray<double>(Double.POSITIVE_INFINITY);
        const result2 = arr2.pop();
        expect(result2).assertPosUnlimited();
        // 3. pop returns last double 3.0 from SparseArray<double> with 1.0, 2.0, 3.0
        const arr3 = new SparseArray<double>(1.0, 2.0, 3.0);
        const result3 = arr3.pop();
        expect(result3).assertEqual(3.0);
        // 4. pop returns 3.14 from a single-element SparseArray<double>
        const arr4 = new SparseArray<double>(3.14);
        const result4 = arr4.pop();
        expect(result4).assertEqual(3.14);
        // 5. pop returns float 3.1415927 within 0.0001 tolerance from SparseArray<float>
        const arr5 = new SparseArray<float>(1);
        arr5[0] = (3.1415927).toFloat();
        const result5 = arr5.pop();
        expect(result5 as float).assertClose(3.1415927, 0.0001);
        // 6. pop returns extreme value -1.7976931348623157e308 from single-element SparseArray<double>
        const arr6 = new SparseArray<double>(-1.7976931348623157e308);
        const result6 = arr6.pop();
        let actualDouble6: double = result6 as double;
        expect(actualDouble6).assertEqual(-1.7976931348623157e308);
        // 7. pop returns NaN from SparseArray<double> holding Double.NaN
        const arr7 = new SparseArray<double>(Double.NaN, Double.NaN);
        const result7 = arr7.pop();
        let actualBoolean7: boolean = isNaN(result7 as double);
        expect(actualBoolean7).assertTrue();
        // 8. pop on SparseArray<int>(1, -1) returns the last negative element -1 with its sign preserved
        const arr8 = new SparseArray<int>(1, -1);
        const result8 = arr8.pop();
        expect(result8).assertEqual(-1);
        // 9. pop on the single-element SparseArray<boolean>(false) returns false and leaves length 0
        const arr9 = new SparseArray<boolean>(false);
        const result9 = arr9.pop();
        expect(result9).assertFalse();
        let len9: int = arr9.length;
        expect(len9).assertEqual(0);
        // 10. pop on SparseArray<long>(10, 20) returns the last long value 20
        const arr10 = new SparseArray<long>(10 as long, 20 as long);
        const result10 = arr10.pop();
        let actualLong10: long = result10!;
        let expectedLong10: long = 20 as long;
        expect(actualLong10).assertEqual(expectedLong10);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1800
     * @tc.name testStackPopNormal009
     * @tc.desc Test SparseArray.pop method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackPopNormal009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. pop on empty SparseArray<Date> returns undefined, not a Date instance, and length stays 0
        const arr1 = new SparseArray<Date>();
        arr1.push(new Date(0));
        arr1.pop();
        const result1 = arr1.pop();
        let isDate1: boolean = result1 instanceof Date;
        expect(isDate1).assertFalse();
        let len1: int = arr1.length;
        expect(len1).assertEqual(0);
        // 2. pop returns 50, then undefined, then 30 from sparse array with values at indices 0, 2, 4
        const arr2 = new SparseArray<int>(5);
        arr2[0] = 10;
        arr2[2] = 30;
        arr2[4] = 50;
        const r2a = arr2.pop();
        const r2b = arr2.pop();
        const r2c = arr2.pop();
        expect(r2a).assertEqual(50);
        expect(r2b).assertUndefined();
        expect(r2c).assertEqual(30);
        // 3. repeated pop on empty SparseArray<int> keeps length at 0
        const arr3 = new SparseArray<int>();
        for (let i = 0; i < 10; i++) {
          arr3.pop();
        }
        let actualInt3: int = arr3.length;
        let expectedInt3: int = 0;
        expect(actualInt3).assertEqual(expectedInt3);
        // 4. pop on empty SparseArray<string> returns undefined and repeated pop keeps returning undefined
        const arr4 = new SparseArray<string>();
        const result4 = arr4.pop();
        expect(result4).assertUndefined();
        const repeatPopResult4 = arr4.pop();
        expect(repeatPopResult4).assertUndefined();
        let len4: int = arr4.length;
        expect(len4).assertEqual(0);
        // 5. pop returns 3 from SparseArray<int | undefined> holding 1, undefined, 3
        const arr5 = new SparseArray<int | undefined>(1, undefined, 3);
        const result5 = arr5.pop();
        expect(result5).assertEqual(3);
        // 6. pop returns SimpleObj04501 with id 1 rather than null from two-element SparseArray
        const o6: SimpleObj04501 = { id: 1 };
        const arr6 = new SparseArray<SimpleObj04501 | null>(null, o6);
        const result6 = arr6.pop();
        let isNullResult6: boolean = result6 === null;
        expect(isNullResult6).assertFalse();
        let actualNumber6: number = (result6 as SimpleObj04501).id;
        let expectedNumber6: number = 1;
        expect(actualNumber6).assertEqual(expectedNumber6);
        // 7. pop on the single-element of(9) returns 9 and leaves length 0 with index 0 undefined
        const arr7 = SparseArray.of<int>(9);
        const result7 = arr7.pop();
        expect(result7).assertEqual(9);
        let len7: int = arr7.length;
        expect(len7).assertEqual(0);
        expect(arr7[0]).assertUndefined();
        // 8. pop on SparseArray<string>('a', '') returns the trailing empty string rather than undefined
        const arr8 = new SparseArray<string>('a', '');
        const result8 = arr8.pop();
        expect(result8).assertEqual('');

      }
      {
        // 1. pop returns the tab character from a single-element SparseArray<string>
        const arr1 = new SparseArray<string>('\t');
        const result1 = arr1.pop();
        expect(result1).assertEqual('\t');
        // 2. pop returns RegExp whose source is ^abc$ and flags contain g from SparseArray<RegExp>
        const re2 = new RegExp('^abc$', 'gi');
        const arr2 = new SparseArray<RegExp>(re2);
        const result2 = arr2.pop();
        let actualString2: string = (result2 as RegExp).source;
        let expectedString2: string = '^abc$';
        expect(actualString2).assertEqual(expectedString2);
        let flags2: string = (result2 as RegExp).flags;
        expect(flags2.indexOf('g')).assertEqual(0);
        // 3. pop returns regex special-character string ^$.*+?()[]{}| from SparseArray<string>
        const arr3 = new SparseArray<string>('.', '^$.*+?()[]{}|');
        const result3 = arr3.pop();
        expect(result3).assertEqual('^$.*+?()[]{}|');
        // 4. pop on SparseArray<bigint>(100n, 200n) returns the last bigint 200n
        const arr4 = new SparseArray<bigint>(100n, 200n);
        const result4 = arr4.pop();
        expect(result4).assertEqual(200n);
        // 5. two consecutive pop calls on SparseArray<int>(1, 2, 3) return 3 then 2 and leave length 1
        const arr5 = new SparseArray<int>(1, 2, 3);
        const r5a = arr5.pop();
        const r5b = arr5.pop();
        expect(r5a).assertEqual(3);
        expect(r5b).assertEqual(2);
        let len5: int = arr5.length;
        expect(len5).assertEqual(1);
        // 6. pop on SparseArray<string>('1', '2', '3') returns the last string '3' without numeric conversion
        const arr6 = new SparseArray<string>('1', '2', '3');
        const result6 = arr6.pop();
        expect(result6).assertEqual('3');
        // 7. pop on SparseArray<Date>(d1, d2) returns the identical Date instance d2 stored at the last index
        const date7a = new Date(0);
        const date7b = new Date(1000);
        const arr7 = new SparseArray<Date>(date7a, date7b);
        const result7 = arr7.pop();
        let actualBoolean7: boolean = result7 === date7b;
        expect(actualBoolean7).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_1900
     * @tc.name testStackShiftNormal001
     * @tc.desc Test SparseArray.shift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackShiftNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.shift();
          expect(result).assertEqual(1);
          expect(arr.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<string>("a", "b");
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.shift();
          expect(result).assertEqual("a");
          expect(arr.length).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const result = arr.shift();
          expect(result).assertEqual(10);
          expect(arr.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(42);
          const result = arr.shift();
          expect(result).assertEqual(undefined);
          expect(arr.length).assertEqual(41);

      }
      {
          const arr = new SparseArray<string>("hello", "world");
          const result = arr.shift();
          expect(result).assertEqual("hello");


      }
      {
          const arr = new SparseArray<boolean>(true, false);
          const result = arr.shift();
          expect(result).assertEqual(true);


      }
      {
          const arr = new SparseArray<TestClass007>(new TestClass007());
          const result = arr.shift();
          expect(result!.value).assertEqual(100);


      }
      {
          const arr = new SparseArray<int>();
          const result = arr.shift();
          expect(result).assertEqual(undefined);
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int | undefined>(1);
          arr.push(undefined, 2, 3);
          const first = arr.shift();
          expect(first).assertEqual(undefined);
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int | undefined>();
          arr[0] = undefined;
          arr[1] = 10;
          const result = arr.shift();
          expect(result).assertEqual(undefined);
          expect(arr.length).assertEqual(1);
          expect(arr[0]).assertEqual(10);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2000
     * @tc.name testStackShiftNormal002
     * @tc.desc Test SparseArray.shift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackShiftNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          arr.push(42);
          const result = arr.shift();
          expect(result).assertEqual(42);
          expect(arr.length).assertEqual(0);

      }
      {
          const arr = new SparseArray<int>(0, 1, 2);
          const result = arr.shift();
          expect(result).assertEqual(0);


      }
      {
          const arr = new SparseArray<boolean>(false, true);
          const result = arr.shift();
          expect(result).assertEqual(false);


      }
      {
          const arr = new SparseArray<string>("", "non-empty");
          const result = arr.shift();
          expect(result).assertEqual("");


      }
      {
          const arr = new SparseArray<int>(100);
          arr[0] = 7;
          const result = arr.shift();
          expect(result).assertEqual(7);
          expect(arr.length).assertEqual(99);

      }
      {
          const arr = new SparseArray<int>();
          const result = arr.shift();
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined);
          const result1 = arr.shift();
          expect(result1).assertEqual(1);
          const result2 = arr.shift();
          expect(result2).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(1000, 0);
          const result = arr.shift();
          expect(result).assertEqual(1000);


      }
      {
          const arr = new SparseArray<int>(-1000, 0);
          const result = arr.shift();
          expect(result).assertEqual(-1000);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr.shift()).assertEqual(1);
          expect(arr.shift()).assertEqual(2);
          expect(arr.shift()).assertEqual(3);
          expect(arr.shift()).assertEqual(undefined);
          expect(arr.length).assertEqual(0);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2100
     * @tc.name testStackShiftNormal003
     * @tc.desc Test SparseArray.shift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackShiftNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const oldLength = arr.length;
          arr.shift();
          expect(arr.length).assertEqual(oldLength - 1);


      }
      {
          const arr = new SparseArray<int>();
          arr.shift();
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          arr.shift();
          expect(arr[0]).assertEqual(20);
          expect(arr[1]).assertEqual(30);
          expect(arr[2]).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          arr.shift();
          expect(arr[0]).assertEqual(undefined);
          expect(arr[1]).assertEqual(30);
          expect(arr[3]).assertEqual(50);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const result = arr.shift();
          expect(result).assertEqual("a");


      }
      {
          const arr = new SparseArray<int>(7, 4, 3);
          const val = arr.shift();
          expect(val).assertEqual(7);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(4);
          expect(arr[1]).assertEqual(3);

      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined, 2);
          const result = arr.shift();
          expect(result).assertEqual(1);


      }
      {
          const arr = new SparseArray<string | null>("hello", null);
          const result = arr.shift();
          expect(result).assertEqual("hello");


      }
      {
          const arr = new SparseArray<Person025>(new Person025());
          const result = arr.shift();
          expect(result!.name).assertEqual("test");


      }
      {
          const arr = new SparseArray<SparseArray<int>>(
            new SparseArray<int>(1, 2),
            new SparseArray<int>(3, 4)
          );
          const result = arr.shift();
          expect(result!.length).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2200
     * @tc.name testStackShiftNormal004
     * @tc.desc Test SparseArray.shift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackShiftNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 10;
          arr[9] = 90;
          const result = arr.shift();
          expect(result).assertEqual(10);
          expect(arr.length).assertEqual(9);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[5] = 50;
          arr[6] = 60;
          const result = arr.shift();
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(10000);
          arr[0] = 1;
          const result = arr.shift();
          expect(result).assertEqual(1);
          expect(arr.length).assertEqual(9999);


      }
      {
          const arr = new SparseArray<int>();
          arr.push(1, 2, 3);
          expect(arr.shift()).assertEqual(1);
          arr.push(4);
          expect(arr.shift()).assertEqual(2);
          expect(arr.shift()).assertEqual(3);
          expect(arr.shift()).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.shift();
          expect(result).assertEqual(1);
          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>();
          const r = arr.shift();
          expect(r === undefined).assertTrue();
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 100; i++) {
            arr.shift();
          }
          expect(arr.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(10);
          expect(arr instanceof SparseArray).assertTrue();
          const result: int | undefined = arr.shift();
          expect(result).assertUndefined();
          expect(arr.length).assertEqual(9);


      }
      {
          const queue = new SparseArray<int>();
          queue.push(1, 2, 3, 4, 5);
          const first = queue.shift();
          expect(first).assertEqual(1);
          expect(queue.length).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          let count = 0;
          while (arr.length > 0) {
            const item = arr.shift();
            if (item !== undefined) {
              count += item;
            }
          }
          expect(count).assertEqual(60);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2300
     * @tc.name testStackShiftNormal005
     * @tc.desc Test SparseArray.shift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackShiftNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<short>(100 as short, 200 as short, 300 as short);
          const first = arr.shift();
          expect(first).assertEqual(100 as short);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(200 as short);

      }
      {
          const arr = new SparseArray<float>(1.5f, 2.5f, 3.5f);
          const first = arr.shift();
          expect(first).assertEqual(1.5f);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(2.5f);

      }
      {
          const arr = new SparseArray<int>(0xFF, 2, 3);
          const first = arr.shift();
          expect(first).assertEqual(0xFF);
          expect(arr[0]).assertEqual(2);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B');
          const first = arr.shift();
          expect(first).assertEqual(c'A');
          expect(arr.length).assertEqual(1);
          expect(arr[0]).assertEqual(c'B');

      }
      {
          const arr = new SparseArray<boolean>(false, true);
          const first = arr.shift();
          expect(first).assertEqual(false);
          expect(arr[0]).assertEqual(true);

      }
      {
          const arr = new SparseArray<int | undefined>(undefined, 7);
          const first = arr.shift();
          expect(first).assertUndefined();
          expect(arr.length).assertEqual(1);
          expect(arr[0]).assertEqual(7);

      }
      {
          const arr = new SparseArray<string>(3);
          arr[2] = "tail";
          const first = arr.shift();
          expect(first).assertUndefined();
          expect(arr.length).assertEqual(2);
          expect(arr[1]).assertEqual("tail");

      }
      {
        // 1. shift on SparseArray.of<int>(1) removes and returns the only element 1 leaving length 0
        const arr1 = SparseArray.of<int>(1);
        const shifted1 = arr1.shift();
        expect(shifted1).assertEqual(1);
        expect(arr1.length).assertEqual(0);
        // 2. shift on SparseArray<int>(5, 10, 15) returns the first element 5 and promotes 10 to index 0
        const arr2 = new SparseArray<int>(5, 10, 15);
        const result2: int | undefined = arr2.shift();
        expect(result2).assertEqual(5);
        expect(arr2[0]).assertEqual(10);
        // 3. shift on SparseArray<long>(100, 200) returns 100 and leaves 200 at index 0 with length 1
        const arr3 = new SparseArray<long>(Int.toLong(100), Int.toLong(200));
        const result3 = arr3.shift();
        expect(result3).assertEqual(Int.toLong(100));
        expect(arr3.length).assertEqual(1);
        expect(arr3[0]).assertEqual(Int.toLong(200));
        // 4. shift on SparseArray<short>(100, 200) returns the short 100 and leaves 200 at index 0
        const v4: short = Int.toShort(100);
        const arr4 = new SparseArray<short>(v4, Int.toShort(200));
        const result4 = arr4.shift();
        expect(result4).assertEqual(v4);
        expect(arr4[0]).assertEqual(Int.toShort(200));
        // 5. shift on SparseArray<boolean>(true, false, true) returns the first true and reduces length to 2
        const arr5 = new SparseArray<boolean>(true, false, true);
        const removed5 = arr5.shift();
        expect(removed5).assertTrue();
        expect(arr5.length).assertEqual(2);
        // 6. shift on SparseArray<double>(NaN, 1.5) returns the NaN first element verified by isNaN
        const arr6 = new SparseArray<double>(Double.NaN, 1.5);
        const result6 = arr6.shift();
        expect(isNaN(result6!)).assertTrue();
        // 7. shift on SparseArray<double>(MAX_VALUE, 0.0) returns Double.MAX_VALUE as the removed first element
        const arr7 = new SparseArray<double>(Double.MAX_VALUE, 0.0);
        const result7 = arr7.shift();
        expect(result7).assertEqual(Double.MAX_VALUE);
        // 8. shift on SparseArray<int>(-5, -6) returns the negative first element -5 with sign preserved
        const arr8 = new SparseArray<int>(-5, -6);
        const result8 = arr8.shift();
        expect(result8).assertEqual(-5);
        expect(arr8[0]).assertEqual(-6);
        // 9. shift on SparseArray<int>(7, 7, 7) returns 7 and leaves the two remaining equal 7s with length 2
        const arr9 = new SparseArray<int>(7, 7, 7);
        const result9 = arr9.shift();
        expect(result9).assertEqual(7);
        expect(arr9.length).assertEqual(2);
        expect(arr9[0]).assertEqual(7);
        expect(arr9[1]).assertEqual(7);
        // 10. shift on SparseArray<string>('a', '') returns 'a' and leaves the empty string at index 0 with length 1
        const arr10 = new SparseArray<string>('a', '');
        const result10 = arr10.shift();
        expect(result10).assertEqual('a');
        expect(arr10.length).assertEqual(1);
        expect(arr10[0]).assertEqual('');

      }
      {
        // 1. shift on an empty SparseArray<int> returns undefined because no first element exists
        const arr1 = new SparseArray<int>();
        const result1 = arr1.shift();
        expect(result1).assertUndefined();
        // 2. shift on sparse SparseArray<int>(3) with only index 1 set to 42 returns undefined and shifts 42 to index 0
        const arr2 = new SparseArray<int>(3);
        arr2[1] = 42;
        const result2 = arr2.shift();
        expect(result2).assertUndefined();
        expect(arr2.length).assertEqual(2);
        expect(arr2[0]).assertEqual(42);
        // 3. shift twice on a sparse length-5 array with 99 at index 2 returns undefined on the second call leaving length 3
        const arr3 = new SparseArray<int>(5);
        arr3[2] = 99;
        arr3.shift();
        const second3 = arr3.shift();
        expect(second3).assertUndefined();
        expect(arr3.length).assertEqual(3);
        // 4. shift once on an all-hole SparseArray<int>(4) decreases the length from 4 to 3
        const arr4 = new SparseArray<int>(4);
        arr4.shift();
        expect(arr4.length).assertEqual(3);
        // 5. shift three times on a sparse array with 10, 30, 50 at indices 0, 2, 4 returns 10 then undefined then 30
        const arr5 = new SparseArray<int>(5);
        arr5[0] = 10;
        arr5[2] = 30;
        arr5[4] = 50;
        const r5a = arr5.shift();
        const r5b = arr5.shift();
        const r5c = arr5.shift();
        expect(r5a).assertEqual(10);
        expect(r5b).assertUndefined();
        expect(r5c).assertEqual(30);
        // 6. shift on SparseArray<int | undefined>(undefined, 5) returns undefined yet shortens length to 1 with 5 at index 0
        const arr6 = new SparseArray<int | undefined>(undefined, 5);
        const result6 = arr6.shift();
        expect(result6).assertUndefined();
        expect(arr6.length).assertEqual(1);
        expect(arr6[0]).assertEqual(5);
        // 7. shift four times on SparseArray<int>(10, 20, 30) returns undefined on the fourth call once the array is empty
        const arr7 = new SparseArray<int>(10, 20, 30);
        arr7.shift();
        arr7.shift();
        arr7.shift();
        const r7d = arr7.shift();
        expect(r7d).assertUndefined();
        // 8. shift three times on SparseArray<int>(5, 10, 15) returns the last remaining element 15
        const arr8 = new SparseArray<int>(5, 10, 15);
        arr8.shift();
        arr8.shift();
        const last8 = arr8.shift();
        expect(last8).assertEqual(15);
        // 9. shift on an empty SparseArray<int> followed by push(9) yields length 1 with 9 readable at index 0
        const arr9 = new SparseArray<int>();
        const empty9 = arr9.shift();
        expect(empty9).assertUndefined();
        arr9.push(9);
        expect(arr9.length).assertEqual(1);
        expect(arr9[0]).assertEqual(9);
        // 10. shift on SparseArray<int>(1, 2, 3) followed by push(4) restores length 3 with join yielding '2,3,4'
        const arr10 = new SparseArray<int>(1, 2, 3);
        arr10.shift();
        arr10.push(4);
        expect(arr10.length).assertEqual(3);
        expect(arr10.join(',')).assertEqual('2,3,4');

      }
      {
        // 1. shift on a one-element SparseArray<RegExp> returns the identical RegExp object reference
        const regexp1: RegExp = new RegExp('abc');
        const arr1 = new SparseArray<RegExp>(regexp1);
        const result1 = arr1.shift();
        expect(result1).assertEqual(regexp1);
        // 2. shift on a one-element SparseArray<RegExp> with flags 'g' returns a RegExp whose source is 'abc' and flags is 'g'
        const regexp2: RegExp = new RegExp('abc', 'g');
        const arr2 = new SparseArray<RegExp>(regexp2);
        const result2 = arr2.shift();
        expect(result2!.source).assertEqual('abc');
        expect(result2!.flags).assertEqual('g');
        // 3. shift on a one-element SparseArray<string> holding a Chinese character string returns the same Chinese string
        const arr3 = new SparseArray<string>('中文测试');
        const result3 = arr3.shift();
        expect(result3).assertEqual('中文测试');
        // 4. shift on SparseArray<Date>(d1, d2) returns the identical Date instance d1 and leaves d2 at index 0
        const dateA: Date = new Date(0);
        const dateB: Date = new Date(1000);
        const arr4 = new SparseArray<Date>(dateA, dateB);
        const result4 = arr4.shift();
        expect(result4 === dateA).assertTrue();
        expect(arr4[0] === dateB).assertTrue();
        // 5. shift on SparseArray<int>(1, 2, 3, 4) keeps the last element 4 reachable at index 2
        const arr5 = new SparseArray<int>(1, 2, 3, 4);
        const result5 = arr5.shift();
        expect(result5).assertEqual(1);
        expect(arr5.length).assertEqual(3);
        expect(arr5.lastIndexOf(4)).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2400
     * @tc.name testStackUnshiftNormal001
     * @tc.desc Test SparseArray.unshift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackUnshiftNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3)
          let result = arr.unshift()
          expect(result).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          let result = arr.unshift(0)
          expect(result).assertEqual(4)
          expect(arr[0]).assertEqual(0)
          expect(arr[1]).assertEqual(1)

      }
      {
          const arr = new SparseArray<int>(3, 4)
          let result = arr.unshift(1, 2)
          expect(result).assertEqual(4)
          expect(arr.toString()).assertEqual("1,2,3,4")

      }
      {
          const arr = new SparseArray<int>()
          let result = arr.unshift(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
          expect(result).assertEqual(10)

      }
      {
          const arr = new SparseArray<string>()
          let result = arr.unshift("hello")
          expect(result).assertEqual(1)
          expect(arr[0]).assertEqual("hello")

      }
      {
          const arr = new SparseArray<char>()
          let result = arr.unshift(c'\n')
          expect(result).assertEqual(1)

      }
      {
          const arr = new SparseArray<number | string>()
          let result = arr.unshift(1, "hello")
          expect(result).assertEqual(2)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual("hello")

      }
      {
          const arr = new SparseArray<number | undefined>()
          let result = arr.unshift(undefined, 100)
          expect(result).assertEqual(2)
          expect(arr[0]).assertEqual(undefined)
          expect(arr[1]).assertEqual(100)

      }
      {
          const arr = new SparseArray<int>()
          let result = arr.unshift(1)
          expect(result).assertEqual(1)
          expect(arr.length).assertEqual(1)

      }
      {
          const arr = new SparseArray<int>(3, 4)
          let result = arr.unshift(1, 2)
          expect(result).assertEqual(4)
          expect(arr.length).assertEqual(4)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2500
     * @tc.name testStackUnshiftNormal002
     * @tc.desc Test SparseArray.unshift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackUnshiftNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          let result1 = arr.unshift(1)
          let result2 = arr.unshift(2)
          let result3 = arr.unshift(3)
          expect(result1).assertEqual(1)
          expect(result2).assertEqual(2)
          expect(result3).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>(1, 2, 3)
          let originalLength = arr.length
          let result = arr.unshift()
          expect(result).assertEqual(originalLength)
          expect(arr.length).assertEqual(originalLength)

      }
      {
          const arr = new SparseArray<int>()
          let result = arr.unshift(1, 2, 3)
          let doubleLength = result * 2
          expect(doubleLength).assertEqual(6)

      }
      {
          const arr = new SparseArray<int>(3, 4)
          arr.unshift(1, 2)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(2)
          expect(arr[2]).assertEqual(3)
          expect(arr[3]).assertEqual(4)

      }
      {
          const arr = new SparseArray<int>()
          arr.unshift(3)
          arr.unshift(2)
          arr.unshift(1)
          expect(arr[0]).assertEqual(1)
          expect(arr[1]).assertEqual(2)
          expect(arr[2]).assertEqual(3)

      }
      {
          const arr = new SparseArray<int>()
          let result = arr.unshift(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
          expect(result).assertEqual(20)
          expect(arr.length).assertEqual(20)

      }
      {
          const arr = new SparseArray<number | string>()
          arr.unshift(1, "two", 3)
          let result = arr.unshift("zero")
          expect(result).assertEqual(4)
          expect(arr[0]).assertEqual("zero")
          expect(arr[1]).assertEqual(1)

      }
      {
          const arr = new SparseArray<int>(5)
          arr[2] = 10
          arr.unshift(0)
          expect(arr[0]).assertEqual(0)
          expect(arr[3]).assertEqual(10)
          expect(arr[1]).assertEqual(undefined)

      }
      {
          const arr = new SparseArray<int>(3, 4)
          arr.unshift(1, 2)
          arr.push(5)
          expect(arr.toString()).assertEqual("1,2,3,4,5")

      }
      {
          const arr = new SparseArray<int>(3, 4)
          arr.unshift(1, 2)
          let first = arr.shift()
          expect(first).assertEqual(1)
          expect(arr.length).assertEqual(3)

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2600
     * @tc.name testStackUnshiftNormal003
     * @tc.desc Test SparseArray.unshift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackUnshiftNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(3, 4)
          arr.unshift(1, 2)
          let str = arr.toString()
          expect(str).assertEqual("1,2,3,4")

      }
      {
          const arr = new SparseArray<byte>(30 as byte, 40 as byte);
          const len = arr.unshift(10 as byte, 20 as byte);
          expect(len).assertEqual(4);
          expect(arr[0]).assertEqual(10 as byte);
          expect(arr[1]).assertEqual(20 as byte);
          expect(arr[2]).assertEqual(30 as byte);

      }
      {
          const arr = new SparseArray<float>(3.0f, 4.0f);
          const len = arr.unshift(1.0f, 2.0f);
          expect(len).assertEqual(4);
          expect(arr[0]).assertEqual(1.0f);
          expect(arr[3]).assertEqual(4.0f);

      }
      {
          const arr = new SparseArray<string>("tail");
          arr.unshift("\r", "\f");
          expect(arr[0]).assertEqual("\r");
          expect(arr[1]).assertEqual("\f");
          expect(arr[2]).assertEqual("tail");

      }
      {
          const arr = new SparseArray<string | null>("tail");
          arr.unshift(null);
          expect(arr[0]).assertEqual(null);
          expect(arr[1]).assertEqual("tail");

      }
      {
          const arr = new SparseArray<int>(2, 3);
          arr.unshift(0xFF);
          expect(arr[0]).assertEqual(0xFF);
          expect(arr.length).assertEqual(3);

      }
      {
          const arr = new SparseArray<boolean>(true);
          const len = arr.unshift(false);
          expect(len).assertEqual(2);
          expect(arr[0]).assertFalse();
          expect(arr[1]).assertTrue();

      }
      {
          const arr = new SparseArray<short>();
          arr.push(30 as short);
          const len = arr.unshift(10 as short, 20 as short);
          expect(len).assertEqual(3);
          expect(arr[0]).assertEqual(10 as short);
          expect(arr[2]).assertEqual(30 as short);

      }
      {
          const arr = new SparseArray<long>(2 as long);
          const len = arr.unshift(10000000000 as long);
          expect(len).assertEqual(2);
          expect(arr[0]).assertEqual(10000000000 as long);
          expect(arr[1]).assertEqual(2 as long);

      }
      {
          const arr = new SparseArray<double>(2.5);
          const len = arr.unshift(1.25);
          expect(len).assertEqual(2);
          expect(arr[0]).assertEqual(1.25);
          expect(arr[1]).assertEqual(2.5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2700
     * @tc.name testStackUnshiftNormal004
     * @tc.desc Test SparseArray.unshift method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackUnshiftNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. unshift 99 into empty int SparseArray -> returns 1, arr[0]=99
        const arr1 = new SparseArray<int>();
        const ret1 = arr1.unshift(99);
        expect(ret1).assertEqual(1);
        expect(arr1[0]).assertEqual(99);
        // 2. unshift 5,6,7,8 into empty SparseArray -> returns 4, arr[3]=8
        const arr2 = new SparseArray<int>();
        const ret2 = arr2.unshift(5, 6, 7, 8);
        expect(ret2).assertEqual(4);
        expect(arr2[3]).assertEqual(8);
        // 3. unshift 0 into empty int SparseArray -> arr[0]=0, length=1
        const arr3 = new SparseArray<int>();
        arr3.unshift(0);
        expect(arr3[0]).assertEqual(0);
        expect(arr3.length).assertEqual(1);
        // 4. unshift int extremes 2147483647, -2147483648 into empty -> arr[0]=MAX, arr[1]=MIN, length=2
        const arr4 = new SparseArray<int>();
        arr4.unshift(2147483647, -2147483648);
        expect(arr4[0]).assertEqual(2147483647);
        expect(arr4[1]).assertEqual(-2147483648);
        expect(arr4.length).assertEqual(2);
        // 5. unshift tab into empty string SparseArray -> arr[0]='\t'
        const arr5 = new SparseArray<string>();
        arr5.unshift('\t');
        expect(arr5[0]).assertEqual('\t');
        // 6. unshift emoji before 'a' in string SparseArray -> arr[0]='🎉'
        const arr6 = new SparseArray<string>('a');
        arr6.unshift('🎉');
        expect(arr6[0]).assertEqual('🎉');
        // 7. unshift() no args on empty int SparseArray -> returns 0, length=0
        const arr7 = new SparseArray<int>();
        const len7 = arr7.unshift();
        expect(len7).assertEqual(0);
        expect(arr7.length).assertEqual(0);
        // 8. unshift 10000-char string into empty string SparseArray -> arr[0]=LONG_STR
        const arr8 = new SparseArray<string>();
        const LONG_STR8: string = 'x'.repeat(10000);
        arr8.unshift(LONG_STR8);
        expect(arr8[0]).assertEqual(LONG_STR8);
        // 9. unshift 99 before single 42 -> arr[1]=42
        const arr9 = SparseArray.of<int>(42);
        arr9.unshift(99);
        expect(arr9[1]).assertEqual(42);
        // 10. unshift 99 into (5,10,15) -> length=4, arr[0]=99, arr[3]=15
        const arr10 = new SparseArray<int>(5, 10, 15);
        arr10.unshift(99);
        expect(arr10.length).assertEqual(4);
        expect(arr10[0]).assertEqual(99);
        expect(arr10[3]).assertEqual(15);

      }
      {
        // 1. unshift 10,20 before single 30 -> returns 3, arr[0]=10, arr[1]=20
        const arr1 = SparseArray.of<int>(30);
        const ret1 = arr1.unshift(10, 20);
        expect(ret1).assertEqual(3);
        expect(arr1[0]).assertEqual(10);
        expect(arr1[1]).assertEqual(20);
        // 2. unshift 11,33 into length-4 sparse SparseArray -> returns 6, arr[0]=11, arr[1]=33
        const arr2 = new SparseArray<int>(4);
        arr2[1] = 22;
        arr2[3] = 44;
        const ret2 = arr2.unshift(11, 33);
        expect(ret2).assertEqual(6);
        expect(arr2[0]).assertEqual(11);
        expect(arr2[1]).assertEqual(33);
        // 3. unshift 1,2,3 before 100,200 -> returns 5, arr[3]=100, arr[4]=200
        const arr3 = new SparseArray<int>(100, 200);
        const ret3 = arr3.unshift(1, 2, 3);
        expect(ret3).assertEqual(5);
        expect(arr3[3]).assertEqual(100);
        expect(arr3[4]).assertEqual(200);
        // 4. unshift 5 before 10,20 -> returns 3, arr[0]=5
        const arr4 = new SparseArray<int>(10, 20);
        const ret4 = arr4.unshift(5);
        expect(ret4).assertEqual(3);
        expect(arr4[0]).assertEqual(5);
        // 5. unshift 0.5 before 1.5,2.5 (double) -> returns 3, arr[0]=0.5
        const arr5 = new SparseArray<double>(1.5, 2.5);
        const ret5 = arr5.unshift(0.5);
        expect(ret5).assertEqual(3);
        expect(arr5[0]).assertEqual(0.5);
        // 6. unshift 1,2,3 before 10,20 -> returns 5, order 1,2,3,10,20
        const arr6 = new SparseArray<int>(10, 20);
        const ret6 = arr6.unshift(1, 2, 3);
        expect(ret6).assertEqual(5);
        expect(arr6[0]).assertEqual(1);
        expect(arr6[2]).assertEqual(3);
        expect(arr6[3]).assertEqual(10);
        expect(arr6[4]).assertEqual(20);
        // 7. unshift 0 before 1,2,3,4,5 -> returns 6, arr[0]=0, arr[1]=1, arr[5]=5
        const arr7 = new SparseArray<int>(1, 2, 3, 4, 5);
        const ret7 = arr7.unshift(0);
        expect(ret7).assertEqual(6);
        expect(arr7[0]).assertEqual(0);
        expect(arr7[1]).assertEqual(1);
        expect(arr7[5]).assertEqual(5);
        // 8. unshift 0,0,0 before 7,14,21,28 -> arr[6]=28
        const arr8 = new SparseArray<int>(7, 14, 21, 28);
        arr8.unshift(0, 0, 0);
        expect(arr8[6]).assertEqual(28);
        // 9. unshift 0,1,2 before 5,6 -> length=5, order 0,1,2,5,6
        const arr9 = new SparseArray<int>(5, 6);
        arr9.unshift(0, 1, 2);
        expect(arr9.length).assertEqual(5);
        expect(arr9[0]).assertEqual(0);
        expect(arr9[2]).assertEqual(2);
        expect(arr9[3]).assertEqual(5);
        expect(arr9[4]).assertEqual(6);
        // 10. unshift 10,20 before 30,40,50 -> order 10,20,30,40,50
        const arr10 = new SparseArray<int>(30, 40, 50);
        arr10.unshift(10, 20);
        expect(arr10[0]).assertEqual(10);
        expect(arr10[1]).assertEqual(20);
        expect(arr10[2]).assertEqual(30);
        expect(arr10[3]).assertEqual(40);
        expect(arr10[4]).assertEqual(50);

      }
      {
        // 1. unshift false into boolean SparseArray (true,false,true) -> arr[3]=true
        const arr1 = new SparseArray<boolean>(true, false, true);
        arr1.unshift(false);
        expect(arr1[3]!).assertTrue();
        // 2. unshift 1.0 before NaN,3.14 (double) -> arr[1] is NaN
        const arr2 = new SparseArray<double>(Double.NaN, 3.14);
        arr2.unshift(1.0);
        expect(isNaN(arr2[1]!)).assertTrue();
        // 3. unshift 0 before 1,2 -> returns 3, arr[0]=0, arr[2]=2
        const arr3 = new SparseArray<int>(1, 2);
        const ret3 = arr3.unshift(0);
        expect(ret3).assertEqual(3);
        expect(arr3[0]).assertEqual(0);
        expect(arr3[2]).assertEqual(2);
        // 4. unshift spread of 100 negative ints before 1,2,3 -> arr[0]=-1, arr[100]=1, arr[101]=2, arr[102]=3
        const arr4 = new SparseArray<int>(1, 2, 3);
        const PUSH_COUNT4: int = 100;
        let values4: int[] = [];
        for (let i: int = 0; i < PUSH_COUNT4; i++) {
          values4.push(-(i + 1));
        }
        arr4.unshift(...values4);
        expect(arr4[0]).assertEqual(-1);
        expect(arr4[100]).assertEqual(1);
        expect(arr4[101]).assertEqual(2);
        expect(arr4[102]).assertEqual(3);
        // 5. unshift int extremes -2147483648,0,2147483647 -> length=3, arr[0]=MIN, arr[1]=0, arr[2]=MAX
        const arr5 = new SparseArray<int>();
        arr5.unshift(-2147483648, 0, 2147483647);
        expect(arr5.length).assertEqual(3);
        expect(arr5[0]).assertEqual(-2147483648);
        expect(arr5[1]).assertEqual(0);
        expect(arr5[2]).assertEqual(2147483647);
        // 6. unshift tab before 'x' (string) -> arr[0]='\t'
        const arr6 = new SparseArray<string>('x');
        arr6.unshift('\t');
        expect(arr6[0]).assertEqual('\t');
        // 7. unshift NaN,+Inf,-Inf before 100.0 (double) -> length=4, arr[0]=NaN, arr[1]=+Inf, arr[2]=-Inf
        const arr7 = new SparseArray<double>(100.0);
        arr7.unshift(Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
        expect(arr7.length).assertEqual(4);
        expect(isNaN(arr7[0]!)).assertTrue();
        expect(arr7[1]).assertEqual(Double.POSITIVE_INFINITY);
        expect(arr7[2]).assertEqual(Double.NEGATIVE_INFINITY);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_STACK_2800
     * @tc.name testStackUnshiftError001
     * @tc.desc Test SparseArray.unshift method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStackUnshiftError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>()
          try {
            arr.unshift((null as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>()
          try {
            arr.unshift((undefined as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>()
          try {
            arr.unshift(("" as Object as int))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<number>()
          try {
            arr.unshift(("" as Object as number))
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

  });
}
