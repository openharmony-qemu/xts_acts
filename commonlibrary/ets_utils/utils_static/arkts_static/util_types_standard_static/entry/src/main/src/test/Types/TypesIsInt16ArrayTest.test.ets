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

class Temperature {
  degree: int = 0;

  constructor(degree: int) {
    this.degree = degree;
  }
}

class StructuralFakeInt16 {
  buffer: ArrayBuffer = new ArrayBuffer(2);
  byteOffset: int = 0;
  byteLength: int = 2;
  length: int = 2;
}

class LengthBag {
  length: int = 0;

  constructor(length: int) {
    this.length = length;
  }
}

class BufferShapeBag {
  buffer: ArrayBuffer = new ArrayBuffer(2);
  length: int = 0;

  constructor(length: int) {
    this.length = length;
  }
}

class AsyncProbe {
  async asyncMethod(): Promise<void> {
  }

  plainMethod(): void {
  }
}

function probeThroughDetector(detector: util.types): boolean {
  return detector.isInt16Array(new Int16Array(4));
}

interface Int16Slot {
  payload: Int16Array;
}

class Int16Holder {
  value: Int16Array;

  constructor(value: Int16Array) {
    this.value = value;
  }
}

class Int16Inspector {
  detector: util.types;

  constructor(detector: util.types) {
    this.detector = detector;
  }

  check(value: Object): boolean {
    return this.detector.isInt16Array(value);
  }
}

function buildInt16View(capacity: int): Int16Array {
  return new Int16Array(capacity);
}

function passThroughObject(value: Object): Object {
  return value;
}

function detectWithParam(detector: util.types, value: Object): boolean {
  return detector.isInt16Array(value);
}

function firstInt16Index(values: Object[], detector: util.types): int {
  for (let index: int = 0; index < values.length; index++) {
    if (detector.isInt16Array(values[index])) {
      return index;
    }
  }
  return -1;
}

