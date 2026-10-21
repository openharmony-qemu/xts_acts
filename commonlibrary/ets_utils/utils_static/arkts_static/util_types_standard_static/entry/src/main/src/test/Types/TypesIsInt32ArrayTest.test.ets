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
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '../../../../hypium/index';
import util from '@ohos.util';
import Utils from './../Util.test';

interface PlainValue {
  x: int;
}

interface NestedValue {
  items: int[];
}

class SampleData {
  tag: string = 'data';
  val: int = 0;
}

class WeakKey {
  id: int = 0;
}

interface ViewCarrier {
  view: Int32Array;
  tagLabel: string;
}

class ViewSlot {
  slot: Object = new Int32Array(0);
  markLabel: string = 'slot';

  recognize(int32Checker: util.types): boolean {
    return int32Checker.isInt32Array(this.slot);
  }
}

function buildView(length: int): Int32Array {
  return new Int32Array(length);
}

function passViewThrough(view: Int32Array): Int32Array {
  return view;
}

function classifyView(int32Checker: util.types, value: Object): string {
  if (int32Checker.isInt32Array(value)) {
    return 'int32';
  }
  return 'other';
}

export default function typesIsInt32ArrayTest(): void {
  describe('TypesIsInt32ArrayTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0100
     * @tc.name testTypesIsInt32Array001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts the legal single-argument call carrying a one-element Int32Array; a 16 byte ArrayBuffer backing gives 4 Int32Array elements and isInt32Array still returns true; an Int32Array built on a Uint8Array buffer is recognised, the 8 byte buffer holding 2 elements; an Int32Array filled through $_set with the int range bounds is recognised with those values; accepts an Int32Array filled with Math.pow, Math.sqrt and Math.trunc results.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt32Array returns true for the legal single-argument call carrying a one-element Int32Array ---
      {
        let int32Checker: util.types = new util.types();
        let r: boolean = int32Checker.isInt32Array(new Int32Array([5]));
        expect(r).assertTrue();
      }

      // --- [2] Verify a 16 byte ArrayBuffer backing gives 4 Int32Array elements and isInt32Array still returns true ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let ta: Int32Array = new Int32Array(buf);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.length).assertEqual(4);
        expect(ta.byteLength).assertEqual(16);
      }

      // --- [3] Verify an Int32Array built on a Uint8Array buffer is recognised, the 8 byte buffer holding 2 elements ---
      {
        let int32Probe: util.types = new util.types();
        let src: Uint8Array = new Uint8Array([0, 0, 0, 0, 7, 0, 0, 0]);
        let ta: Int32Array = new Int32Array(src.buffer);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.length).assertEqual(2);
        expect(ta.byteLength).assertEqual(8);
      }

      // --- [4] Verify an Int32Array filled through $_set with the int range bounds is recognised with those values ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array(2);
        ta.$_set(0, 2147483647);
        ta.$_set(1, -2147483647);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.$_get(0)).assertEqual(2147483647);
        expect(ta.$_get(1)).assertEqual(-2147483647);
      }

      // --- [5] Verify isInt32Array returns true for an Int32Array filled with Math.pow, Math.sqrt and Math.trunc results ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array(3);
        ta[0] = Math.pow(2, 3);
        ta[1] = Math.sqrt(81);
        ta[2] = Math.trunc(7.9);
        expect(int32Probe.isInt32Array(ta)).assertTrue();
        expect(ta[0]).assertEqual(8);
        expect(ta[1]).assertEqual(9);
        expect(ta[2]).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0200
     * @tc.name testTypesIsInt32Array002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: an array filled with 7 through fill is still accepted and its trailing element reads 7; copyWithin leaves the receiver recognised and duplicates the first two elements into the trailing positions; recognition depends on the runtime type, an Int32Array carried in an Object typed variable still true; the key, value and entry iterators produced by an Int32Array are not themselves Int32Array instances; detection leaves the values 1, 2 and 3, length 3 and byteLength 12 of a recognised three element Int32Array untouched.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an array filled with 7 through fill is still accepted and its trailing element reads 7 while reverse inverts the order ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array(4);
        ta.fill(7);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.$_get(3)).assertEqual(7);
        expect(ta.length).assertEqual(4);
        let int32Probe_2: util.types = new util.types();
        let ta_2: Int32Array = new Int32Array([1, 2, 3]);
        let back: Int32Array = ta_2.reverse();
        let r1: boolean = int32Probe_2.isInt32Array(back);
        let r2: boolean = int32Probe_2.isInt32Array(ta_2);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(back.$_get(0)).assertEqual(3);
        expect(back.$_get(2)).assertEqual(1);
      }

      // --- [2] Verify copyWithin leaves the receiver recognised and duplicates the first two elements into the trailing positions ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1, 2, 3, 4]);
        ta.copyWithin(2, 0, 2);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.$_get(2)).assertEqual(1);
        expect(ta.$_get(3)).assertEqual(2);
      }

      // --- [3] Verify recognition depends on the runtime type, an Int32Array carried in an Object typed variable still true ---
      {
        let int32Checker: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1, 2]);
        let asObject: Object = ta;
        let r: boolean = int32Checker.isInt32Array(asObject);
        expect(r).assertTrue();
      }

      // --- [4] Verify the key, value and entry iterators produced by an Int32Array are not themselves Int32Array instances ---
      {
        let int32Checker: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1, 2]);
        let ki: IterableIterator<int> = ta.keys();
        let vi: IterableIterator<double> = ta.values();
        let ei: IterableIterator<[int, double]> = ta.entries();
        let r1: boolean = int32Checker.isInt32Array(ki);
        let r2: boolean = int32Checker.isInt32Array(vi);
        let r3: boolean = int32Checker.isInt32Array(ei);
        expect(r1).assertFalse();
        expect(r2).assertFalse();
        expect(r3).assertFalse();
      }

      // --- [5] Verify detection leaves the values 1, 2 and 3, length 3 and byteLength 12 of a recognised three element Int32Array untouched ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1, 2, 3]);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.$_get(0)).assertEqual(1);
        expect(ta.$_get(1)).assertEqual(2);
        expect(ta.$_get(2)).assertEqual(3);
        expect(ta.length).assertEqual(3);
        expect(ta.byteLength).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0300
     * @tc.name testTypesIsInt32Array003
     * @tc.desc Merged batch (2 tests): Basic construction and recognition: sort orders the elements without a copy and the predicate still accepts the array; accepts the int range bounds 2147483647 and -2147483647 as element values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort orders the elements without a copy and the predicate still accepts the array ---
      {
        let int32Probe: util.types = new util.types();
        let source: Int32Array = new Int32Array([30, 10, 20]);
        let ordered: Int32Array = source.sort((a: double, b: double): int => a < b ? -1 : (a > b ? 1 : 0));
        expect(ordered[0]).assertEqual(10);
        expect(int32Probe.isInt32Array(ordered)).assertTrue();
      }

      // --- [2] Verify isInt32Array returns true for the int range bounds 2147483647 and -2147483647 as element values ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array([2147483647, -2147483647]);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.$_get(0)).assertEqual(2147483647);
        expect(ta.$_get(1)).assertEqual(-2147483647);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0400
     * @tc.name testTypesIsInt32Array004
     * @tc.desc Merged batch (5 tests): Boundary values: accepts a length 0 Int32Array and reports its zero length and byteLength; isInt32Array rejects the strings hello, the empty string, a 10240 character text and surrogate strings in a single pass; a zero length Uint32Array, an unsigned array of the same 4 byte width, is not an Int32Array; isInt32Array rejects an empty ArrayBuffer and a Date instance; three consecutive detections of the same single element Int32Array all report true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt32Array returns true for a length 0 Int32Array and reports its zero length and byteLength ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array(0);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.length).assertEqual(0);
        expect(ta.byteLength).assertEqual(0);
      }

      // --- [2] Verify isInt32Array rejects the strings hello, the empty string, a 10240 character text and surrogate strings in a single pass ---
      {
        let int32Probe: util.types = new util.types();
        let longText: string = '';
        for (let i: int = 0; i < 1024; i++) {
          longText += 'abcdefghij';
        }
        let lone: string = '\uDE00';
        let pair: string = '\uD83D' + lone;
        let candidates: string[] = ['hello', '', longText, lone, pair];
        let hits: int = 0;
        for (const text of candidates) {
          if (int32Probe.isInt32Array(text)) {
            hits = hits + 1;
          }
        }
        expect(longText.length).assertEqual(10240);
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify a zero length Uint32Array, an unsigned array of the same 4 byte width, is not an Int32Array ---
      {
        let int32Probe: util.types = new util.types();
        let other: Uint32Array = new Uint32Array(0);
        let r: boolean = int32Probe.isInt32Array(other);
        expect(r).assertFalse();
        expect(other.length).assertEqual(0);
      }

      // --- [4] Verify isInt32Array rejects an empty ArrayBuffer and a Date instance ---
      {
        let int32Checker: util.types = new util.types();
        let emptyBuffer: ArrayBuffer = new ArrayBuffer(0);
        let date: Date = new Date();
        let bufferVerdict: boolean = int32Checker.isInt32Array(emptyBuffer);
        let dateVerdict: boolean = int32Checker.isInt32Array(date);
        expect(bufferVerdict).assertFalse();
        expect(dateVerdict).assertFalse();
      }

      // --- [5] Verify three consecutive detections of the same single element Int32Array all report true ---
      {
        let int32Checker: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1]);
        let r1: boolean = int32Checker.isInt32Array(ta);
        let r2: boolean = int32Checker.isInt32Array(ta);
        let r3: boolean = int32Checker.isInt32Array(ta);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(r3).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0500
     * @tc.name testTypesIsInt32Array005
     * @tc.desc Merged batch (3 tests): Boundary values: a zero length view sitting at the end of its buffer is recognised, byteOffset equalling 8; the two argument constructor with byteOffset 4 over an 8 byte buffer yields a recognised one element window aliasing the second word; rejects the iterator produced by Set.keys of a one element Set.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a zero length view sitting at the end of its buffer is recognised, byteOffset equalling 8 ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let base: Int32Array = new Int32Array(buf);
        let tail: Int32Array = base.subarray(2, 2);
        let r: boolean = int32Probe.isInt32Array(tail);
        expect(r).assertTrue();
        expect(tail.length).assertEqual(0);
        expect(tail.byteOffset).assertEqual(8);
      }

      // --- [2] Verify the two argument constructor with byteOffset 4 over an 8 byte buffer yields a recognised one element window aliasing the second word ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let full: Int32Array = new Int32Array(buf);
        let tail: Int32Array = new Int32Array(buf, 4);
        tail.$_set(0, 12);
        let r1: boolean = int32Probe.isInt32Array(tail);
        let r2: boolean = int32Probe.isInt32Array(full);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(tail.byteOffset).assertEqual(4);
        expect(tail.length).assertEqual(1);
        expect(full.$_get(1)).assertEqual(12);
      }

      // --- [3] Verify isInt32Array returns false for the iterator produced by Set.keys of a one element Set ---
      {
        let int32Checker: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        s.add(1);
        let iter: IterableIterator<int> = s.keys();
        let r: boolean = int32Checker.isInt32Array(iter);
        expect(r).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0600
     * @tc.name testTypesIsInt32Array006
     * @tc.desc Merged batch (4 tests): Boundary overflow: verifies numeric limit and wrapping behavior, covering typed array views and related extreme values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt32Array returns false for -2147483647, one above the smallest int, a primitive number ---
      {
        let int32Probe: util.types = new util.types();
        let extremes: int[] = [-2147483647];
        expect(int32Probe.isInt32Array(extremes[0])).assertFalse();
        expect(extremes[0]).assertLess(0);
      }

      // --- [2] Verify isInt32Array rejects NaN, both infinities and the signed zeros in a single pass ---
      {
        let int32Checker: util.types = new util.types();
        let values: double[] = [Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, -0.0, 0.0];
        let hits: int = 0;
        for (const value of values) {
          if (int32Checker.isInt32Array(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify isInt32Array returns false for the long -2147483649, which is one below the smallest int ---
      {
        let int32Checker: util.types = new util.types();
        let v: long = -2147483649;
        let r: boolean = int32Checker.isInt32Array(v);
        expect(r).assertFalse();
      }

      // --- [4] Verify isInt32Array returns false for 9223372036854775807, the largest representable long value ---
      {
        let int32Probe: util.types = new util.types();
        let v: long = 9223372036854775807;
        expect(v).assertLarger(2147483647);
        expect(int32Probe.isInt32Array(v)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0700
     * @tc.name testTypesIsInt32Array007
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the int 0, the additive identity is still not an object; rejects the int -1, a negative primitive number; the largest int and the long one above it are both rejected, each still above its predecessor bound; rejects Math.PI and its negation, a fractional double of either sign and both boolean primitives true and false; rejects BigInt64Array and BigUint64Array views.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt32Array returns false for the int 0, the additive identity is still not an object ---
      {
        let int32Checker: util.types = new util.types();
        let v: int = 0;
        let ta: Int32Array = new Int32Array(0);
        expect(int32Checker.isInt32Array(v)).assertFalse();
        expect(int32Checker.isInt32Array(ta)).assertTrue();
      }

      // --- [2] Verify isInt32Array returns false for the int -1, a negative primitive number ---
      {
        let int32Probe: util.types = new util.types();
        let v: int = -1;
        let r: boolean = int32Probe.isInt32Array(v);
        expect(r).assertFalse();
        expect(v).assertLess(0);
      }

      // --- [3] Verify the largest int and the long one above it are both rejected, each still above its predecessor bound ---
      {
        let int32Probe: util.types = new util.types();
        let largestInt: int = 2147483647;
        let aboveInt: long = 2147483648;
        expect(int32Probe.isInt32Array(largestInt)).assertFalse();
        expect(largestInt).assertLarger(0);
        expect(int32Probe.isInt32Array(aboveInt)).assertFalse();
        expect(aboveInt).assertLarger(2147483647);
      }

      // --- [4] Verify isInt32Array returns false for Math.PI and its negation, a fractional double of either sign and both boolean primitives true and false ---
      {
        let int32Checker: util.types = new util.types();
        let baseValue: double = Math.PI;
        let positivePi: double = baseValue;
        let negativePi: double = -baseValue;
        let r1: boolean = int32Checker.isInt32Array(positivePi);
        let r2: boolean = int32Checker.isInt32Array(negativePi);
        expect(r1 || r2).assertFalse();
        let int32Checker_2: util.types = new util.types();
        let values: boolean[] = [true, false];
        let accepted: int = 0;
        for (let i: int = 0; i < values.length; i++) {
          if (int32Checker_2.isInt32Array(values[i])) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(0);
      }

      // --- [5] Verify isInt32Array returns false for BigInt64Array and BigUint64Array views ---
      {
        let int32Checker: util.types = new util.types();
        let otherBigInt64: BigInt64Array = new BigInt64Array(new ArrayBuffer(8));
        let verdictBigInt64: boolean = int32Checker.isInt32Array(otherBigInt64);
        expect(verdictBigInt64).assertFalse();
        let otherBigUint64: BigUint64Array = new BigUint64Array(new ArrayBuffer(8));
        let verdictBigUint64: boolean = int32Checker.isInt32Array(otherBigUint64);
        expect(verdictBigUint64).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0800
     * @tc.name testTypesIsInt32Array008
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a plain int array of the three values 1, 2 and 3; rejects an empty int array, which has no element to inspect; string array, whose elements are not numbers at all; double array, a plain array of fractional numbers and boolean array, a plain array of true and false; nested int array of two rows, which is an array of arrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt32Array returns false for a plain int array of the three values 1, 2 and 3 ---
      {
        let int32Probe: util.types = new util.types();
        let arr: int[] = [1, 2, 3];
        let r: boolean = int32Probe.isInt32Array(arr);
        expect(r).assertFalse();
        expect(arr.length).assertEqual(3);
      }

      // --- [2] Verify isInt32Array returns false for an empty int array, which has no element to inspect ---
      {
        let int32Checker: util.types = new util.types();
        let arr: int[] = [];
        let r: boolean = int32Checker.isInt32Array(arr);
        expect(r).assertFalse();
      }

      // --- [3] Verify isInt32Array returns false for a string array, whose elements are not numbers at all ---
      {
        let int32Checker: util.types = new util.types();
        let arr: string[] = ['a', 'b'];
        let r: boolean = int32Checker.isInt32Array(arr);
        expect(r).assertFalse();
      }

      // --- [4] Verify isInt32Array returns false for a double array, a plain array of fractional numbers and boolean array, a plain array of true and false ---
      {
        let int32Checker: util.types = new util.types();
        let arr: double[] = [1.5, 2.5];
        let r: boolean = int32Checker.isInt32Array(arr);
        expect(r).assertFalse();
        let int32Checker_2: util.types = new util.types();
        let arr_2: boolean[] = [true, false];
        let r_2: boolean = int32Checker_2.isInt32Array(arr_2);
        expect(r_2).assertFalse();
      }

      // --- [5] Verify isInt32Array returns false for a nested int array of two rows, which is an array of arrays ---
      {
        let int32Probe: util.types = new util.types();
        let arr: int[][] = [[1, 2], [3, 4]];
        let r: boolean = int32Probe.isInt32Array(arr);
        expect(r).assertFalse();
        expect(arr.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_0900
     * @tc.name testTypesIsInt32Array009
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a mixed Object array holding a number, a string and a boolean; RegExp built from the pattern string a with the g flag; swapping the view held in a holder field for a plain int array flips the judgement from true to false; Set holding one int element, a unique value container; Promise resolved with the int value 1.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt32Array returns false for a mixed Object array holding a number, a string and a boolean ---
      {
        let int32Checker: util.types = new util.types();
        let arr: Array<Object> = [1, 'a', true];
        let r: boolean = int32Checker.isInt32Array(arr);
        expect(r).assertFalse();
      }

      // --- [2] Verify isInt32Array returns false for a RegExp built from the pattern string a with the g flag ---
      {
        let int32Checker: util.types = new util.types();
        let re: RegExp = new RegExp('a', 'g');
        let r: boolean = int32Checker.isInt32Array(re);
        expect(r).assertFalse();
      }

      // --- [3] Verify swapping the view held in a holder field for a plain int array flips the judgement from true to false ---
      {
        let int32Checker: util.types = new util.types();
        let holder: ViewSlot = new ViewSlot();
        holder.slot = new Int32Array([7]);
        let before: boolean = int32Checker.isInt32Array(holder.slot);
        let plain: int[] = [7];
        holder.slot = plain;
        let after: boolean = int32Checker.isInt32Array(holder.slot);
        expect(before).assertTrue();
        expect(after).assertFalse();
      }

      // --- [4] Verify isInt32Array returns false for a Set holding one int element, a unique value container ---
      {
        let int32Checker: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        s.add(1);
        let r: boolean = int32Checker.isInt32Array(s);
        expect(r).assertFalse();
      }

      // --- [5] Verify isInt32Array returns false for a Promise resolved with the int value 1 ---
      {
        let int32Checker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        let r: boolean = int32Checker.isInt32Array(p);
        expect(r).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1000
     * @tc.name testTypesIsInt32Array010
     * @tc.desc Merged batch (1 test): Primitive value rejection: toLocaleString renders the elements as one string that the typed array predicate rejects.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify toLocaleString renders the elements as one string that the typed array predicate rejects ---
      {
        let int32Probe: util.types = new util.types();
        let source: Int32Array = new Int32Array([5, 6]);
        let rendered: string = source.toLocaleString();
        expect(int32Probe.isInt32Array(rendered)).assertFalse();
        expect(int32Probe.isInt32Array(source)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1100
     * @tc.name testTypesIsInt32Array011
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a union typed subject flips from true to false when its active member changes from a view to a plain array; isInt32Array rejects eight sibling views: Int8, Int16, Uint8, Uint8Clamped, Uint16, Uint32, Float32 and Float64 in one pass; rejects a bare ArrayBuffer of 8 bytes, which is a buffer not a view; a Uint8Array subarray view stays false, a subarray keeps the element type of its source; rejects Error and TypeError instances.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a union typed subject flips from true to false when its active member changes from a view to a plain array ---
      {
        let int32Checker: util.types = new util.types();
        let view: Int32Array = new Int32Array([1]);
        let plain: int[] = [1];
        let subject: Int32Array | int[] = view;
        let a: boolean = int32Checker.isInt32Array(subject);
        subject = plain;
        let b: boolean = int32Checker.isInt32Array(subject);
        expect(a).assertTrue();
        expect(b).assertFalse();
      }

      // --- [2] Verify isInt32Array rejects eight sibling views: Int8, Int16, Uint8, Uint8Clamped, Uint16, Uint32, Float32 and Float64 in one pass ---
      {
        let int32Checker: util.types = new util.types();
        let candidates: Object[] = [
        new Int8Array(new ArrayBuffer(4)),
        new Int16Array(new ArrayBuffer(4)),
        new Uint8Array(new ArrayBuffer(4)),
        new Uint8ClampedArray(new ArrayBuffer(4)),
        new Uint16Array(new ArrayBuffer(4)),
        new Uint32Array(new ArrayBuffer(4)),
        new Float32Array(new ArrayBuffer(4)),
        new Float64Array(new ArrayBuffer(8))
        ];
        let hits: int = 0;
        for (let i: int = 0; i < candidates.length; i++) {
        if (int32Checker.isInt32Array(candidates[i])) {
          hits++;
        }
        }
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify isInt32Array returns false for a bare ArrayBuffer of 8 bytes, which is a buffer not a view ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let r: boolean = int32Probe.isInt32Array(buf);
        expect(r).assertFalse();
        expect(buf.byteLength).assertEqual(8);
      }

      // --- [4] Verify a Uint8Array subarray view stays false, a subarray keeps the element type of its source ---
      {
        let int32Probe: util.types = new util.types();
        let base: Uint8Array = new Uint8Array(new ArrayBuffer(4));
        let view: Uint8Array = base.subarray(0, 2);
        let r: boolean = int32Probe.isInt32Array(view);
        expect(r).assertFalse();
        expect(view.length).assertEqual(2);
      }

      // --- [5] Verify isInt32Array returns false for Error and TypeError instances ---
      {
        let int32Checker: util.types = new util.types();
        let failureError: Error = new Error('boom');
        let verdictError: boolean = int32Checker.isInt32Array(failureError);
        expect(verdictError).assertFalse();
        let failureTypeError: TypeError = new TypeError('bad');
        let verdictTypeError: boolean = int32Checker.isInt32Array(failureTypeError);
        expect(verdictTypeError).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1200
     * @tc.name testTypesIsInt32Array012
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a WeakMap keyed by a class instance, a weak key container; a wrapper object holding an items array field is false, a field of array type is not identity; rejects a WeakSet of class instances, a weak unique value container; rejects the iterator produced by Map.keys of a one entry Map and Map.values of a one entry Map; rejects an instance of the class SampleData with tag data and val 0.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt32Array returns false for a WeakMap keyed by a class instance, a weak key container ---
      {
        let int32Checker: util.types = new util.types();
        let wm: WeakMap<WeakKey, WeakKey> = new WeakMap<WeakKey, WeakKey>();
        let r: boolean = int32Checker.isInt32Array(wm);
        expect(r).assertFalse();
      }

      // --- [2] Verify a wrapper object holding an items array field is false, a field of array type is not identity ---
      {
        let int32Probe: util.types = new util.types();
        let obj: NestedValue = { items: [1, 2, 3] };
        let r: boolean = int32Probe.isInt32Array(obj);
        expect(r).assertFalse();
        expect(obj.items.length).assertEqual(3);
      }

      // --- [3] Verify isInt32Array returns false for a WeakSet of class instances, a weak unique value container ---
      {
        let int32Checker: util.types = new util.types();
        let ws: WeakSet<WeakKey> = new WeakSet<WeakKey>();
        let r: boolean = int32Checker.isInt32Array(ws);
        expect(r).assertFalse();
      }

      // --- [4] Verify isInt32Array returns false for the iterator produced by Map.keys of a one entry Map and Map.values of a one entry Map ---
      {
        let int32Checker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let iter: IterableIterator<string> = m.keys();
        let r: boolean = int32Checker.isInt32Array(iter);
        expect(r).assertFalse();
        let int32Checker_2: util.types = new util.types();
        let m_2: Map<string, int> = new Map<string, int>();
        m_2.set('a', 1);
        let iter_2: IterableIterator<int> = m_2.values();
        let r_2: boolean = int32Checker_2.isInt32Array(iter_2);
        expect(r_2).assertFalse();
      }

      // --- [5] Verify isInt32Array returns false for an instance of the class SampleData with tag data and val 0 ---
      {
        let int32Probe: util.types = new util.types();
        let obj: SampleData = new SampleData();
        let r: boolean = int32Probe.isInt32Array(obj);
        expect(r).assertFalse();
        expect(obj.tag).assertEqual('data');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1300
     * @tc.name testTypesIsInt32Array013
     * @tc.desc Merged batch (5 tests): Non-target object rejection: an Int32Array is a typed array and an array buffer view but not an array buffer itself; a DataView is an array buffer view but neither a typed array nor an Int32Array; a bare ArrayBuffer is an array buffer but neither a view nor a typed array nor an Int32Array; a Uint32Array of the same four byte width is a typed array and a buffer view but not an Int32Array; an array holding an Int32Array element is itself false, the container is a plain array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int32Array is a typed array and an array buffer view but not an array buffer itself ---
      {
        let int32Checker: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1]);
        let a: boolean = int32Checker.isInt32Array(ta);
        let b: boolean = int32Checker.isTypedArray(ta);
        let c: boolean = int32Checker.isArrayBufferView(ta);
        let d: boolean = int32Checker.isArrayBuffer(ta);
        expect(a).assertTrue();
        expect(b).assertTrue();
        expect(c).assertTrue();
        expect(d).assertFalse();
      }

      // --- [2] Verify a DataView is an array buffer view but neither a typed array nor an Int32Array ---
      {
        let int32Checker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let a: boolean = int32Checker.isInt32Array(dv);
        let b: boolean = int32Checker.isTypedArray(dv);
        let c: boolean = int32Checker.isArrayBufferView(dv);
        let d: boolean = int32Checker.isArrayBuffer(dv);
        expect(a).assertFalse();
        expect(b).assertFalse();
        expect(c).assertTrue();
        expect(d).assertFalse();
      }

      // --- [3] Verify a bare ArrayBuffer is an array buffer but neither a view nor a typed array nor an Int32Array ---
      {
        let int32Checker: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let a: boolean = int32Checker.isInt32Array(buf);
        let b: boolean = int32Checker.isTypedArray(buf);
        let c: boolean = int32Checker.isArrayBufferView(buf);
        let d: boolean = int32Checker.isArrayBuffer(buf);
        expect(a).assertFalse();
        expect(b).assertFalse();
        expect(c).assertFalse();
        expect(d).assertTrue();
      }

      // --- [4] Verify a Uint32Array of the same four byte width is a typed array and a buffer view but not an Int32Array ---
      {
        let int32Checker: util.types = new util.types();
        let u: Uint32Array = new Uint32Array(2);
        let a: boolean = int32Checker.isInt32Array(u);
        let b: boolean = int32Checker.isTypedArray(u);
        let c: boolean = int32Checker.isArrayBufferView(u);
        expect(a).assertFalse();
        expect(b).assertTrue();
        expect(c).assertTrue();
      }

      // --- [5] Verify an array holding an Int32Array element is itself false, the container is a plain array ---
      {
        let int32Probe: util.types = new util.types();
        let inner: Int32Array = new Int32Array([1, 2]);
        let holder: Array<Object> = [inner];
        let r: boolean = int32Probe.isInt32Array(holder);
        expect(r).assertFalse();
        expect(holder.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1400
     * @tc.name testTypesIsInt32Array014
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a word written through a DataView reads back through an Int32Array window; detection leaves the size of a rejected two entry Map unchanged at 2; detection leaves the size of a rejected two element Set unchanged at 2; two views of one 8 byte buffer split by element type, Int32Array true and Int16Array false; two views of one 8 byte buffer split by view kind, Int32Array true and DataView false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a word written through a DataView reads back through an Int32Array window while the DataView is not one ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let ia: Int32Array = new Int32Array(buf);
        let dv: DataView = new DataView(buf);
        dv.setInt32(0, -12345, true);
        let r1: boolean = int32Probe.isInt32Array(ia);
        let r2: boolean = int32Probe.isInt32Array(dv);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        expect(ia.$_get(0)).assertEqual(-12345);
        expect(dv.getInt32(0, true)).assertEqual(-12345);
      }

      // --- [2] Verify detection leaves the size of a rejected two entry Map unchanged at 2 ---
      {
        let int32Probe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let r: boolean = int32Probe.isInt32Array(m);
        expect(r).assertFalse();
        expect(m.size).assertEqual(2);
      }

      // --- [3] Verify detection leaves the size of a rejected two element Set unchanged at 2 ---
      {
        let int32Probe: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        expect(int32Probe.isInt32Array(s)).assertFalse();
        expect(s.has(1)).assertTrue();
        expect(s.size).assertEqual(2);
      }

      // --- [4] Verify two views of one 8 byte buffer split by element type, Int32Array true and Int16Array false ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let i32v: Int32Array = new Int32Array(buf);
        let i16v: Int16Array = new Int16Array(buf);
        let r1: boolean = int32Probe.isInt32Array(i32v);
        let r2: boolean = int32Probe.isInt32Array(i16v);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        expect(i32v.length).assertEqual(2);
        expect(i16v.length).assertEqual(4);
      }

      // --- [5] Verify two views of one 8 byte buffer split by view kind, Int32Array true and DataView false ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let ia: Int32Array = new Int32Array(buf);
        let dv: DataView = new DataView(buf);
        let r1: boolean = int32Probe.isInt32Array(ia);
        let r2: boolean = int32Probe.isInt32Array(dv);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        expect(dv.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1500
     * @tc.name testTypesIsInt32Array015
     * @tc.desc Merged batch (2 tests): Non-target object rejection: sibling judgements interleaved on one util.types instance give independent answers for a true and a false subject; rewriting an element through $_set does not change the Int32Array identity of the receiver.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sibling judgements interleaved on one util.types instance give independent answers for a true and a false subject ---
      {
        let int32Checker: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1]);
        let u: Uint8Array = new Uint8Array(1);
        let a: boolean = int32Checker.isTypedArray(u);
        let b: boolean = int32Checker.isInt32Array(ta);
        let c: boolean = int32Checker.isArrayBufferView(ta);
        let d: boolean = int32Checker.isInt32Array(u);
        let e: boolean = int32Checker.isTypedArray(ta);
        expect(a).assertTrue();
        expect(b).assertTrue();
        expect(c).assertTrue();
        expect(d).assertFalse();
        expect(e).assertTrue();
      }

      // --- [2] Verify rewriting an element through $_set does not change the Int32Array identity of the receiver ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1, 2]);
        let r1: boolean = int32Probe.isInt32Array(ta);
        ta.$_set(0, 99);
        let r2: boolean = int32Probe.isInt32Array(ta);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(ta.$_get(0)).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1600
     * @tc.name testTypesIsInt32Array016
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts building an Int32Array over a 31 byte buffer raises a RangeError; a 2 element view of a 16 byte buffer reports byteLength 8 while its own buffer stays 16 bytes; a leading subarray of two elements and a tail subarray of three elements with byteOffset 4 both stay Int32Arrays; two Int32Array views carved out of one shared buffer are both recognised as Int32Array; detection copies nothing, a byte written through a Uint8Array view being visible in the Int32Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify building an Int32Array over a 31 byte buffer raises a RangeError while an explicit seven element view is accepted ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(31);
        try {
          new Int32Array(buf);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        let view: Int32Array = new Int32Array(buf, 0, 7);
        let r: boolean = int32Probe.isInt32Array(view);
        expect(r).assertTrue();
        expect(view.length).assertEqual(7);
        expect(buf.byteLength).assertEqual(31);
      }

      // --- [2] Verify a 2 element view of a 16 byte buffer reports byteLength 8 while its own buffer stays 16 bytes ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let view: Int32Array = new Int32Array(buf).subarray(0, 2);
        let r: boolean = int32Probe.isInt32Array(view);
        expect(r).assertTrue();
        expect(view.byteLength).assertEqual(8);
        expect(buf.byteLength).assertEqual(16);
      }

      // --- [3] Verify a leading subarray of two elements and a tail subarray of three elements with byteOffset 4 both stay Int32Arrays ---
      {
        let int32Probe: util.types = new util.types();
        let base: Int32Array = new Int32Array([1, 2, 3, 4]);
        let view: Int32Array = base.subarray(0, 2);
        let r: boolean = int32Probe.isInt32Array(view);
        expect(r).assertTrue();
        expect(view.length).assertEqual(2);
        expect(view.$_get(1)).assertEqual(2);
        let int32Probe_2: util.types = new util.types();
        let base_2: Int32Array = new Int32Array([1, 2, 3, 4]);
        let view_2: Int32Array = base_2.subarray(1);
        let r_2: boolean = int32Probe_2.isInt32Array(view_2);
        expect(r_2).assertTrue();
        expect(view_2.byteOffset).assertEqual(4);
        expect(view_2.length).assertEqual(3);
      }

      // --- [4] Verify two Int32Array views carved out of one shared buffer are both recognised as Int32Array ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let base: Int32Array = new Int32Array(buf);
        let v1: Int32Array = base.subarray(0, 2);
        let v2: Int32Array = base.subarray(2, 4);
        let r1: boolean = int32Probe.isInt32Array(v1);
        let r2: boolean = int32Probe.isInt32Array(v2);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(v1.byteOffset).assertEqual(0);
        expect(v2.byteOffset).assertEqual(8);
      }

      // --- [5] Verify detection copies nothing, a byte written through a Uint8Array view being visible in the Int32Array ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let ia: Int32Array = new Int32Array(buf);
        let ua: Uint8Array = new Uint8Array(buf);
        let r: boolean = int32Probe.isInt32Array(ia);
        ua.$_set(0, 7);
        expect(r).assertTrue();
        expect(ia.$_get(0)).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1700
     * @tc.name testTypesIsInt32Array017
     * @tc.desc Merged batch (5 tests): View and buffer semantics: a view at byteOffset 4 with length 5 covers 20 bytes and one at byteOffset 8 aliases the buffer; a subarray of a subarray accumulates offsets, the nested window keeping byteOffset 8; a window's buffer property exposes the whole store so another view can address the words before it; two windows partitioning a twelve element Int32Array are both recognised and their lengths 7 and 5 sum to the source length; two overlapping subarray windows share the word one writes and the other reads.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a view at byteOffset 4 with length 5 covers 20 bytes and one at byteOffset 8 aliases the buffer so writes reach the full view ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(31);
        let view: Int32Array = new Int32Array(buf, 4, 5);
        let r: boolean = int32Probe.isInt32Array(view);
        expect(r).assertTrue();
        expect(view.byteOffset).assertEqual(4);
        expect(view.length).assertEqual(5);
        expect(view.byteLength).assertEqual(20);
        expect(buf.byteLength).assertEqual(31);
        let int32Probe_2: util.types = new util.types();
        let buf_2: ArrayBuffer = new ArrayBuffer(32);
        let full: Int32Array = new Int32Array(buf_2);
        let win: Int32Array = new Int32Array(buf_2, 8, 3);
        win.$_set(0, 77);
        let r_2: boolean = int32Probe_2.isInt32Array(win);
        expect(r_2).assertTrue();
        expect(win.byteOffset).assertEqual(8);
        expect(full.$_get(2)).assertEqual(77);
      }

      // --- [2] Verify a subarray of a subarray accumulates offsets, the nested window keeping byteOffset 8 ---
      {
        let int32Probe: util.types = new util.types();
        let base: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
        let outer: Int32Array = base.subarray(1, 5);
        let inner: Int32Array = outer.subarray(1, 3);
        let r: boolean = int32Probe.isInt32Array(inner);
        expect(r).assertTrue();
        expect(inner.byteOffset).assertEqual(8);
        expect(inner.length).assertEqual(2);
        expect(inner.$_get(0)).assertEqual(3);
      }

      // --- [3] Verify a window's buffer property exposes the whole store so another view can address the words before it ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let win: Int32Array = new Int32Array(buf).subarray(1, 3);
        let whole: ArrayBuffer = win.buffer;
        let lead: Int32Array = new Int32Array(whole, 0, 1);
        win.$_set(0, 42);
        let r1: boolean = int32Probe.isInt32Array(win);
        let r2: boolean = int32Probe.isInt32Array(lead);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(whole.byteLength).assertEqual(16);
        expect(win.byteOffset).assertEqual(4);
        expect(lead.$_get(0)).assertEqual(0);
      }

      // --- [4] Verify two windows partitioning a twelve element Int32Array are both recognised and their lengths 7 and 5 sum to the source length ---
      {
        let int32Probe: util.types = new util.types();
        let base: Int32Array = new Int32Array(12);
        let head: Int32Array = base.subarray(0, 7);
        let tail: Int32Array = base.subarray(7);
        let r1: boolean = int32Probe.isInt32Array(head);
        let r2: boolean = int32Probe.isInt32Array(tail);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(head.length + tail.length).assertEqual(base.length);
      }

      // --- [5] Verify two overlapping subarray windows share the word one writes and the other reads ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let base: Int32Array = new Int32Array(buf);
        let left: Int32Array = base.subarray(0, 3);
        let right: Int32Array = base.subarray(1, 4);
        left.$_set(1, 55);
        let r1: boolean = int32Probe.isInt32Array(left);
        let r2: boolean = int32Probe.isInt32Array(right);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(right.$_get(0)).assertEqual(55);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1800
     * @tc.name testTypesIsInt32Array018
     * @tc.desc Merged batch (5 tests): View and buffer semantics: an array sized from three times a two element window holds six elements and 24 bytes; little endian byte order, a byte 1 at the lowest offset giving the value 1; the same bits read as an int through Int32Array and as 1.5 through Float32Array, only the integer view being accepted; a view returned by a pass through helper is accepted and still aliases the caller store; one bit pattern reads as an int and as a quiet NaN through two views that compare unequal, and bytes 0,0,0,128 give the int minimum.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an array sized from three times a two element window holds six elements and 24 bytes while four 255 bytes read back as -1 ---
      {
        let int32Probe: util.types = new util.types();
        let base: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
        let window: Int32Array = base.subarray(2, 4);
        let factor: int = 3;
        let derived: Int32Array = new Int32Array(window.length * factor);
        let r1: boolean = int32Probe.isInt32Array(window);
        let r2: boolean = int32Probe.isInt32Array(derived);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(window.length).assertEqual(2);
        expect(derived.byteLength).assertEqual(24);
        let int32Probe_2: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let bytes: Uint8Array = new Uint8Array(buf);
        bytes.fill(255);
        let ia: Int32Array = new Int32Array(buf);
        let r: boolean = int32Probe_2.isInt32Array(ia);
        expect(r).assertTrue();
        expect(ia.$_get(0)).assertEqual(-1);
      }

      // --- [2] Verify little endian byte order, a byte 1 at the lowest offset giving the value 1 while a byte 1 at the highest offset gives 16777216 ---
      {
        let int32Probe: util.types = new util.types();
        let lowBuf: ArrayBuffer = new ArrayBuffer(4);
        let lowBytes: Uint8Array = new Uint8Array(lowBuf);
        lowBytes.$_set(0, 1);
        let low: Int32Array = new Int32Array(lowBuf);
        let highBuf: ArrayBuffer = new ArrayBuffer(4);
        let highBytes: Uint8Array = new Uint8Array(highBuf);
        highBytes.$_set(3, 1);
        let high: Int32Array = new Int32Array(highBuf);
        let r1: boolean = int32Probe.isInt32Array(low);
        let r2: boolean = int32Probe.isInt32Array(high);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(low.$_get(0)).assertEqual(1);
        expect(high.$_get(0)).assertEqual(16777216);
      }

      // --- [3] Verify the same bits read as an int through Int32Array and as 1.5 through Float32Array, only the integer view being accepted ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let iv: Int32Array = new Int32Array(buf);
        let fv: Float32Array = new Float32Array(buf);
        iv.$_set(0, 1069547520);
        let r1: boolean = int32Probe.isInt32Array(iv);
        let r2: boolean = int32Probe.isInt32Array(fv);
        let asDouble: double = fv.$_get(0);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        expect(asDouble).assertEqual(1.5);
      }

      // --- [4] Verify a view returned by a pass through helper is accepted and still aliases the caller store ---
      {
        let int32Probe: util.types = new util.types();
        let original: Int32Array = new Int32Array([2, 4]);
        let returned: Int32Array = passViewThrough(original);
        returned.$_set(0, 9);
        let r: boolean = int32Probe.isInt32Array(returned);
        expect(r).assertTrue();
        expect(original.$_get(0)).assertEqual(9);
      }

      // --- [5] Verify one bit pattern reads as an int and as a quiet NaN through two views that compare unequal, and bytes 0,0,0,128 give the int minimum ---
      {
        let int32Probe: util.types = new util.types();
        let firstBuf: ArrayBuffer = new ArrayBuffer(4);
        let firstInt: Int32Array = new Int32Array(firstBuf);
        let firstFloat: Float32Array = new Float32Array(firstBuf);
        firstInt.$_set(0, 2143289344);
        let nanVal: double = firstFloat.$_get(0);
        let secondBuf: ArrayBuffer = new ArrayBuffer(4);
        let secondInt: Int32Array = new Int32Array(secondBuf);
        let secondFloat: Float32Array = new Float32Array(secondBuf);
        secondInt.$_set(0, 2143289344);
        let otherNan: double = secondFloat.$_get(0);
        let r: boolean = int32Probe.isInt32Array(firstInt);
        expect(r).assertTrue();
        expect(nanVal === otherNan).assertFalse();
        expect(int32Probe.isInt32Array(firstFloat)).assertFalse();
        let int32Probe_2: util.types = new util.types();
        let minInt: int = -2147483647 - 1;
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let bytes: Uint8Array = new Uint8Array(buf);
        bytes.$_set(0, 0);
        bytes.$_set(1, 0);
        bytes.$_set(2, 0);
        bytes.$_set(3, 128);
        let ia: Int32Array = new Int32Array(buf);
        let r_2: boolean = int32Probe_2.isInt32Array(ia);
        expect(r_2).assertTrue();
        expect(ia.$_get(0)).assertEqual(minInt);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_1900
     * @tc.name testTypesIsInt32Array019
     * @tc.desc Merged batch (5 tests): View and buffer semantics: a copy sliced from a subarray window is recognised, starts at byteOffset 0 and keeps the window element 6; a view stored in the value position of a Map is recognised after the lookup, which returns an optional that must be unwrapped; a view registered as a Set member is recognised when yielded by the value iterator and the membership test still succeeds; a view held in the value position of a WeakMap is recognised after the lookup by the class key; a view read from an interface field keeps its three elements and one used as a Map key is accepted with its entry value intact.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a copy sliced from a subarray window is recognised, starts at byteOffset 0 and keeps the window element 6 ---
      {
        let int32Probe: util.types = new util.types();
        let base: Int32Array = new Int32Array([5, 6, 7, 8]);
        let window: Int32Array = base.subarray(1, 4);
        let parted: Int32Array = window.slice(0, 2);
        let r1: boolean = int32Probe.isInt32Array(window);
        let r2: boolean = int32Probe.isInt32Array(parted);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(parted.$_get(0)).assertEqual(6);
        expect(parted.byteOffset).assertEqual(0);
      }

      // --- [2] Verify a view stored in the value position of a Map is recognised after the lookup, which returns an optional that must be unwrapped ---
      {
        let int32Probe: util.types = new util.types();
        let view: Int32Array = new Int32Array([9]);
        let m: Map<string, Int32Array> = new Map<string, Int32Array>();
        m.set('slot', view);
        let fetched: Int32Array | undefined = m.get('slot');
        let r: boolean = int32Probe.isInt32Array(fetched!);
        expect(r).assertTrue();
        expect(fetched!.length).assertEqual(1);
      }

      // --- [3] Verify a view registered as a Set member is recognised when yielded by the value iterator and the membership test still succeeds ---
      {
        let int32Probe: util.types = new util.types();
        let member: Int32Array = new Int32Array([1, 2, 3, 4]);
        let s: Set<Int32Array> = new Set<Int32Array>();
        s.add(member);
        let hits: int = 0;
        for (const carried of s.values()) {
          if (int32Probe.isInt32Array(carried)) {
            hits++;
          }
        }
        expect(hits).assertEqual(1);
        expect(s.has(member)).assertTrue();
        expect(s.size).assertEqual(1);
      }

      // --- [4] Verify a view held in the value position of a WeakMap is recognised after the lookup by the class key ---
      {
        let int32Probe: util.types = new util.types();
        let key: WeakKey = new WeakKey();
        let view: Int32Array = new Int32Array([3]);
        let wm: WeakMap<WeakKey, Int32Array> = new WeakMap<WeakKey, Int32Array>();
        wm.set(key, view);
        let got: Int32Array | undefined = wm.get(key);
        let r: boolean = int32Probe.isInt32Array(got!);
        expect(r).assertTrue();
        expect(wm.has(key)).assertTrue();
      }

      // --- [5] Verify a view read from an interface field keeps its three elements and one used as a Map key is accepted with its entry value intact ---
      {
        let int32Probe: util.types = new util.types();
        let carrier: ViewCarrier = { view: new Int32Array([1, 2, 3]), tagLabel: 'carrier' };
        let r: boolean = int32Probe.isInt32Array(carrier.view);
        expect(r).assertTrue();
        expect(carrier.view.length).assertEqual(3);
        expect(carrier.tagLabel).assertEqual('carrier');
        let int32Probe_2: util.types = new util.types();
        let key: Int32Array = new Int32Array([5]);
        let m: Map<Int32Array, string> = new Map<Int32Array, string>();
        m.set(key, 'first');
        let recognised: int = 0;
        for (const carried of m.keys()) {
          if (int32Probe_2.isInt32Array(carried)) {
            recognised++;
          }
        }
        expect(recognised).assertEqual(1);
        expect(m.get(key)).assertEqual('first');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2000
     * @tc.name testTypesIsInt32Array020
     * @tc.desc Merged batch (5 tests): View and buffer semantics: detection leaves the length 2 and byteOffset 4 geometry of a subarray view untouched; a factory built view carries its four elements and a holder class method reports true for the view held in its field; judging a window leaves its byteLength 12, byteOffset 4, the 20 byte shared buffer and the stored element 21 all unchanged; a view read from a quoted Record field is recognised and keeps its eight byte width; isInt32Array and isUint32Array layered on one buffer share the word 5.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify detection leaves the length 2 and byteOffset 4 geometry of a subarray view untouched ---
      {
        let int32Probe: util.types = new util.types();
        let base: Int32Array = new Int32Array([1, 2, 3, 4]);
        let view: Int32Array = base.subarray(1, 3);
        let r: boolean = int32Probe.isInt32Array(view);
        expect(r).assertTrue();
        expect(view.length).assertEqual(2);
        expect(view.byteOffset).assertEqual(4);
      }

      // --- [2] Verify a factory built view carries its four elements and a holder class method reports true for the view held in its field ---
      {
        let int32Probe: util.types = new util.types();
        let made: Int32Array = buildView(4);
        let probes: boolean[] = [int32Probe.isInt32Array(made)];
        expect(probes.indexOf(false)).assertEqual(-1);
        expect(made.length).assertEqual(4);
        expect(made.byteLength).assertEqual(16);
        let int32Probe_2: util.types = new util.types();
        let holder: ViewSlot = new ViewSlot();
        holder.slot = new Int32Array([1, 2]);
        let r1: boolean = holder.recognize(int32Probe_2);
        let r2: boolean = int32Probe_2.isInt32Array(holder.slot);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(holder.markLabel).assertEqual('slot');
      }

      // --- [3] Verify judging a window leaves its byteLength 12, byteOffset 4, the 20 byte shared buffer and the stored element 21 all unchanged ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let view: Int32Array = new Int32Array(buf).subarray(1, 4);
        view.$_set(0, 21);
        let r: boolean = int32Probe.isInt32Array(view);
        expect(r).assertTrue();
        expect(view.byteLength).assertEqual(12);
        expect(view.byteOffset).assertEqual(4);
        expect(buf.byteLength).assertEqual(20);
        expect(view.$_get(0)).assertEqual(21);
      }

      // --- [4] Verify a view read from a quoted Record field is recognised and keeps its eight byte width ---
      {
        let int32Probe: util.types = new util.types();
        let view: Int32Array = new Int32Array([1, 2]);
        let rec: Record<string, Int32Array> = { 'primary': view };
        let got: Int32Array = rec['primary']!;
        let r: boolean = int32Probe.isInt32Array(got);
        expect(r).assertTrue();
        expect(got.byteLength).assertEqual(8);
      }

      // --- [5] Verify isInt32Array and isUint32Array layered on one buffer share the word 5 while each claims only its own view ---
      {
        let int32Probe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let signed: Int32Array = new Int32Array(buf);
        let unsigned: Uint32Array = new Uint32Array(buf);
        signed.$_set(0, 5);
        let r1: boolean = int32Probe.isInt32Array(signed);
        let r2: boolean = int32Probe.isInt32Array(unsigned);
        let r3: boolean = int32Probe.isUint32Array(unsigned);
        let r4: boolean = int32Probe.isUint32Array(signed);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        expect(r3).assertTrue();
        expect(r4).assertFalse();
        expect(unsigned.$_get(0)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2100
     * @tc.name testTypesIsInt32Array021
     * @tc.desc Merged batch (3 tests): View and buffer semantics: over one buffer only the Int32Array is accepted; a ternary picks the view branch for an Int32Array and a helper with an early return labels a view int32 and a Uint8Array other; filtering a mixed Object array by isInt32Array keeps exactly the two Int32Array views.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify over one buffer only the Int32Array is accepted while the Int16Array and DataView stay array buffer views ---
      {
        let int32Checker: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let i32v: Int32Array = new Int32Array(buf);
        let i16v: Int16Array = new Int16Array(buf);
        let dv: DataView = new DataView(buf);
        let a: boolean = int32Checker.isInt32Array(i32v);
        let b: boolean = int32Checker.isInt32Array(i16v);
        let c: boolean = int32Checker.isInt32Array(dv);
        let d: boolean = int32Checker.isArrayBufferView(i16v);
        let e: boolean = int32Checker.isArrayBufferView(dv);
        expect(a).assertTrue();
        expect(b).assertFalse();
        expect(c).assertFalse();
        expect(d).assertTrue();
        expect(e).assertTrue();
      }

      // --- [2] Verify a ternary picks the view branch for an Int32Array and a helper with an early return labels a view int32 and a Uint8Array other ---
      {
        let int32Checker: util.types = new util.types();
        let view: Int32Array = new Int32Array([1]);
        let plain: int[] = [1];
        let chosenView: Object = int32Checker.isInt32Array(view) ? view : plain;
        let chosenPlain: Object = int32Checker.isInt32Array(plain) ? view : plain;
        let r1: boolean = int32Checker.isInt32Array(chosenView);
        let r2: boolean = int32Checker.isInt32Array(chosenPlain);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        let int32Probe: util.types = new util.types();
        let view_2: Int32Array = new Int32Array([1]);
        let bytes: Uint8Array = new Uint8Array(1);
        let a: string = classifyView(int32Probe, view_2);
        let b: string = classifyView(int32Probe, bytes);
        let r1_2: boolean = int32Probe.isInt32Array(view_2);
        let r2_2: boolean = int32Probe.isInt32Array(bytes);
        expect(a).assertEqual('int32');
        expect(b).assertEqual('other');
        expect(r1_2).assertTrue();
        expect(r2_2).assertFalse();
      }

      // --- [3] Verify filtering a mixed Object array by isInt32Array keeps exactly the two Int32Array views ---
      {
        let int32Probe: util.types = new util.types();
        let plain: int[] = [1];
        let first: Int32Array = new Int32Array([1]);
        let second: Int32Array = new Int32Array([2]);
        let unsigned: Uint8Array = new Uint8Array(1);
        let mixed: Array<Object> = [plain, first, unsigned, second];
        let kept: Array<Object> = mixed.filter((item: Object): boolean => int32Probe.isInt32Array(item));
        let r1: boolean = int32Probe.isInt32Array(kept[0]);
        let r2: boolean = int32Probe.isInt32Array(kept[1]);
        expect(kept.length).assertEqual(2);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(mixed.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2200
     * @tc.name testTypesIsInt32Array022
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: accepts an Int32Array of 1, -1 and 0 and the sign of each element survives; an Int32Array holding -5 and -6 is recognised and both negative values are preserved; isInt32Array accepts a slice copy that keeps its element after the source is overwritten and shares no buffer; a copy constructed Int32Array is recognised and owns an independent store; forEach visits every element without a copy and the array keeps its verdict.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt32Array returns true for an Int32Array of 1, -1 and 0 and the sign of each element survives ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1, -1, 0]);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.$_get(0)).assertEqual(1);
        expect(ta.$_get(1)).assertEqual(-1);
        expect(ta.$_get(2)).assertEqual(0);
      }

      // --- [2] Verify an Int32Array holding -5 and -6 is recognised and both negative values are preserved ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = Int32Array.from([-5, -6]);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.$_get(0)).assertEqual(-5);
        expect(ta.$_get(1)).assertEqual(-6);
      }

      // --- [3] Verify isInt32Array accepts a slice copy that keeps its element after the source is overwritten and shares no buffer ---
      {
        let int32Probe: util.types = new util.types();
        let base: Int32Array = new Int32Array([10, 20, 30]);
        let copy: Int32Array = base.slice(0, 2);
        base.$_set(0, 99);
        let r1: boolean = int32Probe.isInt32Array(copy);
        let r2: boolean = int32Probe.isInt32Array(base);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(copy.$_get(0)).assertEqual(10);
        expect(copy.buffer === base.buffer).assertFalse();
      }

      // --- [4] Verify a copy constructed Int32Array is recognised and owns an independent store so writing 8 into the clone leaves the source element at 3 ---
      {
        let int32Probe: util.types = new util.types();
        let src: Int32Array = new Int32Array([3, 4]);
        let clone: Int32Array = new Int32Array(src);
        clone.$_set(0, 8);
        let r1: boolean = int32Probe.isInt32Array(clone);
        let r2: boolean = int32Probe.isInt32Array(src);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(clone.length).assertEqual(2);
        expect(src.$_get(0)).assertEqual(3);
      }

      // --- [5] Verify forEach visits every element without a copy and the array keeps its verdict ---
      {
        let int32Probe: util.types = new util.types();
        let source: Int32Array = new Int32Array([3, 1, 2]);
        let seen: double = 0;
        source.forEach((v: double, i: int, a: Int32Array) => { seen = seen + v; });
        expect(seen).assertEqual(6);
        expect(int32Probe.isInt32Array(source)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2300
     * @tc.name testTypesIsInt32Array023
     * @tc.desc Merged batch (1 test): State preservation and aliasing: detection leaves the x property of an inspected PlainValue object unchanged at 1.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify detection leaves the x property of an inspected PlainValue object unchanged at 1 ---
      {
        let int32Probe: util.types = new util.types();
        let obj: PlainValue = { x: 1 };
        let r: boolean = int32Probe.isInt32Array(obj);
        expect(r).assertFalse();
        expect(obj.x).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2400
     * @tc.name testTypesIsInt32Array024
     * @tc.desc Merged batch (3 tests): Container and field storage: verifies verdicts for values carried through intermediate holders, covering single-element inputs.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a single element array reports length 1 and a five element array byteLength 20, both recognised ---
      {
        let int32Probe: util.types = new util.types();
        let single: Int32Array = new Int32Array(1);
        let five: Int32Array = new Int32Array(5);
        let singleVerdict: boolean = int32Probe.isInt32Array(single);
        let fiveVerdict: boolean = int32Probe.isInt32Array(five);
        expect(singleVerdict).assertTrue();
        expect(single.length).assertEqual(1);
        expect(fiveVerdict).assertTrue();
        expect(five.byteLength).assertEqual(20);
      }

      // --- [2] Verify an Int32Array of the prime length 13 is recognised and its byteLength equals 13 times the static BYTES_PER_ELEMENT ---
      {
        let int32Probe: util.types = new util.types();
        let ta: Int32Array = new Int32Array(13);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.length).assertEqual(13);
        expect(ta.byteLength).assertEqual(13 * Int32Array.BYTES_PER_ELEMENT);
      }

      // --- [3] Verify a length derived from the product of 3 and 7 gives a recognised Int32Array of 21 elements and 84 bytes ---
      {
        let int32Probe: util.types = new util.types();
        let rows: int = 3;
        let columns: int = 7;
        let ta: Int32Array = new Int32Array(rows * columns);
        let r: boolean = int32Probe.isInt32Array(ta);
        expect(r).assertTrue();
        expect(ta.length).assertEqual(21);
        expect(ta.byteLength).assertEqual(84);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2500
     * @tc.name testTypesIsInt32Array025
     * @tc.desc Merged batch (5 tests): API call consistency: two consecutive detections of the same Int32Array both report true, the judgement is stable; accepts an Int32Array while a Uint32Array stays rejected; accepts an Int32Array while a bare ArrayBuffer stays rejected; the view at index one of a two entry Object array is recognised through that element; two consecutive detections of the same Uint8Array both report false, the judgement is stable.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two consecutive detections of the same Int32Array both report true, the judgement is stable ---
      {
        let int32Checker: util.types = new util.types();
        let ta: Int32Array = new Int32Array([4, 5]);
        let r1: boolean = int32Checker.isInt32Array(ta);
        let r2: boolean = int32Checker.isInt32Array(ta);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
      }

      // --- [2] Verify isInt32Array returns true for an Int32Array while a Uint32Array stays rejected ---
      {
        let int32Probe: util.types = new util.types();
        expect(int32Probe.isInt32Array(new Int32Array(1))).assertTrue();
        expect(int32Probe.isInt32Array(new Uint32Array(1))).assertFalse();
      }

      // --- [3] Verify isInt32Array returns true for an Int32Array while a bare ArrayBuffer stays rejected ---
      {
        let int32Probe: util.types = new util.types();
        let foreign: Object[] = [new ArrayBuffer(8)];
        let accepted: boolean = int32Probe.isInt32Array(new Int32Array(4));
        expect(accepted).assertTrue();
        expect(int32Probe.isInt32Array(foreign[0])).assertFalse();
      }

      // --- [4] Verify the view at index one of a two entry Object array is recognised through that element while the array itself is not an Int32Array ---
      {
        let int32Probe: util.types = new util.types();
        let plain: int[] = [1];
        let view: Int32Array = new Int32Array([2]);
        let box: Array<Object> = [plain, view];
        let r1: boolean = int32Probe.isInt32Array(box);
        let r2: boolean = int32Probe.isInt32Array(box[1]);
        expect(r1).assertFalse();
        expect(r2).assertTrue();
        expect(box.length).assertEqual(2);
      }

      // --- [5] Verify two consecutive detections of the same Uint8Array both report false, the judgement is stable ---
      {
        let int32Checker: util.types = new util.types();
        let other: Uint8Array = new Uint8Array(1);
        let r1: boolean = int32Checker.isInt32Array(other);
        let r2: boolean = int32Checker.isInt32Array(other);
        expect(r1).assertFalse();
        expect(r2).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2600
     * @tc.name testTypesIsInt32Array026
     * @tc.desc Merged batch (2 tests): API call consistency: two separately constructed util.types instances give the same verdict for the same Int32Array; a plain array check and an Int32Array check on the same instance do not influence each other.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two separately constructed util.types instances give the same verdict for the same Int32Array ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let ta: Int32Array = new Int32Array([1, 2, 3]);
        let r1: boolean = first.isInt32Array(ta);
        let r2: boolean = second.isInt32Array(ta);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
      }

      // --- [2] Verify a plain array check and an Int32Array check on the same instance do not influence each other ---
      {
        let int32Checker: util.types = new util.types();
        let arr: int[] = [1, 2];
        let ta: Int32Array = new Int32Array([3]);
        let r1: boolean = int32Checker.isInt32Array(arr);
        let r2: boolean = int32Checker.isInt32Array(ta);
        expect(r1).assertFalse();
        expect(r2).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2700
     * @tc.name testTypesIsInt32Array027
     * @tc.desc Merged batch (3 tests): Program integration: verifies use through program paths, covering element counts and related program paths.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a hundred element Int32Array chosen by a conditional expression is recognised ---
      {
        let int32Probe: util.types = new util.types();
        let wide: Int32Array = new Int32Array(100);
        let narrow: Int32Array = new Int32Array(25);
        let flag: boolean = true;
        let chosen: Int32Array = flag ? wide : narrow;
        expect(int32Probe.isInt32Array(chosen)).assertTrue();
        expect(chosen.length).assertEqual(100);
      }

      // --- [2] Verify a switch on the judgement routes an Int32Array subject to the first branch and a plain int array subject to the default branch ---
      {
        let int32Probe: util.types = new util.types();
        let view: Int32Array = new Int32Array([1]);
        let plain: int[] = [1];
        let label: int = 0;
        switch (int32Probe.isInt32Array(view)) {
          case true:
            label = 1;
            break;
          default:
            label = 2;
            break;
        }
        let fallback: int = 0;
        switch (int32Probe.isInt32Array(plain)) {
          case true:
            fallback = 1;
            break;
          default:
            fallback = 2;
            break;
        }
        expect(label).assertEqual(1);
        expect(fallback).assertEqual(2);
      }

      // --- [3] Verify a while loop driven by the judgement stops at the first Int32Array among four mixed candidates, which sits at index three ---
      {
        let int32Probe: util.types = new util.types();
        let plain: int[] = [1];
        let text: string = 'x';
        let bytes: Uint8Array = new Uint8Array(1);
        let view: Int32Array = new Int32Array([1]);
        let candidates: Array<Object> = [plain, text, bytes, view];
        let index: int = 0;
        while (index < candidates.length && !int32Probe.isInt32Array(candidates[index])) {
          index++;
        }
        expect(index).assertEqual(3);
        expect(candidates.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT32_ARRAY_2800
     * @tc.name testTypesIsInt32Array028
     * @tc.desc Merged batch (1 test): Miscellaneous checks: verifies remaining edge cases, covering element counts and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt32Array028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the static from factory builds a recognised Int32Array of three elements out of a plain int array ---
      {
        let int32Probe: util.types = new util.types();
        let seed: int[] = [6, 7, 8];
        let made: Int32Array = Int32Array.from(seed);
        let r: boolean = int32Probe.isInt32Array(made);
        expect(r).assertTrue();
        expect(made.length).assertEqual(3);
        expect(made.$_get(2)).assertEqual(8);
      }
    });

  });
}
