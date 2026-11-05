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

class MapValueBox {
    value: int = 0;
}

class MapOriginalDoubled {
    original: int = 0;
    doubled: int = 0;
}

class MapValueIndexBox {
    value: int = 0;
    index: int = 0;
}

class NestedNullHolder041 {
    label: string = "";
    items: Array<int> | null = null;
}

interface Item01402 {
  id: int;
  label: string;
}

interface Box03502 {
  id: int;
}

// Merged from SparseArrayMapPart01Test (26 scenarios -> 3 cases, each <=10)

type SparseArrayIntFilterPred = (v: int) => boolean;

interface Person009 {
    name: string;
    age: int;
  }

class CustomError023 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomError023";
    }
  }

class Item028 {
    value: int;
    constructor(v: int) {
      this.value = v;
    }
  }

interface SparseArrayFilterPartItem {
  id: int;
}

interface SparseArrayFilterPartNamedItem {
  id: int;
  name: string;
}

// Merged from SparseArrayFilterPart01Test + SparseArrayFilterPart03Test (50 scenarios -> 5 cases, each <=10)

interface Item015 {
  value: int | null
}

function nullToZero(v: int | null): int {
  if (v === null) {
    return 0;
  }
  return v;
}

class CustomError019 extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError019";
  }
}

interface Item019 {
  category: string
  value: int
}

function reduceIntSum(arr: SparseArray<int>): int {
  return arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
}

interface Obj02102 {
  id: int;
  name: string;
}

class CustomReduceError01301 extends Error {
  errorCode: int = 0;
  constructor(msg: string, c: int) {
    super(msg);
    this.errorCode = c;
  }
}

class CustomError004 extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError004";
  }
}

function reduceRightIntSum(arr: SparseArray<int>): int {
  return arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
}

function pushNestedElement(arr: SparseArray<int | SparseArray<int>>, nested: SparseArray<int | SparseArray<int>>): void {
  arr.push(nested as int | SparseArray<int>);
}

function makeNestedArr(): SparseArray<int | SparseArray<int>> {
  const inner = new SparseArray<int>(44, 55, 66);
  const arr = new SparseArray<int | SparseArray<int>>(1);
  arr.push(1, 3, 5);
  arr.push(inner);
  return arr;
}