export default function typesIsInt16ArrayTest(): void {
  describe('TypesIsInt16ArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0100
     * @tc.name testTypesIsInt16Array001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts every Int16Array built from the numeric lengths 0, 1, 3, 5, 100 and 256; accepts an Int16Array built from an Int8Array source; accepts Arrays holding the boundaries -32768, 0 and 32767 and the wrapped values from -32769 and -65536; isInt16Array accepts a copy built from an Int16Array and one built from a Uint8Array source; accepts Int16Array copies built from Uint8ClampedArray, Uint32Array, Float64Array and Float32Array sources.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array returns true for every Int16Array built from the numeric lengths 0, 1, 3, 5, 100 and 256 ---
      {
        let detector: util.types = new util.types();
        let sizes: int[] = [0, 1, 3, 5, 100, 256];
        let accepted: int = 0;
        for (const size of sizes) {
          if (detector.isInt16Array(new Int16Array(size))) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(6);
      }

      // --- [2] Verify isInt16Array returns true for an Int16Array built from an Int8Array source ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(new Int8Array(new ArrayBuffer(2)));
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.length).assertEqual(2);
      }

      // --- [3] Verify Arrays holding the boundaries -32768, 0 and 32767 and the wrapped values from -32769 and -65536 are accepted ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array([-32768, 0, 32767]);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.$_get(0)).assertEqual(-32768);
        expect(int16View.$_get(2)).assertEqual(32767);
        let detector_2: util.types = new util.types();
        let int16View_2: Int16Array = new Int16Array([-32769, -65536]);
        expect(detector_2.isInt16Array(int16View_2)).assertTrue();
        expect(int16View_2.$_get(0)).assertEqual(32767);
        expect(int16View_2.$_get(1)).assertEqual(0);
      }

      // --- [4] Verify isInt16Array accepts a copy built from an Int16Array and one built from a Uint8Array source ---
      {
        let detector: util.types = new util.types();
        let source: Int16Array = new Int16Array(new ArrayBuffer(4));
        source.$_set(0, 1234);
        let copy: Int16Array = new Int16Array(source);
        let byteSource: Uint8Array = new Uint8Array(new ArrayBuffer(2));
        byteSource.$_set(1, 7);
        let copyFromBytes: Int16Array = new Int16Array(byteSource);
        expect(detector.isInt16Array(copy)).assertTrue();
        expect(copy.$_get(0)).assertEqual(1234);
        expect(detector.isInt16Array(copyFromBytes)).assertTrue();
        expect(copyFromBytes.$_get(1)).assertEqual(7);
      }

      // --- [5] Verify isInt16Array returns true for Int16Array copies built from Uint8ClampedArray, Uint32Array, Float64Array and Float32Array sources ---
      {
        let detector: util.types = new util.types();
        let sourceUint8Clamped: Uint8ClampedArray = new Uint8ClampedArray(new ArrayBuffer(3));
        let int16FromUint8Clamped: Int16Array = new Int16Array(sourceUint8Clamped);
        expect(detector.isInt16Array(int16FromUint8Clamped)).assertTrue();
        expect(int16FromUint8Clamped.length).assertEqual(3);
        let sourceUint32: Uint32Array = new Uint32Array(new ArrayBuffer(8));
        let int16FromUint32: Int16Array = new Int16Array(sourceUint32);
        expect(detector.isInt16Array(int16FromUint32)).assertTrue();
        expect(int16FromUint32.length).assertEqual(2);
        let sourceFloat64: Float64Array = new Float64Array(new ArrayBuffer(16));
        let int16FromFloat64: Int16Array = new Int16Array(sourceFloat64);
        expect(detector.isInt16Array(int16FromFloat64)).assertTrue();
        expect(int16FromFloat64.length).assertEqual(2);
        let sourceFloat32: Float32Array = new Float32Array(new ArrayBuffer(12));
        let int16FromFloat32: Int16Array = new Int16Array(sourceFloat32);
        expect(detector.isInt16Array(int16FromFloat32)).assertTrue();
        expect(int16FromFloat32.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0200
     * @tc.name testTypesIsInt16Array002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: a 1000 element Int16Array is detected as true with byteLength 2000; accepts the Int16Array created by the static factory of(1, 2) and from([1, 2, 3]); accepts an Int16Array held through an Object typed reference; accepts an Int16Array factory result held through an Object typed reference; a length of 3 times 7 gives 21 elements and byteLength 42.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a 1000 element Int16Array is detected as true with byteLength 2000 ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = buildInt16View(1000);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.length).assertEqual(1000);
        expect(int16View.byteLength).assertEqual(2000);
      }

      // --- [2] Verify isInt16Array returns true for the Int16Array created by the static factory of(1, 2) and from([1, 2, 3]) ---
      {
        let detector: util.types = new util.types();
        let built: Int16Array = Int16Array.of(1, 2);
        expect(detector.isInt16Array(built)).assertTrue();
        expect(built.length).assertEqual(2);
        let detector_2: util.types = new util.types();
        let built_2: Int16Array = Int16Array.from([1, 2, 3]);
        expect(detector_2.isInt16Array(built_2)).assertTrue();
        expect(built_2.length).assertEqual(3);
        expect(built_2.$_get(2)).assertEqual(3);
      }

      // --- [3] Verify isInt16Array returns true for an Int16Array held through an Object typed reference ---
      {
        let detector: util.types = new util.types();
        let holder: Object = new Int16Array(2);
        let result: boolean = detector.isInt16Array(holder);
        expect(result).assertTrue();
      }

      // --- [4] Verify isInt16Array returns true for an Int16Array factory result held through an Object typed reference ---
      {
        let detector: util.types = new util.types();
        let holder: Object = Int16Array.from([9]);
        expect(detector.isInt16Array(holder)).assertTrue();
        expect(detector.isInt16Array(new Uint16Array(1))).assertFalse();
      }

      // --- [5] Verify a length of 3 times 7 gives 21 elements and byteLength 42 while a five element array reports byteLength 10 through its buffer ---
      {
        let detector: util.types = new util.types();
        let cells: int = 3 * 7;
        let int16View: Int16Array = new Int16Array(cells);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.length).assertEqual(21);
        expect(int16View.byteLength).assertEqual(42);
        let detector_2: util.types = new util.types();
        let int16View_2: Int16Array = new Int16Array(2 + 3);
        expect(detector_2.isInt16Array(int16View_2)).assertTrue();
        expect(int16View_2.buffer.byteLength).assertEqual(10);
        expect(int16View_2.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0300
     * @tc.name testTypesIsInt16Array003
     * @tc.desc Merged batch (3 tests): Basic construction and recognition: the bytes 0x00 and 0x80 written through a Uint8Array are reinterpreted as the element -32768; two passes over the same five mixed inputs yield three Int16Array verdicts each; accepts the copy produced by slice(1) on a four element Int16Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the bytes 0x00 and 0x80 written through a Uint8Array are reinterpreted as the element -32768 ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(2);
        let bytes: Uint8Array = new Uint8Array(buffer);
        let int16View: Int16Array = new Int16Array(buffer);
        bytes.$_set(0, 0);
        bytes.$_set(1, 0x80);
        expect(int16View.$_get(0)).assertEqual(-32768);
        expect(detector.isInt16Array(int16View)).assertTrue();
      }

      // --- [2] Verify two passes over the same five mixed inputs yield three Int16Array verdicts each ---
      {
        let detector: util.types = new util.types();
        let probes: Object[] =
          [new Int16Array(1), new Uint8Array(1), new Int16Array(2), new ArrayBuffer(2), new Int16Array(3)];
        let firstPass: int = 0;
        let secondPass: int = 0;
        for (const probe of probes) {
          if (detector.isInt16Array(probe)) {
            firstPass = firstPass + 1;
          }
        }
        for (const probe of probes) {
          if (detector.isInt16Array(probe)) {
            secondPass = secondPass + 1;
          }
        }
        expect(firstPass).assertEqual(3);
        expect(secondPass).assertEqual(firstPass);
      }

      // --- [3] Verify isInt16Array returns true for the copy produced by slice(1) on a four element Int16Array ---
      {
        let detector: util.types = new util.types();
        let copy: Int16Array = new Int16Array(4).slice(1);
        expect(detector.isInt16Array(copy)).assertTrue();
        expect(copy.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0400
     * @tc.name testTypesIsInt16Array004
     * @tc.desc Merged batch (5 tests): Boundary values: a single element Int16Array is detected as true and reports byteLength 2; the static factory from over a Uint16Array holding 65535 produces one element minus one and the result is detected as true; an array built from an empty buffer and a zero length array are accepted, the latter reporting both lengths as 0; the detection result is equal for a zero length and a four element Int16Array; an Int16Array built from a two byte ArrayBuffer holds exactly one element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a single element Int16Array is detected as true and reports byteLength 2 ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(1);
        let result: boolean = detector.isInt16Array(int16View);
        expect(result).assertTrue();
        expect(int16View.byteLength).assertEqual(2);
      }

      // --- [2] Verify the static factory from over a Uint16Array holding 65535 produces one element minus one and the result is detected as true ---
      {
        let detector: util.types = new util.types();
        let source: Uint16Array = new Uint16Array(new ArrayBuffer(2));
        source.$_set(0, 65535);
        let built: Int16Array = Int16Array.from(source);
        expect(detector.isInt16Array(built)).assertTrue();
        expect(built.length).assertEqual(1);
        expect(built.$_get(0)).assertEqual(-1);
      }

      // --- [3] Verify an array built from an empty buffer and a zero length array are accepted, the latter reporting both lengths as 0 ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(0);
        let int16View: Int16Array = new Int16Array(buffer);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.byteLength).assertEqual(0);
        expect(int16View.length).assertEqual(0);
        let detector_2: util.types = new util.types();
        let int16View_2: Int16Array = new Int16Array(0);
        let result: boolean = detector_2.isInt16Array(int16View_2);
        expect(result).assertTrue();
        expect(int16View_2.byteLength).assertEqual(0);
        expect(int16View_2.length).assertEqual(0);
      }

      // --- [4] Verify the detection result is equal for a zero length and a four element Int16Array ---
      {
        let detector: util.types = new util.types();
        let zeroLength: boolean = detector.isInt16Array(new Int16Array(0));
        let fourLength: boolean = detector.isInt16Array(new Int16Array(4));
        expect(zeroLength).assertEqual(fourLength);
        expect(fourLength).assertTrue();
      }

      // --- [5] Verify an Int16Array built from a two byte ArrayBuffer holds exactly one element ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(2);
        let int16View: Int16Array = new Int16Array(buffer);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0500
     * @tc.name testTypesIsInt16Array005
     * @tc.desc Merged batch (5 tests): Boundary values: writing 65535 into an Int16Array element truncates to -1 and stores the two bytes 0xFF and 0xFF; accepts an Int16Array view whose byte offset 4 sits at the last element of a six byte ArrayBuffer; two element and zero length Uint8Arrays and empty and eight byte ArrayBuffers are all rejected; writing 40000 truncates to -25536, the remainder after 65536, and incrementing 32767 wraps to -32768; detecting a one element subarray leaves the parent element 7, the parent byteLength 6 and the parent verdict true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify writing 65535 into an Int16Array element truncates to -1 and stores the two bytes 0xFF and 0xFF ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(2);
        let int16View: Int16Array = new Int16Array(buffer);
        let bytes: Uint8Array = new Uint8Array(buffer);
        int16View.$_set(0, 65535);
        expect(int16View.$_get(0)).assertEqual(-1);
        expect(bytes.$_get(0)).assertEqual(0xFF);
        expect(bytes.$_get(1)).assertEqual(0xFF);
        expect(detector.isInt16Array(int16View)).assertTrue();
      }

      // --- [2] Verify isInt16Array returns true for an Int16Array view whose byte offset 4 sits at the last element of a six byte ArrayBuffer ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let int16View: Int16Array = new Int16Array(buffer, 4, 1);
        let judged: boolean = detector.isInt16Array(int16View);
        expect(judged).assertTrue();
        expect(int16View.length).assertEqual(1);
        expect(int16View.byteOffset).assertEqual(4);
      }

      // --- [3] Verify two element and zero length Uint8Arrays and empty and eight byte ArrayBuffers are all rejected ---
      {
        let detector: util.types = new util.types();
        expect(detector.isInt16Array(new Uint8Array(new ArrayBuffer(2)))).assertFalse();
        expect(detector.isInt16Array(new Uint8Array(0))).assertFalse();
        let detector_2: util.types = new util.types();
        expect(detector_2.isInt16Array(new ArrayBuffer(0))).assertFalse();
        expect(detector_2.isInt16Array(new ArrayBuffer(8))).assertFalse();
      }

      // --- [4] Verify writing 40000 truncates to -25536, the remainder after 65536, and incrementing 32767 wraps to -32768 ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(1);
        int16View.$_set(0, 40000);
        expect(int16View.$_get(0)).assertEqual(-25536);
        expect(detector.isInt16Array(int16View)).assertTrue();
        let detector_2: util.types = new util.types();
        let int16View_2: Int16Array = new Int16Array(1);
        int16View_2.$_set(0, 32767);
        let incremented: double = int16View_2.$_get(0) + 1;
        int16View_2.$_set(0, incremented);
        expect(int16View_2.$_get(0)).assertEqual(-32768);
        expect(detector_2.isInt16Array(int16View_2)).assertTrue();
      }

      // --- [5] Verify detecting a one element subarray leaves the parent element 7, the parent byteLength 6 and the parent verdict true ---
      {
        let detector: util.types = new util.types();
        let base: Int16Array = new Int16Array(3);
        base.$_set(2, 7);
        let windowed: Int16Array = base.subarray(2, 3);
        expect(detector.isInt16Array(windowed)).assertTrue();
        expect(base.$_get(2)).assertEqual(7);
        expect(base.byteLength).assertEqual(6);
        expect(detector.isInt16Array(base)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0600
     * @tc.name testTypesIsInt16Array006
     * @tc.desc Merged batch (2 tests): Boundary values: windows collapsed to zero length by slice(2, 2) and subarray(5, 5) are both detected as true with length 0; a partial fill of -1 from index 1 leaves the first element zero and the two remaining at -1.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify windows collapsed to zero length by slice(2, 2) and subarray(5, 5) are both detected as true with length 0 ---
      {
        let detector: util.types = new util.types();
        let base: Int16Array = new Int16Array(5);
        let sliced: Int16Array = base.slice(2, 2);
        let windowed: Int16Array = base.subarray(5, 5);
        expect(detector.isInt16Array(sliced)).assertTrue();
        expect(detector.isInt16Array(windowed)).assertTrue();
        expect(sliced.length).assertEqual(0);
        expect(windowed.length).assertEqual(0);
      }

      // --- [2] Verify a partial fill of -1 from index 1 leaves the first element zero and the two remaining at -1 ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(3).fill(-1, 1);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.$_get(0)).assertEqual(0);
        expect(int16View.$_get(1)).assertEqual(-1);
        expect(int16View.$_get(2)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0700
     * @tc.name testTypesIsInt16Array007
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the int values 1, -1 and 0 and maximum 2147483647 and the int minimum written as -2147483647 - 1; double values 3.14 and -3.14; strings 'str', '' and '0'; boolean values true and false; find returns the matching element as a plain number that the typed array predicate rejects.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array returns false for the int values 1, -1 and 0 and maximum 2147483647 and the int minimum written as -2147483647 - 1 ---
      {
        let detector: util.types = new util.types();
        expect(detector.isInt16Array(1)).assertFalse();
        expect(detector.isInt16Array(-1)).assertFalse();
        expect(detector.isInt16Array(0)).assertFalse();
        let detector_2: util.types = new util.types();
        let intMin: int = -2147483647 - 1;
        expect(detector_2.isInt16Array(2147483647)).assertFalse();
        expect(detector_2.isInt16Array(intMin)).assertFalse();
      }

      // --- [2] Verify isInt16Array returns false for the double values 3.14 and -3.14 ---
      {
        let detector: util.types = new util.types();
        expect(detector.isInt16Array(3.14)).assertFalse();
        expect(detector.isInt16Array(-3.14)).assertFalse();
      }

      // --- [3] Verify isInt16Array returns false for the strings 'str', '' and '0' ---
      {
        let detector: util.types = new util.types();
        expect(detector.isInt16Array('str')).assertFalse();
        expect(detector.isInt16Array('')).assertFalse();
        expect(detector.isInt16Array('0')).assertFalse();
      }

      // --- [4] Verify isInt16Array returns false for the boolean values true and false ---
      {
        let detector: util.types = new util.types();
        expect(detector.isInt16Array(true)).assertFalse();
        expect(detector.isInt16Array(false)).assertFalse();
      }

      // --- [5] Verify find returns the matching element as a plain number that the typed array predicate rejects ---
      {
        let detector: util.types = new util.types();
        let source: Int16Array = new Int16Array([7, -8, 9]);
        let found: double | undefined = source.find((v: double, i: int, a: Int16Array) => v < 0);
        let held: double = 0;
        if (found !== undefined) {
          held = found;
        }
        expect(held).assertEqual(-8);
        expect(detector.isInt16Array(held)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0800
     * @tc.name testTypesIsInt16Array008
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects Float64Array, BigInt64Array and BigUint64Array inputs; rejects an empty int array and for the int array [1, 2, 3]; rejects a string array and a boolean array and two dimensional int array; the false verdict on the int array [1, 2, 3, 4] leaves its length at 4; a plain int array is false for isInt16Array, isTypedArray and isArrayBufferView.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array returns false for Float64Array, BigInt64Array and BigUint64Array inputs ---
      {
        let detector: util.types = new util.types();
        let foreign: Object[] = [new Float64Array(new ArrayBuffer(16)), new BigInt64Array(new ArrayBuffer(16)), new BigUint64Array(new ArrayBuffer(16))];
        let hits: int = 0;
        for (let candidate of foreign) {
          if (!detector.isInt16Array(candidate)) {
            hits += 1;
          }
        }
        expect(hits).assertEqual(3);
      }

      // --- [2] Verify isInt16Array returns false for an empty int array and for the int array [1, 2, 3] ---
      {
        let detector: util.types = new util.types();
        let empty: int[] = [];
        let filled: int[] = [1, 2, 3];
        expect(detector.isInt16Array(empty)).assertFalse();
        expect(detector.isInt16Array(filled)).assertFalse();
      }

      // --- [3] Verify isInt16Array returns false for a string array and a boolean array and two dimensional int array ---
      {
        let detector: util.types = new util.types();
        let names: string[] = ['a', 'b'];
        let flags: boolean[] = [true, false];
        expect(detector.isInt16Array(names)).assertFalse();
        expect(detector.isInt16Array(flags)).assertFalse();
        let detector_2: util.types = new util.types();
        let grid: int[][] = [[1], [2]];
        expect(detector_2.isInt16Array(grid)).assertFalse();
      }

      // --- [4] Verify the false verdict on the int array [1, 2, 3, 4] leaves its length at 4 ---
      {
        let detector: util.types = new util.types();
        let values: int[] = [1, 2, 3, 4];
        let result: boolean = detector.isInt16Array(values);
        expect(result).assertFalse();
        expect(values.length).assertEqual(4);
      }

      // --- [5] Verify a plain int array is false for isInt16Array, isTypedArray and isArrayBufferView while a Date is false for isInt16Array ---
      {
        let detector: util.types = new util.types();
        let values: int[] = [1, 2, 3];
        expect(detector.isInt16Array(values)).assertFalse();
        expect(detector.isTypedArray(values)).assertFalse();
        expect(detector.isArrayBufferView(values)).assertFalse();
        expect(detector.isInt16Array(new Date(0))).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_0900
     * @tc.name testTypesIsInt16Array009
     * @tc.desc Merged batch (2 tests): Primitive value rejection: results stored in a boolean array keep their true and false order; rejects a plain int array held through an Object typed reference.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify results stored in a boolean array keep their true and false order ---
      {
        let detector: util.types = new util.types();
        let results: boolean[] = [];
        results.push(detector.isInt16Array(new Int16Array(1)));
        results.push(detector.isInt16Array(new Int8Array(new ArrayBuffer(1))));
        expect(results[0]).assertTrue();
        expect(results[1]).assertFalse();
      }

      // --- [2] Verify isInt16Array returns false for a plain int array held through an Object typed reference ---
      {
        let detector: util.types = new util.types();
        let holder: Object = [1, 2, 3];
        let result: boolean = detector.isInt16Array(holder);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1000
     * @tc.name testTypesIsInt16Array010
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects Int8Array and Int32Array inputs; rejects the ArrayBuffer exposed by an Int16Array buffer property; rejects an array holding class instances and instance of a plain custom class; rejects an object that only carries a length property; rejects an object carrying buffer, byteOffset, byteLength and length and a buffer property and a length property.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array returns false for Int8Array and Int32Array inputs ---
      {
        let detector: util.types = new util.types();
        expect(detector.isInt16Array(new Int8Array(new ArrayBuffer(2)))).assertFalse();
        expect(detector.isInt16Array(new Int32Array(new ArrayBuffer(8)))).assertFalse();
      }

      // --- [2] Verify isInt16Array returns false for the ArrayBuffer exposed by an Int16Array buffer property ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(new ArrayBuffer(4));
        let backing: ArrayBuffer = int16View.buffer;
        expect(detector.isInt16Array(backing)).assertFalse();
      }

      // --- [3] Verify isInt16Array returns false for an array holding class instances and instance of a plain custom class ---
      {
        let detector: util.types = new util.types();
        let temperatures: Temperature[] = [new Temperature(1), new Temperature(2)];
        expect(detector.isInt16Array(temperatures)).assertFalse();
        expect(temperatures.length).assertEqual(2);
        let detector_2: util.types = new util.types();
        let sample: Temperature = new Temperature(25);
        expect(detector_2.isInt16Array(sample)).assertFalse();
        expect(sample.degree).assertEqual(25);
      }

      // --- [4] Verify isInt16Array returns false for an object that only carries a length property ---
      {
        let detector: util.types = new util.types();
        let bag: LengthBag = new LengthBag(4);
        expect(detector.isInt16Array(bag)).assertFalse();
        expect(bag.length).assertEqual(4);
      }

      // --- [5] Verify isInt16Array returns false for an object carrying buffer, byteOffset, byteLength and length and a buffer property and a length property ---
      {
        let detector: util.types = new util.types();
        let fake: StructuralFakeInt16 = new StructuralFakeInt16();
        expect(detector.isInt16Array(fake)).assertFalse();
        expect(fake.byteLength).assertEqual(2);
        let detector_2: util.types = new util.types();
        let shape: BufferShapeBag = new BufferShapeBag(2);
        expect(detector_2.isInt16Array(shape)).assertFalse();
        expect(detector_2.isInt16Array(shape.buffer)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1100
     * @tc.name testTypesIsInt16Array011
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects Date, RegExp and Error instances; rejects Map and Set instances; rejects WeakMap and WeakSet instances; rejects a resolved Promise; rejects the iterator objects produced by Map keys() and values().
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array returns false for Date, RegExp and Error instances ---
      {
        let detector: util.types = new util.types();
        expect(detector.isInt16Array(new Date())).assertFalse();
        expect(detector.isInt16Array(new RegExp('a'))).assertFalse();
        expect(detector.isInt16Array(new Error('probe'))).assertFalse();
      }

      // --- [2] Verify isInt16Array returns false for Map and Set instances ---
      {
        let detector: util.types = new util.types();
        let store: Map<string, int> = new Map<string, int>();
        store.set('k', 1);
        let bucket: Set<int> = new Set<int>();
        bucket.add(1);
        expect(detector.isInt16Array(store)).assertFalse();
        expect(detector.isInt16Array(bucket)).assertFalse();
      }

      // --- [3] Verify isInt16Array returns false for WeakMap and WeakSet instances ---
      {
        let detector: util.types = new util.types();
        let key: Temperature = new Temperature(3);
        let weakStore: WeakMap<Temperature, int> = new WeakMap<Temperature, int>();
        weakStore.set(key, 1);
        let weakBucket: WeakSet<Temperature> = new WeakSet<Temperature>();
        weakBucket.add(key);
        expect(detector.isInt16Array(weakStore)).assertFalse();
        expect(detector.isInt16Array(weakBucket)).assertFalse();
      }

      // --- [4] Verify isInt16Array returns false for a resolved Promise ---
      {
        let detector: util.types = new util.types();
        let pending: Promise<int> = Promise.resolve<int>(1);
        expect(detector.isInt16Array(pending)).assertFalse();
      }

      // --- [5] Verify isInt16Array returns false for the iterator objects produced by Map keys() and values() ---
      {
        let detector: util.types = new util.types();
        let store: Map<string, int> = new Map<string, int>();
        store.set('k', 1);
        let keys: IterableIterator<string> = store.keys();
        let values: IterableIterator<int> = store.values();
        expect(detector.isInt16Array(keys)).assertFalse();
        expect(detector.isInt16Array(values)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1200
     * @tc.name testTypesIsInt16Array012
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a synchronous method reference and an asynchronous method reference; Uint16Array held through an Object typed reference; the Array, Int8Array and Int32Array membership of an Object held Int16Array are all recorded false; class instance held through an Object typed reference; five foreign memberships of an Object held Int16Array combine into one rejected conclusion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array returns false for a synchronous method reference and an asynchronous method reference ---
      {
        let detector: util.types = new util.types();
        let probe: AsyncProbe = new AsyncProbe();
        expect(detector.isInt16Array(probe.plainMethod)).assertFalse();
        expect(detector.isAsyncFunction(probe.plainMethod)).assertFalse();
        let detector_2: util.types = new util.types();
        let probe_2: AsyncProbe = new AsyncProbe();
        expect(detector_2.isInt16Array(probe_2.asyncMethod)).assertFalse();
        expect(detector_2.isAsyncFunction(probe_2.asyncMethod)).assertTrue();
      }

      // --- [2] Verify isInt16Array returns false for a Uint16Array held through an Object typed reference ---
      {
        let detector: util.types = new util.types();
        let holder: Object = new Uint16Array(2);
        let result: boolean = detector.isInt16Array(holder);
        expect(result).assertFalse();
      }

      // --- [3] Verify the Array, Int8Array and Int32Array membership of an Object held Int16Array are all recorded false ---
      {
        let detector: util.types = new util.types();
        let value: Object = new Int16Array(6);
        let memberships: Record<string, boolean> = {
          'array': value instanceof Array,
          'int8': value instanceof Int8Array,
          'int32': value instanceof Int32Array
        };
        expect(memberships['array']!).assertFalse();
        expect(memberships['int8']!).assertFalse();
        expect(memberships['int32']!).assertFalse();
        expect(detector.isInt16Array(value)).assertTrue();
      }

      // --- [4] Verify isInt16Array returns false for a class instance held through an Object typed reference ---
      {
        let detector: util.types = new util.types();
        let holder: Object = new Temperature(25);
        expect(detector.isInt16Array(holder)).assertFalse();
      }

      // --- [5] Verify five foreign memberships of an Object held Int16Array combine into one rejected conclusion ---
      {
        let detector: util.types = new util.types();
        let value: Object = new Int16Array(8);
        let asUint16: boolean = value instanceof Uint16Array;
        let asUint8: boolean = value instanceof Uint8Array;
        let asDataView: boolean = value instanceof DataView;
        let asBuffer: boolean = value instanceof ArrayBuffer;
        let asFloat64: boolean = value instanceof Float64Array;
        let allForeignRejected: boolean = !asUint16 && !asUint8 && !asDataView && !asBuffer && !asFloat64;
        expect(allForeignRejected).assertTrue();
        expect(detector.isInt16Array(value)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1300
     * @tc.name testTypesIsInt16Array013
     * @tc.desc Merged batch (5 tests): Non-target object rejection: isInt16Array rejects DataViews at offsets 0 and 3 and rejects the bare backing ArrayBuffer; the false verdict on a DataView leaves its byteLength at 8; an Int16Array stored as an array element is detected through the element; an Int16Array nested in an array stored as a map value is detected through the nested path; a false verdict leaves the Int8Array and Float64Array byte lengths unchanged.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array rejects DataViews at offsets 0 and 3 and rejects the bare backing ArrayBuffer ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let plainView: DataView = new DataView(buffer);
        let offsetView: DataView = new DataView(buffer, 3, 1);
        let windowView: DataView = new DataView(buffer, 0, 4);
        expect(detector.isInt16Array(plainView)).assertFalse();
        expect(detector.isInt16Array(offsetView)).assertFalse();
        expect(detector.isInt16Array(windowView)).assertFalse();
        expect(detector.isInt16Array(buffer)).assertFalse();
        expect(offsetView.byteOffset).assertEqual(3);
        expect(offsetView.byteLength).assertEqual(1);
        expect(windowView.byteOffset).assertEqual(0);
        expect(windowView.byteLength).assertEqual(4);
      }

      // --- [2] Verify the false verdict on a DataView leaves its byteLength at 8 ---
      {
        let detector: util.types = new util.types();
        let view: DataView = new DataView(new ArrayBuffer(8));
        expect(detector.isInt16Array(view)).assertFalse();
        expect(view.byteLength).assertEqual(8);
      }

      // --- [3] Verify an Int16Array stored as an array element is detected through the element while the holding array itself is false ---
      {
        let detector: util.types = new util.types();
        let probes: Object[] = [new Int16Array(2), new Uint8Array(2)];
        expect(detector.isInt16Array(probes[0])).assertTrue();
        expect(detector.isInt16Array(probes[1])).assertFalse();
        expect(detector.isInt16Array(probes)).assertFalse();
      }

      // --- [4] Verify an Int16Array nested in an array stored as a map value is detected through the nested path while the map itself is false ---
      {
        let detector: util.types = new util.types();
        let store: Map<string, Object[]> = new Map<string, Object[]>();
        store.set('box', [new Int16Array(2), new Uint8Array(2)]);
        let box: Object[] = store.get('box')!;
        expect(detector.isInt16Array(box[0])).assertTrue();
        expect(detector.isInt16Array(box[1])).assertFalse();
        expect(detector.isInt16Array(store)).assertFalse();
      }

      // --- [5] Verify a false verdict leaves the Int8Array and Float64Array byte lengths unchanged ---
      {
        let detector: util.types = new util.types();
        let int8View: Int8Array = new Int8Array(new ArrayBuffer(8));
        let verdictInt8: boolean = detector.isInt16Array(int8View);
        expect(verdictInt8).assertFalse();
        expect(int8View.byteLength).assertEqual(8);
        let float64View: Float64Array = new Float64Array(new ArrayBuffer(16));
        let verdictFloat64: boolean = detector.isInt16Array(float64View);
        expect(verdictFloat64).assertFalse();
        expect(float64View.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1400
     * @tc.name testTypesIsInt16Array014
     * @tc.desc Merged batch (4 tests): Non-target object rejection: verifies rejection of unrelated objects, covering ArrayBuffer objects.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the same Int16Array yields true for isInt16Array and false for isInt8Array ---
      {
        let detector: util.types = new util.types();
        let input: Int16Array = new Int16Array(2);
        expect(detector.isInt16Array(input)).assertTrue();
        expect(detector.isInt8Array(input)).assertFalse();
      }

      // --- [2] Verify two views over one ArrayBuffer are separated: Int16Array true and Int32Array false ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let wideView: Int32Array = new Int32Array(buffer);
        expect(detector.isInt16Array(new Int16Array(buffer))).assertTrue();
        expect(detector.isInt16Array(wideView)).assertFalse();
      }

      // --- [3] Verify two views over one ArrayBuffer are separated: Uint8Array false and Int16Array true ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        expect(detector.isInt16Array(new Uint8Array(buffer))).assertFalse();
        expect(detector.isInt16Array(new Int16Array(buffer))).assertTrue();
      }

      // --- [4] Verify a typed scan over an Int16Array and a plain buffer does not accept every probe while the array stays a view ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(3);
        let probes: Object[] = [int16View, new ArrayBuffer(6)];
        expect(probes.every((probe: Object): boolean => detector.isTypedArray(probe))).assertFalse();
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(detector.isArrayBufferView(int16View)).assertTrue();
        expect(detector.isArrayBuffer(int16View)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1500
     * @tc.name testTypesIsInt16Array015
     * @tc.desc Merged batch (4 tests): Boundary and cross predicate checks: verifies Int16Array limits, covering RangeError overruns, buffer writes, readable elements and sibling predicates.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an element count that overruns the buffer is rejected with a RangeError while the existing Int16Array window keeps its length ---
      {
        let detector: util.types = new util.types();
        let backing: ArrayBuffer = new ArrayBuffer(4);
        let valid: Int16Array = new Int16Array(backing);
        expect(valid.length).assertEqual(2);
        expect(detector.isInt16Array(valid)).assertTrue();
        try {
          new Int16Array(backing, 0, 4);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        expect(valid.length).assertEqual(2);
        expect(detector.isInt16Array(valid)).assertTrue();
      }

      // --- [2] Verify a write through a Uint8Array view does not change the verdict and a false buffer verdict does not affect a later true detection ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let int16View: Int16Array = new Int16Array(buffer);
        let bytes: Uint8Array = new Uint8Array(buffer);
        expect(detector.isInt16Array(int16View)).assertTrue();
        bytes.$_set(0, 200);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.$_get(0)).assertEqual(200);
        let detector_2: util.types = new util.types();
        let rejected: boolean = detector_2.isInt16Array(new ArrayBuffer(4));
        let accepted: boolean = detector_2.isInt16Array(new Int16Array(4));
        expect(rejected).assertFalse();
        expect(accepted).assertTrue();
      }

      // --- [3] Verify checking the ArrayBuffer property returns false while element 300 of the view stays readable ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let int16View: Int16Array = new Int16Array(buffer);
        int16View.$_set(1, 300);
        expect(detector.isInt16Array(int16View.buffer)).assertFalse();
        expect(int16View.$_get(1)).assertEqual(300);
      }

      // --- [4] Verify isUint32Array and isFloat32Array accept their own views while isInt16Array rejects both ---
      {
        let detector: util.types = new util.types();
        let wide: Uint32Array = new Uint32Array(2);
        let fractional: Float32Array = new Float32Array(2);
        expect(detector.isUint32Array(wide)).assertTrue();
        expect(detector.isInt16Array(wide)).assertFalse();
        expect(detector.isFloat32Array(fractional)).assertTrue();
        expect(detector.isInt16Array(fractional)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1600
     * @tc.name testTypesIsInt16Array016
     * @tc.desc Merged batch (5 tests): View and buffer semantics: an Int16Array whose length is derived from another view byteLength 12 plus 2 is detected as true with 14 elements and byteLength 28; accepts the Int16Array view produced by subarray(2, 5) on an eight element array; accepts an Int16Array filled through its buffer backed window; accepts an Int16Array view created with a byte offset of 2 on an eight byte ArrayBuffer; accepts a new Int16Array view rebuilt from another Int16Array buffer property.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int16Array whose length is derived from another view byteLength 12 plus 2 is detected as true with 14 elements and byteLength 28 ---
      {
        let detector: util.types = new util.types();
        let source: Int16Array = new Int16Array(6);
        let derived: Int16Array = buildInt16View(source.byteLength + 2);
        expect(detector.isInt16Array(derived)).assertTrue();
        expect(derived.length).assertEqual(14);
        expect(derived.byteLength).assertEqual(28);
      }

      // --- [2] Verify isInt16Array returns true for the Int16Array view produced by subarray(2, 5) on an eight element array ---
      {
        let detector: util.types = new util.types();
        let view: Int16Array = new Int16Array(8).subarray(2, 5);
        expect(detector.isInt16Array(view)).assertTrue();
        expect(view.length).assertEqual(3);
      }

      // --- [3] Verify isInt16Array returns true for an Int16Array filled through its buffer backed window ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let int16View: Int16Array = new Int16Array(buffer);
        for (let i: int = 0; i < int16View.length; i++) {
          int16View.$_set(i, 100 + i);
        }
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.$_get(1)).assertEqual(101);
      }

      // --- [4] Verify isInt16Array returns true for an Int16Array view created with a byte offset of 2 on an eight byte ArrayBuffer ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let int16View: Int16Array = new Int16Array(buffer, 2);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.byteOffset).assertEqual(2);
        expect(int16View.byteLength).assertEqual(6);
      }

      // --- [5] Verify isInt16Array returns true for a new Int16Array view rebuilt from another Int16Array buffer property ---
      {
        let detector: util.types = new util.types();
        let base: Int16Array = new Int16Array(new ArrayBuffer(8));
        let rebuilt: Int16Array = new Int16Array(base.buffer);
        expect(detector.isInt16Array(rebuilt)).assertTrue();
        expect(rebuilt.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1700
     * @tc.name testTypesIsInt16Array017
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts a view derived by subarray(2, 6) and then subarray(1, 3) on the same array; a view at byte offset 4 with length 3 reports byteLength 6 and a ten byte buffer window is the only match beside its buffer; the buffer property of an offset Int16Array view still reports the original 8 byte length; an Int16Array view with byteOffset 0 covering the whole buffer is detected as true; a subarray shares its parent buffer and the element 258 stores little endian as the low byte 2 and the high byte 1.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array returns true for a view derived by subarray(2, 6) and then subarray(1, 3) on the same array ---
      {
        let detector: util.types = new util.types();
        let view: Int16Array = new Int16Array(8).subarray(2, 6).subarray(1, 3);
        expect(detector.isInt16Array(view)).assertTrue();
        expect(view.length).assertEqual(2);
      }

      // --- [2] Verify a view at byte offset 4 with length 3 reports byteLength 6 and a ten byte buffer window is the only match beside its buffer ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(new ArrayBuffer(16), 4, 3);
        let result: boolean = detector.isInt16Array(int16View);
        expect(result).assertTrue();
        expect(int16View.length).assertEqual(3);
        expect(int16View.byteOffset).assertEqual(4);
        expect(int16View.byteLength).assertEqual(6);
        let detector_2: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(10);
        let int16View_2: Int16Array = new Int16Array(buffer, 2, 3);
        let verdicts: boolean[] = [detector_2.isInt16Array(int16View_2), detector_2.isInt16Array(buffer)];
        expect(verdicts).assertDeepEquals([true, false]);
        expect(int16View_2.byteLength).assertEqual(6);
      }

      // --- [3] Verify the buffer property of an offset Int16Array view still reports the original 8 byte length ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let int16View: Int16Array = new Int16Array(buffer, 2, 3);
        let back: ArrayBuffer = int16View.buffer;
        expect(back.byteLength).assertEqual(8);
        expect(detector.isInt16Array(int16View)).assertTrue();
      }

      // --- [4] Verify an Int16Array view with byteOffset 0 covering the whole buffer is detected as true ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let int16View: Int16Array = new Int16Array(buffer, 0, 4);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.byteOffset).assertEqual(0);
      }

      // --- [5] Verify a subarray shares its parent buffer and the element 258 stores little endian as the low byte 2 and the high byte 1 ---
      {
        let detector: util.types = new util.types();
        let base: Int16Array = new Int16Array(new ArrayBuffer(12));
        let sub: Int16Array = base.subarray(2, 4);
        expect(detector.isInt16Array(sub)).assertTrue();
        expect(sub.buffer).assertEqual(base.buffer);
        let detector_2: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(2);
        let int16View: Int16Array = new Int16Array(buffer);
        let bytes: Uint8Array = new Uint8Array(buffer);
        int16View.$_set(0, 258);
        expect(detector_2.isInt16Array(int16View)).assertTrue();
        expect(bytes.$_get(0)).assertEqual(2);
        expect(bytes.$_get(1)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1800
     * @tc.name testTypesIsInt16Array018
     * @tc.desc Merged batch (5 tests): View and buffer semantics: a three element view at byte offset 8 of a sixteen byte buffer spans 6 bytes; detection accepts an empty trailing window and leaves the byte offset and length of a sized window unchanged; filling all eight buffer bytes with 0xFF makes every element of the four element Int16Array read -1 and the view is detected as true; two adjacent windows of a seven element Int16Array have lengths 3 and 4 that sum to the parent length and both are detected as true; the negative element -2 is stored as the little-endian two's complement bytes 0xFE and 0xFF.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a three element view at byte offset 8 of a sixteen byte buffer spans 6 bytes while the buffer keeps 16 ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let int16View: Int16Array = new Int16Array(buffer, 8, 3);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.byteOffset).assertEqual(8);
        expect(int16View.length).assertEqual(3);
        expect(int16View.byteLength).assertEqual(6);
        expect(buffer.byteLength).assertEqual(16);
      }

      // --- [2] Verify detection accepts an empty trailing window and leaves the byte offset and length of a sized window unchanged ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let emptyView: Int16Array = new Int16Array(buffer, 8, 0);
        expect(detector.isInt16Array(emptyView)).assertTrue();
        expect(emptyView.byteOffset).assertEqual(8);
        expect(emptyView.length).assertEqual(0);
        let sizedView: Int16Array = new Int16Array(buffer, 4, 2);
        detector.isInt16Array(sizedView);
        expect(sizedView.byteOffset).assertEqual(4);
        expect(sizedView.length).assertEqual(2);
      }

      // --- [3] Verify filling all eight buffer bytes with 0xFF makes every element of the four element Int16Array read -1 and the view is detected as true ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let bytes: Uint8Array = new Uint8Array(buffer);
        let int16View: Int16Array = new Int16Array(buffer);
        for (let position: int = 0; position < 8; position++) {
          bytes.$_set(position, 0xFF);
        }
        expect(int16View.$_get(0)).assertEqual(-1);
        expect(int16View.$_get(3)).assertEqual(-1);
        expect(detector.isInt16Array(int16View)).assertTrue();
      }

      // --- [4] Verify two adjacent windows of a seven element Int16Array have lengths 3 and 4 that sum to the parent length and both are detected as true ---
      {
        let detector: util.types = new util.types();
        let base: Int16Array = new Int16Array(7);
        let head: Int16Array = base.subarray(0, 3);
        let tail: Int16Array = base.subarray(3, 7);
        expect(detector.isInt16Array(head)).assertTrue();
        expect(detector.isInt16Array(tail)).assertTrue();
        expect(head.length + tail.length).assertEqual(base.length);
      }

      // --- [5] Verify the negative element -2 is stored as the little-endian two's complement bytes 0xFE and 0xFF ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(2);
        let int16View: Int16Array = new Int16Array(buffer);
        let bytes: Uint8Array = new Uint8Array(buffer);
        int16View.$_set(0, -2);
        expect(bytes.$_get(0)).assertEqual(0xFE);
        expect(bytes.$_get(1)).assertEqual(0xFF);
        expect(detector.isInt16Array(int16View)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_1900
     * @tc.name testTypesIsInt16Array019
     * @tc.desc Merged batch (5 tests): View and buffer semantics: an Int16Array sized by the square of another view length 4 has 16 elements and its four element window is also detected as true; a 14 element Int16Array view on a 31 byte buffer covers 28 bytes; that among an Int16Array, a Uint16Array and a DataView over one buffer exactly one input is detected as an Int16Array; a copy constructed from a two element subarray window starts at byte offset 0 inside its own four byte buffer; a DataView over the same buffer exposes an Int16Array element as its two little-endian bytes, only the view being detected.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int16Array sized by the square of another view length 4 has 16 elements and its four element window is also detected as true ---
      {
        let detector: util.types = new util.types();
        let row: Int16Array = new Int16Array(4);
        let grid: Int16Array = new Int16Array(row.length * row.length);
        let windowed: Int16Array = grid.subarray(0, row.length);
        expect(detector.isInt16Array(grid)).assertTrue();
        expect(grid.length).assertEqual(16);
        expect(detector.isInt16Array(windowed)).assertTrue();
        expect(windowed.length).assertEqual(4);
      }

      // --- [2] Verify a 14 element Int16Array view on a 31 byte buffer covers 28 bytes while the trailing byte stays outside it ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(31);
        let bytes: Uint8Array = new Uint8Array(buffer);
        let int16View: Int16Array = new Int16Array(buffer, 0, 14);
        bytes.$_set(30, 9);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.byteLength).assertEqual(28);
        expect(buffer.byteLength).assertEqual(31);
        expect(bytes.$_get(30)).assertEqual(9);
        expect(int16View.$_get(13)).assertEqual(0);
      }

      // --- [3] Verify that among an Int16Array, a Uint16Array and a DataView over one buffer exactly one input is detected as an Int16Array ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let probes: Object[] = [new Int16Array(buffer), new Uint16Array(buffer), new DataView(buffer)];
        let accepted: int = 0;
        for (const probe of probes) {
          if (detector.isInt16Array(probe)) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(1);
      }

      // --- [4] Verify a copy constructed from a two element subarray window starts at byte offset 0 inside its own four byte buffer ---
      {
        let detector: util.types = new util.types();
        let base: Int16Array = new Int16Array(new ArrayBuffer(12));
        let windowed: Int16Array = base.subarray(2, 4);
        let copy: Int16Array = new Int16Array(windowed);
        expect(detector.isInt16Array(copy)).assertTrue();
        expect(copy.byteOffset).assertEqual(0);
        expect(copy.length).assertEqual(2);
        expect(copy.buffer.byteLength).assertEqual(4);
      }

      // --- [5] Verify a DataView over the same buffer exposes an Int16Array element as its two little-endian bytes, only the view being detected ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let int16View: Int16Array = new Int16Array(buffer);
        let view: DataView = new DataView(buffer);
        int16View.$_set(0, -300);
        expect(view.getInt8(0)).assertEqual(-44);
        expect(view.getInt8(1)).assertEqual(-2);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(detector.isInt16Array(view)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2000
     * @tc.name testTypesIsInt16Array020
     * @tc.desc Merged batch (5 tests): View and buffer semantics: that deleting the sole entry of a Map of Int16Array leaves it empty; a second view at the aligned byteOffset 2 reads zero; the detection leaves byteOffset 4 of the input Int16Array view unchanged; -1 written through an Int16Array reads 65535 through a Uint16Array, the two views getting opposite verdicts; all ten sibling typed array kinds are true for isTypedArray and none of them is detected as an Int16Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify that deleting the sole entry of a Map of Int16Array leaves it empty while a fresh view is still recognized ---
      {
        let detector: util.types = new util.types();
        let store: Map<string, Int16Array> = new Map<string, Int16Array>();
        store.set('slot', new Int16Array(2));
        expect(store.delete('slot')).assertTrue();
        expect(store.size).assertEqual(0);
        expect(detector.isInt16Array(new Int16Array(2))).assertTrue();
      }

      // --- [2] Verify a second view at the aligned byteOffset 2 reads zero while the base element stays intact, both accepted ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let base: Int16Array = new Int16Array(buffer);
        base.$_set(0, 258);
        let second: Int16Array = new Int16Array(buffer, 2, 1);
        expect(second.$_get(0)).assertEqual(0);
        expect(base.$_get(0)).assertEqual(258);
        expect(second.byteOffset).assertEqual(2);
        expect(detector.isInt16Array(second)).assertTrue();
        expect(detector.isInt16Array(base)).assertTrue();
      }

      // --- [3] Verify the detection leaves byteOffset 4 of the input Int16Array view unchanged ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(new ArrayBuffer(16), 4);
        detector.isInt16Array(int16View);
        expect(int16View.byteOffset).assertEqual(4);
        expect(int16View.length).assertEqual(6);
      }

      // --- [4] Verify -1 written through an Int16Array reads 65535 through a Uint16Array, the two views getting opposite verdicts ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(2);
        let int16View: Int16Array = new Int16Array(buffer);
        let uint16View: Uint16Array = new Uint16Array(buffer);
        int16View.$_set(0, -1);
        expect(uint16View.$_get(0)).assertEqual(65535);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(detector.isInt16Array(uint16View)).assertFalse();
      }

      // --- [5] Verify all ten sibling typed array kinds are true for isTypedArray and none of them is detected as an Int16Array ---
      {
        let detector: util.types = new util.types();
        let siblings: Object[] = [
          new Int8Array(1), new Uint8Array(1), new Uint8ClampedArray(1), new Uint16Array(1), new Uint32Array(1),
          new Int32Array(1), new Float32Array(1), new Float64Array(1),
          new BigInt64Array(new ArrayBuffer(8)), new BigUint64Array(new ArrayBuffer(8))
        ];
        let typed: int = 0;
        let accepted: int = 0;
        for (const sibling of siblings) {
          if (detector.isTypedArray(sibling)) {
            typed = typed + 1;
          }
          if (detector.isInt16Array(sibling)) {
            accepted = accepted + 1;
          }
        }
        expect(typed).assertEqual(10);
        expect(accepted).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2100
     * @tc.name testTypesIsInt16Array021
     * @tc.desc Merged batch (2 tests): View and buffer semantics: two views produced by the same factory are distinct objects and both are detected as true; interleaving isTypedArray, isDataView and isArrayBuffer with isInt16Array on one instance keeps every verdict at its expected value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two views produced by the same factory are distinct objects and both are detected as true ---
      {
        let detector: util.types = new util.types();
        let first: Int16Array = buildInt16View(2);
        let second: Int16Array = buildInt16View(2);
        expect(detector.isInt16Array(first)).assertTrue();
        expect(detector.isInt16Array(second)).assertTrue();
        expect(first === second).assertFalse();
      }

      // --- [2] Verify interleaving isTypedArray, isDataView and isArrayBuffer with isInt16Array on one instance keeps every verdict at its expected value ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(1);
        let interleaved: boolean[] = [];
        interleaved.push(detector.isTypedArray(int16View));
        interleaved.push(detector.isInt16Array(int16View));
        interleaved.push(detector.isDataView(int16View));
        interleaved.push(detector.isArrayBuffer(int16View));
        interleaved.push(detector.isInt16Array(new Uint16Array(1)));
        expect(interleaved[0]).assertTrue();
        expect(interleaved[1]).assertTrue();
        expect(interleaved[4]).assertFalse();
        expect(interleaved[2]).assertEqual(interleaved[3]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2200
     * @tc.name testTypesIsInt16Array022
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: detecting the Int16Array held as a map value leaves the map size at 1 and the stored element 11; the detection leaves the boundary elements -32768 and 32767 of the input Int16Array unchanged; isInt16Array accepts the wrapping triple 32768, 65535, 65536 stored as -32768, -1, 0 and leaves 11, 22, 33 unchanged; the detection leaves length 3 and byteLength 6 of the input Int16Array unchanged and the underlying buffer byte 0x5A of the input unchanged; a slice copy owns a separate buffer so writing 99 into the copy leaves the source element 2 untouched.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify detecting the Int16Array held as a map value leaves the map size at 1 and the stored element 11 ---
      {
        let detector: util.types = new util.types();
        let store: Map<string, Int16Array> = new Map<string, Int16Array>();
        let held: Int16Array = new Int16Array(2);
        held.$_set(0, 11);
        store.set('slot', held);
        let retrieved: Int16Array = store.get('slot')!;
        expect(detector.isInt16Array(retrieved)).assertTrue();
        expect(store.size).assertEqual(1);
        expect(retrieved.$_get(0)).assertEqual(11);
      }

      // --- [2] Verify the detection leaves the boundary elements -32768 and 32767 of the input Int16Array unchanged ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array([-32768, 32767]);
        detector.isInt16Array(int16View);
        expect(int16View.$_get(0)).assertEqual(-32768);
        expect(int16View.$_get(1)).assertEqual(32767);
      }

      // --- [3] Verify isInt16Array accepts the wrapping triple 32768, 65535, 65536 stored as -32768, -1, 0 and leaves 11, 22, 33 unchanged ---
      {
        let detector: util.types = new util.types();
        let wrapped: Int16Array = new Int16Array([32768, 65535, 65536]);
        let kept: Int16Array = new Int16Array([11, 22, 33]);
        let wrapExpected: int[] = [-32768, -1, 0];
        let keptExpected: int[] = [11, 22, 33];
        expect(detector.isInt16Array(wrapped)).assertTrue();
        expect(detector.isInt16Array(kept)).assertTrue();
        for (let i: int = 0; i < wrapExpected.length; i++) {
          expect(wrapped.$_get(i)).assertEqual(wrapExpected[i]);
          expect(kept.$_get(i)).assertEqual(keptExpected[i]);
        }
      }

      // --- [4] Verify the detection leaves length 3 and byteLength 6 of the input Int16Array unchanged and the underlying buffer byte 0x5A of the input unchanged ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(3);
        detector.isInt16Array(int16View);
        expect(int16View.length).assertEqual(3);
        expect(int16View.byteLength).assertEqual(6);
        let detector_2: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let bytes: Uint8Array = new Uint8Array(buffer);
        bytes.$_set(0, 0x5A);
        let int16View_2: Int16Array = new Int16Array(buffer);
        expect(detector_2.isInt16Array(int16View_2)).assertTrue();
        expect(bytes.$_get(0)).assertEqual(0x5A);
      }

      // --- [5] Verify a slice copy owns a separate buffer so writing 99 into the copy leaves the source element 2 untouched ---
      {
        let detector: util.types = new util.types();
        let source: Int16Array = new Int16Array([1, 2, 3]);
        let copy: Int16Array = source.slice(1);
        copy.$_set(0, 99);
        expect(detector.isInt16Array(copy)).assertTrue();
        expect(source.$_get(1)).assertEqual(2);
        expect(copy.$_get(0)).assertEqual(99);
        expect(copy.buffer === source.buffer).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2300
     * @tc.name testTypesIsInt16Array023
     * @tc.desc Merged batch (3 tests): State preservation and aliasing: an Int16Array forwarded through a helper that only knows Object is detected as true and stays the same object; the detection leaves element 8 of a plain int array unchanged; two consecutive detections leave element 42 of the same Int16Array unchanged.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int16Array forwarded through a helper that only knows Object is detected as true and stays the same object ---
      {
        let detector: util.types = new util.types();
        let original: Int16Array = new Int16Array(3);
        let forwarded: Object = passThroughObject(original);
        expect(detector.isInt16Array(forwarded)).assertTrue();
        expect(detector.isInt16Array(original)).assertTrue();
        expect(forwarded).assertEqual(original);
      }

      // --- [2] Verify the detection leaves element 8 of a plain int array unchanged ---
      {
        let detector: util.types = new util.types();
        let values: int[] = [7, 8];
        detector.isInt16Array(values);
        expect(values[1]).assertEqual(8);
      }

      // --- [3] Verify two consecutive detections leave element 42 of the same Int16Array unchanged ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array([42]);
        detector.isInt16Array(int16View);
        detector.isInt16Array(int16View);
        expect(int16View.$_get(0)).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2400
     * @tc.name testTypesIsInt16Array024
     * @tc.desc Merged batch (5 tests): API call consistency: an Int16Array view is detected as true while the shared ArrayBuffer itself is detected as false; stored as a map value is detected as true after retrieval; isInt16Array accepts a view whose byteLength is twice its length; rejects an Int16Array read from a class field or an interface field is accepted; held in a quoted record field is detected as true through the field.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int16Array view is detected as true while the shared ArrayBuffer itself is detected as false ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let int16View: Int16Array = new Int16Array(buffer);
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(detector.isInt16Array(buffer)).assertFalse();
      }

      // --- [2] Verify an Int16Array stored as a map value is detected as true after retrieval while the map itself is false ---
      {
        let detector: util.types = new util.types();
        let store: Map<string, Int16Array> = new Map<string, Int16Array>();
        store.set('slot', new Int16Array(4));
        let held: Int16Array = store.get('slot')!;
        expect(detector.isInt16Array(held)).assertTrue();
        expect(detector.isInt16Array(store)).assertFalse();
      }

      // --- [3] Verify isInt16Array accepts a view whose byteLength is twice its length while rejecting a Uint8ClampedArray of the same length ---
      {
        let detector: util.types = new util.types();
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(3);
        let pairs: Int16Array = new Int16Array(3);
        expect(clamped.byteLength).assertEqual(3);
        expect(pairs.byteLength).assertEqual(6);
        expect(detector.isInt16Array(clamped)).assertFalse();
        expect(detector.isInt16Array(pairs)).assertTrue();
      }

      // --- [4] Verify an Int16Array read from a class field or an interface field is accepted while the carrying object itself is rejected ---
      {
        let detector: util.types = new util.types();
        let holder: Int16Holder = new Int16Holder(new Int16Array(3));
        expect(detector.isInt16Array(holder.value)).assertTrue();
        expect(detector.isInt16Array(holder)).assertFalse();
        let detector_2: util.types = new util.types();
        let slot: Int16Slot = { payload: new Int16Array(2) };
        expect(detector_2.isInt16Array(slot.payload)).assertTrue();
        expect(detector_2.isInt16Array(slot)).assertFalse();
      }

      // --- [5] Verify an Int16Array held in a quoted record field is detected as true through the field while the record object itself is false ---
      {
        let detector: util.types = new util.types();
        let record: Record<string, Int16Array> = { 'slot': new Int16Array(2) };
        let held: Int16Array = record['slot']!;
        expect(detector.isInt16Array(held)).assertTrue();
        expect(detector.isInt16Array(record)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2500
     * @tc.name testTypesIsInt16Array025
     * @tc.desc Merged batch (5 tests): API call consistency: overwriting a WeakMap entry with a different Int16Array keeps both views accepted and the WeakMap rejected; the false verdict on a Uint16Array alias leaves the shared buffer element 300 readable through the Int16Array and detected as true; rejects an Int16Array used as a Map key or a Set member is accepted when pulled from the iterator while the container; two detections of one array are equal and a holder method classifies an Int16Array true and a Uint16Array false; accepts isInt16Array and isDate in sequence without cross contamination.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting a WeakMap entry with a different Int16Array keeps both views accepted and the WeakMap rejected ---
      {
        let detector: util.types = new util.types();
        let key: Temperature = new Temperature(4);
        let weakStore: WeakMap<Temperature, Int16Array> = new WeakMap<Temperature, Int16Array>();
        let swappedView: Int16Array = new Int16Array(2);
        weakStore.set(key, swappedView);
        weakStore.set(key, new Int16Array(4));
        let current: Int16Array = weakStore.get(key)!;
        expect(detector.isInt16Array(current)).assertTrue();
        expect(current.length).assertEqual(4);
        expect(detector.isInt16Array(swappedView)).assertTrue();
        expect(detector.isInt16Array(weakStore)).assertFalse();
      }

      // --- [2] Verify the false verdict on a Uint16Array alias leaves the shared buffer element 300 readable through the Int16Array and detected as true ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let int16View: Int16Array = new Int16Array(buffer);
        let uint16View: Uint16Array = new Uint16Array(buffer);
        uint16View.$_set(0, 300);
        expect(detector.isInt16Array(uint16View)).assertFalse();
        expect(detector.isInt16Array(int16View)).assertTrue();
        expect(int16View.$_get(0)).assertEqual(300);
      }

      // --- [3] Verify an Int16Array used as a Map key or a Set member is accepted when pulled from the iterator while the container is rejected ---
      {
        let detector: util.types = new util.types();
        let store: Map<Int16Array, string> = new Map<Int16Array, string>();
        store.set(new Int16Array(2), 'tag');
        let cursor: IterableIterator<Int16Array> = store.keys();
        let pulled: int = 0;
        for (const candidate of cursor) {
          if (detector.isInt16Array(candidate)) {
            pulled = pulled + 1;
          }
        }
        expect(pulled).assertEqual(1);
        expect(detector.isInt16Array(store)).assertFalse();
        let detector_2: util.types = new util.types();
        let bucket: Set<Object> = new Set<Object>();
        bucket.add(new Int16Array(3));
        bucket.add(new Uint8Array(3));
        let cursor_2: IterableIterator<Object> = bucket.values();
        let pulled_2: int = 0;
        for (const member of cursor_2) {
          if (detector_2.isInt16Array(member)) {
            pulled_2 = pulled_2 + 1;
          }
        }
        expect(pulled_2).assertEqual(1);
        expect(detector_2.isInt16Array(bucket)).assertFalse();
      }

      // --- [4] Verify two detections of one array are equal and a holder method classifies an Int16Array true and a Uint16Array false ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(new ArrayBuffer(16));
        let first: boolean = detector.isInt16Array(int16View);
        let second: boolean = detector.isInt16Array(int16View);
        expect(first).assertEqual(second);
        expect(first).assertTrue();
        let detector_2: util.types = new util.types();
        let inspector: Int16Inspector = new Int16Inspector(detector_2);
        expect(inspector.check(new Int16Array(2))).assertTrue();
        expect(inspector.check(new Uint16Array(2))).assertFalse();
      }

      // --- [5] Verify one detector instance returns true for isInt16Array and isDate in sequence without cross contamination ---
      {
        let detector: util.types = new util.types();
        let onArray: boolean = detector.isInt16Array(new Int16Array(4));
        let onDate: boolean = detector.isDate(new Date());
        expect(onArray).assertTrue();
        expect(onDate).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2600
     * @tc.name testTypesIsInt16Array026
     * @tc.desc Merged batch (5 tests): API call consistency: accepts an Int16Array and false for a Uint16Array; rejects isInt16Array on a Uint8Array while isTypedArray returns true; over one ArrayBuffer a DataView is false while an Int16Array view is true; a DataView is only a view and an ArrayBuffer only a buffer, both failing isInt16Array and the other's predicate; the 64 bit sibling pair BigInt64Array and BigUint64Array is true for isTypedArray and false for isInt16Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a helper that receives the detector and the value as parameters returns true for an Int16Array and false for a Uint16Array ---
      {
        let detector: util.types = new util.types();
        expect(detectWithParam(detector, new Int16Array(2))).assertTrue();
        expect(detectWithParam(detector, new Uint16Array(2))).assertFalse();
      }

      // --- [2] Verify one detector instance returns false for isInt16Array on a Uint8Array while isTypedArray returns true ---
      {
        let detector: util.types = new util.types();
        let input: Uint8Array = new Uint8Array(new ArrayBuffer(2));
        let onInt16: boolean = detector.isInt16Array(input);
        let onTyped: boolean = detector.isTypedArray(input);
        expect(onInt16).assertFalse();
        expect(onTyped).assertTrue();
      }

      // --- [3] Verify over one ArrayBuffer a DataView is false while an Int16Array view is true ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: DataView = new DataView(buffer);
        let int16View: Int16Array = new Int16Array(buffer);
        expect(detector.isInt16Array(view)).assertFalse();
        expect(detector.isInt16Array(int16View)).assertTrue();
      }

      // --- [4] Verify a DataView is only a view and an ArrayBuffer only a buffer, both failing isInt16Array and the other's predicate ---
      {
        let detector: util.types = new util.types();
        let view: DataView = new DataView(new ArrayBuffer(4));
        expect(detector.isInt16Array(view)).assertFalse();
        expect(detector.isTypedArray(view)).assertFalse();
        expect(detector.isArrayBufferView(view)).assertTrue();
        let detector_2: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        expect(detector_2.isAnyArrayBuffer(buffer)).assertTrue();
        expect(detector_2.isArrayBuffer(buffer)).assertTrue();
        expect(detector_2.isInt16Array(buffer)).assertFalse();
        expect(detector_2.isArrayBufferView(buffer)).assertFalse();
      }

      // --- [5] Verify the 64 bit sibling pair BigInt64Array and BigUint64Array is true for isTypedArray and false for isInt16Array ---
      {
        let detector: util.types = new util.types();
        let signed: BigInt64Array = new BigInt64Array(new ArrayBuffer(16));
        let unsigned: BigUint64Array = new BigUint64Array(new ArrayBuffer(16));
        expect(detector.isInt16Array(signed)).assertFalse();
        expect(detector.isInt16Array(unsigned)).assertFalse();
        expect(detector.isTypedArray(signed)).assertTrue();
        expect(detector.isTypedArray(unsigned)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2700
     * @tc.name testTypesIsInt16Array027
     * @tc.desc Merged batch (1 test): API call consistency: over the same four byte range the Int16Array window is accepted while the Uint16Array window is not.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify over the same four byte range the Int16Array window is accepted while the Uint16Array window is not ---
      {
        let detector: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let i16Window: Int16Array = new Int16Array(buffer, 0, 2);
        let u16Window: Uint16Array = new Uint16Array(buffer, 0, 2);
        expect(detector.isInt16Array(i16Window)).assertTrue();
        expect(detector.isInt16Array(u16Window)).assertFalse();
        expect(i16Window.byteLength).assertEqual(4);
        expect(u16Window.byteLength).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2800
     * @tc.name testTypesIsInt16Array028
     * @tc.desc Merged batch (5 tests): Program integration: accepts the Int16Array returned by the chained fill(1) call; a loop over three growing Int16Array inputs is detected three times; the boolean result selects the detection branch of an if else statement; a top level wrapper keeps the verdict and the boolean result drives a ternary to the expected label; the boolean results combine correctly through logical not, and and or.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt16Array returns true for the Int16Array returned by the chained fill(1) call ---
      {
        let detector: util.types = new util.types();
        let filled: Int16Array = new Int16Array(3).fill(1);
        expect(detector.isInt16Array(filled)).assertTrue();
        expect(filled.$_get(0)).assertEqual(1);
        expect(filled.$_get(2)).assertEqual(1);
      }

      // --- [2] Verify a loop over three growing Int16Array inputs is detected three times ---
      {
        let detector: util.types = new util.types();
        let accepted: int = 0;
        for (let index: int = 0; index < 3; index++) {
          if (detector.isInt16Array(new Int16Array(index + 1))) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(3);
      }

      // --- [3] Verify the boolean result selects the detection branch of an if else statement ---
      {
        let detector: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(2);
        let branch: string = '';
        if (detector.isInt16Array(int16View)) {
          branch = 'detected';
        } else {
          branch = 'missed';
        }
        expect(branch).assertEqual('detected');
      }

      // --- [4] Verify a top level wrapper keeps the verdict and the boolean result drives a ternary to the expected label ---
      {
        let detector: util.types = new util.types();
        expect(probeThroughDetector(detector)).assertTrue();
        expect(detector.isInt16Array(new Int8Array(new ArrayBuffer(4)))).assertFalse();
        let detector_2: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(2);
        let label: string = detector_2.isInt16Array(int16View) ? 'int16' : 'other';
        expect(label).assertEqual('int16');
      }

      // --- [5] Verify the boolean results combine correctly through logical not, and and or ---
      {
        let detector: util.types = new util.types();
        let isInt16: boolean = detector.isInt16Array(new Int16Array(2));
        let isUint16: boolean = detector.isInt16Array(new Uint16Array(new ArrayBuffer(2)));
        expect(isInt16 && !isUint16).assertTrue();
        expect(isInt16 || isUint16).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_2900
     * @tc.name testTypesIsInt16Array029
     * @tc.desc Merged batch (3 tests): Program integration: a switch over an integer code derived from the detection counts exactly one Int16Array among three mixed inputs; a while loop whose condition is the detection stops after draining the two leading Int16Array entries of a queue; a helper that returns early reports index 1 for the first Int16Array in a mixed array and minus one when none is present.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a switch over an integer code derived from the detection counts exactly one Int16Array among three mixed inputs ---
      {
        let detector: util.types = new util.types();
        let probes: Object[] = [new Int16Array(1), new Uint16Array(1), new DataView(new ArrayBuffer(2))];
        let accepted: int = 0;
        for (const probe of probes) {
          let code: int = detector.isInt16Array(probe) ? 1 : 0;
          switch (code) {
            case 1:
              accepted = accepted + 1;
              break;
            default:
              break;
          }
        }
        expect(accepted).assertEqual(1);
      }

      // --- [2] Verify a while loop whose condition is the detection stops after draining the two leading Int16Array entries of a queue ---
      {
        let detector: util.types = new util.types();
        let queue: Object[] = [new Int16Array(2), new Int16Array(3), new Uint8Array(2)];
        let drained: int = 0;
        let current: Object = queue[drained];
        while (detector.isInt16Array(current)) {
          drained = drained + 1;
          current = queue[drained];
        }
        expect(drained).assertEqual(2);
        expect(detector.isInt16Array(queue[2])).assertFalse();
      }

      // --- [3] Verify a helper that returns early reports index 1 for the first Int16Array in a mixed array and minus one when none is present ---
      {
        let detector: util.types = new util.types();
        let mixed: Object[] = [new Uint8Array(1), new Int16Array(2), new Int16Array(3)];
        let none: Object[] = [new Uint8Array(1)];
        expect(firstInt16Index(mixed, detector)).assertEqual(1);
        expect(firstInt16Index(none, detector)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT16_ARRAY_3000
     * @tc.name testTypesIsInt16Array030
     * @tc.desc Merged batch (4 tests): Miscellaneous checks: verifies remaining edge cases, covering typed array views and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt16Array030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify some answers a single boolean for a test that no element of the array matches ---
      {
        let detector: util.types = new util.types();
        let source: Int16Array = new Int16Array([2, 4, 6]);
        let anyOdd: boolean = source.some((v: double, i: int, a: Int16Array) => v % 2 !== 0);
        expect(anyOdd).assertFalse();
        expect(detector.isInt16Array(source)).assertTrue();
      }

      // --- [2] Verify filter returns a shorter array of the same element type that the predicate still accepts ---
      {
        let detector: util.types = new util.types();
        let source: Int16Array = new Int16Array([1, 2, 3, 4]);
        let kept: Int16Array = source.filter((v: double, i: int, a: Int16Array) => v > 2);
        expect(detector.isInt16Array(kept)).assertTrue();
        expect(kept[0]).assertEqual(3);
        expect(kept.length).assertEqual(2);
      }

      // --- [3] Verify a detected Int16Array held as Object keeps its Int16Array instanceof membership ---
      {
        let detector: util.types = new util.types();
        let value: Object = new Int16Array(4);
        expect(detector.isInt16Array(value)).assertTrue();
        expect(value instanceof Int16Array).assertTrue();
      }

      // --- [4] Verify isInt16Array returns false for Double.NaN and for both infinities ---
      {
        let detector: util.types = new util.types();
        expect(detector.isInt16Array(Double.NaN)).assertFalse();
        expect(detector.isInt16Array(Double.POSITIVE_INFINITY)).assertFalse();
        expect(detector.isInt16Array(Double.NEGATIVE_INFINITY)).assertFalse();
      }
    });

  });
}
