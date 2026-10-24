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

class ThermalProbe {
  degree: double = 0;

  constructor(degree: double) {
    this.degree = degree;
  }
}

class WeakKeyHolder {
  tag: string = 'holder';
}

class SurfaceInt8Array {
  buffer: ArrayBuffer = new ArrayBuffer(2);
  byteOffset: int = 0;
  byteLength: int = 2;
  length: int = 2;
}

interface LengthBag {
  length: int;
}

interface BufferBag {
  buffer: ArrayBuffer;
  length: int;
}

function classifyThroughChecker(checker: util.types, value: Object): boolean {
  return checker.isInt8Array(value);
}

interface PayloadBag {
  payload: Int8Array;
}

class ParcelHolder {
  content: Int8Array;

  constructor(content: Int8Array) {
    this.content = content;
  }
}

class SignedGate {
  gate: util.types;

  constructor(gate: util.types) {
    this.gate = gate;
  }

  admits(value: Object): boolean {
    return this.gate.isInt8Array(value);
  }
}

function buildSignedWindow(size: int): Int8Array {
  return new Int8Array(size);
}

function signedLabel(checker: util.types, value: Object): string {
  if (checker.isInt8Array(value)) {
    return 'signed';
  }
  return 'other';
}

function passThrough(value: Object): Object {
  return value;
}

async function asyncInt8Check(checker: util.types, value: Object): Promise<boolean> {
  return checker.isInt8Array(value);
}

