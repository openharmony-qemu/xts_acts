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

class GridTile {
  height: int = 4;
  width: int = 8;
}

interface Point2 {
  x: int;
  y: int;
}

interface LeafBox {
  value: int;
}

interface MidBox {
  leaf: LeafBox;
}

interface TopBox {
  mid: MidBox;
}

interface ViewEnvelope {
  data: Uint8Array;
}

interface ItemBox {
  items: int[];
}

interface ConfigPair {
  a: int;
  b: string;
}

class ViewHolder {
  data: Uint8Array = new Uint8Array(3);
  id: int = 1;
}

class FakeViewShape {
  length: int = 4;
  byteLength: int = 4;
  byteOffset: int = 0;
  buffer: ArrayBuffer = new ArrayBuffer(4);
}

class LengthOnly {
  length: int = 2;
}

class StaticBuffer {
  static buf: Uint8Array = new Uint8Array(2);
  id: int = 0;
}

class NullableView {
  view: Uint8Array | null = null;
}

class CycleNode {
  next: CycleNode | null = null;
  tag: string = 'n';
}

class SelfNode {
  data: int = 3;
  self: SelfNode | null = null;
}

class SlotKey {
  tag: string = 'k';
}

class ViewPair {
  bytes: Uint8Array = new Uint8Array(2);
  words: Int32Array = new Int32Array(1);
}

interface NestedEnvelope {
  inner: ViewEnvelope;
}

interface ViewList {
  views: Uint8Array[];
}

interface RecordBox {
  slot: Record<string, Uint8Array>;
}

class ViewEngine {
  engine: util.types = new util.types();
  judge(value: Object): boolean {
    return this.engine.isArrayBufferView(value);
  }
}

class ViewKeeper {
  stored: Uint8Array = new Uint8Array(4);
  store(view: Uint8Array): void {
    this.stored = view;
  }
  take(): Uint8Array {
    return this.stored;
  }
}

class PairedHolder {
  first: Uint8Array = new Uint8Array(2);
  second: Int8Array = new Int8Array(3);
  countViews(engine: util.types): int {
    let hits: int = 0;
    if (engine.isArrayBufferView(this.first)) {
      hits++;
    }
    if (engine.isArrayBufferView(this.second)) {
      hits++;
    }
    return hits;
  }
}

function identityView(view: Uint8Array): Uint8Array {
  return view;
}

function makeWindow(buffer: ArrayBuffer): Uint16Array {
  return new Uint16Array(buffer, 2, 3);
}

function judgeThroughHelper(engine: util.types, value: Object): boolean {
  return engine.isArrayBufferView(value);
}

