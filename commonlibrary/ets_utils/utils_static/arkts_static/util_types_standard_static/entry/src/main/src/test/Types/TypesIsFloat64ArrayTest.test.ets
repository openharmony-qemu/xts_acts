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

class Float64Coord {
  x: int = 1;
  y: double = -2.5;
}

class Float64Box {
  v: Float64Array = new Float64Array(1);
}

class Float64Key {
  tag: string = 'k';
}

class ArrayLikeBag {
  length: int = 4;
  tag: string = 'fake';
}

class FakeFloat64Shape {
  length: int = 2;
  byteLength: int = 16;
  byteOffset: int = 0;
  buffer: ArrayBuffer = new ArrayBuffer(16);
}

interface Float64Point {
  px: double;
  py: double;
}

function probeFloat64(value: Object): boolean {
  return new util.types().isFloat64Array(value);
}

function buildFloat64Array(): Float64Array {
  return new Float64Array([1.5, 2.5]);
}

function countFloat64Matches(values: Array<Object>): int {
  let checker: util.types = new util.types();
  let hits: int = 0;
  for (let index: int = 0; index < values.length; index++) {
    if (checker.isFloat64Array(values[index])) {
      hits++;
    }
  }
  return hits;
}

function labelFloat64Verdict(flag: boolean): string {
  return flag ? 'float64' : 'other';
}

