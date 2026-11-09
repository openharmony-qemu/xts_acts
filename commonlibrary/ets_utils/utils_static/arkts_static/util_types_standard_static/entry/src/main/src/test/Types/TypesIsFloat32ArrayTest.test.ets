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
} from '@ohos/hypium-static/src/main/indexStatic';
import util from '@ohos.util';
import Utils from './../Util.test';

class TagHolder {
  tag: string = 'k';
}

class ShapeClone {
  length: int = 2;
  byteLength: int = 8;
  byteOffset: int = 0;
  buffer: ArrayBuffer = new ArrayBuffer(8);
}

class CycleNode {
  tag: string = 'n';
  next: CycleNode | null = null;
}

interface PairBox {
  left: int;
  right: int;
}

interface FloatEnvelope {
  data: Float32Array;
}

function makeFloat32(count: int): Float32Array {
  return new Float32Array(count);
}

class SlotStore {
  slots: Set<Float32Array> = new Set<Float32Array>();
}

function identity32(v: Float32Array): Float32Array {
  return v;
}

function holdsFloat32(candidate: Object): boolean {
  let probe: util.types = new util.types();
  return probe.isFloat32Array(candidate);
}

export default function typesIsFloat32ArrayTest(): void {
  describe('TypesIsFloat32ArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0100
     * @tc.name testTypesIsFloat32Array001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a 1024 element array whose byteLength is 4096 bytes; accepts an array built from an integer literal list and covering a whole 16 byte ArrayBuffer; accepts a Float32Array built by the default constructor; accepts an array built from a fractional literal list; converting an Int16Array produces a Float32Array with its own new buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat32Array returns true for a 1024 element array whose byteLength is 4096 bytes ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = makeFloat32(1024);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.length).assertEqual(1024);
        expect(float32View.byteLength).assertEqual(4096);
      }

      // --- [2] Verify isFloat32Array returns true for an array built from an integer literal list and covering a whole 16 byte ArrayBuffer ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([1, 2, 3]);
        expect(float32View.$_get(2)).assertEqual(3);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        let float32Probe_2: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let float32View_2: Float32Array = new Float32Array(ab);
        expect(float32Probe_2.isFloat32Array(float32View_2)).assertTrue();
        expect(float32View_2.buffer).assertEqual(ab);
      }

      // --- [3] Verify isFloat32Array returns true for a Float32Array built by the default constructor ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array();
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.length).assertEqual(0);
      }

      // --- [4] Verify isFloat32Array returns true for an array built from a fractional literal list ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([1.5, 2.5, 3.5]);
        let judged: boolean = float32Probe.isFloat32Array(float32View);
        expect(judged).assertTrue();
        expect(float32View.$_get(1)).assertEqual(2.5);
      }

      // --- [5] Verify converting an Int16Array produces a Float32Array with its own new buffer ---
      {
        let float32Probe: util.types = new util.types();
        let src: Int16Array = new Int16Array([1, 2]);
        let float32View: Float32Array = new Float32Array(src);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32Probe.isFloat32Array(src)).assertFalse();
        expect(float32View.buffer === src.buffer).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0200
     * @tc.name testTypesIsFloat32Array002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: a buffer of 12 bytes holds three float elements, occupies 12 bytes and is reported true; the negative power of two -1024 and the power of two 65536 are stored exactly, unlike the inexact decimal fractions; a Float32Array over the same buffer splits a 1.0 written through a Float64Array into two words; an array filled element by element from another array is true and owns a separate buffer; two results of the same factory are both true and share no buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a buffer of 12 bytes holds three float elements, occupies 12 bytes and is reported true ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(12);
        let float32View: Float32Array = new Float32Array(ab);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.length).assertEqual(3);
        expect(float32View.byteLength).assertEqual(12);
      }

      // --- [2] Verify the negative power of two -1024 and the power of two 65536 are stored exactly, unlike the inexact decimal fractions ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        float32View.$_set(0, -1024.0);
        float32View.$_set(1, 65536.0);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(-1024);
        expect(float32View.$_get(1)).assertEqual(65536);
      }

      // --- [3] Verify a Float32Array over the same buffer splits a 1.0 written through a Float64Array into two words ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let float64View: Float64Array = new Float64Array(ab);
        let float32View: Float32Array = new Float32Array(ab);
        float64View.$_set(0, 1.0);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32Probe.isFloat32Array(float64View)).assertFalse();
        expect(float32View.$_get(0)).assertEqual(0);
        expect(float32View.$_get(1)).assertEqual(1.875);
      }

      // --- [4] Verify an array filled element by element from another array is true and owns a separate buffer ---
      {
        let float32Probe: util.types = new util.types();
        let src: Float32Array = new Float32Array([1.5, 2.5]);
        let dst: Float32Array = new Float32Array(2);
        for (let i: int = 0; i < src.length; i++) {
          dst.$_set(i, src.$_get(i));
        }
        expect(float32Probe.isFloat32Array(dst)).assertTrue();
        expect(dst.$_get(1)).assertEqual(2.5);
        expect(dst.buffer === src.buffer).assertFalse();
      }

      // --- [5] Verify two results of the same factory are both true and share no buffer ---
      {
        let float32Probe: util.types = new util.types();
        let first: Float32Array = makeFloat32(2);
        let second: Float32Array = makeFloat32(2);
        expect(float32Probe.isFloat32Array(first)).assertTrue();
        expect(float32Probe.isFloat32Array(second)).assertTrue();
        expect(first.buffer === second.buffer).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0300
     * @tc.name testTypesIsFloat32Array003
     * @tc.desc Merged batch (2 tests): Basic construction and recognition: the branch taken by a runtime flag decides which typed array is built and therefore decides the verdict; float literals written with the f suffix keep their fraction when they widen to double elements.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the branch taken by a runtime flag decides which typed array is built and therefore decides the verdict ---
      {
        let float32Checker: util.types = new util.types();
        let pick: boolean = false;
        let chosen: Object = pick ? new Float32Array(2) : new Int32Array(2);
        expect(float32Checker.isFloat32Array(chosen)).assertFalse();
        pick = true;
        let flipped: Object = pick ? new Float32Array(2) : new Int32Array(2);
        expect(float32Checker.isFloat32Array(flipped)).assertTrue();
      }

      // --- [2] Verify float literals written with the f suffix keep their fraction when they widen to double elements ---
      {
        let float32Probe: util.types = new util.types();
        let ratio: float = 0.5f;
        let widened: double = ratio;
        let float32View: Float32Array = new Float32Array(2);
        float32View.$_set(0, widened);
        float32View.$_set(1, 2.5f);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(0.5);
        expect(float32View.$_get(1)).assertEqual(2.5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0400
     * @tc.name testTypesIsFloat32Array004
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: accepts an array converted from a Float64Array source; accepts a Float32Array converted from an Int32Array and for a copy of a Float32Array; the double 1.1 copied from a Float64Array lands between 1.1 and 1.1001; the Float32Array from factory consumes a Set iterable, producing an array whose length matches the set size; the from factory copies a float array into an independent buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat32Array returns true for an array converted from a Float64Array source ---
      {
        let float32Probe: util.types = new util.types();
        let src: Float64Array = new Float64Array([1.5, 2.5]);
        let float32View: Float32Array = new Float32Array(src);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.length).assertEqual(2);
      }

      // --- [2] Verify isFloat32Array returns true for a Float32Array converted from an Int32Array and for a copy of a Float32Array ---
      {
        let float32Probe: util.types = new util.types();
        let srcInt32: Int32Array = new Int32Array([7, 8]);
        let float32View: Float32Array = new Float32Array(srcInt32);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(7);
        let srcFloat32: Float32Array = new Float32Array([4.5, 6.5]);
        let copy: Float32Array = new Float32Array(srcFloat32);
        expect(float32Probe.isFloat32Array(copy)).assertTrue();
        expect(copy.$_get(1)).assertEqual(6.5);
      }

      // --- [3] Verify the double 1.1 copied from a Float64Array lands between 1.1 and 1.1001 ---
      {
        let float32Probe: util.types = new util.types();
        let src: Float64Array = new Float64Array([1.1, 2.2]);
        let float32View: Float32Array = new Float32Array(src);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertLarger(1.1);
        expect(float32View.$_get(0)).assertLess(1.1001);
      }

      // --- [4] Verify the Float32Array from factory consumes a Set iterable, producing an array whose length matches the set size ---
      {
        let float32Probe: util.types = new util.types();
        let src: Set<double> = new Set<double>();
        src.add(0.5);
        src.add(1.5);
        let made: Float32Array = Float32Array.from(src);
        expect(made.length).assertEqual(2);
        expect(made.$_get(0)).assertEqual(0.5);
        expect(float32Probe.isFloat32Array(made)).assertTrue();
        expect(float32Probe.isFloat32Array(src)).assertFalse();
      }

      // --- [5] Verify the from factory copies a float array into an independent buffer, so a write into the copy leaves the source element at 1.5 ---
      {
        let float32Probe: util.types = new util.types();
        let src: Float32Array = new Float32Array([1.5, 2.5]);
        let copy: Float32Array = Float32Array.from(src);
        copy.$_set(0, 6.5);
        expect(float32Probe.isFloat32Array(copy)).assertTrue();
        expect(copy.$_get(0)).assertEqual(6.5);
        expect(src.$_get(0)).assertEqual(1.5);
        expect(copy.buffer === src.buffer).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0500
     * @tc.name testTypesIsFloat32Array005
     * @tc.desc Merged batch (1 test): Type conversion and subclassing: Object aliases keep the instanceof verdict that matches the predicate result.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Object aliases keep the instanceof verdict that matches the predicate result ---
      {
        let float32Probe: util.types = new util.types();
        let asObject: Object = new Float32Array(2);
        let asInt: Object = new Int32Array(2);
        expect(asObject instanceof Float32Array).assertTrue();
        expect(float32Probe.isFloat32Array(asObject)).assertTrue();
        expect(asInt instanceof Float32Array).assertFalse();
        expect(float32Probe.isFloat32Array(asInt)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0600
     * @tc.name testTypesIsFloat32Array006
     * @tc.desc Merged batch (5 tests): Boundary values: accepts Float32Array instances of length zero, one and five; the negative zero double, which compares equal to zero, is still reported false; an empty ArrayBuffer is reported false; accepts the empty view over a zero byte ArrayBuffer; infinities written into a Float32Array are read back above and below one e38.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat32Array returns true for Float32Array instances of length zero, one and five ---
      {
        let float32Probe: util.types = new util.types();
        let a: Float32Array = new Float32Array(0);
        let b: Float32Array = new Float32Array(1);
        let c: Float32Array = new Float32Array(5);
        expect(float32Probe.isFloat32Array(a)).assertTrue();
        expect(float32Probe.isFloat32Array(b)).assertTrue();
        expect(float32Probe.isFloat32Array(c)).assertTrue();
        expect(b.length).assertEqual(1);
      }

      // --- [2] Verify the negative zero double, which compares equal to zero, is still reported false ---
      {
        let float32Checker: util.types = new util.types();
        expect(float32Checker.isFloat32Array(-0.0)).assertFalse();
        expect(float32Checker.isFloat32Array(0.0)).assertFalse();
      }

      // --- [3] Verify an empty ArrayBuffer is reported false ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0);
        expect(ab.byteLength).assertEqual(0);
        expect(float32Probe.isFloat32Array(ab)).assertFalse();
      }

      // --- [4] Verify isFloat32Array returns true for the empty view over a zero byte ArrayBuffer ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0);
        let float32View: Float32Array = new Float32Array(ab);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.byteLength).assertEqual(0);
      }

      // --- [5] Verify infinities written into a Float32Array are read back above and below one e38 ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        float32View.$_set(0, Double.POSITIVE_INFINITY);
        float32View.$_set(1, Double.NEGATIVE_INFINITY);
        let up: double = float32View.$_get(0);
        let down: double = float32View.$_get(1);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(up).assertLarger(1.0e38);
        expect(down).assertLess(-1.0e38);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0700
     * @tc.name testTypesIsFloat32Array007
     * @tc.desc Merged batch (5 tests): Boundary values: 16777217 loses the odd unit in float32 and reads back as 16777216; 3.5e38 exceeds the float32 range and reads back larger than one e38; the largest float32 value stays finite while being above 3.4e38; the smallest positive double underflows to zero inside a Float32Array; an out of range offset view throws a RangeError and the predicate still holds.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify 16777217 loses the odd unit in float32 and reads back as 16777216 ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([16777217]);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(16777216);
      }

      // --- [2] Verify 3.5e38 exceeds the float32 range and reads back larger than one e38 ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([3.5e38]);
        let got: double = float32View.$_get(0);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(got).assertLarger(1.0e38);
      }

      // --- [3] Verify the largest float32 value stays finite while being above 3.4e38 ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([3.4028234663852886e38]);
        let got: double = float32View.$_get(0);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(got).assertLarger(3.4e38);
        expect(got).assertLess(Double.POSITIVE_INFINITY);
      }

      // --- [4] Verify the smallest positive double underflows to zero inside a Float32Array ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([Double.MIN_VALUE]);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(0);
      }

      // --- [5] Verify an out of range offset view throws a RangeError and the predicate still holds ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        try {
          new Float32Array(ab, 20, 4);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        expect(float32Probe.isFloat32Array(new Float32Array(ab))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0800
     * @tc.name testTypesIsFloat32Array008
     * @tc.desc Merged batch (5 tests): Boundary values: the smallest float32 subnormal from a raw bit pattern and from its decimal value stays positive; a negative zero element reads back equal to the positive zero element; Double.MAX_VALUE saturates element one to infinity; 4.2 and its negation both round toward zero in float32, landing between 4.19 and 4.2 in magnitude; 16777218 is exact above the 24 bit integer limit.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the smallest float32 subnormal from a raw bit pattern and from its decimal value stays positive ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let float32View: Float32Array = new Float32Array(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(0, 1);
        let fromBits: double = float32View.$_get(0);
        let fromValue: Float32Array = new Float32Array([1.401298464324817e-45]);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32Probe.isFloat32Array(fromValue)).assertTrue();
        expect(fromBits).assertLarger(0);
        expect(fromBits).assertLess(1.0e-38);
        expect(fromValue.$_get(0)).assertLarger(0);
      }

      // --- [2] Verify a negative zero element reads back equal to the positive zero element while only the negative one sets the high byte to 128 ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let float32View: Float32Array = new Float32Array(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        float32View.$_set(0, 0.0);
        float32View.$_set(1, -0.0);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(float32View.$_get(1));
        expect(uint8View.$_get(3)).assertEqual(0);
        expect(uint8View.$_get(7)).assertEqual(128);
      }

      // --- [3] Verify Double.MAX_VALUE saturates element one to infinity while the finite 3.4e38 neighbour at element zero stays below infinity ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        float32View.$_set(0, 3.4e38);
        float32View.$_set(1, Double.MAX_VALUE);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertLess(Double.POSITIVE_INFINITY);
        expect(float32View.$_get(0)).assertLarger(3.3e38);
        expect(float32View.$_get(1)).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [4] Verify 4.2 and its negation both round toward zero in float32, landing between 4.19 and 4.2 in magnitude ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([4.2, -4.2]);
        let near: double = float32View.$_get(0);
        let below: double = float32View.$_get(1);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(near).assertLess(4.2);
        expect(near).assertLarger(4.19);
        expect(below).assertLarger(-4.2);
        expect(below).assertLess(-4.19);
      }

      // --- [5] Verify 16777218 is exact above the 24 bit integer limit while the odd 16777219 ties up to the even neighbour 16777220 ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([16777218, 16777219]);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(16777218);
        expect(float32View.$_get(1)).assertEqual(16777220);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_0900
     * @tc.name testTypesIsFloat32Array009
     * @tc.desc Merged batch (1 test): Boundary values: one float32 representable step above one is kept while exactly half of it ties back to one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one float32 representable step above one is kept while exactly half of it ties back to one ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        float32View.$_set(0, 1.0 + 1.1920928955078125e-7);
        float32View.$_set(1, 1.0 + 5.960464477539063e-8);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertLarger(1.0);
        expect(float32View.$_get(1)).assertEqual(1.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1000
     * @tc.name testTypesIsFloat32Array010
     * @tc.desc Merged batch (4 tests): Boundary overflow: checks numeric limit and wrapping behavior, covering ArrayBuffer objects and related extreme values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the large doubles 9007199254740992 and 1e21 are reported false ---
      {
        let float32Checker: util.types = new util.types();
        let safeLimit: double = 9007199254740992;
        let beyondPrecision: double = 1e21;
        let limitVerdict: boolean = float32Checker.isFloat32Array(safeLimit);
        let precisionVerdict: boolean = float32Checker.isFloat32Array(beyondPrecision);
        expect(limitVerdict).assertFalse();
        expect(precisionVerdict).assertFalse();
      }

      // --- [2] Verify a bare 16 byte ArrayBuffer that no view wraps is reported false ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let judged: boolean = float32Probe.isFloat32Array(ab);
        expect(judged).assertFalse();
        expect(ab.byteLength).assertEqual(16);
      }

      // --- [3] Verify Double.MAX_VALUE times two and times minus two overflow to infinities that are not NaN yet still reported false ---
      {
        let float32Checker: util.types = new util.types();
        let overflowPlus: double = Double.MAX_VALUE * 2;
        let overflowMinus: double = Double.MAX_VALUE * -2;
        expect(isNaN(overflowPlus)).assertFalse();
        expect(float32Checker.isFloat32Array(overflowPlus)).assertFalse();
        expect(float32Checker.isFloat32Array(overflowMinus)).assertFalse();
      }

      // --- [4] Verify the double and number extreme constants are all reported false ---
      {
        let float32Checker: util.types = new util.types();
        expect(float32Checker.isFloat32Array(Double.MAX_VALUE)).assertFalse();
        expect(float32Checker.isFloat32Array(Double.MIN_VALUE)).assertFalse();
        expect(float32Checker.isFloat32Array(Number.MAX_VALUE)).assertFalse();
        expect(float32Checker.isFloat32Array(Number.MIN_VALUE)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1100
     * @tc.name testTypesIsFloat32Array011
     * @tc.desc Merged batch (5 tests): Primitive value rejection: the small integers 0, 1, -1 and 42 are all reported false; a 10000 character string is reported false regardless of its length; a bigint built from the number zero is reported false; a negative bigint parsed from the text minus one is reported false; a two dimensional int array, which is an array of arrays, is reported false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the small integers 0, 1, -1 and 42 are all reported false ---
      {
        let float32Checker: util.types = new util.types();
        expect(float32Checker.isFloat32Array(0)).assertFalse();
        expect(float32Checker.isFloat32Array(1)).assertFalse();
        expect(float32Checker.isFloat32Array(-1)).assertFalse();
        expect(float32Checker.isFloat32Array(42)).assertFalse();
      }

      // --- [2] Verify a 10000 character string is reported false regardless of its length ---
      {
        let float32Probe: util.types = new util.types();
        let longText: string = 'a'.repeat(10000);
        expect(longText.length).assertEqual(10000);
        expect(float32Probe.isFloat32Array(longText)).assertFalse();
      }

      // --- [3] Verify a bigint built from the number zero is reported false ---
      {
        let float32Checker: util.types = new util.types();
        let zeroBig: bigint = BigInt(0);
        let judged: boolean = float32Checker.isFloat32Array(zeroBig);
        expect(judged).assertFalse();
      }

      // --- [4] Verify a negative bigint parsed from the text minus one is reported false ---
      {
        let float32Probe: util.types = new util.types();
        let minusOne: bigint = BigInt('-1');
        expect(minusOne.toString()).assertEqual('-1');
        expect(float32Probe.isFloat32Array(minusOne)).assertFalse();
      }

      // --- [5] Verify a two dimensional int array, which is an array of arrays, is reported false ---
      {
        let float32Probe: util.types = new util.types();
        let grid: int[][] = [[1, 2], [3, 4]];
        expect(float32Probe.isFloat32Array(grid)).assertFalse();
        expect(grid.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1200
     * @tc.name testTypesIsFloat32Array012
     * @tc.desc Merged batch (5 tests): Primitive value rejection: the largest signed 64 bit bigint is reported false; the fractional doubles 3.14 and 2.5 are reported false although floats fit the array; every answers a single boolean that the typed array predicate rejects; rejecting an Int32Array leaves its elements, length and byteLength intact; the Float32Array from factory copies a double array whose plain source stays reported false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the largest signed 64 bit bigint is reported false ---
      {
        let float32Checker: util.types = new util.types();
        let scalars: bigint[] = [BigInt('9223372036854775807')];
        expect(float32Checker.isFloat32Array(scalars[0])).assertFalse();
      }

      // --- [2] Verify the fractional doubles 3.14 and 2.5 are reported false although floats fit the array ---
      {
        let float32Checker: util.types = new util.types();
        let fractions: double[] = [3.14, 2.5];
        let rejected: int = 0;
        for (const fraction of fractions) {
          if (!float32Checker.isFloat32Array(fraction)) {
            rejected = rejected + 1;
          }
        }
        expect(rejected).assertEqual(2);
      }

      // --- [3] Verify every answers a single boolean that the typed array predicate rejects ---
      {
        let float32Probe: util.types = new util.types();
        let values: Float32Array = new Float32Array([2, 4]);
        let allEven: boolean = values.every((v: double, i: int, a: Float32Array) => v % 2 === 0);
        expect(allEven).assertTrue();
        expect(float32Probe.isFloat32Array(allEven)).assertFalse();
      }

      // --- [4] Verify rejecting an Int32Array leaves its elements, length and byteLength intact while the companion float array stays true ---
      {
        let float32Probe: util.types = new util.types();
        let int32View: Int32Array = new Int32Array([5, 6]);
        let float32View: Float32Array = new Float32Array([5.5, 6.5]);
        int32View.$_set(0, 7);
        expect(float32Probe.isFloat32Array(int32View)).assertFalse();
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(int32View.length).assertEqual(2);
        expect(int32View.byteLength).assertEqual(8);
        expect(int32View.$_get(0)).assertEqual(7);
        expect(float32View.$_get(0)).assertEqual(5.5);
      }

      // --- [5] Verify the Float32Array from factory copies a double array whose plain source stays reported false ---
      {
        let float32Probe: util.types = new util.types();
        let plain: double[] = [1.5, 2.5, 3.5];
        let made: Float32Array = Float32Array.from(plain);
        expect(made.length).assertEqual(3);
        expect(made.$_get(2)).assertEqual(3.5);
        expect(float32Probe.isFloat32Array(made)).assertTrue();
        expect(float32Probe.isFloat32Array(plain)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1300
     * @tc.name testTypesIsFloat32Array013
     * @tc.desc Merged batch (5 tests): Primitive value rejection: a DataView over the same buffer is a view; rejects a BigInt64Array of the same byte length; the NaN derived from subtracting positive infinity from itself is confirmed by isNaN yet reported false; a false result for a string does not affect a later true result for a Float32Array; a bare ArrayBuffer satisfies only the two buffer predicates.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a DataView over the same buffer is a view but neither a typed array nor a float array, unlike the float array beside it ---
      {
        let float32Checker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab);
        let float32View: Float32Array = new Float32Array(ab);
        expect(float32Checker.isArrayBufferView(dv)).assertTrue();
        expect(float32Checker.isTypedArray(dv)).assertFalse();
        expect(float32Checker.isFloat32Array(dv)).assertFalse();
        expect(float32Checker.isFloat32Array(float32View)).assertTrue();
      }

      // --- [2] Verify isFloat32Array returns false for a BigInt64Array of the same byte length ---
      {
        let float32Checker: util.types = new util.types();
        let v: BigInt64Array = new BigInt64Array(new ArrayBuffer(16));
        expect(float32Checker.isFloat32Array(v)).assertFalse();
      }

      // --- [3] Verify the NaN derived from subtracting positive infinity from itself is confirmed by isNaN yet reported false ---
      {
        let float32Checker: util.types = new util.types();
        let notANumber: double = Double.POSITIVE_INFINITY - Double.POSITIVE_INFINITY;
        expect(isNaN(notANumber)).assertTrue();
        expect(float32Checker.isFloat32Array(notANumber)).assertFalse();
      }

      // --- [4] Verify a false result for a string does not affect a later true result for a Float32Array ---
      {
        let float32Checker: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(1);
        expect(float32Checker.isFloat32Array('noise')).assertFalse();
        expect(float32Checker.isFloat32Array(float32View)).assertTrue();
      }

      // --- [5] Verify a bare ArrayBuffer satisfies only the two buffer predicates while the view, typed array and float array predicates all reject it ---
      {
        let float32Checker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        expect(float32Checker.isAnyArrayBuffer(ab)).assertTrue();
        expect(float32Checker.isArrayBuffer(ab)).assertTrue();
        expect(float32Checker.isArrayBufferView(ab)).assertFalse();
        expect(float32Checker.isTypedArray(ab)).assertFalse();
        expect(float32Checker.isFloat32Array(ab)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1400
     * @tc.name testTypesIsFloat32Array014
     * @tc.desc Merged batch (1 test): Primitive value rejection: a Float64Array belongs to the typed array family and a plain double array does not, yet both fail the narrow float32 predicate.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Float64Array belongs to the typed array family and a plain double array does not, yet both fail the narrow float32 predicate ---
      {
        let float32Checker: util.types = new util.types();
        let float64View: Float64Array = new Float64Array(2);
        let plain: double[] = [1.5, 2.5];
        expect(float32Checker.isTypedArray(float64View)).assertTrue();
        expect(float32Checker.isFloat32Array(float64View)).assertFalse();
        expect(float32Checker.isTypedArray(plain)).assertFalse();
        expect(float32Checker.isFloat32Array(plain)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1500
     * @tc.name testTypesIsFloat32Array015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an Int16Array; rejects Uint16Array, Uint32Array and BigUint64Array views; rejects a Uint8ClampedArray that clamps a written byte; the ArrayBuffer behind a Float32Array is not itself reported as a Float32Array; an Object array holding a Date and an Error is reported false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isFloat32Array returns false for an Int16Array ---
      {
        let float32Checker: util.types = new util.types();
        let v: Int16Array = new Int16Array([1, 2, 3]);
        expect(float32Checker.isFloat32Array(v)).assertFalse();
      }

      // --- [2] Verify isFloat32Array returns false for Uint16Array, Uint32Array and BigUint64Array views ---
      {
        let float32Checker: util.types = new util.types();
        let vUint16: Uint16Array = new Uint16Array(4);
        expect(float32Checker.isFloat32Array(vUint16)).assertFalse();
        let vUint32: Uint32Array = new Uint32Array(4);
        expect(float32Checker.isFloat32Array(vUint32)).assertFalse();
        let vBigUint64: BigUint64Array = new BigUint64Array(2);
        expect(float32Checker.isFloat32Array(vBigUint64)).assertFalse();
      }

      // --- [3] Verify isFloat32Array returns false for a Uint8ClampedArray that clamps a written byte ---
      {
        let float32Probe: util.types = new util.types();
        let v: Uint8ClampedArray = new Uint8ClampedArray(1);
        v.$_set(0, 300);
        expect(v.$_get(0)).assertEqual(255);
        expect(float32Probe.isFloat32Array(v)).assertFalse();
      }

      // --- [4] Verify the ArrayBuffer behind a Float32Array is not itself reported as a Float32Array ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(4);
        expect(float32Probe.isFloat32Array(float32View.buffer)).assertFalse();
        expect(float32View.buffer.byteLength).assertEqual(16);
      }

      // --- [5] Verify an Object array holding a Date and an Error is reported false ---
      {
        let float32Probe: util.types = new util.types();
        let mixed: Object[] = [new Date(), new Error('probe')];
        expect(float32Probe.isFloat32Array(mixed)).assertFalse();
        expect(mixed.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1600
     * @tc.name testTypesIsFloat32Array016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a Record object used as a lookup table is reported false; a RegExp created through new RegExp is reported false; a RangeError instance is reported false; a WeakRef wrapper object is reported false while its target holder is also false; an already resolved Promise is reported false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Record object used as a lookup table is reported false ---
      {
        let float32Checker: util.types = new util.types();
        let rec: Record<string, int> = { 'k': 1 };
        expect(float32Checker.isFloat32Array(rec)).assertFalse();
      }

      // --- [2] Verify a RegExp created through new RegExp is reported false ---
      {
        let float32Probe: util.types = new util.types();
        let re: RegExp = new RegExp('probe');
        expect(float32Probe.isFloat32Array(re)).assertFalse();
        expect(re.test('probe')).assertTrue();
      }

      // --- [3] Verify a RangeError instance is reported false ---
      {
        let float32Probe: util.types = new util.types();
        let err: Error = new RangeError('probe');
        expect(float32Probe.isFloat32Array(err)).assertFalse();
        expect(err.name).assertEqual('RangeError');
      }

      // --- [4] Verify a WeakRef wrapper object is reported false while its target holder is also false ---
      {
        let float32Checker: util.types = new util.types();
        let holder: TagHolder = new TagHolder();
        let ref: WeakRef<TagHolder> = new WeakRef<TagHolder>(holder);
        expect(float32Checker.isFloat32Array(ref)).assertFalse();
        expect(float32Checker.isFloat32Array(holder)).assertFalse();
      }

      // --- [5] Verify an already resolved Promise is reported false ---
      {
        let float32Checker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(float32Checker.isFloat32Array(p)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1700
     * @tc.name testTypesIsFloat32Array017
     * @tc.desc Merged batch (5 tests): Non-target object rejection: an object that copies the typed array field names is still reported false; an object that points at itself through its next field is reported false; a shape copy that takes the same length and byteLength values is still false; rejects an Int32Array; rejects a Uint8Array of the same byte length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an object that copies the typed array field names is still reported false ---
      {
        let float32Probe: util.types = new util.types();
        let fake: ShapeClone = new ShapeClone();
        expect(float32Probe.isFloat32Array(fake)).assertFalse();
        expect(fake.length).assertEqual(2);
      }

      // --- [2] Verify an object that points at itself through its next field is reported false ---
      {
        let float32Probe: util.types = new util.types();
        let node: CycleNode = new CycleNode();
        node.next = node;
        expect(float32Probe.isFloat32Array(node)).assertFalse();
        expect(node.tag).assertEqual('n');
      }

      // --- [3] Verify a shape copy that takes the same length and byteLength values is still false ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([1.5, 2.5]);
        let shape: ShapeClone = new ShapeClone();
        shape.length = float32View.length;
        shape.byteLength = float32View.byteLength;
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32Probe.isFloat32Array(shape)).assertFalse();
        expect(shape.byteLength).assertEqual(8);
      }

      // --- [4] Verify isFloat32Array returns false for an Int32Array ---
      {
        let float32Probe: util.types = new util.types();
        expect(float32Probe.isFloat32Array(new Int32Array(1))).assertFalse();
      }

      // --- [5] Verify isFloat32Array returns false for a Uint8Array of the same byte length ---
      {
        let float32Checker: util.types = new util.types();
        let v: Uint8Array = new Uint8Array(8);
        expect(float32Checker.isFloat32Array(v)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1800
     * @tc.name testTypesIsFloat32Array018
     * @tc.desc Merged batch (5 tests): Non-target object rejection: two util.types instances are themselves reported false, since they are not arrays; a sibling view created later on the buffer does not disturb the true result; a Float32Array satisfies the view and typed array predicates; an if branch taken because of the verdict performs its guarded write; a Map and a Set are both reported false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two util.types instances are themselves reported false, since they are not arrays ---
      {
        let float32Checker: util.types = new util.types();
        let other: util.types = new util.types();
        expect(float32Checker.isFloat32Array(float32Checker)).assertFalse();
        expect(float32Checker.isFloat32Array(other)).assertFalse();
      }

      // --- [2] Verify a sibling view created later on the buffer does not disturb the true result ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let float32View: Float32Array = new Float32Array(ab);
        let before: boolean = float32Probe.isFloat32Array(float32View);
        let sibling: Int16Array = new Int16Array(ab);
        expect(before).assertTrue();
        expect(sibling.length).assertEqual(8);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
      }

      // --- [3] Verify a Float32Array satisfies the view and typed array predicates while the two ArrayBuffer predicates reject it ---
      {
        let float32Checker: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(4);
        expect(float32Checker.isArrayBufferView(float32View)).assertTrue();
        expect(float32Checker.isTypedArray(float32View)).assertTrue();
        expect(float32Checker.isArrayBuffer(float32View)).assertFalse();
        expect(float32Checker.isAnyArrayBuffer(float32View)).assertFalse();
        expect(float32Checker.isFloat32Array(float32View)).assertTrue();
      }

      // --- [4] Verify an if branch taken because of the verdict performs its guarded write while the rejected Map branch never runs ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        let m: Map<string, int> = new Map<string, int>();
        let written: int = 0;
        if (float32Probe.isFloat32Array(float32View)) {
          float32View.$_set(0, 4.5);
          written = 1;
        }
        if (float32Probe.isFloat32Array(m)) {
          written = 2;
        }
        expect(written).assertEqual(1);
        expect(float32View.$_get(0)).assertEqual(4.5);
      }

      // --- [5] Verify a Map and a Set are both reported false ---
      {
        let float32Checker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        let s: Set<int> = new Set<int>();
        m.set('a', 1);
        s.add(1);
        expect(float32Checker.isFloat32Array(m)).assertFalse();
        expect(float32Checker.isFloat32Array(s)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_1900
     * @tc.name testTypesIsFloat32Array019
     * @tc.desc Merged batch (3 tests): Non-target object rejection: a WeakMap and a WeakSet keyed by a class and an Error and a TypeError instance are both reported false; a plain arrow function and an async arrow function are both reported false; a current Date and an out of range invalid Date are both reported false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a WeakMap and a WeakSet keyed by a class and an Error and a TypeError instance are both reported false ---
      {
        let float32Checker: util.types = new util.types();
        let wm: WeakMap<TagHolder, TagHolder> = new WeakMap<TagHolder, TagHolder>();
        let ws: WeakSet<TagHolder> = new WeakSet<TagHolder>();
        expect(float32Checker.isFloat32Array(wm)).assertFalse();
        expect(float32Checker.isFloat32Array(ws)).assertFalse();
        let float32Checker_2: util.types = new util.types();
        let plain: Error = new Error('probe');
        let typed: Error = new TypeError('probe');
        expect(float32Checker_2.isFloat32Array(plain)).assertFalse();
        expect(float32Checker_2.isFloat32Array(typed)).assertFalse();
      }

      // --- [2] Verify a plain arrow function and an async arrow function are both reported false ---
      {
        let float32Checker: util.types = new util.types();
        let plain: Function = (): void => { };
        let task: Function = async (): Promise<void> => { };
        expect(float32Checker.isFloat32Array(plain)).assertFalse();
        expect(float32Checker.isFloat32Array(task)).assertFalse();
      }

      // --- [3] Verify a current Date and an out of range invalid Date are both reported false ---
      {
        let float32Checker: util.types = new util.types();
        let now: Date = new Date();
        let bad: Date = new Date(8640000000000001);
        expect(float32Checker.isFloat32Array(now)).assertFalse();
        expect(float32Checker.isFloat32Array(bad)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2000
     * @tc.name testTypesIsFloat32Array020
     * @tc.desc Merged batch (5 tests): View and buffer semantics: the two argument form at byteOffset 8 and the three argument form at byteOffset 4 both report two elements; one float occupies four bytes laid out little endian as 0, 0, 128 and 63; four bytes written through a DataView are read back as the float value one; a subarray of a larger Float32Array is accepted, including one derived after the predicate has run; only one of three views over one buffer is counted and a byte written through a DataView yields a float between 0.4 and 0.6.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the two argument form at byteOffset 8 and the three argument form at byteOffset 4 both report two elements ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let tail: Float32Array = new Float32Array(ab, 8);
        let window: Float32Array = new Float32Array(ab, 4, 2);
        expect(float32Probe.isFloat32Array(tail)).assertTrue();
        expect(float32Probe.isFloat32Array(window)).assertTrue();
        expect(tail.byteOffset).assertEqual(8);
        expect(tail.length).assertEqual(2);
        expect(window.byteOffset).assertEqual(4);
        expect(window.length).assertEqual(2);
      }

      // --- [2] Verify one float occupies four bytes laid out little endian as 0, 0, 128 and 63 ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let float32View: Float32Array = new Float32Array(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        float32View.$_set(0, 1.0);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(uint8View.$_get(0)).assertEqual(0);
        expect(uint8View.$_get(1)).assertEqual(0);
        expect(uint8View.$_get(2)).assertEqual(128);
        expect(uint8View.$_get(3)).assertEqual(63);
      }

      // --- [3] Verify four bytes written through a DataView are read back as the float value one ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let dv: DataView = new DataView(ab);
        let float32View: Float32Array = new Float32Array(ab);
        dv.setUint8(0, 0);
        dv.setUint8(1, 0);
        dv.setUint8(2, 128);
        dv.setUint8(3, 63);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(1.0);
      }

      // --- [4] Verify a subarray of a larger Float32Array is accepted, including one derived after the predicate has run ---
      {
        let float32Probe: util.types = new util.types();
        let base: Float32Array = new Float32Array(6);
        let sub: Float32Array = base.subarray(1, 4);
        expect(float32Probe.isFloat32Array(base)).assertTrue();
        expect(float32Probe.isFloat32Array(sub)).assertTrue();
        expect(sub.length).assertEqual(3);
        let float32Probe_2: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(6);
        let kept: boolean = float32Probe_2.isFloat32Array(float32View);
        let part: Float32Array = float32View.subarray(0, 3);
        expect(kept).assertTrue();
        expect(float32Probe_2.isFloat32Array(part)).assertTrue();
        expect(part.length).assertEqual(3);
      }

      // --- [5] Verify only one of three views over one buffer is counted and a byte written through a DataView yields a float between 0.4 and 0.6 ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(12);
        let float32View: Float32Array = new Float32Array(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let dv: DataView = new DataView(ab);
        let hits: int = 0;
        if (float32Probe.isFloat32Array(float32View)) {
          hits++;
        }
        if (float32Probe.isFloat32Array(uint8View)) {
          hits++;
        }
        if (float32Probe.isFloat32Array(dv)) {
          hits++;
        }
        expect(hits).assertEqual(1);
        let float32Probe_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(4);
        let dv_2: DataView = new DataView(ab_2);
        let float32View_2: Float32Array = new Float32Array(ab_2);
        dv_2.setUint8(3, 63);
        let verdict: boolean = float32Probe_2.isFloat32Array(float32View_2);
        let value: double = float32View_2.$_get(0);
        expect(verdict).assertTrue();
        expect(value).assertLarger(0.4);
        expect(value).assertLess(0.6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2100
     * @tc.name testTypesIsFloat32Array021
     * @tc.desc Merged batch (5 tests): View and buffer semantics: a subarray taken without arguments covers all three elements at offset zero and shares its writes with the parent; three views over one 32 byte buffer keep distinct byteLength and byteOffset values; of a subarray keeps byteOffset 8 and length 2 and is still true; a view built over another view buffer shares its bytes; and its parent are both true and that a write through the subarray lands at the parent index two.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a subarray taken without arguments covers all three elements at offset zero and shares its writes with the parent ---
      {
        let float32Probe: util.types = new util.types();
        let base: Float32Array = new Float32Array([1.5, 2.5, 3.5]);
        let whole: Float32Array = base.subarray();
        whole.$_set(0, 7.5);
        expect(float32Probe.isFloat32Array(whole)).assertTrue();
        expect(whole.length).assertEqual(3);
        expect(whole.byteOffset).assertEqual(0);
        expect(base.$_get(0)).assertEqual(7.5);
      }

      // --- [2] Verify three views over one 32 byte buffer keep distinct byteLength and byteOffset values ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let a: Float32Array = new Float32Array(ab, 0, 1);
        let b: Float32Array = new Float32Array(ab, 0, 4);
        let c: Float32Array = new Float32Array(ab, 16, 4);
        expect(float32Probe.isFloat32Array(a)).assertTrue();
        expect(float32Probe.isFloat32Array(b)).assertTrue();
        expect(float32Probe.isFloat32Array(c)).assertTrue();
        expect(a.byteLength).assertEqual(4);
        expect(b.byteLength).assertEqual(16);
        expect(c.byteOffset).assertEqual(16);
        expect(c.length).assertEqual(4);
      }

      // --- [3] Verify a subarray of a subarray keeps byteOffset 8 and length 2 and is still true ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(20);
        let base: Float32Array = new Float32Array(ab);
        let inner: Float32Array = base.subarray(1, 4);
        let deeper: Float32Array = inner.subarray(1, 3);
        expect(float32Probe.isFloat32Array(inner)).assertTrue();
        expect(float32Probe.isFloat32Array(deeper)).assertTrue();
        expect(deeper.byteOffset).assertEqual(8);
        expect(deeper.length).assertEqual(2);
      }

      // --- [4] Verify a view built over another view buffer shares its bytes, so a write into the new view is seen by the original ---
      {
        let float32Probe: util.types = new util.types();
        let source: Float32Array = new Float32Array([1.5, 2.5]);
        let over: Float32Array = new Float32Array(source.buffer);
        over.$_set(0, 8.5);
        expect(float32Probe.isFloat32Array(over)).assertTrue();
        expect(over.length).assertEqual(2);
        expect(float32Probe.isFloat32Array(source)).assertTrue();
        expect(source.$_get(0)).assertEqual(8.5);
      }

      // --- [5] Verify a subarray and its parent are both true and that a write through the subarray lands at the parent index two ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let base: Float32Array = new Float32Array(ab);
        let sub: Float32Array = base.subarray(2, 5);
        sub.$_set(0, 3.5);
        expect(float32Probe.isFloat32Array(sub)).assertTrue();
        expect(float32Probe.isFloat32Array(base)).assertTrue();
        expect(sub.byteOffset).assertEqual(8);
        expect(sub.length).assertEqual(3);
        expect(base.length).assertEqual(6);
        expect(base.$_get(2)).assertEqual(3.5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2200
     * @tc.name testTypesIsFloat32Array022
     * @tc.desc Merged batch (5 tests): View and buffer semantics: an empty subarray window taken from the middle of a populated array keeps byteOffset 8 and the shared buffer; a subarray window at byteOffset 4 satisfies the view, typed array and float array predicates at once; the length, byteLength, byteOffset and buffer of a view survive the predicate call; two offset views write only their own four bytes and leave the rest at zero; two views at different offsets keep their own writes and are both reported true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an empty subarray window taken from the middle of a populated array keeps byteOffset 8 and the shared buffer ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(20);
        let base: Float32Array = new Float32Array(ab);
        let gap: Float32Array = base.subarray(2, 2);
        expect(float32Probe.isFloat32Array(gap)).assertTrue();
        expect(gap.length).assertEqual(0);
        expect(gap.byteOffset).assertEqual(8);
        expect(gap.buffer).assertEqual(ab);
      }

      // --- [2] Verify a subarray window at byteOffset 4 satisfies the view, typed array and float array predicates at once ---
      {
        let float32Probe: util.types = new util.types();
        let base: Float32Array = new Float32Array(4);
        let sub: Float32Array = base.subarray(1, 3);
        expect(float32Probe.isArrayBufferView(sub)).assertTrue();
        expect(float32Probe.isTypedArray(sub)).assertTrue();
        expect(float32Probe.isFloat32Array(sub)).assertTrue();
        expect(sub.byteOffset).assertEqual(4);
        expect(sub.length).assertEqual(2);
      }

      // --- [3] Verify the length, byteLength, byteOffset and buffer of a view survive the predicate call ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let float32View: Float32Array = new Float32Array(ab, 8, 4);
        let kept: boolean = float32Probe.isFloat32Array(float32View);
        expect(kept).assertTrue();
        expect(float32View.length).assertEqual(4);
        expect(float32View.byteLength).assertEqual(16);
        expect(float32View.byteOffset).assertEqual(8);
        expect(float32View.buffer.byteLength).assertEqual(32);
      }

      // --- [4] Verify two offset views write only their own four bytes and leave the rest at zero ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let head: Float32Array = new Float32Array(ab, 0, 1);
        let tail: Float32Array = new Float32Array(ab, 4, 1);
        let uint8View: Uint8Array = new Uint8Array(ab);
        head.$_set(0, 1.0);
        tail.$_set(0, 2.0);
        expect(float32Probe.isFloat32Array(head)).assertTrue();
        expect(float32Probe.isFloat32Array(tail)).assertTrue();
        expect(uint8View.$_get(3)).assertEqual(63);
        expect(uint8View.$_get(7)).assertEqual(64);
        expect(uint8View.$_get(0)).assertEqual(0);
        expect(uint8View.$_get(4)).assertEqual(0);
      }

      // --- [5] Verify two views at different offsets keep their own writes and are both reported true ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let first: Float32Array = new Float32Array(ab, 0, 2);
        let second: Float32Array = new Float32Array(ab, 8, 2);
        first.$_set(0, 1.5);
        second.$_set(0, 2.5);
        expect(float32Probe.isFloat32Array(first)).assertTrue();
        expect(float32Probe.isFloat32Array(second)).assertTrue();
        expect(first.$_get(0)).assertEqual(1.5);
        expect(second.$_get(0)).assertEqual(2.5);
        expect(first.buffer).assertEqual(second.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2300
     * @tc.name testTypesIsFloat32Array023
     * @tc.desc Merged batch (5 tests): View and buffer semantics: the four raw bytes stored below a float array are unchanged by the predicate call; judging a two element window over a sixteen byte buffer leaves the uncovered tail byte at 99; a DataView window over the second half of the buffer leaves the float in the first half at zero while both are judged; fill rewrites only the given window within the buffer and the array keeps its verdict; a Uint8ClampedArray sibling over the same buffer clamps while the float is true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the four raw bytes stored below a float array are unchanged by the predicate call ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let float32View: Float32Array = new Float32Array(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(0, 200);
        uint8View.$_set(1, 30);
        uint8View.$_set(2, 77);
        uint8View.$_set(3, 190);
        let expected: double[] = [200, 30, 77, 190];
        let hits: int = 0;
        for (let i: int = 0; i < expected.length; i++) {
          if (uint8View.$_get(i) === expected[i]) {
            hits += 1;
          }
        }
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(hits).assertEqual(4);
      }

      // --- [2] Verify judging a two element window over a sixteen byte buffer leaves the uncovered tail byte at 99 ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let head: Float32Array = new Float32Array(ab, 0, 2);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(8, 99);
        expect(float32Probe.isFloat32Array(head)).assertTrue();
        expect(head.byteLength).assertEqual(8);
        expect(uint8View.$_get(8)).assertEqual(99);
        expect(uint8View.$_get(12)).assertEqual(0);
      }

      // --- [3] Verify a DataView window over the second half of the buffer leaves the float in the first half at zero while both are judged ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let float32View: Float32Array = new Float32Array(ab, 0, 1);
        let dv: DataView = new DataView(ab, 4, 4);
        dv.setUint8(0, 0);
        dv.setUint8(1, 0);
        dv.setUint8(2, 128);
        dv.setUint8(3, 63);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32Probe.isFloat32Array(dv)).assertFalse();
        expect(float32View.$_get(0)).assertEqual(0);
        expect(dv.getUint8(3)).assertEqual(63);
      }

      // --- [4] Verify fill rewrites only the given window within the buffer and the array keeps its verdict ---
      {
        let float32Probe: util.types = new util.types();
        let values: Float32Array = new Float32Array([1, 2, 3]);
        values.fill(2.5, 1, 3);
        expect(float32Probe.isFloat32Array(values)).assertTrue();
        expect(values[1]).assertEqual(2.5);
        expect(values[0]).assertEqual(1);
      }

      // --- [5] Verify a Uint8ClampedArray sibling over the same buffer clamps while the float is true ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let float32View: Float32Array = new Float32Array(ab);
        let c: Uint8ClampedArray = new Uint8ClampedArray(ab);
        c.$_set(0, 300);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32Probe.isFloat32Array(c)).assertFalse();
        expect(c.$_get(0)).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2400
     * @tc.name testTypesIsFloat32Array024
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: a Float32Array stays writable after the predicate runs; a float array used as a Map key is recovered through the key iterator and stays true there; a NaN element stays unequal to itself and a negative infinity keeps its exponent and sign, with high bytes 128 and 255; the element content of a Float32Array is unchanged after the predicate runs; a slice copy owns a separate buffer, so a write into the copy leaves the source element at 2.5.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Float32Array stays writable after the predicate runs ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        let kept: boolean = float32Probe.isFloat32Array(float32View);
        float32View.$_set(1, 9.5);
        expect(kept).assertTrue();
        expect(float32View.$_get(1)).assertEqual(9.5);
      }

      // --- [2] Verify a float array used as a Map key is recovered through the key iterator and stays true there ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([7.5]);
        let m: Map<Float32Array, string> = new Map<Float32Array, string>();
        m.set(float32View, 'tag');
        let keys: IterableIterator<Float32Array> = m.keys();
        let first: Float32Array = keys.next().value!;
        expect(first.length).assertEqual(1);
        expect(float32Probe.isFloat32Array(first)).assertTrue();
        expect(float32Probe.isFloat32Array(keys)).assertFalse();
        expect(float32Probe.isFloat32Array(m)).assertFalse();
      }

      // --- [3] Verify a NaN element stays unequal to itself and a negative infinity keeps its exponent and sign, with high bytes 128 and 255 ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(1);
        float32View.$_set(0, Double.NaN);
        let nan: double = float32View.$_get(0);
        let kept: boolean = float32Probe.isFloat32Array(float32View);
        expect(kept).assertTrue();
        expect(isNaN(nan)).assertTrue();
        let float32Probe_2: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let float32View_2: Float32Array = new Float32Array(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        float32View_2.$_set(0, Double.NEGATIVE_INFINITY);
        expect(float32Probe_2.isFloat32Array(float32View_2)).assertTrue();
        expect(float32View_2.$_get(0)).assertEqual(Double.NEGATIVE_INFINITY);
        expect(uint8View.$_get(2)).assertEqual(128);
        expect(uint8View.$_get(3)).assertEqual(255);
      }

      // --- [4] Verify the element content of a Float32Array is unchanged after the predicate runs ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([3.5, -2.25]);
        let kept: boolean = float32Probe.isFloat32Array(float32View);
        expect(kept).assertTrue();
        expect(float32View.$_get(0)).assertEqual(3.5);
        expect(float32View.$_get(1)).assertEqual(-2.25);
      }

      // --- [5] Verify a slice copy owns a separate buffer, so a write into the copy leaves the source element at 2.5 ---
      {
        let float32Probe: util.types = new util.types();
        let src: Float32Array = new Float32Array([1.5, 2.5, 3.5]);
        let part: Float32Array = src.slice(1, 3);
        part.$_set(0, 9.5);
        expect(float32Probe.isFloat32Array(src)).assertTrue();
        expect(float32Probe.isFloat32Array(part)).assertTrue();
        expect(src.$_get(1)).assertEqual(2.5);
        expect(part.$_get(0)).assertEqual(9.5);
        expect(part.buffer === src.buffer).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2500
     * @tc.name testTypesIsFloat32Array025
     * @tc.desc Merged batch (3 tests): State preservation and aliasing: overwriting every element with NaN and infinity leaves the verdict unchanged, since it follows the object; no candidate in a mixed Object list is reported true, so the counter stays at zero; rewriting shared bytes to the minus one pattern keeps the verdict and reduce folds the elements while the source keeps its verdict.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting every element with NaN and infinity leaves the verdict unchanged, since it follows the object ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([1.5, 2.5]);
        let before: boolean = float32Probe.isFloat32Array(float32View);
        float32View.$_set(0, Double.NaN);
        float32View.$_set(1, Double.POSITIVE_INFINITY);
        let after: boolean = float32Probe.isFloat32Array(float32View);
        expect(before).assertTrue();
        expect(after).assertTrue();
        expect(before).assertEqual(after);
        expect(isNaN(float32View.$_get(0))).assertTrue();
        expect(float32View.$_get(1)).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [2] Verify no candidate in a mixed Object list is reported true, so the counter stays at zero ---
      {
        let float32Probe: util.types = new util.types();
        let candidates: Array<Object> = [
          new Date(0), new Map<string, int>(), Double.NaN as Object, (-1) as Object,
          'txt', new Uint8Array(2)
        ];
        let hits: int = 0;
        for (const item of candidates) {
          if (float32Probe.isFloat32Array(item)) {
            hits++;
          }
        }
        expect(hits).assertEqual(0);
        expect(float32Probe.isFloat32Array(candidates)).assertFalse();
      }

      // --- [3] Verify rewriting shared bytes to the minus one pattern keeps the verdict and reduce folds the elements while the source keeps its verdict ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let float32View: Float32Array = new Float32Array(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let before: boolean = float32Probe.isFloat32Array(float32View);
        uint8View.$_set(0, 0);
        uint8View.$_set(1, 0);
        uint8View.$_set(2, 128);
        uint8View.$_set(3, 191);
        let after: boolean = float32Probe.isFloat32Array(float32View);
        expect(before).assertTrue();
        expect(after).assertTrue();
        expect(before).assertEqual(after);
        expect(float32View.$_get(0)).assertEqual(-1.0);
        let float32Probe_2: util.types = new util.types();
        let values: Float32Array = new Float32Array([1.5, 2.5, 4]);
        let total: double = values.reduce((acc: double, cur: double) => acc + cur);
        expect(total).assertEqual(8);
        expect(float32Probe_2.isFloat32Array(values)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2600
     * @tc.name testTypesIsFloat32Array026
     * @tc.desc Merged batch (5 tests): Container and field storage: Number.MAX_SAFE_INTEGER rounded into float32 grows by one unit and matches an array holding the even power of two; the double 0.1 stored as float32 lands between 0.1 and 0.100001; negative, zero and positive elements read back with their own signs; isFloat32Array returns true when the Float32Array is held in an Object typed variable; a Float32Array stored as a Map value and as a Set element is still reported true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Number.MAX_SAFE_INTEGER rounded into float32 grows by one unit and matches an array holding the even power of two ---
      {
        let float32Probe: util.types = new util.types();
        let safe: double = Number.MAX_SAFE_INTEGER;
        let rounded: Float32Array = new Float32Array([safe]);
        let even: Float32Array = new Float32Array([9007199254740992.0]);
        expect(float32Probe.isFloat32Array(rounded)).assertTrue();
        expect(float32Probe.isFloat32Array(even)).assertTrue();
        expect(rounded.$_get(0)).assertLarger(safe);
        expect(rounded.$_get(0)).assertEqual(even.$_get(0));
      }

      // --- [2] Verify the double 0.1 stored as float32 lands between 0.1 and 0.100001 ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([0.1]);
        let got: double = float32View.$_get(0);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(got).assertLarger(0.1);
        expect(got).assertLess(0.100001);
      }

      // --- [3] Verify negative, zero and positive elements read back with their own signs ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([-2.5, 0, 2.5]);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(-2.5);
        expect(float32View.$_get(1)).assertEqual(0);
        expect(float32View.$_get(2)).assertEqual(2.5);
      }

      // --- [4] Verify isFloat32Array returns true when the Float32Array is held in an Object typed variable ---
      {
        let float32Checker: util.types = new util.types();
        let holder: Object = new Float32Array(3);
        expect(float32Checker.isFloat32Array(holder)).assertTrue();
      }

      // --- [5] Verify a Float32Array stored as a Map value and as a Set element is still reported true ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        let m: Map<string, Float32Array> = new Map<string, Float32Array>();
        m.set('a', float32View);
        let s: Set<Float32Array> = new Set<Float32Array>();
        s.add(float32View);
        let got: Float32Array | undefined = m.get('a');
        expect(got instanceof Float32Array).assertTrue();
        expect(s.has(float32View)).assertTrue();
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2700
     * @tc.name testTypesIsFloat32Array027
     * @tc.desc Merged batch (1 test): Container and field storage: the Float32Array of factory builds a two element array whose Double.NaN argument reads back as NaN.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the Float32Array of factory builds a two element array whose Double.NaN argument reads back as NaN ---
      {
        let float32Probe: util.types = new util.types();
        let made: Float32Array = Float32Array.of(Double.NaN, 1.5);
        expect(made.length).assertEqual(2);
        expect(float32Probe.isFloat32Array(made)).assertTrue();
        expect(isNaN(made.$_get(0))).assertTrue();
        expect(made.$_get(1)).assertEqual(1.5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2800
     * @tc.name testTypesIsFloat32Array028
     * @tc.desc Merged batch (5 tests): API call consistency: the boolean values true and false and a double array and a string array are both reported false; an array built inline as the argument is true; an empty string and a single character string are both reported false; an element read back out of a float array is a plain double and therefore rejected; a class instance and an interface literal are both reported false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the boolean values true and false and a double array and a string array are both reported false ---
      {
        let float32Checker: util.types = new util.types();
        expect(float32Checker.isFloat32Array(true)).assertFalse();
        expect(float32Checker.isFloat32Array(false)).assertFalse();
        let float32Checker_2: util.types = new util.types();
        let doubles: double[] = [1.5, 2.5];
        let words: string[] = ['a', 'b'];
        expect(float32Checker_2.isFloat32Array(doubles)).assertFalse();
        expect(float32Checker_2.isFloat32Array(words)).assertFalse();
      }

      // --- [2] Verify an array built inline as the argument is true while the buffer derived by an inline expression from another array is false ---
      {
        let float32Checker: util.types = new util.types();
        let inline: boolean = float32Checker.isFloat32Array(makeFloat32(3));
        let derived: boolean = float32Checker.isFloat32Array(new Float32Array(0).buffer);
        expect(inline).assertTrue();
        expect(derived).assertFalse();
      }

      // --- [3] Verify an empty string and a single character string are both reported false ---
      {
        let float32Checker: util.types = new util.types();
        expect(float32Checker.isFloat32Array('')).assertFalse();
        expect(float32Checker.isFloat32Array('a')).assertFalse();
      }

      // --- [4] Verify an element read back out of a float array is a plain double and therefore rejected while the array itself is true ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([2.5]);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(2.5);
        expect(float32Probe.isFloat32Array(float32View.$_get(0))).assertFalse();
      }

      // --- [5] Verify a class instance and an interface literal are both reported false ---
      {
        let float32Checker: util.types = new util.types();
        let holder: TagHolder = new TagHolder();
        let pair: PairBox = { left: 1, right: 2 };
        expect(float32Checker.isFloat32Array(holder)).assertFalse();
        expect(float32Checker.isFloat32Array(pair)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_2900
     * @tc.name testTypesIsFloat32Array029
     * @tc.desc Merged batch (5 tests): API call consistency: a Map key iterator and a Set value iterator are both reported false; a Float32Array over a shared buffer is true; a second alias of the buffer is false while the Float32Array wrapping it is true; a Float32Array reached through a quoted Record key is true while the record holding it is false; an envelope object holding a Float32Array field is false while that field is true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Map key iterator and a Set value iterator are both reported false ---
      {
        let float32Checker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        let keys: IterableIterator<string> = m.keys();
        let s: Set<int> = new Set<int>();
        let values: IterableIterator<int> = s.values();
        expect(float32Checker.isFloat32Array(keys)).assertFalse();
        expect(float32Checker.isFloat32Array(values)).assertFalse();
      }

      // --- [2] Verify a Float32Array over a shared buffer is true while Float64Array and Uint8Array over the same buffers are false ---
      {
        let float32Checker: util.types = new util.types();
        let bufferForFloat64: ArrayBuffer = new ArrayBuffer(16);
        let float32ViewForFloat64: Float32Array = new Float32Array(bufferForFloat64);
        let float64View: Float64Array = new Float64Array(bufferForFloat64);
        expect(float32Checker.isFloat32Array(float32ViewForFloat64)).assertTrue();
        expect(float32Checker.isFloat32Array(float64View)).assertFalse();
        let bufferForUint8: ArrayBuffer = new ArrayBuffer(8);
        let float32ViewForUint8: Float32Array = new Float32Array(bufferForUint8);
        let uint8View: Uint8Array = new Uint8Array(bufferForUint8);
        expect(float32Checker.isFloat32Array(float32ViewForUint8)).assertTrue();
        expect(float32Checker.isFloat32Array(uint8View)).assertFalse();
      }

      // --- [3] Verify a second alias of the buffer is false while the Float32Array wrapping it is true ---
      {
        let float32Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(12);
        let alias: ArrayBuffer = ab;
        let float32View: Float32Array = new Float32Array(alias);
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.buffer).assertEqual(ab);
        expect(float32Probe.isFloat32Array(alias)).assertFalse();
      }

      // --- [4] Verify a Float32Array reached through a quoted Record key is true while the record holding it is false ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([1.5]);
        let rec: Record<string, Float32Array> = { 'slot': float32View };
        let picked: Float32Array = rec['slot']!;
        expect(float32Probe.isFloat32Array(picked)).assertTrue();
        expect(picked.$_get(0)).assertEqual(1.5);
        expect(float32Probe.isFloat32Array(rec)).assertFalse();
      }

      // --- [5] Verify an envelope object holding a Float32Array field is false while that field is true ---
      {
        let float32Checker: util.types = new util.types();
        let box: FloatEnvelope = { data: new Float32Array(2) };
        expect(float32Checker.isFloat32Array(box)).assertFalse();
        expect(float32Checker.isFloat32Array(box.data)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_3000
     * @tc.name testTypesIsFloat32Array030
     * @tc.desc Merged batch (5 tests): API call consistency: both elements of a two slot float array list are true while the list itself is false; a float array read back from a WeakMap value and one held in a class owned Set are true; repeated calls on the same Float32Array agree with each other; two independent util.types instances agree when judging one Float32Array; the of factory and the literal constructor produce equal elements on separate buffers, both reported true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify both elements of a two slot float array list are true while the list itself is false ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        let list: Float32Array[] = [float32View, new Float32Array(1)];
        expect(float32Probe.isFloat32Array(list)).assertFalse();
        expect(float32Probe.isFloat32Array(list[0])).assertTrue();
        expect(float32Probe.isFloat32Array(list[1])).assertTrue();
      }

      // --- [2] Verify a float array read back from a WeakMap value and one held in a class owned Set are true while the containers are false ---
      {
        let float32Probe: util.types = new util.types();
        let holder: TagHolder = new TagHolder();
        let float32View: Float32Array = new Float32Array([8.5]);
        let wm: WeakMap<TagHolder, Float32Array> = new WeakMap<TagHolder, Float32Array>();
        wm.set(holder, float32View);
        let got: Float32Array = wm.get(holder)!;
        expect(got.$_get(0)).assertEqual(8.5);
        expect(float32Probe.isFloat32Array(got)).assertTrue();
        expect(float32Probe.isFloat32Array(wm)).assertFalse();
        let float32Probe_2: util.types = new util.types();
        let store: SlotStore = new SlotStore();
        let float32View_2: Float32Array = new Float32Array([2.5]);
        store.slots.add(float32View_2);
        let found: Float32Array | undefined = undefined;
        for (const item of store.slots) {
          found = item;
        }
        expect(found instanceof Float32Array).assertTrue();
        expect(store.slots.size).assertEqual(1);
        expect(float32Probe_2.isFloat32Array(store)).assertFalse();
        expect(float32Probe_2.isFloat32Array(store.slots)).assertFalse();
        expect(float32Probe_2.isFloat32Array(float32View_2)).assertTrue();
      }

      // --- [3] Verify repeated calls on the same Float32Array agree with each other ---
      {
        let float32Checker: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(3);
        let first: boolean = float32Checker.isFloat32Array(float32View);
        let second: boolean = float32Checker.isFloat32Array(float32View);
        expect(first).assertEqual(second);
        expect(first).assertTrue();
      }

      // --- [4] Verify two independent util.types instances agree when judging one Float32Array ---
      {
        let float32CheckerA: util.types = new util.types();
        let float32CheckerB: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        expect(float32CheckerB.isFloat32Array(new Int32Array(2))).assertFalse();
        let r1: boolean = float32CheckerA.isFloat32Array(float32View);
        let r2: boolean = float32CheckerB.isFloat32Array(float32View);
        expect(r1).assertTrue();
        expect(r2).assertEqual(r1);
      }

      // --- [5] Verify the of factory and the literal constructor produce equal elements on separate buffers, both reported true ---
      {
        let float32Probe: util.types = new util.types();
        let made: Float32Array = Float32Array.of(2.5);
        let built: Float32Array = new Float32Array([2.5]);
        expect(float32Probe.isFloat32Array(made)).assertTrue();
        expect(float32Probe.isFloat32Array(built)).assertTrue();
        expect(made.$_get(0)).assertEqual(built.$_get(0));
        expect(made.buffer === built.buffer).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_3100
     * @tc.name testTypesIsFloat32Array031
     * @tc.desc Merged batch (5 tests): API call consistency: accepts plain int and Int8 arrays holding the same values are rejected; each float array kind is accepted only by its own checker, with Float32 and Float64 mutually exclusive; interleaved calls still report a Map and a Date and exactly one of the four array predicates accepts the float array; negating a true Float32Array result is false and negating a plain array is true; a disjunction over one float array and one Map is true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify plain int and Int8 arrays holding the same values are rejected while their Float32Array counterpart is accepted ---
      {
        let float32Checker: util.types = new util.types();
        let plain: int[] = [1, 2, 3];
        let typed: Float32Array = new Float32Array([1, 2, 3]);
        expect(float32Checker.isFloat32Array(plain)).assertFalse();
        expect(float32Checker.isFloat32Array(typed)).assertTrue();
        let float32Checker_2: util.types = new util.types();
        let int8View: Int8Array = new Int8Array([-128, 127]);
        let float32View: Float32Array = new Float32Array([-128, 127]);
        let int8Verdict: boolean = float32Checker_2.isFloat32Array(int8View);
        let float32Verdict: boolean = float32Checker_2.isFloat32Array(float32View);
        expect(int8Verdict).assertFalse();
        expect(float32Verdict).assertTrue();
      }

      // --- [2] Verify each float array kind is accepted only by its own checker, with Float32 and Float64 mutually exclusive ---
      {
        let floatProbe: util.types = new util.types();
        expect(floatProbe.isFloat32Array(new Float32Array(1))).assertTrue();
        expect(floatProbe.isFloat32Array(new Float64Array(1))).assertFalse();
        expect(floatProbe.isFloat64Array(new Float64Array(1))).assertTrue();
        expect(floatProbe.isFloat64Array(new Float32Array(1))).assertFalse();
      }

      // --- [3] Verify interleaved calls still report a Map and a Date and exactly one of the four array predicates accepts the float array ---
      {
        let float32Checker: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let d: Date = new Date();
        let onFloat: boolean = float32Checker.isFloat32Array(float32View);
        let onMap: boolean = float32Checker.isMap(m);
        let onDate: boolean = float32Checker.isDate(d);
        let again: boolean = float32Checker.isFloat32Array(float32View);
        expect(onFloat).assertTrue();
        expect(again).assertTrue();
        expect(onMap).assertTrue();
        expect(onDate).assertTrue();
        let float32Probe: util.types = new util.types();
        let float32View_2: Float32Array = new Float32Array(1);
        let hits: int = 0;
        if (float32Probe.isFloat32Array(float32View_2)) {
          hits++;
        }
        if (float32Probe.isFloat64Array(float32View_2)) {
          hits++;
        }
        if (float32Probe.isInt32Array(float32View_2)) {
          hits++;
        }
        if (float32Probe.isArrayBuffer(float32View_2)) {
          hits++;
        }
        expect(hits).assertEqual(1);
      }

      // --- [4] Verify negating a true Float32Array result is false and negating a plain array is true ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(1);
        let plain: int[] = [1];
        expect(!float32Probe.isFloat32Array(float32View)).assertFalse();
        expect(!float32Probe.isFloat32Array(plain)).assertTrue();
      }

      // --- [5] Verify a disjunction over one float array and one Map is true while the conjunction of the same two calls is false ---
      {
        let float32Checker: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(1);
        let m: Map<string, int> = new Map<string, int>();
        let either: boolean = float32Checker.isFloat32Array(float32View) || float32Checker.isFloat32Array(m);
        let both: boolean = float32Checker.isFloat32Array(float32View) && float32Checker.isFloat32Array(m);
        expect(either).assertTrue();
        expect(both).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_FLOAT32_ARRAY_3200
     * @tc.name testTypesIsFloat32Array032
     * @tc.desc Merged batch (4 tests): Program integration: verifies verdicts in program flow, covering chained calls, helper returned arrays, independent detectors and branch selection.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsFloat32Array032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three chained calls on one instance are all true and a ternary labels the float array as float and an Int32Array as other ---
      {
        let float32Checker: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(2);
        let allTrue: boolean = float32Checker.isFloat32Array(float32View) && float32Checker.isFloat32Array(float32View) && float32Checker.isFloat32Array(float32View);
        expect(allTrue).assertTrue();
        let float32Probe: util.types = new util.types();
        let float32View_2: Float32Array = new Float32Array(2);
        let int32View: Int32Array = new Int32Array(2);
        let onFloat: string = float32Probe.isFloat32Array(float32View_2) ? 'float' : 'other';
        let onInt: string = float32Probe.isFloat32Array(int32View) ? 'float' : 'other';
        expect(onFloat).assertEqual('float');
        expect(onInt).assertEqual('other');
      }

      // --- [2] Verify the array handed back by a helper is still true and shares its buffer and writes with the argument ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(3);
        let back: Float32Array = identity32(float32View);
        back.$_set(0, 6.25);
        expect(float32Probe.isFloat32Array(back)).assertTrue();
        expect(float32Probe.isFloat32Array(float32View)).assertTrue();
        expect(float32View.$_get(0)).assertEqual(6.25);
        expect(float32View.buffer).assertEqual(back.buffer);
      }

      // --- [3] Verify a helper that owns its own detector instance reaches the same verdict as the detector in the case body ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(3);
        let inside: boolean = holdsFloat32(float32View);
        let outside: boolean = float32Probe.isFloat32Array(float32View);
        expect(inside).assertTrue();
        expect(outside).assertTrue();
        expect(inside).assertEqual(outside);
        expect(holdsFloat32(new Int32Array(3))).assertFalse();
      }

      // --- [4] Verify the predicate drives an if branch, which marks the typed array and skips a Map ---
      {
        let float32Probe: util.types = new util.types();
        let float32View: Float32Array = new Float32Array(1);
        let m: Map<string, int> = new Map<string, int>();
        let hit: string = 'none';
        if (float32Probe.isFloat32Array(float32View)) {
          hit = 'typed';
        }
        if (float32Probe.isFloat32Array(m)) {
          hit = 'bad';
        }
        expect(hit).assertEqual('typed');
      }
    });

  });
}
