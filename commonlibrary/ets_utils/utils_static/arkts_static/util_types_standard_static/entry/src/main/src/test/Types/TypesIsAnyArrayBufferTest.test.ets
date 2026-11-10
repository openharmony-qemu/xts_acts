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

class ByteFrame {
  id: int = 7;
  label: string = 'frame';
}

class BufferHolder {
  buf: ArrayBuffer = new ArrayBuffer(8);
}

class NullableSlot {
  value: Object | null = null;
}

class LinkedNode {
  next: LinkedNode | null = null;
  tag: int = 0;
}

function buildBuffer(): Object {
  return new ArrayBuffer(16);
}

function probeBuffer(types: util.types, value: Object): boolean {
  return types.isAnyArrayBuffer(value);
}

interface BufferCarrier {
  payload: ArrayBuffer;
}

class BufferCell {
  payload: Object;

  constructor(payload: Object) {
    this.payload = payload;
  }

  judgeHeld(types: util.types): boolean {
    return types.isAnyArrayBuffer(this.payload);
  }
}

class BufferVault {
  slot: ArrayBuffer = new ArrayBuffer(0);

  store(buffer: ArrayBuffer): void {
    this.slot = buffer;
  }

  release(): ArrayBuffer {
    return this.slot;
  }
}

class BufferFactory {
  build(byteCount: int): ArrayBuffer {
    return new ArrayBuffer(byteCount);
  }
}

class ViewBundle {
  owner: ArrayBuffer;
  primary: DataView;
  secondary: Int32Array;

  constructor(owner: ArrayBuffer) {
    this.owner = owner;
    this.primary = new DataView(owner);
    this.secondary = new Int32Array(owner);
  }
}

class MarkedDate extends Date {
  constructor(epoch: long) {
    super(epoch);
  }
}

class TaggedError extends Error {
  constructor(message: string) {
    super(message);
  }
}

function wrapBuffer(buffer: ArrayBuffer): ArrayBuffer {
  return buffer;
}

function relayBuffer(buffer: ArrayBuffer): ArrayBuffer {
  return wrapBuffer(buffer);
}

function firstBufferIndex(list: Array<Object>, types: util.types): int {
  for (let i: int = 0; i < list.length; i++) {
    if (types.isAnyArrayBuffer(list[i])) {
      return i;
    }
  }
  return -1;
}

function sizeIfBuffer(types: util.types, value: Object): int {
  if (types.isAnyArrayBuffer(value)) {
    return (value as ArrayBuffer).byteLength;
  }
  return -1;
}

function verdictPair(types: util.types, buffer: ArrayBuffer, view: Object): Array<boolean> {
  return [types.isAnyArrayBuffer(buffer), types.isAnyArrayBuffer(view)];
}

function fillFirstByte(buffer: ArrayBuffer, value: int): void {
  let view: Uint8Array = new Uint8Array(buffer);
  view.$_set(0, value);
}

