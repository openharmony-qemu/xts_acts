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
 * WITHOUT WARRANTIES OR ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferViewPropertyTest(): void {
  describe('ArrayBufferViewPropertyTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.name testArrayBufferViewProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0100
     * @tc.desc Verify ArrayBufferView properties: DataViewinstance access bufferproperty ，verify returns backing ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view: ArrayBufferView = new DataView(ab)
      expect(view.buffer).assertEqual(ab)
    });

    /**
     * @tc.name testArrayBufferViewProperty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0200
     * @tc.desc Verify ArrayBufferView properties: Int8Arrayinstance is ArrayBufferViewaccess bufferproperty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view: ArrayBufferView = new Int8Array(ab)
      expect(view.buffer).assertEqual(ab)
    });

    /**
     * @tc.name testArrayBufferViewProperty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0300
     * @tc.desc Verify ArrayBufferView properties: Uint8Arrayinstance is ArrayBufferViewaccess bufferproperty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new Uint8Array(ab)
      expect(view.buffer).assertEqual(ab)
    });

    /**
     * @tc.name testArrayBufferViewProperty0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0400
     * @tc.desc Verify ArrayBufferView properties: Int32Arrayinstance is ArrayBufferViewaccess bufferproperty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new Int32Array(ab)
      expect(view.buffer).assertEqual(ab)
    });

    /**
     * @tc.name testArrayBufferViewProperty0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0500
     * @tc.desc Verify ArrayBufferView properties: Float64Arrayinstance is ArrayBufferViewaccess bufferproperty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view: ArrayBufferView = new Float64Array(ab)
      expect(view.buffer).assertEqual(ab)
    });

    /**
     * @tc.name testArrayBufferViewProperty0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0600
     * @tc.desc Verify ArrayBufferView properties: byteOffset byteLength DataViewaccess buffer，buffer returns ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 4, 8)
      expect(view.buffer).assertEqual(ab)
    });

    /**
     * @tc.name testArrayBufferViewProperty0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0700
     * @tc.desc Verify ArrayBufferView properties: byteOffset length TypedArrayaccess buffer，buffer returns ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new Int8Array(ab, 4, 8)
      expect(view.buffer).assertEqual(ab)
    });

    /**
     * @tc.name testArrayBufferViewProperty0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0800
     * @tc.desc Verify ArrayBufferView properties: DataViewinstance byteLengthequals passing byteLength or ArrayBuffer length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 4, 8)
      expect(view.byteLength).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferViewProperty0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0900
     * @tc.desc Verify ArrayBufferView properties: DataView byteLength ，byteLength is ArrayBufferlength byteOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 4)
      expect(view.byteLength).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferViewProperty0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1000
     * @tc.desc Verify ArrayBufferView properties: TypedArray byteLengthequals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Int32Array(4)
      expect(view.byteLength).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferViewProperty0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1100
     * @tc.desc Verify ArrayBufferView properties: Int8Array byteLengthequals array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Int8Array(10)
      expect(view.byteLength).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferViewProperty0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1200
     * @tc.desc Verify ArrayBufferView properties: Float64Array byteLengthequals array length 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Float64Array(3)
      expect(view.byteLength).assertEqual(24)
    });

    /**
     * @tc.name testArrayBufferViewProperty0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1300
     * @tc.desc Verify ArrayBufferView properties: DataViewinstance byteOffsetequals constructor passing offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 4, 8)
      expect(view.byteOffset).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferViewProperty0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1400
     * @tc.desc Verify ArrayBufferView properties: DataView byteOffset ，byteOffset is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view: ArrayBufferView = new DataView(ab)
      expect(view.byteOffset).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferViewProperty0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1500
     * @tc.desc Verify ArrayBufferView properties: TypedArray offset constructor ，byteOffsetequals passing offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new Int8Array(ab, 4, 8)
      expect(view.byteOffset).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferViewProperty0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1600
     * @tc.desc Verify ArrayBufferView properties: TypedArray offset ，byteOffset is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Int8Array(8)
      expect(view.byteOffset).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferViewProperty0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1700
     * @tc.desc Verify ArrayBufferView properties: Int32Array byteOffset 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new Int32Array(ab, 8)
      expect(view.byteOffset).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferViewProperty0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1800
     * @tc.desc Verify ArrayBufferView properties: bufferproperty returns ArrayBuffer and constructor passing instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view: ArrayBufferView = new DataView(ab)
      expect(view.buffer === ab).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1900
     * @tc.desc Verify ArrayBufferView properties: from ArrayBuffercreate view bufferreference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view1: ArrayBufferView = new Int8Array(ab)
      let view2: ArrayBufferView = new DataView(ab)
      expect(view1.buffer === view2.buffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2000
     * @tc.desc Verify ArrayBufferView properties: verify bufferproperty return value type is ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new DataView(new ArrayBuffer(4))
      expect(view.buffer instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2100
     * @tc.desc Verify ArrayBufferView properties: verify bufferproperty returns not null ArrayBufferinstance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Int8Array(4)
      expect(view.buffer).not.toBeNull()
      expect(view.buffer).not.toBeUndefined()
    });

    /**
     * @tc.name testArrayBufferViewProperty0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2200
     * @tc.desc Verify ArrayBufferView properties: bufferproperty byteLength and ArrayBuffer byteLengthconsistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view: ArrayBufferView = new DataView(ab, 8, 16)
      expect(view.buffer.byteLength).assertEqual(32)
    });

    /**
     * @tc.name testArrayBufferViewProperty0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2300
     * @tc.desc Verify ArrayBufferView properties: length is 0 ArrayBuffer bufferproperty returns valid reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(0)
      let view: ArrayBufferView = new DataView(ab)
      expect(view.buffer.byteLength).assertEqual(0)
      expect(view.buffer === ab).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2400
     * @tc.desc Verify ArrayBufferView properties: ArrayBuffer bufferproperty returns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(1024)
      let view: ArrayBufferView = new Int8Array(ab)
      expect(view.buffer.byteLength).assertEqual(1024)
      expect(view.buffer === ab).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2500
     * @tc.desc Verify ArrayBufferView properties: byteLength view byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 0, 16)
      expect(view.byteLength).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferViewProperty0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2600
     * @tc.desc Verify ArrayBufferView properties: offset length create view ，byteLength view
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view: ArrayBufferView = new DataView(ab, 8, 16)
      expect(view.byteLength).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferViewProperty0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2700
     * @tc.desc Verify ArrayBufferView properties: verify byteLength return value is inttype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new DataView(new ArrayBuffer(8))
      let byteLen: int = view.byteLength
      expect(byteLen).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferViewProperty0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2800
     * @tc.desc Verify ArrayBufferView properties: byteLength is not
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new DataView(new ArrayBuffer(4))
      expect(view.byteLength >= 0).assertTrue()
      expect(Number.isInteger(view.byteLength)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2900
     * @tc.desc Verify ArrayBufferView properties: length is 0 view byteLength is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view: ArrayBufferView = new DataView(ab, 0, 0)
      expect(view.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferViewProperty0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3000
     * @tc.desc Verify ArrayBufferView properties: from empty ArrayBuffercreate DataView byteLength is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(0)
      let view: ArrayBufferView = new DataView(ab)
      expect(view.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferViewProperty0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3100
     * @tc.desc Verify ArrayBufferView properties: length is 0 TypedArray byteLength is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Int8Array(0)
      expect(view.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferViewProperty0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3200
     * @tc.desc Verify ArrayBufferView properties: offset view byteLengthequals buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(64)
      let view: ArrayBufferView = new DataView(ab)
      expect(view.byteLength).assertEqual(view.buffer.byteLength)
    });

    /**
     * @tc.name testArrayBufferViewProperty0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3300
     * @tc.desc Verify ArrayBufferView properties: view byteOffset byteLength buffer byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view: ArrayBufferView = new DataView(ab, 8, 16)
      expect(view.byteOffset + view.byteLength <= view.buffer.byteLength).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3400
     * @tc.desc Verify ArrayBufferView properties: buffer view byteLength returns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(4096)
      let view: ArrayBufferView = new Int8Array(ab)
      expect(view.byteLength).assertEqual(4096)
    });

    /**
     * @tc.name testArrayBufferViewProperty0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3500
     * @tc.desc Verify ArrayBufferView properties: byteOffset view buffer offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 4, 8)
      expect(view.byteOffset).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferViewProperty0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3600
     * @tc.desc Verify ArrayBufferView properties: TypedArray offset constructor byteOffset returns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new Uint8Array(ab, 4, 8)
      expect(view.byteOffset).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferViewProperty0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3700
     * @tc.desc Verify ArrayBufferView properties: verify byteOffset return value is inttype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 8, 8)
      let offset: int = view.byteOffset
      expect(offset).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferViewProperty0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3800
     * @tc.desc Verify ArrayBufferView properties: byteOffset is not
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 0)
      expect(view.byteOffset >= 0).assertTrue()
      expect(Number.isInteger(view.byteOffset)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3900
     * @tc.desc Verify ArrayBufferView properties: offset byteOffset is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new DataView(new ArrayBuffer(8))
      expect(view.byteOffset).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferViewProperty0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4000
     * @tc.desc Verify ArrayBufferView properties: offset buffer byteOffset returns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 16, 0)
      expect(view.byteOffset).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferViewProperty0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4100
     * @tc.desc Verify ArrayBufferView properties: Int32Array at 4byte offset returns byteOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view: ArrayBufferView = new Int32Array(ab, 12, 2)
      expect(view.byteOffset).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferViewProperty0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4200
     * @tc.desc Verify ArrayBufferView properties: Float64Array at 8byte offset returns byteOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(64)
      let view: ArrayBufferView = new Float64Array(ab, 16, 3)
      expect(view.byteOffset).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferViewProperty0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4300
     * @tc.desc Verify ArrayBufferView properties: offset view byteOffset+byteLengthequals buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab)
      expect(view.byteOffset + view.byteLength).assertEqual(view.buffer.byteLength)
    });

    /**
     * @tc.name testArrayBufferViewProperty0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4400
     * @tc.desc Verify ArrayBufferView properties: view byteOffset+byteLengthless than buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view: ArrayBufferView = new DataView(ab, 4, 8)
      expect(view.byteOffset + view.byteLength).assertEqual(12)
      expect(view.buffer.byteLength).assertEqual(32)
    });

    /**
     * @tc.name testArrayBufferViewProperty0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4500
     * @tc.desc Verify ArrayBufferView properties: ArrayBuffer offset view independent byteOffset byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view1: ArrayBufferView = new DataView(ab, 0, 8)
      let view2: ArrayBufferView = new DataView(ab, 8, 16)
      expect(view1.buffer === view2.buffer).assertTrue()
      expect(view1.byteOffset).assertEqual(0)
      expect(view2.byteOffset).assertEqual(8)
      expect(view1.byteLength).assertEqual(8)
      expect(view2.byteLength).assertEqual(16)
    });

    /**
     * @tc.name testArrayBufferViewProperty0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4600
     * @tc.desc Verify ArrayBufferView properties: buffer property ， at ArkTS-sta assignment at error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let view: ArrayBufferView = new DataView(new ArrayBuffer(8))
      // view.buffer = new ArrayBuffer(16) // 编译错误：buffer是只读属性
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4700
     * @tc.desc Verify ArrayBufferView properties: bufferproperty at view reference ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view: ArrayBufferView = new DataView(ab)
      let bufferBefore = view.buffer
      expect(view.buffer === bufferBefore).assertTrue()
      expect(view.buffer === ab).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4800
     * @tc.desc Verify ArrayBufferView properties: byteLength property ，assignment at error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let view: ArrayBufferView = new DataView(new ArrayBuffer(8))
      // view.byteLength = 16 // 编译错误：byteLength是只读属性
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4900
     * @tc.desc Verify ArrayBufferView properties: byteLength at view
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new DataView(new ArrayBuffer(8))
      let len1 = view.byteLength
      let len2 = view.byteLength
      expect(len1).assertEqual(len2)
      expect(len1).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferViewProperty0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5000
     * @tc.desc Verify ArrayBufferView properties: byteOffset property ，assignment at error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let view: ArrayBufferView = new DataView(new ArrayBuffer(8))
      // view.byteOffset = 4 // 编译错误：byteOffset是只读属性
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5100
     * @tc.desc Verify ArrayBufferView properties: byteOffset at view
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 4, 8)
      let offset1 = view.byteOffset
      let offset2 = view.byteOffset
      expect(offset1).assertEqual(offset2)
      expect(offset1).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferViewProperty0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5200
     * @tc.desc Verify ArrayBufferView properties: DataViewinstance ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new DataView(new ArrayBuffer(4))
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5300
     * @tc.desc Verify ArrayBufferView properties: TypedArrayinstance ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Int8Array(4)
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5400
     * @tc.desc Verify ArrayBufferView properties: Uint32Arrayinstance ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Uint32Array(4)
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5500
     * @tc.desc Verify ArrayBufferView properties: Float64Arrayinstance ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new Float64Array(4)
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferViewProperty0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5600
     * @tc.desc Verify ArrayBufferView properties: constructor view byteOffsetout of range buffer.byteLength throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      try {
        let view: ArrayBufferView = new DataView(ab, 16)
        expect(true).assertFail()
      } catch (error) {
        expect(error != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5700
     * @tc.desc Verify ArrayBufferView properties: byteOffset + byteLength buffer.byteLength throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      try {
        let view: ArrayBufferView = new DataView(ab, 4, 8)
        expect(true).assertFail()
      } catch (error) {
        expect(error != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5800
     * @tc.desc Verify ArrayBufferView properties: Int16Array byteOffset 2 ， throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      try {
        let view: ArrayBufferView = new Int16Array(ab, 3, 4)
        expect(true).assertFail()
      } catch (error) {
        expect(error != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_5900
     * @tc.desc Verify ArrayBufferView properties: Int32Array byteOffset 4 ， throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      try {
        let view: ArrayBufferView = new Int32Array(ab, 3)
        expect(true).assertFail()
      } catch (error) {
        expect(error != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_6000
     * @tc.desc Verify ArrayBufferView properties: Float64Array byteOffset 8 ， throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      try {
        let view: ArrayBufferView = new Float64Array(ab, 4)
        expect(true).assertFail()
      } catch (error) {
        expect(error != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_6100
     * @tc.desc Verify ArrayBufferView properties: byteOffset throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      try {
        let view: ArrayBufferView = new DataView(ab, -1)
        expect(true).assertFail()
      } catch (error) {
        expect(error != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_6200
     * @tc.desc Verify ArrayBufferView properties: byteLength throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      try {
        let view: ArrayBufferView = new DataView(ab, 0, -1)
        expect(true).assertFail()
      } catch (error) {
        expect(error != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_6300
     * @tc.desc Verify ArrayBufferView properties: ArrayBuffer transfer after ， view bufferproperty reference ArrayBuffer detached，byteLength is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab)
      let newAb = ab.transfer()
      expect(ab.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferViewProperty0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_6400
     * @tc.desc Verify ArrayBufferView properties: ArrayBuffer transfer after access view byteLength property throws exception or returns exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new Int8Array(ab)
      let newAb = ab.transfer()
      try {
        let len = view.byteLength
        expect(len).assertEqual(0)
      } catch (error) {
        expect(error != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferViewProperty0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_6500
     * @tc.desc Verify ArrayBufferView properties: verify transfer after ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view: ArrayBufferView = new Int8Array(ab)
      expect(view.buffer.byteLength).assertEqual(8)
      let transferred = ab.transfer()
      expect(ab.byteLength).assertEqual(0)
      expect(transferred.byteLength).assertEqual(8)
    });
    return;
  });
}
