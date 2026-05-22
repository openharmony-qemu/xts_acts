'use static'
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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferViewPropertyTest(): void {
  describe('ArrayBufferViewPropertyTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

/**
     * @tc.name testArrayBufferViewProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0100
     * @tc.desc Verify view.buffer equals ab
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view = new DataView(ab)
      expect(view.buffer).assertEqual(ab)
    });
/**
     * @tc.name testArrayBufferViewProperty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0200
     * @tc.desc Verify view.buffer equals ab
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view = new Int8Array(ab)
      expect(view.buffer).assertEqual(ab)
    });
/**
     * @tc.name testArrayBufferViewProperty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0300
     * @tc.desc Verify view.buffer equals ab
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new Uint8Array(ab)
      expect(view.buffer).assertEqual(ab)
    });
/**
     * @tc.name testArrayBufferViewProperty0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0400
     * @tc.desc Verify view.buffer equals ab
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new Int32Array(ab)
      expect(view.buffer).assertEqual(ab)
    });
/**
     * @tc.name testArrayBufferViewProperty0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0500
     * @tc.desc Verify view.buffer equals ab
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view = new Float64Array(ab)
      expect(view.buffer).assertEqual(ab)
    });
/**
     * @tc.name testArrayBufferViewProperty0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0600
     * @tc.desc Verify view.buffer equals ab
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab, 4, 8)
      expect(view.buffer).assertEqual(ab)
    });
/**
     * @tc.name testArrayBufferViewProperty0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0700
     * @tc.desc Verify view.buffer equals ab
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new Int8Array(ab, 4, 8)
      expect(view.buffer).assertEqual(ab)
    });
/**
     * @tc.name testArrayBufferViewProperty0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0800
     * @tc.desc Verify view.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab, 4, 8)
      expect(view.byteLength).assertEqual(8)
    });
/**
     * @tc.name testArrayBufferViewProperty0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0900
     * @tc.desc Verify view.byteLength equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab, 4)
      expect(view.byteLength).assertEqual(12)
    });
/**
     * @tc.name testArrayBufferViewProperty0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1000
     * @tc.desc Verify view.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Int32Array(4)
      expect(view.byteLength).assertEqual(16)
    });
/**
     * @tc.name testArrayBufferViewProperty0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1100
     * @tc.desc Verify view.byteLength equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Int8Array(10)
      expect(view.byteLength).assertEqual(10)
    });
/**
     * @tc.name testArrayBufferViewProperty0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1200
     * @tc.desc Verify view.byteLength equals 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Float64Array(3)
      expect(view.byteLength).assertEqual(24)
    });
/**
     * @tc.name testArrayBufferViewProperty0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1300
     * @tc.desc Verify view.byteOffset equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab, 4, 8)
      expect(view.byteOffset).assertEqual(4)
    });
/**
     * @tc.name testArrayBufferViewProperty0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1400
     * @tc.desc Verify view.byteOffset equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view = new DataView(ab)
      expect(view.byteOffset).assertEqual(0)
    });
/**
     * @tc.name testArrayBufferViewProperty0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1500
     * @tc.desc Verify view.byteOffset equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new Int8Array(ab, 4, 8)
      expect(view.byteOffset).assertEqual(4)
    });
/**
     * @tc.name testArrayBufferViewProperty0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1600
     * @tc.desc Verify view.byteOffset equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Int8Array(8)
      expect(view.byteOffset).assertEqual(0)
    });
/**
     * @tc.name testArrayBufferViewProperty0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1700
     * @tc.desc Verify view.byteOffset equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new Int32Array(ab, 8)
      expect(view.byteOffset).assertEqual(8)
    });
/**
     * @tc.name testArrayBufferViewProperty0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1800
     * @tc.desc Verify views share the same underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view = new DataView(ab)
      expect(view.buffer === ab).assertTrue()
    });
/**
     * @tc.name testArrayBufferViewProperty0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_1900
     * @tc.desc Verify views share the same underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view1 = new Int8Array(ab)
      let view2 = new DataView(ab)
      expect(view1.buffer === view2.buffer).assertTrue()
    });
/**
     * @tc.name testArrayBufferViewProperty0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2000
     * @tc.desc Verify view.buffer.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Int8Array(4)
      expect(view.buffer.byteLength).assertEqual(4)
    });
/**
     * @tc.name testArrayBufferViewProperty0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2100
     * @tc.desc Verify view.buffer.byteLength equals 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view = new DataView(ab, 8, 16)
      expect(view.buffer.byteLength).assertEqual(32)
    });
/**
     * @tc.name testArrayBufferViewProperty0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2200
     * @tc.desc Verify views share the same underlying ArrayBuffer and view.buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(0)
      let view = new DataView(ab)
      expect(view.buffer.byteLength).assertEqual(0)
      expect(view.buffer === ab).assertTrue()
    });
/**
     * @tc.name testArrayBufferViewProperty0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2300
     * @tc.desc Verify views share the same underlying ArrayBuffer and view.buffer.byteLength equals 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(1024)
      let view = new Int8Array(ab)
      expect(view.buffer.byteLength).assertEqual(1024)
      expect(view.buffer === ab).assertTrue()
    });
/**
     * @tc.name testArrayBufferViewProperty0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2400
     * @tc.desc Verify view.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab, 0, 16)
      expect(view.byteLength).assertEqual(16)
    });
/**
     * @tc.name testArrayBufferViewProperty0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2500
     * @tc.desc Verify view.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view = new DataView(ab, 8, 16)
      expect(view.byteLength).assertEqual(16)
    });
/**
     * @tc.name testArrayBufferViewProperty0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2600
     * @tc.desc Verify byteLen equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new DataView(new ArrayBuffer(8))
      let byteLen: int = view.byteLength
      expect(byteLen).assertEqual(8)
    });
/**
     * @tc.name testArrayBufferViewProperty0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2700
     * @tc.desc Verify view.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view = new DataView(ab, 0, 0)
      expect(view.byteLength).assertEqual(0)
    });
/**
     * @tc.name testArrayBufferViewProperty0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2800
     * @tc.desc Verify view.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(0)
      let view = new DataView(ab)
      expect(view.byteLength).assertEqual(0)
    });
/**
     * @tc.name testArrayBufferViewProperty0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_2900
     * @tc.desc Verify view.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Int8Array(0)
      expect(view.byteLength).assertEqual(0)
    });
/**
     * @tc.name testArrayBufferViewProperty0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3000
     * @tc.desc Verify view.byteLength equals view.buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(64)
      let view = new DataView(ab)
      expect(view.byteLength).assertEqual(view.buffer.byteLength)
    });
/**
     * @tc.name testArrayBufferViewProperty0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3100
     * @tc.desc Verify view range stays within buffer byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view = new DataView(ab, 8, 16)
      expect(view.byteOffset + view.byteLength <= view.buffer.byteLength).assertTrue()
    });
/**
     * @tc.name testArrayBufferViewProperty0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3200
     * @tc.desc Verify view.byteLength equals 4096
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(4096)
      let view = new Int8Array(ab)
      expect(view.byteLength).assertEqual(4096)
    });
/**
     * @tc.name testArrayBufferViewProperty0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3300
     * @tc.desc Verify view.byteOffset equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new Uint8Array(ab, 4, 8)
      expect(view.byteOffset).assertEqual(4)
    });
/**
     * @tc.name testArrayBufferViewProperty0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3400
     * @tc.desc Verify offset equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab, 8, 8)
      let offset: int = view.byteOffset
      expect(offset).assertEqual(8)
    });
/**
     * @tc.name testArrayBufferViewProperty0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3500
     * @tc.desc Verify byteOffset is non-negative and value is integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab, 0)
      expect(view.byteOffset >= 0).assertTrue()
      expect(Number.isInteger(view.byteOffset)).assertTrue()
    });
/**
     * @tc.name testArrayBufferViewProperty0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3600
     * @tc.desc Verify view.byteOffset equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab, 16, 0)
      expect(view.byteOffset).assertEqual(16)
    });
/**
     * @tc.name testArrayBufferViewProperty0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3700
     * @tc.desc Verify view.byteOffset equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view = new Int32Array(ab, 12, 2)
      expect(view.byteOffset).assertEqual(12)
    });
/**
     * @tc.name testArrayBufferViewProperty0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3800
     * @tc.desc Verify view.byteOffset equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(64)
      let view = new Float64Array(ab, 16, 3)
      expect(view.byteOffset).assertEqual(16)
    });
/**
     * @tc.name testArrayBufferViewProperty0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_3900
     * @tc.desc Verify view.byteOffset + view.byteLength equals view.buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view = new DataView(ab)
      expect(view.byteOffset + view.byteLength).assertEqual(view.buffer.byteLength)
    });
/**
     * @tc.name testArrayBufferViewProperty0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4000
     * @tc.desc Verify view.byteOffset + view.byteLength equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view = new DataView(ab, 4, 8)
      expect(view.byteOffset + view.byteLength).assertEqual(12)
      expect(view.buffer.byteLength).assertEqual(32)
    });
/**
     * @tc.name testArrayBufferViewProperty0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4100
     * @tc.desc Verify view1.byteOffset equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(32)
      let view1 = new DataView(ab, 0, 8)
      let view2 = new DataView(ab, 8, 16)
      expect(view1.buffer === view2.buffer).assertTrue()
      expect(view1.byteOffset).assertEqual(0)
      expect(view2.byteOffset).assertEqual(8)
      expect(view1.byteLength).assertEqual(8)
      expect(view2.byteLength).assertEqual(16)
    });
/**
     * @tc.name testArrayBufferViewProperty0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4200
     * @tc.desc Verify views share the same underlying ArrayBuffer and views share the same underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(8)
      let view: ArrayBufferView = new DataView(ab)
      let bufferBefore = view.buffer
      expect(view.buffer === bufferBefore).assertTrue()
      expect(view.buffer === ab).assertTrue()
    });

/**
     * @tc.name testArrayBufferViewProperty0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4300
     * @tc.desc Verify len1 equals len2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view: ArrayBufferView = new DataView(new ArrayBuffer(8))
      let len1 = view.byteLength
      let len2 = view.byteLength
      expect(len1).assertEqual(len2)
      expect(len1).assertEqual(8)
    });

/**
     * @tc.name testArrayBufferViewProperty0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4400
     * @tc.desc Verify offset1 equals offset2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(16)
      let view: ArrayBufferView = new DataView(ab, 4, 8)
      let offset1 = view.byteOffset
      let offset2 = view.byteOffset
      expect(offset1).assertEqual(offset2)
      expect(offset1).assertEqual(4)
    });

/**
     * @tc.name testArrayBufferViewProperty0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4500
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new DataView(new ArrayBuffer(4))
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

/**
     * @tc.name testArrayBufferViewProperty0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4600
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Int8Array(4)
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

/**
     * @tc.name testArrayBufferViewProperty0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4700
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Uint32Array(4)
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

/**
     * @tc.name testArrayBufferViewProperty0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4800
     * @tc.desc Verify ArrayBuffer.isView returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let view = new Float64Array(4)
      expect(ArrayBuffer.isView(view as Object)).assertTrue()
    });

/**
     * @tc.name testArrayBufferViewProperty0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_4900
     * @tc.desc Verify API call throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ab = new ArrayBuffer(8)
        let view: ArrayBufferView = new DataView(ab, 16)
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