export default function typesIsInt8ArrayTest(): void {
  describe('TypesIsInt8ArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0100
     * @tc.name testTypesIsInt8Array001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: a three element Int8Array is detected with length 3 and byte length 3, one byte per element; a 256 element Int8Array, the byte value count 2 to the 8, is detected with byteLength 256; isInt8Array accepts the signed byte limits -128, 0, 127 and stores the wrapping triple 128, 255, 256 as -128, -1, 0; two distinct Int8Array keys with identical contents coexist in one map and each is detected; an Int8Array held through an Object typed reference is still detected as one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a three element Int8Array is detected with length 3 and byte length 3, one byte per element ---
      {
        let checker: util.types = new util.types();
        let three: Int8Array = new Int8Array(3);
        expect(checker.isInt8Array(three)).assertTrue();
        expect(three.length).assertEqual(3);
        expect(three.byteLength).assertEqual(3);
      }

      // --- [2] Verify a 256 element Int8Array, the byte value count 2 to the 8, is detected with byteLength 256 ---
      {
        let checker: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(272);
        let wide: Int8Array = new Int8Array(host, 16, 256);
        let detected: boolean = checker.isInt8Array(wide);
        expect(wide.byteOffset).assertEqual(16);
        expect(detected).assertTrue();
        expect(wide.byteLength).assertEqual(256);
      }

      // --- [3] Verify isInt8Array accepts the signed byte limits -128, 0, 127 and stores the wrapping triple 128, 255, 256 as -128, -1, 0 ---
      {
        let checker: util.types = new util.types();
        let boundary: Int8Array = new Int8Array([-128, 0, 127]);
        let wrapped: Int8Array = new Int8Array([128, 255, 256]);
        let boundaryExpected: int[] = [-128, 0, 127];
        let wrappedExpected: int[] = [-128, -1, 0];
        expect(checker.isInt8Array(boundary)).assertTrue();
        expect(checker.isInt8Array(wrapped)).assertTrue();
        for (let i: int = 0; i < boundaryExpected.length; i++) {
          expect(boundary.$_get(i)).assertEqual(boundaryExpected[i]);
          expect(wrapped.$_get(i)).assertEqual(wrappedExpected[i]);
        }
      }

      // --- [4] Verify two distinct Int8Array keys with identical contents coexist in one map and each is detected ---
      {
        let checker: util.types = new util.types();
        let first: Int8Array = new Int8Array(2);
        let second: Int8Array = new Int8Array(2);
        let table: Map<Int8Array, string> = new Map<Int8Array, string>();
        table.set(first, 'first');
        table.set(second, 'second');
        expect(checker.isInt8Array(first)).assertTrue();
        expect(table.has(second)).assertTrue();
        expect(table.size).assertEqual(2);
      }

      // --- [5] Verify an Int8Array held through an Object typed reference is still detected as one ---
      {
        let checker: util.types = new util.types();
        let held: Object = new Int8Array(2);
        expect(checker.isInt8Array(held)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0200
     * @tc.name testTypesIsInt8Array002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: the unsigned byte 200 read through an Int8Array on the same buffer becomes the signed -56; the byte offset and length captured before the check equal the values read after it; copyWithin shifts the trailing elements to the front within the buffer and the verdict holds; valueOf returns the same array instance that the predicate still accepts; an Int8Array returned by a factory function is detected with the requested length 4.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the unsigned byte 200 read through an Int8Array on the same buffer becomes the signed -56 ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let signed: Int8Array = new Int8Array(buffer);
        let unsigned: Uint8Array = new Uint8Array(buffer);
        unsigned.$_set(0, 200);
        expect(checker.isInt8Array(signed)).assertTrue();
        expect(signed.$_get(0)).assertEqual(-56);
      }

      // --- [2] Verify the byte offset and length captured before the check equal the values read after it ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(10);
        let view: Int8Array = new Int8Array(buffer, 4, 3);
        let offsetBefore: int = view.byteOffset;
        let lengthBefore: int = view.length;
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.byteOffset).assertEqual(offsetBefore);
        expect(view.length).assertEqual(lengthBefore);
      }

      // --- [3] Verify copyWithin shifts the trailing elements to the front within the buffer and the verdict holds ---
      {
        let checker: util.types = new util.types();
        let values: Int8Array = new Int8Array([1, 2, 3, 4]);
        values.copyWithin(0, 2);
        expect(values[0]).assertEqual(3);
        expect(values[3]).assertEqual(4);
        expect(checker.isInt8Array(values)).assertTrue();
      }

      // --- [4] Verify valueOf returns the same array instance that the predicate still accepts ---
      {
        let checker: util.types = new util.types();
        let source: Int8Array = new Int8Array([9, 8]);
        let alias: Int8Array = source.valueOf();
        expect(checker.isInt8Array(alias)).assertTrue();
        expect(alias[0]).assertEqual(9);
        expect(alias.length).assertEqual(source.length);
      }

      // --- [5] Verify an Int8Array returned by a factory function is detected with the requested length 4 ---
      {
        let checker: util.types = new util.types();
        let built: Int8Array = buildSignedWindow(4);
        let verdict: boolean = checker.isInt8Array(built);
        expect(verdict).assertTrue();
        expect(built.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0300
     * @tc.name testTypesIsInt8Array003
     * @tc.desc Merged batch (1 test): Basic construction and recognition: a factory produced array relayed through an identity function is still detected after the round trip.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a factory produced array relayed through an identity function is still detected after the round trip ---
      {
        let checker: util.types = new util.types();
        let built: Int8Array = buildSignedWindow(2);
        let relayed: Object = passThrough(built);
        expect(relayed instanceof Int8Array).assertTrue();
        expect(checker.isInt8Array(relayed)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0400
     * @tc.name testTypesIsInt8Array004
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: an Int8Array copied from Uint8Array [200] is detected and reinterprets 200 as -56; the three element Int16Array holding 7, 8 and 9 keeps 9 at the last index; another Int8Array is detected and keeps the source length; instanceof and isInt8Array follow an Object variable reassigned from an Int8Array to a Float64Array; the two element Uint16Array holding 4 and 5 selects the detected label.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int8Array copied from Uint8Array [200] is detected and reinterprets 200 as -56 ---
      {
        let checker: util.types = new util.types();
        let source: Uint8Array = new Uint8Array([200]);
        let copied: Int8Array = new Int8Array(source);
        expect(checker.isInt8Array(copied)).assertTrue();
        expect(copied.$_get(0)).assertEqual(-56);
      }

      // --- [2] Verify an Int8Array copied from the three element Int16Array holding 7, 8 and 9 keeps 9 at the last index ---
      {
        let checker: util.types = new util.types();
        let source: Int16Array = new Int16Array([7, 8, 9]);
        let copied: Int8Array = new Int8Array(source);
        let lastIndex: int = -1;
        for (let index: int = 0; index < copied.length; index++) {
          lastIndex = index;
        }
        expect(lastIndex).assertEqual(2);
        expect(copied.$_get(lastIndex)).assertEqual(9);
        expect(checker.isInt8Array(copied)).assertTrue();
      }

      // --- [3] Verify an Int8Array copied from another Int8Array is detected and keeps the source length ---
      {
        let checker: util.types = new util.types();
        let source: Int8Array = new Int8Array(2);
        let copied: Int8Array = new Int8Array(source);
        expect(checker.isInt8Array(copied)).assertTrue();
        expect(copied.length).assertEqual(2);
      }

      // --- [4] Verify instanceof and isInt8Array follow an Object variable reassigned from an Int8Array to a Float64Array ---
      {
        let checker: util.types = new util.types();
        let signed: Int8Array = new Int8Array(2);
        let floats: Float64Array = new Float64Array(2);
        let held: Object = signed;
        expect(held instanceof Int8Array).assertTrue();
        expect(checker.isInt8Array(held)).assertTrue();
        held = floats;
        expect(held instanceof Int8Array).assertFalse();
        expect(checker.isInt8Array(held)).assertFalse();
      }

      // --- [5] Verify an Int8Array copied from the two element Uint16Array holding 4 and 5 selects the detected label ---
      {
        let checker: util.types = new util.types();
        let source: Uint16Array = new Uint16Array([4, 5]);
        let copied: Int8Array = new Int8Array(source);
        let label: string = checker.isInt8Array(copied) ? 'signed copy' : 'unexpected';
        expect(label).assertEqual('signed copy');
        expect(copied.$_get(1)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0500
     * @tc.name testTypesIsInt8Array005
     * @tc.desc Merged batch (1 test): Type conversion and subclassing: an Int8Array copied from the three element Uint8ClampedArray holding 4, 7 and 4 keeps the value 7 at index one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int8Array copied from the three element Uint8ClampedArray holding 4, 7 and 4 keeps the value 7 at index one ---
      {
        let checker: util.types = new util.types();
        let source: Uint8ClampedArray = new Uint8ClampedArray([4, 7, 4]);
        let copied: Int8Array = new Int8Array(source);
        expect(checker.isInt8Array(copied)).assertTrue();
        expect(copied.$_get(1)).assertEqual(7);
        expect(copied.length).assertEqual(source.length);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0600
     * @tc.name testTypesIsInt8Array006
     * @tc.desc Merged batch (5 tests): Boundary values: a view covering a four byte buffer reports byte length 4; the detection result does not depend on element count, an empty array matching a four byte one; rejects an Int8Array copied from the one element Uint32Array is detected while the wider source; zero-length buffers and views plus two-element Int16Array and Uint8Array values are all rejected with their sizes kept; a one element Int8Array pinned to the last byte of its buffer at offset 3 is detected.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a view covering a four byte buffer reports byte length 4 while a view over a zero byte buffer stays length 0 ---
      {
        let checker: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(4);
        let full: Int8Array = new Int8Array(host);
        let emptyHost: ArrayBuffer = new ArrayBuffer(0);
        let empty: Int8Array = new Int8Array(emptyHost);
        expect(checker.isInt8Array(full)).assertTrue();
        expect(full.byteLength).assertEqual(4);
        expect(checker.isInt8Array(empty)).assertTrue();
        expect(empty.length).assertEqual(0);
      }

      // --- [2] Verify the detection result does not depend on element count, an empty array matching a four byte one ---
      {
        let checker: util.types = new util.types();
        let zero: boolean = checker.isInt8Array(new Int8Array(0));
        let four: boolean = checker.isInt8Array(new Int8Array(4));
        expect(zero).assertEqual(four);
      }

      // --- [3] Verify an Int8Array copied from the one element Uint32Array is detected while the wider source is rejected ---
      {
        let checker: util.types = new util.types();
        let source: Uint32Array = new Uint32Array([6]);
        let copied: Int8Array = new Int8Array(source);
        let verdicts: Map<string, boolean> = new Map<string, boolean>();
        verdicts.set('copy', checker.isInt8Array(copied));
        verdicts.set('source', checker.isInt8Array(source));
        expect(verdicts.get('copy')!).assertTrue();
        expect(verdicts.get('source')!).assertFalse();
      }

      // --- [4] Verify zero-length buffers and views plus two-element Int16Array and Uint8Array values are all rejected with their sizes kept ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(0);
        let wide: Int16Array = new Int16Array(2);
        let emptyUnsigned: Uint8Array = new Uint8Array(0);
        let unsigned: Uint8Array = new Uint8Array(2);
        expect(checker.isInt8Array(buffer)).assertFalse();
        expect(buffer.byteLength).assertEqual(0);
        expect(checker.isInt8Array(wide)).assertFalse();
        expect(wide.byteLength).assertEqual(4);
        expect(checker.isInt8Array(emptyUnsigned)).assertFalse();
        expect(emptyUnsigned.byteLength).assertEqual(0);
        expect(checker.isInt8Array(unsigned)).assertFalse();
        expect(unsigned.length).assertEqual(2);
      }

      // --- [5] Verify a one element Int8Array pinned to the last byte of its buffer at offset 3 is detected ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let view: Int8Array = new Int8Array(buffer, 3, 1);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(checker.isInt8Array(buffer)).assertFalse();
        expect(view.byteOffset).assertEqual(3);
        expect(view.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0700
     * @tc.name testTypesIsInt8Array007
     * @tc.desc Merged batch (4 tests): Boundary values: the empty string and the four character string built from it are both rejected as not an Int8Array; an Int8Array copied from the Float32Array holding 9.5, 4.5 and 2.5 truncates the fractions; a signed byte slot written with -129 through the element setter wraps up to the maximum 127; rejects a three argument view over a zero byte buffer is detected with length 0.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the empty string and the four character string built from it are both rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let text: string = '';
        let onEmpty: boolean = checker.isInt8Array(text);
        text += 'text';
        let onText: boolean = checker.isInt8Array(text);
        expect(onEmpty).assertFalse();
        expect(onText).assertFalse();
      }

      // --- [2] Verify an Int8Array copied from the Float32Array holding 9.5, 4.5 and 2.5 truncates the fractions ---
      {
        let checker: util.types = new util.types();
        let source: Float32Array = new Float32Array([9.5, 4.5, 2.5]);
        let copied: Int8Array = new Int8Array(source);
        expect(checker.isInt8Array(copied)).assertTrue();
        expect(copied[1]).assertEqual(4);
        expect(copied[2]).assertEqual(2);
        expect(source.length).assertEqual(3);
      }

      // --- [3] Verify a signed byte slot written with -129 through the element setter wraps up to the maximum 127 ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = buildSignedWindow(1);
        array.$_set(0, -129);
        expect(checker.isInt8Array(array)).assertTrue();
        expect(array.$_get(0)).assertEqual(127);
      }

      // --- [4] Verify a three argument view over a zero byte buffer is detected with length 0 while the buffer itself is rejected ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(0);
        let view: Int8Array = new Int8Array(buffer, 0, 0);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.length).assertEqual(0);
        expect(checker.isInt8Array(buffer)).assertFalse();
        expect(checker.isArrayBuffer(buffer)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0800
     * @tc.name testTypesIsInt8Array008
     * @tc.desc Merged batch (3 tests): Boundary overflow: verifies numeric limit and wrapping behavior, covering buffer windows and subarrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the int -2147483647, one above the smallest representable int, is rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let extreme: int = -2147483647;
        let flags: boolean[] = [checker.isInt8Array(extreme)];
        expect(flags.indexOf(true)).assertEqual(-1);
      }

      // --- [2] Verify a byte offset beyond the buffer is rejected with a RangeError while the buffer and its valid Int8Array view are unaffected ---
      {
        let checker: util.types = new util.types();
        let backing: ArrayBuffer = new ArrayBuffer(2);
        let valid: Int8Array = new Int8Array(backing);
        expect(checker.isInt8Array(valid)).assertTrue();
        try {
          new Int8Array(backing, 4);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        expect(backing.byteLength).assertEqual(2);
        expect(checker.isInt8Array(valid)).assertTrue();
      }

      // --- [3] Verify the gate holder class admits an Int8Array while the checker it wraps rejects a Uint8Array ---
      {
        let checker: util.types = new util.types();
        let gate: SignedGate = new SignedGate(checker);
        let viaGate: boolean = gate.admits(new Int8Array(2));
        expect(viaGate).assertTrue();
        expect(checker.isInt8Array(new Uint8Array(2))).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_0900
     * @tc.name testTypesIsInt8Array009
     * @tc.desc Merged batch (5 tests): Primitive value rejection: the positive int 1 and the negative int -1 are rejected because a primitive is never an Int8Array; the int zero is rejected because a primitive is never an Int8Array; the largest int value 2147483647 is rejected as not an Int8Array; the fractional double 3.14 is rejected because a primitive is never an Int8Array; the negative fractional double -3.14, NaN and positive infinity are all rejected in a single pass.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the positive int 1 and the negative int -1 are rejected because a primitive is never an Int8Array ---
      {
        let checker: util.types = new util.types();
        let value: int = 1;
        expect(checker.isInt8Array(value)).assertFalse();
        let values: int[] = [-1];
        expect(checker.isInt8Array(values[0])).assertFalse();
      }

      // --- [2] Verify the int zero is rejected because a primitive is never an Int8Array ---
      {
        let checker: util.types = new util.types();
        expect(checker.isInt8Array(0)).assertFalse();
        expect(checker.isInt8Array(new Int8Array(0))).assertTrue();
      }

      // --- [3] Verify the largest int value 2147483647 is rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let value: int = 2147483647;
        expect(checker.isInt8Array(value)).assertFalse();
        expect(value).assertLarger(0);
      }

      // --- [4] Verify the fractional double 3.14 is rejected because a primitive is never an Int8Array ---
      {
        let checker: util.types = new util.types();
        let value: double = 3.14;
        let rejected: boolean = checker.isInt8Array(value);
        expect(rejected).assertFalse();
      }

      // --- [5] Verify the negative fractional double -3.14, NaN and positive infinity are all rejected in a single pass ---
      {
        let checker: util.types = new util.types();
        let value: double = -3.14;
        expect(checker.isInt8Array(value)).assertFalse();
        let nonFinite: double[] = [Double.NaN, Double.POSITIVE_INFINITY];
        let hits: int = 0;
        for (const value_2 of nonFinite) {
          if (checker.isInt8Array(value_2)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1000
     * @tc.name testTypesIsInt8Array010
     * @tc.desc Merged batch (5 tests): Primitive value rejection: negative infinity is rejected because an infinite double is still a primitive; both boolean primitives true and false are rejected because a primitive is never an Int8Array; isInt8Array rejects a BigInt64Array and a BigUint64Array reached through an Object array; results pushed into a boolean array are read back in order, true first and false second; detection results stored in a record of booleans are read back with the signed entry true and the unsigned entry false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify negative infinity is rejected because an infinite double is still a primitive ---
      {
        let checker: util.types = new util.types();
        let flags: boolean[] = [checker.isInt8Array(Double.NEGATIVE_INFINITY)];
        expect(flags[0]).assertFalse();
      }

      // --- [2] Verify both boolean primitives true and false are rejected because a primitive is never an Int8Array ---
      {
        let checker: util.types = new util.types();
        let flags: boolean[] = [true, false];
        let accepted: int = 0;
        for (let i: int = 0; i < flags.length; i++) {
          if (checker.isInt8Array(flags[i])) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(0);
      }

      // --- [3] Verify isInt8Array rejects a BigInt64Array and a BigUint64Array reached through an Object array ---
      {
        let checker: util.types = new util.types();
        let signed: BigInt64Array = new BigInt64Array(2);
        let unsigned: BigUint64Array = new BigUint64Array(2);
        let carriers: Object[] = [signed, unsigned];
        expect(checker.isInt8Array(carriers[0])).assertFalse();
        expect(checker.isInt8Array(carriers[1])).assertFalse();
        expect(carriers.length).assertEqual(2);
      }

      // --- [4] Verify results pushed into a boolean array are read back in order, true first and false second ---
      {
        let checker: util.types = new util.types();
        let results: boolean[] = [];
        results.push(checker.isInt8Array(new Int8Array(1)));
        results.push(checker.isInt8Array(new Int16Array(1)));
        expect(results[0]).assertTrue();
        expect(results[1]).assertFalse();
      }

      // --- [5] Verify detection results stored in a record of booleans are read back with the signed entry true and the unsigned entry false ---
      {
        let checker: util.types = new util.types();
        let report: Record<string, boolean> = {
          'signed': checker.isInt8Array(new Int8Array(1)),
          'unsigned': checker.isInt8Array(new Uint8Array(1))
        };
        expect(report['signed']!).assertTrue();
        expect(report['unsigned']!).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1100
     * @tc.name testTypesIsInt8Array011
     * @tc.desc Merged batch (2 tests): Primitive value rejection: an already resolved Promise of the integer 1 is rejected as not an Int8Array; a BigInt64Array is rejected by isInt8Array while remaining a typed array and an array buffer view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an already resolved Promise of the integer 1 is rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let pending: Object = Promise.resolve<int>(1);
        expect(checker.isInt8Array(pending)).assertFalse();
        expect(checker.isPromise(pending)).assertTrue();
      }

      // --- [2] Verify a BigInt64Array is rejected by isInt8Array while remaining a typed array and an array buffer view ---
      {
        let checker: util.types = new util.types();
        let wideBuffer: ArrayBuffer = new ArrayBuffer(16);
        let wide: BigInt64Array = new BigInt64Array(wideBuffer);
        expect(checker.isInt8Array(wide)).assertFalse();
        expect(checker.isTypedArray(wide)).assertTrue();
        expect(checker.isArrayBufferView(wide)).assertTrue();
        expect(checker.isArrayBuffer(wide)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1200
     * @tc.name testTypesIsInt8Array012
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a plain integer array of 1, 2 and 3 is rejected and keeps a length of 3; an empty plain integer array is rejected because a plain array is never a typed array; isInt8Array rejects a two element string array and a three element boolean plain array; rejects a Date, which is not an integer typed array, and a RegExp built from the text probe; rejects an eight byte ArrayBuffer reached through an Object array element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a plain integer array of 1, 2 and 3 is rejected and keeps a length of 3 ---
      {
        let checker: util.types = new util.types();
        let values: int[] = [1, 2, 3];
        expect(checker.isInt8Array(values)).assertFalse();
        expect(values.length).assertEqual(3);
      }

      // --- [2] Verify an empty plain integer array is rejected because a plain array is never a typed array ---
      {
        let checker: util.types = new util.types();
        let values: int[] = [];
        expect(checker.isInt8Array(values)).assertFalse();
        expect(values.length).assertEqual(0);
      }

      // --- [3] Verify isInt8Array rejects a two element string array and a three element boolean plain array ---
      {
        let checker: util.types = new util.types();
        let words: string[] = ['a', 'b'];
        let flags: boolean[] = [true, false, true];
        expect(checker.isInt8Array(words)).assertFalse();
        expect(checker.isInt8Array(flags)).assertFalse();
        expect(words.length).assertEqual(2);
        expect(flags.length).assertEqual(3);
      }

      // --- [4] Verify a Date, which is not an integer typed array, and a RegExp built from the text probe are both rejected ---
      {
        let checker: util.types = new util.types();
        let now: Date = new Date();
        expect(checker.isInt8Array(now)).assertFalse();
        expect(checker.isTypedArray(now)).assertFalse();
        let pattern: RegExp = new RegExp('probe');
        expect(checker.isInt8Array(pattern)).assertFalse();
        expect(checker.isRegExp(pattern)).assertTrue();
      }

      // --- [5] Verify an eight byte ArrayBuffer reached through an Object array element is rejected ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let carriers: Array<Object> = [buffer];
        expect(checker.isInt8Array(carriers[0])).assertFalse();
        expect(buffer.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1300
     * @tc.name testTypesIsInt8Array013
     * @tc.desc Merged batch (5 tests): Non-target object rejection: isInt8Array rejects an Object array of a Date and an Error and a nested array of arrays; a user class instance holding a degree and an object literal carrying only length 4 are rejected, since shape alone does not count; an Error instance is rejected even though it is a native error object; a Map holding one entry is rejected because a key value store is not an Int8Array; a Set holding one entry is rejected because a value collection is not an Int8Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isInt8Array rejects an Object array of a Date and an Error and a nested array of arrays ---
      {
        let checker: util.types = new util.types();
        let mixed: Object[] = [new Date(), new Error('err')];
        let nested: int[][] = [[1], [2]];
        let holders: Object[] = [mixed, nested];
        expect(checker.isInt8Array(holders[0])).assertFalse();
        expect(checker.isInt8Array(holders[1])).assertFalse();
        expect(mixed.length).assertEqual(2);
        expect(nested.length).assertEqual(2);
      }

      // --- [2] Verify a user class instance holding a degree and an object literal carrying only length 4 are rejected, since shape alone does not count ---
      {
        let checker: util.types = new util.types();
        let probe: ThermalProbe = new ThermalProbe(25);
        expect(checker.isInt8Array(probe)).assertFalse();
        expect(probe.degree).assertEqual(25);
        let duck: LengthBag = { length: 4 };
        expect(checker.isInt8Array(duck)).assertFalse();
        expect(duck.length).assertEqual(4);
      }

      // --- [3] Verify an Error instance is rejected even though it is a native error object ---
      {
        let checker: util.types = new util.types();
        let failure: Error = new Error('err');
        expect(checker.isInt8Array(failure)).assertFalse();
        expect(checker.isNativeError(failure)).assertTrue();
      }

      // --- [4] Verify a Map holding one entry is rejected because a key value store is not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let table: Map<string, int> = new Map<string, int>();
        table.set('a', 1);
        expect(checker.isInt8Array(table)).assertFalse();
        expect(table.size).assertEqual(1);
      }

      // --- [5] Verify a Set holding one entry is rejected because a value collection is not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let bag: Set<string> = new Set<string>();
        bag.add('a');
        expect(checker.isInt8Array(bag)).assertFalse();
        expect(bag.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1400
     * @tc.name testTypesIsInt8Array014
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a WeakMap keyed by class instances and a WeakSet holding a class instance are rejected as not an Int8Array; a record literal with the single entry x equal to 1 is rejected as not an Int8Array; a class instance mimicking buffer, byteOffset, byteLength and length is still rejected; an object literal carrying both a buffer and a length of 2 is rejected as not an Int8Array; a key and a value iterator produced by a Map is rejected as not an Int8Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a WeakMap keyed by class instances and a WeakSet holding a class instance are rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let holder: WeakKeyHolder = new WeakKeyHolder();
        let weak: WeakMap<WeakKeyHolder, int> = new WeakMap<WeakKeyHolder, int>();
        weak.set(holder, 1);
        expect(checker.isInt8Array(weak)).assertFalse();
        let holder_2: WeakKeyHolder = new WeakKeyHolder();
        let weak_2: WeakSet<WeakKeyHolder> = new WeakSet<WeakKeyHolder>();
        weak_2.add(holder_2);
        expect(checker.isInt8Array(weak_2)).assertFalse();
      }

      // --- [2] Verify a record literal with the single entry x equal to 1 is rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let record: Record<string, int> = { 'x': 1 };
        expect(checker.isInt8Array(record)).assertFalse();
      }

      // --- [3] Verify a class instance mimicking buffer, byteOffset, byteLength and length is still rejected ---
      {
        let checker: util.types = new util.types();
        let fake: SurfaceInt8Array = new SurfaceInt8Array();
        expect(checker.isInt8Array(fake)).assertFalse();
        expect(fake.byteLength).assertEqual(2);
        expect(fake.byteOffset).assertEqual(0);
      }

      // --- [4] Verify an object literal carrying both a buffer and a length of 2 is rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let fake: BufferBag = { buffer: new ArrayBuffer(2), length: 2 };
        expect(checker.isInt8Array(fake)).assertFalse();
        expect(fake.length).assertEqual(2);
      }

      // --- [5] Verify a key and a value iterator produced by a Map is rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let source: Map<string, int> = new Map<string, int>();
        source.set('k', 1);
        let iterator: IterableIterator<string> = source.keys();
        expect(checker.isInt8Array(iterator)).assertFalse();
        let source_2: Map<string, int> = new Map<string, int>();
        source_2.set('k', 1);
        let iterator_2: IterableIterator<int> = source_2.values();
        expect(checker.isInt8Array(iterator_2)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1500
     * @tc.name testTypesIsInt8Array015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a synchronous arrow function value is rejected as not an Int8Array; an asynchronous arrow function value is rejected as not an Int8Array; rejects a Uint8Array widened to Object and for a plain object instance; a user class instance reached through an Object typed reference is still rejected; a plain array reached through an Object typed reference is still rejected.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a synchronous arrow function value is rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let fn: Function = (): int => 1;
        expect(checker.isInt8Array(fn)).assertFalse();
        expect(checker.isAsyncFunction(fn)).assertFalse();
      }

      // --- [2] Verify an asynchronous arrow function value is rejected as not an Int8Array ---
      {
        let checker: util.types = new util.types();
        let fn: Function = async (): Promise<void> => { };
        expect(checker.isInt8Array(fn)).assertFalse();
        expect(checker.isAsyncFunction(fn)).assertTrue();
      }

      // --- [3] Verify isInt8Array returns false for a Uint8Array widened to Object and for a plain object instance ---
      {
        let checker: util.types = new util.types();
        let held: Object = new Uint8Array(2);
        let plain: Object = new Object();
        expect(checker.isInt8Array(held)).assertFalse();
        expect(checker.isInt8Array(plain)).assertFalse();
      }

      // --- [4] Verify a user class instance reached through an Object typed reference is still rejected ---
      {
        let checker: util.types = new util.types();
        let held: Object = new ThermalProbe(30);
        let candidates: Object[] = [held];
        let hits: int = 0;
        for (let candidate of candidates) {
          if (checker.isInt8Array(candidate)) {
            hits += 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [5] Verify a plain array reached through an Object typed reference is still rejected ---
      {
        let checker: util.types = new util.types();
        let held: Object = [1, 2, 3];
        expect(checker.isInt8Array(held)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1600
     * @tc.name testTypesIsInt8Array016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a copy constructed from a nonzero offset subarray takes only the window values and does not share the base storage; isInt8Array rejects Int32Array, Uint16Array and Uint32Array views over one shared buffer; a DataView over an eight byte buffer is rejected even though it is an array buffer view; a DataView with byte offset 2 and length 4 is rejected while keeping a byte length of 4; per view verdicts recorded in a map keyed by the value itself, the Int8Array entry true and the Uint8Array entry false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a copy constructed from a nonzero offset subarray takes only the window values and does not share the base storage ---
      {
        let checker: util.types = new util.types();
        let base: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
        let window: Int8Array = base.subarray(1, 4);
        let copy: Int8Array = new Int8Array(window);
        copy.$_set(0, 99);
        expect(checker.isInt8Array(copy)).assertTrue();
        expect(copy.length).assertEqual(3);
        expect(base.$_get(1)).assertEqual(20);
      }

      // --- [2] Verify isInt8Array rejects Int32Array, Uint16Array and Uint32Array views over one shared buffer ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let signed: Int32Array = new Int32Array(buffer);
        let narrowUnsigned: Uint16Array = new Uint16Array(buffer);
        let wideUnsigned: Uint32Array = new Uint32Array(buffer);
        expect(checker.isInt8Array(signed)).assertFalse();
        expect(checker.isInt8Array(narrowUnsigned)).assertFalse();
        expect(checker.isInt8Array(wideUnsigned)).assertFalse();
        expect(signed.length).assertEqual(4);
        expect(narrowUnsigned.length).assertEqual(8);
        expect(wideUnsigned.length).assertEqual(4);
      }

      // --- [3] Verify a DataView over an eight byte buffer is rejected even though it is an array buffer view ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: DataView = new DataView(buffer);
        expect(checker.isInt8Array(view)).assertFalse();
        expect(view.byteLength).assertEqual(8);
      }

      // --- [4] Verify a DataView with byte offset 2 and length 4 is rejected while keeping a byte length of 4 ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: DataView = new DataView(buffer, 2, 4);
        expect(checker.isInt8Array(view)).assertFalse();
        expect(view.byteLength).assertEqual(4);
        expect(view.byteOffset).assertEqual(2);
      }

      // --- [5] Verify per view verdicts recorded in a map keyed by the value itself, the Int8Array entry true and the Uint8Array entry false ---
      {
        let checker: util.types = new util.types();
        let signed: Int8Array = new Int8Array(2);
        let unsigned: Uint8Array = new Uint8Array(2);
        let verdicts: Map<Object, boolean> = new Map<Object, boolean>();
        verdicts.set(signed, checker.isInt8Array(signed));
        verdicts.set(unsigned, checker.isInt8Array(unsigned));
        expect(verdicts.get(signed)!).assertTrue();
        expect(verdicts.get(unsigned)!).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1700
     * @tc.name testTypesIsInt8Array017
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a slice of three elements is detected as a copy that does not share storage, a write into it leaving the source element 2 intact; rejects an Int8Array element of a typed array container is detected while the container itself; the four array predicates on an Int8Array, which is a typed array and an array buffer view; the four array predicates on a DataView, which is an array buffer view yet neither an int8 array nor an array buffer; a Uint8ClampedArray alias writing 130 makes the signed sibling read -126.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a slice of three elements is detected as a copy that does not share storage, a write into it leaving the source element 2 intact ---
      {
        let checker: util.types = new util.types();
        let base: Int8Array = new Int8Array([1, 2, 3, 4]);
        let copy: Int8Array = base.slice(1, 4);
        copy.$_set(0, 9);
        expect(checker.isInt8Array(copy)).assertTrue();
        expect(copy.length).assertEqual(3);
        expect(base.$_get(1)).assertEqual(2);
      }

      // --- [2] Verify an Int8Array element of a typed array container is detected while the container itself is rejected ---
      {
        let checker: util.types = new util.types();
        let group: Int8Array[] = [new Int8Array(1), new Int8Array(2)];
        expect(checker.isInt8Array(group[1])).assertTrue();
        expect(checker.isInt8Array(group)).assertFalse();
        expect(group.length).assertEqual(2);
      }

      // --- [3] Verify the four array predicates on an Int8Array, which is a typed array and an array buffer view but not an array buffer ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = new Int8Array(2);
        expect(checker.isInt8Array(array)).assertTrue();
        expect(checker.isTypedArray(array)).assertTrue();
        expect(checker.isArrayBufferView(array)).assertTrue();
        expect(checker.isArrayBuffer(array)).assertFalse();
      }

      // --- [4] Verify the four array predicates on a DataView, which is an array buffer view yet neither an int8 array nor an array buffer ---
      {
        let checker: util.types = new util.types();
        let bytes: Uint8Array = new Uint8Array(8);
        let view: DataView = new DataView(bytes.buffer);
        expect(checker.isInt8Array(view)).assertFalse();
        expect(checker.isArrayBufferView(view)).assertTrue();
        expect(checker.isArrayBuffer(view)).assertFalse();
        expect(checker.isAnyArrayBuffer(view)).assertFalse();
      }

      // --- [5] Verify a Uint8ClampedArray alias writing 130 makes the signed sibling read -126 while the clamped view is rejected yet still a typed array ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let signed: Int8Array = new Int8Array(buffer);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(buffer);
        clamped.$_set(0, 130);
        expect(checker.isInt8Array(signed)).assertTrue();
        expect(checker.isInt8Array(clamped)).assertFalse();
        expect(checker.isTypedArray(clamped)).assertTrue();
        expect(signed.$_get(0)).assertEqual(-126);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1800
     * @tc.name testTypesIsInt8Array018
     * @tc.desc Merged batch (1 test): Non-target object rejection: the host buffer keeps its byte length across the check and is still rejected on its own.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the host buffer keeps its byte length across the check and is still rejected on its own ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let view: Int8Array = new Int8Array(buffer);
        let sizeBefore: int = view.buffer.byteLength;
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.buffer.byteLength).assertEqual(sizeBefore);
        expect(checker.isInt8Array(buffer)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_1900
     * @tc.name testTypesIsInt8Array019
     * @tc.desc Merged batch (3 tests): Non-target object rejection: verifies rejection of unrelated objects, covering element counts including Uint8ClampedArray, Float32Array and Float64Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify an Int8Array copied from a two element Float64Array is confirmed asynchronously while the source is rejected ---
      {
        let checker: util.types = new util.types();
        let source: Float64Array = new Float64Array([3.5, 6.5]);
        let copied: Int8Array = new Int8Array(source);
        expect(await asyncInt8Check(checker, copied)).assertTrue();
        expect(checker.isInt8Array(source)).assertFalse();
        expect(copied.length).assertEqual(2);
      }

      // --- [2] Verify isInt8Array rejects Uint8ClampedArray, Float32Array and Float64Array instances, each keeping its length or byte length ---
      {
        let checker: util.types = new util.types();
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(2);
        let single: Float32Array = new Float32Array(2);
        let wide: Float64Array = new Float64Array(2);
        expect(checker.isInt8Array(clamped)).assertFalse();
        expect(clamped.length).assertEqual(2);
        expect(checker.isInt8Array(single)).assertFalse();
        expect(single.byteLength).assertEqual(8);
        expect(checker.isInt8Array(wide)).assertFalse();
        expect(wide.byteLength).assertEqual(16);
      }

      // --- [3] Verify the buffer reached through the array buffer property is rejected while elements stay 7 and 8 ---
      {
        let checker: util.types = new util.types();
        let source: Int8Array = new Int8Array([7, 8]);
        let underlying: ArrayBuffer = source.buffer;
        expect(checker.isInt8Array(underlying)).assertFalse();
        expect(source.$_get(0)).assertEqual(7);
        expect(source.$_get(1)).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2000
     * @tc.name testTypesIsInt8Array020
     * @tc.desc Merged batch (5 tests): View and buffer semantics: a view of the prime length 13 spanning its whole 13 byte buffer is detected with equal byte length and length; a view whose length is the product 5 times 5 is detected and reports that derived size as 25; a second view whose length is derived from another view length plus one is detected and is longer by exactly one; an Int8Array view with a byte offset of 2 and an explicit length of 3 is detected; a byte written through a DataView is read by the Int8Array sharing the buffer and the reverse direction reads too.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a view of the prime length 13 spanning its whole 13 byte buffer is detected with equal byte length and length ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(13);
        let view: Int8Array = new Int8Array(buffer);
        view.$_set(12, 127);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.byteLength).assertEqual(13);
        expect(view.byteLength).assertEqual(view.length);
        expect(view.$_get(12)).assertEqual(127);
      }

      // --- [2] Verify a view whose length is the product 5 times 5 is detected and reports that derived size as 25 ---
      {
        let checker: util.types = new util.types();
        let length: int = 5 * 5;
        let view: Int8Array = new Int8Array(length);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.byteLength).assertEqual(25);
        expect(view.length).assertEqual(length);
      }

      // --- [3] Verify a second view whose length is derived from another view length plus one is detected and is longer by exactly one ---
      {
        let checker: util.types = new util.types();
        let source: Int8Array = new Int8Array(6);
        let wider: Int8Array = new Int8Array(source.length + 1);
        expect(checker.isInt8Array(source)).assertTrue();
        expect(checker.isInt8Array(wider)).assertTrue();
        expect(wider.length - source.length).assertEqual(1);
      }

      // --- [4] Verify an Int8Array view with a byte offset of 2 and an explicit length of 3 is detected ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Int8Array = new Int8Array(buffer, 2, 3);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.length).assertEqual(3);
        expect(view.byteLength).assertEqual(3);
      }

      // --- [5] Verify a byte written through a DataView is read by the Int8Array sharing the buffer and the reverse direction reads too ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Int8Array = new Int8Array(buffer, 0, 1);
        let data: DataView = new DataView(buffer);
        data.setInt8(0, -5);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.$_get(0)).assertEqual(-5);
        let buffer_2: ArrayBuffer = new ArrayBuffer(8);
        let view_2: Int8Array = new Int8Array(buffer_2, 0, 1);
        let data_2: DataView = new DataView(buffer_2);
        view_2.$_set(0, 100);
        expect(checker.isInt8Array(view_2)).assertTrue();
        expect(data_2.getInt8(0)).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2100
     * @tc.name testTypesIsInt8Array021
     * @tc.desc Merged batch (5 tests): View and buffer semantics: the Int8Array produced by subarray(2, 5) of a length 8 array is detected with length 3; a subarray shares its buffer with the base array, proving the byte 99 written there; a view built at offset 8 of a sixteen byte buffer still reaches the whole 16 byte buffer; two disjoint windows of length 5 and 7 over one 12 byte buffer are both detected and partition the buffer exactly; accepts a window ending exactly at the buffer end and a subarray of a subarray with offset 3 and length 3.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the Int8Array produced by subarray(2, 5) of a length 8 array is detected with length 3 ---
      {
        let checker: util.types = new util.types();
        let base: Int8Array = new Int8Array(8);
        let sub: Int8Array = base.subarray(2, 5);
        expect(checker.isInt8Array(sub)).assertTrue();
        expect(sub.length).assertEqual(3);
      }

      // --- [2] Verify a subarray shares its buffer with the base array, proving the byte 99 written there ---
      {
        let checker: util.types = new util.types();
        let base: Int8Array = new Int8Array(6);
        let sub: Int8Array = base.subarray(2, 4);
        expect(checker.isInt8Array(base)).assertTrue();
        expect(checker.isInt8Array(sub)).assertTrue();
        sub.$_set(0, 99);
        expect(base.$_get(2)).assertEqual(99);
      }

      // --- [3] Verify a view built at offset 8 of a sixteen byte buffer still reaches the whole 16 byte buffer ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let view: Int8Array = new Int8Array(buffer, 8, 3);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.buffer.byteLength).assertEqual(16);
        expect(view.byteLength).assertEqual(3);
      }

      // --- [4] Verify two disjoint windows of length 5 and 7 over one 12 byte buffer are both detected and partition the buffer exactly ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(12);
        let left: Int8Array = new Int8Array(buffer, 0, 5);
        let right: Int8Array = new Int8Array(buffer, 5, 7);
        expect(checker.isInt8Array(left)).assertTrue();
        expect(checker.isInt8Array(right)).assertTrue();
        expect(left.length + right.length).assertEqual(buffer.byteLength);
      }

      // --- [5] Verify a window ending exactly at the buffer end and a subarray of a subarray with offset 3 and length 3 are both accepted ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Int8Array = new Int8Array(buffer, 4, 4);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.byteOffset + view.byteLength).assertEqual(buffer.byteLength);
        let base: Int8Array = new Int8Array(10);
        let outer: Int8Array = base.subarray(2, 8);
        let inner: Int8Array = outer.subarray(1, 4);
        expect(checker.isInt8Array(inner)).assertTrue();
        expect(inner.length).assertEqual(3);
        expect(inner.byteOffset).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2200
     * @tc.name testTypesIsInt8Array022
     * @tc.desc Merged batch (5 tests): View and buffer semantics: an empty subarray window built by subarray of the same two bounds is detected with length 0; the signed view writing -1 surfaces as 255 through the unsigned alias, with the unsigned one still an array buffer view; a second view built from the buffer property of an existing view is detected and shares storage with the first; an omitted length view at byte offset 2 spans 6 bytes; a two byte 0x0102 written through the Int16Array alias appears as the little endian bytes 2 and 1 in the shared Int8Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an empty subarray window built by subarray of the same two bounds is detected with length 0 ---
      {
        let checker: util.types = new util.types();
        let base: Int8Array = new Int8Array(8);
        let empty: Int8Array = base.subarray(2, 2);
        expect(checker.isInt8Array(empty)).assertTrue();
        expect(empty.length).assertEqual(0);
        expect(empty.byteLength).assertEqual(0);
      }

      // --- [2] Verify the signed view writing -1 surfaces as 255 through the unsigned alias, with the unsigned one still an array buffer view ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let signed: Int8Array = new Int8Array(buffer);
        let unsigned: Uint8Array = new Uint8Array(buffer);
        signed.$_set(0, -1);
        expect(checker.isInt8Array(signed)).assertTrue();
        expect(checker.isArrayBufferView(unsigned)).assertTrue();
        expect(unsigned.$_get(0)).assertEqual(255);
      }

      // --- [3] Verify a second view built from the buffer property of an existing view is detected and shares storage with the first ---
      {
        let checker: util.types = new util.types();
        let source: Int8Array = new Int8Array([4, 5]);
        let reused: ArrayBuffer = source.buffer;
        let second: Int8Array = new Int8Array(reused);
        second.$_set(1, 6);
        expect(checker.isInt8Array(source)).assertTrue();
        expect(checker.isInt8Array(second)).assertTrue();
        expect(source.$_get(1)).assertEqual(6);
      }

      // --- [4] Verify an omitted length view at byte offset 2 spans 6 bytes while an explicit empty window sits at byte offset 8 ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let span: Int8Array = new Int8Array(buffer, 2);
        let tail: Int8Array = new Int8Array(buffer, 8, 0);
        expect(checker.isInt8Array(span)).assertTrue();
        expect(span.byteOffset).assertEqual(2);
        expect(span.length).assertEqual(6);
        expect(checker.isInt8Array(tail)).assertTrue();
        expect(tail.byteOffset).assertEqual(8);
        expect(tail.length).assertEqual(0);
      }

      // --- [5] Verify a two byte 0x0102 written through the Int16Array alias appears as the little endian bytes 2 and 1 in the shared Int8Array ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let signed: Int8Array = new Int8Array(buffer);
        let wide: Int16Array = new Int16Array(buffer);
        wide.$_set(0, 0x0102);
        expect(checker.isInt8Array(signed)).assertTrue();
        expect(checker.isInt8Array(wide)).assertFalse();
        expect(signed.$_get(0)).assertEqual(2);
        expect(signed.$_get(1)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2300
     * @tc.name testTypesIsInt8Array023
     * @tc.desc Merged batch (5 tests): View and buffer semantics: across a base array, its subarray and their shared buffer only the two arrays are detected and only they are array buffer views; the byte 0x5A written through a Uint8Array survives detection of the Int8Array view; a 16 element window at offset 13 of a 29 byte buffer is detected and ends exactly at the buffer end; an offset view keeps byte offset 3, length 3 and byte length 3 after being detected; checking a subarray leaves the base elements outside its window unchanged.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify across a base array, its subarray and their shared buffer only the two arrays are detected and only they are array buffer views ---
      {
        let checker: util.types = new util.types();
        let base: Int8Array = new Int8Array(4);
        let window: Int8Array = base.subarray(1, 3);
        let buffer: ArrayBuffer = base.buffer;
        expect(checker.isInt8Array(base)).assertTrue();
        expect(checker.isInt8Array(window)).assertTrue();
        expect(checker.isInt8Array(buffer)).assertFalse();
        expect(checker.isArrayBufferView(buffer)).assertFalse();
        expect(checker.isArrayBufferView(base)).assertTrue();
      }

      // --- [2] Verify the byte 0x5A written through a Uint8Array survives detection of the Int8Array view ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let bytes: Uint8Array = new Uint8Array(buffer);
        bytes.$_set(0, 0x5A);
        let view: Int8Array = new Int8Array(buffer);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(bytes.$_get(0)).assertEqual(0x5A);
      }

      // --- [3] Verify a 16 element window at offset 13 of a 29 byte buffer is detected and ends exactly at the buffer end ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(29);
        let view: Int8Array = new Int8Array(buffer, 13, 16);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.byteOffset + view.length).assertEqual(29);
        expect(view.byteLength).assertEqual(16);
      }

      // --- [4] Verify an offset view keeps byte offset 3, length 3 and byte length 3 after being detected ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let view: Int8Array = new Int8Array(buffer, 3, 3);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(view.byteOffset).assertEqual(3);
        expect(view.length).assertEqual(3);
        expect(view.byteLength).assertEqual(3);
      }

      // --- [5] Verify checking a subarray leaves the base elements outside its window unchanged ---
      {
        let checker: util.types = new util.types();
        let base: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
        let window: Int8Array = base.subarray(2, 4);
        expect(checker.isInt8Array(window)).assertTrue();
        expect(base.$_get(0)).assertEqual(1);
        expect(base.$_get(5)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2400
     * @tc.name testTypesIsInt8Array024
     * @tc.desc Merged batch (4 tests): View and buffer semantics: checks offsets, lengths and backing-buffer behavior, covering ArrayBuffer objects.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three views over one buffer are split correctly, only the Int8Array sibling being detected ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let signed: Int8Array = new Int8Array(buffer);
        let unsigned: Uint8Array = new Uint8Array(buffer);
        let wide: Int16Array = new Int16Array(buffer);
        expect(checker.isInt8Array(signed)).assertTrue();
        expect(checker.isInt8Array(unsigned)).assertFalse();
        expect(checker.isInt8Array(wide)).assertFalse();
      }

      // --- [2] Verify the signed and unsigned views over one buffer agree on isTypedArray and isArrayBufferView yet differ on isInt8Array ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let signed: Int8Array = new Int8Array(buffer);
        let unsigned: Uint8Array = new Uint8Array(buffer);
        let signedTyped: boolean = checker.isTypedArray(signed);
        let unsignedTyped: boolean = checker.isTypedArray(unsigned);
        expect(checker.isInt8Array(signed)).assertTrue();
        expect(checker.isInt8Array(unsigned)).assertFalse();
        expect(signedTyped).assertEqual(unsignedTyped);
        expect(checker.isArrayBufferView(signed)).assertEqual(checker.isArrayBufferView(unsigned));
      }

      // --- [3] Verify a subarray relayed through the checker helper is detected while the base elements stay unchanged ---
      {
        let checker: util.types = new util.types();
        let base: Int8Array = new Int8Array([1, 2, 3, 4]);
        let window: Int8Array = base.subarray(1, 3);
        let result: boolean = classifyThroughChecker(checker, window);
        expect(result).assertTrue();
        expect(checker.isInt8Array(base)).assertTrue();
        expect(base.$_get(2)).assertEqual(3);
      }

      // --- [4] Verify the four array predicates on a plain ArrayBuffer, which is an array buffer and any array buffer but never a view ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        expect(checker.isInt8Array(buffer)).assertFalse();
        expect(checker.isArrayBuffer(buffer)).assertTrue();
        expect(checker.isArrayBufferView(buffer)).assertFalse();
        expect(checker.isAnyArrayBuffer(buffer)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2500
     * @tc.name testTypesIsInt8Array025
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: an Int8Array used as a Map key is detected while the entry count stays 1; a single element array reports byte length 1 and a zero size array keeps a length of 0; 128 wraps to -128 beside a 127 slot and writes at both end slots leave the untouched middle slot at zero; a filter over a mixed two entry list keeps exactly the entry the check accepts; an Int8Array built from the negative elements -5 and -6 is detected and keeps them.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int8Array used as a Map key is detected while the entry count stays 1 ---
      {
        let checker: util.types = new util.types();
        let key: Int8Array = new Int8Array(2);
        let table: Map<Int8Array, string> = new Map<Int8Array, string>();
        table.set(key, 'signed');
        expect(checker.isInt8Array(key)).assertTrue();
        expect(table.size).assertEqual(1);
      }

      // --- [2] Verify a single element array reports byte length 1 and a zero size array keeps a length of 0 ---
      {
        let checker: util.types = new util.types();
        let single: Int8Array = new Int8Array(1);
        let empty: Int8Array = new Int8Array(0);
        expect(checker.isInt8Array(single)).assertTrue();
        expect(single.byteLength).assertEqual(1);
        expect(checker.isInt8Array(empty)).assertTrue();
        expect(empty.length).assertEqual(0);
      }

      // --- [3] Verify 128 wraps to -128 beside a 127 slot and writes at both end slots leave the untouched middle slot at zero ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = new Int8Array(2);
        array.$_set(0, 128);
        array.$_set(1, 127);
        expect(checker.isInt8Array(array)).assertTrue();
        expect(array.$_get(0)).assertEqual(-128);
        expect(array.$_get(1)).assertEqual(127);
        let hundred: Int8Array = new Int8Array(100);
        hundred.$_set(0, 11);
        hundred.$_set(hundred.length - 1, 99);
        expect(hundred.$_get(0)).assertEqual(11);
        expect(hundred.$_get(50)).assertEqual(0);
        expect(hundred.$_get(99)).assertEqual(99);
        expect(checker.isInt8Array(hundred)).assertTrue();
      }

      // --- [4] Verify a filter over a mixed two entry list keeps exactly the entry the check accepts ---
      {
        let checker: util.types = new util.types();
        let mixed: Object[] = [new Int8Array(2), new Uint8Array(2)];
        let kept: Object[] = mixed.filter((item: Object): boolean => checker.isInt8Array(item));
        expect(kept.length).assertEqual(1);
        expect(checker.isInt8Array(kept[0])).assertTrue();
      }

      // --- [5] Verify an Int8Array built from the negative elements -5 and -6 is detected and keeps them ---
      {
        let checker: util.types = new util.types();
        let negative: Int8Array = new Int8Array([-5, -6]);
        expect(checker.isInt8Array(negative)).assertTrue();
        expect(negative.$_get(0)).assertEqual(-5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2600
     * @tc.name testTypesIsInt8Array026
     * @tc.desc Merged batch (3 tests): State preservation and aliasing: the signed byte minimum -128 stored in the array survives the detection untouched; set copies elements from another array into the given offset and the target keeps its verdict; an Int8Array built from the positive elements 1, 2 and 3 is detected and keeps them.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the signed byte minimum -128 stored in the array survives the detection untouched ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = new Int8Array([-128, 127]);
        expect(checker.isInt8Array(array)).assertTrue();
        expect(array.$_get(0)).assertEqual(-128);
        expect(array.$_get(1)).assertEqual(127);
      }

      // --- [2] Verify set copies elements from another array into the given offset and the target keeps its verdict ---
      {
        let checker: util.types = new util.types();
        let source: Int8Array = new Int8Array([5, 6]);
        let target: Int8Array = new Int8Array(4);
        target.set(source, 1);
        expect(target[1]).assertEqual(5);
        expect(target[0]).assertEqual(0);
        expect(checker.isInt8Array(target)).assertTrue();
      }

      // --- [3] Verify an Int8Array built from the positive elements 1, 2 and 3 is detected and keeps them ---
      {
        let checker: util.types = new util.types();
        let positive: Int8Array = new Int8Array([1, 2, 3]);
        expect(checker.isInt8Array(positive)).assertTrue();
        expect(positive.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2700
     * @tc.name testTypesIsInt8Array027
     * @tc.desc Merged batch (5 tests): Container and field storage: a byte slot written with 300 reads back the low eight bits 300 modulo 256 which is 44; an Int8Array holding the full signed byte span -128, -1, 0, 1 and 127 is detected; a signed byte slot written with 255 through the element setter reads back as -1 because only the low eight bits are kept; an Int8Array read from an interface field keeps its length and one held in a class field reports byteLength 5; one Int8Array referenced from both a Set and a map value is detected through the shared reference.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a byte slot written with 300 reads back the low eight bits 300 modulo 256 which is 44 ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = new Int8Array(new ArrayBuffer(1));
        array.$_set(0, 300);
        expect(checker.isInt8Array(array)).assertTrue();
        expect(array.$_get(0)).assertEqual(44);
      }

      // --- [2] Verify an Int8Array holding the full signed byte span -128, -1, 0, 1 and 127 is detected ---
      {
        let checker: util.types = new util.types();
        let fullRange: Int8Array = new Int8Array([-128, -1, 0, 1, 127]);
        expect(checker.isInt8Array(fullRange)).assertTrue();
        expect(fullRange.$_get(1)).assertEqual(-1);
        expect(fullRange.$_get(3)).assertEqual(1);
      }

      // --- [3] Verify a signed byte slot written with 255 through the element setter reads back as -1 because only the low eight bits are kept ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = new Int8Array(1);
        array.$_set(0, 255);
        expect(checker.isInt8Array(array)).assertTrue();
        expect(array.$_get(0)).assertEqual(-1);
      }

      // --- [4] Verify an Int8Array read from an interface field keeps its length and one held in a class field reports byteLength 5 ---
      {
        let checker: util.types = new util.types();
        let bag: PayloadBag = { payload: new Int8Array(3) };
        expect(checker.isInt8Array(bag.payload)).assertTrue();
        expect(bag.payload.length).assertEqual(3);
        let holder: ParcelHolder = new ParcelHolder(new Int8Array(5));
        expect(checker.isInt8Array(holder.content)).assertTrue();
        expect(holder.content.byteLength).assertEqual(5);
      }

      // --- [5] Verify one Int8Array referenced from both a Set and a map value is detected through the shared reference ---
      {
        let checker: util.types = new util.types();
        let member: Int8Array = new Int8Array(2);
        let bag: Set<Int8Array> = new Set<Int8Array>();
        bag.add(member);
        let table: Map<string, Int8Array> = new Map<string, Int8Array>();
        table.set('slot', member);
        expect(checker.isInt8Array(member)).assertTrue();
        expect(bag.has(member)).assertTrue();
        expect(table.has('slot')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2800
     * @tc.name testTypesIsInt8Array028
     * @tc.desc Merged batch (3 tests): Container and field storage: an Int8Array stored as a Map value and read back through get is detected; read from a Record field is detected with its length intact; kept as a WeakMap value is detected.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Int8Array stored as a Map value and read back through get is detected ---
      {
        let checker: util.types = new util.types();
        let table: Map<string, Int8Array> = new Map<string, Int8Array>();
        table.set('slot', new Int8Array(2));
        let stored: Int8Array | undefined = table.get('slot');
        expect(checker.isInt8Array(stored!)).assertTrue();
      }

      // --- [2] Verify an Int8Array read from a Record field is detected with its length intact ---
      {
        let checker: util.types = new util.types();
        let record: Record<string, Int8Array> = { 'slot': new Int8Array(2) };
        let stored: Int8Array = record['slot']!;
        expect(checker.isInt8Array(stored)).assertTrue();
        expect(stored.length).assertEqual(2);
      }

      // --- [3] Verify an Int8Array kept as a WeakMap value is detected ---
      {
        let checker: util.types = new util.types();
        let holder: WeakKeyHolder = new WeakKeyHolder();
        let value: Int8Array = new Int8Array(2);
        let weak: WeakMap<WeakKeyHolder, Int8Array> = new WeakMap<WeakKeyHolder, Int8Array>();
        weak.set(holder, value);
        expect(checker.isInt8Array(value)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_2900
     * @tc.name testTypesIsInt8Array029
     * @tc.desc Merged batch (5 tests): API call consistency: two separate checker instances give the same verdict for one shared Int8Array; two identical calls on the same instance return the same boolean and the second is true; one checker rejects an ArrayBuffer, accepts two Int8Array instances, then rejects an Int16Array; one instance accepts an Int8Array for isInt8Array then a Date for isDate without interference; one instance rejects a Uint8Array for isInt8Array yet accepts it for isTypedArray.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two separate checker instances give the same verdict for one shared Int8Array ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let array: Int8Array = new Int8Array(2);
        expect(first.isInt8Array(array)).assertEqual(second.isInt8Array(array));
        expect(second.isInt8Array(array)).assertTrue();
      }

      // --- [2] Verify two identical calls on the same instance return the same boolean and the second is true ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = new Int8Array(8);
        let first: boolean = checker.isInt8Array(array);
        let second: boolean = checker.isInt8Array(array);
        expect(first).assertEqual(second);
        expect(second).assertTrue();
      }

      // --- [3] Verify one checker rejects an ArrayBuffer, accepts two Int8Array instances, then rejects an Int16Array ---
      {
        let checker: util.types = new util.types();
        let missed: boolean = checker.isInt8Array(new ArrayBuffer(4));
        let hit: boolean = checker.isInt8Array(new Int8Array(4));
        expect(missed).assertFalse();
        expect(hit).assertTrue();

        let arrayHit: boolean = checker.isInt8Array(new Int8Array(2));
        let wideMiss: boolean = checker.isInt8Array(new Int16Array(2));
        expect(arrayHit).assertTrue();
        expect(wideMiss).assertFalse();
      }

      // --- [4] Verify one instance accepts an Int8Array for isInt8Array then a Date for isDate without interference ---
      {
        let checker: util.types = new util.types();
        let arrayHit: boolean = checker.isInt8Array(new Int8Array(4));
        let dateHit: boolean = checker.isDate(new Date());
        expect(arrayHit).assertTrue();
        expect(dateHit).assertTrue();
      }

      // --- [5] Verify one instance rejects a Uint8Array for isInt8Array yet accepts it for isTypedArray ---
      {
        let checker: util.types = new util.types();
        let arrayMiss: boolean = checker.isInt8Array(new Uint8Array(2));
        let typedHit: boolean = checker.isTypedArray(new Uint8Array(2));
        expect(arrayMiss).assertFalse();
        expect(typedHit).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_3000
     * @tc.name testTypesIsInt8Array030
     * @tc.desc Merged batch (2 tests): API call consistency: rejects over one buffer the Int8Array view is accepted while the buffer itself; a Set value iterator is rejected by isInt8Array although isSetIterator accepts it.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify over one buffer the Int8Array view is accepted while the buffer itself is rejected ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Int8Array = new Int8Array(buffer);
        expect(checker.isInt8Array(view)).assertTrue();
        expect(checker.isInt8Array(buffer)).assertFalse();
      }

      // --- [2] Verify a Set value iterator is rejected by isInt8Array although isSetIterator accepts it ---
      {
        let checker: util.types = new util.types();
        let bag: Set<string> = new Set<string>();
        bag.add('a');
        let iterator: IterableIterator<string> = bag.values();
        expect(checker.isInt8Array(iterator)).assertFalse();
        expect(checker.isSetIterator(iterator)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_INT8_ARRAY_3100
     * @tc.name testTypesIsInt8Array031
     * @tc.desc Merged batch (4 tests): Program integration: verifies use through program paths, covering typed array views including Uint8Array and Int16Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsInt8Array031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a helper function that forwards the value to the checker reports an Int8Array as true ---
      {
        let checker: util.types = new util.types();
        let result: boolean = classifyThroughChecker(checker, new Int8Array(2));
        expect(result).assertTrue();
      }

      // --- [2] Verify a loop over lengths 1, 2 and 3 builds three Int8Arrays and all three are detected ---
      {
        let checker: util.types = new util.types();
        let allHit: boolean = true;
        for (let index: int = 0; index < 3; index++) {
          if (!checker.isInt8Array(new Int8Array(index + 1))) {
            allHit = false;
          }
        }
        expect(allHit).assertTrue();
      }

      // --- [3] Verify a ternary driven by the detection result selects the Int8Array branch label ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = new Int8Array(2);
        let branch: string = checker.isInt8Array(array) ? 'int8-array' : 'other';
        expect(branch).assertEqual('int8-array');
      }

      // --- [4] Verify a switch takes the signed branch for an Int8Array and a helper with an early return labels an Int8Array signed and a Uint8Array other ---
      {
        let checker: util.types = new util.types();
        let array: Int8Array = new Int8Array(2);
        let wide: Int16Array = new Int16Array(2);
        let signBranch: string = '';
        let wideBranch: string = '';
        switch (checker.isInt8Array(array)) {
          case true:
            signBranch = 'signed';
            break;
          default:
            signBranch = 'other';
            break;
        }
        switch (checker.isInt8Array(wide)) {
          case true:
            wideBranch = 'signed';
            break;
          default:
            wideBranch = 'other';
            break;
        }
        expect(signBranch).assertEqual('signed');
        expect(wideBranch).assertEqual('other');
        let signed: string = signedLabel(checker, buildSignedWindow(2));
        let other: string = signedLabel(checker, new Uint8Array(2));
        expect(signed).assertEqual('signed');
        expect(other).assertEqual('other');
        expect(checker.isInt8Array(new Int8Array(2))).assertTrue();
      }
    });

  });
}
