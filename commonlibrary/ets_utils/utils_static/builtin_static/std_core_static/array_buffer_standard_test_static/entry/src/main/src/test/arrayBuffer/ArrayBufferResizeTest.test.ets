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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function arrayBufferResizeTest(): void {
  // Static XTS: detached buffer cannot be constructed; resize on detached buffer (TypeError) is not covered.
  describe('ArrayBufferResizeTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferResize0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0100
     * @tc.desc Verify resize grows resizable buffer to new length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0200
     * @tc.desc Verify resize(0) sets byteLength to zero boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferResize0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0300
     * @tc.desc Verify resize(maxByteLength) sets byteLength to max boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.resize(6);
      expect(buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferResize0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0400
     * @tc.desc Verify resize(newLen > maxByteLength) throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0500
     * @tc.desc Verify resize on non-resizable buffer throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.resize(6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0600
     * @tc.desc Verify resize(-1) throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      try {
        buffer.resize(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0700
     * @tc.desc Verify resize shrink preserves bytes in retained range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6, 8);
      buffer.set(0, Int.toByte(11));
      buffer.set(1, Int.toByte(22));
      buffer.set(2, Int.toByte(33));
      buffer.set(3, Int.toByte(44));
      buffer.set(4, Int.toByte(55));
      buffer.set(5, Int.toByte(66));
      buffer.resize(3);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.at(0)).assertEqual(Int.toByte(11));
      expect(buffer.at(1)).assertEqual(Int.toByte(22));
      expect(buffer.at(2)).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferResize0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0800
     * @tc.desc Verify bytes in grown range are writable via set after resize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 6);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.resize(4);
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(3)).assertEqual(Int.toByte(40));
    });
  });
}
