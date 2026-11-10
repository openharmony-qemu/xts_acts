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

function throwHelper_020(): boolean {
  throw new Error('helper throws');
}

export default function int16ArrayEveryPart01Test(): void {
  describe('Int16ArrayEveryPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0100
     * @tc.name int16ArrayEveryPart01Test001
     * @tc.desc Merged batch (5 tests): predicate exceptions: first-element and index-2 throws with visit counts, out-of-range $_get RangeErrors and propagated exception type/name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() callback throwing on the first element propagates Error with visitCount 1 ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let visitCount: int = 0;
        let caught: boolean = false;
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            visitCount = visitCount + 1;
            throw new Error('predicate error');
          });
          expect().assertFail();
        } catch (e) {
          caught = true;
          expect(e.name).assertEqual('Error');
        }
        expect(caught).assertTrue();
        expect(visitCount).assertEqual(1);
      }

      // --- [2] Verify every() callback throwing at index 2 propagates Error with visitCount 3 ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let visitCount: int = 0;
        let caught: boolean = false;
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            visitCount = visitCount + 1;
            if (index === 2) {
              throw new Error('mid-iteration error');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          caught = true;
          expect(e.name).assertEqual('Error');
        }
        expect(caught).assertTrue();
        expect(visitCount).assertEqual(3);
      }

      // --- [3] Verify every() propagates RangeError when its predicate reads $_get(-1) and $_get(2147483647) out of range ---
      {
        let sources: int[][] = [[5, 10, 15], [7, 14, 21]];
        let readIndices: int[] = [-1, 2147483647];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let readIndex: int = readIndices[i];
          try {
            arr.every((element: number, index: int, array: Int16Array): boolean => {
              return typeof array.$_get(readIndex) === 'undefined';
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        }
      }

      // --- [4] Verify every() propagates the RangeError when its predicate reads $_get(array.length) out of range ---
      {
        let arr: Int16Array = new Int16Array([11, 22, 33]);
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            return typeof array.$_get(array.length) === 'undefined';
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [5] Verify every() propagates predicate exception type and name ---
      {
        let cases: string[][] = [
          ['TypeError', 'type mismatch in predicate'],
          ['RangeError', 'out of range in predicate'],
          ['Error', 'custom predicate failure'],
          ['TypeError', 'undocumented error name'],
          ['Error', 'predicate failed']
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([1, 2, 3]);
          try {
            arr.every((element: number, index: int, array: Int16Array): boolean => {
              if (cases[i][0] === 'TypeError') {
                throw new TypeError(cases[i][1]);
              } else if (cases[i][0] === 'RangeError') {
                throw new RangeError(cases[i][1]);
              }
              throw new Error(cases[i][1]);
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual(cases[i][0]);
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0200
     * @tc.name int16ArrayEveryPart01Test002
     * @tc.desc Merged batch (4 tests): predicate exceptions: empty source never calls the predicate, plus Error, TypeError and RangeError propagation from different sources.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() on Int16Array.from(an empty int Array) returns true without calling a throwing predicate so the call count stays 0 ---
      {
        let empty: int[] = [];
        let arr: Int16Array = Int16Array.from(empty);
        let calls: int = 0;
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          calls = calls + 1;
          throw new Error('must not be called');
        });
        expect(result).assertTrue();
        expect(calls).assertEqual(0);
      }

      // --- [2] Verify every() propagates an Error thrown by the predicate on a copy-constructed array ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3);
        let arr: Int16Array = new Int16Array(base);
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            throw new Error('boom');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [3] Verify every() propagates a TypeError thrown by the predicate on from(Int16Array) and from(Array, mapfn) sources ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3);
        let values: int[] = [1, 2, 3];
        let sources: Int16Array[] = [Int16Array.from(base), Int16Array.from(values, (v: int, _k: double): double => v)];
        for (let s: int = 0; s < sources.length; s++) {
          let arr: Int16Array = sources[s];
          try {
            arr.every((element: number, _index: int, _array: Int16Array): boolean => {
              throw new TypeError('bad');
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        }
      }

      // --- [4] Verify every() propagates a RangeError thrown by the predicate on a from(Map.values()) source ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 2);
        let arr: Int16Array = Int16Array.from(m.values());
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            throw new RangeError('out');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0300
     * @tc.name int16ArrayEveryPart01Test003
     * @tc.desc Merged batch (5 tests): short-circuit, visit order and call counts: near-tail failure, first-failure exit versus all-pass, ascending index visits and compound predicates.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() returns false after 199 predicate calls when only the near-tail element at index 198 fails ---
      {
        let arr: Int16Array = new Int16Array(200);
        for (let i: int = 0; i < 200; i++) {
          arr.$_set(i, 1);
        }
        arr.$_set(198, 0);
        let calls: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          calls = calls + 1;
          return element !== 0;
        });
        expect(result).assertFalse();
        expect(calls).assertEqual(199);
      }

      // --- [2] Verify every() short-circuits at the first failing element yet visits every element when all pass ---
      {
        let arr: Int16Array = new Int16Array([3, 0, 5]);
        let visitCount: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          visitCount = visitCount + 1;
          return element > 0;
        });
        expect(result).assertFalse();
        expect(visitCount).assertEqual(2);

        let source: int[] = [];
        for (let k: int = 1; k <= 100; k++) {
          source.push(k);
        }
        let arrBig: Int16Array = new Int16Array(source);
        let visitCountBig: int = 0;
        let resultBig: boolean = arrBig.every((element: number, index: int, array: Int16Array): boolean => {
          visitCountBig = visitCountBig + 1;
          return element > 0;
        });
        expect(resultBig).assertTrue();
        expect(visitCountBig).assertEqual(100);
      }

      // --- [3] Verify every() visits each index ascending while a non-negative index predicate holds ---
      {
        let arr: Int16Array = new Int16Array([7, 14, 21]);
        let lastIndex: int = -1;
        let allVisited: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          lastIndex = index;
          return index >= 0;
        });
        expect(allVisited).assertTrue();
        expect(lastIndex).assertEqual(2);
      }

      // --- [4] Verify every() calls the predicate once and returns false when the first element fails ---
      {
        let arr: Int16Array = new Int16Array([0, 1, 2]);
        let visitCount: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          visitCount = visitCount + 1;
          return element > 0;
        });
        expect(result).assertFalse();
        expect(visitCount).assertEqual(1);
      }

      // --- [5] Verify every() with a compound && predicate stops at the first element failing either condition ---
      {
        let arr: Int16Array = new Int16Array([6, 12, 0, 18, 24]);
        let visitCount: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          visitCount = visitCount + 1;
          return element % 6 === 0 && element !== 0;
        });
        expect(result).assertFalse();
        expect(visitCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0400
     * @tc.name int16ArrayEveryPart01Test004
     * @tc.desc Merged batch (5 tests): non-mutation and buffer integrity: buffer comparison, with() element, and lengths kept by slice, subarray and Array.from.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate comparing array.buffer with a sibling view buffer by reference returns true when both views share one ArrayBuffer ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 0, 4);
        let sibling: Int16Array = new Int16Array(buf, 0, 4);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.buffer === sibling.buffer;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate testing that with(index,element) keeps the element at that index returns true ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 4);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.with(_index, element).$_get(_index) === element;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate testing that an unfilled slice keeps the array length returns true ---
      {
        let arr: Int16Array = Int16Array.of(2, 7, 1, 8);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.slice().length === _array.length;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate testing that the remaining subarray from the index keeps the tail length returns true ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.subarray(_index).length === _array.length - _index;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate testing that Array.from of the array keeps the same length returns true ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Array.from(_array).length === _array.length;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0500
     * @tc.name int16ArrayEveryPart01Test005
     * @tc.desc Merged batch (5 tests): non-mutation and buffer integrity: contents preserved after false/true results, order kept, and sibling views unaffected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() returning false leaves the array contents intact ---
      {
        let arr: Int16Array = new Int16Array([42, 10, 20]);
        let allBig: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 100;
        });
        expect(allBig).assertFalse();
        expect(arr.join(',')).assertEqual('42,10,20');
      }

      // --- [2] Verify every() leaves all elements unchanged after true and false results ---
      {
        let arr: Int16Array = new Int16Array([7, 8, 9]);
        let v0: number = arr.$_get(0);
        let v1: number = arr.$_get(1);
        let v2: number = arr.$_get(2);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(arr.$_get(0)).assertEqual(v0);
        expect(arr.$_get(1)).assertEqual(v1);
        expect(arr.$_get(2)).assertEqual(v2);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 100;
        });
        expect(arr.$_get(0)).assertEqual(v0);
        expect(arr.$_get(1)).assertEqual(v1);
        expect(arr.$_get(2)).assertEqual(v2);
      }

      // --- [3] Verify every() preserves element order after call ---
      {
        let arr: Int16Array = new Int16Array([100, 200, 300]);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        expect(arr.$_get(0)).assertEqual(100);
        expect(arr.$_get(1)).assertEqual(200);
        expect(arr.$_get(2)).assertEqual(300);
      }

      // --- [4] Verify every() on one view does not affect sibling view data ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        let view2: Int16Array = new Int16Array(buf, 0, 3);
        view1.$_set(0, 100);
        view1.$_set(1, 200);
        let vBefore: number = view2.$_get(1);
        view1.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(view2.$_get(1)).assertEqual(vBefore);
      }

      // --- [5] Verify every() leaves sibling view original data readable ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        let view2: Int16Array = new Int16Array(buf, 0, 3);
        view1.$_set(0, 300);
        view1.every((element: number, index: int, array: Int16Array): boolean => {
          return element !== 0;
        });
        expect(view2.$_get(0)).assertEqual(300);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0600
     * @tc.name int16ArrayEveryPart01Test006
     * @tc.desc Merged batch (4 tests): non-mutation and buffer integrity: rebuilt empty array, single element, length stability and stored wrapped values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() on an empty array rebuilt from a zero-length array returns true and keeps the length zero ---
      {
        let empty: Int16Array = new Int16Array(0);
        let arr: Int16Array = Int16Array.from(empty);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
        expect(arr.length).assertEqual(0);
      }

      // --- [2] Verify every() on a single-element array whose element passes the predicate returns true and keeps length one ---
      {
        let arr: Int16Array = Int16Array.of(42);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element === 42;
        });
        expect(result).assertTrue();
        expect(arr.length).assertEqual(1);
      }

      // --- [3] Verify every() leaves the array length unchanged while iterating $_set wrapped and truncated values ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 3.7);
        arr.$_set(1, 32768);
        arr.$_set(2, 0);
        let lenBefore: int = arr.length;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element >= -32768 && element <= 32767;
        });
        expect(arr.length).assertEqual(lenBefore);
      }

      // --- [4] Verify every() leaves stored $_set wrapped values unchanged after iteration ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 32768);
        arr.$_set(1, -32769);
        let v0: number | undefined = arr.$_get(0);
        let v1: number | undefined = arr.$_get(1);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element >= -32768;
        });
        expect(arr.$_get(0)).assertEqual(v0);
        expect(arr.$_get(1)).assertEqual(v1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0700
     * @tc.name int16ArrayEveryPart01Test007
     * @tc.desc Merged batch (4 tests): boundary and truncation visibility: -1/MAX/MIN equality, range-spanning bounds, and values one above/below the int16 range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() equality of -1, int16.MAX and int16.MIN elements read back by $_get returns true ---
      {
        let values: int[] = [-1, 32767, -32768];
        for (let i: int = 0; i < values.length; i++) {
          let arr: Int16Array = new Int16Array([values[i]]);
          let target: number = arr.$_get(0);
          let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
            return element === target;
          });
          expect(result).assertTrue();
        }
      }

      // --- [2] Verify every() predicate element <= 32767 and element >= -32768 both return true on one array spanning both int16 bounds ---
      {
        let arr: Int16Array = Int16Array.of(32767, -32768);
        let atMostMax: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element <= 32767;
        });
        expect(atMostMax).assertTrue();
        let atLeastMin: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= -32768;
        });
        expect(atLeastMin).assertTrue();
      }

      // --- [3] Verify every() over the int16 boundary values is true within range and false for a positivity check ---
      {
        let arr: Int16Array = new Int16Array([32767, -32768, 0, -1, 1]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element >= -32768 && element <= 32767;
        });
        expect(result).assertTrue();
        let result2: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result2).assertFalse();
      }

      // --- [4] Verify every() equality against one above int16.MAX and one below int16.MIN on in-range arrays returns false ---
      {
        let sources: int[][] = [[32767], [-32768, 200]];
        let bounds: int[] = [32767, -32768];
        let offsets: int[] = [1, -1];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let target: int = bounds[i] + offsets[i];
          let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
            return element === target;
          });
          expect(result).assertFalse();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0800
     * @tc.name int16ArrayEveryPart01Test008
     * @tc.desc Merged batch (5 tests): boundary and truncation visibility: wrapped $_set values, range predicates, positivity failure, fractional truncation and NaN/Infinity-to-zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() sees both wrapped-negative $_set values ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 32768);
        arr.$_set(1, 32769);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element < 0;
        });
        expect(result).assertTrue();
        let result2: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result2).assertFalse();
      }

      // --- [2] Verify every() predicate element<=32767 and element>=-32768 returns true on an array built by from(Set) holding the int16 boundaries ---
      {
        let s: Set<int> = new Set<int>();
        s.add(32767);
        s.add(-32768);
        s.add(0);
        let arr: Int16Array = Int16Array.from(s);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element <= 32767 && element >= -32768;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate element>0 on a length-constructed array filled via $_set with wrapped values returns false after one call ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 32768);
        arr.$_set(1, 32767);
        arr.$_set(2, -32769);
        let calls: int = 0;
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          calls = calls + 1;
          return element > 0;
        });
        expect(result).assertFalse();
        expect(calls).assertEqual(1);
      }

      // --- [4] Verify every() predicate observing $_set fractional truncation reads the truncated values on a length-constructed array ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 3.9);
        arr.$_set(1, -2.9);
        let result: boolean = arr.every((element: number, index: int, _array: Int16Array): boolean => {
          if (index === 0) {
            return element === 3;
          }
          return element === -2;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate observing NaN and Infinity $_set values converted to 0 returns true on a length-constructed array ---
      {
        let arr: Int16Array = new Int16Array(2);
        let nan: number = Number.NaN;
        arr.$_set(0, nan);
        arr.$_set(1, Number.POSITIVE_INFINITY);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element === 0;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_0900
     * @tc.name int16ArrayEveryPart01Test009
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: zero comparisons, non-zero across signs and bounds, inequality, a positive constant and parity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate testing element equality against zero returns false ---
      {
        let arr: Int16Array = new Int16Array([0, 5, 0]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === 0;
        });
        expect(result).assertFalse();
      }

      // --- [2] Verify every() predicate testing non-zero elements returns true across sign and int16 boundary values ---
      {
        let arr: Int16Array = new Int16Array([3, -3, 9, -1, 1, 32767, -32768]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element !== 0;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate testing element inequality against zero returns false ---
      {
        let arr: Int16Array = new Int16Array([7, 0, 13]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element !== 0;
        });
        expect(result).assertFalse();
      }

      // --- [4] Verify every() predicate testing element equality against an ordinary positive constant returns true ---
      {
        let arr: Int16Array = new Int16Array([10, 0, 0]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          if (index === 0) {
            return element === 10;
          }
          return true;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate testing even elements across alternating parity returns true ---
      {
        let arr: Int16Array = new Int16Array([2, 1, 4, 3]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          if (index % 2 === 0) {
            return element % 2 === 0;
          }
          return element % 2 === 1;
        });
        expect(result).assertTrue();

        let arr2: Int16Array = new Int16Array([1, 0, 3, 2]);
        let result2: boolean = arr2.every((element: number, index: int, array: Int16Array): boolean => {
          if (index % 2 === 1) {
            return element % 2 === 0;
          }
          return element % 2 === 1;
        });
        expect(result2).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1000
     * @tc.name int16ArrayEveryPart01Test010
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: join equality, slice/$_get, subarray length, map doubling and Math.abs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate calling array.join with comma equals the full joined string returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.join(',') === '1,2,3';
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate calling array.slice(index,index+1).$_get(0) equals element returns true for each element ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.slice(index, index + 1).$_get(0) === element;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate calling array.subarray(index,index+1).length equals 1 returns true for each element ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.subarray(index, index + 1).length === 1;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate calling array.map(doubling) and reading the current index equals twice the element returns true ---
      {
        let arr: Int16Array = Int16Array.of(3, 5, 7);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.map((v: number, _i: int, _a: Int16Array): number => v * 2).$_get(index) === element * 2;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate using Math.abs(element) below a bound returns true ---
      {
        let arr: Int16Array = Int16Array.of(-5, 0, 5);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Math.abs(element) < 1000;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1100
     * @tc.name int16ArrayEveryPart01Test011
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: startsWith, split length, includes, reversed-mirror and sorted-read comparisons.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate testing that the one-element subarray at the index starts with the element returns true ---
      {
        let arr: Int16Array = Int16Array.of(9, 8, 7);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          let oneElement: Int16Array = _array.subarray(_index, _index + 1);
          return oneElement.length === 1 && oneElement.at(0) === element;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate testing that the dash-joined string splits back to the array length returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.join('-').split('-').length === _array.length;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate testing that includes finds the element from the current index returns true ---
      {
        let arr: Int16Array = new Int16Array([4 as number, 9 as number, 14 as number]);
        let afterFirst: boolean = arr.includes(4, 1);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.includes(element, index);
        });
        expect(afterFirst).assertFalse();
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate comparing each element with the reversed array read from the mirrored index returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.toReversed().$_get(_array.length - 1 - _index) === element;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate comparing each element with the sorted read at the same index returns true on an already sorted array ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.toSorted().$_get(_index) === element;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1200
     * @tc.name int16ArrayEveryPart01Test012
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: lastIndexOf, all-negative, byteOffset, at(-length-1) definedness and Math.ceil on halved negatives.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate testing that lastIndexOf equals the current index on distinct elements returns true ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.lastIndexOf(element) === _index;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() returns true when the predicate requires all elements to be negative ---
      {
        let arr: Int16Array = new Int16Array([-1, -1, -1, -1]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element < 0;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate reading array.byteOffset>=0 returns true on an array built by from(Array, mapfn) ---
      {
        let src: int[] = [5, 10];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v - k);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.byteOffset >= 0;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate testing that at(-length-1) is a defined element returns false ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.at(0 - _array.length - 1) !== undefined;
        });
        expect(result).assertFalse();
      }

      // --- [5] Verify every() predicate requiring Math.ceil of each halved negative element to stay at most zero returns true ---
      {
        let arr: Int16Array = Int16Array.of(-5, -3, -1);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Math.ceil(element / 2) <= 0;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1300
     * @tc.name int16ArrayEveryPart01Test013
     * @tc.desc Merged batch (5 tests): construction sources and views: indexOf/fromIndex, copy-constructed, Set, identity mapfn and toReversed copies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() indexOf(element, index) equals the index and fromIndex skips earlier duplicates ---
      {
        let arr: Int16Array = new Int16Array([5 as number, 5 as number, 15 as number]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.indexOf(element, index) === index;
        });
        let skipped: int = arr.indexOf(5, 1);
        expect(result).assertTrue();
        expect(skipped).assertEqual(1);
      }

      // --- [2] Verify every() predicate element>=0 returns true on a copy-constructed array ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(1, 2, 3));
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= 0;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate element>0 returns true on an array built by from(Set) ---
      {
        let s: Set<int> = new Set<int>();
        s.add(2);
        s.add(4);
        s.add(6);
        let arr: Int16Array = Int16Array.from(s);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate element%3===0 returns true on an array built by from(Array, identity mapfn) ---
      {
        let src: int[] = [3, 6, 9];
        let arr: Int16Array = Int16Array.from(src, (v: int, _k: double): double => v);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element % 3 === 0;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate element>0 returns true on a toReversed() copy while the original is unmutated ---
      {
        let arr: Int16Array = Int16Array.of(4, 3, 2, 1);
        let rev: Int16Array = arr.toReversed();
        let result: boolean = rev.every((element: number, _index: int, _array: Int16Array): boolean => element > 0);
        expect(result).assertTrue();
        expect(arr.$_get(0)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1400
     * @tc.name int16ArrayEveryPart01Test014
     * @tc.desc Merged batch (5 tests): construction sources and views: Int16Array source, Map cross-check, offset subarray, $_set-filled array and all-negative source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate index>=0 returns true on an array built by from(another Int16Array) ---
      {
        let base: Int16Array = Int16Array.of(5, 6);
        let arr: Int16Array = Int16Array.from(base);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _index >= 0;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() cross-checks each element of an array built by from(Map.values()) against the value looked up by that element's key ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 3);
        m.set('b', 6);
        m.set('c', 9);
        let arr: Int16Array = Int16Array.from(m.values());
        let keys: string[] = Array.from(m.keys());
        let looked: number[] = [];
        for (let i: int = 0; i < keys.length; i++) {
          looked.push(m.get(keys[i]) as number);
        }
        let result: boolean = arr.every((element: number, index: int, _array: Int16Array): boolean => {
          return element === looked[index];
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate element>=0 on a subarray view whose byteOffset is two returns true ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let base: Int16Array = new Int16Array(buf);
        base.$_set(0, 1);
        base.$_set(1, 2);
        base.$_set(2, 3);
        base.$_set(3, 4);
        let view: Int16Array = base.subarray(1, 3);
        let result: boolean = view.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= 0 && _array.byteOffset === 2;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate element>0 returns true on a length-constructed array filled via $_set ---
      {
        let arr: Int16Array = new Int16Array(5);
        for (let i: int = 0; i < 5; i++) {
          arr.$_set(i, i + 1);
        }
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate element>0 on an all-negative from(another Int16Array) source returns false after one call ---
      {
        let base: Int16Array = Int16Array.of(-3, -6, -9);
        let arr: Int16Array = Int16Array.from(base);
        let calls: int[] = [];
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          calls.push(_index);
          return element > 0;
        });
        expect(result).assertFalse();
        expect(calls.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1500
     * @tc.name int16ArrayEveryPart01Test015
     * @tc.desc Merged batch (4 tests): predicate result evaluation: array identity, element-versus-length failure, index range and compound positivity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate array === arr returns true ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array === arr;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate element < array.length returns false ---
      {
        let arr: Int16Array = new Int16Array([5, 6, 7]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element < array.length;
        });
        expect(result).assertFalse();
      }

      // --- [3] Verify every() predicate index >= 0 && index < array.length returns true ---
      {
        let arr: Int16Array = new Int16Array([2, 4, 6]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return index >= 0 && index < array.length;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate element > 0 && index >= 0 && array.length > 0 returns true ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0 && index >= 0 && array.length > 0;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1600
     * @tc.name int16ArrayEveryPart01Test016
     * @tc.desc Merged batch (5 tests): predicate result evaluation: parity, index-aligned values, if-branch selection, failing-position variants and some() over outcomes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() returns true when a simple parity predicate holds for all elements ---
      {
        let arr: Int16Array = new Int16Array([2, 4, 6]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element % 2 === 0;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() returns true when predicate checks index-aligned values ---
      {
        let arr: Int16Array = new Int16Array([0, 10, 20]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === index * 10;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify an if statement driven by every() selects the branch that reads the leading even element ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let picked: number = -1;
        if (arr.every((element: number): boolean => element % 2 === 0)) {
          picked = arr.$_get(0);
        } else {
          picked = -1;
        }
        expect(picked).assertEqual(2);
      }

      // --- [4] Verify every() returns false when the failing element is at the first, middle or last position, when it is zero, and when no element matches ---
      {
        let firstFails: Int16Array = new Int16Array([-1, 2, 3]);
        expect(firstFails.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        })).assertFalse();
        let middleFails: Int16Array = new Int16Array([2, -4, 6]);
        expect(middleFails.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        })).assertFalse();
        let lastFails: Int16Array = new Int16Array([2, 4, -6]);
        expect(lastFails.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        })).assertFalse();
        let zeroFirst: Int16Array = new Int16Array([0, 5, 10]);
        expect(zeroFirst.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        })).assertFalse();
        let noneMatch: Int16Array = new Int16Array([1, 2, 3]);
        expect(noneMatch.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 100;
        })).assertFalse();
      }

      // --- [5] Verify two every() outcomes collected into a boolean Array and reduced by some() yields true when one outcome is true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let flags: boolean[] = [];
        flags.push(arr.every((element: number, _index: int, _array: Int16Array): boolean => element > 0));
        flags.push(arr.every((element: number, _index: int, _array: Int16Array): boolean => element % 2 === 0));
        expect(flags[0]).assertTrue();
        expect(flags[1]).assertFalse();

        let any: boolean = flags.some((f: boolean): boolean => f);
        expect(any).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1700
     * @tc.name int16ArrayEveryPart01Test017
     * @tc.desc Merged batch (5 tests): predicate result evaluation: all-negative failure, multiples of five, identical elements, multiples of one hundred and a while-loop increment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate element>0 on an all-negative array returns false ---
      {
        let arr: Int16Array = new Int16Array([-1, -2, -3]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertFalse();
      }

      // --- [2] Verify every() returns true when all elements are negative multiples of five ---
      {
        let arr: Int16Array = Int16Array.of(-5, -10, -15);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element < 0 && element % 5 === 0;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() returns true when all four elements are identical ---
      {
        let arr: Int16Array = Int16Array.of(8, 8, 8, 8);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element === 8;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() returns true when all elements are positive multiples of one hundred ---
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0 && element % 100 === 0;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() drives a while loop that increments odd elements until the array is all even ---
      {
        let arr: Int16Array = Int16Array.of(1, 3, 6);
        let i: int = 0;
        let limit: int = 10;
        while (i < limit && !arr.every((element: number, _index: int, _array: Int16Array): boolean => element % 2 === 0)) {
          let cur: number = arr.$_get(i);
          arr.$_set(i, cur + 1);
          i = i + 1;
        }

        expect(i).assertEqual(2);
        expect(arr.$_get(0)).assertEqual(2);
        expect(arr.$_get(1)).assertEqual(4);
        expect(arr.$_get(2)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1800
     * @tc.name int16ArrayEveryPart01Test018
     * @tc.desc Merged batch (5 tests): predicate exceptions: single-element throw, side effect before throw, empty no-call, helper throw and mid-iteration RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() throws Error on single-element array and propagates ---
      {
        let arr: Int16Array = new Int16Array([42]);
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            throw new Error('single element throw');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify every() applies side effect before predicate throws Error ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let sideEffect: int = 0;
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            sideEffect = 999;
            throw new Error('after side effect');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(sideEffect).assertEqual(999);
      }

      // --- [3] Verify every() on empty array returns true without calling predicate throw ---
      {
        let arr: Int16Array = new Int16Array(0);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          throw new Error('should not be called');
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() propagates Error thrown by helper called from predicate ---
      {
        let arr: Int16Array = new Int16Array([3, 6, 9]);
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            return throwHelper_020();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [5] Verify every() propagates a RangeError thrown mid-iteration after visiting the earlier elements ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let visitCount: int = 0;
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            visitCount = visitCount + 1;
            if (index === 2) {
              throw new RangeError('range error at index 2');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(visitCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_1900
     * @tc.name int16ArrayEveryPart01Test019
     * @tc.desc Merged batch (4 tests): predicate exceptions: DataView-backed throw, caught $_get(-1) and $_get(length+1) RangeErrors, and a side effect before the second throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() propagates an Error thrown after reading the DataView element of the backing buffer ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        arr.$_set(2, 3);
        let dv: DataView = new DataView(buf);
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            let raw: number = dv.getInt16(_index * 2, true);
            if (raw > 0) {
              throw new Error('dv');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify every() predicate that catches the RangeError from an out-of-range $_get(-1) returns false after one call on a from(another Int16Array) source ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3);
        let arr: Int16Array = Int16Array.from(base);
        let calls: int[] = [];
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          calls.push(_index);
          try {
            _array.$_get(-1);
            expect().assertFail();
            return false;
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
            return false;
          }
        });
        expect(result).assertFalse();
        expect(calls.length).assertEqual(1);
      }

      // --- [3] Verify every() predicate that catches the RangeError from $_get(length+1) returns false on a from(Map.values()) source ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 4);
        m.set('b', 5);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          try {
            let pastEnd: number = _array.$_get(_array.length + 1);
            expect().assertFail();
            return pastEnd === element;
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
            return false;
          }
        });
        expect(result).assertFalse();
      }

      // --- [4] Verify every() side effect recorded before the predicate throws on the second element is kept ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let touched: int[] = [];
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            touched.push(_index);
            if (_index === 1) {
              throw new Error('stop');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(touched.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_2000
     * @tc.name int16ArrayEveryPart01Test020
     * @tc.desc Merged batch (5 tests): short-circuit, visit order and call counts: last-element failure, ascending visits, length-many calls, empty zero calls and no index-1 side effect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() visits all elements and returns false when only the last element fails ---
      {
        let arr: Int16Array = new Int16Array([8, -1]);
        let visitCount: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          visitCount = visitCount + 1;
          return element >= 0;
        });
        expect(result).assertFalse();
        expect(visitCount).assertEqual(2);
      }

      // --- [2] Verify every() visits the indices zero one two in ascending order while the predicate holds ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        let visited: int[] = [];
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          visited.push(index);
          return element > 0;
        });
        expect(result).assertTrue();
        expect(visited.length).assertEqual(3);
        expect(visited[0]).assertEqual(0);
        expect(visited[1]).assertEqual(1);
        expect(visited[2]).assertEqual(2);
      }

      // --- [3] Verify every() calls predicate length times when all match ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let callCount: int = 0;
        let sum: number = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          callCount = callCount + 1;
          sum = sum + element;
          return element > 0;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(3);
        expect(sum).assertEqual(6);
      }

      // --- [4] Verify every() calls predicate zero times on empty array ---
      {
        let arr: Int16Array = new Int16Array([]);
        let callCount: int = 0;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          callCount = callCount + 1;
          return false;
        });
        expect(callCount).assertEqual(0);
      }

      // --- [5] Verify every() short-circuit prevents index-1 predicate side effects ---
      {
        let arr: Int16Array = new Int16Array([0, 100, 100]);
        let sideEffect: int = 0;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          if (index === 1) {
            sideEffect = 999;
          }
          return element > 0;
        });
        expect(sideEffect).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_2100
     * @tc.name int16ArrayEveryPart01Test021
     * @tc.desc Merged batch (5 tests): non-mutation and buffer integrity: entries-derived keys, length after true/false, single-element length, ArrayBuffer view and larger arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate testing that the keys collected from entries keep the array length returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 5, 9, 13);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          let ks: int[] = [];
          for (const e of _array.entries()) {
            ks.push(e[0]);
          }
          return ks.length === _array.length;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() keeps length unchanged after true and false results ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let lenBefore: int = arr.length;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(arr.length).assertEqual(lenBefore);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 100;
        });
        expect(arr.length).assertEqual(lenBefore);
      }

      // --- [3] Verify every() keeps length 1 after single match and single non-match ---
      {
        let arr: Int16Array = new Int16Array([42]);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === 42;
        });
        expect(arr.length).assertEqual(1);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === 99;
        });
        expect(arr.length).assertEqual(1);
      }

      // --- [4] Verify every() keeps length unchanged on ArrayBuffer view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 10);
        arr.$_set(1, 20);
        arr.$_set(2, 30);
        let lenBefore: int = arr.length;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(arr.length).assertEqual(lenBefore);
      }

      // --- [5] Verify every() keeps length unchanged on Int16Array.of and larger arrays ---
      {
        let arrays: Int16Array[] = [Int16Array.of(5, 10, 15), new Int16Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])];
        for (let a: int = 0; a < arrays.length; a++) {
          let arr: Int16Array = arrays[a];
          let lenBefore: int = arr.length;
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            return element > 0;
          });
          expect(arr.length).assertEqual(lenBefore);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_2200
     * @tc.name int16ArrayEveryPart01Test022
     * @tc.desc Merged batch (5 tests): non-mutation and buffer integrity: raw bytes, offset-view isolation, buffer identity, repeated evaluation and copy-constructed source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() does not change underlying ArrayBuffer raw bytes ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 123);
        arr.$_set(1, 456);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        let verify: Int16Array = new Int16Array(buf);
        expect(verify.$_get(0)).assertEqual(123);
        expect(verify.$_get(1)).assertEqual(456);
      }

      // --- [2] Verify every() on offset view does not affect zero-offset view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let baseView: Int16Array = new Int16Array(buf, 0, 4);
        let offsetView: Int16Array = new Int16Array(buf, 2, 2);
        baseView.$_set(1, 555);
        offsetView.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        expect(baseView.$_get(1)).assertEqual(555);
        offsetView.$_set(0, 777);
        baseView.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        expect(offsetView.$_get(0)).assertEqual(777);
      }

      // --- [3] Verify every() keeps same buffer ArrayBuffer reference ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        let bufBefore: ArrayBuffer = arr.buffer;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        expect(arr.buffer).assertEqual(bufBefore);
      }

      // --- [4] Verify every() re-evaluates current element values on a repeated call ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let r1: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(r1).assertTrue();
        arr.$_set(1, -20);
        let r2: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(r2).assertFalse();
      }

      // --- [5] Verify every() predicate element>0 returns true on a copy-constructed array while the source stays unchanged ---
      {
        let base: Int16Array = Int16Array.of(3, 6, 9);
        let arr: Int16Array = new Int16Array(base);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
        expect(base.join(',')).assertEqual('3,6,9');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_2300
     * @tc.name int16ArrayEveryPart01Test023
     * @tc.desc Merged batch (5 tests): empty, single-element and degenerate arrays: empty/single matches, uniform values, at(-1) definedness and non-matching single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() on an empty array returns true and on a single matching element returns true ---
      {
        let arr: Int16Array = new Int16Array([] as number[]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();

        let arr2: Int16Array = new Int16Array([42]);
        let result2: boolean = arr2.every((element: number, index: int, array: Int16Array): boolean => {
          return element === 42;
        });
        expect(result2).assertTrue();
      }

      // --- [2] Verify every() returns true for a single-element array and for a uniformly valued array ---
      {
        let arr: Int16Array = new Int16Array([1]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === 1;
        });
        expect(result).assertTrue();

        let arr2: Int16Array = new Int16Array([17, 17, 17]);
        let result2: boolean = arr2.every((element: number, index: int, array: Int16Array): boolean => {
          return element === 17;
        });
        expect(result2).assertTrue();
      }

      // --- [3] Verify every() predicate testing that at(-1) is defined returns true on a non-empty array ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.at(-1) !== undefined;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() on a single matching element returns true and exposes that element ---
      {
        let arr: Int16Array = new Int16Array([99]);
        let echoed: number = 0;
        let ok: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          echoed = element;
          return echoed === 99;
        });
        expect(ok).assertTrue();
        expect(echoed).assertEqual(99);
      }

      // --- [5] Verify every() returns false for single non-matching element ---
      {
        let arr: Int16Array = new Int16Array([5]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 10;
        });
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_2400
     * @tc.name int16ArrayEveryPart01Test024
     * @tc.desc Merged batch (5 tests): boundary and truncation visibility: int16 range bounds, MAX failure, Math.abs magnitude, NaN/Infinity-to-zero and wrapped values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() returns true when the predicate bounds elements within the int16 min/max range ---
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element >= -32768 && element <= 32767;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() returns false when first int16.MAX fails predicate ---
      {
        let arr: Int16Array = new Int16Array([32767, 0, 0]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element < 10000;
        });
        expect(result).assertFalse();
      }

      // --- [3] Verify every() predicate using Math.abs(element) at most the int16 max magnitude returns true on the boundaries ---
      {
        let arr: Int16Array = Int16Array.of(32767, -32768, 0);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Math.abs(element) <= 32768;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate sees NaN and infinities converted to 0 ---
      {
        let arr: Int16Array = new Int16Array([Number.NaN]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === 0;
        });
        expect(result).assertTrue();

        let arr2: Int16Array = new Int16Array([Number.NaN, 5]);
        let result2: boolean = arr2.every((element: number, index: int, array: Int16Array): boolean => {
          return element !== 0;
        });
        expect(result2).assertFalse();

        let arr3: Int16Array = new Int16Array([Number.POSITIVE_INFINITY]);
        let result3: boolean = arr3.every((element: number, index: int, array: Int16Array): boolean => {
          return element >= 0;
        });
        expect(result3).assertTrue();

        let arr4: Int16Array = new Int16Array([Number.NEGATIVE_INFINITY]);
        let result4: boolean = arr4.every((element: number, index: int, array: Int16Array): boolean => {
          return element < 1;
        });
        expect(result4).assertTrue();
      }

      // --- [5] Verify every() predicate sees $_set wrapped int16 boundary values ---
      {
        let cases: int[][] = [[32768, -32768], [-32769, 32767]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array(1);
          arr.$_set(0, cases[i][0]);
          let r1: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
            return element === cases[i][1];
          });
          expect(r1).assertTrue();
          let r2: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
            return cases[i][1] < 0 ? element < 0 : element > 0;
          });
          expect(r2).assertTrue();
        }
        let arrNeg: Int16Array = new Int16Array(1);
        arrNeg.$_set(0, 32768);
        let r3: boolean = arrNeg.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(r3).assertFalse();

        let arrPair: Int16Array = new Int16Array(2);
        arrPair.$_set(0, 32768);
        arrPair.$_set(1, -32769);
        let r4: boolean = arrPair.every((element: number, index: int, array: Int16Array): boolean => {
          if (index === 0) {
            return element === -32768;
          }
          return element === 32767;
        });
        expect(r4).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_2500
     * @tc.name int16ArrayEveryPart01Test025
     * @tc.desc Merged batch (5 tests): boundary and truncation visibility: MAX/MIN equality, NaN and signed Infinity to zero, 32768/65535 wraps and base values in range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate testing element equals the int16.MAX or int16.MIN boundary returns true on an array built by from(Set) ---
      {
        let s: Set<int> = new Set<int>();
        s.add(32767);
        s.add(-32768);
        let arr: Int16Array = Int16Array.from(s);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element === 32767 || element === -32768;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate observes NaN written by $_set as zero ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, Double.NaN);
        arr.$_set(1, 5);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= 0;
        });
        expect(result).assertTrue();
        expect(arr.$_get(0)).assertEqual(0);
      }

      // --- [3] Verify every() predicate observes negative and positive Infinity written by $_set as zero on a three-element array ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, Double.NEGATIVE_INFINITY);
        arr.$_set(1, Double.POSITIVE_INFINITY);
        arr.$_set(2, 1);
        expect(arr.join(',')).assertEqual('0,0,1');
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= 0;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate observes $_set wraps of 32768 to -32768 and 65535 to -1 ---
      {
        let writes: int[] = [32768, 65535];
        let stored: int[] = [-32768, -1];
        let predicateKinds: int[] = [0, 1];
        for (let i: int = 0; i < writes.length; i++) {
          let arr: Int16Array = new Int16Array(1);
          arr.$_set(0, writes[i]);
          let predicateKind: int = predicateKinds[i];
          let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            if (predicateKind === 0) {
              return element >= -32768;
            }
            return element < 0;
          });
          expect(result).assertTrue();
          expect(arr.$_get(0)).assertEqual(stored[i]);
        }
      }

      // --- [5] Verify every() predicate on a from(another Int16Array) source keeps each wrapped base value within int16 range ---
      {
        let base: Int16Array = new Int16Array(3);
        base.$_set(0, 32768);
        base.$_set(1, 40000);
        base.$_set(2, 0 - 40000);
        let arr: Int16Array = Int16Array.from(base);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= -32768 && element <= 32767;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART01_2600
     * @tc.name int16ArrayEveryPart01Test026
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: shared multiples, divisibility by 2/3/5, low-bit checks and byteLength relation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate requiring positive multiples of 2 and 3 returns true ---
      {
        let arr: Int16Array = new Int16Array([6, 12, 18]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0 && element % 2 === 0 && element % 3 === 0;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate requiring divisibility by at least one of 2, 3 or 5 returns true ---
      {
        let arr: Int16Array = new Int16Array([4, 9, 25]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element % 2 === 0 || element % 3 === 0 || element % 5 === 0;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate testing that the lowest two bits are clear returns true ---
      {
        let arr: Int16Array = new Int16Array([4, 8, 12]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return (element & 3) === 0;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate testing that the lowest bit is set returns true ---
      {
        let arr: Int16Array = new Int16Array([1, 3, 5, 7]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return (element & 1) !== 0;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate reading array.byteLength equals twice array.length returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.byteLength === 2 * array.length;
        });
        expect(result).assertTrue();
      }
    });

  });
}
