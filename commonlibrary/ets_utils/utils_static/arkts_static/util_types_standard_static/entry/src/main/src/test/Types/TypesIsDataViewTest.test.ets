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

class ViewTag {
  tag: int = 1;
  label: string = 'view';
}

interface Shape2D {
  w: int;
  h: int;
}

interface ConfigBox {
  a: int;
  b: string;
}

class ViewHolder {
  view: DataView = new DataView(new ArrayBuffer(8));

  produce(): DataView {
    return new DataView(new ArrayBuffer(3), 0, 3);
  }
}

interface ViewSlot {
  view: DataView;
}

interface NestedSlot {
  inner: ViewSlot;
}

class PayloadSlot {
  payload: Object = new DataView(new ArrayBuffer(4));

  inspect(value: Object): boolean {
    return new util.types().isDataView(value);
  }
}

class ViewMimic {
  buffer: ArrayBuffer = new ArrayBuffer(4);
  byteLength: int = 4;
  byteOffset: int = 0;
}

class SubError extends Error {
  constructor(message: string) {
    super(message);
  }
}

function probeViewArgument(value: Object): boolean {
  return new util.types().isDataView(value);
}

function buildWindowView(): DataView {
  return new DataView(new ArrayBuffer(16), 4, 8);
}

function classifyView(value: Object): string {
  if (probeViewArgument(value)) {
    return 'view';
  }
  return 'other';
}

function labelForVerdict(flag: boolean): string {
  return flag ? 'view' : 'other';
}

function fillViewByte(value: DataView, index: int, octet: int): void {
  value.setUint8(index, octet);
}

