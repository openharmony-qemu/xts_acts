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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayMapPart01Test(): void {
  describe('Int16ArrayMapPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0100
     * @tc.name int16ArrayMapPart01Test001
     * @tc.desc Merged batch (5 tests): callback exceptions and abort: Error and RangeError names, final-index throw, index-1 throw with source intact and index-2 throw count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback throw Error propagates ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.map((value: number, index: int, array: Int16Array) => {
            throw new Error("callback error");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify a callback throwing RangeError propagates out of map with the error name intact ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            throw new RangeError('out of range in callback');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [3] Verify a callback throwing Error at the final index propagates the error out of map ---
      {
        let arr: Int16Array = Int16Array.of(50, 60, 70, 80);
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            if (index === arr.length - 1) {
              throw new Error('last element error');
            }
            return value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [4] Verify map callback throwing at index 1 propagates Error while the source stays unmutated ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            if (index === 1) {
              throw new Error('abort');
            }
            return value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr.$_get(0)).assertEqual(11);
        expect(arr.$_get(1)).assertEqual(22);
        expect(arr.$_get(2)).assertEqual(33);
      }

      // --- [5] Verify map callback throwing at index 2 propagates Error with callCount 3 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let callCount: int = 0;
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            callCount = callCount + 1;
            if (index === 2) {
              throw new Error('stop');
            }
            return value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0200
     * @tc.name int16ArrayMapPart01Test002
     * @tc.desc Merged batch (3 tests): callback exceptions and abort: join-then-throw propagation, plus Set and Map-source int16 boundaries under identity map.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback that calls join('-') before throwing still propagates Error ---
      {
        let arr: Int16Array = Int16Array.of(6, 7);
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            let joined: string = array.join('-');
            if (joined.length > 0) {
              throw new Error('join then error');
            }
            return value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify identity map on an array built by from(Set) preserves the int16 boundary values ---
      {
        let s: Set<int> = new Set<int>();
        s.add(32767);
        s.add(-32768);
        let arr: Int16Array = Int16Array.from(s);
        let result: Int16Array = arr.map((value: number): number => value);
        expect(result.join(',')).assertEqual('32767,-32768');
      }

      // --- [3] Verify identity map on an array built by from(Map.values()) preserves the int16 boundary values ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', -32768);
        m.set('b', 32767);
        m.set('c', 0);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v);
        let exp: int[] = [-32768, 32767, 0];
        for (let i: int = 0; i < exp.length; i++) {
          expect(result.$_get(i)).assertEqual(exp[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0300
     * @tc.name int16ArrayMapPart01Test003
     * @tc.desc Merged batch (5 tests): result buffer independence: copied source, empty result, double chain, fill isolation and subarray isolation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the map result over from(another Int16Array) has an independent buffer and joined text ---
      {
        let base: Int16Array = Int16Array.of(1, 1, 2, 2);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v);
        let shared: boolean = result.buffer === arr.buffer;
        expect(shared).assertFalse();
        expect(result.join('')).assertEqual('1122');
      }

      // --- [2] Verify map empty array returns empty independent buffer ---
      {
        let arr: Int16Array = new Int16Array([]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val + 1);
        expect(result.length).assertEqual(0);

        let r_2: boolean = result.buffer === arr.buffer;
        expect(r_2).assertFalse();
      }

      // --- [3] Verify chained double map leaves original array unchanged ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        arr.map((val: number, index: int, array: Int16Array) => val + 5)
          .map((val: number, index: int, array: Int16Array) => val * 3);
        expect(arr.$_get(0)).assertEqual(10);
        expect(arr.$_get(1)).assertEqual(20);
        expect(arr.$_get(2)).assertEqual(30);
      }

      // --- [4] Verify fill on map result does not affect original array ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val + 10);
        result.fill(0);
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(1)).assertEqual(2);
      }

      // --- [5] Verify subarray of map result does not affect original array ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val + 1);
        let sub: Int16Array = result.subarray(0, 2);
        sub.$_set(0, 0);
        expect(arr.toString()).assertEqual('10,20,30,40');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0400
     * @tc.name int16ArrayMapPart01Test004
     * @tc.desc Merged batch (3 tests): empty and single-element arrays: distinct empty reference, no callback call and independent single-element buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify empty map returns different Int16Array reference ---
      {
        let arr: Int16Array = new Int16Array(0);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => value);
        let r_1: boolean = result === arr;
        expect(r_1).assertFalse();
      }

      // --- [2] Verify map over an empty array returns an empty result without invoking the callback ---
      {
        let arr: Int16Array = new Int16Array(0);
        let called: int = 0;
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => {
          called = called + 1;
          return value + 100;
        });
        expect(result.length).assertEqual(0);
        expect(called).assertEqual(0);
      }

      // --- [3] Verify map single-element result buffer is independent ---
      {
        let arr: Int16Array = new Int16Array([42]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => val + 1);
        expect(result.length).assertEqual(1);

        let r_2: boolean = result.buffer === arr.buffer;
        expect(r_2).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0500
     * @tc.name int16ArrayMapPart01Test005
     * @tc.desc Merged batch (5 tests): int16 wrap and truncation: 32768/32769, constant 131071, double-range zero and multiple-of-range constants.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify callback 32768 at index 0 wraps to MIN with +1 others and -32769 at the last index wraps to MAX ---
      {
        let sources: int[][] = [[1, 2, 3], [5, 10, 15]];
        let overflowIndices: int[] = [0, 2];
        let overflowValues: int[] = [32768, -32769];
        let incrementOthers: boolean[] = [true, false];
        let expected: int[][] = [[-32768, 3, 4], [5, 10, 32767]];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let overflowIndex: int = overflowIndices[i];
          let overflowValue: int = overflowValues[i];
          let increment: boolean = incrementOthers[i];
          let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => {
            if (index === overflowIndex) {
              return overflowValue;
            }
            return increment ? value + 1 : value;
          });
          for (let j: int = 0; j < expected[i].length; j++) {
            expect(result.$_get(j)).assertEqual(expected[i][j]);
          }
        }
      }

      // --- [2] Verify map returning constant 131071 wraps to -1 for each element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => 131071);
        expect(result.$_get(0)).assertEqual(-1);
        expect(result.$_get(1)).assertEqual(-1);
        expect(result.$_get(2)).assertEqual(-1);
      }

      // --- [3] Verify a callback result of minus twice the int16 range wraps to zero for every element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => -131072);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(0);
      }

      // --- [4] Verify callback constants at multiples of the int16 range wrap to their low 16 bits ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => {
          if (index === 0) {
            return 32768;
          }
          if (index === 1) {
            return 65536;
          }
          if (index === 2) {
            return 131071;
          }
          return 196607;
        });
        expect(result.$_get(0)).assertEqual(-32768);
        expect(result.$_get(1)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(-1);
        expect(result.$_get(3)).assertEqual(-1);
      }

      // --- [5] Verify map callback wraps numeric constants to int16 range ---
      {
        let cases: number[][] = [[32768.7, -32768], [-32769.3, 32767], [-3.7, -3], [0.9, 0], [-0.9, 0], [2147483647, -1], [-2147483648, 0], [196607, -1], [-196608, 0], [0xfffe, -2], [0x10001, 1], [10000000000, -7168], [-10000000000, 7168], [0.5, 0], [-0.5, 0], [32767.9, 32767], [-32768.9, -32768], [1.999, 1], [-1.999, -1], [-1 * 32769, 32767], [-0x8001, 32767], [65535, -1], [-0.0, 0], [-1.0 / 0.0, 0], [Math.sqrt(-1), 0], [Math.pow(10, 400), 0], [2.5, 2]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = Int16Array.of(1);
          let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => cases[i][0]);
          expect(result.$_get(0)).assertEqual(cases[i][1]);
        }
        let arrA: Int16Array = Int16Array.of(10);
        let resultA: Int16Array = arrA.map((value: number, index: int, array: Int16Array): number => value / 0.0);
        expect(resultA.$_get(0)).assertEqual(0);

        let arrB: Int16Array = Int16Array.of(10);
        let resultB: Int16Array = arrB.map((value: number, index: int, array: Int16Array): number => -value / 0.0);
        expect(resultB.$_get(0)).assertEqual(0);

        let arrC: Int16Array = Int16Array.of(7);
        let resultC: Int16Array = arrC.map((value: number, index: int, array: Int16Array): number => value % 0);
        expect(resultC.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0600
     * @tc.name int16ArrayMapPart01Test006
     * @tc.desc Merged batch (3 tests): int16 wrap and truncation: ceil-halving negatives, constant wrapping and squaring overflow.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map with a Math.ceil-halving callback on negative elements rounds toward positive infinity ---
      {
        let arr: Int16Array = Int16Array.of(-3, -5);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => Math.ceil(v / 2));
        expect(result.join(',')).assertEqual('-1,-2');
      }

      // --- [2] Verify map stores constants and wraps overflow to int16 range ---
      {
        let cases: number[][] = [[0, 0], [-1, -1], [-32768, -32768], [32767, 32767], [-32769, 32767], [32768, -32768], [65535, -1], [65536, 0], [3.7, 3], [-3.7, -3], [3.0, 3], [2147483647, -1], [-65537, -1]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([0]);
          let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => cases[i][0]);
          expect(result.$_get(0)).assertEqual(cases[i][1]);
        }
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => 0);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(0);

        let arrB: Int16Array = new Int16Array([1, 2]);
        let resultB: Int16Array = arrB.map((val: number, index: int, array: Int16Array) => -1);
        expect(resultB.$_get(0)).assertEqual(-1);
        expect(resultB.$_get(1)).assertEqual(-1);

        let arrM: Int16Array = new Int16Array([1, 2, 3, 4]);
        let resultM: Int16Array = arrM.map((val: number, index: int, array: Int16Array) => {
          if (index === 0) {
            return 32768;
          }
          if (index === 1) {
            let nan: number = 0.0 / 0.0;
            return nan;
          }
          if (index === 2) {
            return -32769;
          }
          return val;
        });
        expect(resultM.$_get(0)).assertEqual(-32768);
        expect(resultM.$_get(1)).assertEqual(0);
        expect(resultM.$_get(2)).assertEqual(32767);
        expect(resultM.$_get(3)).assertEqual(4);
      }

      // --- [3] Verify map squares elements large enough that the product wraps modulo the int16 range ---
      {
        let arr: Int16Array = Int16Array.of(200, 300, 400);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value * value);
        expect(result.$_get(0)).assertEqual(-25536);
        expect(result.$_get(1)).assertEqual(24464);
        expect(result.$_get(2)).assertEqual(28928);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0700
     * @tc.name int16ArrayMapPart01Test007
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: fill, sort, reverse, join and reduce chains.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map().fill(0) chain fills all elements with 0 ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val + 1;
          })
          .fill(0);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(0);
      }

      // --- [2] Verify map().sort() chain sorts elements ascending ---
      {
        let src: Int16Array = Int16Array.of(30, 10, 20);
        let result: Int16Array = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val;
          })
          .sort();
        expect(result.$_get(0)).assertEqual(10);
        expect(result.$_get(1)).assertEqual(20);
        expect(result.$_get(2)).assertEqual(30);
      }

      // --- [3] Verify map().reverse() chain reverses element order ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val;
          })
          .reverse();
        expect(result.$_get(0)).assertEqual(30);
        expect(result.$_get(1)).assertEqual(20);
        expect(result.$_get(2)).assertEqual(10);
      }

      // --- [4] Verify map().join() chain produces the joined mapped string ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30);
        let str: string = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val + 1;
          })
          .join(',');
        expect(str).assertEqual('11,21,31');
      }

      // --- [5] Verify map().reduce() chain sum is correct ---
      {
        let src: Int16Array = Int16Array.of(1, 2, 3);
        let sum: number = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val * 10;
          })
          .reduce((prev: number, cur: number, idx: int, arr: Int16Array): number => {
            return prev + cur;
          }, 0.0);
        expect(sum).assertEqual(60);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0800
     * @tc.name int16ArrayMapPart01Test008
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: findLastIndex, at(-1), toReversed, Map-from-entries and includes over Map keys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify findLastIndex on the map result returns the last index holding the mapped value ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        expect(result.findLastIndex((v: number, i: int, a2: Int16Array): boolean => v === 4)).assertEqual(2);
      }

      // --- [2] Verify at(-1) on the map result returns the mapped last element ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        expect(result.at(-1)).assertEqual(18);
      }

      // --- [3] Verify map on an array built by from(Map.values()) then toReversed keeps the reversed mapped order ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 10);
        let rev: Int16Array = result.toReversed();
        expect(rev.join(',')).assertEqual('30,20,10');
      }

      // --- [4] Verify a Map built from the entries of a map result maps each index to its mapped element ---
      {
        let arr: Int16Array = Int16Array.of(2, 4);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        let mp: Map<int, number> = new Map<int, number>();
        for (const e of result.entries()) {
          mp.set(e[0], e[1]);
        }
        expect(mp.get(1)).assertEqual(5);
      }

      // --- [5] Verify includes finds a mapped element in the result of a map over from(Map.keys()) ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(3, 'a');
        m.set(4, 'b');
        m.set(5, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        let has: boolean = result.includes(8);
        expect(has).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_0900
     * @tc.name int16ArrayMapPart01Test009
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: toSorted, with() overwrite, indexOf, toLocaleString and snapshot-on-write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify toSorted on the map result of the 10-value mapping sorts the mapped elements ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => 10 - value);
        let sortedArr: Int16Array = result.toSorted();
        expect(sortedArr.$_get(0)).assertEqual(7);
        expect(sortedArr.$_get(2)).assertEqual(9);
      }

      // --- [2] Verify with(1,99) on the map result adding 1 overwrites index 1 ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value + 1);
        let w: Int16Array = result.with(1, 99);
        expect(w.$_get(0)).assertEqual(2);
        expect(w.$_get(1)).assertEqual(99);
      }

      // --- [3] Verify indexOf of the doubled element on the map result returns its index ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value * 2);
        expect(result.indexOf(4)).assertEqual(1);
      }

      // --- [4] Verify toLocaleString on the map result doubling equals the joined doubled string ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value * 2);
        expect(result.toLocaleString()).assertEqual('2,4,6');
      }

      // --- [5] Verify map uses the snapshot value when the callback writes zero into the current index of an array built by from(Map.values()) ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 5);
        m.set('b', 6);
        m.set('c', 7);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => {
          a2.$_set(i, 0);
          return v;
        });
        expect(result.join(',')).assertEqual('5,6,7');
        expect(arr.join(',')).assertEqual('0,0,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1000
     * @tc.name int16ArrayMapPart01Test010
     * @tc.desc Merged batch (5 tests): callback arguments and external state: constant result, third argument, external counter, external multiplier and $_get reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a callback returning a constant writes that same value to every result slot ---
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => 0);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(0);

        let arrFortyTwo: Int16Array = Int16Array.of(7, 8, 9);
        let resultFortyTwo: Int16Array = arrFortyTwo.map((value: number, index: int, array: Int16Array) => 42);
        expect(resultFortyTwo.$_get(0)).assertEqual(42);
        expect(resultFortyTwo.$_get(1)).assertEqual(42);
        expect(resultFortyTwo.$_get(2)).assertEqual(42);

        let arrNegHundred: Int16Array = Int16Array.of(1, 2);
        let resultNegHundred: Int16Array = arrNegHundred.map((value: number, index: int, array: Int16Array) => -100);
        expect(resultNegHundred.$_get(0)).assertEqual(-100);
        expect(resultNegHundred.$_get(1)).assertEqual(-100);
      }

      // --- [2] Verify the map callback third argument is the source array itself ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let same: boolean = true;
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => {
          if (array !== arr) {
            same = false;
          }
          return value;
        });
        let r_same: boolean = same;
        expect(r_same).assertTrue();
        expect(result.join(',')).assertEqual('1,2,3');
      }

      // --- [3] Verify map callback increments external counter ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let count: int = 0;
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => {
          count = count + 1;
          return value;
        });
        expect(count).assertEqual(3);
        expect(result.$_get(0)).assertEqual(10);
      }

      // --- [4] Verify map callback uses external multiplier state ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let multiplier: int = 10;
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => value * multiplier);
        expect(result.$_get(0)).assertEqual(10);
        expect(result.$_get(1)).assertEqual(20);
        expect(result.$_get(2)).assertEqual(30);
      }

      // --- [5] Verify map callback reads other element via $_get ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => {
          if (index === 0) {
            return array.$_get(2);
          }
          return value;
        });
        expect(result.$_get(0)).assertEqual(30);
        expect(result.$_get(1)).assertEqual(20);
        expect(result.$_get(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1100
     * @tc.name int16ArrayMapPart01Test011
     * @tc.desc Merged batch (5 tests): construction sources: copied-source add and triple, copy-construction, Set doubling and mapfn-derived increments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map adding 1 to each element of an array built by from(another Int16Array) while the base stays unchanged ---
      {
        let base: Int16Array = Int16Array.of(3, 5, 7);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        let exp: int[] = [4, 6, 8];
        for (let i: int = 0; i < exp.length; i++) {
          expect(result.$_get(i)).assertEqual(exp[i]);
        }
        expect(base.join(',')).assertEqual('3,5,7');
      }

      // --- [2] Verify map tripling on an array built by from(another Int16Array) is read back through at ---
      {
        let base: Int16Array = Int16Array.of(2, 3, 4);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 3);
        let first: number | undefined = result.at(0);
        let last: number | undefined = result.at(2);
        expect(first).assertEqual(6);
        expect(last).assertEqual(12);
      }

      // --- [3] Verify map adding 1 on a copy-constructed array yields each element incremented ---
      {
        let src: Int16Array = Int16Array.of(1, 2, 3);
        let cp: Int16Array = new Int16Array(src);
        let result: Int16Array = cp.map((value: number): number => value + 1);
        expect(result.$_get(0)).assertEqual(2);
        expect(result.$_get(1)).assertEqual(3);
        expect(result.$_get(2)).assertEqual(4);
      }

      // --- [4] Verify map doubling each element on an array built by from(Set) reads the doubled element at index 1 ---
      {
        let s: Set<int> = new Set<int>();
        s.add(10);
        s.add(20);
        s.add(30);
        let arr: Int16Array = Int16Array.from(s);
        let result: Int16Array = arr.map((value: number): number => value * 2);
        expect(result.length).assertEqual(3);
        expect(result.$_get(1)).assertEqual(40);
      }

      // --- [5] Verify map adding 1 on an array built by from(Array, mapfn) yields each mapped element incremented ---
      {
        let src: int[] = [1, 2, 3];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 10 + k);
        let result: Int16Array = arr.map((value: number): number => value + 1);
        expect(result.$_get(0)).assertEqual(11);
        expect(result.$_get(1)).assertEqual(22);
        expect(result.$_get(2)).assertEqual(33);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1200
     * @tc.name int16ArrayMapPart01Test012
     * @tc.desc Merged batch (5 tests): element mapping: identity bounds, index times ten, squaring, negative clamping and sign-dependent mapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an identity callback preserves every element including int16 max and min boundaries ---
      {
        let arr: Int16Array = Int16Array.of(32767, -32768, 0, -1, 1);
        let result: Int16Array = arr.map((value: number) => value);
        expect(result.$_get(0)).assertEqual(32767);
        expect(result.$_get(1)).assertEqual(-32768);
        expect(result.$_get(2)).assertEqual(0);
        expect(result.$_get(3)).assertEqual(-1);
        expect(result.$_get(4)).assertEqual(1);
      }

      // --- [2] Verify map returns index times 10 ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = arr.map((value: number, index: int) => index * 10);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(10);
        expect(result.$_get(2)).assertEqual(20);

        let arrFour: Int16Array = Int16Array.of(7, 7, 7, 7);
        let resultFour: Int16Array = arrFour.map((value: number, index: int) => index * 10);
        expect(resultFour.$_get(0)).assertEqual(0);
        expect(resultFour.$_get(1)).assertEqual(10);
        expect(resultFour.$_get(2)).assertEqual(20);
        expect(resultFour.$_get(3)).assertEqual(30);
      }

      // --- [3] Verify map callback squares small values ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let result: Int16Array = arr.map((value: number) => value * value);
        expect(result.$_get(0)).assertEqual(4);
        expect(result.$_get(1)).assertEqual(16);
        expect(result.$_get(2)).assertEqual(36);
      }

      // --- [4] Verify map clamps negative mapped values to 0 ---
      {
        let arr: Int16Array = Int16Array.of(-5, 0, 5);
        let result: Int16Array = arr.map((value: number) => {
          if (value >= 0) {
            return value;
          }
          return 0;
        });
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(5);
      }

      // --- [5] Verify a value-dependent callback maps positive elements differently from non-positive ones ---
      {
        let arr: Int16Array = Int16Array.of(1, 0, -1);
        let result: Int16Array = arr.map((value: number) => {
          if (value > 0) {
            return 32767;
          }
          return -32768;
        });
        expect(result.$_get(0)).assertEqual(32767);
        expect(result.$_get(1)).assertEqual(-32768);
        expect(result.$_get(2)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1300
     * @tc.name int16ArrayMapPart01Test013
     * @tc.desc Merged batch (5 tests): element mapping: ceil/round halving, scaled ceil one-third, index squares and remainder three.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map with a Math.ceil-halving callback rounds each element up to the next half step ---
      {
        let arr: Int16Array = Int16Array.of(3, 5, 7, 9);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => Math.ceil(v / 2));
        expect(result.join(',')).assertEqual('2,3,4,5');
      }

      // --- [2] Verify map with a Math.round-halving callback rounds each element to the nearest half step ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 4, 5);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => Math.round(v / 2));
        let exp: int[] = [1, 1, 2, 3];
        for (let i: int = 0; i < exp.length; i++) {
          expect(result.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [3] Verify map with a Math.ceil one-third callback then scaled by 3 rounds each element up to a multiple of 3 ---
      {
        let arr: Int16Array = Int16Array.of(4, 7, 10);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => Math.ceil(v / 3) * 3);
        expect(result.join(',')).assertEqual('6,9,12');
      }

      // --- [4] Verify map squaring the index of each element produces the index squares ---
      {
        let arr: Int16Array = Int16Array.of(9, 9, 9, 9);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => i * i);
        expect(result.join(',')).assertEqual('0,1,4,9');
      }

      // --- [5] Verify map taking the remainder modulo 3 of each element ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v % 3);
        expect(result.join(',')).assertEqual('1,2,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1400
     * @tc.name int16ArrayMapPart01Test014
     * @tc.desc Merged batch (3 tests): element mapping: sliced subtract, filtered multiply and a while-loop fixed point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map subtracting 1 on the slice() result maps the sliced elements ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let sl: Int16Array = arr.slice(1, 3);
        let result: Int16Array = sl.map((value: number): number => value - 1);
        expect(result.length).assertEqual(2);
        expect(result.$_get(0)).assertEqual(19);
        expect(result.$_get(1)).assertEqual(29);
      }

      // --- [2] Verify map multiplying by 10 on the even-filter result maps the kept elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let fl: Int16Array = arr.filter((value: number): boolean => value % 2 === 0);
        let result: Int16Array = fl.map((value: number): number => value * 10);
        expect(result.length).assertEqual(2);
        expect(result.$_get(0)).assertEqual(20);
        expect(result.$_get(1)).assertEqual(40);
      }

      // --- [3] Verify map() drives a while loop that reapplies halving until the value reaches a fixed point ---
      {
        let cur: Int16Array = Int16Array.of(8, 8, 8);
        let rounds: int = 0;
        let limit: int = 10;
        while (rounds < limit && cur.$_get(0) !== 1) {
          cur = cur.map((element: number, _index: int, _array: Int16Array): number => element / 2);
          rounds = rounds + 1;
        }

        expect(rounds).assertEqual(3);
        expect(cur.$_get(0)).assertEqual(1);
        expect(cur.$_get(1)).assertEqual(1);
        expect(cur.$_get(2)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1500
     * @tc.name int16ArrayMapPart01Test015
     * @tc.desc Merged batch (5 tests): callback exceptions and abort: reached flag, external side effects, first-call throw then later success, threshold throw and single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback throwing at index 1 still sets the reached flag true ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let reached: boolean = false;
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            reached = true;
            if (index === 1) {
              throw new Error('fail');
            }
            return value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(reached).assertTrue();
      }

      // --- [2] Verify map() side effects on an external array survive a callback throw at index 0 or index 1 ---
      {
        let src: Int16Array = Int16Array.of(1, 2, 3);
        let throwAt: int[] = [0, 1];
        let expected: string[] = ['999,0,0', '999,999,0'];
        for (let k: int = 0; k < throwAt.length; k++) {
          let ext: Int16Array = Int16Array.of(0, 0, 0);
          try {
            src.map((value: number, index: int, _array: Int16Array): number => {
              ext.$_set(index, 999);
              if (index === throwAt[k]) {
                throw new Error('abort after write');
              }
              return value;
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(ext.join(',')).assertEqual(expected[k]);
        }
      }

      // --- [3] Verify map callback throwing on the first call propagates Error and a later map doubling succeeds ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            throw new Error('first map fails');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let result: Int16Array = arr.map((value: number): number => value * 2);
        expect(result.$_get(0)).assertEqual(14);
        expect(result.$_get(1)).assertEqual(16);
        expect(result.$_get(2)).assertEqual(18);
      }

      // --- [4] Verify map callback throwing when the value equals a threshold propagates Error ---
      {
        let arr: Int16Array = Int16Array.of(0, 100, 200);
        try {
          arr.map((value: number, index: int, array: Int16Array): number => {
            if (value === 100) {
              throw new Error('trigger on 100');
            }
            return value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [5] Verify map callback throwing on a single-element array propagates Error ---
      {
        let arr: Int16Array = new Int16Array([5 as number]);
        try {
          arr.map((value: number): number => {
            throw new Error('single element error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.message).assertEqual('single element error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1600
     * @tc.name int16ArrayMapPart01Test016
     * @tc.desc Merged batch (4 tests): iteration snapshot and mid-map mutation: later source writes observed, processed index ignored, mid-map mutation and reverse snapshot.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a source write to a not-yet-visited index is observed by the callback ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => {
          if (index === 0) {
            array.$_set(2, 888);
          }
          return val;
        });
        expect(result.$_get(2)).assertEqual(888);
      }

      // --- [2] Verify map result ignores $_set of already-processed index ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => {
          if (index > 0) {
            array.$_set(0, 0);
          }
          return val;
        });
        expect(result.$_get(0)).assertEqual(10);
        expect(result.$_get(1)).assertEqual(20);
        expect(result.$_get(2)).assertEqual(30);
      }

      // --- [3] Verify a mid-map fill, copyWithin, sort or set of the source is observed at later not-yet-visited indices ---
      {
        let inputs: number[][] = [[5, 6, 7, 8], [1, 2, 3, 4], [30, 10, 20, 40], [1, 2, 3, 4]];
        let modes: string[] = ['fill', 'copyWithin', 'sort', 'set'];
        let expected: number[][] = [[5, 0, 0, 0], [1, 4, 3, 4], [30, 20, 30, 40], [1, 99, 3, 4]];
        for (let c: int = 0; c < modes.length; c++) {
          let arr: Int16Array = Int16Array.from(inputs[c]);
          let mode: string = modes[c];
          let result: Int16Array = arr.map((val: number, index: int, array: Int16Array): number => {
            if (index === 0) {
              if (mode === 'fill') {
                array.fill(0);
              } else if (mode === 'copyWithin') {
                array.copyWithin(0, 2);
              } else if (mode === 'sort') {
                array.sort();
              } else {
                let pad: Int16Array = new Int16Array([99, 99]);
                array.set(pad, 0);
              }
            }
            return val;
          });
          for (let i: int = 0; i < expected[c].length; i++) {
            expect(result.$_get(i)).assertEqual(expected[c][i]);
          }
        }
      }

      // --- [4] Verify a callback reverse is observed at later indices while earlier result slots keep the pre-reverse values ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => {
          if (index === 0) {
            array.reverse();
          }
          return val;
        });
        expect(result.$_get(0)).assertEqual(10);
        expect(result.$_get(1)).assertEqual(20);
        expect(result.$_get(2)).assertEqual(10);
        expect(arr.join(',')).assertEqual('30,20,10');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1700
     * @tc.name int16ArrayMapPart01Test017
     * @tc.desc Merged batch (5 tests): result buffer independence: shared source buffer, sibling views, result mutation and offset-view isolation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map result buffer independent when source shares buffer ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        view1.$_set(0, 10);
        view1.$_set(1, 20);
        view1.$_set(2, 30);
        let result: Int16Array = view1.map((val: number, index: int, array: Int16Array) => val + 1);
        let r_1: boolean = result.buffer === buf;
        expect(r_1).assertFalse();
      }

      // --- [2] Verify map on shared-buffer view does not mutate sibling view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        let view2: Int16Array = new Int16Array(buf, 0, 3);
        view1.$_set(0, 1);
        view1.$_set(1, 2);
        view1.$_set(2, 3);
        view1.map((val: number, index: int, array: Int16Array) => val * 10);
        expect(view2.$_get(0)).assertEqual(1);
        expect(view2.$_get(1)).assertEqual(2);
        expect(view2.$_get(2)).assertEqual(3);
      }

      // --- [3] Verify map result mutation does not affect shared buffer ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view: Int16Array = new Int16Array(buf, 0, 3);
        view.$_set(0, 5);
        view.$_set(1, 10);
        view.$_set(2, 15);
        let result: Int16Array = view.map((val: number, index: int, array: Int16Array) => val + 1);
        result.$_set(0, 999);
        let checkView: Int16Array = new Int16Array(buf, 0, 3);
        expect(checkView.$_get(0)).assertEqual(5);
      }

      // --- [4] Verify map on offset views leaves sibling view unchanged ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        view1.$_set(0, 4);
        view1.$_set(1, 5);
        view1.$_set(2, 6);
        let view2: Int16Array = new Int16Array(buf, 2, 3);
        view2.$_set(0, 40);
        view2.$_set(1, 50);
        view2.$_set(2, 60);
        let before: string = view2.join(',');
        let mapped: Int16Array = view1.map((val: number, index: int, array: Int16Array) => val + 1);
        expect(view2.join(',')).assertEqual(before);
        expect(mapped.$_get(0)).assertEqual(5);
      }

      // --- [5] Verify sibling and chained map results have buffers independent of the shared source buffer ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        view1.$_set(0, 1);
        view1.$_set(1, 2);
        view1.$_set(2, 3);
        let view2: Int16Array = new Int16Array(buf, 0, 3);
        let r1: Int16Array = view1.map((val: number, index: int, array: Int16Array): number => val + 1);
        let r2: Int16Array = view2.map((val: number, index: int, array: Int16Array): number => val * 2);
        let r3: Int16Array = r1.map((val: number, index: int, array: Int16Array): number => val + 10);
        let r_1: boolean = r1.buffer === r2.buffer;
        expect(r_1).assertFalse();
        let r_2: boolean = r1.buffer === buf;
        expect(r_2).assertFalse();
        let r_3: boolean = r2.buffer === buf;
        expect(r_3).assertFalse();
        let r_4: boolean = r3.buffer === r1.buffer;
        expect(r_4).assertFalse();
        let r_5: boolean = r3.buffer === buf;
        expect(r_5).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1800
     * @tc.name int16ArrayMapPart01Test018
     * @tc.desc Merged batch (3 tests): int16 wrap and truncation: MAX/MIN constants, 32768 wrap and 65536 wrap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback constant MAX 32767 and MIN -32768 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => 32767);
        expect(result.$_get(0)).assertEqual(32767);
        expect(result.$_get(1)).assertEqual(32767);

        let resultMin: Int16Array = arr.map((value: number, index: int, array: Int16Array) => -32768);
        expect(resultMin.$_get(0)).assertEqual(-32768);
        expect(resultMin.$_get(1)).assertEqual(-32768);
      }

      // --- [2] Verify map callback returning 32768 wraps to int16.MIN and subtracting one from the wrapped value wraps back to int16.MAX ---
      {
        let high: Int16Array = Int16Array.of(1, 2).map((_value: number): number => 32768);
        expect(high.$_get(0)).assertEqual(-32768);
        let low: Int16Array = high.map((value: number): number => value - 1);
        expect(low.join(',')).assertEqual('32767,32767');
      }

      // --- [3] Verify map callback returning 65536 wraps to 0 and subtracting 65537 from the wrapped value wraps to -1 ---
      {
        let zeroed: Int16Array = Int16Array.of(1, 1).map((_value: number): number => 65536);
        expect(zeroed.at(0)).assertEqual(0);
        let minus: Int16Array = zeroed.map((value: number): number => value - 65537);
        expect(minus.slice(0, 1).$_get(0)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_1900
     * @tc.name int16ArrayMapPart01Test019
     * @tc.desc Merged batch (5 tests): int16 wrap and truncation: NaN/Infinity-to-zero, position-product overflow, MAX+1 and MIN-1, and +32768 with NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map callback producing NaN on odd values or an infinity overflow converts to 0 ---
      {
        let nanVal: number = 0.0 / 0.0;
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => {
          if (value % 2 === 1) {
            return nanVal;
          }
          return value;
        });
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(2);
        expect(result.$_get(2)).assertEqual(0);
        expect(result.$_get(3)).assertEqual(4);

        let arrB: Int16Array = Int16Array.of(1, 2, 3);
        let resultB: Int16Array = arrB.map((value: number, index: int, array: Int16Array): number => 1e308 * 1e308);
        expect(resultB.$_get(0)).assertEqual(0);
        expect(resultB.$_get(1)).assertEqual(0);
        expect(resultB.$_get(2)).assertEqual(0);
      }

      // --- [2] Verify map multiplies each element by its position and wraps the overflowing product ---
      {
        let arr: Int16Array = Int16Array.of(20000, 20000, 20000);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value * (index + 1));
        expect(result.$_get(0)).assertEqual(20000);
        expect(result.$_get(1)).assertEqual(-25536);
        expect(result.$_get(2)).assertEqual(-5536);
      }

      // --- [3] Verify map callback returning NaN or Infinity converts elements to 0 ---
      {
        let arr: Int16Array = Int16Array.of(0);
        let nanVal: number = 0.0 / 0.0;
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => nanVal);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.length).assertEqual(1);

        let infVal: number = 1.0 / 0.0;
        let arrA: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
        let resultA: Int16Array = arrA.map((value: number, index: int, array: Int16Array): number => infVal);
        expect(resultA.$_get(0)).assertEqual(0);
        expect(resultA.$_get(4)).assertEqual(0);
        expect(resultA.length).assertEqual(5);

        let arrB: Int16Array = Int16Array.of(3, 6, 9);
        let resultB: Int16Array = arrB.map((value: number, index: int, array: Int16Array): number => nanVal);
        expect(resultB.$_get(0)).assertEqual(0);
        expect(resultB.$_get(2)).assertEqual(0);

        let arrC: Int16Array = Int16Array.of(32767, 32767, 32767, 32767);
        let resultC: Int16Array = arrC.map((value: number, index: int, array: Int16Array): number => infVal);
        expect(resultC.$_get(0)).assertEqual(0);
        expect(resultC.$_get(3)).assertEqual(0);

        let arrD: Int16Array = Int16Array.of(32767, 32767);
        let resultD: Int16Array = arrD.map((value: number, index: int, array: Int16Array): number => nanVal);
        expect(resultD.$_get(0)).assertEqual(0);
        expect(resultD.$_get(1)).assertEqual(0);

        let arrE: Int16Array = Int16Array.of(-32768, -32768, -32768);
        let resultE: Int16Array = arrE.map((value: number, index: int, array: Int16Array): number => nanVal);
        expect(resultE.$_get(0)).assertEqual(0);
        expect(resultE.$_get(2)).assertEqual(0);

        let arrF: Int16Array = Int16Array.of(-32768);
        let resultF: Int16Array = arrF.map((value: number, index: int, array: Int16Array): number => infVal);
        expect(resultF.$_get(0)).assertEqual(0);

        let arrG: Int16Array = Int16Array.of(32767);
        let resultG: Int16Array = arrG.map((value: number, index: int, array: Int16Array): number => nanVal);
        expect(resultG.$_get(0)).assertEqual(0);
      }

      // --- [4] Verify map value+1 on int16.MAX and value-1 on int16.MIN wrap to MIN and MAX respectively ---
      {
        let fills: int[] = [32767, -32768];
        let deltas: int[] = [1, -1];
        let expected: int[] = [-32768, 32767];
        for (let i: int = 0; i < fills.length; i++) {
          let arr: Int16Array = Int16Array.of(fills[i], fills[i], fills[i]);
          let delta: int = deltas[i];
          let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value + delta);
          for (let j: int = 0; j < result.length; j++) {
            expect(result.$_get(j)).assertEqual(expected[i]);
          }
        }
      }

      // --- [5] Verify map value+32768 for the first two elements and NaN for the rest converts the rest to 0 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let nanVal: number = 0.0 / 0.0;
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => {
          if (index < 2) {
            return value + 32768;
          }
          return nanVal;
        });
        expect(result.$_get(0)).assertEqual(-32767);
        expect(result.$_get(1)).assertEqual(-32766);
        expect(result.$_get(2)).assertEqual(0);
        expect(result.$_get(3)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_2000
     * @tc.name int16ArrayMapPart01Test020
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: values() even count, join-length mapping, indexOf and lastIndexOf mapping, and includes-based mapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterating a map result through values() counts the even mapped elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => value * 3);
        let evens: int = 0;
        for (const x of result.values()) {
          if (x % 2 === 0) {
            evens = evens + 1;
          }
        }
        expect(evens).assertEqual(1);
      }

      // --- [2] Verify map callback reading array.join(',') length maps each element to the joined length ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.join(',').length);
        expect(result.$_get(0)).assertEqual(5);
        expect(result.$_get(1)).assertEqual(5);
      }

      // --- [3] Verify map callback reading array.indexOf(value) maps each element to its index ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.indexOf(value));
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(1);
        expect(result.$_get(2)).assertEqual(2);
      }

      // --- [4] Verify map callback reading array.lastIndexOf(value) maps each element to its last index ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 5);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.lastIndexOf(value));
        expect(result.$_get(0)).assertEqual(2);
        expect(result.$_get(1)).assertEqual(1);
        expect(result.$_get(2)).assertEqual(2);
      }

      // --- [5] Verify map callback using array.includes(index) maps the matching element differently ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => array.includes(index) ? value : -100.0);
        expect(result.$_get(0)).assertEqual(-100);
        expect(result.$_get(1)).assertEqual(2);
        expect(result.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_2100
     * @tc.name int16ArrayMapPart01Test021
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: slice length, includes, at(0), subarray(1,3) and find above a bound.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map().slice() chain length is correct ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let result: Int16Array = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val + 1;
          })
          .slice(1, 4);
        expect(result.length).assertEqual(3);
        expect(result.join(',')).assertEqual('21,31,41');
      }

      // --- [2] Verify map().includes() finds mapped element ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30);
        let found: boolean = src
          .map((val: number, index: int, array: Int16Array): number => {
            return val + 5;
          })
          .includes(15);
        expect(found).assertTrue();
      }

      // --- [3] Verify at(0) on the map result adding 1 reads the incremented first element ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value + 1);
        expect(result.at(0)).assertEqual(2);
      }

      // --- [4] Verify subarray(1,3) of the map result multiplying by 10 has length 2 ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value * 10);
        let sub: Int16Array = result.subarray(1, 3);
        expect(sub.length).assertEqual(2);
        expect(sub.$_get(0)).assertEqual(20);
      }

      // --- [5] Verify find(value>4) on the map result doubling returns the first element above the bound ---
      {
        let result: Int16Array = Int16Array.of(1, 2, 3).map((value: number): number => value * 2);
        expect(result.find((value: number): boolean => value > 4)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_2200
     * @tc.name int16ArrayMapPart01Test022
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: at(-1) added to elements, entries sum from Map.values, keys of an identity copy, DataView read and at(-2).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the map callback adds the last element read via array.at(-1) to every element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => {
          let last: number | undefined = array.at(-1);
          if (last === undefined) {
            return value;
          }
          return value + last;
        });
        expect(result.$_get(0)).assertEqual(4);
        expect(result.$_get(1)).assertEqual(5);
        expect(result.$_get(2)).assertEqual(6);
      }

      // --- [2] Verify summing the entries of a map result over from(Map.values()) equals the doubled total ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 2);
        m.set('b', 4);
        m.set('c', 6);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        let total: number = 0;
        for (const e of result.entries()) {
          total = total + e[1];
        }
        expect(total).assertEqual(24);
      }

      // --- [3] Verify the keys() of an identity map over from(another Int16Array) span the contiguous indexes ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3, 4);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v);
        let count: number = 0;
        let last: number = -1;
        for (const k of result.keys()) {
          count = count + 1;
          last = k;
        }
        expect(count).assertEqual(4);
        expect(last).assertEqual(3);
      }

      // --- [4] Verify a DataView over the map result buffer over from(Map.keys()) reads both mapped elements ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(10, 'a');
        m.set(20, 'b');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v + 1);
        let dv: DataView = new DataView(result.buffer);
        let first: number = dv.getInt16(0, true);
        let second: number = dv.getInt16(2, true);
        expect(first).assertEqual(11);
        expect(second).assertEqual(21);
      }

      // --- [5] Verify at(-2) on the map result returns the second element from the end ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v);
        expect(result.at(-2)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_2300
     * @tc.name int16ArrayMapPart01Test023
     * @tc.desc Merged batch (5 tests): chaining and derived consumers: DataView first element, Map-key last element, ceil-halving sum, includes doubling and bound predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a DataView over the map result buffer over from(another Int16Array) reads the doubled first element ---
      {
        let base: Int16Array = Int16Array.of(4, 5);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        let dv: DataView = new DataView(result.buffer);
        expect(dv.getInt16(0, true)).assertEqual(8);
      }

      // --- [2] Verify at(-1) on a map result over from(Map.keys()) returns the mapped last key ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(2, 'a');
        m.set(3, 'b');
        m.set(4, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 10);
        expect(result.at(-1)).assertEqual(40);
      }

      // --- [3] Verify map with a Math.ceil-halving callback over from(Map.values()) keeps the element sum ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        m.set('d', 4);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => Math.ceil(v / 2));
        expect(result.reduce((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(6);
      }

      // --- [4] Verify includes finds the doubled value in a map result over from(another Int16Array) ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3);
        let arr: Int16Array = Int16Array.from(base);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        let has: boolean = result.includes(4);
        expect(has).assertTrue();
      }

      // --- [5] Verify every element of a map result over from(Map.values()) satisfies a bound predicate ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => v * 2);
        let allBelow: boolean = result.every((v: number, i: int, a2: Int16Array): boolean => v < 10);
        expect(allBelow).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_2400
     * @tc.name int16ArrayMapPart01Test024
     * @tc.desc Merged batch (5 tests): callback arguments and external state: once per element, external sum, value plus index, third argument on every call and nested map.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map invokes the callback once per element and returns the mapped values ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let count: int = 0;
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array): number => {
          count = count + 1;
          return value * 10;
        });
        expect(count).assertEqual(2);
        expect(result.$_get(1)).assertEqual(20);
      }

      // --- [2] Verify map callback accumulates external sum ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let sum: number = 0;
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => {
          sum = sum + value;
          return sum;
        });
        expect(result.$_get(0)).assertEqual(2);
        expect(result.$_get(1)).assertEqual(6);
        expect(result.$_get(2)).assertEqual(12);
      }

      // --- [3] Verify the callback receives value and index so per-element results differ ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = src.map((val: number, index: int, array: Int16Array): number => {
          return val + 1;
        });
        expect(result.$_get(0)).assertEqual(11);
        expect(result.$_get(1)).assertEqual(21);
        expect(result.$_get(2)).assertEqual(31);

        let src2: Int16Array = Int16Array.of(10, 20, 30);
        let result2: Int16Array = src2.map((val: number, index: int, array: Int16Array): number => {
          return val - 1;
        });
        expect(result2.$_get(0)).assertEqual(9);
        expect(result2.$_get(1)).assertEqual(19);
        expect(result2.$_get(2)).assertEqual(29);

        let src3: Int16Array = Int16Array.of(5, 10, 15);
        let result3: Int16Array = src3.map((val: number, index: int, array: Int16Array): number => {
          return val * 2;
        });
        expect(result3.$_get(0)).assertEqual(10);
        expect(result3.$_get(1)).assertEqual(20);
        expect(result3.$_get(2)).assertEqual(30);

        let src4: Int16Array = Int16Array.of(10, 20, 30);
        let result4: Int16Array = src4.map((val: number, index: int, array: Int16Array): number => {
          return 0;
        });
        expect(result4.$_get(0)).assertEqual(0);
        expect(result4.$_get(1)).assertEqual(0);
        expect(result4.$_get(2)).assertEqual(0);

        let src5: Int16Array = Int16Array.of(10, 20, 30);
        let result5: Int16Array = src5.map((val: number, index: int, array: Int16Array): number => {
          return 42;
        });
        expect(result5.$_get(0)).assertEqual(42);
        expect(result5.$_get(1)).assertEqual(42);
        expect(result5.$_get(2)).assertEqual(42);

        let src6: Int16Array = Int16Array.of(50, 50, 50);
        let result6: Int16Array = src6.map((val: number, index: int, array: Int16Array): number => {
          return val - index;
        });
        expect(result6.$_get(0)).assertEqual(50);
        expect(result6.$_get(1)).assertEqual(49);
        expect(result6.$_get(2)).assertEqual(48);

        let src7: Int16Array = Int16Array.of(10, 10, 10);
        let result7: Int16Array = src7.map((val: number, index: int, array: Int16Array): number => {
          return val + index;
        });
        expect(result7.$_get(0)).assertEqual(10);
        expect(result7.$_get(1)).assertEqual(11);
        expect(result7.$_get(2)).assertEqual(12);

        let src8: Int16Array = Int16Array.of(5, -10, 15);
        let result8: Int16Array = src8.map((val: number, index: int, array: Int16Array): number => {
          return -val;
        });
        expect(result8.$_get(0)).assertEqual(-5);
        expect(result8.$_get(1)).assertEqual(10);
        expect(result8.$_get(2)).assertEqual(-15);
      }

      // --- [4] Verify map invokes the callback with the source array as its third argument for every element ---
      {
        let arr: Int16Array = new Int16Array([4, 5, 6]);
        let sameRef: number = 0;
        arr.map((_val: number, _index: int, source: Int16Array): number => {
          if (source === arr) {
            sameRef = sameRef + 1;
          }
          return 0;
        });
        expect(sameRef).assertEqual(3);
      }

      // --- [5] Verify nested map inside callback uses inner results ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let inner: Int16Array = new Int16Array([10, 20]);
        let result: Int16Array = arr.map((val: number, index: int, array: Int16Array) => {
          let innerResult: Int16Array = inner.map((iv: number, ii: int, ia: Int16Array) => iv + val);
          return innerResult.$_get(0) + innerResult.$_get(1);
        });
        expect(result.$_get(0)).assertEqual(32);
        expect(result.$_get(1)).assertEqual(34);
        expect(result.$_get(2)).assertEqual(36);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_2500
     * @tc.name int16ArrayMapPart01Test025
     * @tc.desc Merged batch (2 tests): construction sources: floor-half over a Set source and add-one length/sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map with Math.floor(value/2) on an array built by from(Set) halves each element ---
      {
        let s: Set<int> = new Set<int>();
        s.add(10);
        s.add(11);
        let arr: Int16Array = Int16Array.from(s);
        let result: Int16Array = arr.map((value: number): number => Math.floor(value / 2));
        expect(result.$_get(0)).assertEqual(5);
        expect(result.$_get(1)).assertEqual(5);
      }

      // --- [2] Verify map adding 1 on an array built by from(Set) keeps the length and increments the element sum ---
      {
        let s: Set<int> = new Set<int>();
        for (let i: int = 0; i < 20; i++) {
          s.add(i);
        }
        let arr: Int16Array = Int16Array.from(s);
        let result: Int16Array = arr.map((value: number): number => value + 1);
        expect(result.length).assertEqual(20);

        let sum: number = 0;
        for (let i: int = 0; i < result.length; i++) {
          sum = sum + result.$_get(i);
        }
        let e_sum: int = 210;
        expect(sum).assertEqual(e_sum);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_2600
     * @tc.name int16ArrayMapPart01Test026
     * @tc.desc Merged batch (5 tests): element mapping: multiply five, MAX-minus-one, bitwise not, left shift and right shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify map multiplies sequence by 5 ---
      {
        let arr: Int16Array = Int16Array.of(0, 1, 2, 3, 4);
        let result: Int16Array = arr.map((value: number) => value * 5);
        expect(result.$_get(0)).assertEqual(0);
        expect(result.$_get(1)).assertEqual(5);
        expect(result.$_get(2)).assertEqual(10);
        expect(result.$_get(3)).assertEqual(15);
        expect(result.$_get(4)).assertEqual(20);
      }

      // --- [2] Verify map callback MAX-1 32766 stays in range ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => 32766);
        expect(result.at(-1)).assertEqual(32766);
      }

      // --- [3] Verify map callback bitwise not of value ---
      {
        let arr: Int16Array = Int16Array.of(0, -1);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => ~value);
        expect(result.$_get(0)).assertEqual(-1);
        expect(result.$_get(1)).assertEqual(0);
      }

      // --- [4] Verify map callback left shift value by 1 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => value << 1);
        expect(result.$_get(0)).assertEqual(2);
        expect(result.$_get(1)).assertEqual(4);
        expect(result.$_get(2)).assertEqual(6);
      }

      // --- [5] Verify map callback arithmetic right shift by 1 ---
      {
        let arr: Int16Array = Int16Array.of(-4, 8);
        let result: Int16Array = arr.map((value: number, index: int, array: Int16Array) => value >> 1);
        expect(result.$_get(0)).assertEqual(-2);
        expect(result.$_get(1)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_MAP_PART01_2700
     * @tc.name int16ArrayMapPart01Test027
     * @tc.desc Merged batch (5 tests): element mapping: identity metadata, constant plus/minus one, length preserved across source sizes, external Map lookup and +100 offsets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayMapPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify identity map result metadata and element values ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = src.map((val: number, index: int, array: Int16Array): number => {
          return val;
        });
        expect(typeof result).assertEqual('object');
        expect(result.length).assertEqual(3);
        expect(result.BYTES_PER_ELEMENT).assertEqual(2);
        expect(result.$_get(0)).assertEqual(10);
        expect(result.$_get(1)).assertEqual(20);
        expect(result.$_get(2)).assertEqual(30);
        expect(typeof result.length).assertEqual('int');
        expect(result.byteLength).assertEqual(result.length * Int16Array.BYTES_PER_ELEMENT);
        expect(result.byteLength).assertEqual(src.byteLength);
        expect(result.byteLength % 2).assertEqual(0);
        expect(result.byteOffset).assertEqual(0);
        expect(result.buffer.byteLength).assertEqual(result.byteLength);
      }

      // --- [2] Verify map constant -1 and 1 yield uniform elements for all positions ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = src.map((val: number, index: int, array: Int16Array): number => {
          return -1;
        });
        expect(result.$_get(0)).assertEqual(-1);
        expect(result.$_get(1)).assertEqual(-1);
        expect(result.$_get(2)).assertEqual(-1);

        let src2: Int16Array = Int16Array.of(10, 20, 30);
        let result2: Int16Array = src2.map((val: number, index: int, array: Int16Array): number => {
          return 1;
        });
        expect(result2.$_get(0)).assertEqual(1);
        expect(result2.$_get(1)).assertEqual(1);
        expect(result2.$_get(2)).assertEqual(1);
      }

      // --- [3] Verify map keeps length equal to the source length across source sizes ---
      {
        let src: Int16Array = Int16Array.of(10, 20, 30);
        let result: Int16Array = src.map((val: number, index: int, array: Int16Array): number => {
          return val + 1;
        });
        expect(result.length).assertEqual(src.length);

        let src2: Int16Array = new Int16Array(0);
        let result2: Int16Array = src2.map((val: number, index: int, array: Int16Array): number => {
          return val;
        });
        expect(result2.length).assertEqual(0);
        expect(result2.BYTES_PER_ELEMENT).assertEqual(2);

        let src3: Int16Array = Int16Array.of(42);
        let result3: Int16Array = src3.map((val: number, index: int, array: Int16Array): number => {
          return val * 2;
        });
        expect(result3.length).assertEqual(1);

        let src4: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let result4: Int16Array = src4.map((val: number, index: int, array: Int16Array): number => {
          return val;
        });
        expect(result4.length).assertEqual(5);
      }

      // --- [4] Verify map resolves each element through an external Map lookup inside the callback ---
      {
        let table: Map<number, number> = new Map<number, number>();
        table.set(1, 100);
        table.set(2, 200);
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: Int16Array = arr.map((v: number, i: int, a2: Int16Array): number => {
          let hit: number | undefined = table.get(v);
          if (hit === undefined) {
            return 0;
          }
          return hit;
        });
        expect(result.join(',')).assertEqual('100,200,0');
      }

      // --- [5] Verify map adding 100 to an all-minus-one array yields each element incremented by 100 ---
      {
        let arr: Int16Array = Int16Array.of(-1, -1, -1, -1, -1);
        let result: Int16Array = arr.map((value: number): number => value + 100);
        expect(result.$_get(0)).assertEqual(99);
        expect(result.$_get(1)).assertEqual(99);
        expect(result.$_get(2)).assertEqual(99);
        expect(result.$_get(3)).assertEqual(99);
        expect(result.$_get(4)).assertEqual(99);
      }
    });

  });
}