export default function typesIsAnyArrayBufferTest(): void {
  describe('TypesIsAnyArrayBufferTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0100
     * @tc.name testTypesIsAnyArrayBuffer001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a 1048576 byte ArrayBuffer written as the hexadecimal literal 0x100000; ArrayBuffer.fromObject copies the requested segment length into a buffer that isAnyArrayBuffer accepts; one byte ArrayBuffer, the smallest non zero capacity; accepts the buffer property of a BigInt64Array whose element count times eight equals byteLength; buffer then an int32 written after the judgment reads back as 123456.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns true for a 1048576 byte ArrayBuffer written as the hexadecimal literal 0x100000 ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0x100000);
        let uint8View: Uint8Array = new Uint8Array(ab);
        expect(uint8View.length).assertEqual(0x100000);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [2] Verify ArrayBuffer.fromObject copies the requested segment length into a buffer that isAnyArrayBuffer accepts ---
      {
        let anyProbe: util.types = new util.types();
        let source: ArrayBuffer = new ArrayBuffer(8);
        let copy: ArrayBuffer = ArrayBuffer.fromObject(source, 2, 3);
        expect(anyProbe.isAnyArrayBuffer(copy)).assertTrue();
        expect(copy.getByteLength()).assertEqual(3);
      }

      // --- [3] Verify isAnyArrayBuffer returns true for a one byte ArrayBuffer, the smallest non zero capacity ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(1);
        let size: int = ab.byteLength;
        expect(size).assertEqual(1);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [4] Verify isAnyArrayBuffer returns true for the buffer property of a BigInt64Array whose element count times eight equals byteLength ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab);
        expect(type.isAnyArrayBuffer(bigInt64View.buffer)).assertTrue();
        expect(bigInt64View.buffer).assertEqual(ab);
        expect(bigInt64View.length * 8).assertEqual(ab.byteLength);
      }

      // --- [5] Verify isAnyArrayBuffer returns true for a buffer then an int32 written after the judgment reads back as 123456 ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let int32View: Int32Array = new Int32Array(ab);
        let verdict: boolean = type.isAnyArrayBuffer(ab);
        int32View.$_set(0, 123456);
        expect(verdict).assertTrue();
        expect(int32View.$_get(0)).assertEqual(123456);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0200
     * @tc.name testTypesIsAnyArrayBuffer002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: ArrayBuffer.resize grows a resizable buffer without a copy and throws a TypeError for a fixed one; accepts a slice of a slice so a second generation copy of 4 bytes is still a buffer; accepts a 12 byte buffer whose third Int32Array element holds the minimum int value; accepts a buffer whose byte 255 written as Uint8 reads back as minus one through Int8; accepts a buffer and true for a Date in two successive calls.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify ArrayBuffer.resize grows a resizable buffer without a copy and throws a TypeError for a fixed one ---
      {
        let anyProbe: util.types = new util.types();
        let growable: ArrayBuffer = new ArrayBuffer(8, 16);
        expect(growable.resizable).assertTrue();
        growable.resize(12);
        expect(growable.getByteLength()).assertEqual(12);
        expect(anyProbe.isAnyArrayBuffer(growable)).assertTrue();
        let fixed: ArrayBuffer = new ArrayBuffer(8);
        expect(fixed.resizable).assertFalse();
        try {
          fixed.resize(4);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('TypeError');
        }
      }

      // --- [2] Verify isAnyArrayBuffer returns true for a slice of a slice so a second generation copy of 4 bytes is still a buffer ---
      {
        let type: util.types = new util.types();
        let first: ArrayBuffer = new ArrayBuffer(16);
        let second: ArrayBuffer = first.slice(4, 12);
        let third: ArrayBuffer = second.slice(2, 6);
        expect(type.isAnyArrayBuffer(third)).assertTrue();
        expect(third.byteLength).assertEqual(4);
      }

      // --- [3] Verify isAnyArrayBuffer returns true for a 12 byte buffer whose third Int32Array element holds the minimum int value ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(12);
        let int32View: Int32Array = new Int32Array(ab);
        int32View.$_set(2, -2147483648);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(int32View.length).assertEqual(3);
        expect(int32View.$_get(2)).assertEqual(-2147483648);
      }

      // --- [4] Verify isAnyArrayBuffer returns true for a buffer whose byte 255 written as Uint8 reads back as minus one through Int8 ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let writer: Uint8Array = new Uint8Array(ab);
        let reader: Int8Array = new Int8Array(ab);
        writer.$_set(0, 255);
        expect(reader.$_get(0)).assertEqual(-1);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [5] Verify one receiver returns true for a buffer and true for a Date in two successive calls ---
      {
        let type: util.types = new util.types();
        let bufferResult: boolean = type.isAnyArrayBuffer(new ArrayBuffer(4));
        let dateResult: boolean = type.isDate(new Date());
        expect(bufferResult).assertTrue();
        expect(dateResult).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0300
     * @tc.name testTypesIsAnyArrayBuffer003
     * @tc.desc Merged batch (2 tests): Basic construction and recognition: isAnyArrayBuffer returns true when the argument is an ArrayBuffer element read out of an array container; accepts an ArrayBuffer built by a factory instance method with the requested 20 byte length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns true when the argument is an ArrayBuffer element read out of an array container ---
      {
        let type: util.types = new util.types();
        let box: Array<ArrayBuffer> = [new ArrayBuffer(4)];
        expect(type.isAnyArrayBuffer(box[0])).assertTrue();
      }

      // --- [2] Verify isAnyArrayBuffer returns true for an ArrayBuffer built by a factory instance method with the requested 20 byte length ---
      {
        let type: util.types = new util.types();
        let factory: BufferFactory = new BufferFactory();
        let made: ArrayBuffer = factory.build(20);
        expect(type.isAnyArrayBuffer(made)).assertTrue();
        expect(made.byteLength).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0400
     * @tc.name testTypesIsAnyArrayBuffer004
     * @tc.desc Merged batch (4 tests): Boundary values: verifies boundary handling, covering empty inputs including ArrayBuffer, DataView and Error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns true for a zero byte ArrayBuffer, the empty capacity boundary and buffer that still exposes a zero length DataView ---
      {
        let type: util.types = new util.types();
        let view: Uint8Array = new Uint8Array(0);
        let ab: ArrayBuffer = view.buffer;
        expect(ab.byteLength).assertEqual(0);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        let type_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(0);
        let dv: DataView = new DataView(ab_2);
        let verdict: boolean = type_2.isAnyArrayBuffer(ab_2);
        expect(verdict).assertTrue();
        expect(dv.byteLength).assertEqual(0);
      }

      // --- [2] Verify isAnyArrayBuffer returns true for the ArrayBuffer results of slice with two arguments, one argument and the empty zero length slice ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let head: ArrayBuffer = ab.slice(0, 4);
        let tail: ArrayBuffer = ab.slice(2);
        let empty: ArrayBuffer = ab.slice(0, 0);
        expect(type.isAnyArrayBuffer(head)).assertTrue();
        expect(head.byteLength).assertEqual(4);
        expect(type.isAnyArrayBuffer(tail)).assertTrue();
        expect(type.isAnyArrayBuffer(empty)).assertTrue();
      }

      // --- [3] Verify isAnyArrayBuffer returns false for an empty string and again for the name 'ArrayBuffer' appended to it ---
      {
        let type: util.types = new util.types();
        let value: string = '';
        let onEmpty: boolean = type.isAnyArrayBuffer(value);
        expect(onEmpty).assertFalse();

        value += 'ArrayBuffer';
        let onBufferName: boolean = type.isAnyArrayBuffer(value);
        expect(onBufferName).assertFalse();
      }

      // --- [4] Verify the ArrayBuffer length parameter rejects a negative value with a RangeError while negative zero yields a zero length buffer ---
      {
        let type: util.types = new util.types();
        try {
          new ArrayBuffer(-1);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        let negativeZero: ArrayBuffer = new ArrayBuffer(-0);
        expect(negativeZero.byteLength).assertEqual(0);
        expect(type.isAnyArrayBuffer(negativeZero)).assertTrue();
        expect(type.isArrayBuffer(negativeZero)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0500
     * @tc.name testTypesIsAnyArrayBuffer005
     * @tc.desc Merged batch (4 tests): Boundary overflow: verifies numeric limit and wrapping behavior, covering ArrayBuffer objects and related extreme values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns false for the doubles 3.14, NaN, positive Infinity and Number.MAX_VALUE in a single pass ---
      {
        let type: util.types = new util.types();
        let values: double[] = [3.14, Double.NaN, Double.POSITIVE_INFINITY, Number.MAX_VALUE];
        let hits: int = 0;
        for (const value of values) {
          if (type.isAnyArrayBuffer(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [2] Verify isAnyArrayBuffer returns false for the ints 0, 1, 2147483647 and -2147483648 in a single pass ---
      {
        let type: util.types = new util.types();
        let values: int[] = [0, 1, 2147483647, -2147483648];
        let hits: int = 0;
        for (const value of values) {
          if (type.isAnyArrayBuffer(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify isAnyArrayBuffer returns false for Number.MIN_VALUE, the smallest positive double ---
      {
        let type: util.types = new util.types();
        let value: double = Number.MIN_VALUE;
        expect(type.isAnyArrayBuffer(value)).assertFalse();
        expect(type.isAnyArrayBuffer(new ArrayBuffer(3))).assertTrue();
      }

      // --- [4] Verify isAnyArrayBuffer returns false for an array that merely wraps an ArrayBuffer element ---
      {
        let type: util.types = new util.types();
        let wrapped: Array<ArrayBuffer> = [new ArrayBuffer(4)];
        expect(type.isAnyArrayBuffer(wrapped)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0600
     * @tc.name testTypesIsAnyArrayBuffer006
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the number 42; rejects the boolean true/false; rejects BigInt64Array and BigUint64Array views over sixteen byte buffers; rejects a non empty int array; results stored in a boolean array keep true for a buffer and false for a view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns false for the number 42 ---
      {
        let type: util.types = new util.types();
        let value: int = 42;
        let ab: ArrayBuffer = new ArrayBuffer(42);
        expect(type.isAnyArrayBuffer(value)).assertFalse();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [2] Verify isAnyArrayBuffer returns false for the boolean true/false ---
      {
        let type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(true)).assertFalse();
        expect(type.isAnyArrayBuffer(false)).assertFalse();
      }

      // --- [3] Verify isAnyArrayBuffer returns false for BigInt64Array and BigUint64Array views over sixteen byte buffers ---
      {
        let type: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(new ArrayBuffer(16));
        let bigUint64View: BigUint64Array = new BigUint64Array(new ArrayBuffer(16));
        expect(type.isAnyArrayBuffer(bigInt64View)).assertFalse();
        expect(type.isAnyArrayBuffer(bigUint64View)).assertFalse();
      }

      // --- [4] Verify isAnyArrayBuffer returns false for a non empty int array ---
      {
        let type: util.types = new util.types();
        let arr: int[] = [1, 2, 3];
        expect(type.isAnyArrayBuffer(arr)).assertFalse();
      }

      // --- [5] Verify results stored in a boolean array keep true for a buffer and false for a view ---
      {
        let type: util.types = new util.types();
        let results: boolean[] = [];
        results.push(type.isAnyArrayBuffer(new ArrayBuffer(1)));
        results.push(type.isAnyArrayBuffer(new Uint8Array(1)));
        expect(results[0]).assertTrue();
        expect(results[1]).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0700
     * @tc.name testTypesIsAnyArrayBuffer007
     * @tc.desc Merged batch (2 tests): Primitive value rejection: rejects an empty int array; rejects a 10000 character string without raising an error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns false for an empty int array ---
      {
        let type: util.types = new util.types();
        let arr: int[] = [];
        expect(type.isAnyArrayBuffer(arr)).assertFalse();
      }

      // --- [2] Verify isAnyArrayBuffer returns false for a 10000 character string without raising an error ---
      {
        let type: util.types = new util.types();
        let text: string = 'a'.repeat(10000);
        expect(type.isAnyArrayBuffer(text)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0800
     * @tc.name testTypesIsAnyArrayBuffer008
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects five typed array views: Uint8, Int8, Uint16, Int16 and Uint32; rejects Int32Array, Float32Array, Float64Array and Uint8ClampedArray views each holding one element; rejects a Uint8Array created with byteOffset 2 and length 3; rejects a view while returning true for the same underlying buffer; rejects Int32Array and Uint16Array views over one buffer while returning true for that buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns false for five typed array views: Uint8, Int8, Uint16, Int16 and Uint32 ---
      {
        let type: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([3, 5, 7]);
        let int8View: Int8Array = new Int8Array([-1, 2]);
        let uint16View: Uint16Array = new Uint16Array([0, 1]);
        let int16View: Int16Array = new Int16Array([-300]);
        let uint32View: Uint32Array = new Uint32Array([65536]);
        expect(type.isAnyArrayBuffer(uint8View)).assertFalse();
        expect(type.isAnyArrayBuffer(int8View)).assertFalse();
        expect(type.isAnyArrayBuffer(uint16View)).assertFalse();
        expect(type.isAnyArrayBuffer(int16View)).assertFalse();
        expect(type.isAnyArrayBuffer(uint32View)).assertFalse();
      }

      // --- [2] Verify isAnyArrayBuffer returns false for Int32Array, Float32Array, Float64Array and Uint8ClampedArray views each holding one element ---
      {
        let type: util.types = new util.types();
        let int32View: Int32Array = new Int32Array([2147483647]);
        expect(type.isAnyArrayBuffer(int32View)).assertFalse();
        let float32View: Float32Array = new Float32Array([1.5]);
        expect(type.isAnyArrayBuffer(float32View)).assertFalse();
        let float64View: Float64Array = new Float64Array([3.14]);
        expect(type.isAnyArrayBuffer(float64View)).assertFalse();
        let clamped: Uint8ClampedArray = new Uint8ClampedArray([255]);
        expect(type.isAnyArrayBuffer(clamped)).assertFalse();
      }

      // --- [3] Verify isAnyArrayBuffer returns false for a Uint8Array created with byteOffset 2 and length 3 ---
      {
        let type: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(new ArrayBuffer(8), 2, 3);
        expect(uint8View.byteOffset).assertEqual(2);
        expect(uint8View.length).assertEqual(3);
        expect(type.isAnyArrayBuffer(uint8View)).assertFalse();
      }

      // --- [4] Verify isAnyArrayBuffer returns false for a view while returning true for the same underlying buffer ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let viewResult: boolean = type.isAnyArrayBuffer(uint8View);
        let bufferResult: boolean = type.isAnyArrayBuffer(ab);
        expect(viewResult).assertFalse();
        expect(bufferResult).assertTrue();
      }

      // --- [5] Verify isAnyArrayBuffer returns false for Int32Array and Uint16Array views over one buffer while returning true for that buffer ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(12);
        let int32View: Int32Array = new Int32Array(ab);
        let uint16View: Uint16Array = new Uint16Array(ab);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(type.isAnyArrayBuffer(int32View)).assertFalse();
        expect(type.isAnyArrayBuffer(uint16View)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_0900
     * @tc.name testTypesIsAnyArrayBuffer009
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects Date, RegExp and Error instances; rejects a Promise instance; rejects a Map holding one entry; rejects a Set holding one entry; rejects a WeakMap instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns false for Date, RegExp and Error instances ---
      {
        let type: util.types = new util.types();
        let moment: Date = new Date(0);
        let pattern: RegExp = new RegExp('a');
        let failure: Error = new Error('boom');
        expect(type.isAnyArrayBuffer(moment)).assertFalse();
        expect(type.isAnyArrayBuffer(pattern)).assertFalse();
        expect(type.isAnyArrayBuffer(failure)).assertFalse();
      }

      // --- [2] Verify isAnyArrayBuffer returns false for a Promise instance ---
      {
        let type: util.types = new util.types();
        let value: Promise<int> = Promise.resolve<int>(1);
        expect(type.isAnyArrayBuffer(value)).assertFalse();
      }

      // --- [3] Verify isAnyArrayBuffer returns false for a Map holding one entry ---
      {
        let type: util.types = new util.types();
        let map: Map<string, int> = new Map<string, int>();
        map.set('k', 1);
        expect(type.isAnyArrayBuffer(map)).assertFalse();
      }

      // --- [4] Verify isAnyArrayBuffer returns false for a Set holding one entry ---
      {
        let type: util.types = new util.types();
        let set: Set<int> = new Set<int>();
        set.add(5);
        expect(type.isAnyArrayBuffer(set)).assertFalse();
      }

      // --- [5] Verify isAnyArrayBuffer returns false for a WeakMap instance ---
      {
        let type: util.types = new util.types();
        let key: BufferHolder = new BufferHolder();
        let weak: WeakMap<BufferHolder, int> = new WeakMap<BufferHolder, int>();
        weak.set(key, 1);
        expect(type.isAnyArrayBuffer(weak)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1000
     * @tc.name testTypesIsAnyArrayBuffer010
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a WeakSet instance; Map keys iterator and Set values iterator; rejects an arrow function; rejects an outer Map whose value is another Map; wrapper object that merely holds an ArrayBuffer field.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns false for a WeakSet instance ---
      {
        let type: util.types = new util.types();
        let key: BufferHolder = new BufferHolder();
        let weak: WeakSet<BufferHolder> = new WeakSet<BufferHolder>();
        weak.add(key);
        expect(type.isAnyArrayBuffer(weak)).assertFalse();
      }

      // --- [2] Verify isAnyArrayBuffer returns false for a Map keys iterator and Set values iterator ---
      {
        let type: util.types = new util.types();
        let map: Map<string, int> = new Map<string, int>();
        map.set('a', 1);
        let keys: IterableIterator<string> = map.keys();
        expect(type.isAnyArrayBuffer(keys)).assertFalse();
        let type_2: util.types = new util.types();
        let set: Set<int> = new Set<int>();
        set.add(2);
        let values: IterableIterator<int> = set.values();
        expect(type_2.isAnyArrayBuffer(values)).assertFalse();
      }

      // --- [3] Verify isAnyArrayBuffer returns false for an arrow function ---
      {
        let type: util.types = new util.types();
        let fn: Function = (): void => { };
        expect(type.isAnyArrayBuffer(fn)).assertFalse();
      }

      // --- [4] Verify isAnyArrayBuffer returns false for an outer Map whose value is another Map ---
      {
        let type: util.types = new util.types();
        let inner: Map<string, int> = new Map<string, int>();
        let outer: Map<string, Object> = new Map<string, Object>();
        outer.set('a', inner);
        expect(type.isAnyArrayBuffer(outer)).assertFalse();
      }

      // --- [5] Verify isAnyArrayBuffer returns false for a wrapper object that merely holds an ArrayBuffer field ---
      {
        let type: util.types = new util.types();
        let holder: BufferHolder = new BufferHolder();
        expect(type.isAnyArrayBuffer(holder)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1100
     * @tc.name testTypesIsAnyArrayBuffer011
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a node linked to another node in a two element chain; rejects a subarray view derived from a four element Uint8Array; rejects the copy produced by Uint8Array slice while the source buffer stays true; isAnyArrayBuffer does not change the runtime ArrayBuffer membership of its argument; isAnyArrayBuffer does not disturb two int32 values read back through an Int32Array view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns false for a node linked to another node in a two element chain ---
      {
        let type: util.types = new util.types();
        let root: LinkedNode = new LinkedNode();
        let child: LinkedNode = new LinkedNode();
        root.next = child;
        expect(type.isAnyArrayBuffer(root)).assertFalse();
      }

      // --- [2] Verify isAnyArrayBuffer returns false for a subarray view derived from a four element Uint8Array ---
      {
        let type: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([1, 2, 3, 4]);
        let sub: Uint8Array = uint8View.subarray(1, 3);
        expect(type.isAnyArrayBuffer(sub)).assertFalse();
      }

      // --- [3] Verify isAnyArrayBuffer returns false for the copy produced by Uint8Array slice while the source buffer stays true ---
      {
        let type: util.types = new util.types();
        let src: Uint8Array = new Uint8Array([9, 8, 7]);
        let copy: Uint8Array = src.slice(0);
        expect(type.isAnyArrayBuffer(copy)).assertFalse();
        expect(type.isAnyArrayBuffer(src.buffer)).assertTrue();
        expect(copy.length).assertEqual(3);
      }

      // --- [4] Verify isAnyArrayBuffer does not change the runtime ArrayBuffer membership of its argument ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let obj: Object = ab;
        type.isAnyArrayBuffer(ab);
        expect(obj instanceof ArrayBuffer).assertTrue();
      }

      // --- [5] Verify isAnyArrayBuffer does not disturb two int32 values read back through an Int32Array view ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let int32View: Int32Array = new Int32Array(ab);
        int32View.$_set(0, 70000);
        int32View.$_set(1, -3);
        type.isAnyArrayBuffer(ab);
        expect(int32View.$_get(0)).assertEqual(70000);
        expect(int32View.$_get(1)).assertEqual(-3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1200
     * @tc.name testTypesIsAnyArrayBuffer012
     * @tc.desc Merged batch (5 tests): Non-target object rejection: isAnyArrayBuffer does not change the four element length of an Int32Array view; isAnyArrayBuffer does not break the shared buffer reference between a parent view and its subarray; one receiver reports false for a Uint8Array under isAnyArrayBuffer; one receiver reports isAnyArrayBuffer and isArrayBuffer true for a buffer and both false for a view over it; one receiver reports false for a plain class instance under isAnyArrayBuffer, isDate and isNativeError.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer does not change the four element length of an Int32Array view while judging its buffer ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let int32View: Int32Array = new Int32Array(ab);
        let before: int = int32View.length;
        type.isAnyArrayBuffer(ab);
        expect(int32View.length).assertEqual(before);
        expect(int32View.length).assertEqual(4);
      }

      // --- [2] Verify isAnyArrayBuffer does not break the shared buffer reference between a parent view and its subarray ---
      {
        let type: util.types = new util.types();
        let parent: Uint8Array = new Uint8Array(12);
        let child: Uint8Array = parent.subarray(3, 7);
        type.isAnyArrayBuffer(child);
        expect(child.buffer).assertEqual(parent.buffer);
        expect(child.byteLength).assertEqual(4);
      }

      // --- [3] Verify one receiver reports false for a Uint8Array under isAnyArrayBuffer while isArrayBufferView and isTypedArray are both true ---
      {
        let type: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(4);
        expect(type.isAnyArrayBuffer(uint8View)).assertFalse();
        expect(type.isArrayBufferView(uint8View)).assertTrue();
        expect(type.isTypedArray(uint8View)).assertTrue();
      }

      // --- [4] Verify one receiver reports isAnyArrayBuffer and isArrayBuffer true for a buffer and both false for a view over it ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let uint8View: Uint8Array = new Uint8Array(ab);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(type.isArrayBuffer(ab)).assertTrue();
        expect(type.isAnyArrayBuffer(uint8View)).assertFalse();
        expect(type.isArrayBuffer(uint8View)).assertFalse();
      }

      // --- [5] Verify one receiver reports false for a plain class instance under isAnyArrayBuffer, isDate and isNativeError ---
      {
        let type: util.types = new util.types();
        let frame: ByteFrame = new ByteFrame();
        expect(type.isAnyArrayBuffer(frame)).assertFalse();
        expect(type.isDate(frame)).assertFalse();
        expect(type.isNativeError(frame)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1300
     * @tc.name testTypesIsAnyArrayBuffer013
     * @tc.desc Merged batch (1 test): Non-target object rejection: one receiver returns false, false and true for a Set under isAnyArrayBuffer, isMap and isSet.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one receiver returns false, false and true for a Set under isAnyArrayBuffer, isMap and isSet ---
      {
        let type: util.types = new util.types();
        let set: Set<int> = new Set<int>();
        let bufferResult: boolean = type.isAnyArrayBuffer(set);
        let mapResult: boolean = type.isMap(set);
        let setResult: boolean = type.isSet(set);
        expect(bufferResult).assertFalse();
        expect(mapResult).assertFalse();
        expect(setResult).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1400
     * @tc.name testTypesIsAnyArrayBuffer014
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts the buffer property of Uint8Array, Int32Array, Float64Array and DataView values; accepts a 31 byte buffer, a capacity not divisible by any element width, whose DataView spans all 31 bytes; accepts a buffer sized from a five element view so a Uint16Array covers it evenly; isAnyArrayBuffer accepts a buffer aliased by an Int32Array write and a DataView read; accepts the parent buffer of a subarray view and reports the full 64 byte length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns true for the buffer property of Uint8Array, Int32Array, Float64Array and DataView values ---
      {
        let type: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([1, 2, 3]);
        let int32View: Int32Array = new Int32Array([7]);
        let float64View: Float64Array = new Float64Array(2);
        let host: ArrayBuffer = new ArrayBuffer(16);
        let dv: DataView = new DataView(host);
        expect(type.isAnyArrayBuffer(uint8View.buffer)).assertTrue();
        expect(type.isAnyArrayBuffer(int32View.buffer)).assertTrue();
        expect(type.isAnyArrayBuffer(float64View.buffer)).assertTrue();
        expect(type.isAnyArrayBuffer(dv.buffer)).assertTrue();
      }

      // --- [2] Verify isAnyArrayBuffer returns true for a 31 byte buffer, a capacity not divisible by any element width, whose DataView spans all 31 bytes ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(31);
        let dv: DataView = new DataView(ab);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(dv.byteLength).assertEqual(31);
        expect(ab.byteLength).assertEqual(31);
      }

      // --- [3] Verify isAnyArrayBuffer returns true for a buffer sized from a five element view so a Uint16Array covers it evenly ---
      {
        let type: util.types = new util.types();
        let seed: Uint8Array = new Uint8Array(5);
        let ab: ArrayBuffer = new ArrayBuffer(seed.length * 2);
        let uint16View: Uint16Array = new Uint16Array(ab);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(uint16View.length).assertEqual(seed.length);
        expect(ab.byteLength).assertEqual(10);
      }

      // --- [4] Verify isAnyArrayBuffer accepts a buffer aliased by an Int32Array write and a DataView read ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(64);
        let words: Int32Array = new Int32Array(ab);
        let tail: DataView = new DataView(ab, ab.byteLength - 4, 4);
        words.$_set(words.length - 1, 2024);
        expect(tail.getInt32(0, true)).assertEqual(2024);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [5] Verify isAnyArrayBuffer returns true for the parent buffer of a subarray view and reports the full 64 byte length ---
      {
        let type: util.types = new util.types();
        let big: Uint8Array = new Uint8Array(64);
        let sub: Uint8Array = big.subarray(10, 20);
        expect(type.isAnyArrayBuffer(sub.buffer)).assertTrue();
        expect(sub.buffer.byteLength).assertEqual(64);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1500
     * @tc.name testTypesIsAnyArrayBuffer015
     * @tc.desc Merged batch (5 tests): View and buffer semantics: isAnyArrayBuffer accepts a buffer with two disjoint offset windows and one whose last byte stays visible through a narrower window; two adjacent view windows partition the judged buffer so their byteLengths sum to 10; isAnyArrayBuffer still returns true after bytes are written into the buffer through a Uint8Array view; isAnyArrayBuffer leaves the checked DataView byteLength at 8; a byte written by a helper through a view is visible afterwards and the buffer is still true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer accepts a buffer with two disjoint offset windows and one whose last byte stays visible through a narrower window ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let head: Uint8Array = new Uint8Array(ab, 0, 16);
        let tail: Uint8Array = new Uint8Array(ab, 16, 16);
        head.$_set(0, 1);
        tail.$_set(0, 2);
        let flat: Uint8Array = new Uint8Array(ab);
        expect(type.isAnyArrayBuffer(head.buffer)).assertTrue();
        expect(head.buffer).assertEqual(tail.buffer);
        expect(flat.$_get(0)).assertEqual(1);
        expect(flat.$_get(16)).assertEqual(2);
        let type_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(8);
        let wide: Uint8Array = new Uint8Array(ab_2, 0, 8);
        wide.$_set(7, 44);
        let narrow: Uint8Array = new Uint8Array(ab_2, 6, 2);
        expect(narrow.$_get(1)).assertEqual(44);
        expect(type_2.isAnyArrayBuffer(ab_2)).assertTrue();
      }

      // --- [2] Verify two adjacent view windows partition the judged buffer so their byteLengths sum to 10 ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(10);
        let front: Uint8Array = new Uint8Array(ab, 0, 4);
        let back: Uint8Array = new Uint8Array(ab, 4, 6);
        expect(front.byteLength + back.byteLength).assertEqual(ab.byteLength);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [3] Verify isAnyArrayBuffer still returns true after bytes are written into the buffer through a Uint8Array view ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let view: Uint8Array = new Uint8Array(ab);
        view.$_set(0, 65);
        view.$_set(1, 66);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [4] Verify isAnyArrayBuffer leaves the checked DataView byteLength at 8 ---
      {
        let type: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(8));
        type.isAnyArrayBuffer(dv);
        expect(dv.byteLength).assertEqual(8);
      }

      // --- [5] Verify a byte written by a helper through a view is visible afterwards and the buffer is still true ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(3);
        fillFirstByte(ab, 33);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        let probe: Uint8Array = new Uint8Array(ab);
        expect(probe.$_get(0)).assertEqual(33);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1600
     * @tc.name testTypesIsAnyArrayBuffer016
     * @tc.desc Merged batch (5 tests): View and buffer semantics: isAnyArrayBuffer leaves a DataView span and a byte written through a sibling Uint8Array intact; a helper guarded by isAnyArrayBuffer returns the narrowed buffer byteLength of 9 and minus one for a view; isAnyArrayBuffer leaves the byteOffset of an offset view at 2; one receiver interleaves isAnyArrayBuffer with isDataView over a buffer and its DataView, and the DataView backing buffer stays an any-buffer; the isAnyArrayBuffer verdict combines with isTypedArray on a view through short circuit and stays true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer leaves a DataView span and a byte written through a sibling Uint8Array intact ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let writer: Uint8Array = new Uint8Array(ab);
        let dv: DataView = new DataView(ab);
        writer.$_set(0, 200);
        type.isAnyArrayBuffer(ab);
        expect(dv.byteLength).assertEqual(8);
        expect(writer.$_get(0)).assertEqual(200);
        expect(dv.buffer).assertEqual(ab);
      }

      // --- [2] Verify a helper guarded by isAnyArrayBuffer returns the narrowed buffer byteLength of 9 and minus one for a view ---
      {
        let type: util.types = new util.types();
        expect(sizeIfBuffer(type, new ArrayBuffer(9))).assertEqual(9);
        expect(sizeIfBuffer(type, new Uint8Array(9))).assertEqual(-1);
      }

      // --- [3] Verify isAnyArrayBuffer leaves the byteOffset of an offset view at 2 ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(ab, 2, 4);
        type.isAnyArrayBuffer(uint8View);
        expect(uint8View.byteOffset).assertEqual(2);
      }

      // --- [4] Verify one receiver interleaves isAnyArrayBuffer with isDataView over a buffer and its DataView, and the DataView backing buffer stays an any-buffer ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(type.isDataView(ab)).assertFalse();
        expect(type.isAnyArrayBuffer(dv)).assertFalse();
        expect(type.isDataView(dv)).assertTrue();
        expect(type.isAnyArrayBuffer(dv.buffer)).assertTrue();
      }

      // --- [5] Verify the isAnyArrayBuffer verdict combines with isTypedArray on a view through short circuit and stays true ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let combined: boolean = type.isAnyArrayBuffer(ab) && type.isTypedArray(uint8View);
        expect(combined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1700
     * @tc.name testTypesIsAnyArrayBuffer017
     * @tc.desc Merged batch (3 tests): View and buffer semantics: ArrayBuffer.from yields a buffer for isAnyArrayBuffer; a while loop over a two element mixed list counts exactly one buffer and skips the view; branch counters increment only for the buffer when two guarded blocks judge a buffer and a view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify ArrayBuffer.from yields a buffer for isAnyArrayBuffer while ArrayBuffer.isView separates the view from the buffer ---
      {
        let anyProbe: util.types = new util.types();
        let seed: Uint8Array = new Uint8Array([1, 2, 3]);
        let derived: ArrayBuffer = ArrayBuffer.from(seed);
        expect(anyProbe.isAnyArrayBuffer(derived)).assertTrue();
        expect(ArrayBuffer.isView(seed)).assertTrue();
        expect(ArrayBuffer.isView(derived)).assertFalse();
        expect(derived.getByteLength()).assertEqual(3);
      }

      // --- [2] Verify a while loop over a two element mixed list counts exactly one buffer and skips the view ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(4);
        let candidates: Array<Object> = [ab, uint8View];
        let index: int = 0;
        let bufferHits: int = 0;
        while (index < candidates.length) {
          if (type.isAnyArrayBuffer(candidates[index])) {
            bufferHits = bufferHits + 1;
          }
          index = index + 1;
        }
        expect(bufferHits).assertEqual(1);
      }

      // --- [3] Verify branch counters increment only for the buffer when two guarded blocks judge a buffer and a view ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(5);
        let uint8View: Uint8Array = new Uint8Array(5);
        let hits: int = 0;
        if (type.isAnyArrayBuffer(ab)) {
          hits = hits + 1;
        }
        if (type.isAnyArrayBuffer(uint8View)) {
          hits = hits + 100;
        }
        expect(hits).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1800
     * @tc.name testTypesIsAnyArrayBuffer018
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: every buffer value reached through a Map of buffers is true while the map size stays two; isAnyArrayBuffer leaves the checked ArrayBuffer byteLength at 16; isAnyArrayBuffer accepts an odd 7 byte buffer and leaves both byteLength and the first byte 90 unchanged; accepts a slice copy and keeps the copy byteLength at 8 while the modified source byte stays 11; a judge, write, rejudge sequence on one buffer stays true and leaves the written byte at 77.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every buffer value reached through a Map of buffers is true while the map size stays two ---
      {
        let type: util.types = new util.types();
        let map: Map<int, ArrayBuffer> = new Map<int, ArrayBuffer>();
        map.set(1, new ArrayBuffer(2));
        map.set(2, new ArrayBuffer(4));
        let allTrue: boolean = true;
        for (const key of map.keys()) {
          let stored: ArrayBuffer | undefined = map.get(key);
          if (stored !== undefined && !type.isAnyArrayBuffer(stored)) {
            allTrue = false;
          }
        }
        expect(allTrue).assertTrue();
        expect(map.size).assertEqual(2);
      }

      // --- [2] Verify isAnyArrayBuffer leaves the checked ArrayBuffer byteLength at 16 ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        type.isAnyArrayBuffer(ab);
        expect(ab.byteLength).assertEqual(16);
      }

      // --- [3] Verify isAnyArrayBuffer accepts an odd 7 byte buffer and leaves both byteLength and the first byte 90 unchanged ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(7);
        let detected: boolean = type.isAnyArrayBuffer(ab);
        expect(detected).assertTrue();
        expect(ab.byteLength).assertEqual(7);
        let type_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(ab_2);
        uint8View.$_set(0, 0x5A);
        type_2.isAnyArrayBuffer(ab_2);
        expect(uint8View.$_get(0)).assertEqual(90);
      }

      // --- [4] Verify isAnyArrayBuffer returns true for a slice copy and keeps the copy byteLength at 8 while the modified source byte stays 11 ---
      {
        let type: util.types = new util.types();
        let src: ArrayBuffer = new ArrayBuffer(8);
        let srcView: Uint8Array = new Uint8Array(src);
        srcView.$_set(0, 11);
        let copy: ArrayBuffer = src.slice(0);
        let copyView: Uint8Array = new Uint8Array(copy);
        copyView.$_set(0, 99);
        expect(type.isAnyArrayBuffer(copy)).assertTrue();
        expect(copy.byteLength).assertEqual(8);
        expect(srcView.$_get(0)).assertEqual(11);
      }

      // --- [5] Verify a judge, write, rejudge sequence on one buffer stays true and leaves the written byte at 77 ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let first: boolean = type.isAnyArrayBuffer(ab);
        uint8View.$_set(0, 77);
        let second: boolean = type.isAnyArrayBuffer(ab);
        expect(first).assertTrue();
        expect(second).assertTrue();
        expect(uint8View.$_get(0)).assertEqual(77);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_1900
     * @tc.name testTypesIsAnyArrayBuffer019
     * @tc.desc Merged batch (3 tests): State preservation and aliasing: judging leaves its Map at size one with the key present and a buffer survives a Map clear still recognised; accepts an ArrayBuffer relayed through a two hop helper chain that preserves the same reference; filtering a mixed list with isAnyArrayBuffer keeps exactly the two buffers.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify judging leaves its Map at size one with the key present and a buffer survives a Map clear still recognised ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let map: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();
        map.set('only', ab);
        type.isAnyArrayBuffer(ab);
        expect(map.size).assertEqual(1);
        expect(map.has('only')).assertTrue();
        let type_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(6);
        let map_2: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();
        map_2.set('a', ab_2);
        map_2.clear();
        expect(map_2.size).assertEqual(0);
        expect(type_2.isAnyArrayBuffer(ab_2)).assertTrue();
      }

      // --- [2] Verify isAnyArrayBuffer returns true for an ArrayBuffer relayed through a two hop helper chain that preserves the same reference ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(3);
        let relayed: ArrayBuffer = relayBuffer(ab);
        expect(type.isAnyArrayBuffer(relayed)).assertTrue();
        expect(relayed).assertEqual(ab);
      }

      // --- [3] Verify filtering a mixed list with isAnyArrayBuffer keeps exactly the two buffers ---
      {
        let type: util.types = new util.types();
        let list: Array<Object> = [new ArrayBuffer(2), new Uint8Array(2), new ArrayBuffer(6), new Date(0)];
        let buffers: Array<Object> = list.filter((item: Object): boolean => type.isAnyArrayBuffer(item));
        expect(buffers.length).assertEqual(2);
        expect(buffers[0] instanceof ArrayBuffer).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2000
     * @tc.name testTypesIsAnyArrayBuffer020
     * @tc.desc Merged batch (5 tests): Container and field storage: every element of an ArrayBuffer array is recognised as an any array buffer; accepts an ArrayBuffer recovered as a Map key by iterating the key set and from a Set member by iteration; accepts the ArrayBuffer a WeakMap hands back for its holder key; accepts an ArrayBuffer recovered from a Map value through get at its stored 10 byte length; accepts an ArrayBuffer read out of a Record field addressed by a quoted key.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every element of an ArrayBuffer array is recognised as an any array buffer ---
      {
        let type: util.types = new util.types();
        let buffers: Array<ArrayBuffer> = [new ArrayBuffer(2), new ArrayBuffer(8), new ArrayBuffer(64)];
        expect(type.isAnyArrayBuffer(buffers[0])).assertTrue();
        expect(type.isAnyArrayBuffer(buffers[1])).assertTrue();
        expect(type.isAnyArrayBuffer(buffers[2])).assertTrue();
      }

      // --- [2] Verify isAnyArrayBuffer returns true for an ArrayBuffer recovered as a Map key by iterating the key set and from a Set member by iteration ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let map: Map<ArrayBuffer, string> = new Map<ArrayBuffer, string>();
        map.set(ab, 'payload');
        let recovered: ArrayBuffer = ab;
        for (const key of map.keys()) {
          recovered = key;
        }
        expect(type.isAnyArrayBuffer(recovered)).assertTrue();
        expect(recovered.byteLength).assertEqual(6);
        let type_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(5);
        let set: Set<ArrayBuffer> = new Set<ArrayBuffer>();
        set.add(ab_2);
        let recovered_2: ArrayBuffer = ab_2;
        for (const item of set) {
          recovered_2 = item;
        }
        expect(type_2.isAnyArrayBuffer(recovered_2)).assertTrue();
        expect(recovered_2.byteLength).assertEqual(5);
      }

      // --- [3] Verify isAnyArrayBuffer returns true for the ArrayBuffer a WeakMap hands back for its holder key ---
      {
        let type: util.types = new util.types();
        let key: BufferHolder = new BufferHolder();
        let ab: ArrayBuffer = new ArrayBuffer(12);
        let weak: WeakMap<BufferHolder, ArrayBuffer> = new WeakMap<BufferHolder, ArrayBuffer>();
        weak.set(key, ab);
        let back: ArrayBuffer | undefined = weak.get(key);
        expect(back !== undefined).assertTrue();
        expect(type.isAnyArrayBuffer(back as Object)).assertTrue();
      }

      // --- [4] Verify isAnyArrayBuffer returns true for an ArrayBuffer recovered from a Map value through get at its stored 10 byte length ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(10);
        let map: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();
        map.set('slot', ab);
        let restored: ArrayBuffer | undefined = map.get('slot');
        expect(restored !== undefined).assertTrue();
        expect(type.isAnyArrayBuffer(restored as Object)).assertTrue();
        expect((restored as ArrayBuffer).byteLength).assertEqual(10);
      }

      // --- [5] Verify isAnyArrayBuffer returns true for an ArrayBuffer read out of a Record field addressed by a quoted key ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(9);
        let rec: Record<string, ArrayBuffer> = { 'store': ab };
        let field: ArrayBuffer = rec['store']!;
        expect(type.isAnyArrayBuffer(field)).assertTrue();
        expect(field.byteLength).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2100
     * @tc.name testTypesIsAnyArrayBuffer021
     * @tc.desc Merged batch (3 tests): Container and field storage: accepts an ArrayBuffer carried by an interface typed field; stored into and released by a holder object and nested inside a two level array; read back from the last index after a push grew the list.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns true for an ArrayBuffer carried by an interface typed field ---
      {
        let type: util.types = new util.types();
        let carrier: BufferCarrier = { payload: new ArrayBuffer(14) };
        expect(type.isAnyArrayBuffer(carrier.payload)).assertTrue();
        expect(carrier.payload.byteLength).assertEqual(14);
      }

      // --- [2] Verify isAnyArrayBuffer returns true for an ArrayBuffer stored into and released by a holder object and nested inside a two level array ---
      {
        let type: util.types = new util.types();
        let vault: BufferVault = new BufferVault();
        let ab: ArrayBuffer = new ArrayBuffer(18);
        vault.store(ab);
        expect(type.isAnyArrayBuffer(vault.release())).assertTrue();
        expect(vault.release().byteLength).assertEqual(18);
        let type_2: util.types = new util.types();
        let nested: Array<Array<ArrayBuffer>> = [[new ArrayBuffer(4)]];
        expect(type_2.isAnyArrayBuffer(nested[0][0])).assertTrue();
      }

      // --- [3] Verify isAnyArrayBuffer returns true for an ArrayBuffer read back from the last index after a push grew the list ---
      {
        let type: util.types = new util.types();
        let list: Array<ArrayBuffer> = [new ArrayBuffer(2)];
        list.push(new ArrayBuffer(30));
        expect(type.isAnyArrayBuffer(list[list.length - 1])).assertTrue();
        expect(list[list.length - 1].byteLength).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2200
     * @tc.name testTypesIsAnyArrayBuffer022
     * @tc.desc Merged batch (5 tests): API call consistency: accepts an ArrayBuffer while negative Infinity is rejected; a DataView is still rejected and Map is still rejected; a Uint8Array is still rejected; rejects the digit string derived from two buffer bytes while the buffer is true; a nullable Object field storing a buffer is recognized as an any array buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns true for an ArrayBuffer while negative Infinity is rejected ---
      {
        let type: util.types = new util.types();
        let value: double = Double.NEGATIVE_INFINITY;
        expect(type.isAnyArrayBuffer(new ArrayBuffer(2))).assertTrue();
        expect(type.isAnyArrayBuffer(value)).assertFalse();
      }

      // --- [2] Verify isAnyArrayBuffer returns true for an ArrayBuffer while a DataView is still rejected and Map is still rejected ---
      {
        let type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(new ArrayBuffer(8))).assertTrue();
        expect(type.isAnyArrayBuffer(new DataView(new ArrayBuffer(4)))).assertFalse();
        let type_2: util.types = new util.types();
        expect(type_2.isAnyArrayBuffer(new ArrayBuffer(32))).assertTrue();
        expect(type_2.isAnyArrayBuffer(new Map<string, int>())).assertFalse();
      }

      // --- [3] Verify isAnyArrayBuffer returns true for an ArrayBuffer while a Uint8Array is still rejected ---
      {
        let type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(new ArrayBuffer(4))).assertTrue();
        expect(type.isAnyArrayBuffer(new Uint8Array(2))).assertFalse();
      }

      // --- [4] Verify isAnyArrayBuffer returns false for the digit string derived from two buffer bytes while the buffer is true ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(2);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(0, 65);
        uint8View.$_set(1, 66);
        let text: string = uint8View.$_get(0).toString() + uint8View.$_get(1).toString();
        expect(text).assertEqual('6566');
        expect(type.isAnyArrayBuffer(text)).assertFalse();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [5] Verify a nullable Object field storing a buffer is recognized as an any array buffer while the same field storing a Date is not ---
      {
        let type: util.types = new util.types();
        let slot: NullableSlot = new NullableSlot();
        slot.value = new ArrayBuffer(8);
        expect(type.isAnyArrayBuffer(slot.value as Object)).assertTrue();
        slot.value = new Date(0);
        expect(type.isAnyArrayBuffer(slot.value as Object)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2300
     * @tc.name testTypesIsAnyArrayBuffer023
     * @tc.desc Merged batch (5 tests): API call consistency: a holder reached through a two level Map and a Uint8Array stored as a Map value fail; rejects a Set iterator over buffers while every iterated element is true; rejects a zero length Uint8Array over a zero byte buffer while the buffer is true; isAnyArrayBuffer accepts a buffer used as a WeakMap key while rejecting the WeakMap itself; accepts a stored buffer and false for a stored view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a holder reached through a two level Map and a Uint8Array stored as a Map value fail while the buffer behind each is true ---
      {
        let type: util.types = new util.types();
        let outer: Map<string, BufferHolder> = new Map<string, BufferHolder>();
        let holder: BufferHolder = new BufferHolder();
        outer.set('h', holder);
        let picked: BufferHolder | undefined = outer.get('h');
        expect(picked !== undefined).assertTrue();
        expect(type.isAnyArrayBuffer(picked as Object)).assertFalse();
        expect(type.isAnyArrayBuffer(holder.buf)).assertTrue();
        let type_2: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let map: Map<string, Uint8Array> = new Map<string, Uint8Array>();
        map.set('view', uint8View);
        let stored: Uint8Array | undefined = map.get('view');
        expect(stored !== undefined).assertTrue();
        expect(type_2.isAnyArrayBuffer(stored as Object)).assertFalse();
        expect(type_2.isAnyArrayBuffer(ab)).assertTrue();
      }

      // --- [2] Verify isAnyArrayBuffer returns false for a Set iterator over buffers while every iterated element is true ---
      {
        let type: util.types = new util.types();
        let buffers: Set<ArrayBuffer> = new Set<ArrayBuffer>();
        buffers.add(new ArrayBuffer(2));
        buffers.add(new ArrayBuffer(4));
        let iter: IterableIterator<ArrayBuffer> = buffers.values();
        expect(type.isAnyArrayBuffer(iter)).assertFalse();
        let seen: int = 0;
        for (const item of iter) {
          if (type.isAnyArrayBuffer(item)) {
            seen = seen + 1;
          }
        }
        expect(seen).assertEqual(2);
      }

      // --- [3] Verify isAnyArrayBuffer returns false for a zero length Uint8Array over a zero byte buffer while the buffer is true ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0);
        let uint8View: Uint8Array = new Uint8Array(ab);
        expect(type.isAnyArrayBuffer(uint8View)).assertFalse();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(uint8View.length).assertEqual(0);
      }

      // --- [4] Verify isAnyArrayBuffer accepts a buffer used as a WeakMap key while rejecting the WeakMap itself ---
      {
        let type: util.types = new util.types();
        let key: ArrayBuffer = new ArrayBuffer(4);
        let registry: WeakMap<ArrayBuffer, string> = new WeakMap<ArrayBuffer, string>();
        registry.set(key, 'north');
        expect(type.isAnyArrayBuffer(key)).assertTrue();
        expect(registry.has(key)).assertTrue();
        expect(type.isAnyArrayBuffer(registry)).assertFalse();
        expect(type.isWeakMap(registry)).assertTrue();
      }

      // --- [5] Verify a holder method that judges its payload returns true for a stored buffer and false for a stored view ---
      {
        let type: util.types = new util.types();
        let bufferCell: BufferCell = new BufferCell(new ArrayBuffer(7));
        let viewCell: BufferCell = new BufferCell(new Uint8Array(7));
        expect(bufferCell.judgeHeld(type)).assertTrue();
        expect(viewCell.judgeHeld(type)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2400
     * @tc.name testTypesIsAnyArrayBuffer024
     * @tc.desc Merged batch (5 tests): API call consistency: the owner buffer shared by a DataView and an Int32Array is accepted; two consecutive isAnyArrayBuffer calls on the same buffer return the same true value; one receiver separates predicates: a plain buffer is any-array-buffer only; two separate receiver instances agree on true for a buffer and false for a view; a helper returns a verdict pair that is true for the buffer argument and false for its view argument.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the owner buffer shared by a DataView and an Int32Array is accepted while the DataView is rejected and both views keep the owner ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let dv: DataView = new DataView(ab);
        let int32View: Int32Array = new Int32Array(ab);
        expect(dv.buffer).assertEqual(int32View.buffer);
        expect(type.isAnyArrayBuffer(dv.buffer)).assertTrue();
        expect(int32View.length * 4).assertEqual(dv.byteLength);
        expect(type.isAnyArrayBuffer(dv)).assertFalse();
        let type_2: util.types = new util.types();
        let bundle: ViewBundle = new ViewBundle(new ArrayBuffer(16));
        expect(type_2.isAnyArrayBuffer(bundle.owner)).assertTrue();
        expect(type_2.isAnyArrayBuffer(bundle.primary)).assertFalse();
        expect(bundle.primary.buffer).assertEqual(bundle.owner);
        expect(bundle.secondary.buffer).assertEqual(bundle.owner);
      }

      // --- [2] Verify two consecutive isAnyArrayBuffer calls on the same buffer return the same true value ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let first: boolean = type.isAnyArrayBuffer(ab);
        let second: boolean = type.isAnyArrayBuffer(ab);
        expect(first).assertEqual(second);
        expect(first).assertTrue();
      }

      // --- [3] Verify one receiver separates predicates: a plain buffer is any-array-buffer only while a DataView is a view only ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(type.isArrayBufferView(ab)).assertFalse();
        expect(type.isTypedArray(ab)).assertFalse();
        let type_2: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(8));
        expect(type_2.isAnyArrayBuffer(dv)).assertFalse();
        expect(type_2.isArrayBufferView(dv)).assertTrue();
        expect(type_2.isTypedArray(dv)).assertFalse();
      }

      // --- [4] Verify two separate receiver instances agree on true for a buffer and false for a view ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(3);
        let uint8View: Uint8Array = new Uint8Array(3);
        expect(first.isAnyArrayBuffer(ab)).assertTrue();
        expect(second.isAnyArrayBuffer(ab)).assertTrue();
        expect(first.isAnyArrayBuffer(uint8View)).assertFalse();
        expect(second.isAnyArrayBuffer(uint8View)).assertFalse();
      }

      // --- [5] Verify a helper returns a verdict pair that is true for the buffer argument and false for its view argument ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let verdicts: Array<boolean> = verdictPair(type, ab, new Uint8Array(ab));
        expect(verdicts[0]).assertTrue();
        expect(verdicts[1]).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2500
     * @tc.name testTypesIsAnyArrayBuffer025
     * @tc.desc Merged batch (5 tests): API call consistency: accepts a view; ArrayBuffer.from and ArrayBuffer.bytesLength agree on the bytes of a text that holds one two byte character; rejects a Date subclass instance while isDate reports true; rejects an Error subclass instance while isNativeError reports true; isAnyArrayBuffer rejects the view a conditional expression selects.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one receiver returns false for a view while isTypedArray returns true for a view ---
      {
        let type: util.types = new util.types();
        let bufferResult: boolean = type.isAnyArrayBuffer(new Uint8Array(2));
        let typedResult: boolean = type.isTypedArray(new Uint8Array(2));
        expect(bufferResult).assertFalse();
        expect(typedResult).assertTrue();
      }

      // --- [2] Verify ArrayBuffer.from and ArrayBuffer.bytesLength agree on the bytes of a text that holds one two byte character ---
      {
        let anyProbe: util.types = new util.types();
        let text: string = 'h\u00e9llo';
        let encoded: ArrayBuffer = ArrayBuffer.from(text, 'utf8');
        let expectedBytes: int = ArrayBuffer.bytesLength(text, 'utf8');
        expect(expectedBytes).assertEqual(6);
        expect(encoded.getByteLength()).assertEqual(expectedBytes);
        expect(anyProbe.isAnyArrayBuffer(encoded)).assertTrue();
      }

      // --- [3] Verify isAnyArrayBuffer returns false for a Date subclass instance while isDate reports true ---
      {
        let type: util.types = new util.types();
        let marked: Date = new MarkedDate(0);
        expect(type.isAnyArrayBuffer(marked)).assertFalse();
        expect(type.isDate(marked)).assertTrue();
      }

      // --- [4] Verify isAnyArrayBuffer returns false for an Error subclass instance while isNativeError reports true ---
      {
        let type: util.types = new util.types();
        let tagged: Error = new TaggedError('probe');
        expect(type.isAnyArrayBuffer(tagged)).assertFalse();
        expect(type.isNativeError(tagged)).assertTrue();
      }

      // --- [5] Verify isAnyArrayBuffer rejects the view a conditional expression selects while the buffer behind it is still accepted ---
      {
        let type: util.types = new util.types();
        let flag: boolean = false;
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let picked: Object = flag ? ab : new Uint8Array(ab);
        expect(type.isAnyArrayBuffer(picked)).assertFalse();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2600
     * @tc.name testTypesIsAnyArrayBuffer026
     * @tc.desc Merged batch (5 tests): Program integration: isAnyArrayBuffer returns true when the argument is an ArrayBuffer chosen by a conditional expression; argument is an ArrayBuffer produced by a helper function return value; buffer is forwarded by a two parameter helper to the receiver; accepts every buffer built in a three iteration loop; a conditional expression driven by isAnyArrayBuffer selects the is-buffer branch label.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAnyArrayBuffer returns true when the argument is an ArrayBuffer chosen by a conditional expression ---
      {
        let type: util.types = new util.types();
        let flag: boolean = true;
        let target: Object = flag ? new ArrayBuffer(4) : new ArrayBuffer(8);
        expect(type.isAnyArrayBuffer(target)).assertTrue();
      }

      // --- [2] Verify isAnyArrayBuffer returns true when the argument is an ArrayBuffer produced by a helper function return value ---
      {
        let type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(buildBuffer())).assertTrue();
      }

      // --- [3] Verify isAnyArrayBuffer returns true when the buffer is forwarded by a two parameter helper to the receiver ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(2);
        expect(probeBuffer(type, ab)).assertTrue();
      }

      // --- [4] Verify isAnyArrayBuffer returns true for every buffer built in a three iteration loop ---
      {
        let type: util.types = new util.types();
        let allBuffers: boolean = true;
        for (let i: int = 0; i < 3; i++) {
          if (!type.isAnyArrayBuffer(new ArrayBuffer(i + 1))) {
            allBuffers = false;
          }
        }
        expect(allBuffers).assertTrue();
      }

      // --- [5] Verify a conditional expression driven by isAnyArrayBuffer selects the is-buffer branch label ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(2);
        let branch: string = type.isAnyArrayBuffer(ab) ? 'is-buffer' : 'not-buffer';
        expect(branch).assertEqual('is-buffer');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2700
     * @tc.name testTypesIsAnyArrayBuffer027
     * @tc.desc Merged batch (2 tests): Program integration: an integer code derived from the isAnyArrayBuffer result selects the buffer arm of a switch; a helper that early returns under isAnyArrayBuffer reports index one for the first buffer in a mixed list.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an integer code derived from the isAnyArrayBuffer result selects the buffer arm of a switch ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(2);
        let uint8View: Uint8Array = new Uint8Array(2);
        let bufferCode: int = type.isAnyArrayBuffer(ab) ? 1 : 0;
        let viewCode: int = type.isAnyArrayBuffer(uint8View) ? 1 : 0;
        let label: string = '';
        switch (bufferCode) {
          case 1:
            label = 'buffer';
            break;
          default:
            label = 'other';
            break;
        }
        expect(viewCode).assertEqual(0);
        expect(label).assertEqual('buffer');
      }

      // --- [2] Verify a helper that early returns under isAnyArrayBuffer reports index one for the first buffer in a mixed list ---
      {
        let type: util.types = new util.types();
        let list: Array<Object> = [new Uint8Array(2), new ArrayBuffer(4), new ArrayBuffer(8)];
        expect(firstBufferIndex(list, type)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ANY_ARRAY_BUFFER_2800
     * @tc.name testTypesIsAnyArrayBuffer028
     * @tc.desc Merged batch (2 tests): Miscellaneous checks: verifies remaining edge cases, covering ArrayBuffer objects and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAnyArrayBuffer028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting a Map key leaves the substitute buffer judged true and the map at size one ---
      {
        let type: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let map: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();
        map.set('first', new ArrayBuffer(2));
        map.set('first', ab);
        let current: ArrayBuffer | undefined = map.get('first');
        expect(current !== undefined).assertTrue();
        expect(type.isAnyArrayBuffer(current as Object)).assertTrue();
        expect(map.size).assertEqual(1);
      }

      // --- [2] Verify isAnyArrayBuffer returns true for the substitute buffer stored in a Record field under an existing key ---
      {
        let type: util.types = new util.types();
        let rec: Record<string, ArrayBuffer> = { 'first': new ArrayBuffer(2) };
        rec['first'] = new ArrayBuffer(10);
        let current: ArrayBuffer = rec['first']!;
        expect(type.isAnyArrayBuffer(current)).assertTrue();
        expect(current.byteLength).assertEqual(10);
      }
    });

  });
}