export default function typesIsDataViewTest(): void {
  describe('TypesIsDataViewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0100
     * @tc.name testTypesIsDataView001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts DataViews spanning eight and 1024 byte buffers and one whose byteOffset 8 ends exactly at a sixteen byte buffer; accepts DataViews built with the explicit byteOffset and byteLength pairs 2,4 and 4,4 over an eight byte buffer; a DataView constructed after the buffer was populated reads back the pre-existing bytes and is recognised; accepts a DataView spanning a one megabyte buffer, the large allocation boundary; a float written through setFloat32 round trips through getFloat32 as the exact value 2.5.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify DataViews spanning eight and 1024 byte buffers and one whose byteOffset 8 ends exactly at a sixteen byte buffer are accepted ---
      {
        let dataViewProbe: util.types = new util.types();
        let small: DataView = new DataView(new ArrayBuffer(8));
        let large: DataView = new DataView(new ArrayBuffer(1024));
        expect(dataViewProbe.isDataView(small)).assertTrue();
        expect(dataViewProbe.isDataView(large)).assertTrue();
        expect(large.byteLength).assertEqual(1024);
        let dataViewProbe_2: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let tail: DataView = new DataView(ab, 8, 8);
        expect(dataViewProbe_2.isDataView(tail)).assertTrue();
        expect(tail.byteOffset).assertEqual(8);
        expect(tail.byteLength).assertEqual(8);
      }

      // --- [2] Verify isDataView returns true for DataViews built with the explicit byteOffset and byteLength pairs 2,4 and 4,4 over an eight byte buffer ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let left: DataView = new DataView(ab, 2, 4);
        let right: DataView = new DataView(ab, 4, 4);
        expect(dataViewProbe.isDataView(left)).assertTrue();
        expect(dataViewProbe.isDataView(right)).assertTrue();
        expect(left.byteOffset).assertEqual(2);
        expect(right.byteOffset).assertEqual(4);
        expect(left.byteLength).assertEqual(4);
        expect(right.byteLength).assertEqual(4);
      }

      // --- [3] Verify a DataView constructed after the buffer was populated reads back the pre-existing bytes and is recognised ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(0, 11);
        uint8View.$_set(1, 238);
        let dv: DataView = new DataView(ab);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getUint16(0, true)).assertEqual(60939);
      }

      // --- [4] Verify isDataView returns true for a DataView spanning a one megabyte buffer, the large allocation boundary ---
      {
        let dataViewProbe: util.types = new util.types();
        let views: DataView[] = [new DataView(new ArrayBuffer(1048576))];
        expect(dataViewProbe.isDataView(views[0])).assertTrue();
        expect(views[0].byteLength).assertEqual(1048576);
        expect(views[0].byteOffset).assertEqual(0);
      }

      // --- [5] Verify a float written through setFloat32 round trips through getFloat32 as the exact value 2.5 ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let f: float = 2.5f;
        dv.setFloat32(0, f, true);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getFloat32(0, true)).assertEqual(2.5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0200
     * @tc.name testTypesIsDataView002
     * @tc.desc Merged batch (3 tests): Basic construction and recognition: a DataView over an offset Float32Array buffer reads the shared byte and one cloned from another DataView window covers the same bytes; isDataView accepts a DataView whose shared buffer is also written through a Uint8Array view; a sixteen bit value written through one DataView is read through a second DataView over the same buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a DataView over an offset Float32Array buffer reads the shared byte and one cloned from another DataView window covers the same bytes ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(9, 45);
        let float32View: Float32Array = new Float32Array(ab, 8, 4);
        let dv: DataView = new DataView(float32View.buffer, 8, 16);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getUint8(1)).assertEqual(45);
        expect(float32View.byteOffset).assertEqual(8);
        let dataViewProbe_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(16);
        let origin: DataView = new DataView(ab_2, 4, 6);
        let clone: DataView = new DataView(origin.buffer, origin.byteOffset, origin.byteLength);
        origin.setUint8(0, 205);
        expect(dataViewProbe_2.isDataView(clone)).assertTrue();
        expect(dataViewProbe_2.isDataView(origin)).assertTrue();
        expect(clone.getUint8(0)).assertEqual(205);
      }

      // --- [2] Verify isDataView accepts a DataView whose shared buffer is also written through a Uint8Array view ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let dv: DataView = new DataView(ab, 0, 4);
        uint8View.$_set(0, 52);
        uint8View.$_set(1, 18);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(uint8View.$_get(0)).assertEqual(52);
        expect(uint8View.$_get(1)).assertEqual(18);
        uint8View.$_set(2, 99);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(uint8View.$_get(2)).assertEqual(99);
        expect(dv.byteLength).assertEqual(4);
      }

      // --- [3] Verify a sixteen bit value written through one DataView is read through a second DataView over the same buffer ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let writer: DataView = new DataView(ab, 0, 4);
        let reader: DataView = new DataView(ab, 2, 4);
        writer.setInt16(2, -3, true);
        expect(dataViewProbe.isDataView(writer)).assertTrue();
        expect(dataViewProbe.isDataView(reader)).assertTrue();
        expect(reader.getInt16(0, true)).assertEqual(-3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0300
     * @tc.name testTypesIsDataView003
     * @tc.desc Merged batch (4 tests): View and buffer semantics: verifies DataView writes, covering shared sibling views, signed reads, interdependent windows and little endian round trips.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a byte written at DataView offset 2 appears in the sibling Uint8Array and a DataView sharing an Int32Array buffer reads the signed element ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab, 2, 4);
        let uint8View: Uint8Array = new Uint8Array(ab);
        dv.setUint8(1, 128);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(uint8View.$_get(3)).assertEqual(128);
        let dataViewProbe_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(4);
        let dv_2: DataView = new DataView(ab_2);
        let int32View: Int32Array = new Int32Array(ab_2);
        dv_2.setInt32(0, -123456789, true);
        expect(dataViewProbe_2.isDataView(dv_2)).assertTrue();
        expect(dataViewProbe_2.isDataView(int32View)).assertFalse();
        expect(int32View.$_get(0)).assertEqual(-123456789);
      }

      // --- [2] Verify an Int8Array sharing the DataView buffer holds the negative element written through the DataView ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let dv: DataView = new DataView(ab);
        let int8View: Int8Array = new Int8Array(ab);
        dv.setUint8(0, 128);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dataViewProbe.isDataView(int8View)).assertFalse();
        expect(int8View.$_get(0)).assertEqual(-128);
      }

      // --- [3] Verify two distinct DataView objects built over the same window share a byte written through either one ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let first: DataView = new DataView(ab, 2, 4);
        let second: DataView = new DataView(ab, 2, 4);
        first.setUint8(0, 143);
        expect(dataViewProbe.isDataView(first)).assertTrue();
        expect(dataViewProbe.isDataView(second)).assertTrue();
        expect(second.getUint8(0)).assertEqual(143);
      }

      // --- [4] Verify getUint32 reads the full unsigned range stored by setUint32 and the little endian byte order it used ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        dv.setUint32(0, 4294967295, true);
        let wide: double = dv.getUint32(0, true);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(wide).assertEqual(4294967295);
        expect(dv.getUint8(0)).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0400
     * @tc.name testTypesIsDataView004
     * @tc.desc Merged batch (4 tests): Basic construction and recognition: verifies DataView behavior, covering collection iteration, big integer round trips, relative bytes and Map slots.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify the bytes written by setBigUint64 read as the maximum through getBigUint64 and minus one through getBigInt64 ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(8));
        dv.setBigUint64(0, 18446744073709551615n);
        let uma: bigint = dv.getBigUint64(0);
        let sma: bigint = dv.getBigInt64(0);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(uma).assertEqual(18446744073709551615n);
        expect(sma).assertEqual(-1n);
      }

      // --- [2] Verify a byte written at a window relative offset round trips through getUint8 while byteOffset and byteLength stay fixed ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(16), 5, 6);
        dv.setUint8(3, 219);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getUint8(3)).assertEqual(219);
        expect(dv.byteOffset).assertEqual(5);
        expect(dv.byteLength).assertEqual(6);
      }

      // --- [3] Verify every DataView yielded by a Set iteration passes and one created before an awaited sleep keeps its byteLength ---
      {
        let dataViewProbe: util.types = new util.types();
        let set: Set<DataView> = new Set<DataView>();
        set.add(new DataView(new ArrayBuffer(4)));
        set.add(new DataView(new ArrayBuffer(8)));
        let seen: int = 0;
        for (const item of set) {
          expect(dataViewProbe.isDataView(item)).assertTrue();
          seen = seen + 1;
        }
        expect(seen).assertEqual(2);
        expect(set.size).assertEqual(2);
        let dataViewProbe_2: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(12), 2, 8);
        await Utils.msSleep(30);
        expect(dataViewProbe_2.isDataView(dv)).assertTrue();
        expect(dv.byteLength).assertEqual(8);
        expect(dv.byteOffset).assertEqual(2);
      }

      // --- [4] Verify a Map value slot reports a DataView as a view while an ArrayBuffer and a later substituted Uint8Array are rejected ---
      {
        let dataViewProbe: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('v', new DataView(new ArrayBuffer(2)));
        m.set('b', new ArrayBuffer(2));
        let viewEntry: Object | undefined = m.get('v');
        let rawEntry: Object | undefined = m.get('b');
        let viewVerdict: boolean = false;
        let rawVerdict: boolean = true;
        if (viewEntry !== undefined) {
        viewVerdict = dataViewProbe.isDataView(viewEntry);
        }
        if (rawEntry !== undefined) {
        rawVerdict = dataViewProbe.isDataView(rawEntry);
        }
        expect(viewEntry !== undefined).assertTrue();
        expect(viewVerdict).assertTrue();
        expect(rawVerdict).assertFalse();
        m.set('slot', new DataView(new ArrayBuffer(2)));
        let first: Object | undefined = m.get('slot');
        let firstVerdict: boolean = false;
        if (first !== undefined) {
        firstVerdict = dataViewProbe.isDataView(first);
        }
        expect(firstVerdict).assertTrue();
        m.set('slot', new Uint8Array(2));
        let second: Object | undefined = m.get('slot');
        let secondVerdict: boolean = true;
        if (second !== undefined) {
        secondVerdict = dataViewProbe.isDataView(second);
        }
        expect(second !== undefined).assertTrue();
        expect(secondVerdict).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0500
     * @tc.name testTypesIsDataView005
     * @tc.desc Merged batch (5 tests): Boundary values: isDataView returns true at the length boundaries of a DataView, the zero byteLength view and the one byte view at offset 7; accepts a DataView over a zero byte ArrayBuffer, the empty backing buffer boundary; a write at the last index inside a tail DataView succeeds; rejects the double specials 1.5, negative zero, NaN and both infinities and zero length typed arrays of three kinds; the first and last elements of a DataView array are views and the negated verdict is false for a DataView, true for an int array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDataView returns true at the length boundaries of a DataView, the zero byteLength view and the one byte view at offset 7 ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let empty: DataView = new DataView(ab, 0, 0);
        let single: DataView = new DataView(ab, 7, 1);
        expect(dataViewProbe.isDataView(empty)).assertTrue();
        expect(dataViewProbe.isDataView(single)).assertTrue();
        expect(empty.byteLength).assertEqual(0);
        expect(single.byteLength).assertEqual(1);
      }

      // --- [2] Verify isDataView returns true for a DataView over a zero byte ArrayBuffer, the empty backing buffer boundary ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0);
        let dv: DataView = new DataView(ab, 0, 0);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.buffer.byteLength).assertEqual(0);
      }

      // --- [3] Verify a write at the last index inside a tail DataView succeeds while the next index beyond the window throws a RangeError ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab, 6, 2);
        dv.setUint8(1, 187);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getUint8(1)).assertEqual(187);
        try {
          dv.setUint8(2, 1);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
      }

      // --- [4] Verify the double specials 1.5, negative zero, NaN and both infinities and zero length typed arrays of three kinds are rejected ---
      {
        let dataViewChecker: util.types = new util.types();
        let fraction: double = 1.5;
        let negZero: double = -0.0;
        expect(dataViewChecker.isDataView(fraction)).assertFalse();
        expect(dataViewChecker.isDataView(negZero)).assertFalse();
        expect(dataViewChecker.isDataView(Double.NaN)).assertFalse();
        expect(dataViewChecker.isDataView(Double.POSITIVE_INFINITY)).assertFalse();
        expect(dataViewChecker.isDataView(Double.NEGATIVE_INFINITY)).assertFalse();
        let dataViewProbe: util.types = new util.types();
        let e8: Uint8Array = new Uint8Array(0);
        let e32: Int32Array = new Int32Array(0);
        let f64e: Float64Array = new Float64Array(0);
        expect(dataViewProbe.isDataView(e8)).assertFalse();
        expect(dataViewProbe.isDataView(e32)).assertFalse();
        expect(dataViewProbe.isDataView(f64e)).assertFalse();
        expect(e8.length).assertEqual(0);
        expect(e32.length).assertEqual(0);
      }

      // --- [5] Verify the first and last elements of a DataView array are views and the negated verdict is false for a DataView, true for an int array ---
      {
        let dataViewProbe: util.types = new util.types();
        let views: DataView[] = [new DataView(new ArrayBuffer(1)), new DataView(new ArrayBuffer(2)),
          new DataView(new ArrayBuffer(4))];
        expect(dataViewProbe.isDataView(views[0])).assertTrue();
        expect(dataViewProbe.isDataView(views[views.length - 1])).assertTrue();
        expect(views.length).assertEqual(3);
        let dataViewProbe_2: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let arr: int[] = [1];
        expect(!dataViewProbe_2.isDataView(dv)).assertFalse();
        expect(!dataViewProbe_2.isDataView(arr)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0600
     * @tc.name testTypesIsDataView006
     * @tc.desc Merged batch (3 tests): Boundary values: a true verdict leaves the zero byteLength boundary and the byteOffset 120 of a tail view unchanged; the verdict stays true across ten consecutive calls and the 256 zero bytes of the tested backing buffer stay zero; the values iterator of a Map is not a DataView and stays so after one element has been consumed.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a true verdict leaves the zero byteLength boundary and the byteOffset 120 of a tail view unchanged ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let empty: DataView = new DataView(ab, 6, 0);
        let far: ArrayBuffer = new ArrayBuffer(128);
        let tail: DataView = new DataView(far, 120, 8);
        expect(dataViewProbe.isDataView(empty)).assertTrue();
        expect(dataViewProbe.isDataView(tail)).assertTrue();
        expect(empty.byteLength).assertEqual(0);
        expect(tail.byteOffset).assertEqual(120);
      }

      // --- [2] Verify the verdict stays true across ten consecutive calls and the 256 zero bytes of the tested backing buffer stay zero ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(256);
        let dv: DataView = new DataView(ab, 0, 256);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let stable: boolean = true;
        for (let i: int = 0; i < 10; i++) {
          if (!dataViewProbe.isDataView(dv)) {
            stable = false;
          }
        }
        let zeros: int = 0;
        for (let i: int = 0; i < 256; i++) {
          if (uint8View.$_get(i) === 0) {
            zeros++;
          }
        }
        expect(stable).assertTrue();
        expect(zeros).assertEqual(256);
      }

      // --- [3] Verify the values iterator of a Map is not a DataView and stays so after one element has been consumed ---
      {
        let dataViewProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let it: IterableIterator<int> = m.values();
        expect(dataViewProbe.isDataView(it)).assertFalse();
        expect(it.next().value).assertEqual(1);
        expect(dataViewProbe.isDataView(it)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0700
     * @tc.name testTypesIsDataView007
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the int primitives 0, 1, -1 and the int maximum 2147483647; rejects strings: empty, ascii, non-ascii and a very long one; boolean primitives true and false; bigint element read out of a BigInt64Array; rejects a Float32Array and for a Float64Array carrying NaN and positive infinity.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDataView returns false for the int primitives 0, 1, -1 and the int maximum 2147483647 ---
      {
        let dataViewChecker: util.types = new util.types();
        expect(dataViewChecker.isDataView(0)).assertFalse();
        expect(dataViewChecker.isDataView(1)).assertFalse();
        expect(dataViewChecker.isDataView(-1)).assertFalse();
        expect(dataViewChecker.isDataView(2147483647)).assertFalse();
      }

      // --- [2] Verify isDataView returns false for strings: empty, ascii, non-ascii and a very long one ---
      {
        let dataViewProbe: util.types = new util.types();
        let nonAscii: string = '\u4f60\u597d';
        let longText: string = 'x'.repeat(10000);
        expect(dataViewProbe.isDataView('')).assertFalse();
        expect(dataViewProbe.isDataView('abc')).assertFalse();
        expect(dataViewProbe.isDataView(nonAscii)).assertFalse();
        expect(dataViewProbe.isDataView(longText)).assertFalse();
        expect(longText.length).assertEqual(10000);
      }

      // --- [3] Verify isDataView returns false for the boolean primitives true and false ---
      {
        let dataViewChecker: util.types = new util.types();
        expect(dataViewChecker.isDataView(true)).assertFalse();
        expect(dataViewChecker.isDataView(false)).assertFalse();
      }

      // --- [4] Verify isDataView returns false for the bigint element read out of a BigInt64Array ---
      {
        let dataViewChecker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let big: bigint = bigInt64View.$_get(0);
        expect(dataViewChecker.isDataView(big)).assertFalse();
      }

      // --- [5] Verify isDataView returns false for a Float32Array and for a Float64Array carrying NaN and positive infinity ---
      {
        let dataViewChecker: util.types = new util.types();
        let float32View: Float32Array = new Float32Array([3.5, -2.25]);
        let float64View: Float64Array = new Float64Array([Double.NaN, Double.POSITIVE_INFINITY]);
        expect(dataViewChecker.isDataView(float32View)).assertFalse();
        expect(dataViewChecker.isDataView(float64View)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0800
     * @tc.name testTypesIsDataView008
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a BigInt64Array and for a BigUint64Array; rejects a Promise already resolved with the int 1; rejects both an empty int array and a non empty int array; a false verdict leaves a Uint8Array element, the length of a three element string array and a Map container fully usable; a DataView sharing a buffer with a BigInt64Array is a view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDataView returns false for a BigInt64Array and for a BigUint64Array ---
      {
        let dataViewChecker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let bigUint64View: BigUint64Array = new BigUint64Array(1);
        expect(dataViewChecker.isDataView(bigInt64View)).assertFalse();
        expect(dataViewChecker.isDataView(bigUint64View)).assertFalse();
      }

      // --- [2] Verify isDataView returns false for a Promise already resolved with the int 1 ---
      {
        let dataViewChecker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(dataViewChecker.isDataView(p)).assertFalse();
      }

      // --- [3] Verify isDataView returns false for both an empty int array and a non empty int array ---
      {
        let dataViewProbe: util.types = new util.types();
        let empty: int[] = [];
        let filled: int[] = [1, 2, 3];
        expect(dataViewProbe.isDataView(empty)).assertFalse();
        expect(dataViewProbe.isDataView(filled)).assertFalse();
        expect(filled.length).assertEqual(3);
      }

      // --- [4] Verify a false verdict leaves a Uint8Array element, the length of a three element string array and a Map container fully usable ---
      {
        let dataViewProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([3]);
        let words: string[] = ['a', 'b', 'c'];
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        expect(dataViewProbe.isDataView(uint8View)).assertFalse();
        expect(dataViewProbe.isDataView(words)).assertFalse();
        expect(dataViewProbe.isDataView(m)).assertFalse();
        m.set('b', 2);
        expect(uint8View.$_get(0)).assertEqual(3);
        expect(words.length).assertEqual(3);
        expect(m.has('b')).assertTrue();
        expect(m.size).assertEqual(2);
      }

      // --- [5] Verify a DataView sharing a buffer with a BigInt64Array is a view while the typed array is not and the byte at the last index stays readable ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(7, 1);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab);
        let dv: DataView = new DataView(ab);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dataViewProbe.isDataView(bigInt64View)).assertFalse();
        expect(dv.getUint8(7)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_0900
     * @tc.name testTypesIsDataView009
     * @tc.desc Merged batch (2 tests): Primitive value rejection: a false verdict leaves the int and string fields of an interface object unchanged; rejects a Record container holding one int entry.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a false verdict leaves the int and string fields of an interface object unchanged ---
      {
        let dataViewProbe: util.types = new util.types();
        let cfg: ConfigBox = { a: 7, b: 'k' };
        expect(dataViewProbe.isDataView(cfg)).assertFalse();
        expect(cfg.a).assertEqual(7);
        expect(cfg.b).assertEqual('k');
      }

      // --- [2] Verify isDataView returns false for a Record container holding one int entry ---
      {
        let dataViewChecker: util.types = new util.types();
        let rec: Record<string, int> = { 'k': 1 };
        expect(dataViewChecker.isDataView(rec)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1000
     * @tc.name testTypesIsDataView010
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a candidate array mixing four ArrayBuffer capacities with a DataView, a Uint8Array and a class instance yields exactly one true verdict; reassigning an Object typed local from a DataView to a Uint8Array flips the verdict from true to false; rejects the raw ArrayBuffer reached through the buffer property of a DataView; the three eight bit typed array kinds and the four sixteen and thirty two bit kinds are all rejected; rejects a Uint8Array built over the buffer owned by a DataView.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a candidate array mixing four ArrayBuffer capacities with a DataView, a Uint8Array and a class instance yields exactly one true verdict ---
      {
        let dataViewProbe: util.types = new util.types();
        let candidates: Array<Object> = [new ArrayBuffer(0), new ArrayBuffer(1), new ArrayBuffer(8),
          new ArrayBuffer(1024), new DataView(new ArrayBuffer(2)), new Uint8Array(2), new ViewTag()];
        let hits: int = 0;
        for (let i: int = 0; i < candidates.length; i++) {
          if (dataViewProbe.isDataView(candidates[i])) {
            hits++;
          }
        }
        expect(hits).assertEqual(1);
      }

      // --- [2] Verify reassigning an Object typed local from a DataView to a Uint8Array flips the verdict from true to false ---
      {
        let dataViewChecker: util.types = new util.types();
        let held: Object = new DataView(new ArrayBuffer(4));
        expect(dataViewChecker.isDataView(held)).assertTrue();
        held = new Uint8Array(4);
        expect(dataViewChecker.isDataView(held)).assertFalse();
      }

      // --- [3] Verify isDataView returns false for the raw ArrayBuffer reached through the buffer property of a DataView ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab, 2, 4);
        let raw: ArrayBuffer = dv.buffer;
        expect(dataViewProbe.isDataView(raw)).assertFalse();
        expect(raw.byteLength).assertEqual(8);
      }

      // --- [4] Verify the three eight bit typed array kinds and the four sixteen and thirty two bit kinds are all rejected ---
      {
        let dataViewChecker: util.types = new util.types();
        let int8View: Int8Array = new Int8Array([-128, 127]);
        let uint8View: Uint8Array = new Uint8Array([0, 255]);
        let clampedBytes: Uint8ClampedArray = new Uint8ClampedArray(2);
        expect(dataViewChecker.isDataView(int8View)).assertFalse();
        expect(dataViewChecker.isDataView(uint8View)).assertFalse();
        expect(dataViewChecker.isDataView(clampedBytes)).assertFalse();
        let dataViewChecker_2: util.types = new util.types();
        let int16View: Int16Array = new Int16Array([32767]);
        let uint16View: Uint16Array = new Uint16Array([65535]);
        let int32View: Int32Array = new Int32Array([2147483647]);
        let uint32View: Uint32Array = new Uint32Array([4294967295]);
        expect(dataViewChecker_2.isDataView(int16View)).assertFalse();
        expect(dataViewChecker_2.isDataView(uint16View)).assertFalse();
        expect(dataViewChecker_2.isDataView(int32View)).assertFalse();
        expect(dataViewChecker_2.isDataView(uint32View)).assertFalse();
      }

      // --- [5] Verify isDataView returns false for a Uint8Array built over the buffer owned by a DataView ---
      {
        let dataViewChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab);
        let uint8View: Uint8Array = new Uint8Array(dv.buffer);
        expect(dataViewChecker.isDataView(uint8View)).assertFalse();
        expect(dataViewChecker.isDataView(dv)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1100
     * @tc.name testTypesIsDataView011
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Map and a Set that each hold one entry and WeakMap and for a WeakSet holding one class typed key; rejects Dates at the current time, the epoch and the ECMA timestamp limits; RegExp built from the pattern abc and for an empty pattern carrying the global flag; rejects the built in error kinds Error, TypeError and RangeError; plain arrow function and for an async arrow function and Map key iterator and for a Set value iterator.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDataView returns false for a Map and a Set that each hold one entry and WeakMap and for a WeakSet holding one class typed key ---
      {
        let dataViewProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(1);
        expect(dataViewProbe.isDataView(m)).assertFalse();
        expect(dataViewProbe.isDataView(s)).assertFalse();
        expect(m.size).assertEqual(1);
        let dataViewChecker: util.types = new util.types();
        let key: ViewTag = new ViewTag();
        let wm: WeakMap<ViewTag, int> = new WeakMap<ViewTag, int>();
        wm.set(key, 5);
        let ws: WeakSet<ViewTag> = new WeakSet<ViewTag>();
        ws.add(key);
        expect(dataViewChecker.isDataView(wm)).assertFalse();
        expect(dataViewChecker.isDataView(ws)).assertFalse();
      }

      // --- [2] Verify isDataView returns false for Dates at the current time, the epoch and the ECMA timestamp limits ---
      {
        let dataViewChecker: util.types = new util.types();
        let now: Date = new Date();
        let epoch: Date = new Date(0);
        let latest: Date = new Date(8640000000000000);
        let earliest: Date = new Date(-8640000000000000);
        expect(dataViewChecker.isDataView(now)).assertFalse();
        expect(dataViewChecker.isDataView(epoch)).assertFalse();
        expect(dataViewChecker.isDataView(latest)).assertFalse();
        expect(dataViewChecker.isDataView(earliest)).assertFalse();
      }

      // --- [3] Verify isDataView returns false for a RegExp built from the pattern abc and for an empty pattern carrying the global flag ---
      {
        let dataViewChecker: util.types = new util.types();
        let simple: RegExp = new RegExp('abc');
        let flagged: RegExp = new RegExp('', 'g');
        expect(dataViewChecker.isDataView(simple)).assertFalse();
        expect(dataViewChecker.isDataView(flagged)).assertFalse();
      }

      // --- [4] Verify isDataView returns false for the built in error kinds Error, TypeError and RangeError ---
      {
        let dataViewChecker: util.types = new util.types();
        let generic: Error = new Error('probe');
        let typeErr: TypeError = new TypeError('probe');
        let rangeErr: RangeError = new RangeError('probe');
        expect(dataViewChecker.isDataView(generic)).assertFalse();
        expect(dataViewChecker.isDataView(typeErr)).assertFalse();
        expect(dataViewChecker.isDataView(rangeErr)).assertFalse();
      }

      // --- [5] Verify isDataView returns false for a plain arrow function and for an async arrow function and Map key iterator and for a Set value iterator ---
      {
        let dataViewChecker: util.types = new util.types();
        let plain: Function = (): int => {
          return 2;
        };
        let af: Function = async (): Promise<void> => {
        };
        expect(dataViewChecker.isDataView(plain)).assertFalse();
        expect(dataViewChecker.isDataView(af)).assertFalse();
        let dataViewChecker_2: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(1);
        let mk: IterableIterator<string> = m.keys();
        let sv: IterableIterator<int> = s.values();
        expect(dataViewChecker_2.isDataView(mk)).assertFalse();
        expect(dataViewChecker_2.isDataView(sv)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1200
     * @tc.name testTypesIsDataView012
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an interface typed object literal; rejects another util.types instance passed as the value; rejects the ArrayBuffer produced by slice, which is a raw buffer rather than a view; rejects subarray windows of a Uint8Array, an Int16Array and a Float64Array whose byteOffsets are not zero; rejects a Uint8Array copy made by slice and for the fresh buffer backing that copy.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDataView returns false for an interface typed object literal ---
      {
        let dataViewProbe: util.types = new util.types();
        let pair: Shape2D = { w: 3, h: 5 };
        expect(dataViewProbe.isDataView(pair)).assertFalse();
        expect(pair.h).assertEqual(5);
      }

      // --- [2] Verify isDataView returns false for another util.types instance passed as the value ---
      {
        let dataViewChecker: util.types = new util.types();
        let other: util.types = new util.types();
        expect(dataViewChecker.isDataView(other)).assertFalse();
      }

      // --- [3] Verify isDataView returns false for the ArrayBuffer produced by slice, which is a raw buffer rather than a view ---
      {
        let dataViewProbe: util.types = new util.types();
        let big: ArrayBuffer = new ArrayBuffer(8);
        let part: ArrayBuffer = big.slice(2, 4);
        expect(dataViewProbe.isDataView(part)).assertFalse();
        expect(part.byteLength).assertEqual(2);
      }

      // --- [4] Verify isDataView returns false for subarray windows of a Uint8Array, an Int16Array and a Float64Array whose byteOffsets are not zero ---
      {
        let dataViewProbe: util.types = new util.types();
        let base8: Uint8Array = new Uint8Array(new ArrayBuffer(16));
        let win8: Uint8Array = base8.subarray(1, 5);
        let base16: Int16Array = new Int16Array(new ArrayBuffer(16));
        let win16: Int16Array = base16.subarray(2, 6);
        let base64: Float64Array = new Float64Array(new ArrayBuffer(32));
        let win64: Float64Array = base64.subarray(1, 3);
        expect(dataViewProbe.isDataView(win8)).assertFalse();
        expect(dataViewProbe.isDataView(win16)).assertFalse();
        expect(dataViewProbe.isDataView(win64)).assertFalse();
        expect(win8.byteOffset).assertEqual(1);
        expect(win16.byteOffset).assertEqual(4);
        expect(win64.byteOffset).assertEqual(8);
      }

      // --- [5] Verify isDataView returns false for a Uint8Array copy made by slice and for the fresh buffer backing that copy ---
      {
        let dataViewProbe: util.types = new util.types();
        let src: Uint8Array = new Uint8Array([5, 6, 7]);
        let dup: Uint8Array = src.slice(0, 2);
        expect(dataViewProbe.isDataView(dup)).assertFalse();
        expect(dataViewProbe.isDataView(dup.buffer)).assertFalse();
        expect(src.$_get(0)).assertEqual(5);
        expect(dup.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1300
     * @tc.name testTypesIsDataView013
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a Uint8ClampedArray sharing the DataView buffer clamps a stored 300 to 255 and is a view family member that is not a DataView; one detector instance returns the consecutive verdicts true, false, false and true with a noise call in between; a DataView aligned to a Uint8Array subarray window is a view while the subarray itself is not; rejects a plain class instance while its own field keeps its value; a false verdict leaves probed lengths unchanged and a class method reports the DataView as a view and its backing buffer as not.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Uint8ClampedArray sharing the DataView buffer clamps a stored 300 to 255 and is a view family member that is not a DataView ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab);
        let clampedBytes: Uint8ClampedArray = new Uint8ClampedArray(ab);
        clampedBytes.$_set(2, 300);
        expect(dataViewProbe.isDataView(clampedBytes)).assertFalse();
        expect(dataViewProbe.isArrayBufferView(clampedBytes)).assertTrue();
        expect(clampedBytes.$_get(2)).assertEqual(255);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
      }

      // --- [2] Verify one detector instance returns the consecutive verdicts true, false, false and true with a noise call in between ---
      {
        let dataViewChecker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(4);
        let first: boolean = dataViewChecker.isDataView(dv);
        let noise: boolean = dataViewChecker.isDataView('noise');
        let second: boolean = dataViewChecker.isDataView(ab);
        let third: boolean = dataViewChecker.isDataView(uint8View);
        expect(first).assertTrue();
        expect(noise).assertFalse();
        expect(second).assertFalse();
        expect(third).assertFalse();
        expect(dataViewChecker.isDataView(dv)).assertTrue();
      }

      // --- [3] Verify a DataView aligned to a Uint8Array subarray window is a view while the subarray itself is not ---
      {
        let dataViewProbe: util.types = new util.types();
        let whole: Uint8Array = new Uint8Array(new ArrayBuffer(16));
        let win: Uint8Array = whole.subarray(4, 12);
        let dv: DataView = new DataView(win.buffer, 4, 8);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dataViewProbe.isDataView(win)).assertFalse();
        expect(win.byteOffset).assertEqual(4);
        expect(win.length).assertEqual(8);
      }

      // --- [4] Verify isDataView returns false for a plain class instance while its own field keeps its value ---
      {
        let dataViewProbe: util.types = new util.types();
        let tag: ViewTag = new ViewTag();
        expect(dataViewProbe.isDataView(tag)).assertFalse();
        expect(tag.tag).assertEqual(1);
      }

      // --- [5] Verify a false verdict leaves probed lengths unchanged and a class method reports the DataView as a view and its backing buffer as not ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(20);
        let uint8View: Uint8Array = new Uint8Array([9, 8, 7]);
        let int32View: Int32Array = new Int32Array([1, 2, 3]);
        let float64View: Float64Array = new Float64Array([1, 2, 3, 4]);
        expect(dataViewProbe.isDataView(ab)).assertFalse();
        expect(dataViewProbe.isDataView(uint8View)).assertFalse();
        expect(dataViewProbe.isDataView(int32View)).assertFalse();
        expect(dataViewProbe.isDataView(float64View)).assertFalse();
        expect(ab.byteLength).assertEqual(20);
        expect(uint8View.length).assertEqual(3);
        expect(int32View.byteLength).assertEqual(12);
        expect(float64View.length).assertEqual(4);
        let dataViewProbe_2: util.types = new util.types();
        let holder: PayloadSlot = new PayloadSlot();
        let ab_2: ArrayBuffer = new ArrayBuffer(4);
        expect(holder.inspect(new DataView(ab_2))).assertTrue();
        expect(holder.inspect(ab_2)).assertFalse();
        expect(dataViewProbe_2.isDataView(new DataView(ab_2))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1400
     * @tc.name testTypesIsDataView014
     * @tc.desc Merged batch (4 tests): Non-target object rejection: verifies rejection of unrelated objects, covering conversion and subclass paths.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a second DataView derived from the buffer of a first DataView is a view while that raw buffer is not ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(10);
        let first: DataView = new DataView(ab, 1, 8);
        let raw: ArrayBuffer = first.buffer;
        let second: DataView = new DataView(raw, 4, 4);
        expect(dataViewProbe.isDataView(second)).assertTrue();
        expect(dataViewProbe.isDataView(raw)).assertFalse();
        expect(second.byteOffset).assertEqual(4);
        expect(dataViewProbe.isDataView(first)).assertTrue();
      }

      // --- [2] Verify a DataView is an ArrayBufferView but not an ArrayBuffer while the backing buffer is an ArrayBuffer that is not a view ---
      {
        let dataViewChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab, 2, 4);
        expect(dataViewChecker.isDataView(dv)).assertTrue();
        expect(dataViewChecker.isArrayBufferView(dv)).assertTrue();
        expect(dataViewChecker.isArrayBuffer(dv)).assertFalse();
        expect(dataViewChecker.isArrayBuffer(ab)).assertTrue();
        expect(dataViewChecker.isArrayBufferView(ab)).assertFalse();
      }

      // --- [3] Verify a DataView is rejected by the date, map, set and promise predicates of the same instance ---
      {
        let dataViewChecker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(2));
        expect(dataViewChecker.isDataView(dv)).assertTrue();
        expect(dataViewChecker.isDate(dv)).assertFalse();
        expect(dataViewChecker.isMap(dv)).assertFalse();
        expect(dataViewChecker.isSet(dv)).assertFalse();
        expect(dataViewChecker.isPromise(dv)).assertFalse();
      }

      // --- [4] Verify an object that only mimics a DataView by carrying its fields is not a DataView while the genuine view is ---
      {
        let dataViewProbe: util.types = new util.types();
        let mimic: ViewMimic = new ViewMimic();
        let real: DataView = new DataView(new ArrayBuffer(4));
        expect(dataViewProbe.isDataView(mimic)).assertFalse();
        expect(dataViewProbe.isDataView(real)).assertTrue();
        expect(mimic.byteLength).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1500
     * @tc.name testTypesIsDataView015
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: a little endian sixteen bit value reads byte swapped as big endian and a double round trips through setFloat64 and getFloat64; a DataView built with the two argument constructor reports the remaining buffer size as its byteLength; a DataView sharing a buffer with a Float64Array stays a view and reads the double stored through the typed array; an unsigned byte 255 stored through setUint8 is reinterpreted as minus one by getInt8; a helper written byte is visible and a DataView over a sliced buffer copy is a view whose writes leave the source byte untouched.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a little endian sixteen bit value reads byte swapped as big endian and a double round trips through setFloat64 and getFloat64 ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        dv.setUint16(0, 772, true);
        let little: int = dv.getUint16(0, true);
        let big: int = dv.getUint16(0, false);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(little).assertEqual(772);
        expect(big).assertEqual(1027);
        let dataViewProbe_2: util.types = new util.types();
        let dv_2: DataView = new DataView(new ArrayBuffer(8));
        dv_2.setFloat64(0, 12.5, true);
        expect(dataViewProbe_2.isDataView(dv_2)).assertTrue();
        expect(dv_2.getFloat64(0, true)).assertEqual(12.5);
        expect(dv_2.byteLength).assertEqual(8);
      }

      // --- [2] Verify a DataView built with the two argument constructor reports the remaining buffer size as its byteLength ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let dv: DataView = new DataView(ab, 6);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.byteLength).assertEqual(10);
        expect(dv.byteOffset).assertEqual(6);
      }

      // --- [3] Verify a DataView sharing a buffer with a Float64Array stays a view and reads the double stored through the typed array ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let float64View: Float64Array = new Float64Array(ab);
        float64View.$_set(0, 1.25);
        let dv: DataView = new DataView(ab);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dataViewProbe.isDataView(float64View)).assertFalse();
        expect(dv.getFloat64(0, true)).assertEqual(1.25);
      }

      // --- [4] Verify an unsigned byte 255 stored through setUint8 is reinterpreted as minus one by getInt8 while the verdict stays true ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(2));
        dv.setUint8(0, 255);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getInt8(0)).assertEqual(-1);
        expect(dv.getUint8(0)).assertEqual(255);
      }

      // --- [5] Verify a helper written byte is visible and a DataView over a sliced buffer copy is a view whose writes leave the source byte untouched ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4), 1, 3);
        fillViewByte(dv, 2, 61);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getUint8(2)).assertEqual(61);
        expect(dv.byteOffset).assertEqual(1);
        let dataViewProbe_2: util.types = new util.types();
        let src: ArrayBuffer = new ArrayBuffer(8);
        let u8src: Uint8Array = new Uint8Array(src);
        u8src.$_set(0, 200);
        let copy: ArrayBuffer = src.slice(0, 4);
        let dv_2: DataView = new DataView(copy);
        dv_2.setUint8(0, 11);
        let u8copy: Uint8Array = new Uint8Array(copy);
        expect(dataViewProbe_2.isDataView(dv_2)).assertTrue();
        expect(u8src.$_get(0)).assertEqual(200);
        expect(u8copy.$_get(0)).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1600
     * @tc.name testTypesIsDataView016
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: the DataView carried in the view field of an interface typed object is recognised with its offset preserved; a true verdict leaves the byteLength, the byteOffset and the backing buffer size of the tested DataView unchanged; the isDataView verdict is unchanged when one byte of the backing buffer changes between the two calls; a negative int written at a window relative offset survives the verdict and the backing buffer size is unchanged; a DataView remains a view after the Set that held it has been cleared.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the DataView carried in the view field of an interface typed object is recognised with its offset preserved ---
      {
        let dataViewProbe: util.types = new util.types();
        let slot: ViewSlot = { view: new DataView(new ArrayBuffer(12), 2, 6) };
        expect(dataViewProbe.isDataView(slot.view)).assertTrue();
        expect(slot.view.byteOffset).assertEqual(2);
        expect(slot.view.byteLength).assertEqual(6);
      }

      // --- [2] Verify a true verdict leaves the byteLength, the byteOffset and the backing buffer size of the tested DataView unchanged ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(12);
        let dv: DataView = new DataView(ab, 4, 8);
        let verdict: boolean = dataViewProbe.isDataView(dv);
        expect(verdict).assertTrue();
        expect(dv.byteLength).assertEqual(8);
        expect(dv.byteOffset).assertEqual(4);
        expect(dv.buffer.byteLength).assertEqual(12);
      }

      // --- [3] Verify the isDataView verdict is unchanged when one byte of the backing buffer changes between the two calls ---
      {
        let dataViewChecker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let uint8View: Uint8Array = new Uint8Array(dv.buffer);
        let before: boolean = dataViewChecker.isDataView(dv);
        uint8View.$_set(0, 2);
        let after: boolean = dataViewChecker.isDataView(dv);
        expect(before).assertEqual(after);
        expect(after).assertTrue();
      }

      // --- [4] Verify a negative int written at a window relative offset survives the verdict and the backing buffer size is unchanged ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(8));
        dv.setInt32(4, -123456, true);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getInt32(4, true)).assertEqual(-123456);
        expect(dv.buffer.byteLength).assertEqual(8);
      }

      // --- [5] Verify a DataView remains a view after the Set that held it has been cleared ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let s: Set<DataView> = new Set<DataView>();
        s.add(dv);
        s.clear();
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(s.size).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1700
     * @tc.name testTypesIsDataView017
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: the byte read back from a DataView is unchanged by the verdict itself; reading past the end of a DataView throws a RangeError; writing through a bounded window leaves the bytes outside the window intact; the DataView produced by a module level factory function is a view with its window metrics preserved; the DataView returned by a method of a holder class is a view with its window metrics preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the byte read back from a DataView is unchanged by the verdict itself ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        dv.setUint8(0, 91);
        dv.setUint8(1, 173);
        let before: int = dv.getUint8(0);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getUint8(0)).assertEqual(before);
        expect(dv.getUint8(1)).assertEqual(173);
      }

      // --- [2] Verify reading past the end of a DataView throws a RangeError while the object remains a DataView afterwards ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        try {
          dv.getUint8(4);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        expect(dataViewProbe.isDataView(dv)).assertTrue();
      }

      // --- [3] Verify writing through a bounded window leaves the bytes outside the window intact while the verdict stays true ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(12);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(0, 31);
        uint8View.$_set(11, 62);
        let dv: DataView = new DataView(ab, 4, 4);
        dv.setUint8(0, 99);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(uint8View.$_get(0)).assertEqual(31);
        expect(uint8View.$_get(11)).assertEqual(62);
        expect(uint8View.$_get(4)).assertEqual(99);
      }

      // --- [4] Verify the DataView produced by a module level factory function is a view with its window metrics preserved ---
      {
        let dataViewProbe: util.types = new util.types();
        let built: DataView = buildWindowView();
        let widened: Object = built;
        expect(dataViewProbe.isDataView(built)).assertTrue();
        expect(dataViewProbe.isDataView(widened)).assertTrue();
        expect(built.byteOffset).assertEqual(4);
        expect(built.byteLength).assertEqual(8);
      }

      // --- [5] Verify the DataView returned by a method of a holder class is a view with its window metrics preserved ---
      {
        let dataViewProbe: util.types = new util.types();
        let holder: ViewHolder = new ViewHolder();
        let fresh: DataView = holder.produce();
        expect(dataViewProbe.isDataView(fresh)).assertTrue();
        expect(fresh.byteLength).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1800
     * @tc.name testTypesIsDataView018
     * @tc.desc Merged batch (1 test): State preservation and aliasing: the lengths of three typed arrays sharing one buffer are unchanged by the verdict on a DataView over that buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the lengths of three typed arrays sharing one buffer are unchanged by the verdict on a DataView over that buffer ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let dv: DataView = new DataView(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let int16View: Int16Array = new Int16Array(ab);
        let float32View: Float32Array = new Float32Array(ab);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(uint8View.length).assertEqual(24);
        expect(int16View.length).assertEqual(12);
        expect(float32View.length).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_1900
     * @tc.name testTypesIsDataView019
     * @tc.desc Merged batch (5 tests): Container and field storage: the int16 value minus two written through setInt16 is read back as 65534 by getUint16 little endian; the DataView exposed through the view field of a holder class instance is classified as a view; a byte written through a Uint8Array is read back by getUint8 at the window relative index of the tested DataView; a negative value stored by setBigInt64 is read back by getBigInt64 and splits into two negative int32 words; a DataView held as the value of a WeakMap under a class typed key is recognised when fetched back.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the int16 value minus two written through setInt16 is read back as 65534 by getUint16 little endian ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        dv.setInt16(0, -2, true);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getInt16(0, true)).assertEqual(-2);
        expect(dv.getUint16(0, true)).assertEqual(65534);
      }

      // --- [2] Verify the DataView exposed through the view field of a holder class instance is classified as a view ---
      {
        let dataViewProbe: util.types = new util.types();
        let holder: ViewHolder = new ViewHolder();
        expect(dataViewProbe.isDataView(holder.view)).assertTrue();
        expect(holder.view.byteLength).assertEqual(8);
        expect(holder.view.buffer.byteLength).assertEqual(8);
      }

      // --- [3] Verify a byte written through a Uint8Array is read back by getUint8 at the window relative index of the tested DataView ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab, 3, 5);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(6, 141);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getUint8(3)).assertEqual(141);
      }

      // --- [4] Verify a negative value stored by setBigInt64 is read back by getBigInt64 and splits into two negative int32 words ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(8));
        dv.setBigInt64(0, -2n);
        let signed: bigint = dv.getBigInt64(0);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(signed).assertEqual(-2n);
        expect(dv.getInt32(0)).assertEqual(-1);
        expect(dv.getInt32(4)).assertEqual(-2);
      }

      // --- [5] Verify a DataView held as the value of a WeakMap under a class typed key is recognised when fetched back ---
      {
        let dataViewProbe: util.types = new util.types();
        let key: ViewTag = new ViewTag();
        let wm: WeakMap<ViewTag, DataView> = new WeakMap<ViewTag, DataView>();
        wm.set(key, new DataView(new ArrayBuffer(4)));
        let got: DataView | undefined = wm.get(key);
        let verdict: boolean = false;
        let span: int = -1;
        if (got !== undefined) {
          verdict = dataViewProbe.isDataView(got);
          span = got.byteLength;
        }
        expect(got !== undefined).assertTrue();
        expect(verdict).assertTrue();
        expect(span).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_2000
     * @tc.name testTypesIsDataView020
     * @tc.desc Merged batch (5 tests): Container and field storage: a DataView stored as a Map value is recognised after being retrieved by its key; a DataView reached through two nested holder levels is still classified as a view; a DataView used as a Map key is a view and the map lookup succeeds through that same reference; in a Map that is itself an element of an Array is recognised through the nested lookup; as the value of a Map with int keys is recognised.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a DataView stored as a Map value is recognised after being retrieved by its key ---
      {
        let dataViewProbe: util.types = new util.types();
        let bag: Map<string, DataView> = new Map<string, DataView>();
        bag.set('w', new DataView(new ArrayBuffer(4)));
        let got: DataView | undefined = bag.get('w');
        let verdict: boolean = false;
        if (got !== undefined) {
          verdict = dataViewProbe.isDataView(got);
        }
        expect(got !== undefined).assertTrue();
        expect(verdict).assertTrue();
        expect(bag.size).assertEqual(1);
      }

      // --- [2] Verify a DataView reached through two nested holder levels is still classified as a view ---
      {
        let dataViewProbe: util.types = new util.types();
        let nested: NestedSlot = { inner: { view: new DataView(new ArrayBuffer(6), 1, 5) } };
        expect(dataViewProbe.isDataView(nested.inner.view)).assertTrue();
        expect(nested.inner.view.byteLength).assertEqual(5);
        expect(nested.inner.view.byteOffset).assertEqual(1);
      }

      // --- [3] Verify a DataView used as a Map key is a view and the map lookup succeeds through that same reference ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let m: Map<DataView, string> = new Map<DataView, string>();
        m.set(dv, 'k');
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(m.has(dv)).assertTrue();
        expect(m.get(dv)).assertEqual('k');
      }

      // --- [4] Verify a DataView stored in a Map that is itself an element of an Array is recognised through the nested lookup ---
      {
        let dataViewProbe: util.types = new util.types();
        let groups: Array<Map<string, DataView>> = [new Map<string, DataView>()];
        groups[0].set('w', new DataView(new ArrayBuffer(2)));
        let got: DataView | undefined = groups[0].get('w');
        let verdict: boolean = false;
        if (got !== undefined) {
          verdict = dataViewProbe.isDataView(got);
        }
        expect(got !== undefined).assertTrue();
        expect(verdict).assertTrue();
        expect(groups.length).assertEqual(1);
      }

      // --- [5] Verify a DataView stored as the value of a Map with int keys is recognised ---
      {
        let dataViewProbe: util.types = new util.types();
        let m: Map<int, DataView> = new Map<int, DataView>();
        m.set(7, new DataView(new ArrayBuffer(2)));
        let got: DataView | undefined = m.get(7);
        let verdict: boolean = false;
        if (got !== undefined) {
          verdict = dataViewProbe.isDataView(got);
        }
        expect(got !== undefined).assertTrue();
        expect(verdict).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_2100
     * @tc.name testTypesIsDataView021
     * @tc.desc Merged batch (2 tests): Container and field storage: a DataView used as a Map key is a view and the stored value is returned by that key; a while loop driven by an iterator of Map values counts exactly one DataView among three entries.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a DataView used as a Map key is a view and the stored value is returned by that key ---
      {
        let dataViewProbe: util.types = new util.types();
        let key: DataView = new DataView(new ArrayBuffer(4));
        let m: Map<DataView, int> = new Map<DataView, int>();
        m.set(key, 3);
        expect(dataViewProbe.isDataView(key)).assertTrue();
        expect(m.get(key)).assertEqual(3);
      }

      // --- [2] Verify a while loop driven by an iterator of Map values counts exactly one DataView among three entries ---
      {
        let dataViewProbe: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('a', new ArrayBuffer(2));
        m.set('b', new DataView(new ArrayBuffer(2)));
        m.set('c', new Uint8Array(2));
        let it: IterableIterator<Object> = m.values();
        let hits: int = 0;
        let done: boolean = false;
        while (!done) {
          let step: Object | undefined = it.next().value;
          if (step === undefined) {
            done = true;
          } else if (dataViewProbe.isDataView(step)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(1);
        expect(m.size).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_2200
     * @tc.name testTypesIsDataView022
     * @tc.desc Merged batch (5 tests): API call consistency: a double written at a window offset that is not eight byte aligned round trips; isDataView accepts two DataViews over one shared buffer without disturbing the byte at index 4; an Object typed DataView is accepted and a Uint8Array rejected, and two separately built instances agree on both; isDataView accepts a DataView that isArrayBuffer rejects; the verdict is mutually exclusive with the sibling predicates isArrayBuffer and isArrayBufferView.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a double written at a window offset that is not eight byte aligned round trips while the view stays recognised ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let dv: DataView = new DataView(ab, 3, 8);
        dv.setFloat64(0, -6.75, true);
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        expect(dv.getFloat64(0, true)).assertEqual(-6.75);
        expect(dv.byteOffset).assertEqual(3);
      }

      // --- [2] Verify isDataView accepts two DataViews over one shared buffer without disturbing the byte at index 4 ---
      {
        let dataViewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let head: DataView = new DataView(ab, 0, 4);
        let tail: DataView = new DataView(ab, 4, 4);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(4, 77);
        expect(dataViewProbe.isDataView(head)).assertTrue();
        expect(dataViewProbe.isDataView(tail)).assertTrue();
        expect(tail.byteOffset).assertEqual(4);
        expect(uint8View.$_get(4)).assertEqual(77);
      }

      // --- [3] Verify an Object typed DataView is accepted and a Uint8Array rejected, and two separately built instances agree on both ---
      {
        let dataViewChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let asView: Object = new DataView(ab);
        let asBytes: Object = new Uint8Array(ab);
        expect(dataViewChecker.isDataView(asView)).assertTrue();
        expect(dataViewChecker.isDataView(asBytes)).assertFalse();
        let dataViewCheckerA: util.types = new util.types();
        let dataViewCheckerB: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let uint8View: Uint8Array = new Uint8Array(4);
        expect(dataViewCheckerA.isDataView(dv)).assertTrue();
        expect(dataViewCheckerB.isDataView(dv)).assertTrue();
        expect(dataViewCheckerA.isDataView(uint8View)).assertFalse();
        expect(dataViewCheckerB.isDataView(uint8View)).assertFalse();
      }

      // --- [4] Verify isDataView accepts a DataView that isArrayBuffer rejects, while a separate ArrayBuffer and a typed array view each stay true ---
      {
        let dataViewChecker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(4);
        expect(dataViewChecker.isDataView(dv)).assertTrue();
        expect(dataViewChecker.isArrayBuffer(ab)).assertTrue();
        expect(dataViewChecker.isArrayBufferView(uint8View)).assertTrue();
        expect(dataViewChecker.isArrayBuffer(dv)).assertFalse();
      }

      // --- [5] Verify the verdict is mutually exclusive with the sibling predicates isArrayBuffer and isArrayBufferView ---
      {
        let dataViewChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(4);
        expect(dataViewChecker.isDataView(ab)).assertFalse();
        expect(dataViewChecker.isArrayBuffer(ab)).assertTrue();
        expect(dataViewChecker.isDataView(uint8View)).assertFalse();
        expect(dataViewChecker.isArrayBufferView(uint8View)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_2300
     * @tc.name testTypesIsDataView023
     * @tc.desc Merged batch (3 tests): API call consistency: isDataView and isTypedArray split the view family, a DataView passing only the first and Uint8Array or Int32Array only the second; isDate and isDataView give opposite verdicts on the same instance for a Date and for a DataView; four predicates each accept their own value and a user Error subclass is rejected by isDataView.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDataView and isTypedArray split the view family, a DataView passing only the first and Uint8Array or Int32Array only the second ---
      {
        let dataViewChecker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let uint8View: Uint8Array = new Uint8Array(4);
        let int32View: Int32Array = new Int32Array(2);
        expect(dataViewChecker.isDataView(dv)).assertTrue();
        expect(dataViewChecker.isTypedArray(dv)).assertFalse();
        expect(dataViewChecker.isDataView(uint8View)).assertFalse();
        expect(dataViewChecker.isTypedArray(uint8View)).assertTrue();
        expect(dataViewChecker.isDataView(int32View)).assertFalse();
        expect(dataViewChecker.isTypedArray(int32View)).assertTrue();
      }

      // --- [2] Verify isDate and isDataView give opposite verdicts on the same instance for a Date and for a DataView ---
      {
        let dataViewChecker: util.types = new util.types();
        let d: Date = new Date(0);
        let dv: DataView = new DataView(new ArrayBuffer(4));
        expect(dataViewChecker.isDate(d)).assertTrue();
        expect(dataViewChecker.isDataView(d)).assertFalse();
        expect(dataViewChecker.isDate(dv)).assertFalse();
        expect(dataViewChecker.isDataView(dv)).assertTrue();
      }

      // --- [3] Verify four predicates each accept their own value and a user Error subclass is rejected by isDataView but accepted by isNativeError ---
      {
        let dataViewChecker: util.types = new util.types();
        let d: Date = new Date(0);
        let m: Map<string, int> = new Map<string, int>();
        let s: Set<int> = new Set<int>();
        let p: Promise<int> = Promise.resolve<int>(1);
        let dv: DataView = new DataView(new ArrayBuffer(2));
        expect(dataViewChecker.isDate(d)).assertTrue();
        expect(dataViewChecker.isMap(m)).assertTrue();
        expect(dataViewChecker.isSet(s)).assertTrue();
        expect(dataViewChecker.isPromise(p)).assertTrue();
        expect(dataViewChecker.isDataView(dv)).assertTrue();
        expect(dataViewChecker.isDataView(m)).assertFalse();
        let dataViewChecker_2: util.types = new util.types();
        let custom: Error = new SubError('probe');
        expect(dataViewChecker_2.isDataView(custom)).assertFalse();
        expect(dataViewChecker_2.isNativeError(custom)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_2400
     * @tc.name testTypesIsDataView024
     * @tc.desc Merged batch (5 tests): Program integration: the probeViewArgument adapter forwards verdicts for a DataView, a buffer and an instance and the label appears only for a DataView; every byte of a four byte DataView written by a loop reads back through getUint8 after the verdict; the classifyView guard helper returns early with the view label for a DataView and the other label for a string; the verdict drives an if branch, taking the positive branch for a DataView and the negative branch for a Set; the verdict selects the matching arm of a ternary expression for a DataView and for an ArrayBuffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the probeViewArgument adapter forwards verdicts for a DataView, a buffer and an instance and the label appears only for a DataView ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        expect(probeViewArgument(dv)).assertTrue();
        expect(probeViewArgument(new ArrayBuffer(4))).assertFalse();
        expect(probeViewArgument(new ViewTag())).assertFalse();
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        let dataViewProbe_2: util.types = new util.types();
        let dv_2: DataView = new DataView(new ArrayBuffer(2));
        expect(labelForVerdict(dataViewProbe_2.isDataView(dv_2))).assertEqual('view');
        expect(labelForVerdict(dataViewProbe_2.isDataView(new ArrayBuffer(2)))).assertEqual('other');
      }

      // --- [2] Verify every byte of a four byte DataView written by a loop reads back through getUint8 after the verdict ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        for (let i: int = 0; i < 4; i++) {
          dv.setUint8(i, i + 7);
        }
        expect(dataViewProbe.isDataView(dv)).assertTrue();
        let sum: int = 0;
        for (let i: int = 0; i < 4; i++) {
          sum = sum + dv.getUint8(i);
        }
        expect(sum).assertEqual(7 + 8 + 9 + 10);
      }

      // --- [3] Verify the classifyView guard helper returns early with the view label for a DataView and the other label for a string ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(2));
        expect(classifyView(dv)).assertEqual('view');
        expect(classifyView('plain')).assertEqual('other');
        expect(dataViewProbe.isDataView(dv)).assertTrue();
      }

      // --- [4] Verify the verdict drives an if branch, taking the positive branch for a DataView and the negative branch for a Set ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let s: Set<int> = new Set<int>();
        let hit: string = 'none';
        if (dataViewProbe.isDataView(dv)) {
          hit = 'view';
        }
        let miss: string = 'none';
        if (dataViewProbe.isDataView(s)) {
          miss = 'view';
        }
        expect(hit).assertEqual('view');
        expect(miss).assertEqual('none');
      }

      // --- [5] Verify the verdict selects the matching arm of a ternary expression for a DataView and for an ArrayBuffer ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let onView: string = dataViewProbe.isDataView(dv) ? 'view' : 'raw';
        let onRaw: string = dataViewProbe.isDataView(ab) ? 'view' : 'raw';
        expect(onView).assertEqual('view');
        expect(onRaw).assertEqual('raw');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_2500
     * @tc.name testTypesIsDataView025
     * @tc.desc Merged batch (3 tests): Program integration: the verdict selects which DataView receiver is used, keeping the tested view rather than the fallback; drives a switch statement onto the matching case for a DataView and onto the default for a Set; a while loop that stops once two DataViews have been found among a candidate list ends after scanning four entries.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the verdict selects which DataView receiver is used, keeping the tested view rather than the fallback ---
      {
        let dataViewProbe: util.types = new util.types();
        let primary: DataView = new DataView(new ArrayBuffer(4));
        let fallback: DataView = new DataView(new ArrayBuffer(8));
        let chosen: DataView = dataViewProbe.isDataView(primary) ? primary : fallback;
        expect(chosen.byteLength).assertEqual(4);
        expect(dataViewProbe.isDataView(chosen)).assertTrue();
      }

      // --- [2] Verify the verdict drives a switch statement onto the matching case for a DataView and onto the default for a Set ---
      {
        let dataViewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let s: Set<int> = new Set<int>();
        let tagView: string = 'none';
        switch (dataViewProbe.isDataView(dv)) {
          case true:
            tagView = 'view';
            break;
          default:
            break;
        }
        let tagOther: string = 'none';
        switch (dataViewProbe.isDataView(s)) {
          case true:
            tagOther = 'view';
            break;
          default:
            break;
        }
        expect(tagView).assertEqual('view');
        expect(tagOther).assertEqual('none');
      }

      // --- [3] Verify a while loop that stops once two DataViews have been found among a candidate list ends after scanning four entries ---
      {
        let dataViewProbe: util.types = new util.types();
        let list: Object[] = [new Uint8Array(2), new ArrayBuffer(2), new DataView(new ArrayBuffer(2)),
          new DataView(new ArrayBuffer(2))];
        let found: int = 0;
        let cursor: int = 0;
        while (found < 2 && cursor < list.length) {
          if (dataViewProbe.isDataView(list[cursor])) {
            found = found + 1;
          }
          cursor = cursor + 1;
        }
        expect(found).assertEqual(2);
        expect(cursor).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATA_VIEW_2600
     * @tc.name testTypesIsDataView026
     * @tc.desc Merged batch (1 tests): Miscellaneous checks: verifies remaining edge cases, covering numeric scalars and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDataView026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDataView returns false for Double.MAX_VALUE, the subnormal minimum 5e-324, the safe integer bound 2^53 and 1e21 ---
      {
        let dataViewChecker: util.types = new util.types();
        expect(dataViewChecker.isDataView(Double.MAX_VALUE)).assertFalse();
        expect(dataViewChecker.isDataView(5e-324)).assertFalse();
        expect(dataViewChecker.isDataView(9007199254740992)).assertFalse();
        expect(dataViewChecker.isDataView(1e21)).assertFalse();
      }
    });

  });
}
