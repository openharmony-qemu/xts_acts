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

export default function arrayBufferSliceTwoTest(): void {
  // Static XTS: detached buffer cannot be constructed; slice on detached buffer (TypeError) is not covered.
  describe('ArrayBufferSliceTwoTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0100
     * @tc.desc Verify slice(2,6) copies 4 bytes from middle with matching values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 1));
      }
      const result = buffer.slice(2, 6);
      expect(result.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(buffer.at(i + 2));
      }
    });

    /**
     * @tc.name testArrayBufferSliceTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0200
     * @tc.desc Verify slice(2) number overload copies from index 2 to buffer end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 1));
      }
      const result = buffer.slice(2);
      expect(result.byteLength).assertEqual(6);
      for (let i: int = 0; i < 6; i++) {
        expect(result.at(i)).assertEqual(buffer.at(i + 2));
      }
    });

    /**
     * @tc.name testArrayBufferSliceTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0300
     * @tc.desc Verify slice(0) copies entire buffer with matching bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const result = buffer.slice(0);
      expect(result.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(buffer.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferSliceTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0400
     * @tc.desc Verify slice(2,2) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result = buffer.slice(2, 2);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0500
     * @tc.desc Verify slice on zero-length buffer yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const result = buffer.slice(0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0600
     * @tc.desc Verify slice(1.5,8) truncates begin to 1 and copies 7 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 10));
      }
      const result = buffer.slice(1.5, 8);
      expect(result.byteLength).assertEqual(7);
      expect(result.at(0)).assertEqual(buffer.at(1));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0700
     * @tc.desc Verify slice(NaN,2) coerces begin to 0 and copies 2 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(11));
      buffer.set(1, Int.toByte(22));
      const result = buffer.slice(Double.NaN, 2);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(11));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0800
     * @tc.desc Verify mutating slice copy does not change source byte at index 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      const result = buffer.slice(0, 2);
      result.set(0, Int.toByte(99));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
    });
  });
}
