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

export default function arrayBufferResizableField2Test(): void {
  describe('ArrayBufferResizableField2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferResizableField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0100
     * @tc.desc Verify resizable returns true when maxByteLength equals byteLength (minimum resizable)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 8);
      expect(buf.resizable).assertTrue();
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferResizableField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0200
     * @tc.desc Verify resizable returns true when maxByteLength far exceeds byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 1024);
      expect(buf.resizable).assertTrue();
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferResizableField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0300
     * @tc.desc Verify resizable returns false for zero-length buffer without maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      expect(buf.resizable).assertFalse();
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferResizableField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0400
     * @tc.desc Verify resizable remains false for non-resizable buffer after failed resize attempt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      expect(buf.resizable).assertFalse();
      try {
        buf.resize(16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(buf.resizable).assertFalse();
      }
    });

    /**
     * @tc.name testArrayBufferResizableField0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0500
     * @tc.desc Verify resizable with number type parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4.0, 16.0);
      expect(buf.resizable).assertTrue();
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResizableField0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0600
     * @tc.desc Verify resizable with hexadecimal parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0x10, 0x20);
      expect(buf.resizable).assertTrue();
      expect(buf.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferResizableField0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0700
     * @tc.desc Verify resizable with octal parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0o10, 0o20);
      expect(buf.resizable).assertTrue();
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferResizableField0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0800
     * @tc.desc Verify resizable with binary parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0b10, 0b100);
      expect(buf.resizable).assertTrue();
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferResizableField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_0900
     * @tc.desc Verify resizable with large buffer (business threshold)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1000000, 2000000);
      expect(buf.resizable).assertTrue();
      expect(buf.byteLength).assertEqual(1000000);
    });

    /**
     * @tc.name testArrayBufferResizableField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1000
     * @tc.desc Verify resizable returns true for new ArrayBuffer(8, 16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 16);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1100
     * @tc.desc Verify resizable is true when maxByteLength > length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1200
     * @tc.desc Verify resizable is true when maxByteLength == length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4, 4);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1300
     * @tc.desc Verify resizable for number overload with maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3.0, 6.0);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1400
     * @tc.desc Verify resizable is true for empty buffer with maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0, 10);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1500
     * @tc.desc Verify resizable stays true after resize operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 9);
      buf.resize(5);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferResizableField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1600
     * @tc.desc Verify resizable is false when no maxByteLength is provided
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      expect(buf.byteLength).assertEqual(8);
      expect(buf.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferResizableField0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_RESIZABLE_1700
     * @tc.desc Verify resizable is true when maxByteLength is provided
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResizableField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32, 128);
      expect(buf.byteLength).assertEqual(32);
      expect(buf.resizable).assertTrue();
    });
  });
}