export default function typesIsFloat64ArrayTest(): void {
  describe('TypesIsFloat64ArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0100
     * @tc.name testTypesIsFloat64Array001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a Float64Array reached only through an Object typed variable; accepts content of positive and negative infinity; accepts content of the largest finite double and its negation; a five element array keeps length 5 and a 256 element array reports byteLength 2048, both recognised; isFloat64Array accepts the array built by Float64Array.of, with a byteLength of 16.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns true for a Float64Array reached only through an Object typed variable ---
      {
        let float64Checker: util.types = new util.types();
        let f: Float64Array = new Float64Array(2);
        let boxed: Object = f;
        expect(float64Checker.isFloat64Array(boxed)).assertTrue();
      }

      // --- [2] Verify isFloat64Array returns true for content of positive and negative infinity ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array([Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY]);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.$_get(0)).assertEqual(Double.POSITIVE_INFINITY);
        expect(f.$_get(1)).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [3] Verify isFloat64Array returns true for content of the largest finite double and its negation ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array([Double.MAX_VALUE, -Double.MAX_VALUE]);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.$_get(0)).assertEqual(Double.MAX_VALUE);
        expect(f.$_get(1)).assertEqual(-Double.MAX_VALUE);
      }

      // --- [4] Verify a five element array keeps length 5 and a 256 element array reports byteLength 2048, both recognised ---
      {
        let float64Probe: util.types = new util.types();
        let small: Float64Array = new Float64Array(5);
        let large: Float64Array = new Float64Array(256);
        expect(float64Probe.isFloat64Array(small)).assertTrue();
        expect(small.length).assertEqual(5);
        expect(float64Probe.isFloat64Array(large)).assertTrue();
        expect(large.byteLength).assertEqual(2048);
      }

      // --- [5] Verify isFloat64Array accepts the array built by Float64Array.of, with a byteLength of 16 ---
      {
        let float64Probe: util.types = new util.types();
        let built: Float64Array = Float64Array.of(1.5, 2.5);
        expect(float64Probe.isFloat64Array(built)).assertTrue();
        expect(built.length).assertEqual(2);
        expect(built.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0200
     * @tc.name testTypesIsFloat64Array002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: isFloat64Array accepts the array built by from over a Float32Array, which converts through iteration; a Float64Array narrowed out of a nullable variable is accepted and yields its stored double; accepts the array produced by the static factory from over a plain double array literal; a Float64Array rebuilt from the buffer of another Float64Array is accepted and shares the same doubles; isFloat64Array accepts the array the constructor widens from a Float32Array, with a larger double element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array accepts the array built by from over a Float32Array, which converts through iteration ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Float32Array = new Float32Array([3.14]);
        let built: Float64Array = Float64Array.from(seed);
        expect(float64Probe.isFloat64Array(built)).assertTrue();
        expect(built.length).assertEqual(1);
        expect(built.$_get(0) === 3.14).assertFalse();
        expect(seed.length).assertEqual(1);
      }

      // --- [2] Verify a Float64Array narrowed out of a nullable variable is accepted and yields its stored double ---
      {
        let float64Probe: util.types = new util.types();
        let holder: Float64Array | null = new Float64Array([2.5]);
        let solid: Float64Array = holder as Float64Array;
        expect(float64Probe.isFloat64Array(solid)).assertTrue();
        expect(solid.$_get(0)).assertEqual(2.5);
      }

      // --- [3] Verify isFloat64Array returns true for the array produced by the static factory from over a plain double array literal ---
      {
        let float64Probe: util.types = new util.types();
        let built: Float64Array = Float64Array.from([1.25, 2.5]);
        expect(float64Probe.isFloat64Array(built)).assertTrue();
        expect(built.length).assertEqual(2);
        expect(built.$_get(1)).assertEqual(2.5);
      }

      // --- [4] Verify a Float64Array rebuilt from the buffer of another Float64Array is accepted and shares the same doubles ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.5, 2.5, 3.5]);
        let rebuilt: Float64Array = new Float64Array(base.buffer);
        let copybuilt: Float64Array = new Float64Array(base);
        expect(float64Probe.isFloat64Array(rebuilt)).assertTrue();
        expect(float64Probe.isFloat64Array(copybuilt)).assertTrue();
        expect(copybuilt.length).assertEqual(3);
        expect(rebuilt.length).assertEqual(3);
        expect(copybuilt.$_get(0)).assertEqual(1.5);
        expect(rebuilt.$_get(2)).assertEqual(3.5);
      }

      // --- [5] Verify isFloat64Array accepts the array the constructor widens from a Float32Array, with a larger double element ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Float32Array = new Float32Array([3.14]);
        let wide: Float64Array = new Float64Array(seed);
        expect(float64Probe.isFloat64Array(wide)).assertTrue();
        expect(wide.byteLength).assertEqual(8);
        expect(seed.byteLength).assertEqual(4);
        expect(wide.$_get(0) > 3.14).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0300
     * @tc.name testTypesIsFloat64Array003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts an array whose derived NaN (infinity minus infinity) is NaN and unequal to a literal NaN; a stored NaN is unordered against zero, failing both comparisons; a sweep over the eleven typed array kinds yields exactly one Float64Array hit; a sweep over four Float64Array construction forms yields four hits; a sweep mixing a Date a Map NaN minus one text a Float64Array and an ArrayBuffer yields exactly one hit.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an array whose derived NaN (infinity minus infinity) is NaN and unequal to a literal NaN is accepted ---
      {
        let float64Probe: util.types = new util.types();
        let inf: double = Double.POSITIVE_INFINITY;
        let derived: double = inf - inf;
        let view: Float64Array = new Float64Array([derived, Double.NaN]);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(Double.isNaN(view.$_get(0))).assertTrue();
        expect(view.$_get(0) === view.$_get(1)).assertFalse();
      }

      // --- [2] Verify a stored NaN is unordered against zero, failing both comparisons, while its finite neighbour is greater ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([Double.NaN, 1.0]);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.$_get(0) > 0.0).assertFalse();
        expect(view.$_get(0) < 0.0).assertFalse();
        expect(view.$_get(1) > 0.0).assertTrue();
      }

      // --- [3] Verify a sweep over the eleven typed array kinds yields exactly one Float64Array hit ---
      {
        let values: Array<Object> = [
          new Float64Array(1) as Object, new Float32Array(1) as Object, new Int8Array(1) as Object,
          new Uint8Array(1) as Object, new Int16Array(1) as Object, new Uint16Array(1) as Object,
          new Int32Array(1) as Object, new Uint32Array(1) as Object, new BigInt64Array(1) as Object,
          new BigUint64Array(1) as Object, new Uint8ClampedArray(1) as Object
        ];
        expect(countFloat64Matches(values)).assertEqual(1);
      }

      // --- [4] Verify a sweep over four Float64Array construction forms yields four hits ---
      {
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let values: Array<Object> = [
          new Float64Array(2) as Object, new Float64Array([1.5, 2.5]) as Object,
          new Float64Array(ab) as Object, new Float64Array(ab, 8, 2) as Object
        ];
        expect(values.length).assertEqual(4);
        expect(countFloat64Matches(values)).assertEqual(4);
      }

      // --- [5] Verify a sweep mixing a Date a Map NaN minus one text a Float64Array and an ArrayBuffer yields exactly one hit ---
      {
        let values: Array<Object> = [
          new Date(0) as Object, new Map<string, int>() as Object, Double.NaN as Object, (-1) as Object,
          'text' as Object, new Float64Array(1) as Object, new ArrayBuffer(4) as Object
        ];
        expect(values.length).assertEqual(7);
        expect(countFloat64Matches(values)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0400
     * @tc.name testTypesIsFloat64Array004
     * @tc.desc Merged batch (1 test): Basic construction and recognition: a write through the slice copy of a Float64Array never reaches the base array that was sliced.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a write through the slice copy of a Float64Array never reaches the base array that was sliced ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
        let sliced: Float64Array = base.slice(1, 3);
        expect(float64Probe.isFloat64Array(sliced)).assertTrue();
        sliced.$_set(0, 9.0);
        expect(base.$_get(1)).assertEqual(2.0);
        expect(sliced.$_get(0)).assertEqual(9.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0500
     * @tc.name testTypesIsFloat64Array005
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: isFloat64Array agrees with the instanceof Float64Array result on the same object reference; accepts an array converted from an Array of doubles that keeps its three elements after the source grows; the source Array of doubles keeps its three elements after both the conversion and the verdict; a Float32Array reference; a Uint8Array and on a DataView.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array agrees with the instanceof Float64Array result on the same object reference ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0, 2.0]);
        let boxed: Object = view as Object;
        expect(boxed instanceof Float64Array).assertTrue();
        expect(float64Probe.isFloat64Array(boxed)).assertEqual(boxed instanceof Float64Array);
      }

      // --- [2] Verify isFloat64Array returns true for an array converted from an Array of doubles that keeps its three elements after the source grows ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Array<double> = [1.5, 2.5, 3.5];
        let built: Float64Array = Float64Array.from(seed);
        expect(float64Probe.isFloat64Array(built)).assertTrue();
        seed.push(4.5);
        expect(built.length).assertEqual(3);
        expect(seed.length).assertEqual(4);
      }

      // --- [3] Verify the source Array of doubles keeps its three elements after both the conversion and the verdict ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Array<double> = [1.5, 2.5, 3.5];
        let view: Float64Array = Float64Array.from(seed);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(seed.length).assertEqual(3);
        expect(seed[0]).assertEqual(1.5);
        expect(seed[2]).assertEqual(3.5);
      }

      // --- [4] Verify isFloat64Array agrees with the instanceof Float64Array result on a Float32Array reference ---
      {
        let float64Probe: util.types = new util.types();
        let other: Float32Array = new Float32Array([1.0, 2.0]);
        let boxed: Object = other as Object;
        expect(boxed instanceof Float64Array).assertFalse();
        expect(float64Probe.isFloat64Array(boxed)).assertEqual(boxed instanceof Float64Array);
      }

      // --- [5] Verify isFloat64Array agrees with the instanceof Float64Array result on a Uint8Array and on a DataView ---
      {
        let float64Probe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(new ArrayBuffer(8));
        let dv: DataView = new DataView(new ArrayBuffer(8));
        let first: Object = uint8View as Object;
        let second: Object = dv as Object;
        expect(float64Probe.isFloat64Array(first)).assertEqual(first instanceof Float64Array);
        expect(float64Probe.isFloat64Array(second)).assertEqual(second instanceof Float64Array);
        expect(first instanceof Float64Array).assertFalse();
        expect(second instanceof Float64Array).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0600
     * @tc.name testTypesIsFloat64Array006
     * @tc.desc Merged batch (1 test): Type conversion and subclassing: isFloat64Array agrees with the instanceof Float64Array result on a Map a RegExp and a plain class instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array agrees with the instanceof Float64Array result on a Map a RegExp and a plain class instance ---
      {
        let float64Probe: util.types = new util.types();
        let m: Map<string, string> = new Map<string, string>();
        let re: RegExp = new RegExp('float64View');
        let coord: Float64Coord = new Float64Coord();
        let first: Object = m as Object;
        let second: Object = re as Object;
        let third: Object = coord as Object;
        expect(float64Probe.isFloat64Array(first)).assertEqual(first instanceof Float64Array);
        expect(float64Probe.isFloat64Array(second)).assertEqual(second instanceof Float64Array);
        expect(float64Probe.isFloat64Array(third)).assertEqual(third instanceof Float64Array);
        expect(coord.x).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0700
     * @tc.name testTypesIsFloat64Array007
     * @tc.desc Merged batch (5 tests): Boundary values: accepts content of both safe integer bounds 9007199254740991 and its negation; Float64Array.of with the single argument 3 yields a one element array holding 3, not three zeros; accepts a zero length construction which reports length 0 and byteLength 0; accepts positive and negative zero, the latter proven by its negative reciprocal, and the smallest subnormal 5e-324; accepts the empty array produced by the static factory Float64Array.of with no arguments.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns true for content of both safe integer bounds 9007199254740991 and its negation ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array([9007199254740991, -9007199254740991]);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.$_get(0)).assertEqual(9007199254740991);
        expect(f.$_get(1)).assertEqual(-9007199254740991);
      }

      // --- [2] Verify Float64Array.of with the single argument 3 yields a one element array holding 3, not three zeros ---
      {
        let float64Probe: util.types = new util.types();
        let built: Float64Array = Float64Array.of(3);
        expect(float64Probe.isFloat64Array(built)).assertTrue();
        expect(built.length).assertEqual(1);
        expect(built.$_get(0)).assertEqual(3);
        expect(built.byteLength).assertEqual(8);
      }

      // --- [3] Verify isFloat64Array returns true for a zero length construction which reports length 0 and byteLength 0 ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array(0);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.length).assertEqual(0);
        expect(f.byteLength).assertEqual(0);
      }

      // --- [4] Verify positive and negative zero, the latter proven by its negative reciprocal, and the smallest subnormal 5e-324 are accepted ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array([-0.0, 0.0]);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(1.0 / f.$_get(0)).assertEqual(Double.NEGATIVE_INFINITY);
        expect(1.0 / f.$_get(1)).assertEqual(Double.POSITIVE_INFINITY);
        let float64Probe_2: util.types = new util.types();
        let f_2: Float64Array = new Float64Array([5e-324]);
        expect(float64Probe_2.isFloat64Array(f_2)).assertTrue();
        expect(f_2.$_get(0) > 0.0).assertTrue();
      }

      // --- [5] Verify isFloat64Array returns true for the empty array produced by the static factory Float64Array.of with no arguments ---
      {
        let float64Probe: util.types = new util.types();
        let built: Float64Array = Float64Array.of();
        expect(float64Probe.isFloat64Array(built)).assertTrue();
        expect(built.length).assertEqual(0);
        expect(built.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0800
     * @tc.name testTypesIsFloat64Array008
     * @tc.desc Merged batch (5 tests): Boundary values: isFloat64Array accepts the smallest normal double, above the subnormal minimum with a finite reciprocal; rejects the empty string and for a repeated 10000 character string; rejects negative zero and for the int -2147483647 and a zero length ArrayBuffer; a single element view over an eight byte buffer and subarrays of one element and the whole store are accepted with their lengths; accepts a middle subarray whose byteOffset is 8 and first element is 2.0.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array accepts the smallest normal double, above the subnormal minimum with a finite reciprocal ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([2.2250738585072014e-308]);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.$_get(0) > Double.MIN_VALUE).assertTrue();
        expect(1.0 / view.$_get(0) < Double.MAX_VALUE).assertTrue();
      }

      // --- [2] Verify isFloat64Array returns false for the empty string and for a repeated 10000 character string ---
      {
        let float64Probe: util.types = new util.types();
        let longText: string = 'f'.repeat(10000);
        expect(float64Probe.isFloat64Array('')).assertFalse();
        expect(float64Probe.isFloat64Array(longText)).assertFalse();
        expect(longText.length).assertEqual(10000);
      }

      // --- [3] Verify isFloat64Array returns false for negative zero and for the int -2147483647 and a zero length ArrayBuffer ---
      {
        let float64Checker: util.types = new util.types();
        let negZero: double = -0.0;
        let low: int = -2147483647;
        expect(float64Checker.isFloat64Array(negZero)).assertFalse();
        expect(float64Checker.isFloat64Array(low)).assertFalse();
        let float64Checker_2: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0);
        expect(float64Checker_2.isFloat64Array(ab)).assertFalse();
        expect(float64Checker_2.isArrayBuffer(ab)).assertTrue();
      }

      // --- [4] Verify a single element view over an eight byte buffer and subarrays of one element and the whole store are accepted with their lengths ---
      {
        let float64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let f: Float64Array = new Float64Array(ab, 0, 1);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.byteLength).assertEqual(8);
        let float64Probe_2: util.types = new util.types();
        let base: Float64Array = new Float64Array([5.5, 6.5]);
        let single: Float64Array = base.subarray(0, 1);
        expect(float64Probe_2.isFloat64Array(single)).assertTrue();
        expect(single.length).assertEqual(1);
        expect(single.byteLength).assertEqual(8);
        let wholeBase: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let whole: Float64Array = wholeBase.subarray(0, 4);
        expect(float64Probe_2.isFloat64Array(whole)).assertTrue();
        expect(whole.length).assertEqual(4);
        expect(whole.byteLength).assertEqual(32);
      }

      // --- [5] Verify isFloat64Array returns true for a middle subarray whose byteOffset is 8 and first element is 2.0 ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let mid: Float64Array = base.subarray(1, 3);
        expect(float64Probe.isFloat64Array(mid)).assertTrue();
        expect(mid.byteOffset).assertEqual(8);
        expect(mid.length).assertEqual(2);
        expect(mid.$_get(0)).assertEqual(2.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_0900
     * @tc.name testTypesIsFloat64Array009
     * @tc.desc Merged batch (5 tests): Boundary values: the stored double 1.0 plus Double.EPSILON exceeds 1.0; accepts a view over an empty ArrayBuffer which reports length 0; an integer one above the 2 raised to 53 power reads back as 9007199254740992, the same double as the power of two itself; MAX_VALUE times two stores as positive infinity and a negated subnormal minimum reads negative with a negative infinity reciprocal; the reciprocal of the largest finite double stored in the array is a positive subnormal below the smallest normal double.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the stored double 1.0 plus Double.EPSILON exceeds 1.0 while 1.0 plus half the epsilon rounds back to exactly 1.0 ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0 + Double.EPSILON, 1.0 + Double.EPSILON / 2.0]);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.$_get(0) > 1.0).assertTrue();
        expect(view.$_get(1)).assertEqual(1.0);
      }

      // --- [2] Verify isFloat64Array returns true for a view over an empty ArrayBuffer which reports length 0 ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array(new ArrayBuffer(0));
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.length).assertEqual(0);
      }

      // --- [3] Verify an integer one above the 2 raised to 53 power reads back as 9007199254740992, the same double as the power of two itself ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([9007199254740993.0, 9007199254740992.0]);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.$_get(0)).assertEqual(9007199254740992.0);
        expect(view.$_get(0)).assertEqual(view.$_get(1));
      }

      // --- [4] Verify MAX_VALUE times two stores as positive infinity and a negated subnormal minimum reads negative with a negative infinity reciprocal ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array(1);
        view.$_set(0, Double.MAX_VALUE * 2.0);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.$_get(0)).assertEqual(Double.POSITIVE_INFINITY);
        expect(Double.isNaN(view.$_get(0))).assertFalse();
        let float64Probe_2: util.types = new util.types();
        let view_2: Float64Array = new Float64Array([-Double.MIN_VALUE]);
        expect(float64Probe_2.isFloat64Array(view_2)).assertTrue();
        expect(view_2.$_get(0) < 0.0).assertTrue();
        expect(1.0 / view_2.$_get(0)).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [5] Verify the reciprocal of the largest finite double stored in the array is a positive subnormal below the smallest normal double ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0 / Double.MAX_VALUE]);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.$_get(0) > 0.0).assertTrue();
        expect(view.$_get(0) < 2.2250738585072014e-308).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1000
     * @tc.name testTypesIsFloat64Array010
     * @tc.desc Merged batch (5 tests): Boundary values: accepts the three element literal 1.25 2.5 3.75 and keeps its last element; isFloat64Array accepts a copy of an array whose negative zero sign and NaN-ness survive; negative zero derived by arithmetic keeps its sign in the array; isFloat64Array accepts the empty array built by from and isArrayBufferView also accepts it; the Float32Array widening source keeps its single element while a ternary labels the copied array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns true for the three element literal 1.25 2.5 3.75 and keeps its last element ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array([1.25, 2.5, 3.75]);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.$_get(2)).assertEqual(3.75);
      }

      // --- [2] Verify isFloat64Array accepts a copy of an array whose negative zero sign and NaN-ness survive ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Float64Array = Float64Array.of(-0.0, Double.NaN);
        let copy: Float64Array = Float64Array.from(seed);
        expect(float64Probe.isFloat64Array(copy)).assertTrue();
        expect(1.0 / copy.$_get(0)).assertEqual(Double.NEGATIVE_INFINITY);
        expect(Double.isNaN(copy.$_get(1))).assertTrue();
      }

      // --- [3] Verify negative zero derived by arithmetic keeps its sign in the array while the subtraction of zero from zero yields the positive one ---
      {
        let float64Probe: util.types = new util.types();
        let first: double = -0.0 * 1.0;
        let second: double = 0.0 * -1.0;
        let third: double = 0.0 - 0.0;
        let view: Float64Array = new Float64Array([first, second, third]);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(1.0 / view.$_get(0)).assertEqual(Double.NEGATIVE_INFINITY);
        expect(1.0 / view.$_get(1)).assertEqual(Double.NEGATIVE_INFINITY);
        expect(1.0 / view.$_get(2)).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [4] Verify isFloat64Array accepts the empty array built by from and isArrayBufferView also accepts it ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Array<double> = [];
        let built: Float64Array = Float64Array.from(seed);
        expect(float64Probe.isFloat64Array(built)).assertTrue();
        expect(float64Probe.isArrayBufferView(built)).assertTrue();
        expect(built.length).assertEqual(0);
      }

      // --- [5] Verify the Float32Array widening source keeps its single element while a ternary labels the copied array ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Float32Array = new Float32Array([2.5]);
        let wide: Float64Array = new Float64Array(seed);
        let widened: string = float64Probe.isFloat64Array(wide) ? 'float64 copy' : 'unexpected';
        expect(widened).assertEqual('float64 copy');
        expect(seed.length).assertEqual(1);
        expect(seed.$_get(0) > 2.4).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1100
     * @tc.name testTypesIsFloat64Array011
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the string data passed as the value argument and int 7 passed as the value argument; double 3.14 passed as a raw value argument; boolean values true and false; rejects a bigint primitive produced by BigInt(1); raw doubles Double.NaN and Double.POSITIVE_INFINITY.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns false for the string data passed as the value argument and int 7 passed as the value argument ---
      {
        let float64Probe: util.types = new util.types();
        let text: string = 'data';
        expect(float64Probe.isFloat64Array(text)).assertFalse();
        let float64Checker: util.types = new util.types();
        let count: int = 7;
        expect(float64Checker.isFloat64Array(count)).assertFalse();
      }

      // --- [2] Verify isFloat64Array returns false for the double 3.14 passed as a raw value argument ---
      {
        let float64Checker: util.types = new util.types();
        let ratio: double = 3.14;
        expect(float64Checker.isFloat64Array(ratio)).assertFalse();
      }

      // --- [3] Verify isFloat64Array returns false for the boolean values true and false ---
      {
        let float64Checker: util.types = new util.types();
        expect(float64Checker.isFloat64Array(true)).assertFalse();
        expect(float64Checker.isFloat64Array(false)).assertFalse();
      }

      // --- [4] Verify isFloat64Array returns false for a bigint primitive produced by BigInt(1) ---
      {
        let float64Checker: util.types = new util.types();
        let big: bigint = BigInt(1);
        expect(float64Checker.isFloat64Array(big)).assertFalse();
      }

      // --- [5] Verify isFloat64Array returns false for the raw doubles Double.NaN and Double.POSITIVE_INFINITY ---
      {
        let float64Checker: util.types = new util.types();
        expect(float64Checker.isFloat64Array(Double.NaN)).assertFalse();
        expect(float64Checker.isFloat64Array(Double.POSITIVE_INFINITY)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1200
     * @tc.name testTypesIsFloat64Array012
     * @tc.desc Merged batch (5 tests): Primitive value rejection: includes answers a boolean for a hit and a miss that the predicate rejects; rejects an Int16Array holding the int16 bounds -32768 and 32767; rejects Uint16Array and Uint32Array views holding their maxima; a false result on a string followed by a true result on a Float64Array across two checkers; the Array.isArray predicate separates a Float64Array set to false from the plain double array of the same contents set to true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify includes answers a boolean for a hit and a miss that the predicate rejects ---
      {
        let float64Probe: util.types = new util.types();
        let source: Float64Array = new Float64Array([1, 2, 3]);
        let hit: boolean = source.includes(2);
        let miss: boolean = source.includes(9);
        expect(hit).assertTrue();
        expect(miss).assertFalse();
        expect(float64Probe.isFloat64Array(miss)).assertFalse();
      }

      // --- [2] Verify isFloat64Array returns false for an Int16Array holding the int16 bounds -32768 and 32767 ---
      {
        let float64Probe: util.types = new util.types();
        let f: Int16Array = new Int16Array([-32768, 32767]);
        expect(float64Probe.isFloat64Array(f)).assertFalse();
        expect(f.$_get(0)).assertEqual(-32768);
      }

      // --- [3] Verify isFloat64Array returns false for Uint16Array and Uint32Array views holding their maxima ---
      {
        let float64Probe: util.types = new util.types();
        let fUint16: Uint16Array = new Uint16Array([65535]);
        expect(float64Probe.isFloat64Array(fUint16)).assertFalse();
        expect(fUint16.$_get(0)).assertEqual(65535);
        let fUint32: Uint32Array = new Uint32Array([4294967295]);
        expect(float64Probe.isFloat64Array(fUint32)).assertFalse();
        expect(fUint32.$_get(0)).assertEqual(4294967295);
      }

      // --- [4] Verify a false result on a string followed by a true result on a Float64Array across two checkers ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0]);
        expect(first.isFloat64Array('text')).assertFalse();
        expect(second.isFloat64Array(view)).assertTrue();
      }

      // --- [5] Verify the Array.isArray predicate separates a Float64Array set to false from the plain double array of the same contents set to true ---
      {
        let float64Probe: util.types = new util.types();
        let typed: Float64Array = new Float64Array([1.5, 2.5]);
        let plain: Array<double> = [1.5, 2.5];
        expect(Array.isArray(plain)).assertTrue();
        expect(Array.isArray(typed)).assertFalse();
        expect(float64Probe.isFloat64Array(typed)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1300
     * @tc.name testTypesIsFloat64Array013
     * @tc.desc Merged batch (2 tests): Primitive value rejection: the conjunction of a false result for the int 3 and a true result for a Float64Array is false; rejects a nested array of two int arrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the conjunction of a false result for the int 3 and a true result for a Float64Array is false ---
      {
        let float64Checker: util.types = new util.types();
        let count: int = 3;
        let view: Float64Array = new Float64Array(1);
        expect(float64Checker.isFloat64Array(count) && float64Checker.isFloat64Array(view)).assertFalse();
      }

      // --- [2] Verify isFloat64Array returns false for a nested array of two int arrays ---
      {
        let float64Probe: util.types = new util.types();
        let grid: Array<Array<int>> = [[1, 2], [3, 4]];
        expect(float64Probe.isFloat64Array(grid)).assertFalse();
        expect(grid.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1400
     * @tc.name testTypesIsFloat64Array014
     * @tc.desc Merged batch (5 tests): Non-target object rejection: the returned boolean stored in a declared variable is false for a Float32Array; isFloat64Array rejects a BigInt64Array of the same footprint and an object that fakes the view shape fields; rejects a plain class instance with int and double fields and an interface literal with two double fields; rejects a Record container holding a double entry; rejects a Date created from the epoch value 0.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the returned boolean stored in a declared variable is false for a Float32Array ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float32Array = new Float32Array([1.0, 2.0]);
        let result: boolean = float64Checker.isFloat64Array(view);
        expect(result).assertFalse();
      }

      // --- [2] Verify isFloat64Array rejects a BigInt64Array of the same footprint and an object that fakes the view shape fields ---
      {
        let float64Probe: util.types = new util.types();
        let f: BigInt64Array = new BigInt64Array(2);
        let fake: FakeFloat64Shape = new FakeFloat64Shape();
        expect(float64Probe.isFloat64Array(f)).assertFalse();
        expect(f.byteLength).assertEqual(16);
        expect(float64Probe.isFloat64Array(fake)).assertFalse();
        expect(fake.byteLength).assertEqual(16);
      }

      // --- [3] Verify a plain class instance with int and double fields and an interface literal with two double fields are both rejected ---
      {
        let float64Probe: util.types = new util.types();
        let coord: Float64Coord = new Float64Coord();
        expect(float64Probe.isFloat64Array(coord)).assertFalse();
        expect(coord.y).assertEqual(-2.5);
        let float64Probe_2: util.types = new util.types();
        let p: Float64Point = { px: 1.5, py: 2.5 };
        expect(float64Probe_2.isFloat64Array(p)).assertFalse();
        expect(p.px).assertEqual(1.5);
      }

      // --- [4] Verify isFloat64Array returns false for a Record container holding a double entry ---
      {
        let float64Checker: util.types = new util.types();
        let rec: Record<string, double> = { 'pi': 3.14 };
        expect(float64Checker.isFloat64Array(rec)).assertFalse();
      }

      // --- [5] Verify isFloat64Array returns false for a Date created from the epoch value 0 ---
      {
        let float64Probe: util.types = new util.types();
        let d: Date = new Date(0);
        expect(float64Probe.isFloat64Array(d)).assertFalse();
        expect(d.getTime()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1500
     * @tc.name testTypesIsFloat64Array015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a RegExp built from the pattern a with the global flag; rejects an Error and for a TypeError that both carry a message; Map container holding one entry and Set container holding one member; WeakMap and a WeakSet sharing one key object; plain arrow function and for an async arrow function.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns false for a RegExp built from the pattern a with the global flag ---
      {
        let float64Probe: util.types = new util.types();
        let re: RegExp = new RegExp('a', 'g');
        expect(float64Probe.isFloat64Array(re)).assertFalse();
        expect(re.test('a')).assertTrue();
      }

      // --- [2] Verify isFloat64Array returns false for an Error and for a TypeError that both carry a message ---
      {
        let float64Probe: util.types = new util.types();
        let er: Error = new Error('boom');
        let te: TypeError = new TypeError('bad');
        expect(float64Probe.isFloat64Array(er)).assertFalse();
        expect(float64Probe.isFloat64Array(te)).assertFalse();
        expect(te.message).assertEqual('bad');
      }

      // --- [3] Verify isFloat64Array returns false for a Map container holding one entry and Set container holding one member ---
      {
        let float64Probe: util.types = new util.types();
        let m: Map<string, double> = new Map<string, double>();
        m.set('a', 1.5);
        expect(float64Probe.isFloat64Array(m)).assertFalse();
        expect(m.size).assertEqual(1);
        let float64Probe_2: util.types = new util.types();
        let s: Set<double> = new Set<double>();
        s.add(1.5);
        expect(float64Probe_2.isFloat64Array(s)).assertFalse();
        expect(s.size).assertEqual(1);
      }

      // --- [4] Verify isFloat64Array returns false for a WeakMap and a WeakSet sharing one key object ---
      {
        let float64Checker: util.types = new util.types();
        let key: Float64Key = new Float64Key();
        let wm: WeakMap<Float64Key, double> = new WeakMap<Float64Key, double>();
        wm.set(key, 2.5);
        let ws: WeakSet<Float64Key> = new WeakSet<Float64Key>();
        ws.add(key);
        expect(float64Checker.isFloat64Array(wm)).assertFalse();
        expect(float64Checker.isFloat64Array(ws)).assertFalse();
      }

      // --- [5] Verify isFloat64Array returns false for a plain arrow function and for an async arrow function ---
      {
        let float64Checker: util.types = new util.types();
        let plain: Function = (): double => {
          return 2.5;
        };
        let af: Function = async (): Promise<void> => {
        };
        expect(float64Checker.isFloat64Array(plain)).assertFalse();
        expect(float64Checker.isFloat64Array(af)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1600
     * @tc.name testTypesIsFloat64Array016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Map key iterator and for a Set value iterator; rejects an object carrying only a length field and a tag field; isFloat64Array rejects a Uint16Array, an ArrayBuffer, a DataView and a Float32Array whose sizes stay 32, 16, 16 and 2; DataView over an eight byte ArrayBuffer; Float32Array holding 3.14, its floating point sibling kind.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns false for a Map key iterator and for a Set value iterator ---
      {
        let float64Checker: util.types = new util.types();
        let m: Map<string, double> = new Map<string, double>();
        m.set('a', 1.5);
        let s: Set<double> = new Set<double>();
        s.add(2.5);
        let mk: IterableIterator<string> = m.keys();
        let sv: IterableIterator<double> = s.values();
        expect(float64Checker.isFloat64Array(mk)).assertFalse();
        expect(float64Checker.isFloat64Array(sv)).assertFalse();
      }

      // --- [2] Verify isFloat64Array returns false for an object carrying only a length field and a tag field ---
      {
        let float64Probe: util.types = new util.types();
        let like: ArrayLikeBag = new ArrayLikeBag();
        expect(float64Probe.isFloat64Array(like)).assertFalse();
        expect(like.length).assertEqual(4);
      }

      // --- [3] Verify isFloat64Array rejects a Uint16Array, an ArrayBuffer, a DataView and a Float32Array whose sizes stay 32, 16, 16 and 2 ---
      {
        let float64Probe: util.types = new util.types();
        let uint16View: Uint16Array = new Uint16Array(16);
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let dv: DataView = new DataView(ab);
        let float32View: Float32Array = new Float32Array([1.5, 2.5]);
        expect(float64Probe.isFloat64Array(uint16View)).assertFalse();
        expect(float64Probe.isFloat64Array(ab)).assertFalse();
        expect(float64Probe.isFloat64Array(dv)).assertFalse();
        expect(float64Probe.isFloat64Array(float32View)).assertFalse();
        expect(uint16View.byteLength).assertEqual(32);
        expect(ab.byteLength).assertEqual(16);
        expect(dv.byteLength).assertEqual(16);
        expect(float32View.length).assertEqual(2);
      }

      // --- [4] Verify isFloat64Array returns false for a DataView over an eight byte ArrayBuffer ---
      {
        let float64Checker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(8));
        expect(float64Checker.isFloat64Array(dv)).assertFalse();
        expect(float64Checker.isDataView(dv)).assertTrue();
      }

      // --- [5] Verify isFloat64Array returns false for a Float32Array holding 3.14, its floating point sibling kind ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float32Array = new Float32Array([3.14]);
        expect(float64Probe.isFloat64Array(f)).assertFalse();
        expect(f.$_get(0) > 3.13).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1700
     * @tc.name testTypesIsFloat64Array017
     * @tc.desc Merged batch (4 tests): Non-target object rejection: verifies rejection of unrelated objects, covering DataView values and other unrelated kinds.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the logical negation of a true result is false ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([4.0]);
        expect(!float64Probe.isFloat64Array(view)).assertFalse();
      }

      // --- [2] Verify a thirty two byte ArrayBuffer fails isFloat64Array and isArrayBufferView in one record lookup ---
      {
        let float64Checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(32);
        let verdicts: Record<string, boolean> = {
          'asFloat64': float64Checker.isFloat64Array(buffer),
          'asView': float64Checker.isArrayBufferView(buffer)
        };
        expect(verdicts['asFloat64']!).assertFalse();
        expect(verdicts['asView']!).assertFalse();
      }

      // --- [3] Verify a DataView is an array buffer view that is neither a typed array nor an ArrayBuffer, and is rejected by isFloat64Array ---
      {
        let float64Checker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(16));
        expect(float64Checker.isFloat64Array(dv)).assertFalse();
        expect(float64Checker.isArrayBufferView(dv)).assertTrue();
        expect(float64Checker.isTypedArray(dv)).assertFalse();
        expect(float64Checker.isAnyArrayBuffer(dv)).assertFalse();
      }

      // --- [4] Verify the buffer reached through the buffer property of a Float64Array is rejected by isFloat64Array while both buffer predicates accept it ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0, 2.0]);
        let store: ArrayBuffer = view.buffer;
        expect(float64Checker.isFloat64Array(view)).assertTrue();
        expect(float64Checker.isFloat64Array(store)).assertFalse();
        expect(float64Checker.isArrayBuffer(store)).assertTrue();
        expect(float64Checker.isAnyArrayBuffer(store)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1800
     * @tc.name testTypesIsFloat64Array018
     * @tc.desc Merged batch (4 tests): Byte and element bound rejection: verifies isFloat64Array returns false for buffers, bigint views and integer views at their element bounds.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns false for a bare ArrayBuffer and for a BigUint64Array ---
      {
        let float64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        expect(float64Probe.isFloat64Array(ab)).assertFalse();
        expect(ab.byteLength).assertEqual(8);
        let f: BigUint64Array = new BigUint64Array(2);
        expect(float64Probe.isFloat64Array(f)).assertFalse();
        expect(f.byteLength).assertEqual(16);
      }

      // --- [2] Verify isFloat64Array returns false for an Int8Array at the int8 bounds and an Int32Array at the int32 bounds ---
      {
        let float64Probe: util.types = new util.types();
        let int8View: Int8Array = new Int8Array([-128, 127]);
        let int32View: Int32Array = new Int32Array([-2147483648, 2147483647]);
        expect(float64Probe.isFloat64Array(int8View)).assertFalse();
        expect(int8View.$_get(1)).assertEqual(127);
        expect(float64Probe.isFloat64Array(int32View)).assertFalse();
        expect(int32View.$_get(1)).assertEqual(2147483647);
      }

      // --- [3] Verify isFloat64Array returns false for a Uint8Array holding the byte bounds 0 and 255 ---
      {
        let float64Probe: util.types = new util.types();
        let f: Uint8Array = new Uint8Array([0, 255]);
        expect(float64Probe.isFloat64Array(f)).assertFalse();
        expect(f.$_get(0)).assertEqual(0);
      }

      // --- [4] Verify isFloat64Array returns false for a Uint8ClampedArray whose written 300 was clamped to 255 ---
      {
        let float64Probe: util.types = new util.types();
        let f: Uint8ClampedArray = new Uint8ClampedArray(1);
        f.$_set(0, 300);
        expect(float64Probe.isFloat64Array(f)).assertFalse();
        expect(f.$_get(0)).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_1900
     * @tc.name testTypesIsFloat64Array019
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts a view with byteOffset 8 and no explicit length over a 64 byte buffer; with byteOffset 8 and length 2 whose byteLength is 16; accepts the trailing subarray starting at byteOffset 16; over a whole 32 byte ArrayBuffer and exposes its backing buffer; accepts a subarray taken from another subarray, inheriting byteOffset 16.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns true for a view with byteOffset 8 and no explicit length over a 64 byte buffer ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array(new ArrayBuffer(64), 8);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.byteOffset).assertEqual(8);
        expect(f.length).assertEqual(7);
      }

      // --- [2] Verify isFloat64Array returns true for a view with byteOffset 8 and length 2 whose byteLength is 16 ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array(new ArrayBuffer(32), 8, 2);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.length).assertEqual(2);
        expect(f.byteLength).assertEqual(16);
        expect(f.byteOffset).assertEqual(8);
      }

      // --- [3] Verify isFloat64Array returns true for the trailing subarray starting at byteOffset 16 ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let tail: Float64Array = base.subarray(2, 4);
        expect(float64Probe.isFloat64Array(tail)).assertTrue();
        expect(tail.byteOffset).assertEqual(16);
        expect(tail.$_get(0)).assertEqual(3.0);
      }

      // --- [4] Verify isFloat64Array returns true for a view over a whole 32 byte ArrayBuffer and exposes its backing buffer ---
      {
        let float64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let f: Float64Array = new Float64Array(host);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.byteOffset).assertEqual(0);
        expect(f.buffer.byteLength).assertEqual(32);
      }

      // --- [5] Verify isFloat64Array returns true for a subarray taken from another subarray, inheriting byteOffset 16 ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let mid: Float64Array = base.subarray(1, 3);
        let inner: Float64Array = mid.subarray(1, 2);
        let flags: boolean[] = [float64Probe.isFloat64Array(inner)];
        expect(flags[0]).assertTrue();
        expect(inner.byteOffset).assertEqual(16);
        expect(inner.$_get(0)).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2000
     * @tc.name testTypesIsFloat64Array020
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts a subarray sharing the backing buffer, so writes through it reach the base; a Float64Array is true while Uint8Array and DataView over the same buffer are false; accepts a copy built from a subarray, which detaches into its own buffer with byteOffset 0; accepts the independent copy produced by slice, which has byteOffset 0 and its own buffer; the subarray taken with the negative start -2 resolves against the end, matching the positive start that names the same two elements.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns true for a subarray sharing the backing buffer, so writes through it reach the base ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let view: Float64Array = base.subarray(1, 3);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.buffer).assertEqual(base.buffer);
        view.$_set(0, 9.0);
        expect(base.$_get(1)).assertEqual(9.0);
      }

      // --- [2] Verify a Float64Array is true while Uint8Array and DataView over the same buffer are false ---
      {
        let float64Checker: util.types = new util.types();
        let bufferForUint8: ArrayBuffer = new ArrayBuffer(16);
        let float64View: Float64Array = new Float64Array(bufferForUint8);
        let uint8View: Uint8Array = new Uint8Array(bufferForUint8);
        expect(float64Checker.isFloat64Array(float64View)).assertTrue();
        expect(float64Checker.isFloat64Array(uint8View)).assertFalse();
        let bufferForDataView: ArrayBuffer = new ArrayBuffer(16);
        let view: Float64Array = new Float64Array(bufferForDataView);
        let dv: DataView = new DataView(bufferForDataView);
        expect(float64Checker.isFloat64Array(view)).assertTrue();
        expect(float64Checker.isFloat64Array(dv)).assertFalse();
      }

      // --- [3] Verify isFloat64Array returns true for a copy built from a subarray, which detaches into its own buffer with byteOffset 0 ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let part: Float64Array = base.subarray(1, 4);
        let copy: Float64Array = new Float64Array(part);
        expect(float64Probe.isFloat64Array(copy)).assertTrue();
        expect(copy.length).assertEqual(3);
        expect(copy.byteOffset).assertEqual(0);
        expect(copy.buffer === base.buffer).assertFalse();
        expect(copy.$_get(0)).assertEqual(2.0);
      }

      // --- [4] Verify isFloat64Array returns true for the independent copy produced by slice, which has byteOffset 0 and its own buffer ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let sliced: Float64Array = base.slice(1, 3);
        expect(float64Probe.isFloat64Array(sliced)).assertTrue();
        expect(sliced.length).assertEqual(2);
        expect(sliced.byteOffset).assertEqual(0);
        expect(sliced.buffer === base.buffer).assertFalse();
        expect(sliced.$_get(1)).assertEqual(3.0);
      }

      // --- [5] Verify the subarray taken with the negative start -2 resolves against the end, matching the positive start that names the same two elements ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let fromEnd: Float64Array = base.subarray(-2);
        let fromStart: Float64Array = base.subarray(2);
        expect(float64Probe.isFloat64Array(fromEnd)).assertTrue();
        expect(fromEnd.byteOffset).assertEqual(fromStart.byteOffset);
        expect(fromEnd.length).assertEqual(fromStart.length);
        expect(fromEnd.$_get(0)).assertEqual(3.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2100
     * @tc.name testTypesIsFloat64Array021
     * @tc.desc Merged batch (5 tests): View and buffer semantics: a view built from the buffer of an offset array covers the whole store and aliases it; a subarray taken from a constructor view composes both offsets, giving byteOffset 16 and the second double of the view; the call leaves byteOffset length byteLength and the buffer reference of an offset view unchanged; a filter over a base Float64Array and its middle subarray keeps both while the base offsets stay; the call leaves the raw bytes of the backing store readable through a Uint8Array of the same buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a view built from the buffer of an offset array covers the whole store and aliases it ---
      {
        let float64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let offset: Float64Array = new Float64Array(ab, 8, 2);
        let whole: Float64Array = new Float64Array(offset.buffer);
        expect(float64Probe.isFloat64Array(whole)).assertTrue();
        expect(whole.byteOffset).assertEqual(0);
        expect(whole.length).assertEqual(3);
        expect(offset.byteOffset).assertEqual(8);
        whole.$_set(1, 5.5);
        expect(offset.$_get(0)).assertEqual(5.5);
        expect(whole.$_get(0)).assertEqual(0.0);
      }

      // --- [2] Verify a subarray taken from a constructor view composes both offsets, giving byteOffset 16 and the second double of the view ---
      {
        let float64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let view: Float64Array = new Float64Array(ab, 8, 3);
        view.$_set(0, 1.0);
        view.$_set(1, 2.0);
        view.$_set(2, 3.0);
        let inner: Float64Array = view.subarray(1, 3);
        expect(float64Probe.isFloat64Array(inner)).assertTrue();
        expect(inner.byteOffset).assertEqual(16);
        expect(inner.length).assertEqual(2);
        expect(inner.$_get(0)).assertEqual(2.0);
      }

      // --- [3] Verify the call leaves byteOffset length byteLength and the buffer reference of an offset view unchanged ---
      {
        let float64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let view: Float64Array = new Float64Array(ab, 8, 3);
        let beforeOffset: int = view.byteOffset;
        let beforeLength: int = view.length;
        let beforeBytes: int = view.byteLength;
        let beforeBuffer: ArrayBuffer = view.buffer;
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.byteOffset).assertEqual(beforeOffset);
        expect(view.length).assertEqual(beforeLength);
        expect(view.byteLength).assertEqual(beforeBytes);
        expect(view.buffer).assertEqual(beforeBuffer);
      }

      // --- [4] Verify a filter over a base Float64Array and its middle subarray keeps both while the base offsets stay ---
      {
        let float64Probe: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
        let view: Float64Array = base.subarray(1, 3);
        let kept: Float64Array[] = [base, view].filter((candidate: Float64Array): boolean => float64Probe.isFloat64Array(candidate));
        expect(kept.length).assertEqual(2);
        expect(base.byteOffset).assertEqual(0);
        expect(base.$_get(3)).assertEqual(4.0);
      }

      // --- [5] Verify the call leaves the raw bytes of the backing store readable through a Uint8Array of the same buffer ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0, 2.0]);
        let uint8View: Uint8Array = new Uint8Array(view.buffer);
        let before: double = uint8View.$_get(0);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(uint8View.$_get(0)).assertEqual(before);
        expect(uint8View.length).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2200
     * @tc.name testTypesIsFloat64Array022
     * @tc.desc Merged batch (4 tests): View and buffer semantics: verifies offsets, lengths and backing-buffer behavior, covering helper and factory relays including Float32Array and Uint8Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the verdict on a factory built array leaves its length, byteLength, byteOffset and buffer reference untouched ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = Float64Array.of(1.5, 2.5, 3.5);
        let beforeBuffer: ArrayBuffer = view.buffer;
        let beforeLength: int = view.length;
        let beforeBytes: int = view.byteLength;
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.length).assertEqual(beforeLength);
        expect(view.byteLength).assertEqual(beforeBytes);
        expect(view.byteOffset).assertEqual(0);
        expect(view.buffer).assertEqual(beforeBuffer);
      }

      // --- [2] Verify the result selects the first ternary branch and yields the label float64View ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([9.0]);
        let label: string = float64Probe.isFloat64Array(view) ? 'float64View' : 'other';
        expect(label).assertEqual('float64View');
      }

      // --- [3] Verify raw byte aliasing through a Uint8Array over the same buffer changes the double element while each view keeps its own classification ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0]);
        let uint8View: Uint8Array = new Uint8Array(view.buffer);
        let before: double = view.$_get(0);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        uint8View.$_set(0, 1);
        expect(view.$_get(0) === before).assertFalse();
        expect(float64Probe.isFloat64Array(uint8View)).assertFalse();
      }

      // --- [4] Verify a Float32Array is a typed array and an array buffer view but never a Float64Array, separating the two floating point kinds ---
      {
        let float64Checker: util.types = new util.types();
        let narrow: Float32Array = new Float32Array([1.5]);
        expect(float64Checker.isFloat64Array(narrow)).assertFalse();
        expect(float64Checker.isTypedArray(narrow)).assertTrue();
        expect(float64Checker.isArrayBufferView(narrow)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2300
     * @tc.name testTypesIsFloat64Array023
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: two arrays built from the same Array of doubles are independent copies; the call leaves the stored doubles 1e300 3.25 and -7.5 readable at their original positions; accepts the array produced by from over a Set of three doubles, whose iteration order is preserved; an optional Float64Array whose undefined branch is guarded away is recognized and keeps its length; a Float64Array stays writable after the verdict.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two arrays built from the same Array of doubles are independent copies, so a write in one leaves the other at its original value ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Array<double> = [1.5, 2.5];
        let first: Float64Array = Float64Array.from(seed);
        let second: Float64Array = Float64Array.from(seed);
        expect(float64Probe.isFloat64Array(first)).assertTrue();
        expect(float64Probe.isFloat64Array(second)).assertTrue();
        first.$_set(0, 8.5);
        expect(second.$_get(0)).assertEqual(1.5);
      }

      // --- [2] Verify the call leaves the stored doubles 1e300 3.25 and -7.5 readable at their original positions ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1e300, 3.25, -7.5]);
        let first: double = view.$_get(0);
        let second: double = view.$_get(1);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.$_get(0)).assertEqual(first);
        expect(view.$_get(1)).assertEqual(second);
        expect(view.$_get(2)).assertEqual(-7.5);
      }

      // --- [3] Verify isFloat64Array returns true for the array produced by from over a Set of three doubles, whose iteration order is preserved ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Set<double> = new Set<double>();
        seed.add(1.5);
        seed.add(2.5);
        seed.add(3.5);
        let built: Float64Array = Float64Array.from(seed);
        expect(float64Probe.isFloat64Array(built)).assertTrue();
        expect(built.length).assertEqual(3);
        expect(built.$_get(0)).assertEqual(1.5);
        expect(built.$_get(2)).assertEqual(3.5);
      }

      // --- [4] Verify an optional Float64Array whose undefined branch is guarded away is recognized and keeps its length ---
      {
        let float64Probe: util.types = new util.types();
        let maybe: Float64Array | undefined = new Float64Array([1.5, 2.5]);
        let safe: Float64Array = new Float64Array(0);
        if (maybe !== undefined) {
          safe = maybe;
        }
        expect(float64Probe.isFloat64Array(safe)).assertTrue();
        expect(safe.length).assertEqual(2);
      }

      // --- [5] Verify a Float64Array stays writable after the verdict, so a value written through $_set is read back at the same index ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0, 2.0]);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        view.$_set(1, 6.25);
        expect(view.$_get(1)).assertEqual(6.25);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2400
     * @tc.name testTypesIsFloat64Array024
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: an array filled through $_set keeps its three doubles and a buffer alias and detached copy are accepted with the alias unchanged; the Set behind a Float64Array factory keeps its three members while the copy is verified; indexOf returns the int position of the element and the array keeps its verdict; the verdict stays true as the same variable is reassigned from a three element to a seven element Float64Array; two aliases of one array are accepted and compare equal and the selector takes its default label for a sixteen byte buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an array filled through $_set keeps its three doubles and a buffer alias and detached copy are accepted with the alias unchanged ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array(3);
        view.$_set(0, 1.25);
        view.$_set(1, -4.5);
        view.$_set(2, 0.0);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(view.$_get(1)).assertEqual(-4.5);
        expect(view.length).assertEqual(3);
        let float64Probe_2: util.types = new util.types();
        let base: Float64Array = new Float64Array([1.0, 2.0]);
        let alias: Float64Array = new Float64Array(base.buffer);
        let copy: Float64Array = new Float64Array(base);
        expect(float64Probe_2.isFloat64Array(alias)).assertTrue();
        expect(float64Probe_2.isFloat64Array(copy)).assertTrue();
        copy.$_set(0, 7.5);
        expect(alias.$_get(0)).assertEqual(1.0);
        expect(copy.$_get(0)).assertEqual(7.5);
      }

      // --- [2] Verify the Set behind a Float64Array factory keeps its three members while the copy is verified ---
      {
        let float64Probe: util.types = new util.types();
        let seed: Set<double> = new Set<double>();
        seed.add(1.5);
        seed.add(2.5);
        seed.add(3.5);
        let view: Float64Array = Float64Array.from(seed);
        let retained: Map<double, boolean> = new Map<double, boolean>();
        retained.set(1.5, seed.has(1.5));
        retained.set(3.5, seed.has(3.5));
        expect(retained.get(1.5)!).assertTrue();
        expect(retained.get(3.5)!).assertTrue();
        expect(float64Probe.isFloat64Array(view)).assertTrue();
        expect(seed.size).assertEqual(3);
      }

      // --- [3] Verify indexOf returns the int position of the element and the array keeps its verdict ---
      {
        let float64Probe: util.types = new util.types();
        let source: Float64Array = new Float64Array([4, 5, 6]);
        let position: int = source.indexOf(6);
        expect(position).assertEqual(2);
        expect(float64Probe.isFloat64Array(source)).assertTrue();
      }

      // --- [4] Verify the verdict stays true as the same variable is reassigned from a three element to a seven element Float64Array ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array(3);
        expect(view.length).assertEqual(3);
        expect(float64Probe.isFloat64Array(view)).assertTrue();

        view = new Float64Array(7);
        expect(view.length).assertEqual(7);
        expect(float64Probe.isFloat64Array(view)).assertTrue();
      }

      // --- [5] Verify two aliases of one array are accepted and compare equal and the selector takes its default label for a sixteen byte buffer ---
      {
        let float64Probe: util.types = new util.types();
        let first: Float64Array = new Float64Array([1.5]);
        let second: Float64Array = first;
        expect(float64Probe.isFloat64Array(first)).assertTrue();
        expect(float64Probe.isFloat64Array(second)).assertTrue();
        expect(first).assertEqual(second);
        let float64Checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let label: string = 'none';
        switch (float64Checker.isFloat64Array(buffer)) {
          case true:
            label = 'float64';
            break;
          default:
            label = 'not float64';
            break;
        }
        expect(label).assertEqual('not float64');
        expect(float64Checker.isAnyArrayBuffer(buffer)).assertTrue();
        expect(float64Checker.isArrayBuffer(buffer)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2500
     * @tc.name testTypesIsFloat64Array025
     * @tc.desc Merged batch (2 tests): State preservation and aliasing: the negated verdict sends the control flow into the else branch for a Float32Array; copyWithin duplicates the leading two doubles into the next two positions.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the negated verdict sends the control flow into the else branch for a Float32Array while the then branch counter stays at zero ---
      {
        let float64Probe: util.types = new util.types();
        let narrow: Float32Array = new Float32Array([1.5]);
        let thenHits: int = 0;
        let elseHits: int = 0;
        if (!float64Probe.isFloat64Array(narrow)) {
          elseHits = 1;
        } else {
          thenHits = 1;
        }
        expect(elseHits).assertEqual(1);
        expect(thenHits).assertEqual(0);
      }

      // --- [2] Verify copyWithin duplicates the leading two doubles into the next two positions while the receiver keeps length four and stays recognized ---
      {
        let float64Probe: util.types = new util.types();
        let row: Float64Array = new Float64Array([1.5, 2.5, 3.5, 4.5]);
        row.copyWithin(1, 0, 2);
        expect(row.$_get(1)).assertEqual(1.5);
        expect(row.$_get(2)).assertEqual(2.5);
        expect(row.$_get(3)).assertEqual(4.5);
        expect(row.length).assertEqual(4);
        expect(float64Probe.isFloat64Array(row)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2600
     * @tc.name testTypesIsFloat64Array026
     * @tc.desc Merged batch (5 tests): Container and field storage: accepts content of the expression 0.1 + 0.2, which is stored as a value unequal to 0.3; accepts a Float64Array stored in the class field Float64Box.v and as an element of an Object array; accepts a Float64Array reached through a Map value read with an explicit cast; the returned boolean stored in a declared variable is true for a genuine Float64Array; map returns an array of the same element type and a ternary keyed by two verdicts labels a Float64Array as head and the other as middle.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns true for content of the expression 0.1 + 0.2, which is stored as a value unequal to 0.3 ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array([0.1 + 0.2]);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(f.$_get(0) === 0.3).assertFalse();
      }

      // --- [2] Verify isFloat64Array returns true for a Float64Array stored in the class field Float64Box.v and as an element of an Object array ---
      {
        let float64Probe: util.types = new util.types();
        let box: Float64Box = new Float64Box();
        expect(float64Probe.isFloat64Array(box.v)).assertTrue();
        expect(box.v.length).assertEqual(1);
        let float64Probe_2: util.types = new util.types();
        let slot: Object[] = [new Float64Array(4)];
        expect(float64Probe_2.isFloat64Array(slot[0])).assertTrue();
      }

      // --- [3] Verify isFloat64Array returns true for a Float64Array reached through a Map value read with an explicit cast ---
      {
        let float64Probe: util.types = new util.types();
        let store: Map<string, Float64Array> = new Map<string, Float64Array>();
        store.set('v', new Float64Array([1.5]));
        let got: Float64Array = store.get('v') as Float64Array;
        expect(float64Probe.isFloat64Array(got)).assertTrue();
        expect(got.$_get(0)).assertEqual(1.5);
      }

      // --- [4] Verify the returned boolean stored in a declared variable is true for a genuine Float64Array ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
        let result: boolean = float64Checker.isFloat64Array(view);
        expect(result).assertTrue();
      }

      // --- [5] Verify map returns an array of the same element type and a ternary keyed by two verdicts labels a Float64Array as head and the other as middle ---
      {
        let float64Probe: util.types = new util.types();
        let source: Float64Array = new Float64Array([1, 2, 3]);
        let doubled: Float64Array = source.map((v: double) => v * 2);
        expect(float64Probe.isFloat64Array(doubled)).assertTrue();
        expect(doubled[2]).assertEqual(6);
        expect(source[2]).assertEqual(3);
        let float64Probe_2: util.types = new util.types();
        let direct: Float64Array = new Float64Array([1.0]);
        let other: Int32Array = new Int32Array(1);
        let first: boolean = float64Probe_2.isFloat64Array(direct);
        let second: boolean = float64Probe_2.isFloat64Array(other);
        let primary: string = first ? 'head' : (second ? 'middle' : 'neither');
        let swapped: string = second ? 'head' : (first ? 'middle' : 'neither');
        expect(primary).assertEqual('head');
        expect(swapped).assertEqual('middle');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2700
     * @tc.name testTypesIsFloat64Array027
     * @tc.desc Merged batch (3 tests): Container and field storage: two verdicts stored as Map values are read back as the booleans they were, with the entry count staying at two; a while loop advances until the first accepted element, stopping at the Float64Array held in the second position; the verdict of one call selects the argument of the next.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two verdicts stored as Map values are read back as the booleans they were, with the entry count staying at two ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([2.5]);
        let registry: Map<string, boolean> = new Map<string, boolean>();
        registry.set('accepted', float64Probe.isFloat64Array(view));
        registry.set('rejected', float64Probe.isFloat64Array(3.5));
        let first: boolean = registry.get('accepted') as boolean;
        let second: boolean = registry.get('rejected') as boolean;
        expect(first).assertTrue();
        expect(second).assertFalse();
        expect(registry.size).assertEqual(2);
      }

      // --- [2] Verify a while loop advances until the first accepted element, stopping at the Float64Array held in the second position ---
      {
        let float64Probe: util.types = new util.types();
        let queue: Array<Object> = ['a' as Object, new Float64Array(2) as Object, new ArrayBuffer(4) as Object];
        let cursor: int = 0;
        while (cursor < queue.length && !float64Probe.isFloat64Array(queue[cursor])) {
          cursor++;
        }
        expect(cursor).assertEqual(1);
        expect(float64Probe.isFloat64Array(queue[cursor])).assertTrue();
      }

      // --- [3] Verify the verdict of one call selects the argument of the next, so the nested call is true only when the selector yields the Float64Array ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0]);
        let other: Uint8Array = new Uint8Array(2);
        let picksOther: boolean = float64Checker.isFloat64Array(float64Checker.isFloat64Array(other) ? view : other);
        let picksView: boolean = float64Checker.isFloat64Array(float64Checker.isFloat64Array(view) ? view : other);
        expect(picksOther).assertFalse();
        expect(picksView).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2800
     * @tc.name testTypesIsFloat64Array028
     * @tc.desc Merged batch (5 tests): API call consistency: isFloat64Array accepts two one element views at byteOffsets 0 and 8, the second not affecting the first; the array is accepted but its double element is rejected and a plain double array fails where the Float64Array content passes; isFloat64Array accepts a Float64Array and rejects an Int16Array; accepts two views over one 24 byte buffer at byteOffsets 0 and 16; two distinct Float64Array instances holding the same doubles are both accepted and agree elementwise.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array accepts two one element views at byteOffsets 0 and 8, the second not affecting the first ---
      {
        let float64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let low: Float64Array = new Float64Array(ab, 0, 1);
        let high: Float64Array = new Float64Array(ab, 8, 1);
        expect(float64Probe.isFloat64Array(low)).assertTrue();
        expect(float64Probe.isFloat64Array(high)).assertTrue();
        high.$_set(0, 4.25);
        expect(high.$_get(0)).assertEqual(4.25);
        expect(low.$_get(0)).assertEqual(0);
      }

      // --- [2] Verify the array is accepted but its double element is rejected and a plain double array fails where the Float64Array content passes ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float64Array = new Float64Array([7.5]);
        let element: double = view.$_get(0);
        expect(float64Checker.isFloat64Array(view)).assertTrue();
        expect(float64Checker.isFloat64Array(element)).assertFalse();
        let float64Checker_2: util.types = new util.types();
        let plain: double[] = [1.5, 2.5];
        let typed: Float64Array = new Float64Array([1.5, 2.5]);
        expect(float64Checker_2.isFloat64Array(plain)).assertFalse();
        expect(float64Checker_2.isFloat64Array(typed)).assertTrue();
      }

      // --- [3] Verify isFloat64Array accepts a Float64Array and rejects an Int16Array ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0]);
        let other: Int16Array = new Int16Array(3);
        let accepted: boolean = float64Probe.isFloat64Array(view);
        let rejected: boolean = float64Probe.isFloat64Array(other);
        expect(accepted).assertTrue();
        expect(rejected).assertFalse();
      }

      // --- [4] Verify isFloat64Array returns true for two views over one 24 byte buffer at byteOffsets 0 and 16 while the buffer itself is rejected ---
      {
        let float64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let low: Float64Array = new Float64Array(ab, 0, 1);
        let high: Float64Array = new Float64Array(ab, 16, 1);
        expect(float64Probe.isFloat64Array(low)).assertTrue();
        expect(float64Probe.isFloat64Array(high)).assertTrue();
        expect(low.byteOffset).assertEqual(0);
        expect(high.byteOffset).assertEqual(16);
        expect(float64Probe.isFloat64Array(ab)).assertFalse();
      }

      // --- [5] Verify two distinct Float64Array instances holding the same doubles are both accepted and agree elementwise ---
      {
        let float64Probe: util.types = new util.types();
        let first: Float64Array = new Float64Array([1.5, 2.5]);
        let second: Float64Array = new Float64Array([1.5, 2.5]);
        expect(float64Probe.isFloat64Array(first)).assertTrue();
        expect(float64Probe.isFloat64Array(second)).assertTrue();
        expect(first.$_get(0)).assertEqual(second.$_get(0));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_2900
     * @tc.name testTypesIsFloat64Array029
     * @tc.desc Merged batch (5 tests): API call consistency: accepts content of NaN, which is confirmed by the global isNaN predicate; accepts an Object array of two Float64Arrays and a Map valued by one are rejected; accepts a Float64Array while an Int32Array stays rejected; isFloat64Array separates a Float64Array from a Float32Array built from the same doubles; the disjunction of two results for the same instance is true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns true for content of NaN, which is confirmed by the global isNaN predicate ---
      {
        let float64Probe: util.types = new util.types();
        let f: Float64Array = new Float64Array([Double.NaN]);
        expect(float64Probe.isFloat64Array(f)).assertTrue();
        expect(isNaN(f.$_get(0))).assertTrue();
      }

      // --- [2] Verify an Object array of two Float64Arrays and a Map valued by one are rejected while the element and the value read back are accepted ---
      {
        let float64Checker: util.types = new util.types();
        let box: Object[] = [new Float64Array(1), new Float64Array(2)];
        expect(float64Checker.isFloat64Array(box)).assertFalse();
        expect(float64Checker.isFloat64Array(box[0])).assertTrue();
        expect(float64Checker.isFloat64Array(box[1])).assertTrue();
        let float64Checker_2: util.types = new util.types();
        let store: Map<string, Float64Array> = new Map<string, Float64Array>();
        store.set('v', new Float64Array(1));
        let got: Float64Array = store.get('v') as Float64Array;
        expect(float64Checker_2.isFloat64Array(store)).assertFalse();
        expect(float64Checker_2.isFloat64Array(got)).assertTrue();
      }

      // --- [3] Verify isFloat64Array returns true for a Float64Array while an Int32Array stays rejected ---
      {
        let float64Probe: util.types = new util.types();
        let wide: Float64Array = new Float64Array(2);
        expect(float64Probe.isFloat64Array(wide)).assertTrue();
        expect(float64Probe.isFloat64Array(new Int32Array(1))).assertFalse();
      }

      // --- [4] Verify isFloat64Array separates a Float64Array from a Float32Array built from the same doubles ---
      {
        let float64Probe: util.types = new util.types();
        let wide: Float64Array = new Float64Array([1.5, 2.5]);
        let narrow: Float32Array = new Float32Array([1.5, 2.5]);
        expect(float64Probe.isFloat64Array(wide)).assertTrue();
        expect(float64Probe.isFloat64Array(narrow)).assertFalse();
        expect(wide.byteLength).assertEqual(16);
        expect(narrow.byteLength).assertEqual(8);
      }

      // --- [5] Verify the disjunction of two results for the same instance is true ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float64Array = new Float64Array([6.5]);
        expect(float64Checker.isFloat64Array(view) || float64Checker.isFloat64Array(view)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_3000
     * @tc.name testTypesIsFloat64Array030
     * @tc.desc Merged batch (5 tests): API call consistency: two consecutive calls on the same instance agree with each other; a bare ArrayBuffer widened to Object is still rejected by isFloat64Array and accepted by isArrayBuffer; a Map accepted by isMap is rejected by isFloat64Array; a Promise accepted by isPromise is rejected by isFloat64Array; a Float64Array is accepted by isFloat64Array, isTypedArray and isArrayBufferView.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two consecutive calls on the same instance agree with each other ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0, 2.0]);
        let firstVerdict: boolean = float64Probe.isFloat64Array(view);
        let againVerdict: boolean = float64Probe.isFloat64Array(view);
        expect(firstVerdict && againVerdict).assertTrue();
      }

      // --- [2] Verify a bare ArrayBuffer widened to Object is still rejected by isFloat64Array and accepted by isArrayBuffer ---
      {
        let float64Checker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let held: Object = ab;
        expect(float64Checker.isFloat64Array(held)).assertFalse();
        expect(float64Checker.isArrayBuffer(held)).assertTrue();
      }

      // --- [3] Verify a Map accepted by isMap is rejected by isFloat64Array ---
      {
        let float64Checker: util.types = new util.types();
        let m: Map<string, string> = new Map<string, string>();
        expect(float64Checker.isMap(m)).assertTrue();
        expect(float64Checker.isFloat64Array(m)).assertFalse();
      }

      // --- [4] Verify a Promise accepted by isPromise is rejected by isFloat64Array ---
      {
        let float64Checker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(float64Checker.isFloat64Array(p)).assertFalse();
        expect(float64Checker.isPromise(Promise.resolve<int>(1))).assertTrue();
      }

      // --- [5] Verify a Float64Array is accepted by isFloat64Array, isTypedArray and isArrayBufferView but rejected by the three buffer predicates ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0]);
        expect(float64Checker.isFloat64Array(view)).assertTrue();
        expect(float64Checker.isTypedArray(view)).assertTrue();
        expect(float64Checker.isArrayBufferView(view)).assertTrue();
        expect(float64Checker.isAnyArrayBuffer(view)).assertFalse();
        expect(float64Checker.isArrayBuffer(view)).assertFalse();
        expect(float64Checker.isDataView(view)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_3100
     * @tc.name testTypesIsFloat64Array031
     * @tc.desc Merged batch (5 tests): API call consistency: a genuine Float64Array is rejected by the Map, Set, Date and RegExp predicates; the logical negation of a false result on a string is true; the disjunction of a true result for a Float64Array and a false result for a string is true; repeated calls inside a five iteration loop keep returning true for one Float64Array; a BigInt64Array of one eight byte element is accepted by isArrayBufferView and rejected by isAnyArrayBuffer and isFloat64Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a genuine Float64Array is rejected by the Map, Set, Date and RegExp predicates while isFloat64Array accepts it ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float64Array = new Float64Array([3.5]);
        expect(float64Checker.isFloat64Array(view)).assertTrue();
        expect(float64Checker.isMap(view)).assertFalse();
        expect(float64Checker.isSet(view)).assertFalse();
        expect(float64Checker.isDate(view)).assertFalse();
        expect(float64Checker.isRegExp(view)).assertFalse();
      }

      // --- [2] Verify the logical negation of a false result on a string is true ---
      {
        let float64Probe: util.types = new util.types();
        let text: string = 'float64View';
        expect(!float64Probe.isFloat64Array(text)).assertTrue();
      }

      // --- [3] Verify the disjunction of a true result for a Float64Array and a false result for a string is true ---
      {
        let float64Checker: util.types = new util.types();
        let view: Float64Array = new Float64Array(1);
        let text: string = 'no';
        expect(float64Checker.isFloat64Array(view) || float64Checker.isFloat64Array(text)).assertTrue();
      }

      // --- [4] Verify repeated calls inside a five iteration loop keep returning true for one Float64Array ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0, 2.0]);
        let trueCount: int = 0;
        for (let round: int = 0; round < 5; round++) {
          if (float64Probe.isFloat64Array(view)) {
            trueCount++;
          }
        }
        expect(trueCount).assertEqual(5);
      }

      // --- [5] Verify a BigInt64Array of one eight byte element is accepted by isArrayBufferView and rejected by isAnyArrayBuffer and isFloat64Array ---
      {
        let float64Probe: util.types = new util.types();
        let big: BigInt64Array = new BigInt64Array(1);
        expect(big.byteLength).assertEqual(8);
        expect(float64Probe.isFloat64Array(big)).assertFalse();
        expect(float64Probe.isArrayBufferView(big)).assertTrue();
        expect(float64Probe.isAnyArrayBuffer(big)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_3200
     * @tc.name testTypesIsFloat64Array032
     * @tc.desc Merged batch (5 tests): Program integration: the conjunction of two results for Float64Arrays of capacity 2 and 5 is true; accepts the value returned by the helper buildFloat64Array; isFloat64Array returns true when the argument travels through an Object typed helper parameter; the result drives an if statement into its then branch for a genuine Float64Array; the De Morgan pair is equivalent, the negation of the disjunction matching the conjunction of the two negations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the conjunction of two results for Float64Arrays of capacity 2 and 5 is true ---
      {
        let float64Checker: util.types = new util.types();
        let small: Float64Array = new Float64Array(2);
        let large: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
        expect(float64Checker.isFloat64Array(small) && float64Checker.isFloat64Array(large)).assertTrue();
      }

      // --- [2] Verify isFloat64Array returns true for the value returned by the helper buildFloat64Array ---
      {
        let float64Probe: util.types = new util.types();
        let made: Float64Array = buildFloat64Array();
        expect(float64Probe.isFloat64Array(made)).assertTrue();
        expect(made.length).assertEqual(2);
      }

      // --- [3] Verify isFloat64Array returns true when the argument travels through an Object typed helper parameter ---
      {
        let f: Float64Array = new Float64Array(1);
        expect(probeFloat64(f)).assertTrue();
      }

      // --- [4] Verify the result drives an if statement into its then branch for a genuine Float64Array ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0, 2.0]);
        let reached: int = 0;
        if (float64Probe.isFloat64Array(view)) {
          reached = 1;
        }
        expect(reached).assertEqual(1);
      }

      // --- [5] Verify the De Morgan pair is equivalent, the negation of the disjunction matching the conjunction of the two negations ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.0]);
        let accepted: boolean = float64Probe.isFloat64Array(view);
        let rejected: boolean = float64Probe.isFloat64Array('text');
        let left: boolean = !(accepted || rejected);
        let right: boolean = !accepted && !rejected;
        expect(left).assertEqual(right);
        expect(left).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_3300
     * @tc.name testTypesIsFloat64Array033
     * @tc.desc Merged batch (2 tests): Program integration: the verdict passed to the module level helper labelFloat64Verdict selects the accepted label for a genuine Float64Array; a while loop that drains an Object array counts exactly one accepted Float64Array among the four mixed values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the verdict passed to the module level helper labelFloat64Verdict selects the accepted label for a genuine Float64Array ---
      {
        let float64Probe: util.types = new util.types();
        let view: Float64Array = new Float64Array([1.5]);
        let label: string = labelFloat64Verdict(float64Probe.isFloat64Array(view));
        expect(label).assertEqual('float64');
      }

      // --- [2] Verify a while loop that drains an Object array counts exactly one accepted Float64Array among the four mixed values ---
      {
        let float64Probe: util.types = new util.types();
        let pending: Array<Object> = [
          new ArrayBuffer(8) as Object, new Float64Array(1) as Object,
          'x' as Object, new Float32Array(1) as Object
        ];
        let hits: int = 0;
        while (pending.length > 0) {
          let pulled: Object = pending.pop() as Object;
          if (float64Probe.isFloat64Array(pulled)) {
            hits++;
          }
        }
        expect(hits).assertEqual(1);
        expect(pending.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT64_ARRAY_3400
     * @tc.name testTypesIsFloat64Array034
     * @tc.desc Merged batch (1 tests): Miscellaneous checks: checks remaining edge cases, covering typed array views and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat64Array034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat64Array returns false for the raw doubles Double.MAX_VALUE and 5e-324 ---
      {
        let float64Checker: util.types = new util.types();
        let big: double = Double.MAX_VALUE;
        let tiny: double = 5e-324;
        expect(float64Checker.isFloat64Array(big)).assertFalse();
        expect(float64Checker.isFloat64Array(tiny)).assertFalse();
      }
    });

  });
}
