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

class BufferBag {
  buf: ArrayBuffer = new ArrayBuffer(8);
}

class NullFieldBag {
  value: Object | null = null;
}

class TaggedObject {
  tag: string = 'keep';
}

class HeldKey {
  tag: string = 'k';
}

interface TaggedPair {
  tag: string;
}

function probeThroughObject(value: Object): boolean {
  return new util.types().isArrayBuffer(value);
}

function makeArrayBuffer(): ArrayBuffer {
  return new ArrayBuffer(8);
}

function plainNumberFn(): int {
  return 2;
}

async function asyncNumberTask(): Promise<int> {
  return 1;
}

function bigZeroValue(): bigint {
  return BigInt(0);
}

function bigMaxValue(): bigint {
  return BigInt('9223372036854775807');
}

class BufferFieldHolder {
  slot: ArrayBuffer = new ArrayBuffer(10);

  fetch(): ArrayBuffer {
    return this.slot;
  }

  swap(next: ArrayBuffer): void {
    this.slot = next;
  }
}

interface BufferSlot {
  bytes: ArrayBuffer;
  tag: string;
}

class BufferInspector {
  check(value: Object): boolean {
    return new util.types().isArrayBuffer(value);
  }
}

function buildBuffer(byteCount: int): ArrayBuffer {
  return new ArrayBuffer(byteCount);
}

function passBufferThrough(value: ArrayBuffer): ArrayBuffer {
  return value;
}

function passObjectThrough(value: Object): Object {
  return value;
}

function classifyByBuffer(value: Object): string {
  if (new util.types().isArrayBuffer(value)) {
    return 'buffer';
  }
  return 'other';
}

function countBuffers(items: Array<Object>): int {
  let total: int = 0;
  let index: int = 0;
  while (index < items.length) {
    if (new util.types().isArrayBuffer(items[index])) {
      total += 1;
    }
    index += 1;
  }
  return total;
}

function checkWith(receiver: util.types, value: Object): boolean {
  return receiver.isArrayBuffer(value);
}

function fillThroughArgument(target: ArrayBuffer, octet: int): void {
  let octetView: DataView = new DataView(target);
  octetView.setUint8(0, octet);
}

class BufferShapeAlike {
  byteLength: int = 8;
}

