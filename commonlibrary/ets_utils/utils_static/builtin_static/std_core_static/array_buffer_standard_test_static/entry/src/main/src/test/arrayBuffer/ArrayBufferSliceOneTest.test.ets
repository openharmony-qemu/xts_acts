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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferSliceOneTest(): void {
  // Static XTS: detached buffer cannot be constructed; slice on detached buffer (TypeError) is not covered.
  describe('ArrayBufferSliceOneTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferSliceOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0100
     * @tc.desc Verify slice(1,3) copies 2 bytes from middle with matching values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const copied = buffer.slice(1, 3);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(20));
      expect(copied.at(1)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferSliceOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0200
     * @tc.desc Verify slice(2) int overload copies from index 2 to buffer end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const copied = buffer.slice(2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(30));
      expect(copied.at(1)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSliceOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0300
     * @tc.desc Verify slice(0,byteLength) copies entire buffer with matching bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const copied = buffer.slice(0, buffer.byteLength);
      expect(copied.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(copied.at(i)).assertEqual(buffer.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0400
     * @tc.desc Verify slice(2,2) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const copied = buffer.slice(2, 2);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0500
     * @tc.desc Verify slice on zero-length buffer yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const copied = buffer.slice(0, 0);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0600
     * @tc.desc Verify mutating slice copy does not change source byte at index 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      const copied = buffer.slice(0, 2);
      copied.set(0, Int.toByte(99));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferSliceOne0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0700
     * @tc.desc Verify slice(byteLength-1,byteLength) copies last single byte 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(3, Int.toByte(88));
      const copied = buffer.slice(3, 4);
      expect(copied.byteLength).assertEqual(1);
      expect(copied.at(0)).assertEqual(Int.toByte(88));
    });

    /**
     * @tc.name testArrayBufferSliceOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0800
     * @tc.desc Verify slice(0) int overload copies entire buffer with matching bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const copied = buffer.slice(0);
      expect(copied.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(copied.at(i)).assertEqual(buffer.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0900
     * @tc.desc Verify int overload slice(6,8) copies last 2 bytes; number overload NaN/fraction in SliceTwo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 1));
      }
      const copied = buffer.slice(6, 8);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(7));
      expect(copied.at(1)).assertEqual(Int.toByte(8));
    });
  });
}