export default function SparseArrayTransformTest(): void {
  describe('SparseArrayTransformTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0100
     * @tc.name testTransformMapNormal001
     * @tc.desc Test SparseArray.map method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformMapNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => v * 2);
          expect(result.toString()).assertEqual("2,4,6");

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => v * 2);
          expect(result![0]).assertEqual(2);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v: int): int => v * 2);
          expect(result![1]).assertEqual(4);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v, i, a) => v + i);
          expect(result![0]).assertEqual(1);
          expect(result![1]).assertEqual(3);
          expect(result![2]).assertEqual(5);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v, i) => `${i}:${v}`);
          expect(result![0]).assertEqual("0:1");

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const ok = arr.map((v: int): int => v);
          expect(ok!.length).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(2, 5, 5);
          const result = arr.map((v: int, k: int): int => v + k);
          expect(result![0]).assertEqual(2);
          expect(result![1]).assertEqual(6);
          expect(result![2]).assertEqual(7);

      }
      {
          const arr = new SparseArray<int>(3, 6, 3);
          const result = arr.map((v: int): int => v * 2);
          expect(result![0]).assertEqual(6);
          expect(result![1]).assertEqual(12);
          expect(result![2]).assertEqual(6);

      }
      {
          const arr = new SparseArray<int>(4, 2, 4);
          const result = arr.map((v: int): int => v);
          expect(result![0]).assertEqual(4);
          expect(result![1]).assertEqual(2);
          expect(result![2]).assertEqual(4);

      }
      {
          const arr = new SparseArray<int>(5, 3, 5);
          const result = arr.map((v: int, k: int): int => v + k);
          expect(result![0]).assertEqual(5);
          expect(result![1]).assertEqual(4);
          expect(result![2]).assertEqual(7);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0200
     * @tc.name testTransformMapNormal002
     * @tc.desc Test SparseArray.map method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformMapNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(7, 5, 4);
          const result = arr.map((v: int): int => v);
          expect(result![0]).assertEqual(7);
          expect(result![1]).assertEqual(5);
          expect(result![2]).assertEqual(4);

      }
      {
          const arr = new SparseArray<int>(1, 6, 5);
          const result = arr.map((v: int, k: int): int => v + k);
          expect(result![0]).assertEqual(1);
          expect(result![1]).assertEqual(7);
          expect(result![2]).assertEqual(7);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<MapValueBox>((v: int): MapValueBox => {
              const o = new MapValueBox();
              o.value = v;
              return o;
          });
          const first = result![0] as MapValueBox;
          expect(first.value).assertEqual(1);

      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 1;
          const result = arr.map((v: int): int => v * 2);
          expect(result!.length).assertEqual(1);
          expect(result![0]).assertEqual(2);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => v * 2);
          expect(result!.length).assertEqual(3);
          expect(result.toString()).assertEqual("2,4,6");

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => v.toString());
          expect(result![0]).assertEqual("1");
          expect(typeof result![0]).assertEqual("string");

      }
      {
          const arr = new SparseArray<string>("1", "2", "3");
          const result = arr.map((v) => parseInt(v));
          expect(result![0]).assertEqual(1);
          expect(typeof result![0]).assertEqual("number");

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<MapOriginalDoubled>((v: int): MapOriginalDoubled => {
              const o = new MapOriginalDoubled();
              o.original = v;
              o.doubled = v * 2;
              return o;
          });
          const first = result![0] as MapOriginalDoubled;
          expect(first.original).assertEqual(1);
          expect(first.doubled).assertEqual(2);

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3);
          const result = arr.map((v) => (v === null ? 0 : v * 2));
          expect(result![0]).assertEqual(2);
          expect(result![1]).assertEqual(0);
          expect(result![2]).assertEqual(6);

      }
      {
          const arr = new SparseArray<int | undefined>(3);
          arr[0] = 1;
          arr[1] = undefined;
          arr[2] = 3;
          const result = arr.map((v) => (v === undefined ? 0 : v * 2));
          expect(result![0]).assertEqual(2);
          expect(result![1]).assertEqual(0);
          expect(result![2]).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0300
     * @tc.name testTransformMapNormal003
     * @tc.desc Test SparseArray.map method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformMapNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          arr[0] = 2147483647;
          const result = arr.map((v) => v + 1);
          expect(result![0]).assertEqual(-2147483648);

      }
      {
          const arr = new SparseArray<int>();
          arr[0] = -2147483648;
          const result = arr.map((v) => v - 1);
          expect(result![0]).assertEqual(2147483647);

      }
      {
          const arr = new SparseArray<int>(0, 1, 2);
          const result = arr.map((v) => v + 1);
          expect(result![0]).assertEqual(1);

      }
      {
          const arr = new SparseArray<int>(-1, -2, -3);
          const result = arr.map((v) => v * -1);
          expect(result![0]).assertEqual(1);
          expect(result![1]).assertEqual(2);
          expect(result![2]).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => v * 2);
          expect(result instanceof SparseArray).assertTrue();

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result: SparseArray<string> = arr.map((v) => v.toString());
          expect(typeof result![0]).assertEqual("string");

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => v * 2);
          expect(result !== arr).assertTrue();

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => v * 2);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => v * 2);
          expect(result!.length).assertEqual(arr.length);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v, i) => i);
          expect(result![0]).assertEqual(0);
          expect(result![1]).assertEqual(1);
          expect(result![2]).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0400
     * @tc.name testTransformMapNormal004
     * @tc.desc Test SparseArray.map method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformMapNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          const result = arr.map((v) => v * 2);
          expect(result!.length).assertEqual(0);
          expect(result instanceof SparseArray).assertTrue();

      }
      {
          const arr = new SparseArray<int>(1000);
          const result = arr.map((v) => v * 2);
          expect(result!.length).assertEqual(1000);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result1 = arr.map((v: int): int => v * 2);
          const result2 = result1.map((v: int): int => v + 1);
          expect(result2![0]).assertEqual(3);
          expect(result2![1]).assertEqual(5);
          expect(result2![2]).assertEqual(7);

      }
      {
          const arr = new SparseArray<int>(4, 5, 5);
          const result = arr.map((v: int, k: int): int => v + k);
          expect(result![0]).assertEqual(4);
          expect(result![1]).assertEqual(6);
          expect(result![2]).assertEqual(7);

      }
      {
          const arr = new SparseArray<int>(5, 6, 3);
          const result = arr.map((v: int): int => v * 2);
          expect(result![0]).assertEqual(10);
          expect(result![1]).assertEqual(12);
          expect(result![2]).assertEqual(6);

      }
      {
          const arr = new SparseArray<int>(6, 2, 4);
          const result = arr.map((v: int): int => v);
          expect(result![0]).assertEqual(6);
          expect(result![1]).assertEqual(2);
          expect(result![2]).assertEqual(4);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v: int): null => null);
          expect(result![0]).assertEqual(null);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<number>((v: int): number => v * 2);
          expect(typeof result![0]).assertEqual("number");

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<string>((v: int): string => v.toString());
          expect(typeof result![0]).assertEqual("string");

      }
      {
          const arr = new SparseArray<int>(1, 0, 3);
          const result = arr.map<boolean>((v: int): boolean => v > 1);
          expect(result![0]).assertEqual(false);
          expect(result![1]).assertEqual(false);
          expect(result![2]).assertEqual(true);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0500
     * @tc.name testTransformMapNormal005
     * @tc.desc Test SparseArray.map method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformMapNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<MapValueIndexBox>((v: int, i: int, _a: SparseArray<int>): MapValueIndexBox => {
              const o = new MapValueIndexBox();
              o.value = v;
              o.index = i;
              return o;
          });
          const first = result![0] as MapValueIndexBox;
          expect(first.value).assertEqual(1);
          expect(first.index).assertEqual(0);
          return;

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<Array<int>>((v: int): Array<int> => {
              const row: Array<int> = [];
              row.push(v);
              row.push(v * 2);
              return row;
          });
          expect(result![0]![0]).assertEqual(1);
          expect(result![0]![1]).assertEqual(2);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<int | string>((v: int): int | string => (v % 2 === 0 ? "even" : v));
          expect(result![0]).assertEqual(1);
          expect(result![1]).assertEqual("even");

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<int>((v) => v);
          expect(result![0]).assertEqual(arr[0]);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map<string>((v) => `value:${v}`);
          expect(result![0]).assertEqual("value:1");

      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          const result = arr.map((v) => v * 2);
          expect(result![0]).assertEqual(2);
          expect(result![2]).assertEqual(6);
          expect(result![4]).assertEqual(10);
          expect(result![1]).assertEqual(undefined);
          expect(result![3]).assertEqual(undefined);

      }
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 1;
          arr[5] = 2;
          arr[9] = 3;
          const result = arr.map((v) => v + 10);
          expect(result![0]).assertEqual(11);
          expect(result![5]).assertEqual(12);
          expect(result![9]).assertEqual(13);

      }
      {
          const arr = new SparseArray<int>(5, 5, 5);
          const result = arr.map((v: int, k: int): int => v + k);
          expect(result![0]).assertEqual(5);
          expect(result![1]).assertEqual(6);
          expect(result![2]).assertEqual(7);

      }
      {
          const arr = new SparseArray<int | string>(1, "2", 3);
          const result = arr.map<string>((v) => v.toString());
          expect(result![0]).assertEqual("1");
          expect(result![1]).assertEqual("2");
          expect(result![2]).assertEqual("3");

      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const result = arr.map((v, i) => v + i * 100);
          expect(result![0]).assertEqual(10);
          expect(result![1]).assertEqual(120);
          expect(result![2]).assertEqual(230);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0600
     * @tc.name testTransformMapNormal006
     * @tc.desc Test SparseArray.map method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformMapNormal006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v, i, a) => v + a.length);
          expect(result![0]).assertEqual(4);
          expect(result![1]).assertEqual(5);
          expect(result![2]).assertEqual(6);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v) => undefined);
          expect(result![0]).assertEqual(undefined);
          expect(result![1]).assertEqual(undefined);
          expect(result![2]).assertEqual(undefined);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.map((v: int): null => null);
          expect(result![0]).assertEqual(null);
          expect(result![1]).assertEqual(null);
          expect(result![2]).assertEqual(null);

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
          const result = arr.map((v: float): float => v * 2.0f);
          expect(result![0]).assertEqual(2.0f);
          expect(result![1]).assertEqual(5.0f);

      }
      {
          const arr = new SparseArray<byte>(10 as byte, 20 as byte);
          const result = arr.map<byte>((v: byte, _k: int, _a: SparseArray<byte>): byte => (Byte.toInt(v) + 1).toByte());
          expect(result![0]).assertEqual(11 as byte);
          expect(result![1]).assertEqual(21 as byte);

      }
      {
          const holder = new NestedNullHolder041();
          holder.label = "item";
          holder.items = null;
          const arr = new SparseArray<NestedNullHolder041>(holder);
          const result = arr.map((v: NestedNullHolder041): string => {
            if (v.items === null) {
              return v.label + ":null-list";
            }
            return v.label;
          });
          expect(result![0]).assertEqual("item:null-list");

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3);
          const result = arr.map((v: int | null): string => {
            if (v === null) {
              return "NULL";
            }
            return `${v}`;
          });
          expect(result![1]).assertEqual("NULL");

      }
      {
          const arr = new SparseArray<int>(1, 0b11, 3);
          const result = arr.map((v: int, i: int): int => {
            if (i === 0x1) {
              return v * 2;
            }
            return v;
          });
          expect(result![0x1]).assertEqual(0b11 * 2);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B');
          const result = arr.map<string>((v: char): string => {
            if (v === c'A') {
              return "A";
            }
            return "B";
          });
          expect(result[0]).assertEqual("A");
          expect(result[1]).assertEqual("B");

      }
      {
          const arr = new SparseArray<boolean>(true, false);
          const result = arr.map<boolean>((v: boolean): boolean => !v);
          expect(result[0]).assertEqual(false);
          expect(result[1]).assertEqual(true);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0700
     * @tc.name testTransformMapNormal007
     * @tc.desc Test SparseArray.map method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformMapNormal007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>(6);
          arr[5] = "tail";
          const result = arr.map<string>((v: string, i: int): string => i.toString() + ":" + v);
          expect(result.length).assertEqual(6);
          expect(result[0]).assertUndefined();
          expect(result[5]).assertEqual("5:tail");

      }
      {
        // 1. map triple v*3 on [1,2,3] -> result [3,6,9]
        const arr1 = new SparseArray<int>(1, 2, 3);
        const r1 = arr1.map((v: int, i: int, a: SparseArray<int>): int => v * 3);
        expect(r1[0]!).assertEqual(3);
        expect(r1[1]!).assertEqual(6);
        expect(r1[2]!).assertEqual(9);
        // 2. map int->double v.toDouble()*1.5 on [1,2,3] -> [1.5,3.0,4.5]
        const arr2 = new SparseArray<int>(1, 2, 3);
        const r2 = arr2.map((v: int, i: int, a: SparseArray<int>): double => v.toDouble() * 1.5);
        expect(r2[0]!).assertEqual(1.5);
        expect(r2[1]!).assertEqual(3.0);
        expect(r2[2]!).assertEqual(4.5);
        // 3. map int->Item01402 on [1,2,3] -> ids 1,2,3 and label "item1"
        const arr3 = new SparseArray<int>(1, 2, 3);
        const r3 = arr3.map((v: int, i: int, a: SparseArray<int>): Item01402 => {
          return { id: v, label: 'item' + v.toString() } as Item01402;
        });
        expect(r3[0]!.id).assertEqual(1);
        expect(r3[0]!.label).assertEqual('item1');
        expect(r3[1]!.id).assertEqual(2);
        expect(r3[2]!.id).assertEqual(3);
        // 4. map -> nested SparseArray(v, v*10) on [1,2] -> [1,10] and [2,20]
        const arr4 = new SparseArray<int>(1, 2);
        const r4 = arr4.map((v: int, i: int, a: SparseArray<int>): SparseArray<int> => {
          return new SparseArray<int>(v, v * 10);
        });
        expect(r4[0]![0]!).assertEqual(1);
        expect(r4[0]![1]!).assertEqual(10);
        expect(r4[1]![0]!).assertEqual(2);
        expect(r4[1]![1]!).assertEqual(20);
        // 5. map wraps empty string with brackets on ['','a','b'] -> result[0]="[]"
        const arr5 = new SparseArray<string>('', 'a', 'b');
        const r5 = arr5.map((v: string, i: int, a: SparseArray<string>): string => '[' + v + ']');
        expect(r5[0]!).assertEqual('[]');
        // 6. map wraps newline/tab with 'X' on ['\n','\t','normal'] -> "X\nX" and "X\tX"
        const arr6 = new SparseArray<string>('\n', '\t', 'normal');
        const r6 = arr6.map((v: string, i: int, a: SparseArray<string>): string => 'X' + v + 'X');
        expect(r6[0]!).assertEqual('X\nX');
        expect(r6[1]!).assertEqual('X\tX');
        // 7. map<string> boolean->yes/no on [T,F,T] -> length 3, [0]="yes", [1]="no"
        const arr7 = new SparseArray<boolean>(true, false, true);
        const r7: SparseArray<string> = arr7.map<string>((value: boolean) => (value ? 'yes' : 'no'));
        expect(r7.length).assertEqual(3);
        expect(r7[0]!).assertEqual('yes');
        expect(r7[1]!).assertEqual('no');
        // 8. map<boolean> string->non-empty on ["hello","","world"] -> [0]=true, [1]=false
        const arr8 = new SparseArray<string>('hello', '', 'world');
        const r8: SparseArray<boolean> = arr8.map<boolean>((value: string) => value.length > 0);
        expect(r8[0]!).assertTrue();
        expect(r8[1]!).assertFalse();
        // 9. map<int> on empty SparseArray<string> -> length 0, callCount 0, arr.length 0
        const arr9 = new SparseArray<string>();
        let cc9: int = 0;
        const r9: SparseArray<int> = arr9.map<int>((value: string): int => {
          cc9 = cc9 + 1;
          return value.length;
        });
        expect(r9.length).assertEqual(0);
        expect(cc9).assertEqual(0);
        expect(arr9.length).assertEqual(0);
        // 10. map int->Box03502|null on [1,2,3] -> [0].id=1, [1]=null, [2].id=3
        const arr10 = new SparseArray<int>(1, 2, 3);
        const r10: SparseArray<Box03502 | null> = arr10.map((v: int, i: int, a: SparseArray<int>): Box03502 | null => {
          if (v === 2) {
            return null;
          }
          return { id: v } as Box03502;
        });
        expect(r10[0]!.id).assertEqual(1);
        expect(r10[1]).assertNull();
        expect(r10[2]!.id).assertEqual(3);

      }
      {
        // 1. map<bigint> int*100 on [42,99] -> result[0]=4200n
        const arr1 = new SparseArray<int>(42, 99);
        const r1: SparseArray<bigint> = arr1.map<bigint>((value: int) => BigInt(value * 100));
        expect(r1[0]!).assertEqual(4200n);
        // 2. map<string> prepend '$' on [5,-3,8] -> result[1]="$-3"
        const arr2 = new SparseArray<int>(5, -3, 8);
        const r2: SparseArray<string> = arr2.map<string>((value: int) => '$' + value.toString());
        expect(r2[1]!).assertEqual('$-3');
        // 3. map<int> boolean->1/0 on [T,F,T] -> result[0]=1
        const arr3 = new SparseArray<boolean>(true, false, true);
        const r3: SparseArray<int> = arr3.map<int>((value: boolean) => (value ? 1 : 0));
        expect(r3[0]!).assertEqual(1);
        // 4. map<double> int/3.0 on [5,10,15] -> result[0]=5.0/3.0
        const arr4 = new SparseArray<int>(5, 10, 15);
        const r4: SparseArray<double> = arr4.map<double>((value: int) => value / 3.0);
        expect(r4[0]!).assertEqual(5.0 / 3.0);
        // 5. map<int> MIN_INT+1 on [-2147483648] -> result[0]=-2147483647
        const arr5 = SparseArray.of<int>(-2147483648);
        const r5: SparseArray<int> = arr5.map<int>((value: int) => value + 1);
        expect(r5[0]!).assertEqual(-2147483647);
        // 6. map<double> int*1.1 on [1,2,3,4] -> length 4, [0..3]=1.1,2.2,3.3,4.4
        const arr6 = new SparseArray<int>(1, 2, 3, 4);
        const r6: SparseArray<double> = arr6.map<double>((value: int) => value * 1.1);
        expect(r6.length).assertEqual(4);
        expect(r6[0]!).assertClose(1.1, 0.0001);
        expect(r6[1]!).assertClose(2.2, 0.0001);
        expect(r6[2]!).assertClose(3.3, 0.0001);
        expect(r6[3]!).assertClose(4.4, 0.0001);
        // 7. map<int> bigint->int on [10n,20n,30n] -> length 3, [0..2]=10,20,30
        const arr7 = new SparseArray<bigint>(10n, 20n, 30n);
        const r7: SparseArray<int> = arr7.map<int>((value: bigint): int => Number(value).toInt());
        expect(r7.length).assertEqual(3);
        expect(r7[0]!).assertEqual(10);
        expect(r7[1]!).assertEqual(20);
        expect(r7[2]!).assertEqual(30);
        // 8. map v>5 on sparse {1:10,3:30} -> holes undefined, [1] and [3] true
        const arr8 = new SparseArray<int>(4);
        arr8[1] = 10;
        arr8[3] = 30;
        const r8: SparseArray<boolean> = arr8.map((v: int, i: int, a: SparseArray<int>): boolean => v > 5);
        expect(r8[0]).assertUndefined();
        expect(r8[1]!).assertTrue();
        expect(r8[2]).assertUndefined();
        expect(r8[3]!).assertTrue();
        // 9. callback reads a[-(len+1)] at i=0 on [5,10,15] -> undefined
        const arr9 = new SparseArray<int>(5, 10, 15);
        let negBeyond9: Object | undefined = undefined;
        arr9.map((v: int, i: int, a: SparseArray<int>): int => {
          if (i === 0) {
            negBeyond9 = a[-(arr9.length + 1)];
          }
          return v;
        });
        expect(negBeyond9).assertUndefined();
        // 10. callback writes a[3]=99 at i=2 on [1,2,3] -> arr.length grows to 4, arr[3]=99
        const arr10 = new SparseArray<int>(1, 2, 3);
        arr10.map((v: int, i: int, a: SparseArray<int>): int => {
          if (i === 2) {
            a[3] = 99;
          }
          return v;
        });
        expect(arr10.length).assertEqual(4);
        expect(arr10[3]!).assertEqual(99);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0800
     * @tc.name testTransformMapError001
     * @tc.desc Test SparseArray.map method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformMapError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
              const arr = new SparseArray<int>(1, 2, 3);
              arr.map((v) => {
                  throw new Error("test error");
              });
              expect().assertFail();
          } catch (error) {
              expect(error.name).assertEqual("Error");
          }

      }
      {
        // 1. map throws URIError on [1,2,3] -> caught name "URIError"
        const arr1 = new SparseArray<int>(1, 2, 3);
        try {
          arr1.map((v: int, i: int, a: SparseArray<int>): int => {
            throw new URIError('uri error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('URIError');
        }
        // 2. map throws AggregateError on [1,2,3] -> caught name "AggregateError"
        const arr2 = new SparseArray<int>(1, 2, 3);
        try {
          arr2.map((v: int, i: int, a: SparseArray<int>): int => {
            let errs: Error[] = [new Error('e1'), new Error('e2')];
            throw new AggregateError(errs, 'aggregate');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('AggregateError');
        }
        // 3. map throws EvalError at i=2 on [100,200,300,400,500] -> caught "EvalError"
        const arr3 = new SparseArray<int>(100, 200, 300, 400, 500);
        try {
          arr3.map((v: int, i: int, a: SparseArray<int>): int => {
            if (i === 2) {
              throw new EvalError('eval at idx 2');
            }
            return v;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('EvalError');
        }
        // 4. map throws Error at i=3 on [1..7] -> caught "Error", count=4
        const arr4 = new SparseArray<int>(1, 2, 3, 4, 5, 6, 7);
        let count4: int = 0;
        try {
          arr4.map((v: int, i: int, a: SparseArray<int>): int => {
            count4 = count4 + 1;
            if (i === 3) {
              throw new Error('middle');
            }
            return v * 10;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(count4).assertEqual(4);
        }
        // 5. map on empty 5-length array never runs throwing callback -> result length 5, [0] undefined
        const arr5 = new SparseArray<int>(5);
        const r5: SparseArray<int> = arr5.map((v: int, i: int, a: SparseArray<int>): int => {
          throw new Error('should never execute');
        });
        expect(r5.length).assertEqual(5);
        expect(r5[0]).assertUndefined();
        // 6. map on sparse {0:10,1:20,4:50} throws at i=4 -> caught "Error", count=3
        const arr6 = new SparseArray<int>(5);
        arr6[0] = 10;
        arr6[1] = 20;
        arr6[4] = 50;
        let count6: int = 0;
        try {
          arr6.map((v: int, i: int, a: SparseArray<int>): int => {
            count6 = count6 + 1;
            if (i === 4) {
              throw new Error('after hole');
            }
            return v;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(count6).assertEqual(3);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_0900
     * @tc.name testTransformFilterNormal001
     * @tc.desc Test SparseArray.filter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFilterNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.filter((value, index, array) => {
            expect(array === arr).assertTrue();
            return index > 1;
          });
          expect(result!.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.filter((v) => true);
          expect(result!.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.filter((v) => false);
          expect(result!.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.filter((v) => v > 2);
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertEqual(3);
          expect(result[1]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          const result = arr.filter((v, index) => index >= 1);
          expect(result!.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.filter((v, i, a) => {
            expect(a.length).assertEqual(3);
            return v > 1;
          });
          expect(result!.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(0, 1, 2);
          const result = arr.filter((v): boolean => v !== 0);
          expect(result![0]).assertEqual(1);
          expect(result![1]).assertEqual(2);


      }
      {
          const arr = new SparseArray<string>("apple", "banana", "cherry");
          const result = arr.filter((v) => v.length > 5);
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertEqual("banana");
          expect(result[1]).assertEqual("cherry");


      }
      {
        const arr = new SparseArray<Person009>(
            { name: "Alice", age: 25 },
            { name: "Bob", age: 30 }
          );
          const result = arr.filter((p) => p.age > 28);
          expect(result!.length).assertEqual(1);
          expect(result![0]!.name).assertEqual("Bob");


      }
      {
          const arr = new SparseArray<string | int>("hello", 42, "world", 100);
          const result = arr.filter((v) => (typeof v == "string"));
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertEqual("hello");
          expect(result[1]).assertEqual("world");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1000
     * @tc.name testTransformFilterNormal002
     * @tc.desc Test SparseArray.filter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFilterNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int | null>(1, null, 2, null);
          const result = arr.filter((v) => v !== null);
          expect(result!.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined, 2, undefined);
          const result = arr.filter((v) => v !== undefined);
          expect(result!.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const result = arr.filter((v) => v > 2);
          expect(result!.length).assertEqual(3);
          expect(result![0]).assertEqual(3);
          expect(result[1]).assertEqual(4);
          expect(result[2]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>();
          const result = arr.filter((v) => v > 1);
          expect(result!.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          const result = arr.filter((v) => v > 2);
          expect(result!.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[2] = 20;
          arr[4] = 30;
          const result = arr.filter((v) => v !== undefined);
          expect(result!.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result: SparseArray<int> = arr.filter((v) => v > 1);
          expect(result instanceof SparseArray).assertTrue();
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(2);
          expect(result[1]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[4] = 5;
          const result = arr.filter((v) => v > 3);
          expect(result!.length).assertEqual(1);
          expect(result![0]).assertEqual(5);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr.push(i);
          }
          const result = arr.filter((v) => v % 2 == 0);
          expect(result!.length).assertEqual(500);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.filter((v) => v > 1);
          result.push(4);
          expect(arr.length).assertEqual(3);
          expect(result!.length).assertEqual(3);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1100
     * @tc.name testTransformFilterNormal003
     * @tc.desc Test SparseArray.filter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFilterNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5, 1, 4, 2, 3);
          const result = arr.filter((v) => v > 2);
          expect(result![0]).assertEqual(5);
          expect(result[1]).assertEqual(4);
          expect(result[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const originalLength = arr.length;
          const result = arr.filter((v) => v > 1);
          expect(arr.length).assertEqual(originalLength);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);


      }
      {
        const arr = new SparseArray<Item028>(new Item028(1), new Item028(2));
          const result = arr.filter((item) => item.value > 1);
          const head = result![0];
          expect(head !== undefined && head !== null).assertTrue();
          head!.value = 10;
          expect(arr[1]!.value).assertEqual(10);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[1] = 10;
          arr[3] = 30;
          arr[5] = 50;
          const result = arr.filter((v) => v > 20);
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertEqual(30);
          expect(result![1]).assertEqual(50);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[2] = 20;
          arr[5] = 50;
          arr[8] = 80;
          const indices: Array<int> = [];
          arr.filter((v, index) => {
            indices.push(index);
            return true;
          });
          expect(indices[0]).assertEqual(2);
          expect(indices[1]).assertEqual(5);
          expect(indices[2]).assertEqual(8);


      }
      {
          const arr = new SparseArray<long>();
          const low: long = 100 as long;
          const high: long = 10000000000 as long;
          arr.$_set(0, low);
          arr.$_set(1, high);
          const threshold: long = 1000000 as long;
          const result = arr.filter((v: long): boolean => v > threshold);
          expect(result!.length).assertEqual(1);
          expect(result![0]).assertEqual(high);

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f, 0.5f);
          const result = arr.filter((v: float): boolean => v > 2.0f);
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertEqual(2.5f);
          expect(result![1]).assertEqual(3.0f);

      }
      {
          const bad = "\uFFFE";
          const arr = new SparseArray<string>("ok", bad, "tail");
          const result = arr.filter((v: string): boolean => v.indexOf("\uFFFE") >= 0);
          expect(result!.length).assertEqual(1);
          expect(result![0]).assertEqual(bad);

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3, null);
          const result = arr.filter((v: int | null): boolean => v === null);
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertEqual(null);

      }
      {
          const arr = new SparseArray<int>(1, 0xFF, 2, 0xFF);
          const result = arr.filter((v: int): boolean => v === 0xFF);
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertEqual(0xFF);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1200
     * @tc.name testTransformFilterNormal004
     * @tc.desc Test SparseArray.filter method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFilterNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. filter(-1,0,1,2) v>0 -> length 2
        const arr1 = new SparseArray<int>(-1, 0, 1, 2);
        const result1 = arr1.filter((v: int, i: int, a: SparseArray<int>): boolean => v > 0);
        expect(result1.length).assertEqual(2);
        // 2. filter(1,2,3,4) v%2===0 -> length 2
        const arr2 = new SparseArray<int>(1, 2, 3, 4);
        const result2 = arr2.filter((v: int, i: int, a: SparseArray<int>): boolean => v % 2 === 0);
        expect(result2.length).assertEqual(2);
        // 3. filter(1,2,3,4,5) v>3 -> length 2
        const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
        const result3 = arr3.filter((v: int, i: int, a: SparseArray<int>): boolean => v > 3);
        expect(result3.length).assertEqual(2);
        // 4. filter(1,2,3,4,5,6) v>2&&v<5 -> length 2
        const arr4 = new SparseArray<int>(1, 2, 3, 4, 5, 6);
        const result4 = arr4.filter((v: int, i: int, a: SparseArray<int>): boolean => v > 2 && v < 5);
        expect(result4.length).assertEqual(2);
        // 5. filter(-5,-3,-1) v<0 -> length 3
        const arr5 = new SparseArray<int>(-5, -3, -1);
        const result5 = arr5.filter((v: int, i: int, a: SparseArray<int>): boolean => v < 0);
        expect(result5.length).assertEqual(3);
        // 6. filter(1,2,3,4,5,6) (v%2===0&&v>2)||v===1 -> length 3
        const arr6 = new SparseArray<int>(1, 2, 3, 4, 5, 6);
        const result6 = arr6.filter((v: int, i: int, a: SparseArray<int>): boolean => (v % 2 === 0 && v > 2) || v === 1);
        expect(result6.length).assertEqual(3);
        // 7. filter(0,0,0) value===0 -> length 3
        const arr7 = new SparseArray<int>(0, 0, 0);
        const result7 = arr7.filter((value: int): boolean => value === 0);
        expect(result7.length).assertEqual(3);
        // 8. filter(1,2,3,4) v>0&&i>=0&&a.length===4 -> length 4 (filter-all, 3 params)
        const arr8 = new SparseArray<int>(1, 2, 3, 4);
        const result8 = arr8.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          return v > 0 && i >= 0 && a.length === 4;
        });
        expect(result8.length).assertEqual(4);
        // 9. filter(1,2,3,4,5) a.includes(v*2) -> length 2 (predicate uses array method)
        const arr9 = new SparseArray<int>(1, 2, 3, 4, 5);
        const result9 = arr9.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          return a.includes(v * 2);
        });
        expect(result9.length).assertEqual(2);
        // 10. filter(5,5,5) callCount++ -> 3 (invocation count equals length)
        let callCount10: int = 0;
        const arr10 = new SparseArray<int>(5, 5, 5);
        arr10.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          callCount10 = callCount10 + 1;
          return v === 5;
        });
        expect(callCount10).assertEqual(3);

      }
      {
        // 1. filter(100,200,300) capture firstIdx -> 0
        const arr1 = new SparseArray<int>(100, 200, 300);
        let firstIdx1: int = -1;
        arr1.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          if (firstIdx1 === -1) {
            firstIdx1 = i;
          }
          return true;
        });
        expect(firstIdx1).assertEqual(0);
        // 2. filter(11,22,33) capture lastIdx -> 2
        const arr2 = new SparseArray<int>(11, 22, 33);
        let lastIdx2: int = -1;
        arr2.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          lastIdx2 = i;
          return true;
        });
        expect(lastIdx2).assertEqual(2);
        // 3. filter(1,2,3,4,5) monotonic index -> true
        const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
        let prevIdx3: int = -1;
        let monotonic3: boolean = true;
        arr3.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          if (i <= prevIdx3) {
            monotonic3 = false;
          }
          prevIdx3 = i;
          return true;
        });
        expect(monotonic3).assertTrue();
        // 4. filter sparse len=5 {0,3} capture indices -> [0,3]
        const arr4 = new SparseArray<int>(5);
        arr4[0] = 10;
        arr4[3] = 40;
        let indices4: int[] = [];
        arr4.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          indices4.push(i);
          return true;
        });
        expect(indices4[0]).assertEqual(0);
        expect(indices4[1]).assertEqual(3);
        // 5. filter len=5 sparse@{3} capturedIdx -> 3
        const arr5 = new SparseArray<int>(5);
        arr5[3] = 99;
        let capturedIdx5: int = -1;
        arr5.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          capturedIdx5 = i;
          return true;
        });
        expect(capturedIdx5).assertEqual(3);
        // 6. filter len=100 sparse@{99} value===999 -> length 1, result[0]=999
        const arr6 = new SparseArray<int>(100);
        arr6[99] = 999;
        const result6 = arr6.filter((value: int): boolean => value === 999);
        expect(result6.length).assertEqual(1);
        expect(result6[0]).assertEqual(999);
        // 7. filter(1,2,3) sameRef a===arr -> true
        const arr7 = new SparseArray<int>(1, 2, 3);
        let sameRef7: boolean = false;
        arr7.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          sameRef7 = a === arr7;
          return true;
        });
        expect(sameRef7).assertTrue();
        // 8. filter(10 sparse{0,9}) a.length===10 -> lenMatch true
        const arr8 = new SparseArray<int>(10);
        arr8[0] = 1;
        arr8[9] = 10;
        let lenMatch8: boolean = true;
        arr8.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          if (a.length !== 10) {
            lenMatch8 = false;
          }
          return true;
        });
        expect(lenMatch8).assertTrue();
        // 9. filter(5,10,15) a[i]===v -> allMatch true
        const arr9 = new SparseArray<int>(5, 10, 15);
        let allMatch9: boolean = true;
        arr9.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          if (a[i] !== v) {
            allMatch9 = false;
          }
          return true;
        });
        expect(allMatch9).assertTrue();
        // 10. filter(10,20,30) a[0]&&a[2] at i===1 -> canAccess true
        const arr10 = new SparseArray<int>(10, 20, 30);
        let canAccess10: boolean = false;
        arr10.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          if (i === 1) {
            canAccess10 = a[0] === 10 && a[2] === 30;
          }
          return true;
        });
        expect(canAccess10).assertTrue();

      }
      {
        // 1. filter(1,2,3,2,4) v===2 -> result[0]=2,result[1]=2; result[0]=99 keeps arr[0]=1; length 2
        const arr1 = new SparseArray<int>(1, 2, 3, 2, 4);
        const result1 = arr1.filter((v: int, i: int, a: SparseArray<int>): boolean => v === 2);
        expect(result1[0]!).assertEqual(2);
        expect(result1[1]!).assertEqual(2);
        result1[0] = 99;
        expect(arr1[0]!).assertEqual(1);
        expect(result1.length).assertEqual(2);
        // 2. filter(1,2,3) a[i]=v*10 -> arr becomes 10,20,30
        const arr2 = new SparseArray<int>(1, 2, 3);
        arr2.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          a[i] = v * 10;
          return true;
        });
        expect(arr2[0]).assertEqual(10);
        expect(arr2[1]).assertEqual(20);
        expect(arr2[2]).assertEqual(30);
        // 3. filter(1,2,3) read array[-1] as undefined, preserves all -> length 3
        const arr3 = new SparseArray<int>(1, 2, 3);
        const result3 = arr3.filter((value: int, index: int, array: SparseArray<int>): boolean => {
          const v: int | undefined = array[-1];
          expect(v).assertUndefined();
          return true;
        });
        expect(result3.length).assertEqual(3);
        // 4. filter(1,2,3) read array[length] as undefined, preserves all -> length 3
        const arr4 = new SparseArray<int>(1, 2, 3);
        const result4 = arr4.filter((value: int, index: int, array: SparseArray<int>): boolean => {
          const v: int | undefined = array[arr4.length];
          expect(v).assertUndefined();
          return true;
        });
        expect(result4.length).assertEqual(3);
        // 5. filter(1,2,3) array[-1]=0 ignored -> result 3, arr 3, arr[-1] undefined
        const arr5 = new SparseArray<int>(1, 2, 3);
        const result5 = arr5.filter((_value: int, _index: int, array: SparseArray<int>): boolean => {
          array[-1] = 0;
          return true;
        });
        expect(result5.length).assertEqual(3);
        expect(arr5.length).assertEqual(3);
        expect(arr5[-1]).assertUndefined();
        // 6. filter(1,2) array[5]=999 observes appended -> length 3
        const arr6 = new SparseArray<int>(1, 2);
        const result6 = arr6.filter((value: int, index: int, array: SparseArray<int>): boolean => {
          array[5] = 999;
          return true;
        });
        expect(result6.length).assertEqual(3);
        // 7. filter(10,20,30,40) prev!==undefined -> length 4
        const arr7 = new SparseArray<int>(10, 20, 30, 40);
        const result7 = arr7.filter((value: int, index: int, array: SparseArray<int>): boolean => {
          if (index > 0) {
            const prev: int | undefined = array[index - 1];
            return prev !== undefined;
          }
          return true;
        });
        expect(result7.length).assertEqual(4);
        // 8. filter(1,2,3) array[10]=999 at idx 0 -> length 4
        const arr8 = new SparseArray<int>(1, 2, 3);
        const result8 = arr8.filter((value: int, index: int, array: SparseArray<int>): boolean => {
          if (index === 0) {
            array[10] = 999;
          }
          return true;
        });
        expect(result8.length).assertEqual(4);
        // 9. filter(1,2,3,4,5) length=10 then array.length=2 at idx 2 -> length 3
        const arr9 = new SparseArray<int>(1, 2, 3, 4, 5);
        arr9.length = 10;
        const result9 = arr9.filter((value: int, index: int, array: SparseArray<int>): boolean => {
          if (index === 2) {
            array.length = 2;
          }
          return true;
        });
        expect(result9.length).assertEqual(3);
        // 10. filter(1,2,3) array[2]=999 at idx 1, v>1 -> length 2
        const arr10 = new SparseArray<int>(1, 2, 3);
        const result10 = arr10.filter((value: int, index: int, array: SparseArray<int>): boolean => {
          if (index === 1) {
            array[2] = 999;
          }
          return value > 1;
        });
        expect(result10.length).assertEqual(2);

      }
      {
        // 1. T=boolean filter(true,false,true) v -> length 2
        const arr1 = new SparseArray<boolean>(true, false, true);
        const result1 = arr1.filter((v: boolean, i: int, a: SparseArray<boolean>): boolean => v);
        expect(result1.length).assertEqual(2);
        // 2. T=double filter(NaN,1.0,2.0) isNaN(v) -> length 1
        const arr2 = new SparseArray<double>(Double.NaN, 1.0, 2.0);
        const result2 = arr2.filter((v: double, i: int, a: SparseArray<double>): boolean => isNaN(v));
        expect(result2.length).assertEqual(1);
        // 3. T=double filter(POSITIVE_INFINITY,1.0) !isFinite(v) -> length 1
        const arr3 = new SparseArray<double>(Double.POSITIVE_INFINITY, 1.0);
        const result3 = arr3.filter((v: double, i: int, a: SparseArray<double>): boolean => !isFinite(v));
        expect(result3.length).assertEqual(1);
        // 4. T=double filter(-0.0,0.0,1.0) v>=0 -> length 3
        const arr4 = new SparseArray<double>(-0.0, 0.0, 1.0);
        const result4 = arr4.filter((value: double): boolean => value >= 0.0);
        expect(result4.length).assertEqual(3);
        // 5. T=bigint filter(9223372036854775807n,1n,2n) v>100n -> length 1
        const arr5 = new SparseArray<bigint>(9223372036854775807n, 1n, 2n);
        const result5 = arr5.filter((value: bigint): boolean => value > 100n);
        expect(result5.length).assertEqual(1);
        // 6. T=double filter(Number.MAX_VALUE,0.5) v>100 -> length 1
        const arr6 = new SparseArray<double>(Number.MAX_VALUE, 0.5);
        const result6 = arr6.filter((value: double): boolean => value > 100.0);
        expect(result6.length).assertEqual(1);
        // 7. T=object filter(obj1,obj2) v.id>1 -> length 1
        const obj7a: SparseArrayFilterPartItem = { id: 1 };
        const obj7b: SparseArrayFilterPartItem = { id: 2 };
        const arr7 = new SparseArray<SparseArrayFilterPartItem>(obj7a, obj7b);
        const result7 = arr7.filter((v: SparseArrayFilterPartItem, i: int, a: SparseArray<SparseArrayFilterPartItem>): boolean => v.id > 1);
        expect(result7.length).assertEqual(1);
        // 8. T=Date filter(d1,d2) v.getTime()>0 -> length 1
        const d8a = new Date(0);
        const d8b = new Date(1000);
        const arr8 = new SparseArray<Date>(d8a, d8b);
        const result8 = arr8.filter((v: Date, i: int, a: SparseArray<Date>): boolean => v.getTime() > 0);
        expect(result8.length).assertEqual(1);
        // 9. T=RegExp filter(r1,r2) v.source==='abc' -> length 1
        const r9a = new RegExp('abc');
        const r9b = new RegExp('def');
        const arr9 = new SparseArray<RegExp>(r9a, r9b);
        const result9 = arr9.filter((v: RegExp, i: int, a: SparseArray<RegExp>): boolean => v.source === 'abc');
        expect(result9.length).assertEqual(1);
        // 10. T=string filter('a','ab','abc','abcd') v.length>2 -> length 2, result[0]='abc', result[1]='abcd'
        const arr10 = new SparseArray<string>('a', 'ab', 'abc', 'abcd');
        const result10 = arr10.filter((value: string): boolean => value.length > 2);
        expect(result10.length).assertEqual(2);
        expect(result10[0]).assertEqual('abc');
        expect(result10[1]).assertEqual('abcd');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1300
     * @tc.name testTransformFilterError001
     * @tc.desc Test SparseArray.filter method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFilterError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.filter(null as SparseArrayIntFilterPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.filter(undefined as SparseArrayIntFilterPred);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.filter((v) => {
              throw new Error("error in predicate");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.filter((v) => {
              throw new CustomError023("custom error");
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual("CustomError023");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.filter((v) => {
              if (v === 2) {
                throw new Error("error");
              }
              return true;
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
      {
        // 1. T=Date filter(2020,2021,2022) getFullYear>2020 -> length 2
        const d1a: Date = new Date(2020, 0, 1);
        const d1b: Date = new Date(2021, 0, 1);
        const d1c: Date = new Date(2022, 0, 1);
        const arr1 = new SparseArray<Date>(d1a, d1b, d1c);
        const result1 = arr1.filter((value: Date): boolean => value.getFullYear() > 2020);
        expect(result1.length).assertEqual(2);
        // 2. T=RegExp filter('abc','\\d+','xyz') source.length>2 -> length 3
        const r2a: RegExp = new RegExp('abc');
        const r2b: RegExp = new RegExp('\\d+');
        const r2c: RegExp = new RegExp('xyz');
        const arr2 = new SparseArray<RegExp>(r2a, r2b, r2c);
        const result2 = arr2.filter((value: RegExp): boolean => value.source.length > 2);
        expect(result2.length).assertEqual(3);
        // 3. T=object filter(a,b,c) id%2===1 -> length 2
        const o3a: SparseArrayFilterPartNamedItem = { id: 1, name: 'alpha' } as SparseArrayFilterPartNamedItem;
        const o3b: SparseArrayFilterPartNamedItem = { id: 2, name: 'beta' } as SparseArrayFilterPartNamedItem;
        const o3c: SparseArrayFilterPartNamedItem = { id: 3, name: 'gamma' } as SparseArrayFilterPartNamedItem;
        const arr3 = new SparseArray<SparseArrayFilterPartNamedItem>(o3a, o3b, o3c);
        const result3 = arr3.filter((value: SparseArrayFilterPartNamedItem): boolean => value.id % 2 === 1);
        expect(result3.length).assertEqual(2);
        // 4. T=Array<int> filter(sub1,sub2,sub3) length>=2 -> length 2
        const sub4a: Array<int> = [1, 2];
        const sub4b: Array<int> = [3];
        const sub4c: Array<int> = [4, 5, 6];
        const arr4 = new SparseArray<Array<int>>(sub4a, sub4b, sub4c);
        const result4 = arr4.filter((value: Array<int>): boolean => value.length >= 2);
        expect(result4.length).assertEqual(2);
        // 5. filter(1,2,3) predicate throws TypeError -> propagated
        const arr5 = new SparseArray<int>(1, 2, 3);
        try {
          arr5.filter((v: int, i: int, a: SparseArray<int>): boolean => {
            throw new TypeError('type error in predicate');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
          expect(e.message).assertEqual('type error in predicate');
        }
        // 6. filter(1,2,3) predicate throws RangeError -> propagated
        const arr6 = new SparseArray<int>(1, 2, 3);
        try {
          arr6.filter((v: int, i: int, a: SparseArray<int>): boolean => {
            throw new RangeError('range error in predicate');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          expect(e.message).assertEqual('range error in predicate');
        }
        // 7. filter(1,2,3,4,5) throw RangeError on value===3, arr unchanged
        const arr7 = new SparseArray<int>(1, 2, 3, 4, 5);
        try {
          arr7.filter((value: int): boolean => {
            if (value === 3) {
              throw new RangeError('err');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          expect(arr7[0]).assertEqual(1);
          expect(arr7[1]).assertEqual(2);
          expect(arr7[2]).assertEqual(3);
          expect(arr7[3]).assertEqual(4);
          expect(arr7[4]).assertEqual(5);
        }
        // 8. filter sparse len=5 {0,1,3,4} throw TypeError on value===40
        const arr8 = new SparseArray<int>(5);
        arr8[0] = 10;
        arr8[1] = 20;
        arr8[3] = 30;
        arr8[4] = 40;
        try {
          arr8.filter((value: int): boolean => {
            if (value === 40) {
              throw new TypeError('sparse last');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        // 9. filter(1,2,3,4,5) undefined result, throw RangeError on value===3, result undefined
        const arr9 = new SparseArray<int>(1, 2, 3, 4, 5);
        let result9: SparseArray<int> | undefined = undefined;
        try {
          result9 = arr9.filter((value: int): boolean => {
            if (value === 3) {
              throw new RangeError('half way');
            }
            return value > 0;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          expect(result9).assertUndefined();
        }
        // 10. filter sparse len=5 {0,2,4} throw RangeError on value===30, arr unchanged
        const arr10 = new SparseArray<int>(5);
        arr10[0] = 10;
        arr10[2] = 30;
        arr10[4] = 50;
        try {
          arr10.filter((value: int): boolean => {
            if (value === 30) {
              throw new RangeError('hole test');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          expect(arr10[0]).assertEqual(10);
          expect(arr10[1]).assertUndefined();
          expect(arr10[2]).assertEqual(30);
          expect(arr10[3]).assertUndefined();
          expect(arr10[4]).assertEqual(50);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1400
     * @tc.name testTransformReduceNormal001
     * @tc.desc Test SparseArray.reduce method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const s = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(s).assertEqual(6);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        const indices: Array<int> = [];
        const sum = arr.reduce((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
          indices.push(index);
          return acc + curr;
        });
        expect(sum).assertEqual(6);
        expect(indices.length).assertEqual(2);
        expect(indices[0]).assertEqual(1);
        expect(indices[1]).assertEqual(2);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(10);


      }
      {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result).assertEqual("abc");


      }
      {
        const arr = new SparseArray<int>();
        arr.push(42);
        const only = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(only).assertEqual(42);


      }
      {
        const arr = new SparseArray<int>(10, 20, 30);
        expect(reduceIntSum(arr)).assertEqual(60);


      }
      {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 2;
        arr[4] = 3;
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(6);


      }
      {
        const arr = new SparseArray<int>(-1, 2, -3, 4);
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(2);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(15);


      }
      {
        const arr = new SparseArray<int>(10, 1, 2, 3);
        const result = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(result).assertEqual(16);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1500
     * @tc.name testTransformReduceNormal002
     * @tc.desc Test SparseArray.reduce method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<string>("中文", "测试", "🎉");
        const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result).assertEqual("中文测试🎉");


      }
      {
        const arr = new SparseArray<string>("a", "", "b");
        const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result).assertEqual("ab");


      }
      {
        const arr = new SparseArray<string>("a\u200B", "b");
        const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result!.length).assertEqual(3);


      }
      {
        const arr = new SparseArray<SparseArray<int>>(new SparseArray<int>(1, 2), new SparseArray<int>(3, 4));
        const merged = arr.reduce((acc: SparseArray<int>, curr: SparseArray<int>, _i: int, _a: SparseArray<SparseArray<int>>): SparseArray<int> => {
          for (let j = 0; j < curr.length; j++) {
            acc.push(curr[j] as int);
          }
          return acc;
        });
        expect(merged.length).assertEqual(4);
        expect(merged[0]).assertEqual(1);
        expect(merged[3]).assertEqual(4);


      }
      {
        const arr = new SparseArray<Item015>({ value: 1 }, { value: null }, { value: 3 });
        const result = arr.reduce((acc: Item015, curr: Item015, _i: int, _a: SparseArray<Item015>): Item015 => {
          return { value: nullToZero(acc.value) + nullToZero(curr.value) };
        });
        expect(result.value).assertEqual(4);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const weightedSum = arr.reduce((acc: int, curr: int, index: int, _a: SparseArray<int>): int => acc + curr * index);
        expect(weightedSum).assertEqual(21);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        const sum = arr.reduce((acc: int, curr: int, _index: int, array: SparseArray<int>): int => {
          expect(array === arr).assertTrue();
          return acc + curr;
        });
        expect(sum).assertEqual(6);


      }
      {
        const arr = new SparseArray<boolean>(true, true, false);
        const allTrue = arr.reduce((acc: boolean, curr: boolean, _i: int, _a: SparseArray<boolean>): boolean => acc && curr);
        expect(allTrue).assertFalse();


      }
      {
        const arr = new SparseArray<string>("x", "y", "z");
        const out = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(out).assertEqual("xyz");


      }
      {
        const arr = new SparseArray<int>(3, 1, 4, 2);
        const minVal = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => (curr < acc ? curr : acc));
        expect(minVal).assertEqual(1);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1600
     * @tc.name testTransformReduceNormal003
     * @tc.desc Test SparseArray.reduce method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<int>(5, -5);
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(0);


      }
      {
        const arr = new SparseArray<int>(-1, -2, -3);
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(-6);


      }
      {
        const arr = new SparseArray<int>(3, 1, 4, 2);
        const maxVal = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => (curr > acc ? curr : acc));
        expect(maxVal).assertEqual(4);


      }
      {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reduce((_acc: int, _curr: int, _i: int, _a: SparseArray<int>): int => {
            throw new CustomError019("Custom error message");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("CustomError019");
        }

      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const product = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
        expect(product).assertEqual(24);


      }
      {
        const arr = new SparseArray<int>(10, 20, 30, 40, 50);
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(150);


      }
      {
        const arr = new SparseArray<int>(2, 3, 4);
        const product = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
        expect(product).assertEqual(24);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        const combined = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * 10 + curr);
        expect(combined).assertEqual(123);


      }
      {
        const arr = new SparseArray<Item019>(
          { category: "A", value: 1 },
          { category: "B", value: 2 },
          { category: "A", value: 3 }
        );
        let aSum = 0;
        let bSum = 0;
        arr.reduce((acc: Item019, curr: Item019, index: int, _a: SparseArray<Item019>): Item019 => {
          if (index === 1) {
            const first = acc;
            aSum = first.category === "A" ? first.value : 0;
            bSum = first.category === "B" ? first.value : 0;
          }
          if (index >= 1) {
            if (curr.category === "A") {
              aSum += curr.value;
            } else {
              bSum += curr.value;
            }
          }
          return curr;
        });
        expect(aSum).assertEqual(4);
        expect(bSum).assertEqual(2);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.reduce((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
          if (index === 1) {
            const first = acc;
            return first * first - first + curr * curr - curr;
          }
          return acc + curr * curr - curr;
        });
        expect(result).assertEqual(40);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1700
     * @tc.name testTransformReduceNormal004
     * @tc.desc Test SparseArray.reduce method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<long>(10000000000 as long, 20000000000 as long, 30000000000 as long);
        const sum = arr.reduce((acc: long, curr: long, _i: int, _a: SparseArray<long>): long => (acc + curr) as long);
        expect(sum).assertEqual(60000000000 as long);

      }
      {
        const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
        const sum = arr.reduce((acc: short, curr: short, _i: int, _a: SparseArray<short>): short => (Short.toInt(acc) + Short.toInt(curr)).toShort());
        expect(sum).assertEqual(60 as short);

      }
      {
          const arr = new SparseArray<int | undefined>(1, undefined, 3, 4);
          const sum = arr.reduce((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
            if (curr === undefined) {
              return acc;
            }
            const base = acc === undefined ? 0 : acc;
            return base + curr;
          });
          expect(sum).assertEqual(8);

      }
      {
          const arr = new SparseArray<int | undefined>(undefined, 5, undefined, 7);
          const sum = arr.reduce((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
            if (curr === undefined) {
              return acc;
            }
            const base = acc === undefined ? 0 : acc;
            return base + curr;
          });
          expect(sum).assertEqual(12);

      }
      {
          const arr = new SparseArray<int>(0x2, 0b11);
          const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
          expect(sum).assertEqual(0x2 + 0b11);

      }
      {
        const arr = new SparseArray<int>(2, 3, 4);
        const indices: Array<int> = [];
        const sum = arr.reduce((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
          indices.push(index);
          return acc + curr;
        });
        expect(sum).assertEqual(9);
        expect(indices.length).assertEqual(2);
        expect(indices[0]).assertEqual(1);
        expect(indices[1]).assertEqual(2);

      }
      {
        const arr = new SparseArray<string>("pre-", "fix", "-end");
        const result = arr.reduce((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result).assertEqual("pre-fix-end");

      }
      {
        const arr = new SparseArray<boolean>(true, true, false);
        const result = arr.reduce((acc: boolean, curr: boolean, _i: int, _a: SparseArray<boolean>): boolean => acc && curr);
        expect(result).assertFalse();

      }
      {
        const arr = new SparseArray<char>(c'A', c'C', c'B');
        const result = arr.reduce((acc: char, curr: char, _i: int, _a: SparseArray<char>): char => {
          if (curr > acc) {
            return curr;
          }
          return acc;
        });
        expect(result).assertEqual(c'C');

      }
      {
        const arr = new SparseArray<int>(6);
        arr[1] = 10;
        arr[5] = 30;
        let callCount = 0;
        const sum = arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
          callCount++;
          return acc + curr;
        });
        expect(sum).assertEqual(40);
        expect(callCount).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1800
     * @tc.name testTransformReduceNormal005
     * @tc.desc Test SparseArray.reduce method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. reduce product of three 5s via prev times curr callback yields 125
        const arr1 = new SparseArray<int>(5, 5, 5);
        const fn1: (prev: int, curr: int, i: int, a: SparseArray<int>) => int = (prev: int, curr: int, i: int, a: SparseArray<int>): int => { return prev * curr; };
        const result1: int = arr1.reduce(fn1);
        expect(result1).assertEqual(125);
        // 2. reduce sum of 10 20 30 leaves final captured prev as 30
        let capturedPrev2: int = 0;
        const arr2 = new SparseArray<int>(10, 20, 30);
        arr2.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { capturedPrev2 = prev; return prev + curr; });
        expect(capturedPrev2).assertEqual(30);
        // 3. reduce sum of 5 10 15 passes accumulated prev 15 into second callback
        let secondPrev3: int = 0;
        let callCount3: int = 0;
        const arr3 = new SparseArray<int>(5, 10, 15);
        arr3.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { callCount3++; if (callCount3 === 2) { secondPrev3 = prev; } return prev + curr; });
        expect(secondPrev3).assertEqual(15);
        // 4. reduce sums int max 2147483647 with 0 keeping 2147483647
        const arr4 = new SparseArray<int>(2147483647, 0);
        const result4 = arr4.reduce((acc: int, curr: int): int => acc + curr);
        expect(result4).assertEqual(2147483647);
        // 5. reduce on of(7) single-element int array returns 7 without callback
        const arr5 = SparseArray.of<int>(7);
        const result5: int = arr5.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => prev + curr);
        expect(result5).assertEqual(7);
        // 6. reduce discards prev and returns curr on 1 2 99 yields last element 99
        const arr6 = new SparseArray<int>(1, 2, 99);
        const result6: int = arr6.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => curr);
        expect(result6).assertEqual(99);
        // 7. reduce aborts with Error when accumulated sum exceeds 20 leaving result -999
        const arr7 = new SparseArray<int>(5, 10, 15);
        let resultCaptured7: int = -999;
        try {
          resultCaptured7 = arr7.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { if (prev + curr > 20) { throw new Error('stop at 20'); } return prev + curr; });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(resultCaptured7).assertEqual(-999);
        }
        // 8. reduce with AND over all-true booleans returns true
        const arr8 = new SparseArray<boolean>(true, true, true);
        const result8 = arr8.reduce((acc: boolean, curr: boolean): boolean => acc && curr);
        expect(result8).assertTrue();
        // 9. reduce with OR over false false true booleans returns true
        const arr9 = new SparseArray<boolean>(false, false, true);
        const result9 = arr9.reduce((acc: boolean, curr: boolean): boolean => acc || curr);
        expect(result9).assertTrue();
        // 10. reduce with OR over two false booleans returns false
        const arr10 = new SparseArray<boolean>(false, false);
        const fn10: (prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>) => boolean = (prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>): boolean => { return prev || curr; };
        const result10: boolean = arr10.reduce(fn10);
        expect(result10).assertFalse();

      }
      {
        // 1. reduce on Chinese strings uses first element as initial prev
        let prevStr1: string = '';
        const arr1 = new SparseArray<string>('中文', '测试');
        arr1.reduce((prev: string, curr: string): string => { prevStr1 = prev; return prev + curr; });
        expect(prevStr1).assertEqual('中文');
        // 2. reduce on object array captures first object id 1 name first as prev
        let captured2: Obj02102 = { id: 0, name: '' } as Obj02102;
        const arr2 = new SparseArray<Obj02102>({ id: 1, name: 'first' } as Obj02102, { id: 2, name: 'second' } as Obj02102);
        arr2.reduce((prev: Obj02102, curr: Obj02102, i: int, a: SparseArray<Obj02102>): Obj02102 => { captured2 = prev; return curr; });
        expect(captured2.id).assertEqual(1);
        expect(captured2.name).assertEqual('first');
        // 3. reduce with doubles uses accumulated prev 1.5 for second callback on 0.0 1.5 2.5
        let prevDouble3: double = -1.0;
        const arr3 = new SparseArray<double>(0.0, 1.5, 2.5);
        arr3.reduce((prev: double, curr: double): double => { prevDouble3 = prev; return prev + curr; });
        expect(prevDouble3).assertEqual(1.5);
        // 4. reduce visits last element c as curr including empty string element
        let currStr4: string = 'x';
        const arr4 = new SparseArray<string>('a', '', 'c');
        arr4.reduce((prev: string, curr: string, i: int, a: SparseArray<string>): string => { currStr4 = curr; return prev + curr; });
        expect(currStr4).assertEqual('c');
        // 5. reduce with boolean AND visits final true as curr on true false true
        let currBool5: boolean = true;
        const arr5 = new SparseArray<boolean>(true, false, true);
        arr5.reduce((prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>): boolean => { currBool5 = curr; return prev && curr; });
        expect(currBool5).assertTrue();
        // 6. reduce on single element hello returns it unchanged without calling callback
        const arr6 = new SparseArray<string>('hello');
        const result6 = arr6.reduce((acc: string, curr: string): string => acc + curr);
        expect(result6).assertEqual('hello');
        // 7. reduce concatenates Chinese strings into combined result
        const arr7 = new SparseArray<string>('你好', '世界');
        const result7 = arr7.reduce((acc: string, curr: string): string => acc + curr);
        expect(result7).assertEqual('你好世界');
        // 8. reduce joins string elements a b and c with a dash separator to yield a-b-c
        const arr8 = new SparseArray<string>('a', 'b', 'c');
        const fn8: (prev: string, curr: string, i: int, a: SparseArray<string>) => string = (prev: string, curr: string, i: int, a: SparseArray<string>): string => { return prev + '-' + curr; };
        const result8: string = arr8.reduce(fn8);
        expect(result8).assertEqual('a-b-c');
        // 9. reduce keeps initial RegExp acc whose source is a
        const arr9 = new SparseArray<RegExp>(new RegExp('a'), new RegExp('b'));
        const result9 = arr9.reduce((acc: RegExp, curr: RegExp): RegExp => acc);
        expect(result9.source).assertEqual('a');
        // 10. reduce over two Date elements returns the identical second Date instance
        const firstDate10 = new Date(0);
        const secondDate10 = new Date(1000);
        const arr10 = new SparseArray<Date>(firstDate10, secondDate10);
        const fn10: (prev: Date, curr: Date, i: int, a: SparseArray<Date>) => Date = (prev: Date, curr: Date, i: int, a: SparseArray<Date>): Date => { return curr; };
        const result10: Date = arr10.reduce(fn10);
        let actualBoolean10: boolean = result10 === secondDate10;
        expect(actualBoolean10).assertTrue();

      }
      {
        // 1. reduce sums bigint elements 100n 200n and 300n to yield 600n
        const arr1 = new SparseArray<bigint>(100n, 200n, 300n);
        const fn1: (prev: bigint, curr: bigint, i: int, a: SparseArray<bigint>) => bigint = (prev: bigint, curr: bigint, i: int, a: SparseArray<bigint>): bigint => { return prev + curr; };
        const result1: bigint = arr1.reduce(fn1);
        expect(result1).assertEqual(600n);
        // 2. reduce sums long elements 1 2 and 3 to produce the long value 6
        const arr2 = new SparseArray<long>(1 as long, 2 as long, 3 as long);
        const fn2: (prev: long, curr: long, i: int, a: SparseArray<long>) => long = (prev: long, curr: long, i: int, a: SparseArray<long>): long => { return prev + curr; };
        const result2: long = arr2.reduce(fn2);
        let expectedLong2: long = 6 as long;
        expect(result2).assertEqual(expectedLong2);
        // 3. reduce summing double NaN with 1.0 and 3.0 yields NaN
        const arr3 = new SparseArray<double>(1.0, Double.NaN, 3.0);
        const result3 = arr3.reduce((acc: double, curr: double): double => acc + curr);
        let actualBoolean3: boolean = isNaN(result3);
        expect(actualBoolean3).assertTrue();
        // 4. reduce propagates TypeError thrown inside reducer callback
        const arr4 = new SparseArray<int>(10, 20, 30);
        try {
          arr4.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { throw new TypeError('type error in reducer'); });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        // 5. reduce propagates custom Error with message custom reduce error code 42
        const arr5 = new SparseArray<int>(1, 2, 3);
        try {
          arr5.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { throw new CustomReduceError01301('custom reduce error code 42', 42); });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.message).assertEqual('custom reduce error code 42');
        }
        // 6. reduce propagates SyntaxError thrown inside reducer callback
        const arr6 = new SparseArray<int>(5, 10, 15);
        try {
          arr6.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { throw new SyntaxError('syntax error in reducer'); });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SyntaxError');
        }
        // 7. reduce throws Error when boolean AND yields false leaving partialBool false
        const arr7 = new SparseArray<boolean>(true, true, false, true);
        let partialBool7: boolean = true;
        try {
          arr7.reduce((prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>): boolean => { partialBool7 = prev && curr; if (partialBool7 === false) { throw new Error('false detected'); } return partialBool7; });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(partialBool7).assertFalse();
        }
        // 8. reduce propagates RangeError thrown inside the reducer callback
        const arr8 = new SparseArray<int>(1, 2, 3);
        try {
          arr8.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { throw new RangeError('value out of range in reducer'); });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_1900
     * @tc.name testTransformReduceError001
     * @tc.desc Test SparseArray.reduce method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<int>();
        try {
          arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("TypeError");
        }


      }
      {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
            if (curr === 2) {
              throw new Error("Test error");
            }
            return acc + curr;
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }

      }
      {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reduce((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
            if (curr > 1) {
              throw new Error("Value too large");
            }
            return acc + curr;
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }

      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        let errorThrown = false;
        try {
          arr.reduce((_acc: int, _curr: int, _i: int, _a: SparseArray<int>): int => {
            throw new Error("Uncaught error");
          });
        } catch (error) {
          errorThrown = true;
          expect(error.name).assertEqual("Error");
        }
        expect(errorThrown).assertTrue();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2000
     * @tc.name testTransformReduceRightNormal001
     * @tc.desc Test SparseArray.reduceRight method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceRightNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        expect(reduceRightIntSum(arr)).assertEqual(6);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        const indices: Array<int> = [];
        const sum = arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
          indices.push(index);
          return acc + curr;
        });
        expect(sum).assertEqual(6);
        expect(indices.length).assertEqual(2);
        expect(indices[0]).assertEqual(1);
        expect(indices[1]).assertEqual(0);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(result).assertEqual(10);


      }
      {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result).assertEqual("cba");


      }
      {
        const arr = new SparseArray<string>("x", "y", "z");
        const out = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(out).assertEqual("zyx");


      }
      {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 2;
        arr[4] = 3;
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(6);


      }
      {
        const arr = new SparseArray<int>(-1, 2, -3, 4);
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(2);


      }
      {
        const arr = new SparseArray<boolean>(true, true, false);
        const allTrue = arr.reduceRight((acc: boolean, curr: boolean, _i: int, _a: SparseArray<boolean>): boolean => acc && curr);
        expect(allTrue).assertFalse();


      }
      {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reduceRight((_acc: int, _curr: int, _i: int, _a: SparseArray<int>): int => {
            throw new Error("callback error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }

      }
      {
        const arr = new SparseArray<int>(10, 1, 2, 3);
        const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(result).assertEqual(16);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2100
     * @tc.name testTransformReduceRightNormal002
     * @tc.desc Test SparseArray.reduceRight method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceRightNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<number>(1.5, 2.5, 3.5);
        const result = arr.reduceRight((acc: number, curr: number, _i: int, _a: SparseArray<number>): number => acc + curr);
        expect(result).assertEqual(7.5);


      }
      {
        const arr = new SparseArray<int>();
        arr.push(42);
        const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(result).assertEqual(42);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(result).assertEqual(15);


      }
      {
        const arr = new SparseArray<int>(10, 20, 30);
        expect(reduceRightIntSum(arr)).assertEqual(60);


      }
      {
        const arr = new SparseArray<int>(3, 1, 4, 2);
        const minVal = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => (curr < acc ? curr : acc));
        expect(minVal).assertEqual(1);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const indices: Array<int> = [];
        arr.reduceRight((acc: int, _curr: int, index: int, _a: SparseArray<int>): int => {
          indices.push(index);
          return acc;
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(2);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(0);


      }
      {
        const arr = new SparseArray<string>("a", "b", "c", "d");
        const result = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result).assertEqual("dcba");


      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(result).assertEqual(6);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const product = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
        expect(product).assertEqual(24);


      }
      {
        const arr = new SparseArray<string>("Hello", " ", "World");
        const result = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result).assertEqual("World Hello");


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2200
     * @tc.name testTransformReduceRightNormal003
     * @tc.desc Test SparseArray.reduceRight method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceRightNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<int>(1, 2, 3);
        const sum = arr.reduceRight((acc: int, curr: int, _index: int, array: SparseArray<int>): int => {
          expect(array === arr).assertTrue();
          return acc + curr;
        });
        expect(sum).assertEqual(6);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
          if (index === 0) {
            expect(acc).assertEqual(5);
          }
          return acc + curr;
        });
        expect(result).assertEqual(6);
        expect(arr.length).assertEqual(3);


      }
      {
        const arr = new SparseArray<int>(10, 20, 30);
        const values: Array<int> = [];
        arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
          values.push(curr);
          return acc;
        });
        expect(values.length).assertEqual(2);
        expect(values[0]).assertEqual(20);
        expect(values[1]).assertEqual(10);


      }
      {
        const arr = new SparseArray<int>(3, 1, 4, 2);
        const maxVal = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => (curr > acc ? curr : acc));
        expect(maxVal).assertEqual(4);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reduceRight((acc: int, _c: int, _i: int, array: SparseArray<int>): int => {
          expect(array.length).assertEqual(3);
          return acc;
        });
        expect(arr instanceof SparseArray).assertTrue();


      }
      {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 100; i++) {
          arr.push(i);
        }
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(4950);


      }
      {
        const arr = new SparseArray<int>(1, 0, 2, 0, 3);
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(6);


      }
      {
        const arr = new SparseArray<int>(1, -2, 3, -4, 5);
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(3);


      }
      {
        const arr = new SparseArray<int>(1000, 2000);
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
        expect(sum).assertEqual(3000);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3);
        const combined = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * 10 + curr);
        expect(combined).assertEqual(321);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2300
     * @tc.name testTransformReduceRightNormal004
     * @tc.desc Test SparseArray.reduceRight method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceRightNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.reduceRight((_acc: int, _curr: int, _i: int, _a: SparseArray<int>): int => {
            throw new CustomError004("Custom reduce error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("CustomError004");
        }

      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const weighted = arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => acc + curr * index);
        // 无初值时末元为 acc，自右向左累加 curr*index → 4+6+2+0=12
        expect(weighted).assertEqual(12);


      }
      {
        const arr = new SparseArray<int>(2, 3, 4);
        const product = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc * curr);
        expect(product).assertEqual(24);


      }
      {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 2;
        arr[4] = 3;
        const indices: Array<int> = [];
        arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
          indices.push(index);
          return acc;
        });
        expect(indices.length).assertEqual(2);
        expect(indices[0]).assertEqual(2);
        expect(indices[1]).assertEqual(0);


      }
      {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr) * 2;
        expect(result).assertEqual(20);


      }
      {
        const arr = new SparseArray<long>(10000000000 as long, 20000000000 as long, 30000000000 as long);
        const sum = arr.reduceRight((acc: long, curr: long, _i: int, _a: SparseArray<long>): long => (acc + curr) as long);
        expect(sum).assertEqual(60000000000 as long);

      }
      {
        const arr = new SparseArray<float>(2.0f, 3.0f, 4.0f);
        const product = arr.reduceRight((acc: float, curr: float, _i: int, _a: SparseArray<float>): float => acc * curr);
        expect(product).assertEqual(24.0f);

      }
      {
          const arr = new SparseArray<int | null>(1, null, 3, null, 5);
          const sum = arr.reduceRight((acc: int | null, curr: int | null, _i: int, _a: SparseArray<int | null>): int | null => {
            if (curr === null) {
              return acc;
            }
            const base = acc === null ? 0 : acc;
            return base + curr;
          });
          expect(sum).assertEqual(9);

      }
      {
          const arr = new SparseArray<int | undefined>(2, undefined, 4);
          const sum = arr.reduceRight((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
            if (curr === undefined) {
              return acc;
            }
            const base = acc === undefined ? 0 : acc;
            return base + curr;
          });
          expect(sum).assertEqual(6);

      }
      {
          const arr = new SparseArray<int | undefined>(4, undefined, 6);
          const sum = arr.reduceRight((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
            if (curr === undefined) {
              return acc;
            }
            const base = acc === undefined ? 0 : acc;
            return base + curr;
          });
          expect(sum).assertEqual(10);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2400
     * @tc.name testTransformReduceRightNormal005
     * @tc.desc Test SparseArray.reduceRight method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceRightNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int | null>(1, null, 4);
          const sum = arr.reduceRight((acc: int | null, curr: int | null, _i: int, _a: SparseArray<int | null>): int | null => {
            const v = curr === null ? 0 : curr;
            const base = acc === null ? 0 : acc;
            return base + v;
          });
          expect(sum).assertEqual(5);

      }
      {
          const arr = new SparseArray<int>(0x1, 0b10, 0o3);
          const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
          expect(sum).assertEqual(0x1 + 0b10 + 0o3);

      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
          expect(sum).assertEqual(60);

      }
      {
          const arr = new SparseArray<int | undefined>(undefined);
          const out = arr.reduceRight((acc: int | undefined, curr: int | undefined, _i: int, _a: SparseArray<int | undefined>): int | undefined => {
            return acc;
          });
          expect(out).assertEqual(undefined);

      }
      {
        const arr = new SparseArray<int>(2, 3, 4);
        const indices: Array<int> = [];
        const sum = arr.reduceRight((acc: int, curr: int, index: int, _a: SparseArray<int>): int => {
          indices.push(index);
          return acc + curr;
        });
        expect(sum).assertEqual(9);
        expect(indices.length).assertEqual(2);
        expect(indices[0]).assertEqual(1);
        expect(indices[1]).assertEqual(0);

      }
      {
        const arr = new SparseArray<string>("pre-", "fix", "-end");
        const result = arr.reduceRight((acc: string, curr: string, _i: int, _a: SparseArray<string>): string => acc + curr);
        expect(result).assertEqual("-endfixpre-");

      }
      {
        const arr = new SparseArray<boolean>(false, false, true);
        const result = arr.reduceRight((acc: boolean, curr: boolean, _i: int, _a: SparseArray<boolean>): boolean => acc || curr);
        expect(result).assertTrue();

      }
      {
        const arr = new SparseArray<char>(c'A', c'C', c'B');
        const result = arr.reduceRight((acc: char, curr: char, _i: int, _a: SparseArray<char>): char => {
          if (curr > acc) {
            return curr;
          }
          return acc;
        });
        expect(result).assertEqual(c'C');

      }
      {
        const arr = new SparseArray<int>(6);
        arr[1] = 10;
        arr[5] = 30;
        let callCount = 0;
        const sum = arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => {
          callCount++;
          return acc + curr;
        });
        expect(sum).assertEqual(40);
        expect(callCount).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2500
     * @tc.name testTransformReduceRightError001
     * @tc.desc Test SparseArray.reduceRight method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformReduceRightError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = new SparseArray<int>();
        try {
          arr.reduceRight((acc: int, curr: int, _i: int, _a: SparseArray<int>): int => acc + curr);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("TypeError");
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2600
     * @tc.name testTransformFlatNormal001
     * @tc.desc Test SparseArray.flat method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = makeNestedArr();
          const res = arr.flat();
          expect(res instanceof SparseArray).assertTrue();
          expect(res.toString()).assertEqual('1,3,5,44,55,66');


      }
      {
          const arr = makeNestedArr();
          const res = arr.flat(2);
          expect(res instanceof SparseArray).assertTrue();
          expect(res.toString()).assertEqual('1,3,5,44,55,66');


      }
      {
          const arr = makeNestedArr();
          const res0 = arr.flat(0);
          const res1 = arr.flat(1);
          const res2 = arr.flat(2);
          expect(arr.length).assertEqual(5);
          expect(res0.length).assertEqual(4);
          expect(res1.toString()).assertEqual('1,3,5,44,55,66');
          expect(res2.toString()).assertEqual('1,3,5,44,55,66');


      }
      {
          const arr = makeNestedArr();
          const res = arr.flat(2147483647);
          expect(res.toString()).assertEqual('1,3,5,44,55,66');


      }
      {
          const inner2 = new SparseArray<int>(7, 8, 9);
          const inner1 = new SparseArray<int | SparseArray<int>>();
          inner1.push(4);
          inner1.push(5);
          inner1.push(inner2);
          const arr = new SparseArray<int | SparseArray<int>>();
          arr.push(1);
          arr.push(2);
          arr.push(3);
          pushNestedElement(arr, inner1);
          const res1 = arr.flat(1);
          const res2 = arr.flat(2);
          expect(res1.length).assertLarger(3);
          expect(res2.toString()).assertEqual('1,2,3,4,5,7,8,9');


      }
      {
          const arr = new SparseArray<int | SparseArray<int>>(5);
          arr[1] = 1;
          const inner = new SparseArray<int>(44, 55, 66);
          arr[3] = inner;
          const res = arr.flat<int>(1);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(44);


      }
      {
          const arr = new SparseArray<int | SparseArray<int>>();
          const res = arr.flat(1);
          expect(res.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4, 5);
          const res = arr.flat(1);
          expect(res.toString()).assertEqual('1,2,3,4,5');


      }
      {
          const arr = makeNestedArr();
          const res = arr.flat(2);
          expect((typeof res[0] == 'int')).assertTrue();


      }
      {
          const arr = makeNestedArr();
          const before = arr.toString();
          const res = arr.flat(2);
          expect(arr.length).assertEqual(5);
          expect(arr.toString()).assertEqual(before);
          expect(res.toString()).assertEqual('1,3,5,44,55,66');


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2700
     * @tc.name testTransformFlatNormal002
     * @tc.desc Test SparseArray.flat method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const inner3 = new SparseArray<int>(7, 8, 9);
          const inner2 = new SparseArray<int | SparseArray<int>>();
          inner2.push(4);
          inner2.push(5);
          inner2.push(inner3);
          const inner1 = new SparseArray<int | SparseArray<int>>();
          inner1.push(2);
          inner1.push(3);
          pushNestedElement(inner1, inner2);
          const arr = new SparseArray<int | SparseArray<int>>();
          arr.push(1);
          pushNestedElement(arr, inner1);
          const res = arr.flat(10);
          expect(res.toString()).assertEqual('1,2,3,4,5,7,8,9');


      }
      {
          const inner = new SparseArray<int>(44, 55, 66);
          const arr = new SparseArray<double | SparseArray<int>>();
          arr.push(1.1, 2.2);
          arr.push(inner);
          const res = arr.flat<double>(1);
          expect(res.length).assertEqual(5);
          expect(res.$_get(0)).assertEqual(1.1);


      }
      {
          const arr = makeNestedArr();
          const res = arr.flat(-1);
          const res0 = arr.flat(0);
          expect(res instanceof SparseArray).assertTrue();
          expect(res.length).assertEqual(res0.length);
          expect(res.toString()).assertEqual(res0.toString());


      }
      {
          const inner = new SparseArray<string>('a', 'b', 'c');
          const arr = new SparseArray<double | SparseArray<string>>();
          arr.push(1, 2);
          arr.push(inner);
          const res = arr.flat<double | string>(1);
          expect((res.$_get(2) as string)).assertEqual('a');


      }
      {
          const inner = new SparseArray<int>();
          for (let i = 0; i < 100; i++) {
            inner.push(i);
          }
          const arr = new SparseArray<int | SparseArray<int>>();
          for (let i = 0; i < 10; i++) {
            arr.push(inner);
          }
          const res = arr.flat(1);
          expect(res.length).assertEqual(1000);


      }
      {
          const arr = new SparseArray<int | SparseArray<int>>();
          let current: SparseArray<int | SparseArray<int>> = new SparseArray<int | SparseArray<int>>();
          pushNestedElement(arr, current);
          for (let i = 0; i < 20; i++) {
            const next = new SparseArray<int | SparseArray<int>>();
            pushNestedElement(current, next);
            current = next;
          }
          const res = arr.flat(20);
          expect(res instanceof SparseArray).assertTrue();


      }
      {
          const inner = new SparseArray<float>(1.0f, 2.5f);
          const arr = new SparseArray<float | SparseArray<float>>();
          arr.push(inner as float | SparseArray<float>);
          const res = arr.flat(1);
          expect(res.length).assertEqual(2);
          expect((res[0] as float)).assertEqual(1.0f);
          expect((res[1] as float)).assertEqual(2.5f);

      }
      {
          const inner = new SparseArray<int>(1, 2);
          const arr = new SparseArray<int | SparseArray<int> | null>(inner, null, 9);
          const res = arr.flat<int | null>(1);
          expect(res.length).assertEqual(4);
          expect((res[0] as int)).assertEqual(1);
          expect((res[1] as int)).assertEqual(2);
          expect((res[2] as int | null)).assertEqual(null);
          expect((res[3] as int)).assertEqual(9);

      }
      {
          const emptyInner = new SparseArray<int>();
          const arr = new SparseArray<SparseArray<int>>();
          arr.push(emptyInner);
          const res = arr.flat(1);
          expect(res.length).assertEqual(0);

      }
      {
          const row0 = new SparseArray<int>(1, 2);
          const row1 = new SparseArray<int>(3, 4);
          const matrix = new SparseArray<SparseArray<int>>();
          matrix.push(row0);
          matrix.push(row1);
          const flat = matrix.flat(1);
          expect(flat.length).assertEqual(4);
          expect((flat[0] as int)).assertEqual(1);
          expect((flat[2] as int)).assertEqual(3);
          expect((flat[3] as int)).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2800
     * @tc.name testTransformFlatNormal003
     * @tc.desc Test SparseArray.flat method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const row = new SparseArray<int>(0xA, 0b101);
          const matrix = new SparseArray<SparseArray<int>>();
          matrix.push(row);
          const flat = matrix.flat(1);
          expect(flat.length).assertEqual(2);
          expect((flat[0] as int)).assertEqual(0xA);
          expect((flat[1] as int)).assertEqual(0b101);

      }
      {
          const row = new SparseArray<char>(c'A', c'B');
          const matrix = new SparseArray<SparseArray<char>>();
          matrix.push(row);
          const flat = matrix.flat<char>(1);
          expect(flat.length).assertEqual(2);
          expect(flat[0]).assertEqual(c'A');
          expect(flat[1]).assertEqual(c'B');

      }
      {
          const row = new SparseArray<boolean>(true, false);
          const matrix = new SparseArray<SparseArray<boolean>>();
          matrix.push(row);
          const flat = matrix.flat<SparseArray<boolean>>(0);
          const first = flat[0] as SparseArray<boolean>;
          expect(flat.length).assertEqual(1);
          expect(first[0]).assertEqual(true);
          expect(first[1]).assertEqual(false);

      }
      {
          const row = new SparseArray<string>(4);
          row[2] = "tail";
          const matrix = new SparseArray<SparseArray<string>>();
          matrix.push(row);
          const flat = matrix.flat<string>(1);
          expect(flat.length).assertEqual(1);
          expect(flat[0]).assertEqual("tail");

      }
      {
          const row = new SparseArray<int | undefined>(undefined, 5);
          const matrix = new SparseArray<SparseArray<int | undefined>>();
          matrix.push(row);
          const flat = matrix.flat<int | undefined>(1);
          expect(flat.length).assertEqual(1);
          expect(flat[0]).assertEqual(5);

      }
      {
        // 1. flat outer sparse@{0} -> length 1, result[0]=42
        const outer1 = new SparseArray<int>();
        outer1[0] = 42;
        const result1 = outer1.flat<int>();
        expect(result1.length).assertEqual(1);
        expect(result1[0]).assertEqual(42);
        // 2. flat outer(inner 10,20,30) -> length 3 [10,20,30]
        const inner2 = new SparseArray<int>(10, 20, 30);
        const outer2 = new SparseArray<SparseArray<int>>(inner2);
        const result2 = outer2.flat<int>();
        expect(result2.length).assertEqual(3);
        expect(result2[0]).assertEqual(10);
        expect(result2[1]).assertEqual(20);
        expect(result2[2]).assertEqual(30);
        // 3. flat pushed(1; 2,3; inner) -> length 6
        const inner3 = new SparseArray<int>(44, 55, 66);
        const outer3 = new SparseArray<int | SparseArray<int>>();
        outer3.push(1);
        outer3.push(2, 3);
        outer3.push(inner3);
        const result3 = outer3.flat();
        expect(result3.length).assertEqual(6);
        // 4. flat deep outer(inner(inner)) -> length 1, keeps innerInner ref
        const leaf4 = new SparseArray<int>(10, 20);
        const mid4 = new SparseArray<SparseArray<int>>(leaf4);
        const outer4 = new SparseArray<SparseArray<SparseArray<int>>>(mid4);
        const result4 = outer4.flat<SparseArray<int>>();
        expect(result4.length).assertEqual(1);
        expect(result4.at(0)! === leaf4).assertTrue();
        // 5. flat 3-level matrix outer(l1(l2(l3))) -> length 1, keeps leaf ref
        const leaf5 = new SparseArray<int>(1);
        const mid5 = new SparseArray<SparseArray<int>>(leaf5);
        const outer5 = new SparseArray<SparseArray<SparseArray<int>>>(mid5);
        const result5 = outer5.flat();
        expect(result5.length).assertEqual(1);
        expect(result5[0]! === leaf5).assertTrue();
        // 6. flat pushed(shallow; deep) -> length 3
        const shallow6 = new SparseArray<int>(5, 6);
        const deepInner6 = new SparseArray<int>(7);
        const deep6 = new SparseArray<SparseArray<int>>(deepInner6);
        const outer6 = new SparseArray<SparseArray<int> | SparseArray<SparseArray<int>>>(shallow6);
        outer6.push(deep6);
        const result6 = outer6.flat();
        expect(result6.length).assertEqual(3);
        // 7. flat outer(inner1, inner2, inner3) -> length 3
        const inA7 = new SparseArray<int>(1, 2);
        const inB7 = new SparseArray<int>();
        const inC7 = new SparseArray<int>();
        inC7[0] = 3;
        const outer7 = new SparseArray<SparseArray<int>>(inA7, inB7, inC7);
        const result7 = outer7.flat<int>();
        expect(result7.length).assertEqual(3);
        // 8. flat outer(3 sparse inners) -> [1,2,3]
        const inA8 = new SparseArray<int>();
        inA8[0] = 1;
        const inB8 = new SparseArray<int>();
        inB8[0] = 2;
        const inC8 = new SparseArray<int>();
        inC8[0] = 3;
        const outer8 = new SparseArray<SparseArray<int>>(inA8, inB8, inC8);
        const result8 = outer8.flat<int>();
        expect(result8[0]).assertEqual(1);
        expect(result8[1]).assertEqual(2);
        expect(result8[2]).assertEqual(3);
        // 9. flat outer(sparse inner {0:10,2:30}) -> length 2 [10,30]
        const inner9 = new SparseArray<int>(3);
        inner9[0] = 10;
        inner9[2] = 30;
        const outer9 = new SparseArray<SparseArray<int>>(inner9);
        const result9 = outer9.flat<int>();
        expect(result9.length).assertEqual(2);
        expect(result9[0]).assertEqual(10);
        expect(result9[1]).assertEqual(30);
        // 10. flat outer sparse@{2}=inner -> length 2 [1,2]
        const inner10 = new SparseArray<int>(1, 2);
        const outer10 = new SparseArray<SparseArray<int>>(3);
        outer10[2] = inner10;
        const result10 = outer10.flat<int>();
        expect(result10.length).assertEqual(2);
        expect(result10[0]).assertEqual(1);
        expect(result10[1]).assertEqual(2);

      }
      {
        // 1. flat string inner ('a','b') -> ['a','b']
        const inner1 = new SparseArray<string>('a', 'b');
        const outer1 = new SparseArray<SparseArray<string>>(inner1);
        const result1 = outer1.flat<string>();
        expect(result1[0]).assertEqual('a');
        expect(result1[1]).assertEqual('b');
        // 2. flat double NaN -> isNaN(result[0])
        const inner2 = new SparseArray<double>(Number.NaN);
        const outer2 = new SparseArray<SparseArray<double>>(inner2);
        const result2 = outer2.flat<double>();
        expect(isNaN(result2[0] as number)).assertTrue();
        // 3. flat double Infinity -> result[0]=Infinity
        const inner3 = new SparseArray<double>(Number.POSITIVE_INFINITY);
        const outer3 = new SparseArray<SparseArray<double>>(inner3);
        const result3 = outer3.flat<double>();
        expect(result3[0]).assertEqual(Number.POSITIVE_INFINITY);
        // 4. flat bigint (0n,100n) -> [0n,100n]
        const inner4 = new SparseArray<bigint>(0n, 100n);
        const outer4 = new SparseArray<SparseArray<bigint>>(inner4);
        const result4 = outer4.flat<bigint>();
        expect(result4[0]).assertEqual(0n);
        expect(result4[1]).assertEqual(100n);
        // 5. flat boolean (true,false,true) -> [true,false,...]
        const inner5 = new SparseArray<boolean>(true, false, true);
        const outer5 = new SparseArray<SparseArray<boolean>>(inner5);
        const result5 = outer5.flat<boolean>();
        expect(result5[0]).assertTrue();
        expect(result5[1]).assertFalse();
        // 6. flat double (-0.0, 0.0) -> sign-distinct
        const inner6 = new SparseArray<double>(-0.0, 0.0);
        const outer6 = new SparseArray<SparseArray<double>>(inner6);
        const result6 = outer6.flat<double>();
        expect(1.0 / result6[0]!).assertEqual(-Number.POSITIVE_INFINITY);
        expect(1.0 / result6[1]!).assertEqual(Number.POSITIVE_INFINITY);
        // 7. flat bigint MAX (9223372036854775807n)
        const inner7 = new SparseArray<bigint>(9223372036854775807n);
        const outer7 = new SparseArray<SparseArray<bigint>>(inner7);
        const result7 = outer7.flat<bigint>();
        expect(result7[0]).assertEqual(9223372036854775807n);
        // 8. flat string Unicode ('中文','😀')
        const inner8 = new SparseArray<string>('中文', '😀');
        const outer8 = new SparseArray<SparseArray<string>>(inner8);
        const result8 = outer8.flat<string>();
        expect(result8[0]).assertEqual('中文');
        expect(result8[1]).assertEqual('😀');
        // 9. flat string escapes ('\n','\t')
        const inner9 = new SparseArray<string>('\n', '\t');
        const outer9 = new SparseArray<SparseArray<string>>(inner9);
        const result9 = outer9.flat<string>();
        expect(result9[0]).assertEqual('\n');
        expect(result9[1]).assertEqual('\t');
        // 10. flat Date (d1, d2) -> identity preserved
        const dateA10 = new Date(0);
        const dateB10 = new Date(1000);
        const inner10 = new SparseArray<Date>(dateA10, dateB10);
        const outer10 = new SparseArray<SparseArray<Date>>(inner10);
        const result10 = outer10.flat<Date>();
        expect(result10[0] === dateA10).assertTrue();
        expect(result10[1] === dateB10).assertTrue();

      }
      {
        // 1. flat pushed(1; 3; inner; 7) -> [1,3,44,55,7]
        const inner1 = new SparseArray<int>(44, 55);
        const outer1 = new SparseArray<int | SparseArray<int>>();
        outer1.push(1);
        outer1.push(3);
        outer1.push(inner1);
        outer1.push(7);
        const result1 = outer1.flat<int>();
        expect(result1[0]).assertEqual(1);
        expect(result1[1]).assertEqual(3);
        expect(result1[2]).assertEqual(44);
        expect(result1[3]).assertEqual(55);
        expect(result1[4]).assertEqual(7);
        // 2. flat outer sparse@{0,4}=inners -> length 2 [1,2]
        const inA2 = new SparseArray<int>();
        inA2[0] = 1;
        const inB2 = new SparseArray<int>();
        inB2[0] = 2;
        const outer2 = new SparseArray<SparseArray<int>>(5);
        outer2[0] = inA2;
        outer2[4] = inB2;
        const result2 = outer2.flat<int>();
        expect(result2.length).assertEqual(2);
        expect(result2[0]).assertEqual(1);
        expect(result2[1]).assertEqual(2);
        // 3. flat pushed(innerStr; innerInt) -> length 4
        const innerStr3 = new SparseArray<string>('a', 'b');
        const innerInt3 = new SparseArray<int>(1, 2);
        let outer3: SparseArray<SparseArray<string> | SparseArray<int>> = new SparseArray<SparseArray<string> | SparseArray<int>>();
        outer3.push(innerStr3);
        outer3.push(innerInt3);
        const result3 = outer3.flat();
        expect(result3.length).assertEqual(4);
        // 4. flat iteration: outer(inner 0..99) -> length 100 [0..99]
        const inner4 = new SparseArray<int>();
        for (let i = 0; i < 100; i++) {
          inner4.push(i);
        }
        const outer4 = new SparseArray<SparseArray<int>>(inner4);
        const result4 = outer4.flat<int>();
        expect(result4.length).assertEqual(100);
        expect(result4[0]).assertEqual(0);
        expect(result4[99]).assertEqual(99);
        // 5. flat independence: result[0]=77 does not mutate inner
        const inner5 = new SparseArray<int>(5, 10);
        const outer5 = new SparseArray<SparseArray<int>>(inner5);
        const result5 = outer5.flat<int>();
        result5[0] = 77;
        expect(inner5[0]).assertEqual(5);
        // 6. flat independence: r1[0]=999 does not affect r2
        const inner6 = new SparseArray<int>(1, 2);
        const outer6 = new SparseArray<SparseArray<int>>(inner6);
        const r16 = outer6.flat<int>();
        const r26 = outer6.flat<int>();
        r16[0] = 999;
        expect(r26[0]).assertEqual(1);
        expect(r16.length).assertEqual(r26.length);
        // 7. flat snapshot: push after flat does not change result
        const inner7 = new SparseArray<int>();
        inner7[0] = 1;
        const outer7 = new SparseArray<SparseArray<int>>(inner7);
        const result7 = outer7.flat<int>();
        const added7 = new SparseArray<int>(2);
        outer7.push(added7);
        expect(result7.length).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_2900
     * @tc.name testTransformFlatError001
     * @tc.desc Test SparseArray.flat method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = makeNestedArr();
          try {
            arr.flat((Number.MIN_VALUE as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            arr.flat((null as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            arr.flat((undefined as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            arr.flat(('2' as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            arr.flat((1.5 as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            arr.flat(({} as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            const badDepth = ([1, 2] as Object as int);
            arr.flat(badDepth);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            arr.flat((Double.NaN as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            arr.flat((Double.POSITIVE_INFINITY as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = makeNestedArr();
          try {
            arr.flat((false as Object as int));
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_3000
     * @tc.name testTransformFlatMapNormal001
     * @tc.desc Test SparseArray.flatMap method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatMapNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.flatMap<int>((v) => v);
          expect(result.length).assertEqual(3);
          expect(result[0]).assertEqual(1);
          expect(result[1]).assertEqual(2);
          expect(result[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(4, 5, 3);
          const result = arr.flatMap<int>((v: int): int => v * 2);
          expect(result.length).assertEqual(3);
          expect(result[0]).assertEqual(8);
          expect(result[1]).assertEqual(10);
          expect(result[2]).assertEqual(6);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.flatMap<int>((v) => v * 2);
          expect(result instanceof SparseArray).assertTrue();
          expect(result![0]).assertEqual(2);
          expect(result![1]).assertEqual(4);
          expect(result![2]).assertEqual(6);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.flatMap<int>((v, k, _a) => v + k);
          expect(result![0]).assertEqual(1);
          expect(result![1]).assertEqual(3);
          expect(result![2]).assertEqual(5);


      }
      {
          let inner = new SparseArray<int>(44, 55, 66);
          let x = new SparseArray<int | SparseArray<int>>();
          x.push(1, 3, 5);
          x.push(inner);
          let res = x.flatMap<int | SparseArray<int>>((v) => v);
          expect(res instanceof SparseArray).assertTrue();
          expect(res!.length).assertEqual(4);
          expect(res![0]).assertEqual(1);
          expect(res![1]).assertEqual(3);
          expect(res![2]).assertEqual(5);
          const tail006 = res![3] as SparseArray<int>;
          expect(tail006 instanceof SparseArray).assertTrue();
          expect(tail006![0]).assertEqual(44);
          expect(tail006![1]).assertEqual(55);
          expect(tail006![2]).assertEqual(66);
          expect(tail006 === inner).assertTrue();


      }
      {
          const arr = new SparseArray<int>();
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.flatMap<int>((v) => v);
          expect(result instanceof SparseArray).assertTrue();
          expect(result!.length).assertEqual(0);


      }
      {
          const arr = new SparseArray<int | null>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.flatMap<int | null>((v) => null);
          expect(result!.length).assertEqual(3);
          expect(result![0]).assertNull();
          expect(result![1]).assertNull();
          expect(result![2]).assertNull();


      }
      {
          const arr = new SparseArray<int>(1, 2);
          const result = arr.flatMap<SparseArray<int>>((v) => new SparseArray<int>(v, v * 2));
          const row0 = result![0]!;
          expect(row0 instanceof SparseArray).assertTrue();
          expect(row0![0]).assertEqual(1);
          expect(row0![1]).assertEqual(2);
          const row1 = result![1]!;
          expect(row1 instanceof SparseArray).assertTrue();
          expect(row1![0]).assertEqual(2);
          expect(row1![1]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.flatMap<int>((_v, i, _a) => i);
          expect(result![2]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 5;
          const result = arr.flatMap<int>((v) => v * 2);
          expect(result!.length).assertEqual(1);
          expect(result![0]).assertEqual(10);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_3100
     * @tc.name testTransformFlatMapNormal002
     * @tc.desc Test SparseArray.flatMap method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatMapNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(2, 4, 4);
          const result = arr.flatMap<int>((v: int): int => v);
          expect(result[0]).assertEqual(2);
          expect(result[1]).assertEqual(4);
          expect(result[2]).assertEqual(4);

      }
      {
          const arr = new SparseArray<int | undefined>(3);
          expect(arr instanceof SparseArray).assertTrue();
                arr[0] = 1;
                arr[1] = undefined;
                arr[2] = 3;
          const result = arr.flatMap<int | undefined>((v) => v);
          expect(result!.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.flatMap<int>((v) => v * 2);
          expect(result !== arr).assertTrue();
          expect(arr[0]).assertEqual(1);

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.flatMap<string>((v) => v % 2 === 0 ? ("" + v) : v.toString());
          expect(result!.length).assertEqual(3);
          expect(result[0]).assertEqual("1");
          expect(result[1]).assertEqual("2");
          expect(result[2]).assertEqual("3");


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 2147483647;
          const result = arr.flatMap<int>((v) => v);
          expect(result![0]).assertEqual(2147483647);


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = -2147483648;
          const result = arr.flatMap<int>((v) => v);
          expect(result![0]).assertEqual(-2147483648);


      }
      {
          const arr = new SparseArray<int>(1000);
            for (let i = 0; i < 1000; i++) {
            arr[i] = i;
          }
          const result = arr.flatMap<int>((v) => v * 2);
          expect(result!.length).assertEqual(1000);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.flatMap<string>((v) => "" + v);
          expect(result.length).assertEqual(3);
          expect(result[0]).assertEqual("1");
          expect(result[1]).assertEqual("2");
          expect(result[2]).assertEqual("3");


      }
      {
          const arr = new SparseArray<int>(10);
          expect(arr instanceof SparseArray).assertTrue();
          arr[0] = 1;
          arr[3] = 4;
          const result = arr.flatMap<int>((v) => v * 2);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(2);
          expect(result[1]).assertEqual(8);


      }
      {
          const arr = new SparseArray<int | undefined>(10);
          expect(arr instanceof SparseArray).assertTrue();
          arr[0] = undefined;
          arr[2] = 2;
          const result = arr.flatMap<int | undefined>((v) => v);
          expect(result!.length).assertEqual(2);
          expect(result![0]).assertUndefined();
          expect(result![1]).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_3200
     * @tc.name testTransformFlatMapNormal003
     * @tc.desc Test SparseArray.flatMap method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatMapNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let inner = new SparseArray<int>(44, 55, 66);
          let x = new SparseArray<int | SparseArray<int>>();
          x.push(1, 3, 5);
          x.push(inner);
          let res = x.flatMap<int | SparseArray<int>>((v, index) => {
            if (index < 3) {
              return (v as int) + 10;
            }
            return v;
          });
          expect(res instanceof SparseArray).assertTrue();
          expect(res!.length).assertEqual(4);
          expect(res![0]).assertEqual(11);
          expect(res![1]).assertEqual(13);
          expect(res![2]).assertEqual(15);
          const tail045 = res![3] as SparseArray<int>;
          expect(tail045 instanceof SparseArray).assertTrue();
          expect(tail045![0]).assertEqual(44);
          expect(tail045![1]).assertEqual(55);
          expect(tail045![2]).assertEqual(66);


      }
      {
          const inner2 = new SparseArray<int>(1, 2);
          expect(inner2 instanceof SparseArray).assertTrue();
          const inner1 = new SparseArray<SparseArray<int>>(inner2);
          expect(inner1 instanceof SparseArray).assertTrue();
          const arr = new SparseArray<SparseArray<SparseArray<int>>>(inner1);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.flatMap<SparseArray<SparseArray<int>>>((v) => v);
          expect(result instanceof SparseArray).assertTrue();
          expect(result.length).assertEqual(1);
          const first = result[0] as SparseArray<SparseArray<int>>;
          expect(first instanceof SparseArray).assertTrue();
          const inner = first[0] as SparseArray<int>;
          expect(inner instanceof SparseArray).assertTrue();
          expect(inner[0]).assertEqual(1);
          expect(inner[1]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.flatMap<int>((v, _k, a) => v + a.length);
          expect(result![0]).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          expect(arr instanceof SparseArray).assertTrue();
          const result = arr.flatMap<string>((v) => v % 2 === 0 ? ("" + v) : ("odd:" + v));
          expect(result.length).assertEqual(3);
          expect(result[0]).assertEqual('odd:1');
          expect(result[1]).assertEqual('2');
          expect(result[2]).assertEqual('odd:3');


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const mapped = arr.flatMap<int>((v) => v * 2);
          const result = mapped.filter((v: int) => v > 2);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(4);
          expect(result[1]).assertEqual(6);


      }
      {
          const arr = new SparseArray<float>(1.0f, 2.0f, 3.0f);
          const result = arr.flatMap<float>((v: float): float => v * 2.0f);
          expect(result[0]).assertEqual(2.0f);
          expect(result[2]).assertEqual(6.0f);

      }
      {
          const arr = new SparseArray<int>(1, 2);
          const result = arr.flatMap<int | null>((v: int, k: int): int | null => {
            if (k === 1) {
              return null;
            }
            return v;
          });
          expect(result.length).assertEqual(2);
          expect(result[1]).assertEqual(null);

      }
      {
          const arr = new SparseArray<int>(0x1, 0x2);
          const result = arr.flatMap<int>((v: int, i: int): int => {
            if (i === 0x1) {
              return 0b10;
            }
            return v;
          });
          expect(result[1]).assertEqual(0b10);

      }
      {
          const arr = new SparseArray<boolean>(true, false);
          const result = arr.flatMap<string>((v: boolean): string => v ? "T" : "F");
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual("T");
          expect(result[1]).assertEqual("F");

      }
      {
          const arr = new SparseArray<char>(c'A', c'B');
          const result = arr.flatMap<char>((v: char): char => v);
          expect(result.length).assertEqual(2);
          expect(result[0]).assertEqual(c'A');
          expect(result[1]).assertEqual(c'B');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_3300
     * @tc.name testTransformFlatMapNormal004
     * @tc.desc Test SparseArray.flatMap method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatMapNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>(8);
          arr[6] = "tail";
          const result = arr.flatMap<string>((v: string, k: int): string => k.toString() + ":" + v);
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual("6:tail");

      }
      {
          const arr = new SparseArray<int>(4);
          arr[2] = 10;
          const result = arr.flatMap<int>((v: int, k: int, a: SparseArray<int>): int => v + k + a.length);
          expect(result.length).assertEqual(1);
          expect(result[0]).assertEqual(16);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TRANSFORM_3400
     * @tc.name testTransformFlatMapError001
     * @tc.desc Test SparseArray.flatMap method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransformFlatMapError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          try {
            const arr = new SparseArray<int>(1, 2, 3);
            arr.flatMap<int>((v): int => {
              throw new Error("Mapping error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("Error");
          }

      }
    });

  });
}
