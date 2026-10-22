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

export default function int16ArrayForEachPart02Test(): void {
  describe('Int16ArrayForEachPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0100
     * @tc.name int16ArrayForEachPart02Test001
     * @tc.desc Merged batch (3 tests): empty and zero-length arrays: explicit empty return completes, empty arrays never call back, and an empty slice never calls back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify callbackfn with explicit empty return statement callback completes normally and forEach continues ---
      {
        let arr: Int16Array = new Int16Array([1, 2]);
        let reachedEnd: boolean = false;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index === 1) { reachedEnd = true; }
          return;
        });
        expect(reachedEnd).assertTrue();
      }

      // --- [2] Verify forEach on empty or zero-length Int16Array never invokes callback ---
      {
        let arr: Int16Array = Int16Array.of();
        let invoked: boolean = false;
        arr.forEach((value: number, index: int, array: Int16Array) => {
          invoked = true;
        });
        expect(invoked).assertFalse();

        let src: number[] = [];
        let arrFrom: Int16Array = Int16Array.from(src);
        let callCount: int = 0;
        arrFrom.forEach((value: number, index: int, array: Int16Array) => {
          callCount = callCount + 1;
        });
        expect(callCount).assertEqual(0);

        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arrBuf: Int16Array = new Int16Array(buf);
        let touched: boolean = false;
        arrBuf.forEach((value: number, index: int, array: Int16Array) => {
          touched = true;
        });
        expect(touched).assertFalse();

        let buf2: ArrayBuffer = new ArrayBuffer(4);
        let arrLen: Int16Array = new Int16Array(buf2, 2, 0);
        let invoked2: boolean = false;
        arrLen.forEach((value: number, index: int, array: Int16Array) => {
          invoked2 = true;
        });
        expect(invoked2).assertFalse();

        let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let sub: Int16Array = parent.subarray(2, 2);
        let count: int = 0;
        sub.forEach((value: number, index: int, array: Int16Array) => {
          count = count + 1;
        });
        expect(count).assertEqual(0);

        let arrEmpty: Int16Array = new Int16Array([]);
        let emptyCount: int = 0;
        arrEmpty.forEach((value: number, index: int, array: Int16Array) => {
          emptyCount = emptyCount + 1;
        });
        expect(emptyCount).assertEqual(0);
      }

      // --- [3] Verify forEach on the empty slice(0,0) of an array never invokes the callback ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let empty: Int16Array = arr.slice(0, 0);
        let calls: int = 0;
        empty.forEach((value: number, index: int, array: Int16Array): void => {
          calls = calls + 1;
        });
        expect(calls).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0200
     * @tc.name int16ArrayForEachPart02Test002
     * @tc.desc Merged batch (5 tests): mutation and array state during iteration: $_set-filled accumulation, copyWithin window, wrapped write visibility, per-index rewrite and Set-source persistence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach over a length-constructed array filled via $_set accumulates the filled values ---
      {
        let arr: Int16Array = new Int16Array(4);
        for (let i: int = 0; i < 4; i++) {
          arr.$_set(i, (i + 1) * 2);
        }
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value;
        });
        expect(total).assertEqual(20);
      }

      // --- [2] Verify forEach after copyWithin iterates the copied window values ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr.copyWithin(0, 3, 5);
        let text: string = '';
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          text = text + value.toString();
        });
        expect(text).assertEqual('45345');
      }

      // --- [3] Verify a $_set wrapping write made inside the forEach callback is observed at the written index afterwards ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index === 0) {
            array.$_set(3, 40000);
          }
        });
        expect(arr.$_get(3)).assertEqual(-25536);
      }

      // --- [4] Verify a forEach callback rewriting via $_set stores the derived value at each index ---
      {
        let arr: Int16Array = new Int16Array([10, 20]);
        arr.forEach((_value: number, index: int, array: Int16Array): void => {
          array.$_set(index, index * 10);
        });
        expect(arr.join(',')).assertEqual('0,10');
      }

      // --- [5] Verify forEach callback mutating via $_set on a from(Set) source persists the change ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        let arr: Int16Array = Int16Array.from(s);
        let first: number = arr.$_get(0);
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          array.$_set(index, value + first);
        });
        expect(arr.join(',')).assertEqual('2,3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0300
     * @tc.name int16ArrayForEachPart02Test003
     * @tc.desc Merged batch (5 tests): boundary and truncation values: in-range bounds, float truncation, all-MAX elements, modular wrapping and non-finite inputs converted to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callbackfn receives the stored in-range int16 value for boundary and negative inputs ---
      {
        let cases: number[][] = [[32767, 32767], [-32768, -32768], [0, 0], [-1, -1]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([cases[i][0]]);
          let received: number = 1;
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            received = value;
          });
          expect(received).assertEqual(cases[i][1]);
        }
      }

      // --- [2] Verify forEach Int16Array constructed with float source values callbackfn receives truncated int values ---
      {
        let arr: Int16Array = new Int16Array([3.7, -3.7, 1.5]);
        let firstVal: number = 0;
        let secondVal: number = 0;
        let thirdVal: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index === 0) { firstVal = value; }
          if (index === 1) { secondVal = value; }
          if (index === 2) { thirdVal = value; }
        });
        expect(firstVal).assertEqual(3);
        expect(secondVal).assertEqual(-3);
        expect(thirdVal).assertEqual(1);
      }

      // --- [3] Verify forEach Int16Array with all elements set to MAX (32767) each callbackfn invocation receives 32767 ---
      {
        let arr: Int16Array = new Int16Array([32767, 32767, 32767]);
        let allMax: boolean = true;
        arr.forEach((value: number): void => {
          if (value !== 32767) { allMax = false; }
        });
        expect(allMax).assertTrue();
      }

      // --- [4] Verify forEach callbackfn receives the modular-wrapped stored value for inputs whose magnitude exceeds the int16 range ---
      {
        let cases: number[][] = [[32768, -32768], [-32769, 32767]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([cases[i][0]]);
          let received: number = 1;
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            received = value;
          });
          expect(received).assertEqual(cases[i][1]);
        }
      }

      // --- [5] Verify forEach callbackfn receives 0 for non-finite stored input, since NaN and infinities are coerced to zero ---
      {
        let cases: number[][] = [[Number.NaN, 0], [Number.POSITIVE_INFINITY, 0], [-Number.POSITIVE_INFINITY, 0]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([cases[i][0]]);
          let received: number = 1;
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            received = value;
          });
          expect(received).assertEqual(cases[i][1]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0400
     * @tc.name int16ArrayForEachPart02Test004
     * @tc.desc Merged batch (5 tests): callback internals using other APIs: reduce sum assignment, with(index,0) copy isolation, entries count, values sum and keys list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callbackfn assigning array.reduce(sum,0) stores the element sum ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let reducerSum: number = -1;
        arr.forEach((element: number, _index: int, array: Int16Array): void => {
          reducerSum = array.reduce((acc: number, v: number, _i: int, _a: Int16Array): number => acc + v, 0);
        });
        let want: int = 6;
        expect(reducerSum).assertEqual(want);
      }

      // --- [2] Verify array.with(index,0) during forEach zeros each slot in a copy while the source stays intact ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        let patched: string = '';
        arr.forEach((_value: number, index: int, array: Int16Array): void => {
          let copy: Int16Array = array.with(index, 0);
          let v: number = copy.$_get(index);
          patched = patched + v.toString() + '|';
        });
        expect(patched).assertEqual('0|0|0|');
        expect(arr.join(',')).assertEqual('7,8,9');
      }

      // --- [3] Verify forEach callback counting the entries iterator equals the array length ---
      {
        let arr: Int16Array = Int16Array.of(6, 7, 8);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          let cnt: number = 0;
          for (const e of array.entries()) {
            cnt = cnt + 1;
          }
          total = total + cnt;
        });
        expect(total).assertEqual(9);
      }

      // --- [4] Verify forEach callback summing the values iterator equals length times the element sum ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          let s: number = 0;
          for (const v of array.values()) {
            s = s + v;
          }
          total = total + s;
        });
        expect(total).assertEqual(18);
      }

      // --- [5] Verify forEach callback pushing the keys iterator into an external list yields the contiguous indexes ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6, 7);
        let keys: int[] = [];
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          for (const k of array.keys()) {
            keys.push(k);
          }
        });
        expect(keys.length).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0500
     * @tc.name int16ArrayForEachPart02Test005
     * @tc.desc Merged batch (5 tests): callback internals using other APIs: slice sum, subarray sum, dash string, last-two slice and a with(2,1) patch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach over the slice() result accumulates the sliced element sum ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let sl: Int16Array = arr.slice(1, 3);
        let sum: number = 0;
        sl.forEach((element: number, _index: int, _array: Int16Array): void => {
          sum = sum + element;
        });
        let want: int = 50;
        expect(sum).assertEqual(want);
      }

      // --- [2] Verify forEach over a subarray view accumulates only the viewed elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let view: Int16Array = arr.subarray(1, 4);
        let total: number = 0;
        view.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value;
        });
        expect(total).assertEqual(9);
      }

      // --- [3] Verify forEach callback building a dash string from the elements equals the joined form ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        let text: string = '';
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index > 0) {
            text = text + '-';
          }
          text = text + value.toString();
        });
        expect(text).assertEqual('4-5-6');
      }

      // --- [4] Verify forEach over the slice of the last two elements accumulates their sum ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let tail: Int16Array = arr.slice(-2);
        let total: number = 0;
        tail.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value;
        });
        expect(total).assertEqual(7);
      }

      // --- [5] Verify forEach over a with(2,1) result matches the expected patched element array ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let patched: Int16Array = arr.with(2, 1);
        let expected: number[] = [10, 20, 1];
        let mismatches: int = 0;
        let seen: number[] = [];
        patched.forEach((value: number, index: int, array: Int16Array): void => {
          seen.push(value);
          if (value !== expected[index]) {
            mismatches = mismatches + 1;
          }
        });
        expect(mismatches).assertEqual(0);
        expect(seen.length).assertEqual(3);
        expect(seen.join(',')).assertEqual('10,20,1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0600
     * @tc.name int16ArrayForEachPart02Test006
     * @tc.desc Merged batch (5 tests): construction sources and views: mapfn sum, toReversed order, copied-source byteLength and sum, DataView readability and even-filter count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach on an array built by from(Array, mapfn) accumulates the mapped element sum ---
      {
        let src: int[] = [1, 2, 3];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 10 + k);
        let sum: number = 0;
        arr.forEach((element: number, _index: int, _array: Int16Array): void => {
          sum = sum + element;
        });
        let want: int = 63;
        expect(sum).assertEqual(want);
      }

      // --- [2] Verify forEach over the toReversed() copy concatenates values in reversed order ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let rev: Int16Array = arr.toReversed();
        let seq: string = '';
        rev.forEach((element: number, _index: int, _array: Int16Array): void => {
          seq = seq + element;
        });
        let want: string = '321';
        expect(seq).assertEqual(want);
      }

      // --- [3] Verify forEach over a from(another Int16Array) source keeps the byteLength and accumulates the sum ---
      {
        let base: Int16Array = Int16Array.of(2, 4, 6);
        let arr: Int16Array = Int16Array.from(base);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value;
        });
        expect(total).assertEqual(12);
        expect(arr.byteLength).assertEqual(6);
      }

      // --- [4] Verify forEach leaves the backing buffer readable through a DataView after iteration ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 7);
        arr.$_set(1, 8);
        let dv: DataView = new DataView(buf);
        let seen: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          seen = seen + value;
        });
        expect(seen).assertEqual(15);
        expect(dv.getInt16(0, true)).assertEqual(7);
      }

      // --- [5] Verify forEach over the even-only filter result counts only the even elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let evens: Int16Array = arr.filter((v: number): boolean => v % 2 === 0);
        let count: int = 0;
        evens.forEach((value: number, index: int, array: Int16Array): void => {
          count = count + 1;
        });
        expect(count).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0700
     * @tc.name int16ArrayForEachPart02Test007
     * @tc.desc Merged batch (5 tests): iteration values and accumulation: length inside the callback, per-index marker, index-times-value total, order-preserving record and some() doubling.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach array.length inside callbackfn equals the original array length ---
      {
        let arr: Int16Array = new Int16Array([9, 8, 7, 6]);
        let lenMatch: boolean = true;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (array.length !== 4) {
            lenMatch = false;
          }
        });
        expect(lenMatch).assertTrue();
      }

      // --- [2] Verify the callback receives every element index so a per-index marker is set for each ---
      {
        let arr: Int16Array = new Int16Array([5, 5, 5]);
        let flags: boolean[] = [false, false, false];
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          flags[index] = true;
        });
        let allSet: boolean = true;
        let i: int = 0;
        while (i < 3) {
          if (!flags[i]) { allSet = false; }
          i = i + 1;
        }
        expect(allSet).assertTrue();
      }

      // --- [3] Verify forEach callbackfn accumulates sum of index multiplied by value computed total matches expected ---
      {
        let arr: Int16Array = new Int16Array([2, 3, 4]);
        let sum: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          sum = sum + index * value;
        });
        expect(sum).assertEqual(11);
      }

      // --- [4] Verify the callback records each element value at its own index, preserving source order ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let idxList: int[] = [-1, -1, -1];
        let valList: number[] = [0, 0, 0];
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          idxList[index] = index;
          valList[index] = value;
        });
        expect(valList[0]).assertEqual(10);
        expect(valList[1]).assertEqual(20);
        expect(valList[2]).assertEqual(30);
      }

      // --- [5] Verify forEach counting array.some(value*2) hits finds only the doubled element ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let hits: int = 0;
        arr.forEach((value: number, _index: int, array: Int16Array): void => {
          if (array.some((v: number): boolean => v === value * 2)) {
            hits = hits + 1;
          }
        });
        expect(hits).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0800
     * @tc.name int16ArrayForEachPart02Test008
     * @tc.desc Merged batch (5 tests): callback exceptions and abort: triple-nested throw, first-index abort, throw positions, single-element name and RangeError continuation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify triple-nested forEach throw in innermost level propagates through all three levels ---
      {
        let a: Int16Array = new Int16Array([1, 2]);
        let b: Int16Array = new Int16Array([3, 4]);
        let c: Int16Array = new Int16Array([5, 6]);
        let l1Count: int = 0;
        let l2Count: int = 0;
        try {
          a.forEach((v1: number, i1: int, arr1: Int16Array) => {
            l1Count = l1Count + 1;
            b.forEach((v2: number, i2: int, arr2: Int16Array) => {
              l2Count = l2Count + 1;
              c.forEach((v3: number, i3: int, arr3: Int16Array) => {
                throw new Error('deep-fail');
              });
            });
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(l1Count).assertEqual(1);
        expect(l2Count).assertEqual(1);
      }

      // --- [2] Verify forEach throw at first index prevents remaining callbacks, with various array contents ---
      {
        let cases: number[][] = [[0, 0, 0, 0, 0], [32767, 32767, 32767, 32767], [-32768, -32768, -32768]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array(cases[i]);
          let count: int = 0;
          try {
            arr.forEach((value: number, index: int, array: Int16Array) => {
              if (index === 0) {
                throw new Error('stop-at-zero');
              }
              count = count + 1;
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(count).assertEqual(0);
        }
      }

      // --- [3] Verify forEach throw at various indices processes only preceding elements ---
      {
        let cases: int[][] = [
          [-1, -1, -1, -1, -1, 2, 2],
          [32767, 32767, 32767, 2, 2],
          [-32768, -32768, -32768, 2, 2],
          [0, 0, 0, 0, 0, 0, 3, 3],
          [32767, 32767, 32767, 32767, 2, 2]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let data: number[] = [];
          let k: int = 0;
          while (k < cases[i].length - 2) {
            data.push(cases[i][k]);
            k = k + 1;
          }
          let arr: Int16Array = new Int16Array(data);
          let throwIdx: int = cases[i][cases[i].length - 2];
          let expected: int = cases[i][cases[i].length - 1];
          let count: int = 0;
          try {
            arr.forEach((value: number, index: int, array: Int16Array) => {
              if (index === throwIdx) {
                throw new Error('mid-abort');
              }
              count = count + 1;
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(count).assertEqual(expected);
        }
      }

      // --- [4] Verify forEach single-element array callback throw propagates with correct error name ---
      {
        let cases: number[][] = [[0, 0], [32767, 0], [-32768, 2], [-1, 0]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([cases[i][0]]);
          let completed: boolean = false;
          try {
            arr.forEach((value: number, index: int, array: Int16Array) => {
              completed = true;
              if (cases[i][1] === 2) {
                throw new RangeError('single-min');
              }
              throw new Error('single-element');
            });
            expect().assertFail();
          } catch (e) {
            let expectedName: string = cases[i][1] === 2 ? 'RangeError' : 'Error';
            expect(e.name).assertEqual(expectedName);
          }
          expect(completed).assertTrue();
        }
      }

      // --- [5] Verify forEach $_get with out-of-range index throws RangeError inside callback and continues ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let allProcessed: int = 0;
        let gotUndefined: boolean = false;
        arr.forEach((value: number, index: int, array: Int16Array) => {
          try {
            array.$_get(-1);
            expect().assertFail();

            gotUndefined = true;
          } catch (e) {
            expect(e.name).assertEqual('RangeError');

            gotUndefined = true;
          }
          allProcessed = allProcessed + 1;
        });
        expect(gotUndefined).assertTrue();
        expect(allProcessed).assertEqual(3);

        let indices: int[] = [3, 4, -4, 2147483647];
        for (let i: int = 0; i < indices.length; i++) {
          let a: Int16Array = new Int16Array([5, 15, 25]);
          let finished: int = 0;
          a.forEach((value: number, index: int, array: Int16Array) => {
            try {
              array.$_get(indices[i]);
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('RangeError');
            }
            finished = index;
          });
          expect(finished).assertEqual(2);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_0900
     * @tc.name int16ArrayForEachPart02Test009
     * @tc.desc Merged batch (4 tests): callback exceptions and abort: Error on a Set source, TypeError on a mapfn source, RangeError on a copied source and join-then-throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callbackfn throwing Error on an array built by from(Set) propagates the Error name ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        let arr: Int16Array = Int16Array.from(s);
        try {
          arr.forEach((element: number, _index: int, _array: Int16Array): void => {
            throw new Error('set fail');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify forEach callbackfn throwing TypeError on an array built by from(Array, mapfn) propagates the TypeError name ---
      {
        let src: int[] = [1, 2];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v + k);
        try {
          arr.forEach((element: number, _index: int, _array: Int16Array): void => {
            throw new TypeError('mapfn fail');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
      }

      // --- [3] Verify forEach callbackfn throwing RangeError on a copy-constructed array propagates the RangeError name ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(1, 2, 3));
        try {
          arr.forEach((element: number, _index: int, _array: Int16Array): void => {
            throw new RangeError('copy fail');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [4] Verify forEach callbackfn calling array.join before throwing Error propagates the Error name ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        try {
          arr.forEach((element: number, _index: int, array: Int16Array): void => {
            let text: string = array.join('-');
            if (text.length > 0) {
              throw new Error('join seen');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1000
     * @tc.name int16ArrayForEachPart02Test010
     * @tc.desc Merged batch (2 tests): callback exceptions and abort: nested throw on a Map source stops the outer loop, and join-then-throw propagation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify nested forEach whose inner callback throws on a from(Map.keys()) source stops the outer iteration ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(1, 'a');
        m.set(2, 'b');
        let inner: Int16Array = Int16Array.from(m.keys());
        let outer: Int16Array = Int16Array.of(7, 8);
        let outerCalls: int = 0;
        try {
          outer.forEach((value: number, index: int, array: Int16Array): void => {
            outerCalls = outerCalls + 1;
            inner.forEach((iv: number, ii: int, ia: Int16Array): void => {
              if (ii === 1) {
                throw new Error('inner');
              }
            });
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(outerCalls).assertEqual(1);
      }

      // --- [2] Verify forEach propagates an Error thrown after joining a from(Map.keys()) source ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(1, 'a');
        m.set(2, 'b');
        let arr: Int16Array = Int16Array.from(m.keys());
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            let text: string = array.join('-');
            throw new Error(text);
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1100
     * @tc.name int16ArrayForEachPart02Test011
     * @tc.desc Merged batch (2 tests): nested forEach: same-array pass counts per outer element and a different-array inner loop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a nested forEach over the same array runs the inner three-element pass once per outer element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let pairs: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          array.forEach((inner: number): void => {
            pairs = pairs + 1;
          });
        });
        expect(pairs).assertEqual(9);
      }

      // --- [2] Verify a nested forEach over a different Int16Array executes correctly inside the outer callback ---
      {
        let outer: Int16Array = new Int16Array([1, 2]);
        let inner: Int16Array = new Int16Array([10, 20]);
        let outerSum: number = 0;
        let innerSum: number = 0;
        outer.forEach((outerValue: number): void => {
          outerSum = outerSum + outerValue;
          inner.forEach((innerValue: number): void => {
            innerSum = innerSum + innerValue;
          });
        });
        expect(outerSum).assertEqual(3);
        expect(innerSum).assertEqual(60);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1200
     * @tc.name int16ArrayForEachPart02Test012
     * @tc.desc Merged batch (5 tests): call counts, visit order and index parameters: Set order, mapfn order, join-length accumulation, subarray length and filtered length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach over a from(Set) source visits elements in insertion order ---
      {
        let s: Set<int> = new Set<int>();
        s.add(9);
        s.add(4);
        s.add(7);
        let arr: Int16Array = Int16Array.from(s);
        let seen: number[] = [];
        arr.forEach((value: number, _index: int, _array: Int16Array): void => {
          seen.push(value);
        });
        expect(seen.join(',')).assertEqual('9,4,7');
      }

      // --- [2] Verify forEach over a from(Array, mapfn) source visits the mapped elements in order ---
      {
        let src: int[] = [1, 2, 3, 4];
        let arr: Int16Array = Int16Array.from(src, (v: int, _k: double): double => v * 3);
        let seen: number[] = [];
        arr.forEach((value: number, _index: int, _array: Int16Array): void => {
          seen.push(value);
        });
        expect(seen.join(',')).assertEqual('3,6,9,12');
      }

      // --- [3] Verify forEach callbackfn summing array.join(comma).length equals the iteration count times the joined length ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let total: int = 0;
        arr.forEach((element: number, _index: int, array: Int16Array): void => {
          total = total + array.join(',').length;
        });
        let want: int = 15;
        expect(total).assertEqual(want);
      }

      // --- [4] Verify forEach callbackfn summing array.subarray(index,index+1).length equals the iteration count ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        let sum: number = 0;
        arr.forEach((element: number, index: int, array: Int16Array): void => {
          sum = sum + array.subarray(index, index + 1).length;
        });
        let want: int = 3;
        expect(sum).assertEqual(want);
      }

      // --- [5] Verify forEach callbackfn accumulating array.filter(v>0).length equals the positives count times the iteration count ---
      {
        let arr: Int16Array = Int16Array.of(-1, 2, -3, 4);
        let total: int = 0;
        arr.forEach((element: number, _index: int, array: Int16Array): void => {
          total = total + array.filter((v: number, _i: int, _a: Int16Array): boolean => v > 0).length;
        });
        let want: int = 8;
        expect(total).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1300
     * @tc.name int16ArrayForEachPart02Test013
     * @tc.desc Merged batch (4 tests): call counts, visit order and index parameters: Map-key order, joined accumulation, entries-rebuilt visits and value-plus-index sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach over a from(Map.keys()) source visits the keys in insertion order ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(10, 'a');
        m.set(20, 'b');
        m.set(30, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let seen: number[] = [];
        arr.forEach((value: number, _index: int, _array: Int16Array): void => {
          seen.push(value);
        });
        expect(seen.join(',')).assertEqual('10,20,30');
      }

      // --- [2] Verify forEach callback concatenating the comma-joined array equals the per-visit joined string accumulation ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let parts: string[] = [];
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          parts.push(array.join(','));
        });
        expect(parts[0]).assertEqual('1,2,3');
        expect(parts.length).assertEqual(3);
      }

      // --- [3] Verify forEach over an array rebuilt from the entries of another visits the copied values ---
      {
        let src: Int16Array = Int16Array.of(3, 6, 9);
        let vals: number[] = [];
        for (const e of src.entries()) {
          vals.push(e[1]);
        }
        let arr: Int16Array = Int16Array.from(vals);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value;
        });
        expect(total).assertEqual(18);
      }

      // --- [4] Verify forEach callback summing the element and its index equals value sum plus index sum ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value + index;
        });
        expect(total).assertEqual(63);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1400
     * @tc.name int16ArrayForEachPart02Test014
     * @tc.desc Merged batch (4 tests): mutation and array state during iteration: $_set visible later in the same pass, all-zero elements, a write seen when reached and pre-modified values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a $_set performed in the forEach callback is visible to a later $_get in the same pass ---
      {
        let arr: Int16Array = new Int16Array([12, 34, 56, 78]);
        let seenAfterSet: number = -1;
        let valueSeen: number = -1;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index === 0) {
            array.$_set(1, 999);
          }
          if (index === 1) {
            valueSeen = value;
            seenAfterSet = array.$_get(1);
          }
        });
        expect(seenAfterSet).assertEqual(999);
        expect(valueSeen).assertEqual(999);
      }

      // --- [2] Verify forEach Int16Array with all zeros callbackfn receives 0 at each index ---
      {
        let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
        let nonZeroFound: boolean = false;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (value !== 0) {
            nonZeroFound = true;
          }
        });
        expect(nonZeroFound).assertFalse();
      }

      // --- [3] Verify an element written via a callback $_set is delivered when iteration later reaches it ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let laterValue: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index === 0) {
            array.$_set(3, 999);
          }
          if (index === 3) {
            laterValue = value;
          }
        });
        expect(laterValue).assertEqual(999);
      }

      // --- [4] Verify Int16Array modified via $_set before forEach call forEach iterates over the modified values ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        arr.$_set(0, 100);
        arr.$_set(2, 300);
        let collected: number[] = [0, 0, 0];
        let pos: int = 0;
        arr.forEach((value: number): void => {
          collected[pos] = value;
          pos = pos + 1;
        });
        expect(collected[0]).assertEqual(100);
        expect(collected[2]).assertEqual(300);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1500
     * @tc.name int16ArrayForEachPart02Test015
     * @tc.desc Merged batch (5 tests): read-only and non-mutation: identical repeated runs, read-only sum, boundary preservation, rebuilt byteLength and shared subarray buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two consecutive forEach calls on the same unchanged array both produce identical iteration results ---
      {
        let arr: Int16Array = new Int16Array([11, 22, 33]);
        let firstRun: number[] = [0, 0, 0];
        let secondRun: number[] = [0, 0, 0];
        let p1: int = 0;
        arr.forEach((value: number): void => { firstRun[p1] = value; p1 = p1 + 1; });
        let p2: int = 0;
        arr.forEach((value: number): void => { secondRun[p2] = value; p2 = p2 + 1; });
        let match: boolean = true;
        let i: int = 0;
        while (i < 3) {
          if (firstRun[i] !== secondRun[i]) { match = false; }
          i = i + 1;
        }
        expect(match).assertTrue();
        expect(p1).assertEqual(3);
        expect(p2).assertEqual(3);
        expect(firstRun.join(',')).assertEqual('11,22,33');
        expect(secondRun.join(',')).assertEqual('11,22,33');
      }

      // --- [2] Verify a read-only forEach leaves the array values intact while accumulating the sum ---
      {
        let arr: Int16Array = Int16Array.of(1, -1, 0, 32767);
        let sum: number = 0;
        arr.forEach((value: number, _index: int, _array: Int16Array): void => {
          sum = sum + value;
        });
        expect(sum).assertEqual(32767);
        expect(arr.join(',')).assertEqual('1,-1,0,32767');
      }

      // --- [3] Verify forEach with read-only callback preserves element values across constructions and boundary data ---
      {
        let rows: number[][] = [
          [10, 20, 30],
          [5, 15, 25],
          [1, 2, 3, 4, 5],
          [32767, 100, 200],
          [-32768, 0, 50],
          [0, 0, 0],
          [-1, -2, -3],
          [7, 8, 9]
        ];
        for (let i: int = 0; i < rows.length; i++) {
          let arr: Int16Array = new Int16Array(rows[i]);
          arr.forEach((value: number, index: int, array: Int16Array) => {
            expect(value).assertEqual(rows[i][index]);
          });
          for (let j: int = 0; j < arr.length; j++) {
            expect(arr.$_get(j)).assertEqual(rows[i][j]);
          }
        }
        let arrOf: Int16Array = Int16Array.of(11, 22, 33);
        arrOf.forEach((value: number, index: int, array: Int16Array) => {
          expect(value).assertEqual(arrOf.$_get(index));
        });
        expect(arrOf.$_get(0)).assertEqual(11);
        expect(arrOf.$_get(2)).assertEqual(33);

        let arrFrom: Int16Array = Int16Array.from([44, 55]);
        arrFrom.forEach((value: number, index: int, array: Int16Array) => {
          expect(value).assertEqual(arrFrom.$_get(index));
        });
        expect(arrFrom.$_get(0)).assertEqual(44);
        expect(arrFrom.$_get(1)).assertEqual(55);
      }

      // --- [4] Verify forEach over a from(Array.from) rebuild preserves the buffer byte length ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7, 8);
        let copy: Int16Array = Int16Array.from(Array.from(arr));
        let total: number = 0;
        copy.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value;
        });
        expect(total).assertEqual(26);
        expect(copy.byteLength).assertEqual(8);
      }

      // --- [5] Verify forEach over a subarray shares one buffer with the parent view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let parent: Int16Array = new Int16Array(buf);
        parent.$_set(0, 1);
        parent.$_set(1, 2);
        parent.$_set(2, 3);
        parent.$_set(3, 4);
        let view: Int16Array = parent.subarray(2, 4);
        let same: boolean = true;
        view.forEach((value: number, index: int, array: Int16Array): void => {
          same = same && array.buffer === parent.buffer;
        });
        expect(same).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1600
     * @tc.name int16ArrayForEachPart02Test016
     * @tc.desc Merged batch (4 tests): boundary and truncation values: hexadecimal sum, negative zero, maximum via reduce and MAX/MIN accumulation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach over an array built from hex literals accumulates the expected sum ---
      {
        let arr: Int16Array = Int16Array.of(0x10, 0x20, 0x0);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value;
        });
        expect(total).assertEqual(48);
      }

      // --- [2] Verify forEach over an array holding a negative zero observes zero in the callback ---
      {
        let arr: Int16Array = new Int16Array([-0, 5]);
        let zeros: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (value === 0) {
            zeros = zeros + 1;
          }
        });
        expect(zeros).assertEqual(1);
      }

      // --- [3] Verify forEach callback reading the max via reduce equals the largest element each visit ---
      {
        let arr: Int16Array = Int16Array.of(4, 9, 2);
        let ok: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          let mx: number = array.reduce((a: number, b: number): number => Math.max(a, b), 0);
          if (mx === 9) {
            ok = ok + 1;
          }
        });
        expect(ok).assertEqual(3);
      }

      // --- [4] Verify forEach over an array of MAX values accumulates length times MAX and over the same array refilled with MIN accumulates -65536 ---
      {
        let count: int = 2;
        let arr: Int16Array = new Int16Array(count);
        arr.fill(32767);
        let sum: number = 0;
        arr.forEach((value: number): void => {
          sum = sum + value;
        });
        expect(sum).assertEqual(arr.length * 32767);
        arr.$_set(0, -32768);
        arr.$_set(1, -32768);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value;
        });
        expect(total).assertEqual(-65536);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1700
     * @tc.name int16ArrayForEachPart02Test017
     * @tc.desc Merged batch (5 tests): callback internals using other APIs: at(-1) each visit, ceil and round halving, findLastIndex sum and reduceRight sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callback reading at(-1) stores the same last element on every visit ---
      {
        let arr: Int16Array = Int16Array.of(3, 9, 5);
        let last: number = -1;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          last = array.at(-1) as number;
        });
        expect(last).assertEqual(5);
      }

      // --- [2] Verify forEach callback accumulating Math.ceil of each halved element equals the expected total ---
      {
        let arr: Int16Array = Int16Array.of(3, 5, 7);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + Math.ceil(value / 2);
        });
        expect(total).assertEqual(9);
      }

      // --- [3] Verify forEach callback accumulating Math.round of each halved element equals the expected total ---
      {
        let arr: Int16Array = Int16Array.of(1, 4, 7);
        let total: number = 0;
        let seen: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + Math.round(value / 2);
          seen = seen + 1;
        });
        expect(total).assertEqual(7);
        expect(seen).assertEqual(3);
      }

      // --- [4] Verify forEach summing findLastIndex(value) over distinct elements yields the triangular total ---
      {
        let arr: Int16Array = Int16Array.of(2, 8, 4);
        let sum: number = 0;
        arr.forEach((value: number, _index: int, array: Int16Array): void => {
          sum = sum + array.findLastIndex((x: number): boolean => x === value);
        });
        expect(sum).assertEqual(3);
      }

      // --- [5] Verify forEach callback accumulating the reduceRight sum equals length times the constant element sum ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + array.reduceRight((acc: number, v: number): number => acc + v, 0);
        });
        expect(total).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1800
     * @tc.name int16ArrayForEachPart02Test018
     * @tc.desc Merged batch (2 tests): callback internals using other APIs: findLastIndex matching the last slot, and squaring over a Map-key source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach counting positions where findLastIndex(value)==index finds exactly the last slot ---
      {
        let arr: Int16Array = Int16Array.of(4, 4, 4);
        let lastHits: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (array.findLastIndex((x: number): boolean => x === value) === index) {
            lastHits = lastHits + 1;
          }
        });
        expect(lastHits).assertEqual(1);
      }

      // --- [2] Verify forEach over a from(Map.keys()) source with a squaring callback accumulates the square sum ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(2, 'a');
        m.set(3, 'b');
        m.set(4, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + value * value;
        });
        expect(total).assertEqual(29);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_1900
     * @tc.name int16ArrayForEachPart02Test019
     * @tc.desc Merged batch (5 tests): construction sources and views: reversed copy, 50-element copied source, Map.values doubling, reversed Set and toSorted copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach over a copy-constructed then reversed array collects descending values ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3);
        let arr: Int16Array = new Int16Array(base);
        let desc: Int16Array = arr.toReversed();
        let text: string = '';
        desc.forEach((value: number, index: int, array: Int16Array): void => {
          text = text + value.toString();
        });
        expect(text).assertEqual('321');
      }

      // --- [2] Verify forEach over a 50-element from(another) source reproduces the source order ---
      {
        let base: Int16Array = new Int16Array(50);
        for (let i: int = 0; i < 50; i++) {
          base.$_set(i, (i * 3) % 100);
        }
        let arr: Int16Array = Int16Array.from(base);
        let seen: number[] = [];
        arr.forEach((value: number, _index: int, _array: Int16Array): void => {
          seen.push(value);
        });
        expect(seen.join(',')).assertEqual(base.join(','));
      }

      // --- [3] Verify forEach over a from(Map.values()) source with a doubling callback returns void and updates the sum ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        let arr: Int16Array = Int16Array.from(m.values());
        let doubled: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          doubled = doubled + value * 2;
        });
        expect(doubled).assertEqual(12);
      }

      // --- [4] Verify forEach over a reversed copy of a from(Set) source concatenates descending distinct values ---
      {
        let s: Set<int> = new Set<int>();
        s.add(3);
        s.add(1);
        s.add(2);
        let arr: Int16Array = Int16Array.from(s);
        let rev: Int16Array = arr.toReversed();
        let text: string = '';
        rev.forEach((value: number, index: int, array: Int16Array): void => {
          text = text + value.toString();
        });
        expect(text).assertEqual('213');
      }

      // --- [5] Verify forEach over a toSorted copy of an unsorted from(another) source concatenates ascending values ---
      {
        let base: Int16Array = Int16Array.of(3, 1, 2);
        let arr: Int16Array = Int16Array.from(base);
        let sorted: Int16Array = arr.toSorted();
        let text: string = '';
        sorted.forEach((value: number, index: int, array: Int16Array): void => {
          text = text + value.toString();
        });
        expect(text).assertEqual('123');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART02_2000
     * @tc.name int16ArrayForEachPart02Test020
     * @tc.desc Merged batch (5 tests): iteration values and accumulation: at(index) sequence, 100-element index sum, undefined return, distinct-value count and running maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach reading at(index) reproduces the element sequence ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        let text: string = '';
        arr.forEach((_value: number, index: int, array: Int16Array): void => {
          let v: number | undefined = array.at(index);
          text = text + (v as number).toString() + '-';
        });
        expect(text).assertEqual('11-22-33-');
      }

      // --- [2] Verify forEach over a 100-element array accumulating the index sum equals the triangular total ---
      {
        let arr: Int16Array = new Int16Array(100);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + index;
        });
        expect(total).assertEqual(4950);
      }

      // --- [3] Verify forEach returns undefined while the callback has accumulated every element ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let sum: number = 0;
        let ret: void = arr.forEach((value: number, index: int, array: Int16Array): void => {
          sum = sum + value;
        });
        expect(ret).assertEqual(undefined);
        expect(sum).assertEqual(30);
      }

      // --- [4] Verify forEach callback collecting values into a Set yields the distinct element count ---
      {
        let arr: Int16Array = Int16Array.of(1, 1, 2, 3, 3);
        let s: Set<number> = new Set<number>();
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          s.add(value);
        });
        let size: number = s.size;
        expect(size).assertEqual(3);
      }

      // --- [5] Verify forEach() computes the running maximum through callback state ---
      {
        let arr: Int16Array = Int16Array.of(4, 9, 2, 8);
        let best: number = 0;
        arr.forEach((value: number): void => {
          if (value > best) {
            best = value;
          }
        });
        let want: int = 9;
        expect(best).assertEqual(want);
      }
    });

  });
}
