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
  beforeEach, describe, expect, it, Level, Size, TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferViewProperty2Test(): void {
  describe('ArrayBufferViewProperty2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferViewProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0100
     * @tc.desc Verify Int8Array.buffer references underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(ab);
      expect(view.buffer).assertEqual(ab);
    });

    /**
     * @tc.name testArrayBufferViewProperty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0200
     * @tc.desc Verify Uint8Array.buffer references underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const view: Uint8Array = new Uint8Array(ab);
      expect(view.buffer).assertEqual(ab);
    });

    /**
     * @tc.name testArrayBufferViewProperty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0300
     * @tc.desc Verify Float64Array.buffer references underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Float64Array = new Float64Array(ab);
      expect(view.buffer).assertEqual(ab);
    });

    /**
     * @tc.name testArrayBufferViewProperty0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0400
     * @tc.desc Verify Int32Array.buffer references underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Int32Array = new Int32Array(ab);
      expect(view.buffer).assertEqual(ab);
    });

    /**
     * @tc.name testArrayBufferViewProperty0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0500
     * @tc.desc Verify Uint32Array.buffer references underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Uint32Array = new Uint32Array(ab);
      expect(view.buffer).assertEqual(ab);
    });

    /**
     * @tc.name testArrayBufferViewProperty0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0600
     * @tc.desc Verify Int8Array byteLength equals buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(ab);
      expect(view.byteLength).assertEqual(ab.byteLength);
    });

    /**
     * @tc.name testArrayBufferViewProperty0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0700
     * @tc.desc Verify Float64Array byteLength equals buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Float64Array = new Float64Array(ab);
      expect(view.byteLength).assertEqual(ab.byteLength);
    });

    /**
     * @tc.name testArrayBufferViewProperty0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0800
     * @tc.desc Verify Int8Array with byteOffset has correct byteOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Int8Array = new Int8Array(ab, 4);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferViewProperty0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0900
     * @tc.desc Verify Int8Array with byteOffset and byteLength has correct properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Int8Array = new Int8Array(ab, 4, 8);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferViewProperty0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1000
     * @tc.desc Verify Int32Array with byteOffset has correct byteOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Int32Array = new Int32Array(ab, 4);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferViewProperty0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1100
     * @tc.desc Verify Int32Array with byteOffset and length has correct properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Int32Array = new Int32Array(ab, 4, 2);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferViewProperty0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1200
     * @tc.desc Verify Int8Array with business threshold byteOffset throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(16);
        new Int8Array(ab, 1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1300
     * @tc.desc Verify Int8Array with int max value byteOffset throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(16);
        new Int8Array(ab, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1400
     * @tc.desc Verify Int8Array with negative byteOffset throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(16);
        new Int8Array(ab, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1500
     * @tc.desc Verify Int8Array with 0x8 byteLength (hexadecimal)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Int8Array = new Int8Array(ab, 0, 0x8);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferViewProperty0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1600
     * @tc.desc Verify Int8Array with business threshold byteLength throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(16);
        new Int8Array(ab, 0, 1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1700
     * @tc.desc Verify Int8Array with int max value byteLength throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(16);
        new Int8Array(ab, 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1800
     * @tc.desc Verify Int8Array with negative byteLength throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(16);
        new Int8Array(ab, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1900
     * @tc.desc Verify Int8Array on resizable buffer has correct buffer reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(2, 8);
      const view: Int8Array = new Int8Array(ab);
      expect(view.buffer).assertEqual(ab);
    });

    /**
     * @tc.name testArrayBufferViewProperty0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2000
     * @tc.desc Verify Int8Array on resizable buffer after resize has correct byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(2, 8);
      const view: Int8Array = new Int8Array(ab);
      ab.resize(6);
      expect(view.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferViewProperty0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2100
     * @tc.desc Verify Int8Array byteOffset+byteLength equals buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(16);
      const view: Int8Array = new Int8Array(ab, 4, 8);
      expect(view.byteOffset + view.byteLength).assertEqual(4 + 8);
    });

    /**
     * @tc.name testArrayBufferViewProperty0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2200
     * @tc.desc Verify Int8Array with byteOffset exceeding buffer.byteLength throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(8);
        new Int8Array(ab, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2300
     * @tc.desc Verify Int8Array with byteLength exceeding buffer.byteLength throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(8);
        new Int8Array(ab, 0, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2400
     * @tc.desc Verify Int8Array with byteOffset+byteLength exceeding buffer.byteLength throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab: ArrayBuffer = new ArrayBuffer(8);
        new Int8Array(ab, 4, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2500
     * @tc.desc Verify Int8Array on large buffer has correct byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(10000);
      const view: Int8Array = new Int8Array(ab);
      expect(view.byteLength).assertEqual(10000);
    });

    /**
     * @tc.name testArrayBufferViewProperty0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2600
     * @tc.desc Verify two views on same buffer read same byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const v1: Int8Array = new Int8Array(ab);
      const v2: Int8Array = new Int8Array(ab);
      v1[0] = Int.toByte(42);
      expect(v2[0]).assertEqual(Int.toByte(42));
    });

    /**
     * @tc.name testArrayBufferViewProperty0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2700
     * @tc.desc Verify views with different types read consistent bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const i8: Int8Array = new Int8Array(ab);
      const u8: Uint8Array = new Uint8Array(ab);
      i8[0] = Int.toByte(-1);
      expect(u8[0]).assertEqual(255);
    });

    /**
     * @tc.name testArrayBufferViewProperty0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2800
     * @tc.desc Verify at() mutation visible from second view
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const v1: Int8Array = new Int8Array(ab);
      const v2: Int8Array = new Int8Array(ab);
      ab.set(0, Int.toByte(77));
      expect(v1[0]).assertEqual(Int.toByte(77));
      expect(v2[0]).assertEqual(Int.toByte(77));
    });

    /**
     * @tc.name testArrayBufferViewProperty0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2900
     * @tc.desc Verify view mutation visible via buffer.at()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(ab);
      view[0] = Int.toByte(-128);
      expect(ab.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferViewProperty0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3000
     * @tc.desc Verify second view added after resize reads fresh data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4, 16);
      ab.resize(8);
      const v2: Int8Array = new Int8Array(ab);
      ab.set(7, Int.toByte(99));
      expect(v2[7]).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferViewProperty0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3100
     * @tc.desc Verify multiple views with different offsets remain consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const b8: Int8Array = new Int8Array(ab);
      const b16: Int16Array = new Int16Array(ab);
      b8[0] = Int.toByte(0x12);
      b8[1] = Int.toByte(0x34);
      expect(b16[0]).assertEqual(0x3412);
    });

    /**
     * @tc.name testArrayBufferViewProperty0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3200
     * @tc.desc Verify DataView.buffer, byteOffset, byteLength properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const dv: DataView = new DataView(buf, 2, 8);
      expect(dv.buffer).assertEqual(buf);
      expect(dv.byteOffset).assertEqual(2);
      expect(dv.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferViewProperty0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3300
     * @tc.desc Verify DataView.byteLength equals ArrayBuffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const dv: DataView = new DataView(buf);
      expect(dv.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferViewProperty0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3400
     * @tc.desc Verify DataView.byteOffset is 0 by default
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      expect(dv.byteOffset).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferViewProperty0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3500
     * @tc.desc Verify DataView with byteOffset and byteLength has correct properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const dv: DataView = new DataView(buf, 4, 8);
      expect(dv.byteOffset).assertEqual(4);
      expect(dv.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferViewProperty0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3600
     * @tc.desc Verify Uint16Array.buffer equals the constructing ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const u16: Uint16Array = new Uint16Array(buf);
      expect(u16.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testArrayBufferViewProperty0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3700
     * @tc.desc Verify Int32Array.buffer equals the constructing ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const i32: Int32Array = new Int32Array(buf);
      expect(i32.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testArrayBufferViewProperty0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3800
     * @tc.desc Verify Int8Array with offset and length via TypedArray constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const i8: Int8Array = new Int8Array(buf, 2, 6);
      expect(i8.byteOffset).assertEqual(2);
      expect(i8.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferViewProperty0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3900
     * @tc.desc Verify Uint8Array.buffer on 0-length buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const u8: Uint8Array = new Uint8Array(buf);
      expect(u8.buffer).assertEqual(buf);
      expect(u8.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferViewProperty0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4000
     * @tc.desc Verify Float32Array.buffer property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const f32: Float32Array = new Float32Array(buf);
      expect(f32.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testArrayBufferViewProperty0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4100
     * @tc.desc Verify Int16Array with offset has correct byteOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const i16: Int16Array = new Int16Array(buf, 2, 4);
      expect(i16.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferViewProperty0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4200
     * @tc.desc Verify multiple views share same buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      const i8: Int8Array = new Int8Array(buf);
      const u16: Uint16Array = new Uint16Array(buf);
      expect(dv.buffer).assertEqual(buf);
      expect(i8.buffer).assertEqual(buf);
      expect(u16.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testArrayBufferViewProperty0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4300
     * @tc.desc Verify DataView from resizable buffer has correct buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4, 16);
      const dv: DataView = new DataView(buf);
      expect(dv.buffer).assertEqual(buf);
    });
  });
}