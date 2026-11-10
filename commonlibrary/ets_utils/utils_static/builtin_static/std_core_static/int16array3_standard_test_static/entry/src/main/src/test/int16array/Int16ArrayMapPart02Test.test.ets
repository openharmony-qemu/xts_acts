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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function int16ArrayMapPart02Test(): void {
  describe('Int16ArrayMapPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0100
     * @tc.name int16ArrayMapPart02Test001
     * @tc.desc Merged batch (4 tests): callback exceptions and abort: index-1 Error on original and copied sources, out-of-range return then throw, Infinity then throw, and throws at indices 99/50 leave data unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map propagates a callback Error thrown at index 1 on original and copy-constructed arrays ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3);
        let sources: Int16Array[] = [base, new Int16Array(base)];
        for (let s: int = 0; s < sources.length; s++) {
          let arr: Int16Array = sources[s];
          try {
            arr.map((value: number, index: int, array: Int16Array): number => {
              if (index === 1) {
                throw new Error('second fails');
              }
              return value;
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        }
      }

      // --- [2] Verify an out-of-range callback return followed by a throw leaves the source Int16Array unmodified ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            if (index === 0) {
              return 32768;
            }
            if (index === 1) {
              throw new Error('overflow then error');
            }
            return value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr.$_get(1)).assertEqual(2);
        expect(arr.length).assertEqual(3);
      }

      // --- [3] Verify map callback returning Infinity then throwing propagates the error and preserves the array ---
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let infVal: number = 1.0 / 0.0;
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            if (index === 0) {
              return infVal;
            }
            throw new Error('after infinity');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr.join(',')).assertEqual('10,20');
      }

      // --- [4] Verify map() throwing at index 99 or 50 of a 100-element array propagates Error and leaves every element unchanged ---
      {
        let throwAt: int[] = [99, 50];
        for (let k: int = 0; k < throwAt.length; k++) {
          let arr: Int16Array = new Int16Array(100);
          for (let i: int = 0; i < 100; i++) {
            arr.$_set(i, i);
          }
          try {
            arr.map((value: number, index: int, _array: Int16Array): number => {
              if (index === throwAt[k]) {
                throw new Error('abort mid array');
              }
              return value;
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(throwAt[k])).assertEqual(throwAt[k]);
          expect(arr.$_get(99)).assertEqual(99);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0200
     * @tc.name int16ArrayMapPart02Test002
     * @tc.desc Merged batch (3 tests): iteration snapshot and mid-map mutation: $_set zeroing during the callback, a snapshot taken before later source mutation, and a sibling-view write observed by map.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback $_set zeros original array elements ---
      {
        let arr: Int16Array = new Int16Array([5, 10, 15]);
        arr.map((val: number, index: int, array: Int16Array) => {
          array.$_set(index, 0);
          return val;
        });
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
      }

      // --- [2] Verify map snapshot survives later mutation of source view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view: Int16Array = new Int16Array(buf, 0, 3);
        view.$_set(0, 1);
        view.$_set(1, 2);
        view.$_set(2, 3);
        let result: Int16Array = view.map((val: number, index: int, array: Int16Array) => val + 100);
        view.$_set(0, 999);
        expect(result.$_get(0)).assertEqual(101);
      }

      // --- [3] Verify a write through a sibling view during iteration is observed by map ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        view1.$_set(0, 1);
        view1.$_set(1, 2);
        view1.$_set(2, 3);
        let view2: Int16Array = new Int16Array(buf, 0, 3);
        let result: Int16Array = view1.map((val: number, index: int, array: Int16Array) => {
          if (index === 0) {
            view2.$_set(1, 999);
          }
          return val;
        });
        expect(result.$_get(1)).assertEqual(999);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0300
     * @tc.name int16ArrayMapPart02Test003
     * @tc.desc Merged batch (4 tests): result buffer independence: subarray result buffers, an empty view, sibling results, and parent isolation when the mapped result is mutated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify subarray map result buffer independent of parent buffer ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
        let sub: Int16Array = arr.subarray(1, 4);
        let result: Int16Array = sub.map((val: number, index: int, array: Int16Array) => val + 1);
        let r_1: boolean = result.buffer === arr.buffer;
        expect(r_1).assertFalse();
        expect(result.length).assertEqual(3);
      }

      // --- [2] Verify map on zero-length ArrayBuffer view yields empty independent buffer ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let view: Int16Array = new Int16Array(buf, 0, 0);
        let result: Int16Array = view.map((val: number, index: int, array: Int16Array) => val + 1);
        expect(result.length).assertEqual(0);

        let r_2: boolean = result.buffer === buf;
        expect(r_2).assertFalse();
      }

      // --- [3] Verify mutating one map result does not affect sibling map result ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let v1: Int16Array = new Int16Array(buf, 0, 2);
        v1.$_set(0, 1);
        v1.$_set(1, 2);
        let v2: Int16Array = new Int16Array(buf, 0, 2);
        let r1: Int16Array = v1.map((val: number, index: int, array: Int16Array) => val + 5);
        let r2: Int16Array = v2.map((val: number, index: int, array: Int16Array) => val * 3);
        r1.$_set(0, 999);
        expect(r2.$_get(0)).assertEqual(3);
      }

      // --- [4] Verify mutating subarray map result does not affect parent array ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let sub: Int16Array = arr.subarray(0, 3);
        let result: Int16Array = sub.map((val: number, index: int, array: Int16Array) => val * 10);
        result.$_set(0, 999);
        expect(arr.$_get(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0400
     * @tc.name int16ArrayMapPart02Test004
     * @tc.desc Merged batch (5 tests): int16 wrap and truncation: out-of-range callback returns, -100000, hex-source plus one at MAX, scale-by-4000 overflow, and safe-integer extremes mapping to -1 and 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a callback result beyond the int16 range wraps to its 16-bit two's-complement value ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => 100000);
        let win: Int16Array = result.subarray(0, 1);
        expect(win.$_get(0)).assertEqual(-31072);
      }

      // --- [2] Verify map callback returning -100000 wraps into the int16 range ---
      {
        let arr: Int16Array = Int16Array.of(1);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => -100000);
        let seen: number[] = [];
        for (const x of result) {
          seen.push(x);
        }
        expect(seen.length).assertEqual(1);
        expect(seen[0]).assertEqual(31072);
      }

      // --- [3] Verify map adds one to each element of a hex-literal source and wraps the int16 MAX element ---
      {
        let arr: Int16Array = new Int16Array([0x7fff, -0x8000]);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value + 1);
        expect(result.$_get(0)).assertEqual(-32768);
        expect(result.$_get(1)).assertEqual(-32767);
      }

      // --- [4] Verify map scales each element by 4000 and wraps the overflowing products into int16 ---
      {
        let arr: Int16Array = Int16Array.of(8, 12, 16);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => value * 4000);
        expect(result.$_get(0)).assertEqual(32000);
        expect(result.$_get(1)).assertEqual(-17536);
        expect(result.$_get(2)).assertEqual(-1536);
      }

      // --- [5] Verify map of Number.MAX_SAFE_INTEGER wraps to -1 at index 0 and Number.MIN_SAFE_INTEGER wraps to 1 ---
      {
        let base: Int16Array = Int16Array.of(1, -1);
        let wrapped: Int16Array = base.map((value: number): number => value * Number.MAX_SAFE_INTEGER);
        expect(wrapped.indexOf(-1)).assertEqual(0);
        expect(wrapped.$_get(1)).assertEqual(1);
        expect(wrapped.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0500
     * @tc.name int16ArrayMapPart02Test005
     * @tc.desc Merged batch (4 tests): int16 wrap and truncation: multiples of 65536 becoming zero, chained maps ending in NaN, value+65536 with a distinct buffer, and products by 32769 and -32770 wrapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback values that are multiples of 65536 convert to 0 ---
      {
        let arrA: Int16Array = Int16Array.of(1, 2, 3);
        let resultA: Int16Array = arrA.map((value: number, index: int, array: Int16Array): number => value * 65536);
        expect(resultA.$_get(0)).assertEqual(0);
        expect(resultA.$_get(1)).assertEqual(0);
        expect(resultA.$_get(2)).assertEqual(0);

        let arrB: Int16Array = Int16Array.of(0, 0, 0);
        let resultB: Int16Array = arrB.map((value: number, index: int, array: Int16Array): number => value + 65536);
        expect(resultB.$_get(0)).assertEqual(0);
        expect(resultB.$_get(1)).assertEqual(0);
        expect(resultB.$_get(2)).assertEqual(0);

        let arrC: Int16Array = Int16Array.of(0, 0);
        let resultC: Int16Array = arrC.map((value: number, index: int, array: Int16Array): number => value - 65536);
        expect(resultC.$_get(0)).assertEqual(0);
        expect(resultC.$_get(1)).assertEqual(0);

        let arrD: Int16Array = Int16Array.of(1, 2);
        let resultD: Int16Array = arrD.map((value: number, index: int, array: Int16Array): number => value * 131072);
        expect(resultD.$_get(0)).assertEqual(0);
        expect(resultD.$_get(1)).assertEqual(0);
      }

      // --- [2] Verify chained map calls compose and a final NaN result yields all-zero elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let nanVal: number = 0.0 / 0.0;
        let step1: Int16Array = arr.map((value: number): number => value + 1);
        let step2: Int16Array = step1.map((value: number): number => value + 32768);
        let step3: Int16Array = step2.map((value: number): number => nanVal);
        expect(step3.$_get(0)).assertEqual(0);
        expect(step3.$_get(1)).assertEqual(0);
        expect(step3.$_get(2)).assertEqual(0);
      }

      // --- [3] Verify map value+65536 returns a result with a buffer distinct from the source ---
      {
        let arr: Int16Array = Int16Array.of(100, 200);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value + 65536);
        let r_1: boolean = result.buffer !== arr.buffer;
        expect(r_1).assertTrue();
      }

      // --- [4] Verify map callback value*32769 wraps the products to -32767, 2 and -32765 and a following value*(-32770) pass wraps them to 32766, -4 and 32762 ---
      {
        let source: Int16Array = Int16Array.of(1, 2, 3);
        let up: Int16Array = source.map((value: number): number => value * 32769);
        expect(up.$_get(0)).assertEqual(-32767);
        expect(up.$_get(1)).assertEqual(2);
        expect(up.$_get(2)).assertEqual(-32765);
        let down: Int16Array = up.map((value: number): number => value * -32770);
        expect(down.$_get(0)).assertEqual(32766);
        expect(down.$_get(1)).assertEqual(-4);
        expect(down.$_get(2)).assertEqual(32762);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0600
     * @tc.name int16ArrayMapPart02Test006
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: prefix-subarray length, from(Map.values()) and from(Map.keys()) sources, an entries total mapped into every slot, and floor-halving over Map values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback reading array.subarray(0,index+1).length maps each element to index+1 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.subarray(0, index + 1).length);
        expect(result.$_get(0)).assertEqual(1);
        expect(result.$_get(1)).assertEqual(2);
        expect(result.$_get(2)).assertEqual(3);
      }

      // --- [2] Verify map adding 1 to each element of an array built by from(Map.values()) ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 11);
        m.set('b', 22);
        m.set('c', 33);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        let exp: int[] = [12, 23, 34];
        for (let i: int = 0; i < exp.length; i++) {
          expect(result.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [3] Verify map multiplying each key of an array built by from(Map.keys()) by 10 ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(2, 'a');
        m.set(4, 'b');
        m.set(6, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 10);
        expect(result.join('-')).assertEqual('20-40-60');
      }

      // --- [4] Verify a callback that sums the entries of the array maps every element to the same total ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => {
          let total: number = 0;
          for (const e of a2.entries()) {
            total = total + e[1];
          }
          return total;
        });
        let exp: int[] = [6, 6, 6];
        for (let i: int = 0; i < exp.length; i++) {
          expect(result.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [5] Verify map over from(Map.values()) with a Math.floor-halving callback ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 7);
        m.set('b', 8);
        m.set('c', 9);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => Math.floor(v / 2));
        expect(result.join(',')).assertEqual('3,4,4');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0700
     * @tc.name int16ArrayMapPart02Test007
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: findLast below a bound, lastIndexOf of a doubled element, reduceRight total, toString comparison and byteLength of the mapped result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify findLast(value<7) on the map result doubling returns the last element below the bound ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value * 2);
        expect(result.findLast((value: number): boolean => value < 7)).assertEqual(6);
      }

      // --- [2] Verify lastIndexOf of the doubled element on the map result returns its index ---
      {
        let result: Int16Array = Int16Array.of(3, 1, 2).map((value: number): number => value * 2);
        expect(result.lastIndexOf(4)).assertEqual(2);
      }

      // --- [3] Verify reduceRight summing the map result tripling yields the total ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value * 3);
        expect(result.reduceRight((acc: number, value: number): number => acc + value, 0)).assertEqual(18);
      }

      // --- [4] Verify toString of the map result adding 1 equals the joined mapped string ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value + 1);
        expect(result.toString()).assertEqual('2,3,4');
      }

      // --- [5] Verify the map result of an array built by from(Map.values()) keeps byteLength equal to twice the length ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 2);
        m.set('b', 4);
        m.set('c', 6);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        expect(result.byteLength).assertEqual(6);
        expect(result.join(',')).assertEqual('4,8,12');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0800
     * @tc.name int16ArrayMapPart02Test008
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: findLastIndex, round-halving over Map values, a Map rebuilt from mapped entries, a triple-nested map, and independent intermediate buffers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify findLastIndex on a map result over from(Map.values()) finds the last mapped value ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        m.set('d', 4);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        expect(result.findLastIndex((v: number, i: int, a2: Int16Array): boolean => v === 4)).assertEqual(2);
      }

      // --- [2] Verify map over from(Map.values()) with a Math.round-halving callback ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 3);
        m.set('c', 5);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => Math.round(v / 2));
        expect(result.join(',')).assertEqual('1,2,3');
      }

      // --- [3] Verify a Map built from the entries of a map result over from(another Int16Array) maps each index ---
      {
        let base: Int16Array = Int16Array.of(6, 7);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        let mp: Map<int, number> = new Map<int, number>();
        for (const e of result.entries()) {
          mp.set(e[0], e[1]);
        }
        expect(mp.get(0)).assertEqual(12);
      }

      // --- [4] Verify triple nested map chain produces expected values ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val + 1)
          .map((val: number, index: int, array: Int16Array) => val * 2)
          .map((val: number, index: int, array: Int16Array) => val - 3);
        expect(result.$_get(0)).assertEqual(1);
        expect(result.$_get(1)).assertEqual(3);
        expect(result.$_get(2)).assertEqual(5);
      }

      // --- [5] Verify intermediate map chain buffers are independent ---
      {
        let arr: Int16Array = new Int16Array([1, 2]);
        let r1: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val + 1);
        let r2: Int16Array = r1.map((val: number, index: int, array: Int16Array) => val * 2);
        let r_1: boolean = r1.buffer === r2.buffer;
        expect(r_1).assertFalse();

        let r_2: boolean = r1.buffer === arr.buffer;
        expect(r_2).assertFalse();

        let r_3: boolean = r2.buffer === arr.buffer;
        expect(r_3).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_0900
     * @tc.name int16ArrayMapPart02Test009
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: a double map summing over Map keys, an entries count copied into every slot, contiguous result keys, lastIndexOf over Map keys, and squaring then join.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a chained map then map over from(Map.keys()) sums to the doubly mapped total ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(1, 'a');
        m.set(2, 'b');
        m.set(3, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1).map((v: number, i: int, a2: Int16Array): number => v * 2);
        expect(result.reduce((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(18);
      }

      // --- [2] Verify a callback that counts the array entries maps every element to that count ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6, 7);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => {
          let cnt: number = 0;
          for (const e of a2.entries()) {
            cnt = cnt + 1;
          }
          return cnt;
        });
        expect(result.join(',')).assertEqual('4,4,4,4');
      }

      // --- [3] Verify the keys() of a map result over from(Map.values()) give the contiguous indexes ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        let keys: int[] = [];
        for (const k of result.keys()) {
          keys.push(k);
        }
        expect(keys.length).assertEqual(3);
        expect(result.join(',')).assertEqual('2,3,4');
      }

      // --- [4] Verify lastIndexOf of a doubled element in a map result over from(Map.keys()) ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(3, 'a');
        m.set(4, 'b');
        m.set(5, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        expect(result.lastIndexOf(6)).assertEqual(0);
      }

      // --- [5] Verify map squaring on an array built by from(Map.values()) then join ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 2);
        m.set('b', 3);
        m.set('c', 4);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * v);
        expect(result.join(',')).assertEqual('4,9,16');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1000
     * @tc.name int16ArrayMapPart02Test010
     * @tc.desc Merged batch (5 tests): callback arguments and external state: recorded last index, writes into an external Int16Array and number array, reads of prior external state, and a full index log.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback records last index as length-1 ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let lastIdx: number = -1;
        arr.map((val: number, index: int, array: Int16Array) => {
          lastIdx = index;
          return val;
        });
        expect(lastIdx).assertEqual(3);
      }

      // --- [2] Verify map callback writes into external Int16Array ---
      {
        let src: Int16Array = new Int16Array([1, 2, 3]);
        let external: Int16Array = new Int16Array([0, 0, 0]);
        src.map((val: number, index: int, array: Int16Array) => {
          external.$_set(index, val * 10);
          return val;
        });
        expect(external.$_get(0)).assertEqual(10);
        expect(external.$_get(1)).assertEqual(20);
        expect(external.$_get(2)).assertEqual(30);
      }

      // --- [3] Verify map callback writes into external number array ---
      {
        let src: Int16Array = new Int16Array([1, 2, 3]);
        let external: number[] = [0, 0, 0];
        src.map((val: number, index: int, array: Int16Array) => {
          external[index] = val * 100;
          return val;
        });
        expect(external[0]).assertEqual(100);
        expect(external[2]).assertEqual(300);
      }

      // --- [4] Verify map callback reads previous external state ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let prev: number = 0;
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => {
          let r: number = val + prev;
          prev = val;
          return r;
        });
        expect(result.$_get(0)).assertEqual(1);
        expect(result.$_get(1)).assertEqual(3);
        expect(result.$_get(2)).assertEqual(5);
      }

      // --- [5] Verify map callback records every index into external log ---
      {
        let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
        let idxLog: number[] = [-1, -1, -1, -1];
        arr.map((val: number, index: int, array: Int16Array) => {
          idxLog[index] = index;
          return val;
        });
        expect(idxLog[0]).assertEqual(0);
        expect(idxLog[1]).assertEqual(1);
        expect(idxLog[2]).assertEqual(2);
        expect(idxLog[3]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1100
     * @tc.name int16ArrayMapPart02Test011
     * @tc.desc Merged batch (5 tests): element mapping: add one across inputs, negation with a three-argument callback, identity, index-valued results and a no-argument constant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map adds 1 to each element for different inputs ---
      {
        let inputArr: number[][] = [[1, 2, 3], [10, 20, 30], [0, 0, 0]];
        for (let i: int = 0; i < inputArr.length; i++) {
          let arr: Int16Array = Int16Array.of(inputArr[i][0], inputArr[i][1], inputArr[i][2]);
          let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => value + 1);
          for (let j: int = 0; j < result.length; j++) {
            expect(result.$_get(j)).assertEqual(inputArr[i][j] + 1);
          }
        }
      }

      // --- [2] Verify map negates each element with a 3-argument callback ---
      {
        let arr: Int16Array = Int16Array.of(1, -2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => -value);
        expect(result.$_get(0)).assertEqual(-1);
        expect(result.$_get(1)).assertEqual(2);
        expect(result.$_get(2)).assertEqual(-3);
      }

      // --- [3] Verify map identity preserves elements ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        let result: Int16Array = arr.map((value: number) => value);
        expect(result.$_get(0)).assertEqual(5);
        expect(result.$_get(1)).assertEqual(6);
        expect(result.$_get(2)).assertEqual(7);
      }

      // --- [4] Verify map callback returns sequential index ---
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        let result: Int16Array = arr.map((value: number, index: int) => index);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(1);
        expect(result.$_get(2)).assertEqual(2);
      }

      // --- [5] Verify map no-arg callback constant 99 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map(() => 99);
        expect(result.$_get(0)).assertEqual(99);
        expect(result.$_get(1)).assertEqual(99);
        expect(result.$_get(2)).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1200
     * @tc.name int16ArrayMapPart02Test012
     * @tc.desc Merged batch (5 tests): element mapping: absolute values, ternary filtering above one, mixed multiply-add, mapping to the first element and mapping to length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map absolute value mapping ---
      {
        let arr: Int16Array = Int16Array.of(-5, -3, 0, 3, 5);
        let result: Int16Array = arr.map((value: number) => {
          if (value < 0) {
            return -value;
          }
          return value;
        });
        expect(result.$_get(0)).assertEqual(5);
        expect(result.$_get(1)).assertEqual(3);
        expect(result.$_get(2)).assertEqual(0);
        expect(result.$_get(3)).assertEqual(3);
        expect(result.$_get(4)).assertEqual(5);
      }

      // --- [2] Verify map ternary keeps values greater than 1 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int) => (value > 1) ? value : 0.0);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(2);
        expect(result.$_get(2)).assertEqual(3);
      }

      // --- [3] Verify map callback mixed mul add expression ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int) => value * 3 + 1);
        expect(result.$_get(0)).assertEqual(4);
        expect(result.$_get(1)).assertEqual(7);
        expect(result.$_get(2)).assertEqual(10);
      }

      // --- [4] Verify map callback maps all to first element ---
      {
        let arr: Int16Array = Int16Array.of(42, 10, 30);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => array.$_get(0));
        expect(result.$_get(0)).assertEqual(42);
        expect(result.$_get(1)).assertEqual(42);
        expect(result.$_get(2)).assertEqual(42);
      }

      // --- [5] Verify map callback reading array.length maps each element to the array length ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.length);
        expect(result.$_get(0)).assertEqual(3);
        expect(result.$_get(1)).assertEqual(3);
        expect(result.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1300
     * @tc.name int16ArrayMapPart02Test013
     * @tc.desc Merged batch (5 tests): element mapping: metadata on a large filled array, matching byteLength, distinct buffers, constant results over zeros and negative inputs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map over large filled array keeps result metadata and elements ---
      {
        let arr: Int16Array = new Int16Array(100);
        for (let i: int = 0; i < 100; i++) {
          arr.$_set(i, 1);
        }
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value + 32768);
        expect(result.length).assertEqual(100);
        expect(result.$_get(0)).assertEqual(-32767);
        expect(result.$_get(50)).assertEqual(-32767);
        expect(result.$_get(99)).assertEqual(-32767);

        let arrBig: Int16Array = new Int16Array(100);
        for (let i: int = 0; i < 100; i++) {
          arrBig.$_set(i, i + 1);
        }
        expect(arrBig.$_get(0)).assertEqual(1);
        expect(arrBig.$_get(50)).assertEqual(51);
        expect(arrBig.$_get(99)).assertEqual(100);
      }

      // --- [2] Verify the mapped result keeps a byteLength equal to the source ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value + 65536);
        expect(result.byteLength).assertEqual(arr.byteLength);

        let arrA: Int16Array = Int16Array.of(3, 6, 9);
        let nanVal: number = 0.0 / 0.0;
        let resultA: Int16Array = arrA.map((value: number, index: int, array: Int16Array): number => nanVal);
        expect(resultA.byteLength).assertEqual(arrA.byteLength);
      }

      // --- [3] Verify map result buffer differs from original buffer ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val);
        let r_1: boolean = result.buffer === arr.buffer;
        expect(r_1).assertFalse();
      }

      // --- [4] Verify map all-zero array yields callback constant values ---
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => 1);
        expect(result.$_get(0)).assertEqual(1);
        expect(result.$_get(1)).assertEqual(1);
        expect(result.$_get(2)).assertEqual(1);
      }

      // --- [5] Verify map negative values map correctly ---
      {
        let arr: Int16Array = new Int16Array([-5, 0, 5]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val * 2);
        expect(result.$_get(0)).assertEqual(-10);
        expect(result.$_get(1)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1400
     * @tc.name int16ArrayMapPart02Test014
     * @tc.desc Single test: map over a Set-built array propagates the TypeError raised by its callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map on an array built by from(Set) propagates a TypeError thrown by the callback ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        let arr: Int16Array = Int16Array.from(s);
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            throw new TypeError('set element type error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1500
     * @tc.name int16ArrayMapPart02Test015
     * @tc.desc Merged batch (5 tests): result buffer independence: a with(0,100) callback reading, from(copy) sources remaining unmutated, distinct buffers, matching lengths and an empty source's new buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback reading array.with(0,100) maps each element while the source stays unmutated ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.with(0, 100).$_get(index));
        expect(result.$_get(0)).assertEqual(100);
        expect(result.$_get(1)).assertEqual(8);
        expect(result.$_get(2)).assertEqual(9);
        expect(arr.$_get(0)).assertEqual(7);
      }

      // --- [2] Verify map doubling each element of an array built by from(another Int16Array) leaves the base array unmutated ---
      {
        let base: Int16Array = Int16Array.of(2, 4, 6);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        expect(result.join(',')).assertEqual('4,8,12');
        expect(base.join(',')).assertEqual('2,4,6');
      }

      // --- [3] Verify the map result of an array built by from(another Int16Array) owns a distinct buffer ---
      {
        let base: Int16Array = Int16Array.of(5, 6, 7);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v - 1);
        let shared: boolean = result.buffer === arr.buffer;
        expect(shared).assertFalse();
        expect(result.$_get(0)).assertEqual(4);
      }

      // --- [4] Verify the map result of an array built by from(another Int16Array) has an independent buffer and matching length ---
      {
        let base: Int16Array = Int16Array.of(7, 8, 9);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v);
        let sameInstance: boolean = result === arr;
        expect(sameInstance).assertFalse();
        let sameBuffer: boolean = result.buffer === arr.buffer;
        expect(sameBuffer).assertFalse();
        expect(result.length).assertEqual(3);
        expect(result.$_get(0)).assertEqual(7);
        expect(result.$_get(1)).assertEqual(8);
        expect(result.$_get(2)).assertEqual(9);
      }

      // --- [5] Verify map on empty Int16Array returns a result with a different buffer ---
      {
        let arr: Int16Array = new Int16Array(0);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value);
        let r_1: boolean = result.buffer !== arr.buffer;
        expect(r_1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1600
     * @tc.name int16ArrayMapPart02Test016
     * @tc.desc Merged batch (2 tests): result buffer independence: a subarray result buffer and a from(copy) result unaffected by later base-array mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map result subarray buffer independent of original buffer ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val + 1);
        let sub: Int16Array = result.subarray(0, 2);
        sub.$_set(0, 999);
        expect(arr.$_get(0)).assertEqual(1);

        let r_2: boolean = result.buffer === arr.buffer;
        expect(r_2).assertFalse();
      }

      // --- [2] Verify the map result over from(another Int16Array) is unaffected by mutating the base array afterwards ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        base.$_set(0, 99);
        expect(result.join(',')).assertEqual('2,4,6');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1700
     * @tc.name int16ArrayMapPart02Test017
     * @tc.desc Merged batch (4 tests): int16 wrap and truncation: -32767 in range, constant 40000 wrapping to -25536, NaN/Infinity to zero and truncation of derived fractions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback -32767 stays in int16 range ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => -32767);
        expect(result.lastIndexOf(-32767)).assertEqual(1);
      }

      // --- [2] Verify map callback constant 40000 wraps to the int16 two's-complement value -25536 ---
      {
        let src: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = src.map((val: number, index: int, array: Int16Array): number => {
          return 40000;
        });
        expect(result.$_get(0)).assertEqual(-25536);
        expect(result.$_get(1)).assertEqual(-25536);
        expect(result.$_get(2)).assertEqual(-25536);
      }

      // --- [3] Verify map fn NaN, Infinity and -Infinity each convert element to 0 ---
      {
        let src: Int16Array = Int16Array.of(10);
        let result: Int16Array = src.map((val: number, index: int, array: Int16Array): number => {
          return 0.0 / 0.0;
        });
        expect(result.$_get(0)).assertEqual(0);

        let src2: Int16Array = Int16Array.of(10);
        let result2: Int16Array = src2.map((val: number, index: int, array: Int16Array): number => {
          return 1.0 / 0.0;
        });
        expect(result2.$_get(0)).assertEqual(0);

        let src3: Int16Array = Int16Array.of(10);
        let result3: Int16Array = src3.map((val: number, index: int, array: Int16Array): number => {
          return -1.0 / 0.0;
        });
        expect(result3.$_get(0)).assertEqual(0);
      }

      // --- [4] Verify map truncates a fractional value computed from each source element toward zero ---
      {
        let src: Int16Array = Int16Array.of(2, 3, 4);
        let result: Int16Array = src.map((val: number, index: int, array: Int16Array): number => {
          return (val * 3) / 2;
        });
        expect(result.$_get(0)).assertEqual(3);
        expect(result.$_get(1)).assertEqual(4);
        expect(result.$_get(2)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1800
     * @tc.name int16ArrayMapPart02Test018
     * @tc.desc Merged batch (5 tests): int16 wrap and truncation: doubling past range modulo 65536, fractional $_set values truncated, MAX+1 from a copied source, a stored NaN reading as zero and a second overflow wrap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map doubling elements whose doubled product exceeds the int16 range wraps modulo 65536 into the int16 range ---
      {
        let arr: Int16Array = Int16Array.of(20000, 30000);
        let result: Int16Array = arr.map((value: number): number => value * 2);
        expect(result.$_get(0)).assertEqual(-25536);
        expect(result.$_get(1)).assertEqual(-5536);
      }

      // --- [2] Verify identity map on a length-constructed array filled via $_set with fractional values truncates them toward zero ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 3.9);
        arr.$_set(1, 7.2);
        let result: Int16Array = arr.map((value: number): number => value);
        expect(result.$_get(0)).assertEqual(3);
        expect(result.$_get(1)).assertEqual(7);
      }

      // --- [3] Verify map adding 1 to an array built by from(another Int16Array) wraps the int16 MAX element ---
      {
        let base: Int16Array = Int16Array.of(32767, 1);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        let exp: int[] = [-32768, 2];
        for (let i: int = 0; i < exp.length; i++) {
          expect(result.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [4] Verify map adding 1 to an array built by from(Map.values()) whose NaN value was stored as 0 ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', Number.NaN);
        m.set('c', 3);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        expect(result.join(',')).assertEqual('2,1,4');
      }

      // --- [5] Verify map doubling an int16 element over the int16 range wraps modulo 65536 ---
      {
        let arr: Int16Array = Int16Array.of(30000, -30000);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        let exp: int[] = [-5536, 5536];
        for (let i: int = 0; i < exp.length; i++) {
          expect(result.$_get(i)).assertEqual(exp[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_1900
     * @tc.name int16ArrayMapPart02Test019
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: index added to Map keys, length and byteLength preserved, a map().map() chain applied in order, and a filter keeping mapped values above a bound.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map adding the index to each key of an array built by from(Map.keys()) ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(5, 'a');
        m.set(6, 'b');
        m.set(7, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + i);
        expect(result.join(',')).assertEqual('5,7,9');
      }

      // --- [2] Verify the map result of an array built by from(Map.keys()) keeps length and byteLength ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(1, 'a');
        m.set(2, 'b');
        m.set(3, 'c');
        m.set(4, 'd');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        expect(result.length).assertEqual(4);
        expect(result.byteLength).assertEqual(8);
      }

      // --- [3] Verify a map().map() chain maps each element through both callbacks in order ---
      {
        let src: Int16Array = Int16Array.of(5, 6, 7);
        let result: Int16Array = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val * 2;
          })
          .map((val: number, index: int, array: Int16Array): number => {
            return val + index;
          });
        expect(result.join(',')).assertEqual('10,13,16');
      }

      // --- [4] Verify map().map() chain element values correct ---
      {
        let src: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val + 1;
          })
          .map((val: number, index: int, array: Int16Array): number => {
            return val * 2;
          });
        expect(result.$_get(0)).assertEqual(4);
        expect(result.$_get(1)).assertEqual(6);
        expect(result.$_get(2)).assertEqual(8);
        let total: number = 0;
        for (const e of result.entries()) {
          total = total + e[1];
        }
        expect(total).assertEqual(18);
      }

      // --- [5] Verify map().filter() chain keeps only the mapped elements above the bound ---
      {
        let src: Int16Array = Int16Array.of(5, 15, 25);
        let result: Int16Array = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val + 1;
          })
          .filter((val: number, index: int, array: Int16Array): boolean => {
            return val > 10;
          });
        expect(result.length).assertEqual(2);
        expect(result.$_get(0)).assertEqual(16);
        expect(result.$_get(1)).assertEqual(26);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_2000
     * @tc.name int16ArrayMapPart02Test020
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: at(0) of an identity Map-key result, an entries total, contiguous keys, a DataView read and a Set's distinct count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify identity map on an array built by from(Map.keys()) returns the first key through at(0) ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(9, 'a');
        m.set(8, 'b');
        m.set(7, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v);
        expect(result.at(0)).assertEqual(9);
      }

      // --- [2] Verify summing the entries of a map result equals the total of the mapped elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        let total: number = 0;
        for (const e of result.entries()) {
          total = total + e[1];
        }
        expect(total).assertEqual(20);
      }

      // --- [3] Verify the keys() of a map result give the contiguous index sequence ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 10);
        let seq: string = '';
        for (const k of result.keys()) {
          seq = seq + k;
        }
        expect(seq).assertEqual('012');
        expect(result.join(',')).assertEqual('15,16,17');
      }

      // --- [4] Verify a DataView over the map result buffer reads the mapped element ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 10);
        m.set('b', 20);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        let dv: DataView = new DataView(result.buffer);
        expect(dv.getInt16(0, true)).assertEqual(11);
      }

      // --- [5] Verify a Set built from a map result has the expected distinct count ---
      {
        let arr: Int16Array = Int16Array.of(1, 1, 2, 3, 3);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 1);
        let st: Set<int> = new Set<int>();
        for (let i: int = 0; i < result.length; i++) {
          st.add(result.$_get(i).toInt());
        }
        expect(st.size).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_2100
     * @tc.name int16ArrayMapPart02Test021
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: toReversed and toSorted copies, a with() substitute included, subarray squaring and toReversed over doubled results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map multiplying each element of the toReversed() copy by 10 keeps the reversed order ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let rev: Int16Array = arr.toReversed();
        let result: Int16Array = rev.map((value: number): number => value * 10);
        expect(result.$_get(0)).assertEqual(30);
        expect(result.$_get(2)).assertEqual(10);
        expect(arr.$_get(0)).assertEqual(1);
      }

      // --- [2] Verify map adding 1 to each element of the toSorted() copy keeps the ascending order ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 2);
        let sortedArr: Int16Array = arr.toSorted();
        let result: Int16Array = sortedArr.map((value: number): number => value + 1);
        expect(result.$_get(0)).assertEqual(2);
        expect(result.$_get(2)).assertEqual(4);
      }

      // --- [3] Verify map doubling each element of the with(index,value) result includes the substitute ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let w: Int16Array = arr.with(1, 20);
        let result: Int16Array = w.map((value: number): number => value * 2);
        expect(result.$_get(1)).assertEqual(40);
        expect(result.$_get(2)).assertEqual(6);
      }

      // --- [4] Verify map squaring each element of the subarray() result maps the view elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let sa: Int16Array = arr.subarray(2, 5);
        let result: Int16Array = sa.map((value: number): number => value * value);
        expect(result.$_get(0)).assertEqual(9);
        expect(result.$_get(2)).assertEqual(25);
      }

      // --- [5] Verify toReversed on the map result doubling reverses the mapped elements ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value * 2);
        let rev: Int16Array = result.toReversed();
        expect(rev.$_get(0)).assertEqual(6);
        expect(rev.$_get(2)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_2200
     * @tc.name int16ArrayMapPart02Test022
     * @tc.desc Merged batch (3 tests): chaining and derived consumers: reduceRight over a copied source, findLast below a bound over Map values, and round-halving over Map keys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify reduceRight summing a map result over from(another Int16Array) ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3, 4);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        expect(result.reduceRight((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(20);
      }

      // --- [2] Verify findLast on a map result over from(Map.values()) returns the last element below a bound ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 2);
        m.set('b', 5);
        m.set('c', 8);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        expect(result.findLast((v: number, i: int, a2: Int16Array): boolean => v < 7)).assertEqual(6);
      }

      // --- [3] Verify map over from(Map.keys()) with a Math.round-halving callback ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(5, 'a');
        m.set(6, 'b');
        m.set(7, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => Math.round(v / 2));
        let exp: int[] = [3, 3, 4];
        for (let i: int = 0; i < exp.length; i++) {
          expect(result.$_get(i)).assertEqual(exp[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_2300
     * @tc.name int16ArrayMapPart02Test023
     * @tc.desc Merged batch (3 tests): callback arguments and external state: an additive counter shared by two maps, a multiplying accumulator and a flag set by an earlier call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two map calls share external counter additively ---
      {
        let arr1: Int16Array = new Int16Array([1, 2]);
        let arr2: Int16Array = new Int16Array([10, 20, 30]);
        let sharedCount: number = 0;
        arr1.map((val: number, index: int, array: Int16Array) => {
          sharedCount = sharedCount + 1;
          return val;
        });
        arr2.map((val: number, index: int, array: Int16Array) => {
          sharedCount = sharedCount + 1;
          return val;
        });
        expect(sharedCount).assertEqual(5);
      }

      // --- [2] Verify map callback multiplies external accumulator ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let acc: number = 1;
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => {
          acc = acc * val;
          return acc;
        });
        expect(result.$_get(0)).assertEqual(1);
        expect(result.$_get(1)).assertEqual(2);
        expect(result.$_get(2)).assertEqual(6);
      }

      // --- [3] Verify map callback reads external flag set by prior call ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let seenFirst: boolean = false;
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => {
          if (seenFirst) {
            return val * 10;
          }
          seenFirst = true;
          return val;
        });
        expect(result.$_get(0)).assertEqual(1);
        expect(result.$_get(1)).assertEqual(20);
        expect(result.$_get(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_2400
     * @tc.name int16ArrayMapPart02Test024
     * @tc.desc Merged batch (5 tests): element mapping: single-element add-five and times-ten, multiply by three, a constant shift across sign classes and doubling.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map adds 5 to single zero element ---
      {
        let arr: Int16Array = Int16Array.of(0);
        let result: Int16Array = arr.map((value: number) => value + 5);
        expect(result.$_get(0)).assertEqual(5);
      }

      // --- [2] Verify map multiplies single element by 10 ---
      {
        let arr: Int16Array = Int16Array.of(1);
        let result: Int16Array = arr.map((value: number) => value * 10);
        expect(result.$_get(0)).assertEqual(10);
      }

      // --- [3] Verify map multiplies each element by 3 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: Int16Array = arr.map((value: number) => value * 3);
        expect(result.$_get(0)).assertEqual(3);
        expect(result.$_get(1)).assertEqual(6);
        expect(result.length).assertEqual(2);
      }

      // --- [4] Verify map adds a constant to every element for all-positive, mixed-sign and all-zero arrays ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number) => value + 10);
        expect(result.$_get(0)).assertEqual(11);
        expect(result.$_get(1)).assertEqual(12);
        expect(result.$_get(2)).assertEqual(13);

        let mixed: Int16Array = Int16Array.of(-1, 0, 1);
        let resultMixed: Int16Array = mixed.map((value: number) => value + 2);
        expect(resultMixed.$_get(0)).assertEqual(1);
        expect(resultMixed.$_get(1)).assertEqual(2);
        expect(resultMixed.$_get(2)).assertEqual(3);

        let zeros: Int16Array = Int16Array.of(0, 0, 0);
        let resultZeros: Int16Array = zeros.map((value: number) => value + 1);
        expect(resultZeros.$_get(0)).assertEqual(1);
        expect(resultZeros.$_get(1)).assertEqual(1);
        expect(resultZeros.$_get(2)).assertEqual(1);
      }

      // --- [5] Verify map callback doubles each value ---
      {
        let arr: Int16Array = Int16Array.of(-5, -3, -1);
        let result: Int16Array = arr.map((value: number) => value * 2);
        expect(result.$_get(0)).assertEqual(-10);
        expect(result.$_get(1)).assertEqual(-6);
        expect(result.$_get(2)).assertEqual(-2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_2500
     * @tc.name int16ArrayMapPart02Test025
     * @tc.desc Merged batch (5 tests): element mapping: byteLength and byteOffset callbacks, slice-based first element, min-clamping and sign-scaling.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback reading array.byteLength maps each element to the byte length ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.byteLength);
        expect(result.join(',')).assertEqual('6,6,6');
      }

      // --- [2] Verify map callback reading array.byteOffset maps each element to the byte offset ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.byteOffset);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(0);
      }

      // --- [3] Verify map callback reading array.slice(index,index+1) first element maps to the element itself ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.slice(index, index + 1).$_get(0));
        expect(result.$_get(0)).assertEqual(4);
        expect(result.$_get(1)).assertEqual(5);
        expect(result.$_get(2)).assertEqual(6);
      }

      // --- [4] Verify map callback with Math.min(value*2,bound) clamps the doubled value ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: Int16Array = arr.map((value: number): number => Math.min(value * 2, 5));
        expect(result.$_get(0)).assertEqual(2);
        expect(result.$_get(1)).assertEqual(4);
        expect(result.$_get(2)).assertEqual(5);
        expect(result.$_get(3)).assertEqual(5);
      }

      // --- [5] Verify map callback with Math.sign(value)*scale maps the sign of each element ---
      {
        let arr: Int16Array = Int16Array.of(-3, 0, 5);
        let result: Int16Array = arr.map((value: number): number => Math.sign(value) * 100);
        expect(result.$_get(0)).assertEqual(-100);
        expect(result.$_get(1)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART02_2600
     * @tc.name int16ArrayMapPart02Test026
     * @tc.desc Merged batch (5 tests): element mapping: an offset view yielding a packed result, ordered value-and-index mapping, parity on index, full mapping of an ArrayBuffer view and byteLength preservation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map on an offset view returns a tightly-packed result with zero byteOffset ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let view: Int16Array = new Int16Array(buf, 4, 3);
        view.$_set(0, 1);
        view.$_set(1, 2);
        view.$_set(2, 3);
        let result: Int16Array = view.map((val: number, index: int, array: Int16Array): number => val + 1);
        expect(result.byteOffset).assertEqual(0);
        expect(result.buffer.byteLength).assertEqual(result.length * 2);
      }

      // --- [2] Verify map applies a value-and-index callback to every element in order ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array): number => val * 2 + index);
        expect(result.join(',')).assertEqual('2,5,8,11,14');
      }

      // --- [3] Verify a map callback branching on index maps even indices unchanged and odd indices negated ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array): number => {
          if (index % 2 === 0) {
            return val;
          } else {
            return -val;
          }
        });
        expect(result.$_get(0)).assertEqual(1);
        expect(result.$_get(1)).assertEqual(-2);
        expect(result.$_get(2)).assertEqual(3);
      }

      // --- [4] Verify map on ArrayBuffer offset view produces full mapped result ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let view: Int16Array = new Int16Array(buf, 2, 4);
        view.$_set(0, 1);
        view.$_set(1, 2);
        view.$_set(2, 3);
        view.$_set(3, 4);
        let result: Int16Array = view.map((val: number, index: int, array: Int16Array) => val * 10);
        expect(result.length).assertEqual(4);
        expect(result.$_get(0)).assertEqual(10);
        expect(result.$_get(3)).assertEqual(40);
      }

      // --- [5] Verify map result byteLength equals original byteLength ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val + 1);
        expect(result.byteLength).assertEqual(arr.byteLength);
      }
    });

  });
}