function verdictOf(engine: util.types, value: Object): string {
  if (engine.isArrayBufferView(value)) {
    return 'view';
  }
  return 'other';
}
export default function typesIsArrayBufferViewTest(): void {
  describe('TypesIsArrayBufferViewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0100
     * @tc.name testTypesIsArrayBufferView001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a Uint8ClampedArray whose byte was clamped from 300 to 255; DataView spanning a whole four byte ArrayBuffer; one megabyte Uint8Array allocation; Uint8Array filled across the whole 0 to 255 byte domain; Float64Array built at byteOffset 8 inside a bigger buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns true for a Uint8ClampedArray whose byte was clamped from 300 to 255 ---
      {
        let viewProbe: util.types = new util.types();
        let c: Uint8ClampedArray = new Uint8ClampedArray(1);
        c.$_set(0, 300);
        expect(viewProbe.isArrayBufferView(c)).assertTrue();
        expect(c.$_get(0)).assertEqual(255);
      }

      // --- [2] Verify isArrayBufferView returns true for a DataView spanning a whole four byte ArrayBuffer ---
      {
        let viewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        expect(viewProbe.isArrayBufferView(dv)).assertTrue();
        expect(dv.byteLength).assertEqual(4);
      }

      // --- [3] Verify isArrayBufferView returns true for a one megabyte Uint8Array allocation ---
      {
        let viewProbe: util.types = new util.types();
        let big: Uint8Array = new Uint8Array(1048576);
        expect(viewProbe.isArrayBufferView(big)).assertTrue();
        expect(big.length).assertEqual(1048576);
      }

      // --- [4] Verify isArrayBufferView returns true for a Uint8Array filled across the whole 0 to 255 byte domain ---
      {
        let viewProbe: util.types = new util.types();
        let bytes: Uint8Array = new Uint8Array(256);
        for (let i: int = 0; i < 256; i++) {
          bytes.$_set(i, i);
        }
        expect(viewProbe.isArrayBufferView(bytes)).assertTrue();
        expect(bytes.$_get(255)).assertEqual(255);
      }

      // --- [5] Verify isArrayBufferView returns true for a Float64Array built at byteOffset 8 inside a bigger buffer ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let float64View: Float64Array = new Float64Array(ab, 8, 1);
        expect(viewProbe.isArrayBufferView(float64View)).assertTrue();
        expect(float64View.byteOffset).assertEqual(8);
        expect(float64View.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0200
     * @tc.name testTypesIsArrayBufferView002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts BigInt64Array and Uint16Array views that fill their buffers; accepts a BigUint64Array opened at byteOffset 8 with the length argument omitted; DataViews opened with explicit byteLength 2 at offset 2 and with the length omitted at offset 3; accepts Int16Array views built at the aligned byteOffset values 0 and 2; isArrayBufferView accepts Uint16Array, Int32Array, Float32Array, DataView and Uint8Array windows at offsets 2, 4 and 8.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns true for BigInt64Array and Uint16Array views that fill their buffers ---
      {
        let viewProbe: util.types = new util.types();
        let bufferForBigInt64: ArrayBuffer = new ArrayBuffer(8);
        let bigInt64View: BigInt64Array = new BigInt64Array(bufferForBigInt64, 0, 1);
        expect(viewProbe.isArrayBufferView(bigInt64View)).assertTrue();
        expect(bigInt64View.length).assertEqual(1);
        let bufferForUint16: ArrayBuffer = new ArrayBuffer(65536);
        let uint16View: Uint16Array = new Uint16Array(bufferForUint16, 0, 32768);
        expect(viewProbe.isArrayBufferView(uint16View)).assertTrue();
        expect(uint16View.length).assertEqual(32768);
      }

      // --- [2] Verify isArrayBufferView returns true for a BigUint64Array opened at byteOffset 8 with the length argument omitted ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bu: BigUint64Array = new BigUint64Array(ab, 8);
        expect(bu.byteOffset).assertEqual(8);
        expect(viewProbe.isArrayBufferView(bu)).assertTrue();
        expect(bu.length).assertEqual(1);
      }

      // --- [3] Verify DataViews opened with explicit byteLength 2 at offset 2 and with the length omitted at offset 3 ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(10);
        let dv1: DataView = new DataView(ab, 2, 2);
        let dv2: DataView = new DataView(ab, 3);
        expect(viewProbe.isArrayBufferView(dv1)).assertTrue();
        expect(viewProbe.isArrayBufferView(dv2)).assertTrue();
        expect(dv1.byteOffset).assertEqual(2);
        expect(dv1.byteLength).assertEqual(2);
        expect(dv2.byteOffset).assertEqual(3);
        expect(dv2.byteLength).assertEqual(7);
      }

      // --- [4] Verify isArrayBufferView returns true for Int16Array views built at the aligned byteOffset values 0 and 2 ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let atZero: Int16Array = new Int16Array(ab, 0, 4);
        let atTwo: Int16Array = new Int16Array(ab, 2, 4);
        expect(viewProbe.isArrayBufferView(atZero)).assertTrue();
        expect(viewProbe.isArrayBufferView(atTwo)).assertTrue();
        expect(atTwo.byteOffset).assertEqual(2);
      }

      // --- [5] Verify isArrayBufferView accepts Uint16Array, Int32Array, Float32Array, DataView and Uint8Array windows at offsets 2, 4 and 8 ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let uint16View: Uint16Array = new Uint16Array(ab, 2, 3);
        let int32View: Int32Array = new Int32Array(ab, 4, 2);
        let float32View: Float32Array = new Float32Array(ab, 4, 3);
        let ab12: ArrayBuffer = new ArrayBuffer(12);
        let dv: DataView = new DataView(ab12, 2, 4);
        let uint8View: Uint8Array = new Uint8Array(ab12, 8, 2);
        expect(viewProbe.isArrayBufferView(uint16View)).assertTrue();
        expect(viewProbe.isArrayBufferView(int32View)).assertTrue();
        expect(viewProbe.isArrayBufferView(float32View)).assertTrue();
        expect(viewProbe.isArrayBufferView(dv)).assertTrue();
        expect(viewProbe.isArrayBufferView(uint8View)).assertTrue();
        expect(uint16View.byteOffset).assertEqual(2);
        expect(int32View.byteOffset).assertEqual(4);
        expect(float32View.byteOffset).assertEqual(4);
        expect(dv.byteOffset).assertEqual(2);
        expect(uint8View.byteOffset).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0300
     * @tc.name testTypesIsArrayBufferView003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts an Int8Array covering the single byte of a one byte buffer; accepts a one byte DataView window round trips its byte and subarrays taken from the middle and the whole range; bytes written through an Int32Array and through a DataView are both readable through the shared Uint8Array; accepts a leaf subarray derived from another subarray; accepts copies built from a typed array and from a subarray.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns true for an Int8Array covering the single byte of a one byte buffer ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(1);
        let int8View: Int8Array = new Int8Array(ab, 0, 1);
        expect(viewProbe.isArrayBufferView(int8View)).assertTrue();
        expect(int8View.length).assertEqual(1);
      }

      // --- [2] Verify a one byte DataView window round trips its byte and subarrays taken from the middle and the whole range are accepted ---
      {
        let viewProbe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(1);
        let dv: DataView = new DataView(host, 0, 1);
        dv.setUint8(0, 200);
        expect(viewProbe.isArrayBufferView(dv)).assertTrue();
        expect(dv.getUint8(0)).assertEqual(200);
        expect(dv.byteLength).assertEqual(1);
        let viewProbe_2: util.types = new util.types();
        let base: Uint8Array = new Uint8Array(8);
        let middle: Uint8Array = base.subarray(2, 5);
        let whole: Uint8Array = base.subarray(0);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(8);
        let clampPart: Uint8ClampedArray = clamped.subarray(2, 5);
        expect(viewProbe_2.isArrayBufferView(middle)).assertTrue();
        expect(viewProbe_2.isArrayBufferView(whole)).assertTrue();
        expect(viewProbe_2.isArrayBufferView(clampPart)).assertTrue();
        expect(middle.byteOffset).assertEqual(2);
        expect(middle.byteLength).assertEqual(3);
      }

      // --- [3] Verify bytes written through an Int32Array and through a DataView are both readable through the shared Uint8Array ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let int32View: Int32Array = new Int32Array(ab);
        int32View.$_set(0, 305419896);
        let intLow: double = uint8View.$_get(0);
        let intHigh: double = uint8View.$_get(1);
        expect(intLow).assertEqual(120);
        expect(intHigh).assertEqual(86);
        let dv: DataView = new DataView(ab);
        dv.setUint16(0, 4660, true);
        let dvLow: double = uint8View.$_get(0);
        let dvHigh: double = uint8View.$_get(1);
        expect(dvLow).assertEqual(52);
        expect(dvHigh).assertEqual(18);
        expect(viewProbe.isArrayBufferView(uint8View)).assertTrue();
      }

      // --- [4] Verify isArrayBufferView returns true for a leaf subarray derived from another subarray ---
      {
        let viewProbe: util.types = new util.types();
        let base: Uint8Array = new Uint8Array(10);
        let mid: Uint8Array = base.subarray(2, 8);
        let leaf: Uint8Array = mid.subarray(1, 3);
        expect(viewProbe.isArrayBufferView(leaf)).assertTrue();
        expect(leaf.byteOffset).assertEqual(3);
      }

      // --- [5] Verify isArrayBufferView returns true for copies built from a typed array and from a subarray ---
      {
        let viewProbe: util.types = new util.types();
        let src: Int32Array = new Int32Array([1, 2, 3]);
        let copy: Int32Array = new Int32Array(src);
        let base: Uint8Array = new Uint8Array([1, 2, 3, 4]);
        let sub: Uint8Array = base.subarray(1, 3);
        let subCopy: Uint8Array = new Uint8Array(sub);
        expect(viewProbe.isArrayBufferView(copy)).assertTrue();
        expect(viewProbe.isArrayBufferView(subCopy)).assertTrue();
        expect(copy.length).assertEqual(3);
        expect(subCopy.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0400
     * @tc.name testTypesIsArrayBufferView004
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts an empty trailing subarray, a reversed range subarray and a DataView rebuilt from a subarray buffer offset and length; a DataView with byteOffset 2 round trips a uint16 written through it; a byte written through the base view is readable through its subarray; accepts the slice product of a Uint8Array and that the slice owns a separate buffer; ArrayBuffer.from copies a Uint8Array into a plain buffer of equal length that is no longer a view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an empty trailing subarray, a reversed range subarray and a DataView rebuilt from a subarray buffer offset and length are accepted ---
      {
        let viewProbe: util.types = new util.types();
        let base: Uint8Array = new Uint8Array(6);
        let atEnd: Uint8Array = base.subarray(6);
        let reversed: Uint8Array = base.subarray(4, 2);
        expect(viewProbe.isArrayBufferView(atEnd)).assertTrue();
        expect(viewProbe.isArrayBufferView(reversed)).assertTrue();
        expect(atEnd.length).assertEqual(0);
        expect(reversed.length).assertEqual(0);
        let viewProbe_2: util.types = new util.types();
        let base_2: Uint8Array = new Uint8Array(8);
        let sub: Uint8Array = base_2.subarray(2, 6);
        let dv: DataView = new DataView(sub.buffer, sub.byteOffset, sub.byteLength);
        let fromBuffer: DataView = new DataView(sub.buffer);
        expect(viewProbe_2.isArrayBufferView(dv)).assertTrue();
        expect(viewProbe_2.isArrayBufferView(fromBuffer)).assertTrue();
        expect(dv.byteLength).assertEqual(4);
      }

      // --- [2] Verify a DataView with byteOffset 2 round trips a uint16 written through it ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab, 2, 4);
        dv.setUint16(0, 258, true);
        expect(viewProbe.isArrayBufferView(dv)).assertTrue();
        let back: int = dv.getUint16(0, true);
        expect(dv.byteOffset).assertEqual(2);
        expect(back).assertEqual(258);
      }

      // --- [3] Verify a byte written through the base view is readable through its subarray ---
      {
        let viewProbe: util.types = new util.types();
        let base: Uint8Array = new Uint8Array(6);
        let sub: Uint8Array = base.subarray(1, 4);
        viewProbe.isArrayBufferView(sub);
        base.$_set(2, 77);
        expect(sub.$_get(1)).assertEqual(77);
      }

      // --- [4] Verify isArrayBufferView returns true for the slice product of a Uint8Array and that the slice owns a separate buffer ---
      {
        let viewProbe: util.types = new util.types();
        let src: Uint8Array = new Uint8Array([1, 2, 3, 4]);
        let cut: Uint8Array = src.slice(1, 3);
        src.$_set(1, 99);
        expect(viewProbe.isArrayBufferView(cut)).assertTrue();
        expect(cut.$_get(0)).assertEqual(2);
        expect(cut.buffer === src.buffer).assertFalse();
      }

      // --- [5] Verify ArrayBuffer.from copies a Uint8Array into a plain buffer of equal length that is no longer a view ---
      {
        let viewProbe: util.types = new util.types();
        let source: Uint8Array = new Uint8Array([4, 5, 6]);
        let copy: ArrayBuffer = ArrayBuffer.from(source);
        expect(viewProbe.isArrayBufferView(copy)).assertFalse();
        expect(copy.getByteLength()).assertEqual(source.byteLength);
        expect(viewProbe.isArrayBufferView(source)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0500
     * @tc.name testTypesIsArrayBufferView005
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts arrays whose elements are all identical values; isArrayBufferView judged while draining a Set iterator yields true for each visited view; isArrayBufferView results collected into a boolean array match the view, view, buffer pattern; a Map forEach walk finds exactly one view key and a captured view still judges true after its array element is swapped; the buffer property of a view still points at the original ArrayBuffer after the predicate.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns true for arrays whose elements are all identical values ---
      {
        let viewProbe: util.types = new util.types();
        let identical: Array<Object> = [new Int8Array([5, 5, 5, 5, 5]), new Float32Array([2.5, 2.5, 2.5]),
          new Uint8ClampedArray([200, 200, 200, 200]), new Int16Array([7, 7, 7])];
        let views: int = 0;
        for (let i: int = 0; i < identical.length; i++) {
          if (viewProbe.isArrayBufferView(identical[i])) {
            views++;
          }
        }
        expect(views).assertEqual(4);
      }

      // --- [2] Verify isArrayBufferView judged while draining a Set iterator yields true for each visited view ---
      {
        let viewProbe: util.types = new util.types();
        let s: Set<Uint8Array> = new Set<Uint8Array>();
        s.add(new Uint8Array(1));
        s.add(new Uint8Array(2));

        let hits: int = 0;
        for (const view of s.values()) {
          if (viewProbe.isArrayBufferView(view)) {
            hits++;
          }
        }
        expect(hits).assertEqual(2);
      }

      // --- [3] Verify isArrayBufferView results collected into a boolean array match the view, view, buffer pattern ---
      {
        let viewProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(1);
        let dv: DataView = new DataView(new ArrayBuffer(2));
        let buf: ArrayBuffer = new ArrayBuffer(2);
        let flags: Array<boolean> = [viewProbe.isArrayBufferView(uint8View), viewProbe.isArrayBufferView(dv), viewProbe.isArrayBufferView(buf)];
        expect(flags[0]).assertTrue();
        expect(flags[1]).assertTrue();
        expect(flags[2]).assertFalse();
      }

      // --- [4] Verify a Map forEach walk finds exactly one view key and a captured view still judges true after its array element is swapped ---
      {
        let viewProbe: util.types = new util.types();
        let m: Map<Object, int> = new Map<Object, int>();
        m.set(new Uint8Array(1), 1);
        m.set(new GridTile(), 2);

        let hits: int = 0;
        m.forEach((value: int, key: Object): void => {
          if (viewProbe.isArrayBufferView(key)) {
            hits++;
          }
        });
        expect(hits).assertEqual(1);
        expect(viewProbe.isArrayBufferView(m)).assertFalse();
        let viewChecker: util.types = new util.types();
        let held: Uint8Array = new Uint8Array(2);
        let slot: Array<Object> = [held];
        slot[0] = 'gone';
        expect(viewChecker.isArrayBufferView(held)).assertTrue();
        expect(viewChecker.isArrayBufferView(slot[0])).assertFalse();
      }

      // --- [5] Verify the buffer property of a view still points at the original ArrayBuffer after the predicate ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(ab, 2, 3);
        viewProbe.isArrayBufferView(uint8View);
        expect(uint8View.buffer).assertEqual(ab);
        expect(uint8View.buffer.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0600
     * @tc.name testTypesIsArrayBufferView006
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: a view is still writable after the predicate runs; repeating the predicate on the same Float64Array twice returns the same boolean result; a view and a Set judged through one instance do not pollute each other; a subarray can still be derived from a view after the predicate runs; one instance reports a view, its ArrayBuffer and the same buffer as any array buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a view is still writable after the predicate runs ---
      {
        let viewProbe: util.types = new util.types();
        let int32View: Int32Array = new Int32Array(1);
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let uint8View: Uint8Array = new Uint8Array(ab);
        viewProbe.isArrayBufferView(int32View);
        int32View.$_set(0, 42);
        uint8View.$_set(0, 200);
        expect(int32View.$_get(0)).assertEqual(42);
        expect(uint8View.$_get(0)).assertEqual(200);
      }

      // --- [2] Verify repeating the predicate on the same Float64Array twice returns the same boolean result ---
      {
        let viewChecker: util.types = new util.types();
        let float64View: Float64Array = new Float64Array([0]);
        let first: boolean = viewChecker.isArrayBufferView(float64View);
        let second: boolean = viewChecker.isArrayBufferView(float64View);
        expect(first).assertEqual(second);
        expect(first).assertTrue();
      }

      // --- [3] Verify a view and a Set judged through one instance do not pollute each other ---
      {
        let viewChecker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([1]);
        let s: Set<int> = new Set<int>();
        let r1: boolean = viewChecker.isArrayBufferView(uint8View);
        let r2: boolean = viewChecker.isArrayBufferView(s);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
      }

      // --- [4] Verify a subarray can still be derived from a view after the predicate runs ---
      {
        let viewProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(6);
        viewProbe.isArrayBufferView(uint8View);
        let part: Uint8Array = uint8View.subarray(0, 3);
        expect(viewProbe.isArrayBufferView(part)).assertTrue();
        expect(part.length).assertEqual(3);
      }

      // --- [5] Verify one instance reports a view, its ArrayBuffer and the same buffer as any array buffer ---
      {
        let viewChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let r1: boolean = viewChecker.isArrayBufferView(uint8View);
        let r2: boolean = viewChecker.isArrayBuffer(ab);
        let r3: boolean = viewChecker.isAnyArrayBuffer(ab);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(r3).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0700
     * @tc.name testTypesIsArrayBufferView007
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: five views spanning four typed array kinds judged in sequence through one instance are all true; a Uint8Array, Uint16Array and DataView over one ArrayBuffer are all reported as views; a DataView reports true only for isArrayBufferView among the four array buffer predicates; accepts the Uint16Array window produced by a factory function at byteOffset 2; isTypedArray over a DataView and typed arrays counts the typed arrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify five views spanning four typed array kinds judged in sequence through one instance are all true ---
      {
        let viewChecker: util.types = new util.types();
        let a: Int8Array = new Int8Array(1);
        let b: Uint16Array = new Uint16Array(1);
        let c: Float64Array = new Float64Array(1);
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let int8View: Int8Array = new Int8Array(ab);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let r1: boolean = viewChecker.isArrayBufferView(a);
        let r2: boolean = viewChecker.isArrayBufferView(b);
        let r3: boolean = viewChecker.isArrayBufferView(c);
        let r4: boolean = viewChecker.isArrayBufferView(int8View);
        let r5: boolean = viewChecker.isArrayBufferView(uint8View);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(r3).assertTrue();
        expect(r4).assertTrue();
        expect(r5).assertTrue();
      }

      // --- [2] Verify a Uint8Array, Uint16Array and DataView over one ArrayBuffer are all reported as views ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let uint8View: Uint8Array = new Uint8Array(ab);
        let uint16View: Uint16Array = new Uint16Array(ab);
        let dv: DataView = new DataView(ab);
        let r1: boolean = viewProbe.isArrayBufferView(uint8View);
        let r2: boolean = viewProbe.isArrayBufferView(uint16View);
        let r3: boolean = viewProbe.isArrayBufferView(dv);
        let views: int = 0;
        if (r1) {
          views++;
        }
        if (r2) {
          views++;
        }
        if (r3) {
          views++;
        }
        expect(views).assertEqual(3);
      }

      // --- [3] Verify a DataView reports true only for isArrayBufferView among the four array buffer predicates ---
      {
        let viewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let hits: int = 0;
        if (viewProbe.isArrayBufferView(dv)) {
          hits++;
        }
        if (viewProbe.isTypedArray(dv)) {
          hits++;
        }
        if (viewProbe.isArrayBuffer(dv)) {
          hits++;
        }
        if (viewProbe.isAnyArrayBuffer(dv)) {
          hits++;
        }
        expect(hits).assertEqual(1);
      }

      // --- [4] Verify isArrayBufferView returns true for the Uint16Array window produced by a factory function at byteOffset 2 ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let win: Uint16Array = makeWindow(ab);
        expect(viewProbe.isArrayBufferView(win)).assertTrue();
        expect(win.byteOffset).assertEqual(2);
        expect(win.length).assertEqual(3);
      }

      // --- [5] Verify isTypedArray over a DataView and typed arrays counts the typed arrays while view count also includes the DataView ---
      {
        let viewProbe: util.types = new util.types();
        let items: Array<Object> = [
          new DataView(new ArrayBuffer(4)),
          new Uint8Array(1),
          new Int32Array(1),
          new ArrayBuffer(2)
        ];

        let typed: int = 0;
        let views: int = 0;
        for (let i: int = 0; i < items.length; i++) {
          if (viewProbe.isTypedArray(items[i])) {
            typed++;
          }
          if (viewProbe.isArrayBufferView(items[i])) {
            views++;
          }
        }
        expect(typed).assertEqual(2);
        expect(views).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0800
     * @tc.name testTypesIsArrayBufferView008
     * @tc.desc Merged batch (3 tests): Basic construction and recognition: Uint8Array and Uint8ClampedArray are both array buffer views that the concrete predicates tell apart; a mixed dangerous input table yields exactly one view among seven candidates; a BigUint64Array window and a sibling Uint8Array window on one buffer are both views with untouched zeros.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Uint8Array and Uint8ClampedArray are both array buffer views that the concrete predicates tell apart ---
      {
        let viewProbe: util.types = new util.types();
        let backing: ArrayBuffer = new ArrayBuffer(2);
        let plain: Uint8Array = new Uint8Array(backing);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(backing);
        plain[0] = 200;
        expect(clamped[0]).assertEqual(200);
        expect(viewProbe.isArrayBufferView(plain)).assertTrue();
        expect(viewProbe.isArrayBufferView(clamped)).assertTrue();
        expect(viewProbe.isArrayBufferView(backing)).assertFalse();
        expect(viewProbe.isUint8Array(plain)).assertTrue();
        expect(viewProbe.isUint8Array(clamped)).assertFalse();
        expect(viewProbe.isUint8ClampedArray(clamped)).assertTrue();
        expect(viewProbe.isUint8ClampedArray(plain)).assertFalse();
      }

      // --- [2] Verify a mixed dangerous input table yields exactly one view among seven candidates ---
      {
        let viewProbe: util.types = new util.types();
        let candidates: Array<Object> = [new Date(0), new Map<string, int>(), Double.NaN as Object,
          (-1) as Object, 'txt', new Uint8Array(2), new ArrayBuffer(4)];
        let hits: int = 0;
        for (let i: int = 0; i < candidates.length; i++) {
          if (viewProbe.isArrayBufferView(candidates[i])) {
            hits++;
          }
        }
        expect(hits).assertEqual(1);
      }

      // --- [3] Verify a BigUint64Array window and a sibling Uint8Array window on one buffer are both views with untouched zeros ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bu: BigUint64Array = new BigUint64Array(ab, 0, 1);
        let uint8View: Uint8Array = new Uint8Array(ab, 8, 2);
        expect(viewProbe.isArrayBufferView(bu)).assertTrue();
        expect(viewProbe.isArrayBufferView(uint8View)).assertTrue();
        expect(uint8View.$_get(0)).assertEqual(0);
        expect(uint8View.$_get(1)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_0900
     * @tc.name testTypesIsArrayBufferView009
     * @tc.desc Merged batch (5 tests): Boundary values: accepts single element arrays of four distinct typed array kinds; accepts a zero length DataView taken at offset 0; accepts eight typed array kinds constructed with length zero; accepts zero length tail views built with explicit and omitted length; rejects the negative zero double and the negative int -1.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns true for single element arrays of four distinct typed array kinds ---
      {
        let viewProbe: util.types = new util.types();
        let singles: Array<Object> = [new Uint8ClampedArray([9]), new Int32Array([1]),
          new Float64Array([3.25]), new Float32Array([1.5])];
        let views: int = 0;
        for (let i: int = 0; i < singles.length; i++) {
          if (viewProbe.isArrayBufferView(singles[i])) {
            views++;
          }
        }
        expect(views).assertEqual(4);
      }

      // --- [2] Verify isArrayBufferView returns true for a zero length DataView taken at offset 0 ---
      {
        let viewProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4), 0, 0);
        expect(viewProbe.isArrayBufferView(dv)).assertTrue();
        expect(dv.byteLength).assertEqual(0);
      }

      // --- [3] Verify isArrayBufferView returns true for eight typed array kinds constructed with length zero ---
      {
        let viewProbe: util.types = new util.types();
        let empties: Array<Object> = [new Uint8Array(0), new Uint16Array(0), new Uint32Array(0),
          new Int16Array(0), new Int32Array(0), new Uint8ClampedArray(0), new Float64Array(0),
          new BigInt64Array(0)];
        let views: int = 0;
        for (let i: int = 0; i < empties.length; i++) {
          if (viewProbe.isArrayBufferView(empties[i])) {
            views++;
          }
        }
        expect(views).assertEqual(8);
      }

      // --- [4] Verify isArrayBufferView returns true for zero length tail views built with explicit and omitted length ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let explicit: Uint8Array = new Uint8Array(ab, 8, 0);
        let omitted: Uint8Array = new Uint8Array(ab, 8);
        expect(viewProbe.isArrayBufferView(explicit)).assertTrue();
        expect(viewProbe.isArrayBufferView(omitted)).assertTrue();
        expect(explicit.length).assertEqual(0);
        expect(omitted.length).assertEqual(0);
      }

      // --- [5] Verify isArrayBufferView returns false for the negative zero double and the negative int -1 ---
      {
        let viewChecker: util.types = new util.types();
        let negZero: double = -0.0;
        expect(viewChecker.isArrayBufferView(negZero)).assertFalse();
        expect(viewChecker.isArrayBufferView(-1)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1000
     * @tc.name testTypesIsArrayBufferView010
     * @tc.desc Merged batch (5 tests): Boundary values: rejects the empty string and for a repeated 10000 character string; rejects a zero length ArrayBuffer; rejects an array whose single element is itself a view; accepts BigInt64Array and BigUint64Array holding bigint elements; a copy constructed Int32Array reports a byteLength equal to four times its length and a zero byteOffset.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns false for the empty string and for a repeated 10000 character string ---
      {
        let viewProbe: util.types = new util.types();
        let longText: string = 'x'.repeat(10000);
        expect(viewProbe.isArrayBufferView('')).assertFalse();
        expect(viewProbe.isArrayBufferView(longText)).assertFalse();
        expect(longText.length).assertEqual(10000);
      }

      // --- [2] Verify isArrayBufferView returns false for a zero length ArrayBuffer ---
      {
        let viewChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0);
        expect(viewChecker.isArrayBufferView(ab)).assertFalse();
      }

      // --- [3] Verify isArrayBufferView returns false for an array whose single element is itself a view ---
      {
        let viewChecker: util.types = new util.types();
        let nested: Array<Uint8Array> = [new Uint8Array(1)];
        expect(viewChecker.isArrayBufferView(nested)).assertFalse();
        expect(viewChecker.isArrayBufferView(nested[0])).assertTrue();
      }

      // --- [4] Verify isArrayBufferView returns true for BigInt64Array and BigUint64Array holding bigint elements ---
      {
        let viewProbe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        bigInt64View.$_set(0, BigInt(1));
        expect(viewProbe.isArrayBufferView(bigInt64View)).assertTrue();
        expect(bigInt64View.$_get(0)).assertEqual(BigInt(1));
        let bu: BigUint64Array = new BigUint64Array(1);
        bu.$_set(0, BigInt(0));
        expect(viewProbe.isArrayBufferView(bu)).assertTrue();
        expect(bu.$_get(0)).assertEqual(BigInt(0));
      }

      // --- [5] Verify a copy constructed Int32Array reports a byteLength equal to four times its length and a zero byteOffset ---
      {
        let viewProbe: util.types = new util.types();
        let src: Int32Array = new Int32Array([1, 2, 3]);
        let copy: Int32Array = new Int32Array(src);
        expect(viewProbe.isArrayBufferView(copy)).assertTrue();
        expect(copy.byteLength).assertEqual(copy.length * 4);
        expect(copy.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1100
     * @tc.name testTypesIsArrayBufferView011
     * @tc.desc Merged batch (1 test): Boundary values: a copy of a windowed subarray resets byteOffset to zero while a zero length window copy stays empty.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a copy of a windowed subarray resets byteOffset to zero while a zero length window copy stays empty ---
      {
        let viewProbe: util.types = new util.types();
        let base: Uint8Array = new Uint8Array(8);
        let win: Uint8Array = base.subarray(2, 6);
        let copy: Uint8Array = new Uint8Array(win);
        let empty: Uint8Array = base.subarray(8, 8);
        let emptyCopy: Uint8Array = new Uint8Array(empty);
        expect(viewProbe.isArrayBufferView(win)).assertTrue();
        expect(viewProbe.isArrayBufferView(copy)).assertTrue();
        expect(viewProbe.isArrayBufferView(emptyCopy)).assertTrue();
        expect(copy.byteOffset).assertEqual(0);
        expect(copy.length).assertEqual(4);
        expect(win.byteOffset).assertEqual(2);
        expect(emptyCopy.length).assertEqual(0);
        expect(empty.byteOffset).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1200
     * @tc.name testTypesIsArrayBufferView012
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the int value 0 and the fractional double 3.14; rejects NaN and for negative infinity; boolean values true and false; bigint element read out of a BigInt64Array; rejects a plain class instance that only carries int fields.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns false for the int value 0 and the fractional double 3.14 ---
      {
        let viewChecker: util.types = new util.types();
        let first: int = 0;
        expect(viewChecker.isArrayBufferView(first)).assertFalse();
        expect(viewChecker.isArrayBufferView(3.14)).assertFalse();
      }

      // --- [2] Verify isArrayBufferView returns false for NaN and for negative infinity ---
      {
        let viewChecker: util.types = new util.types();
        expect(viewChecker.isArrayBufferView(Double.NaN)).assertFalse();
        expect(viewChecker.isArrayBufferView(Double.NEGATIVE_INFINITY)).assertFalse();
      }

      // --- [3] Verify isArrayBufferView returns false for the boolean values true and false ---
      {
        let viewChecker: util.types = new util.types();
        expect(viewChecker.isArrayBufferView(true)).assertFalse();
        expect(viewChecker.isArrayBufferView(false)).assertFalse();
      }

      // --- [4] Verify isArrayBufferView returns false for the bigint element read out of a BigInt64Array ---
      {
        let viewChecker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let big: bigint = bigInt64View.$_get(0);
        expect(viewChecker.isArrayBufferView(big)).assertFalse();
        expect(viewChecker.isArrayBufferView(bigInt64View)).assertTrue();
      }

      // --- [5] Verify isArrayBufferView returns false for a plain class instance that only carries int fields ---
      {
        let viewProbe: util.types = new util.types();
        let tile: GridTile = new GridTile();
        expect(viewProbe.isArrayBufferView(tile)).assertFalse();
        expect(tile.width).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1300
     * @tc.name testTypesIsArrayBufferView013
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a Record container holding a single int entry; rejects an int array; string array; two dimensional int array; rejects an array mixing int and string elements.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns false for a Record container holding a single int entry ---
      {
        let viewChecker: util.types = new util.types();
        let rec: Record<string, int> = { 'k': 1 };
        expect(viewChecker.isArrayBufferView(rec)).assertFalse();
      }

      // --- [2] Verify isArrayBufferView returns false for an int array ---
      {
        let viewProbe: util.types = new util.types();
        let nums: int[] = [1, 2, 3];
        expect(viewProbe.isArrayBufferView(nums)).assertFalse();
        expect(nums.length).assertEqual(3);
      }

      // --- [3] Verify isArrayBufferView returns false for a string array ---
      {
        let viewChecker: util.types = new util.types();
        let words: string[] = ['a', 'b'];
        expect(viewChecker.isArrayBufferView(words)).assertFalse();
      }

      // --- [4] Verify isArrayBufferView returns false for a two dimensional int array ---
      {
        let viewChecker: util.types = new util.types();
        let two: Array<Array<int>> = [[1, 2], [3, 4]];
        expect(viewChecker.isArrayBufferView(two)).assertFalse();
      }

      // --- [5] Verify isArrayBufferView returns false for an array mixing int and string elements ---
      {
        let viewChecker: util.types = new util.types();
        let mix: Array<int | string> = [1, 'a', 2];
        expect(viewChecker.isArrayBufferView(mix)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1400
     * @tc.name testTypesIsArrayBufferView014
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a double array carrying NaN and for a boolean array; rejects an int array that contains a null element; two util.types instances both judge a class field view true and a plain int field false; a false returning call on a string does not affect a later true result for a view; rejects a promise resolved with the int 1.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns false for a double array carrying NaN and for a boolean array ---
      {
        let viewChecker: util.types = new util.types();
        let dvals: Array<double> = [Double.NaN, 1.5];
        let flags: Array<boolean> = [true, false];
        expect(viewChecker.isArrayBufferView(dvals)).assertFalse();
        expect(viewChecker.isArrayBufferView(flags)).assertFalse();
      }

      // --- [2] Verify isArrayBufferView returns false for an int array that contains a null element ---
      {
        let viewChecker: util.types = new util.types();
        let na: Array<int | null> = [1, null, 3];
        expect(viewChecker.isArrayBufferView(na)).assertFalse();
      }

      // --- [3] Verify two util.types instances both judge a class field view true and a plain int field false ---
      {
        let viewCheckerA: util.types = new util.types();
        let viewCheckerB: util.types = new util.types();
        let holder: ViewHolder = new ViewHolder();
        expect(viewCheckerA.isArrayBufferView(holder.data)).assertTrue();
        expect(viewCheckerB.isArrayBufferView(holder.data)).assertTrue();
        expect(viewCheckerA.isArrayBufferView(holder.id)).assertFalse();
        expect(viewCheckerB.isArrayBufferView(holder.id)).assertFalse();
      }

      // --- [4] Verify a false returning call on a string does not affect a later true result for a view ---
      {
        let viewChecker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([1]);
        expect(viewChecker.isArrayBufferView('noise')).assertFalse();
        expect(viewChecker.isArrayBufferView(uint8View)).assertTrue();
      }

      // --- [5] Verify isArrayBufferView returns false for a promise resolved with the int 1 ---
      {
        let viewChecker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(viewChecker.isArrayBufferView(p)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1500
     * @tc.name testTypesIsArrayBufferView015
     * @tc.desc Merged batch (1 test): Primitive value rejection: rejects an interface object that owns an int array field.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns false for an interface object that owns an int array field ---
      {
        let viewProbe: util.types = new util.types();
        let box: ItemBox = { items: [1, 2, 3] };
        expect(viewProbe.isArrayBufferView(box)).assertFalse();
        expect(box.items.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1600
     * @tc.name testTypesIsArrayBufferView016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a sixteen byte ArrayBuffer that itself is not a view; rejects the raw buffer extracted from a Uint8Array view; rejects an interface typed object literal; Date instance and a RegExp carrying the global flag and an Error instance carrying a message; Map container and for a Set container and WeakMap and for a WeakSet container.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns false for a sixteen byte ArrayBuffer that itself is not a view ---
      {
        let viewChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        expect(viewChecker.isArrayBufferView(ab)).assertFalse();
        expect(viewChecker.isArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(16);
      }

      // --- [2] Verify isArrayBufferView returns false for the raw buffer extracted from a Uint8Array view ---
      {
        let viewChecker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(4);
        let raw: ArrayBuffer = uint8View.buffer;
        expect(viewChecker.isArrayBufferView(raw)).assertFalse();
      }

      // --- [3] Verify isArrayBufferView returns false for an interface typed object literal ---
      {
        let viewProbe: util.types = new util.types();
        let p: Point2 = { x: 1, y: 2 };
        expect(viewProbe.isArrayBufferView(p)).assertFalse();
        expect(p.y).assertEqual(2);
      }

      // --- [4] Verify isArrayBufferView returns false for a Date instance and a RegExp carrying the global flag and an Error instance carrying a message ---
      {
        let viewChecker: util.types = new util.types();
        let d: Date = new Date(1700000000000);
        let re: RegExp = new RegExp('ab', 'g');
        expect(viewChecker.isArrayBufferView(d)).assertFalse();
        expect(viewChecker.isArrayBufferView(re)).assertFalse();
        let viewProbe: util.types = new util.types();
        let er: Error = new Error('boom');
        expect(viewProbe.isArrayBufferView(er)).assertFalse();
        expect(er.message).assertEqual('boom');
      }

      // --- [5] Verify isArrayBufferView returns false for a Map container and for a Set container and WeakMap and for a WeakSet container ---
      {
        let viewProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        expect(viewProbe.isArrayBufferView(m)).assertFalse();
        expect(viewProbe.isArrayBufferView(s)).assertFalse();
        expect(m.size).assertEqual(1);
        let viewChecker: util.types = new util.types();
        let key: SlotKey = new SlotKey();
        let wm: WeakMap<SlotKey, int> = new WeakMap<SlotKey, int>();
        wm.set(key, 5);
        let ws: WeakSet<SlotKey> = new WeakSet<SlotKey>();
        ws.add(key);
        expect(viewChecker.isArrayBufferView(wm)).assertFalse();
        expect(viewChecker.isArrayBufferView(ws)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1700
     * @tc.name testTypesIsArrayBufferView017
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a plain function and for an async arrow function; Map key iterator and for a Set value iterator; WeakRef wrapper around a Uint8Array; plain object that owns a Uint8Array property and class instance that holds a static Uint8Array field; rejects structural impostors that copy view attributes.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns false for a plain function and for an async arrow function ---
      {
        let viewChecker: util.types = new util.types();
        let plain: Function = (): int => {
          return 2;
        };
        let af: Function = async (): Promise<void> => {
        };
        expect(viewChecker.isArrayBufferView(plain)).assertFalse();
        expect(viewChecker.isArrayBufferView(af)).assertFalse();
      }

      // --- [2] Verify isArrayBufferView returns false for a Map key iterator and for a Set value iterator ---
      {
        let viewChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(1);
        let mk: IterableIterator<string> = m.keys();
        let sv: IterableIterator<int> = s.values();
        expect(viewChecker.isArrayBufferView(mk)).assertFalse();
        expect(viewChecker.isArrayBufferView(sv)).assertFalse();
      }

      // --- [3] Verify isArrayBufferView returns false for a WeakRef wrapper around a Uint8Array ---
      {
        let viewChecker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(2);
        let wr: WeakRef<Uint8Array> = new WeakRef<Uint8Array>(uint8View);
        expect(viewChecker.isArrayBufferView(wr)).assertFalse();
        expect(viewChecker.isArrayBufferView(uint8View)).assertTrue();
      }

      // --- [4] Verify isArrayBufferView returns false for a plain object that owns a Uint8Array property and class instance that holds a static Uint8Array field ---
      {
        let viewChecker: util.types = new util.types();
        let env: ViewEnvelope = { data: new Uint8Array(2) };
        expect(viewChecker.isArrayBufferView(env)).assertFalse();
        expect(viewChecker.isArrayBufferView(env.data)).assertTrue();
        let viewChecker_2: util.types = new util.types();
        let sb: StaticBuffer = new StaticBuffer();
        expect(viewChecker_2.isArrayBufferView(sb)).assertFalse();
        expect(viewChecker_2.isArrayBufferView(StaticBuffer.buf)).assertTrue();
      }

      // --- [5] Verify isArrayBufferView returns false for structural impostors that copy view attributes ---
      {
        let viewProbe: util.types = new util.types();
        let fake: FakeViewShape = new FakeViewShape();
        let like: LengthOnly = new LengthOnly();
        expect(viewProbe.isArrayBufferView(fake)).assertFalse();
        expect(viewProbe.isArrayBufferView(like)).assertFalse();
        expect(fake.byteLength).assertEqual(4);
        expect(like.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1800
     * @tc.name testTypesIsArrayBufferView018
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Map whose value is a Uint8Array view; rejects a two node cyclic reference without raising an exception; an interface object property keeps its value after a false predicate result; isArrayBufferView rejects a Set and a WeakSet holding a view; an ArrayBuffer is not a view while being an ArrayBuffer, and a Map stays usable afterwards.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isArrayBufferView returns false for a Map whose value is a Uint8Array view ---
      {
        let viewChecker: util.types = new util.types();
        let vm: Map<string, Uint8Array> = new Map<string, Uint8Array>();
        vm.set('v', new Uint8Array(1));
        let got: Uint8Array = vm.get('v') as Uint8Array;
        expect(viewChecker.isArrayBufferView(vm)).assertFalse();
        expect(viewChecker.isArrayBufferView(got)).assertTrue();
      }

      // --- [2] Verify isArrayBufferView returns false for a two node cyclic reference without raising an exception ---
      {
        let viewProbe: util.types = new util.types();
        let first: CycleNode = new CycleNode();
        let second: CycleNode = new CycleNode();
        first.next = second;
        second.next = first;
        expect(viewProbe.isArrayBufferView(first)).assertFalse();
        expect(first.next).assertEqual(second);
      }

      // --- [3] Verify an interface object property keeps its value after a false predicate result ---
      {
        let viewProbe: util.types = new util.types();
        let cfg: ConfigPair = { a: 7, b: 'k' };
        viewProbe.isArrayBufferView(cfg);
        expect(cfg.a).assertEqual(7);
        expect(cfg.b).assertEqual('k');
      }

      // --- [4] Verify isArrayBufferView rejects a Set and a WeakSet holding a view while still accepting the view member itself ---
      {
        let viewProbe: util.types = new util.types();
        let view: Uint8Array = new Uint8Array(2);
        let pool: Set<Uint8Array> = new Set<Uint8Array>();
        pool.add(view);
        let weak: WeakSet<Uint8Array> = new WeakSet<Uint8Array>();
        weak.add(view);
        expect(viewProbe.isArrayBufferView(pool)).assertFalse();
        expect(viewProbe.isArrayBufferView(weak)).assertFalse();
        expect(viewProbe.isArrayBufferView(view)).assertTrue();
        expect(viewProbe.isSet(pool)).assertTrue();
        expect(viewProbe.isWeakSet(weak)).assertTrue();
        expect(viewProbe.isWeakSet(pool)).assertFalse();
        expect(pool.size).assertEqual(1);
      }

      // --- [5] Verify an ArrayBuffer is not a view while being an ArrayBuffer, and a Map stays usable afterwards ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let isView: boolean = viewProbe.isArrayBufferView(ab);
        let isAb: boolean = viewProbe.isArrayBuffer(ab);
        viewProbe.isArrayBufferView(m);
        m.set('b', 2);
        expect(isView).assertFalse();
        expect(isAb).assertTrue();
        expect(m.get('b')).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_1900
     * @tc.name testTypesIsArrayBufferView019
     * @tc.desc Merged batch (4 tests): Non-target object rejection: verifies rejection of unrelated objects, covering direct-call comparison.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a class method judges both of its own view fields to true while the holder instance is false ---
      {
        let viewProbe: util.types = new util.types();
        let holder: PairedHolder = new PairedHolder();
        expect(viewProbe.isArrayBufferView(holder)).assertFalse();
        expect(holder.countViews(viewProbe)).assertEqual(2);
      }

      // --- [2] Verify isArrayBufferView and isTypedArray are both true for an Int16Array while isArrayBuffer is false ---
      {
        let viewChecker: util.types = new util.types();
        let int16View: Int16Array = new Int16Array(1);
        expect(viewChecker.isArrayBufferView(int16View)).assertTrue();
        expect(viewChecker.isTypedArray(int16View)).assertTrue();
        expect(viewChecker.isArrayBuffer(int16View)).assertFalse();
      }

      // --- [3] Verify isArrayBufferView interleaved with error, promise and map judgements on one instance is not polluted ---
      {
        let viewChecker: util.types = new util.types();
        let er: Error = new RangeError('r');
        let p: Promise<int> = Promise.resolve<int>(1);
        let m: Map<string, int> = new Map<string, int>();
        let float32View: Float32Array = new Float32Array([0.5]);
        expect(viewChecker.isNativeError(er)).assertTrue();
        expect(viewChecker.isArrayBufferView(float32View)).assertTrue();
        expect(viewChecker.isPromise(p)).assertTrue();
        expect(viewChecker.isMap(m)).assertTrue();
        expect(viewChecker.isArrayBufferView(m)).assertFalse();
      }

      // --- [4] Verify a byte written through a sibling view at another offset does not disturb a judged window element ---
      {
        let viewProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let win: Uint8Array = new Uint8Array(ab, 4, 2);
        let sibling: Uint8Array = new Uint8Array(ab, 0, 2);
        win.$_set(0, 5);
        let hit: boolean = viewProbe.isArrayBufferView(win);
        sibling.$_set(0, 9);
        expect(hit).assertTrue();
        expect(win.$_get(0)).assertEqual(5);
        expect(sibling.$_get(0)).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ARRAY_BUFFER_VIEW_2000
     * @tc.name testTypesIsArrayBufferView020
     * @tc.desc Merged batch (4 tests): View versus buffer separation: verifies predicate verdicts, covering typed array windows, shared buffers, slices and nested literals.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsArrayBufferView020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Int32Array and Uint8Array windows are views while their shared buffer fails the view test yet passes isArrayBuffer and isAnyArrayBuffer ---
      {
        let viewChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let intWindow: Int32Array = new Int32Array(ab, 4, 1);
        let byteWindow: Uint8Array = new Uint8Array(ab, 1, 3);
        expect(viewChecker.isArrayBufferView(intWindow)).assertTrue();
        expect(viewChecker.isArrayBufferView(byteWindow)).assertTrue();
        expect(viewChecker.isArrayBufferView(intWindow.buffer)).assertFalse();
        expect(viewChecker.isArrayBuffer(intWindow.buffer)).assertTrue();
        expect(viewChecker.isAnyArrayBuffer(intWindow.buffer)).assertTrue();
      }

      // --- [2] Verify isArrayBufferView returns false for a self referencing object without raising an exception and three level nested object literal ---
      {
        let viewChecker: util.types = new util.types();
        let node: SelfNode = new SelfNode();
        node.self = node;
        expect(viewChecker.isArrayBufferView(node)).assertFalse();
        let viewProbe: util.types = new util.types();
        let top: TopBox = { mid: { leaf: { value: 1 } } };
        expect(viewProbe.isArrayBufferView(top)).assertFalse();
        expect(top.mid.leaf.value).assertEqual(1);
      }

      // --- [3] Verify isArrayBufferView returns false for the ArrayBuffer slice product of an eight byte buffer ---
      {
        let viewProbe: util.types = new util.types();
        let big: ArrayBuffer = new ArrayBuffer(8);
        let part: ArrayBuffer = big.slice(1, 4);
        expect(viewProbe.isArrayBufferView(part)).assertFalse();
        expect(part.byteLength).assertEqual(3);
      }

      // --- [4] Verify a Uint16Array over a four byte slice of an eight byte buffer is a view while the source buffer is rejected ---
      {
        let viewProbe: util.types = new util.types();
        let big: ArrayBuffer = new ArrayBuffer(8);
        let part: ArrayBuffer = big.slice(0, 4);
        let win: Uint16Array = new Uint16Array(part);
        win.$_set(0, 258);
        expect(viewProbe.isArrayBufferView(win)).assertTrue();
        expect(viewProbe.isArrayBufferView(big)).assertFalse();
        expect(win.$_get(0)).assertEqual(258);
      }
    });

  });
}