export default function typesIsArrayBufferTest(): void {
  describe('TypesIsArrayBufferTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0100
     * @tc.name testTypesIsArrayBuffer001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: a buffer sized as three times the length 9 of a seed view is recognized with the derived byteLength 27; sized from the length 6 of a string is recognized and reports that character count as byteLength; accepts an ArrayBuffer created inline as the single argument and reached only through an Object typed variable; a factory that builds a buffer from a byte count argument returns a recognized buffer of that size; captured by a lambda is recognized when the lambda runs, unlike a captured view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a buffer sized as three times the length 9 of a seed view is recognized with the derived byteLength 27 ---
      {
        let bufferProbe: util.types = new util.types();
        let seed: Uint8Array = new Uint8Array(9);
        let derived: ArrayBuffer = new ArrayBuffer(seed.length * 3);
        expect(bufferProbe.isArrayBuffer(derived)).assertTrue();
        expect(derived.byteLength).assertEqual(27);
      }

      // --- [2] Verify a buffer sized from the length 6 of a string is recognized and reports that character count as byteLength ---
      {
        let bufferProbe: util.types = new util.types();
        let seed: string = 'abcdef';
        let ab: ArrayBuffer = new ArrayBuffer(seed.length);
        expect(bufferProbe.isArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(6);
      }

      // --- [3] Verify isArrayBuffer returns true for an ArrayBuffer created inline as the single argument and reached only through an Object typed variable ---
      {
        let bufferChecker: util.types = new util.types();
        expect(bufferChecker.isArrayBuffer(new ArrayBuffer(2))).assertTrue();
        let bufferChecker_2: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let boxed: Object = ab as Object;
        expect(bufferChecker_2.isArrayBuffer(boxed)).assertTrue();
      }

      // --- [4] Verify a factory that builds a buffer from a byte count argument returns a recognized buffer of that size ---
      {
        let bufferProbe: util.types = new util.types();
        let made: ArrayBuffer = buildBuffer(19);
        let verdict: boolean = bufferProbe.isArrayBuffer(made);
        expect(verdict).assertTrue();
        expect(made.byteLength).assertEqual(19);
      }

      // --- [5] Verify a buffer captured by a lambda is recognized when the lambda runs, unlike a captured view ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(7);
        let probe: () => boolean = (): boolean => bufferProbe.isArrayBuffer(ab);
        expect(probe()).assertTrue();
        let view: Uint8Array = new Uint8Array(7);
        let viewProbe: () => boolean = (): boolean => bufferProbe.isArrayBuffer(view);
        expect(viewProbe()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0200
     * @tc.name testTypesIsArrayBuffer002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: isArrayBuffer accepts an eight byte buffer written in four radices and one filled with all 256 byte values through a Uint8Array; ArrayBuffer.from copies a byte range into a fresh buffer of the requested length that isArrayBuffer accepts; accepts a buffer already written through a DataView at offset 1; accepts the ArrayBuffer exposed by the buffer property of a Uint8Array; accepts the ArrayBuffer behind a DataView created with byteOffset 4.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer accepts an eight byte buffer written in four radices and one filled with all 256 byte values through a Uint8Array ---
      {
        let bufferProbe: util.types = new util.types();
        let binary: ArrayBuffer = new ArrayBuffer(0b1000);
        let octal: ArrayBuffer = new ArrayBuffer(0o10);
        let decimal: ArrayBuffer = new ArrayBuffer(8);
        let hex: ArrayBuffer = new ArrayBuffer(0x8);

        expect(binary.byteLength).assertEqual(8);
        expect(octal.byteLength).assertEqual(8);
        expect(decimal.byteLength).assertEqual(8);
        expect(hex.byteLength).assertEqual(8);
        expect(bufferProbe.isArrayBuffer(binary)).assertTrue();
        expect(bufferProbe.isArrayBuffer(octal)).assertTrue();
        expect(bufferProbe.isArrayBuffer(decimal)).assertTrue();
        expect(bufferProbe.isArrayBuffer(hex)).assertTrue();
        let bufferProbe_2: util.types = new util.types();
        let bytes: ArrayBuffer = new ArrayBuffer(256);
        let view: Uint8Array = new Uint8Array(bytes);
        let idx: int = 0;
        while (idx < 256) {
          view.$_set(idx, idx);
          idx += 1;
        }
        expect(view.$_get(255)).assertEqual(255);
        expect(bufferProbe_2.isArrayBuffer(bytes)).assertTrue();
      }

      // --- [2] Verify ArrayBuffer.from copies a byte range into a fresh buffer of the requested length that isArrayBuffer accepts ---
      {
        let bufferProbe: util.types = new util.types();
        let whole: ArrayBuffer = new ArrayBuffer(10);
        let middle: ArrayBuffer = ArrayBuffer.from(whole, 3, 4);
        expect(bufferProbe.isArrayBuffer(middle)).assertTrue();
        expect(middle.byteLength).assertEqual(4);
        expect(bufferProbe.isArrayBuffer(whole)).assertTrue();
      }

      // --- [3] Verify isArrayBuffer returns true for a buffer already written through a DataView at offset 1 ---
      {
        let bufferChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let w: DataView = new DataView(ab);
        w.setUint8(1, 77);
        expect(bufferChecker.isArrayBuffer(ab)).assertTrue();
      }

      // --- [4] Verify isArrayBuffer returns true for the ArrayBuffer exposed by the buffer property of a Uint8Array ---
      {
        let bufferProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([1, 2, 3]);
        expect(bufferProbe.isArrayBuffer(uint8View.buffer)).assertTrue();
        expect(uint8View.buffer.byteLength).assertEqual(3);
      }

      // --- [5] Verify isArrayBuffer returns true for the ArrayBuffer behind a DataView created with byteOffset 4 ---
      {
        let bufferProbe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let dv: DataView = new DataView(host, 4, 8);
        expect(dv.byteOffset).assertEqual(4);
        expect(bufferProbe.isArrayBuffer(dv.buffer)).assertTrue();
        expect(dv.buffer.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0300
     * @tc.name testTypesIsArrayBuffer003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: slice(2, 6) yields a four byte ArrayBuffer and slice(0) a full eight byte clone, both recognised; accepts it; accepts one ArrayBuffer shared by an Int16Array view and a Uint8Array view; three typed arrays of different widths mounted on one buffer cover its byteLength exactly; a slice copy is a distinct ArrayBuffer whose bytes ignore writes made to the source after the copy.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify slice(2, 6) yields a four byte ArrayBuffer and slice(0) a full eight byte clone, both recognised ---
      {
        let bufferProbe: util.types = new util.types();
        let big: ArrayBuffer = new ArrayBuffer(8);
        let part: ArrayBuffer = big.slice(2, 6);
        let whole: ArrayBuffer = big.slice(0);
        expect(bufferProbe.isArrayBuffer(part)).assertTrue();
        expect(part.byteLength).assertEqual(4);
        expect(bufferProbe.isArrayBuffer(whole)).assertTrue();
        expect(whole.byteLength).assertEqual(8);
      }

      // --- [2] Verify the buffer of a subarray view is the very same ArrayBuffer object and isArrayBuffer returns true for it ---
      {
        let bufferProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(16);
        let sub: Uint8Array = uint8View.subarray(4, 10);
        expect(sub.buffer).assertEqual(uint8View.buffer);
        expect(bufferProbe.isArrayBuffer(sub.buffer)).assertTrue();
      }

      // --- [3] Verify isArrayBuffer returns true for one ArrayBuffer shared by an Int16Array view and a Uint8Array view ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let int16View: Int16Array = new Int16Array(buf);
        let uint8View: Uint8Array = new Uint8Array(buf);
        expect(int16View.buffer).assertEqual(uint8View.buffer);
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
      }

      // --- [4] Verify three typed arrays of different widths mounted on one buffer cover its byteLength exactly while none of the views is a buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(24);
        let a: Int8Array = new Int8Array(buf, 0, 8);
        let b: Int32Array = new Int32Array(buf, 8, 2);
        let c: Float32Array = new Float32Array(buf, 16, 2);
        let covered: int = a.byteLength + b.byteLength + c.byteLength;
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
        expect(covered).assertEqual(buf.byteLength);
        expect(bufferProbe.isArrayBuffer(a)).assertFalse();
        expect(bufferProbe.isArrayBuffer(b)).assertFalse();
        expect(bufferProbe.isArrayBuffer(c)).assertFalse();
      }

      // --- [5] Verify a slice copy is a distinct ArrayBuffer whose bytes ignore writes made to the source after the copy ---
      {
        let bufferProbe: util.types = new util.types();
        let src: ArrayBuffer = new ArrayBuffer(8);
        let w: DataView = new DataView(src);
        w.setUint8(0, 11);
        let copy: ArrayBuffer = src.slice(0, 4);
        w.setUint8(0, 22);
        let cw: DataView = new DataView(copy);
        expect(bufferProbe.isArrayBuffer(copy)).assertTrue();
        expect(copy.byteLength).assertEqual(4);
        expect(cw.getUint8(0)).assertEqual(11);
        expect(src === copy).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0400
     * @tc.name testTypesIsArrayBuffer004
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: two slice copies of one window are three separate ArrayBuffers, each recognized on its own; the buffer behind a three element Int32Array reports four bytes per element and is recognized; after detection two overlapping views on one buffer still read the same byte value; a DataView built over a slice copy exposes that copy as its underlying recognized buffer; a trailing window DataView pins the buffer byteLength to the sum of its byteOffset 5 and byteLength 8.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two slice copies of one window are three separate ArrayBuffers, each recognized on its own ---
      {
        let bufferProbe: util.types = new util.types();
        let src: ArrayBuffer = new ArrayBuffer(16);
        let a: ArrayBuffer = src.slice(0, 8);
        let b: ArrayBuffer = src.slice(0, 8);
        expect(bufferProbe.isArrayBuffer(a)).assertTrue();
        expect(bufferProbe.isArrayBuffer(b)).assertTrue();
        expect(a === b).assertFalse();
        expect(a.byteLength).assertEqual(b.byteLength);
      }

      // --- [2] Verify the buffer behind a three element Int32Array reports four bytes per element and is recognized ---
      {
        let bufferProbe: util.types = new util.types();
        let int32View: Int32Array = new Int32Array(3);
        expect(bufferProbe.isArrayBuffer(int32View.buffer)).assertTrue();
        expect(int32View.buffer.byteLength).assertEqual(int32View.length * 4);
        expect(bufferProbe.isArrayBuffer(int32View)).assertFalse();
      }

      // --- [3] Verify after detection two overlapping views on one buffer still read the same byte value ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let a: Uint8Array = new Uint8Array(buf);
        let b: Uint8Array = new Uint8Array(buf, 2, 2);
        a.$_set(2, 88);
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
        expect(b.$_get(0)).assertEqual(88);
        expect(a.$_get(2)).assertEqual(b.$_get(0));
      }

      // --- [4] Verify a DataView built over a slice copy exposes that copy as its underlying recognized buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let src: ArrayBuffer = new ArrayBuffer(10);
        let copy: ArrayBuffer = src.slice(1, 6);
        let dv: DataView = new DataView(copy, 1, 2);
        expect(bufferProbe.isArrayBuffer(dv.buffer)).assertTrue();
        expect(dv.buffer).assertEqual(copy);
        expect(dv.buffer.byteLength).assertEqual(5);
        expect(bufferProbe.isArrayBuffer(dv)).assertFalse();
      }

      // --- [5] Verify a trailing window DataView pins the buffer byteLength to the sum of its byteOffset 5 and byteLength 8 ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(13);
        let dv: DataView = new DataView(buf, 5, 8);
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
        expect(dv.byteOffset + dv.byteLength).assertEqual(buf.byteLength);
        expect(bufferProbe.isArrayBuffer(dv)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0500
     * @tc.name testTypesIsArrayBuffer005
     * @tc.desc Merged batch (4 tests): Basic construction and recognition: verifies recognition, covering loop and iterator traversal and related construction variants.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify detection of a buffer leaves the byteOffset and byteLength of both views mounted on it untouched ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let head: Uint8Array = new Uint8Array(buf, 0, 6);
        let tail: Uint8Array = new Uint8Array(buf, 12, 8);
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
        expect(head.byteOffset).assertEqual(0);
        expect(head.byteLength).assertEqual(6);
        expect(tail.byteOffset).assertEqual(12);
        expect(tail.byteLength).assertEqual(8);
      }

      // --- [2] Verify a Map values iterator yields the stored ArrayBuffer as a recognized buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let m: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();
        m.set('slot', new ArrayBuffer(5));
        let count: int = 0;
        for (const stored of m.values()) {
          expect(bufferProbe.isArrayBuffer(stored)).assertTrue();
          count += 1;
        }
        expect(count).assertEqual(1);
      }

      // --- [3] Verify the buffer handed out by a view is the same reference before and after detection ---
      {
        let bufferProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(12);
        let before: ArrayBuffer = uint8View.buffer;
        expect(bufferProbe.isArrayBuffer(uint8View.buffer)).assertTrue();
        let after: ArrayBuffer = uint8View.buffer;
        expect(before).assertEqual(after);
        expect(after.byteLength).assertEqual(12);
      }

      // --- [4] Verify an eleven byte buffer refuses a whole Int32Array with a RangeError yet is still recognized afterwards ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(11);
        try {
          new Int32Array(buf);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
        expect(buf.byteLength).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0600
     * @tc.name testTypesIsArrayBuffer006
     * @tc.desc Merged batch (5 tests): Boundary values: a slice taken at the very end of a five byte buffer yields a zero length ArrayBuffer that is still recognized; rejects the double negative zero -0.0 and for the positive zero 0.0; isArrayBuffer rejects the empty string, a single character, a 10000 character string and a decoded roundtrip string in a single pass; rejects a zero byteLength DataView; a zero length DataView window still leaves its eight byte underlying buffer recognized.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a slice taken at the very end of a five byte buffer yields a zero length ArrayBuffer that is still recognized ---
      {
        let bufferProbe: util.types = new util.types();
        let src: ArrayBuffer = new ArrayBuffer(5);
        let tail: ArrayBuffer = src.slice(5);
        expect(bufferProbe.isArrayBuffer(tail)).assertTrue();
        expect(tail.byteLength).assertEqual(0);
        expect(bufferProbe.isArrayBuffer(src)).assertTrue();
        expect(src.byteLength).assertEqual(5);
      }

      // --- [2] Verify isArrayBuffer returns false for the double negative zero -0.0 and for the positive zero 0.0 ---
      {
        let bufferChecker: util.types = new util.types();
        let negZero: double = -0.0;
        let posZero: double = 0.0;
        expect(bufferChecker.isArrayBuffer(negZero)).assertFalse();
        expect(bufferChecker.isArrayBuffer(posZero)).assertFalse();
      }

      // --- [3] Verify isArrayBuffer rejects the empty string, a single character, a 10000 character string and a decoded roundtrip string in a single pass ---
      {
        let bufferProbe: util.types = new util.types();
        let longText: string = 'x'.repeat(10000);
        let encoded: ArrayBuffer = ArrayBuffer.from('roundtrip', 'utf8');
        let decoded: string = ArrayBuffer.stringify(encoded, 'utf8', 0, encoded.byteLength);
        let candidates: string[] = ['', 'a', longText, decoded];
        let hits: int = 0;
        for (const text of candidates) {
          if (bufferProbe.isArrayBuffer(text)) {
            hits = hits + 1;
          }
        }
        expect(longText.length).assertEqual(10000);
        expect(decoded).assertEqual('roundtrip');
        expect(ArrayBuffer.bytesLength(decoded, 'utf8')).assertEqual(encoded.byteLength);
        expect(hits).assertEqual(0);
      }

      // --- [4] Verify isArrayBuffer returns false for a zero byteLength DataView ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let dv: DataView = new DataView(ab, 0, 0);
        expect(bufferProbe.isArrayBuffer(dv)).assertFalse();
        expect(dv.byteLength).assertEqual(0);
      }

      // --- [5] Verify a zero length DataView window still leaves its eight byte underlying buffer recognized ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab, 2, 0);
        expect(bufferProbe.isArrayBuffer(dv.buffer)).assertTrue();
        expect(dv.byteLength).assertEqual(0);
        expect(bufferProbe.isArrayBuffer(dv)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0700
     * @tc.name testTypesIsArrayBuffer007
     * @tc.desc Merged batch (3 tests): Boundary values: an array container holding an ArrayBuffer is not itself one, and neither is an empty array; byteLength is preserved by isArrayBuffer for zero byte, one byte and 65536 byte buffers; an out of range DataView construction raises a RangeError.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an array container holding an ArrayBuffer is not itself one, and neither is an empty array ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let list: Array<Object> = [ab];
        let empty: Array<Object> = [];
        expect(bufferProbe.isArrayBuffer(list)).assertFalse();
        expect(bufferProbe.isArrayBuffer(empty)).assertFalse();
        expect(empty.length).assertEqual(0);
      }

      // --- [2] Verify byteLength is preserved by isArrayBuffer for zero byte, one byte and 65536 byte buffers ---
      {
        let bufferProbe: util.types = new util.types();
        let buffers: ArrayBuffer[] = [new ArrayBuffer(0), new ArrayBuffer(1), new ArrayBuffer(65536)];
        let hits: int = 0;
        for (let buf of buffers) {
          if (bufferProbe.isArrayBuffer(buf)) {
            hits += 1;
          }
        }
        expect(hits).assertEqual(3);
        expect(buffers[0].byteLength).assertEqual(0);
        expect(buffers[1].byteLength).assertEqual(1);
        expect(buffers[2].byteLength).assertEqual(65536);
      }

      // --- [3] Verify an out of range DataView construction raises a RangeError while isArrayBuffer still reports the source buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        try {
          new DataView(ab, 8, 2);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        expect(bufferProbe.isArrayBuffer(ab)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0800
     * @tc.name testTypesIsArrayBuffer008
     * @tc.desc Merged batch (5 tests): Primitive value rejection: the returned boolean renders as the string true for a buffer and false for a view; rejects the int zero value 0; rejects the ints -1, the signed bounds and the expression 3 * 7 in a single pass; rejects the int value 1 and smallest positive double and for NaN in a single pass; rejects Double.POSITIVE_INFINITY and Double.NEGATIVE_INFINITY.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the returned boolean renders as the string true for a buffer and false for a view ---
      {
        let bufferChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(8);
        expect(bufferChecker.isArrayBuffer(ab).toString()).assertEqual('true');
        expect(bufferChecker.isArrayBuffer(view).toString()).assertEqual('false');
      }

      // --- [2] Verify isArrayBuffer returns false for the int zero value 0 ---
      {
        let bufferChecker: util.types = new util.types();
        let verdict: boolean = bufferChecker.isArrayBuffer(0);
        expect(verdict).assertFalse();
      }

      // --- [3] Verify isArrayBuffer returns false for the ints -1, the signed bounds and the expression 3 * 7 in a single pass ---
      {
        let bufferChecker: util.types = new util.types();
        let derived: int = 3 * 7;
        let values: int[] = [-1, 2147483647, -2147483648, derived];
        let hits: int = 0;
        for (const value of values) {
          if (bufferChecker.isArrayBuffer(value)) {
            hits = hits + 1;
          }
        }
        expect(derived).assertEqual(21);
        expect(hits).assertEqual(0);
      }

      // --- [4] Verify isArrayBuffer returns false for the int value 1 and smallest positive double and for NaN in a single pass ---
      {
        let bufferChecker: util.types = new util.types();
        let units: int[] = [1];
        expect(bufferChecker.isArrayBuffer(units[0])).assertFalse();
        let bufferChecker_2: util.types = new util.types();
        let extremes: double[] = [Double.MIN_VALUE, Double.NaN];
        let hits: int = 0;
        for (const value of extremes) {
          if (bufferChecker_2.isArrayBuffer(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [5] Verify isArrayBuffer returns false for Double.POSITIVE_INFINITY and Double.NEGATIVE_INFINITY ---
      {
        let bufferChecker: util.types = new util.types();
        let plusInf: double = Double.POSITIVE_INFINITY;
        let hits: int = 0;
        if (bufferChecker.isArrayBuffer(plusInf)) {
          hits += 1;
        }
        expect(hits).assertEqual(0);
        let bufferChecker_2: util.types = new util.types();
        let limits: double[] = [Double.NEGATIVE_INFINITY];
        expect(bufferChecker_2.isArrayBuffer(limits[0])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_0900
     * @tc.name testTypesIsArrayBuffer009
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects both boolean literals true and false; rejects the bigint zero produced by BigInt(0); rejects a long variable whether passed directly or boxed as Object; results for a buffer, a view and a number collect into a boolean array as true, false, false; the returned boolean drives a ternary into the true branch for a buffer and the false branch for a view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns false for both boolean literals true and false ---
      {
        let bufferChecker: util.types = new util.types();
        expect(bufferChecker.isArrayBuffer(true)).assertFalse();
        expect(bufferChecker.isArrayBuffer(false)).assertFalse();
      }

      // --- [2] Verify isArrayBuffer returns false for the bigint zero produced by BigInt(0) ---
      {
        let bufferChecker: util.types = new util.types();
        let zeroBig: bigint = bigZeroValue();
        expect(bufferChecker.isArrayBuffer(zeroBig)).assertFalse();
      }

      // --- [3] Verify isArrayBuffer returns false for a long variable whether passed directly or boxed as Object ---
      {
        let bufferChecker: util.types = new util.types();
        let counted: long = 99;
        expect(bufferChecker.isArrayBuffer(counted)).assertFalse();
        expect(bufferChecker.isArrayBuffer(counted as Object)).assertFalse();
      }

      // --- [4] Verify results for a buffer, a view and a number collect into a boolean array as true, false, false ---
      {
        let bufferProbe: util.types = new util.types();
        let flags: boolean[] = [bufferProbe.isArrayBuffer(new ArrayBuffer(1)), bufferProbe.isArrayBuffer(new Uint8Array(1)), bufferProbe.isArrayBuffer(7)];
        expect(flags[0]).assertTrue();
        expect(flags[1]).assertFalse();
        expect(flags[2]).assertFalse();
      }

      // --- [5] Verify the returned boolean drives a ternary into the true branch for a buffer and the false branch for a view ---
      {
        let bufferChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(8);
        expect(bufferChecker.isArrayBuffer(ab) ? 'buf' : 'no').assertEqual('buf');
        expect(bufferChecker.isArrayBuffer(view) ? 'buf' : 'no').assertEqual('no');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1000
     * @tc.name testTypesIsArrayBuffer010
     * @tc.desc Merged batch (2 tests): Primitive value rejection: rejects a two dimensional int array; rejects an array mixing int and string elements.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns false for a two dimensional int array ---
      {
        let bufferChecker: util.types = new util.types();
        let two: Array<Array<int>> = [[1, 2], [3, 4]];
        expect(bufferChecker.isArrayBuffer(two)).assertFalse();
      }

      // --- [2] Verify isArrayBuffer returns false for an array mixing int and string elements ---
      {
        let bufferChecker: util.types = new util.types();
        let mix: Array<int | string> = [1, 'a', 2];
        expect(bufferChecker.isArrayBuffer(mix)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1100
     * @tc.name testTypesIsArrayBuffer011
     * @tc.desc Merged batch (4 tests): Primitive and view rejection: verifies isArrayBuffer returns false for integer views, a bigint view, and plain int or string arrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns false for Uint32Array, Int32Array, Float64Array and Uint8ClampedArray views holding one special element each ---
      {
        let bufferChecker: util.types = new util.types();
        let uint32View: Uint32Array = new Uint32Array([65536]);
        let int32View: Int32Array = new Int32Array([2147483647]);
        let float64View: Float64Array = new Float64Array([3.14]);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray([255]);
        expect(bufferChecker.isArrayBuffer(uint32View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(int32View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(float64View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(clamped)).assertFalse();
      }

      // --- [2] Verify isArrayBuffer returns false for BigInt64Array, BigUint64Array, a Date and a util.types instance ---
      {
        let bufferChecker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(4);
        let bigUint64View: BigUint64Array = new BigUint64Array(4);
        let d: Date = new Date(0);
        let other: Object = new util.types();
        expect(bufferChecker.isArrayBuffer(bigInt64View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(bigUint64View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(d)).assertFalse();
        expect(bufferChecker.isArrayBuffer(other)).assertFalse();
      }

      // --- [3] Verify isArrayBuffer returns false for an int array ---
      {
        let bufferChecker: util.types = new util.types();
        let arr: int[] = [1, 2, 3];
        expect(bufferChecker.isArrayBuffer(arr)).assertFalse();
      }

      // --- [4] Verify isArrayBuffer returns false for a string array ---
      {
        let bufferChecker: util.types = new util.types();
        let words: string[] = ['a', 'b'];
        expect(bufferChecker.isArrayBuffer(words)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1200
     * @tc.name testTypesIsArrayBuffer012
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects five typed array views: Uint8, Int8, Uint16, Int16 and Float32; rejects a DataView covering a whole four byte ArrayBuffer; rejects a DataView created with byteOffset 2 and byteLength 4; rejects a bare Object instance; rejects RegExp and Error instances.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns false for five typed array views: Uint8, Int8, Uint16, Int16 and Float32 ---
      {
        let bufferChecker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([3, 5, 7]);
        let int8View: Int8Array = new Int8Array([-1, 2]);
        let uint16View: Uint16Array = new Uint16Array([0, 1]);
        let int16View: Int16Array = new Int16Array([-300]);
        let float32View: Float32Array = new Float32Array([1.5]);
        expect(bufferChecker.isArrayBuffer(uint8View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(int8View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(uint16View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(int16View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(float32View)).assertFalse();
      }

      // --- [2] Verify isArrayBuffer returns false for a DataView covering a whole four byte ArrayBuffer ---
      {
        let bufferProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        expect(bufferProbe.isArrayBuffer(dv)).assertFalse();
        expect(dv.byteLength).assertEqual(4);
      }

      // --- [3] Verify isArrayBuffer returns false for a DataView created with byteOffset 2 and byteLength 4 ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab, 2, 4);
        expect(bufferProbe.isArrayBuffer(dv)).assertFalse();
        expect(dv.byteOffset).assertEqual(2);
        expect(dv.byteLength).assertEqual(4);
      }

      // --- [4] Verify isArrayBuffer returns false for a bare Object instance ---
      {
        let bufferChecker: util.types = new util.types();
        let o: Object = new Object();
        expect(bufferChecker.isArrayBuffer(o)).assertFalse();
      }

      // --- [5] Verify isArrayBuffer returns false for RegExp and Error instances ---
      {
        let bufferChecker: util.types = new util.types();
        let re: RegExp = new RegExp('abc');
        expect(bufferChecker.isArrayBuffer(re)).assertFalse();
        let er: Error = new Error('boom');
        expect(bufferChecker.isArrayBuffer(er)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1300
     * @tc.name testTypesIsArrayBuffer013
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a resolved Promise instance; Map that already holds one entry and Set that already holds one member; WeakMap keyed by a class instance; WeakSet holding a class instance; Map keys iterator and a Set values iterator.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns false for a resolved Promise instance ---
      {
        let bufferChecker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(bufferChecker.isArrayBuffer(p)).assertFalse();
      }

      // --- [2] Verify isArrayBuffer returns false for a Map that already holds one entry and Set that already holds one member ---
      {
        let bufferProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        expect(bufferProbe.isArrayBuffer(m)).assertFalse();
        expect(m.size).assertEqual(1);
        let bufferProbe_2: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        s.add(5);
        expect(bufferProbe_2.isArrayBuffer(s)).assertFalse();
        expect(s.size).assertEqual(1);
      }

      // --- [3] Verify isArrayBuffer returns false for a WeakMap keyed by a class instance ---
      {
        let bufferChecker: util.types = new util.types();
        let key: HeldKey = new HeldKey();
        let wm: WeakMap<HeldKey, HeldKey> = new WeakMap<HeldKey, HeldKey>();
        wm.set(key, key);
        expect(bufferChecker.isArrayBuffer(wm)).assertFalse();
      }

      // --- [4] Verify isArrayBuffer returns false for a WeakSet holding a class instance ---
      {
        let bufferChecker: util.types = new util.types();
        let key: HeldKey = new HeldKey();
        let ws: WeakSet<HeldKey> = new WeakSet<HeldKey>();
        ws.add(key);
        expect(bufferChecker.isArrayBuffer(ws)).assertFalse();
      }

      // --- [5] Verify isArrayBuffer returns false for a Map keys iterator and a Set values iterator ---
      {
        let bufferChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(2);
        let keys: IterableIterator<string> = m.keys();
        let values: IterableIterator<int> = s.values();
        expect(bufferChecker.isArrayBuffer(keys)).assertFalse();
        expect(bufferChecker.isArrayBuffer(values)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1400
     * @tc.name testTypesIsArrayBuffer014
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Map whose single value is itself a Map; reference to a plain function; reference to an async function; results stay independent across calls and a false result survives an AND expression; appending further entries to a list does not change the detection of the buffer stored first.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns false for a Map whose single value is itself a Map ---
      {
        let bufferProbe: util.types = new util.types();
        let inner: Map<string, int> = new Map<string, int>();
        inner.set('a', 1);
        let outer: Map<string, Map<string, int>> = new Map<string, Map<string, int>>();
        outer.set('a', inner);
        expect(bufferProbe.isArrayBuffer(outer)).assertFalse();
        expect(outer.size).assertEqual(1);
      }

      // --- [2] Verify isArrayBuffer returns false for a reference to a plain function ---
      {
        let bufferChecker: util.types = new util.types();
        expect(bufferChecker.isArrayBuffer(plainNumberFn)).assertFalse();
      }

      // --- [3] Verify isArrayBuffer returns false for a reference to an async function ---
      {
        let bufferChecker: util.types = new util.types();
        let negativeVerdict: boolean = bufferChecker.isArrayBuffer(asyncNumberTask);
        let positiveVerdict: boolean = bufferChecker.isArrayBuffer(new ArrayBuffer(5));
        expect(negativeVerdict).assertFalse();
        expect(positiveVerdict).assertTrue();
      }

      // --- [4] Verify results stay independent across calls and a false result survives an AND expression ---
      {
        let bufferProbe: util.types = new util.types();
        let view: Uint8Array = new Uint8Array(8);
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let first: boolean = bufferProbe.isArrayBuffer(view);
        let second: boolean = bufferProbe.isArrayBuffer(ab);
        let conj: boolean = first && true;
        expect(first).assertFalse();
        expect(second).assertTrue();
        expect(conj).assertFalse();
        expect(bufferProbe.isArrayBuffer(view)).assertFalse();
      }

      // --- [5] Verify appending further entries to a list does not change the detection of the buffer stored first ---
      {
        let bufferProbe: util.types = new util.types();
        let first: ArrayBuffer = new ArrayBuffer(4);
        let list: Array<Object> = [first];
        expect(bufferProbe.isArrayBuffer(list[0])).assertTrue();
        list.push(new ArrayBuffer(8));
        list.push(new Uint8Array(8));
        expect(list.length).assertEqual(3);
        expect(bufferProbe.isArrayBuffer(list[0])).assertTrue();
        expect(bufferProbe.isArrayBuffer(list[2])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1500
     * @tc.name testTypesIsArrayBuffer015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an Object array holding two bare Object instances; rejects arrays whose element type admits null or undefined; a twenty four byte ArrayBuffer binds as any buffer and as a buffer while binding as not a view; an earlier isAnyArrayBuffer or isArrayBufferView call does not change the following isArrayBuffer result; a DataView satisfies isArrayBufferView but fails isArrayBuffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns false for an Object array holding two bare Object instances ---
      {
        let bufferChecker: util.types = new util.types();
        let objs: Object[] = [new Object(), new Object()];
        expect(bufferChecker.isArrayBuffer(objs)).assertFalse();
      }

      // --- [2] Verify isArrayBuffer returns false for arrays whose element type admits null or undefined ---
      {
        let bufferChecker: util.types = new util.types();
        let nulls: Array<int | null> = [1, null, 3];
        let undefs: Array<int | undefined> = [1, undefined, 3];
        expect(bufferChecker.isArrayBuffer(nulls)).assertFalse();
        expect(bufferChecker.isArrayBuffer(undefs)).assertFalse();
      }

      // --- [3] Verify a twenty four byte ArrayBuffer binds as any buffer and as a buffer while binding as not a view ---
      {
        let bufferChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let asAnyBuffer: boolean = bufferChecker.isAnyArrayBuffer(ab);
        let asBuffer: boolean = bufferChecker.isArrayBuffer(ab);
        let asView: boolean = bufferChecker.isArrayBufferView(ab);
        expect(asAnyBuffer).assertTrue();
        expect(asBuffer).assertTrue();
        expect(asView).assertFalse();
      }

      // --- [4] Verify an earlier isAnyArrayBuffer or isArrayBufferView call does not change the following isArrayBuffer result ---
      {
        let bufferChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(8);
        let bufferProbeResult: boolean = bufferChecker.isAnyArrayBuffer(ab);
        let viewResult: boolean = bufferChecker.isArrayBufferView(uint8View);
        expect(bufferProbeResult).assertTrue();
        expect(viewResult).assertTrue();
        expect(bufferChecker.isArrayBuffer(ab)).assertTrue();
        expect(bufferChecker.isArrayBuffer(uint8View)).assertFalse();
      }

      // --- [5] Verify a DataView satisfies isArrayBufferView but fails isArrayBuffer ---
      {
        let bufferChecker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(16));
        expect(bufferChecker.isArrayBufferView(dv)).assertTrue();
        expect(bufferChecker.isArrayBuffer(dv)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1600
     * @tc.name testTypesIsArrayBuffer016
     * @tc.desc Merged batch (1 test): Non-target object rejection: a class instance that only exposes a byteLength field is rejected by isArrayBuffer and isArrayBufferView.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a class instance that only exposes a byteLength field is rejected by isArrayBuffer and isArrayBufferView ---
      {
        let bufferChecker: util.types = new util.types();
        let impostor: BufferShapeAlike = new BufferShapeAlike();
        expect(bufferChecker.isArrayBuffer(impostor)).assertFalse();
        expect(bufferChecker.isArrayBufferView(impostor)).assertFalse();
        expect(impostor.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1700
     * @tc.name testTypesIsArrayBuffer017
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: a prime length buffer of 97 bytes is recognized and leaves a remainder of one when divided by four; a class field reassigned to a second buffer reports the new buffer; a subarray keeps byteOffset 4 and byteLength 6 and a byte written through it shows in the parent while the buffer stays accepted; a filter whose predicate is the detection call keeps exactly the two ArrayBuffer entries; one buffer aliased by an array slot and a Map value is recognized through both containers as the same object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a prime length buffer of 97 bytes is recognized and leaves a remainder of one when divided by four ---
      {
        let bufferProbe: util.types = new util.types();
        let prime: ArrayBuffer = new ArrayBuffer(97);
        expect(bufferProbe.isArrayBuffer(prime)).assertTrue();
        expect(prime.byteLength).assertEqual(97);
        expect(prime.byteLength % 4).assertEqual(1);
      }

      // --- [2] Verify a class field reassigned to a second buffer reports the new buffer while the earlier one stays a buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let holder: BufferFieldHolder = new BufferFieldHolder();
        let original: ArrayBuffer = holder.slot;
        holder.swap(new ArrayBuffer(20));
        expect(original !== holder.slot).assertTrue();
        expect(bufferProbe.isArrayBuffer(holder.slot)).assertTrue();
        expect(holder.slot.byteLength).assertEqual(20);
        expect(bufferProbe.isArrayBuffer(original)).assertTrue();
      }

      // --- [3] Verify a subarray keeps byteOffset 4 and byteLength 6 and a byte written through it shows in the parent while the buffer stays accepted ---
      {
        let bufferProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(16);
        let sub: Uint8Array = uint8View.subarray(4, 10);
        expect(bufferProbe.isArrayBuffer(sub)).assertFalse();
        expect(sub.byteOffset).assertEqual(4);
        expect(sub.byteLength).assertEqual(6);
        let bufferProbe_2: util.types = new util.types();
        let uint8View_2: Uint8Array = new Uint8Array(10);
        let sub_2: Uint8Array = uint8View_2.subarray(2, 6);
        sub_2.$_set(0, 44);
        expect(bufferProbe_2.isArrayBuffer(uint8View_2.buffer)).assertTrue();
        expect(bufferProbe_2.isArrayBuffer(uint8View_2)).assertFalse();
        expect(bufferProbe_2.isArrayBuffer(sub_2)).assertFalse();
        expect(uint8View_2.$_get(2)).assertEqual(44);
      }

      // --- [4] Verify a filter whose predicate is the detection call keeps exactly the two ArrayBuffer entries ---
      {
        let bufferProbe: util.types = new util.types();
        let items: Array<Object> = [new ArrayBuffer(2), new Uint16Array(2), new ArrayBuffer(4)];
        let kept: Array<Object> = items.filter((item: Object): boolean => bufferProbe.isArrayBuffer(item));
        expect(kept.length).assertEqual(2);
        expect(bufferProbe.isArrayBuffer(kept[0])).assertTrue();
      }

      // --- [5] Verify one buffer aliased by an array slot and a Map value is recognized through both containers as the same object ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(9);
        let list: Array<Object> = [ab];
        let m: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();
        m.set('slot', ab);
        let fromList: ArrayBuffer = list[0] as ArrayBuffer;
        let fromMap: ArrayBuffer = m.get('slot')!;
        expect(fromList).assertEqual(fromMap);
        expect(bufferProbe.isArrayBuffer(fromList)).assertTrue();
        expect(bufferProbe.isArrayBuffer(fromMap)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1800
     * @tc.name testTypesIsArrayBuffer018
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: one buffer reached both through a class field and through an Object alias is recognized on both paths; a 32 element Uint8Array keeps byteLength 32 and byteOffset 0 and a DataView keeps byteLength 8 and byteOffset 4 across the detection; a byte written into the buffer of a Uint8Array survives the detection unchanged; a detection call issued between two writes leaves both written bytes intact; a slice window carries the bytes of the cut region while the source keeps the bytes outside it.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one buffer reached both through a class field and through an Object alias is recognized on both paths ---
      {
        let bufferProbe: util.types = new util.types();
        let holder: BufferFieldHolder = new BufferFieldHolder();
        let side: Object = holder.slot as Object;
        expect(side).assertEqual(holder.slot);
        expect(bufferProbe.isArrayBuffer(side)).assertTrue();
        expect(bufferProbe.isArrayBuffer(holder.slot)).assertTrue();
      }

      // --- [2] Verify a 32 element Uint8Array keeps byteLength 32 and byteOffset 0 and a DataView keeps byteLength 8 and byteOffset 4 across the detection ---
      {
        let bufferProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(32);
        expect(bufferProbe.isArrayBuffer(uint8View)).assertFalse();
        expect(uint8View.byteLength).assertEqual(32);
        expect(uint8View.byteOffset).assertEqual(0);
        let bufferProbe_2: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(16), 4, 8);
        expect(bufferProbe_2.isArrayBuffer(dv)).assertFalse();
        expect(dv.byteLength).assertEqual(8);
        expect(dv.byteOffset).assertEqual(4);
      }

      // --- [3] Verify a byte written into the buffer of a Uint8Array survives the detection unchanged ---
      {
        let bufferProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(8);
        let w: DataView = new DataView(uint8View.buffer);
        w.setUint8(0, 250);
        expect(bufferProbe.isArrayBuffer(uint8View)).assertFalse();
        expect(w.getUint8(0)).assertEqual(250);
      }

      // --- [4] Verify a detection call issued between two writes leaves both written bytes intact ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let w: DataView = new DataView(ab);
        w.setUint8(0, 31);
        expect(bufferProbe.isArrayBuffer(ab)).assertTrue();
        w.setUint8(3, 63);
        expect(w.getUint8(0)).assertEqual(31);
        expect(w.getUint8(3)).assertEqual(63);
      }

      // --- [5] Verify a slice window carries the bytes of the cut region while the source keeps the bytes outside it ---
      {
        let bufferProbe: util.types = new util.types();
        let src: ArrayBuffer = new ArrayBuffer(6);
        let sw: DataView = new DataView(src);
        sw.setUint8(1, 101);
        sw.setUint8(2, 102);
        sw.setUint8(4, 104);
        let part: ArrayBuffer = src.slice(1, 4);
        let pw: DataView = new DataView(part);
        expect(bufferProbe.isArrayBuffer(part)).assertTrue();
        expect(pw.getUint8(0)).assertEqual(101);
        expect(pw.getUint8(1)).assertEqual(102);
        expect(pw.getUint8(2)).assertEqual(0);
        expect(sw.getUint8(4)).assertEqual(104);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_1900
     * @tc.name testTypesIsArrayBuffer019
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: a plain class instance keeps its field value after the detection; an interface typed object literal keeps its field value after the detection; a value written through a typed view before detection is still readable afterwards; a buffer that passes through two chained Object typed helpers keeps its identity and stays recognized; an ArrayBuffer that travels through an identity helper comes back as the same object and stays recognized.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a plain class instance keeps its field value after the detection ---
      {
        let bufferProbe: util.types = new util.types();
        let tagged: TaggedObject = new TaggedObject();
        expect(bufferProbe.isArrayBuffer(tagged as Object)).assertFalse();
        expect(tagged.tag).assertEqual('keep');
      }

      // --- [2] Verify an interface typed object literal keeps its field value after the detection ---
      {
        let bufferProbe: util.types = new util.types();
        let pair: TaggedPair = { tag: 'x' };
        expect(bufferProbe.isArrayBuffer(pair)).assertFalse();
        expect(pair.tag).assertEqual('x');
      }

      // --- [3] Verify a value written through a typed view before detection is still readable afterwards while the view stays a non buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let int16View: Int16Array = new Int16Array(buf);
        int16View.$_set(0, 300);
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
        expect(bufferProbe.isArrayBuffer(int16View)).assertFalse();
        expect(int16View.$_get(0)).assertEqual(300);
      }

      // --- [4] Verify a buffer that passes through two chained Object typed helpers keeps its identity and stays recognized ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let stage1: Object = ab as Object;
        let stage2: Object = passObjectThrough(stage1);
        expect(stage2).assertEqual(stage1);
        expect(bufferProbe.isArrayBuffer(stage2)).assertTrue();
        expect((stage2 as ArrayBuffer).byteLength).assertEqual(6);
      }

      // --- [5] Verify an ArrayBuffer that travels through an identity helper comes back as the same object and stays recognized ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(7);
        let back: ArrayBuffer = passBufferThrough(ab);
        expect(back).assertEqual(ab);
        expect(bufferProbe.isArrayBuffer(back)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2000
     * @tc.name testTypesIsArrayBuffer020
     * @tc.desc Merged batch (1 test): State preservation and aliasing: on one shared buffer isTypedArray keeps the typed view and isDataView keeps the DataView.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify on one shared buffer isTypedArray keeps the typed view and isDataView keeps the DataView while isArrayBuffer stays with the buffer ---
      {
        let bufferChecker: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let int8View: Int8Array = new Int8Array(buf, 4, 8);
        let dv: DataView = new DataView(buf);
        expect(bufferChecker.isArrayBuffer(buf)).assertTrue();
        expect(bufferChecker.isTypedArray(int8View)).assertTrue();
        expect(bufferChecker.isTypedArray(dv)).assertFalse();
        expect(bufferChecker.isDataView(dv)).assertTrue();
        expect(bufferChecker.isDataView(int8View)).assertFalse();
        expect(bufferChecker.isArrayBuffer(int8View)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2100
     * @tc.name testTypesIsArrayBuffer021
     * @tc.desc Merged batch (5 tests): Container and field storage: accepts ArrayBuffers stored as elements of an Object array and an ArrayBuffer stored in a class field; an ArrayBuffer stored in a Map is still recognized as one after being read back; an ArrayBuffer reached through the bytes field of an interface typed object is recognized; an ArrayBuffer used as a Map key is recognized when the keys iterator yields it back; an ArrayBuffer stored as a WeakMap value is recognized when fetched with the class instance key.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns true for ArrayBuffers stored as elements of an Object array and an ArrayBuffer stored in a class field ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let list: Array<Object> = [new ArrayBuffer(4), ab];
        let accepted: int = 0;
        for (let i: int = 0; i < list.length; i++) {
          if (bufferProbe.isArrayBuffer(list[i])) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(2);
        let bufferProbe_2: util.types = new util.types();
        let bag: BufferBag = new BufferBag();
        expect(bufferProbe_2.isArrayBuffer(bag.buf)).assertTrue();
        expect(bag.buf.byteLength).assertEqual(8);
      }

      // --- [2] Verify an ArrayBuffer stored in a Map is still recognized as one after being read back ---
      {
        let bufferProbe: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let m: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();
        m.set('k', buffer);
        let got: ArrayBuffer | undefined = m.get('k');
        expect(m.size).assertEqual(1);
        expect(bufferProbe.isArrayBuffer(got as Object)).assertTrue();
      }

      // --- [3] Verify an ArrayBuffer reached through the bytes field of an interface typed object is recognized ---
      {
        let bufferProbe: util.types = new util.types();
        let slot: BufferSlot = { bytes: new ArrayBuffer(14), tag: 'slot' };
        expect(bufferProbe.isArrayBuffer(slot.bytes)).assertTrue();
        expect(slot.bytes.byteLength).assertEqual(14);
        expect(slot.tag).assertEqual('slot');
      }

      // --- [4] Verify an ArrayBuffer used as a Map key is recognized when the keys iterator yields it back ---
      {
        let bufferProbe: util.types = new util.types();
        let key: ArrayBuffer = new ArrayBuffer(6);
        let m: Map<ArrayBuffer, string> = new Map<ArrayBuffer, string>();
        m.set(key, 'six');
        let visits: int = 0;
        for (const k of m.keys()) {
          expect(bufferProbe.isArrayBuffer(k)).assertTrue();
          visits += 1;
        }
        expect(visits).assertEqual(1);
        expect(m.size).assertEqual(1);
      }

      // --- [5] Verify an ArrayBuffer stored as a WeakMap value is recognized when fetched with the class instance key ---
      {
        let bufferProbe: util.types = new util.types();
        let key: HeldKey = new HeldKey();
        let wm: WeakMap<HeldKey, ArrayBuffer> = new WeakMap<HeldKey, ArrayBuffer>();
        wm.set(key, new ArrayBuffer(10));
        let held: ArrayBuffer | undefined = wm.get(key);
        expect(bufferProbe.isArrayBuffer(held as Object)).assertTrue();
        expect((held as ArrayBuffer).byteLength).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2200
     * @tc.name testTypesIsArrayBuffer022
     * @tc.desc Merged batch (3 tests): Container and field storage: a buffer nested in a list under a Map key and one reached through a holder in an array are recognized at two step paths; an ArrayBuffer kept under a quoted Record key is recognized after the field is indexed; a holding class method hands back the very same buffer object stored in its field.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a buffer nested in a list under a Map key and one reached through a holder in an array are recognized at two step paths ---
      {
        let bufferProbe: util.types = new util.types();
        let m: Map<string, Array<ArrayBuffer>> = new Map<string, Array<ArrayBuffer>>();
        m.set('all', [new ArrayBuffer(3)]);
        let list: Array<ArrayBuffer> | undefined = m.get('all');
        let inner: ArrayBuffer = list![0];
        expect(bufferProbe.isArrayBuffer(inner)).assertTrue();
        expect(inner.byteLength).assertEqual(3);
        let bufferProbe_2: util.types = new util.types();
        let holder: BufferFieldHolder = new BufferFieldHolder();
        let holders: Array<BufferFieldHolder> = [holder];
        expect(holders[0].slot).assertEqual(holder.slot);
        expect(bufferProbe_2.isArrayBuffer(holders[0].slot)).assertTrue();
        expect(holders[0].slot.byteLength).assertEqual(10);
      }

      // --- [2] Verify an ArrayBuffer kept under a quoted Record key is recognized after the field is indexed ---
      {
        let bufferProbe: util.types = new util.types();
        let store: Record<string, ArrayBuffer> = { 'seed': new ArrayBuffer(10) };
        let got: ArrayBuffer = store['seed']!;
        expect(bufferProbe.isArrayBuffer(got)).assertTrue();
        expect(got.byteLength).assertEqual(10);
      }

      // --- [3] Verify a holding class method hands back the very same buffer object stored in its field ---
      {
        let bufferProbe: util.types = new util.types();
        let holder: BufferFieldHolder = new BufferFieldHolder();
        let fetched: ArrayBuffer = holder.fetch();
        expect(fetched).assertEqual(holder.slot);
        expect(bufferProbe.isArrayBuffer(fetched)).assertTrue();
        expect(fetched.byteLength).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2300
     * @tc.name testTypesIsArrayBuffer023
     * @tc.desc Merged batch (5 tests): API call consistency: ArrayBuffer.from packs numbers into an accepted buffer and a buffer behind a DataView and a Float64Array is accepted while the views are not; a nullable Object field storing a buffer is recognized as an ArrayBuffer; a byte written by ArrayBuffer.set and read by ArrayBuffer.at agrees with the Uint8Array view over the same buffer; isArrayBuffer accepts the backing store of a view; two consecutive isArrayBuffer calls on the same ArrayBuffer both return true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify ArrayBuffer.from packs numbers into an accepted buffer and a buffer behind a DataView and a Float64Array is accepted while the views are not ---
      {
        let bufferProbe: util.types = new util.types();
        let numbers: double[] = [1.5, 2.5, 3.5];
        let packed: ArrayBuffer = ArrayBuffer.from(numbers);
        expect(bufferProbe.isArrayBuffer(packed)).assertTrue();
        expect(packed.getByteLength()).assertEqual(packed.byteLength);
        expect(ArrayBuffer.isView(numbers)).assertFalse();
        let bufferProbe_2: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(24);
        let dv: DataView = new DataView(buf, 0, 16);
        let float64View: Float64Array = new Float64Array(buf, 8, 2);
        expect(dv.buffer).assertEqual(buf);
        expect(float64View.buffer).assertEqual(buf);
        expect(bufferProbe_2.isArrayBuffer(buf)).assertTrue();
        expect(bufferProbe_2.isArrayBuffer(dv)).assertFalse();
        expect(bufferProbe_2.isArrayBuffer(float64View)).assertFalse();
      }

      // --- [2] Verify a nullable Object field storing a buffer is recognized as an ArrayBuffer while the same field storing a Date is not ---
      {
        let bufferChecker: util.types = new util.types();
        let holder: NullFieldBag = new NullFieldBag();
        holder.value = new ArrayBuffer(8);
        expect(bufferChecker.isArrayBuffer(holder.value as Object)).assertTrue();
        holder.value = new Date(0);
        expect(bufferChecker.isArrayBuffer(holder.value as Object)).assertFalse();
      }

      // --- [3] Verify a byte written by ArrayBuffer.set and read by ArrayBuffer.at agrees with the Uint8Array view over the same buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let stored: byte = 100;
        buf.set(1, stored);
        expect(buf.at(1)).assertEqual(stored);
        let view: Uint8Array = new Uint8Array(buf);
        expect(view[1]).assertEqual(100);
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
      }

      // --- [4] Verify isArrayBuffer accepts the backing store of a view but rejects both the view itself and a RegExp object ---
      {
        let bufferProbe: util.types = new util.types();
        let view: Uint8Array = new Uint8Array([7, 8]);
        let backing: ArrayBuffer = view.buffer;
        let pattern: RegExp = new RegExp('^a+$');
        expect(bufferProbe.isArrayBuffer(backing)).assertTrue();
        expect(bufferProbe.isArrayBuffer(view)).assertFalse();
        expect(bufferProbe.isArrayBuffer(pattern)).assertFalse();
        expect(bufferProbe.isRegExp(pattern)).assertTrue();
        expect(pattern.test('aaa')).assertTrue();
      }

      // --- [5] Verify two consecutive isArrayBuffer calls on the same ArrayBuffer both return true ---
      {
        let bufferChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let r1: boolean = bufferChecker.isArrayBuffer(ab);
        let r2: boolean = bufferChecker.isArrayBuffer(ab);
        expect(r1).assertTrue();
        expect(r2).assertEqual(r1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2400
     * @tc.name testTypesIsArrayBuffer024
     * @tc.desc Merged batch (5 tests): API call consistency: two distinct util.types instances both return true for the same ArrayBuffer; a buffer held in a Set or a WeakSet is recognized through iteration; detection is unaffected by a fill sweep and a following zeroing sweep over the same buffer; a detection executed inside a holding class method separates a buffer from a typed view and a DataView; three detection calls interleaved with a counter byte all agree and leave the last byte at three.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two distinct util.types instances both return true for the same ArrayBuffer ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let verdicts: Array<boolean> = [first.isArrayBuffer(ab), second.isArrayBuffer(ab)];
        expect(verdicts[0]).assertTrue();
        expect(verdicts[1]).assertEqual(verdicts[0]);
      }

      // --- [2] Verify a buffer held in a Set or a WeakSet is recognized through iteration while neither container is a buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let s: Set<ArrayBuffer> = new Set<ArrayBuffer>();
        s.add(new ArrayBuffer(4));
        let seen: int = 0;
        for (const member of s) {
          expect(bufferProbe.isArrayBuffer(member)).assertTrue();
          seen += 1;
        }
        expect(seen).assertEqual(1);
        expect(bufferProbe.isArrayBuffer(s)).assertFalse();
        let bufferProbe_2: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(3);
        let ws: WeakSet<ArrayBuffer> = new WeakSet<ArrayBuffer>();
        ws.add(ab);
        expect(ws.has(ab)).assertTrue();
        expect(bufferProbe_2.isArrayBuffer(ab)).assertTrue();
        expect(bufferProbe_2.isArrayBuffer(ws)).assertFalse();
      }

      // --- [3] Verify detection is unaffected by a fill sweep and a following zeroing sweep over the same buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(buf);
        let idx: int = 0;
        while (idx < 8) {
          uint8View.$_set(idx, 201);
          idx += 1;
        }
        while (idx > 0) {
          idx -= 1;
          uint8View.$_set(idx, 0);
        }
        expect(bufferProbe.isArrayBuffer(buf)).assertTrue();
        expect(uint8View.$_get(0)).assertEqual(0);
        expect(uint8View.$_get(7)).assertEqual(0);
      }

      // --- [4] Verify a detection executed inside a holding class method separates a buffer from a typed view and a DataView ---
      {
        let inspector: BufferInspector = new BufferInspector();
        expect(inspector.check(new ArrayBuffer(4))).assertTrue();
        expect(inspector.check(new Uint8Array(4))).assertFalse();
        expect(inspector.check(new DataView(new ArrayBuffer(4)))).assertFalse();
      }

      // --- [5] Verify three detection calls interleaved with a counter byte all agree and leave the last byte at three ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(2);
        let w: DataView = new DataView(ab);
        w.setUint8(0, 1);
        expect(bufferProbe.isArrayBuffer(ab)).assertTrue();
        w.setUint8(0, 2);
        expect(bufferProbe.isArrayBuffer(ab)).assertTrue();
        w.setUint8(0, 3);
        expect(bufferProbe.isArrayBuffer(ab)).assertTrue();
        expect(w.getUint8(0)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2500
     * @tc.name testTypesIsArrayBuffer025
     * @tc.desc Merged batch (5 tests): API call consistency: four and six byte buffers are accepted while a Uint8Array and an Int8Array view are still rejected; accepts the buffer returned by a helper while a Float64Array is still rejected; a Float64Array passes only isTypedArray and a DataView passes only isDataView, each failing the other two predicates; a view and the buffer behind it disagree on isArrayBuffer, isArrayBufferView and isTypedArray at once; a zero element view exposes a zero byte buffer that is recognized while the view itself is not.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify four and six byte buffers are accepted while a Uint8Array and an Int8Array view are still rejected ---
      {
        let bufferProbe: util.types = new util.types();
        expect(bufferProbe.isArrayBuffer(new ArrayBuffer(4))).assertTrue();
        expect(bufferProbe.isArrayBuffer(new Uint8Array(2))).assertFalse();
        let bufferProbe_2: util.types = new util.types();
        let bufferVerdict: boolean = bufferProbe_2.isArrayBuffer(new ArrayBuffer(6));
        expect(bufferVerdict).assertTrue();
        expect(bufferProbe_2.isArrayBuffer(new Int8Array(3))).assertFalse();
      }

      // --- [2] Verify isArrayBuffer returns true for the buffer returned by a helper while a Float64Array is still rejected ---
      {
        let bufferProbe: util.types = new util.types();
        expect(bufferProbe.isArrayBuffer(makeArrayBuffer())).assertTrue();
        expect(bufferProbe.isArrayBuffer(new Float64Array(1))).assertFalse();
      }

      // --- [3] Verify a Float64Array passes only isTypedArray and a DataView passes only isDataView, each failing the other two predicates ---
      {
        let bufferChecker: util.types = new util.types();
        let float64View: Float64Array = new Float64Array(2);
        expect(bufferChecker.isTypedArray(float64View)).assertTrue();
        expect(bufferChecker.isArrayBuffer(float64View)).assertFalse();
        expect(bufferChecker.isDataView(float64View)).assertFalse();
        let bufferChecker_2: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(8));
        expect(bufferChecker_2.isDataView(dv)).assertTrue();
        expect(bufferChecker_2.isTypedArray(dv)).assertFalse();
        expect(bufferChecker_2.isArrayBuffer(dv)).assertFalse();
      }

      // --- [4] Verify a view and the buffer behind it disagree on isArrayBuffer, isArrayBufferView and isTypedArray at once ---
      {
        let bufferChecker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(6);
        let buf: ArrayBuffer = uint8View.buffer;
        expect(bufferChecker.isArrayBuffer(buf)).assertTrue();
        expect(bufferChecker.isArrayBufferView(buf)).assertFalse();
        expect(bufferChecker.isTypedArray(buf)).assertFalse();
        expect(bufferChecker.isArrayBuffer(uint8View)).assertFalse();
        expect(bufferChecker.isArrayBufferView(uint8View)).assertTrue();
        expect(bufferChecker.isTypedArray(uint8View)).assertTrue();
      }

      // --- [5] Verify a zero element view exposes a zero byte buffer that is recognized while the view itself is not ---
      {
        let bufferProbe: util.types = new util.types();
        let e: Uint8Array = new Uint8Array(0);
        expect(bufferProbe.isArrayBuffer(e.buffer)).assertTrue();
        expect(e.buffer.byteLength).assertEqual(0);
        expect(bufferProbe.isArrayBuffer(e)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2600
     * @tc.name testTypesIsArrayBuffer026
     * @tc.desc Merged batch (1 test): API call consistency: two util.types instances interleaved across a buffer and a view each keep their own conclusion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two util.types instances interleaved across a buffer and a view each keep their own conclusion ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(8);
        expect(first.isArrayBuffer(ab)).assertTrue();
        expect(second.isArrayBuffer(view)).assertFalse();
        expect(first.isArrayBuffer(view)).assertFalse();
        expect(second.isArrayBuffer(ab)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2700
     * @tc.name testTypesIsArrayBuffer027
     * @tc.desc Merged batch (5 tests): Program integration: accepts an ArrayBuffer produced by a helper function call; isArrayBuffer returns true when the argument travels through an Object typed helper parameter; a slice copy passed through an Object typed helper parameter is reported as a buffer; a copy of a copy made by chained slice calls is an ArrayBuffer whose byteLength follows the second window; a helper that writes through a view on the passed buffer leaves it recognized with the octet visible to the caller.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBuffer returns true for an ArrayBuffer produced by a helper function call ---
      {
        let bufferProbe: util.types = new util.types();
        let made: ArrayBuffer = makeArrayBuffer();
        expect(bufferProbe.isArrayBuffer(made)).assertTrue();
        expect(made.byteLength).assertEqual(8);
      }

      // --- [2] Verify isArrayBuffer returns true when the argument travels through an Object typed helper parameter ---
      {
        let ab: ArrayBuffer = new ArrayBuffer(2);
        expect(probeThroughObject(ab)).assertTrue();
      }

      // --- [3] Verify a slice copy passed through an Object typed helper parameter is reported as a buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let part: ArrayBuffer = new ArrayBuffer(10).slice(2, 7);
        expect(probeThroughObject(part)).assertTrue();
        expect(part.byteLength).assertEqual(5);
        expect(bufferProbe.isArrayBuffer(part)).assertTrue();
      }

      // --- [4] Verify a copy of a copy made by chained slice calls is an ArrayBuffer whose byteLength follows the second window ---
      {
        let bufferProbe: util.types = new util.types();
        let src: ArrayBuffer = new ArrayBuffer(12);
        let first: ArrayBuffer = src.slice(3, 11);
        let second: ArrayBuffer = first.slice(2, 5);
        expect(bufferProbe.isArrayBuffer(first)).assertTrue();
        expect(bufferProbe.isArrayBuffer(second)).assertTrue();
        expect(first.byteLength).assertEqual(8);
        expect(second.byteLength).assertEqual(3);
        expect(first === second).assertFalse();
      }

      // --- [5] Verify a helper that writes through a view on the passed buffer leaves it recognized with the octet visible to the caller ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        fillThroughArgument(ab, 123);
        expect(bufferProbe.isArrayBuffer(ab)).assertTrue();
        expect(new DataView(ab).getUint8(0)).assertEqual(123);
        expect(ab.byteLength).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2800
     * @tc.name testTypesIsArrayBuffer028
     * @tc.desc Merged batch (5 tests): Program integration: one util.types receiver used directly and handed to a helper reaches the same verdict on a buffer and a view; the returned boolean selects an array index and enters an if branch for a buffer; a helper that returns early on a true detection result labels a buffer, a view and a DataView differently; a counting helper tallies only the two ArrayBuffer members out of four mixed items; a switch over an int derived from the detection result takes the buffer branch for a buffer and the default branch for a view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one util.types receiver used directly and handed to a helper reaches the same verdict on a buffer and a view ---
      {
        let bufferProbe: util.types = new util.types();
        expect(bufferProbe.isArrayBuffer(new ArrayBuffer(4))).assertTrue();
        expect(checkWith(bufferProbe, new Uint8Array(4))).assertFalse();
        expect(bufferProbe.isArrayBuffer(new DataView(new ArrayBuffer(4)))).assertFalse();
      }

      // --- [2] Verify the returned boolean selects an array index and enters an if branch for a buffer ---
      {
        let bufferProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let names: string[] = ['no', 'yes'];
        let cnt: int = 0;
        if (bufferProbe.isArrayBuffer(ab)) {
          cnt = 1;
        }
        expect(names[bufferProbe.isArrayBuffer(ab) ? 1 : 0]).assertEqual('yes');
        expect(cnt).assertEqual(1);
      }

      // --- [3] Verify a helper that returns early on a true detection result labels a buffer, a view and a DataView differently ---
      {
        expect(classifyByBuffer(new ArrayBuffer(3))).assertEqual('buffer');
        expect(classifyByBuffer(new Uint8Array(3))).assertEqual('other');
        expect(classifyByBuffer(new DataView(new ArrayBuffer(3)))).assertEqual('other');
      }

      // --- [4] Verify a counting helper tallies only the two ArrayBuffer members out of four mixed items ---
      {
        let bufferProbe: util.types = new util.types();
        let items: Array<Object> = [new ArrayBuffer(1), new Uint8Array(1), new ArrayBuffer(2), 'plain'];
        expect(countBuffers(items)).assertEqual(2);
        expect(items.length).assertEqual(4);
        expect(bufferProbe.isArrayBuffer(items[0])).assertTrue();
      }

      // --- [5] Verify a switch over an int derived from the detection result takes the buffer branch for a buffer and the default branch for a view ---
      {
        let bufferProbe: util.types = new util.types();
        let code: int = bufferProbe.isArrayBuffer(new ArrayBuffer(5)) ? 1 : 0;
        let label: string = 'none';
        switch (code) {
          case 1:
            label = 'buffer';
            break;
          default:
            label = 'other';
            break;
        }
        expect(label).assertEqual('buffer');
        let viewCode: int = bufferProbe.isArrayBuffer(new Uint8Array(5)) ? 1 : 0;
        let viewLabel: string = 'none';
        switch (viewCode) {
          case 1:
            viewLabel = 'buffer';
            break;
          default:
            viewLabel = 'other';
            break;
        }
        expect(viewLabel).assertEqual('other');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_2900
     * @tc.name testTypesIsArrayBuffer029
     * @tc.desc Merged batch (2 tests): Program integration: a loop that stops at the first non buffer entry stops after two buffers using detection as its stop test; a while loop guarded by the detection result runs once for a buffer and never for a view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a loop that stops at the first non buffer entry stops after two buffers using detection as its stop test ---
      {
        let bufferProbe: util.types = new util.types();
        let items: Array<Object> = [new ArrayBuffer(1), new ArrayBuffer(2), new Uint8Array(3), new ArrayBuffer(4)];
        let seen: int = 0;
        let cursor: int = 0;
        while (cursor < items.length) {
          if (!bufferProbe.isArrayBuffer(items[cursor])) {
            break;
          }
          seen += 1;
          cursor += 1;
        }
        expect(seen).assertEqual(2);
        expect(cursor).assertEqual(2);
      }

      // --- [2] Verify a while loop guarded by the detection result runs once for a buffer and never for a view ---
      {
        let bufferProbe: util.types = new util.types();
        let pending: boolean = bufferProbe.isArrayBuffer(new ArrayBuffer(6));
        let ticks: int = 0;
        while (pending) {
          ticks += 1;
          pending = false;
        }
        expect(ticks).assertEqual(1);
        let open: boolean = bufferProbe.isArrayBuffer(new Uint8Array(6));
        let viewTicks: int = 0;
        while (open) {
          viewTicks += 1;
          open = false;
        }
        expect(viewTicks).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_3000
     * @tc.name testTypesIsArrayBuffer030
     * @tc.desc Merged batch (3 tests): Miscellaneous checks: verifies remaining edge cases, covering ArrayBuffer objects and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBuffer030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify substituting a view for a Map entry flips the detection outcome for that key while the size stays one ---
      {
        let bufferProbe: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('slot', new ArrayBuffer(4));
        expect(bufferProbe.isArrayBuffer(m.get('slot') as Object)).assertTrue();
        m.set('slot', new Uint8Array(4));
        expect(bufferProbe.isArrayBuffer(m.get('slot') as Object)).assertFalse();
        expect(m.size).assertEqual(1);
      }

      // --- [2] Verify isArrayBuffer returns false for Double.MAX_VALUE, the largest finite double ---
      {
        let bufferChecker: util.types = new util.types();
        let largest: double = Double.MAX_VALUE;
        let probes: boolean[] = [bufferChecker.isArrayBuffer(largest)];
        expect(probes.indexOf(true)).assertEqual(-1);
      }

      // --- [3] Verify isArrayBuffer returns false for the bigint built from the decimal text 9223372036854775807 ---
      {
        let bufferChecker: util.types = new util.types();
        let maxBig: bigint = bigMaxValue();
        let verdict: boolean = bufferChecker.isArrayBuffer(maxBig);
        expect(verdict).assertFalse();
      }
    });

  });
}
