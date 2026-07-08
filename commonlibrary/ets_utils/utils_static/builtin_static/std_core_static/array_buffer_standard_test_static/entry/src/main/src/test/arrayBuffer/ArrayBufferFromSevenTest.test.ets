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

export default function arrayBufferFromSevenTest(): void {
  describe('ArrayBufferFromSevenTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromSeven0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0100
     * @tc.desc Verify from(source) copies entire buffer with matching byteLength and bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(1));
      source.set(1, Int.toByte(2));
      source.set(2, Int.toByte(3));
      source.set(3, Int.toByte(4));
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(source.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0200
     * @tc.desc Verify from(source,2,4) copies 4 bytes from offset 2 with matching values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        source.set(i, Int.toByte(i + 1));
      }
      const result = ArrayBuffer.from(source, 2, 4);
      expect(result.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(source.at(i + 2));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0300
     * @tc.desc Verify from(empty source) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0400
     * @tc.desc Verify from(source,0,0) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0500
     * @tc.desc Verify from(source,NaN,4) coerces offset to 0 and copies first 4 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(11));
      source.set(1, Int.toByte(22));
      source.set(2, Int.toByte(33));
      source.set(3, Int.toByte(44));
      const result = ArrayBuffer.from(source, Double.NaN, 4);
      expect(result.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(source.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0600
     * @tc.desc Verify from(source,1.5,3) truncates offset to 1 and copies 3 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));
      const result = ArrayBuffer.from(source, 1.5, 3);
      expect(result.byteLength).assertEqual(3);
      for (let i: int = 0; i < 3; i++) {
        expect(result.at(i)).assertEqual(source.at(i + 1));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0700
     * @tc.desc Verify from(source,0,NaN) coerces length to 0 and yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      const result = ArrayBuffer.from(source, 0, Double.NaN);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0800
     * @tc.desc Verify modifying from() copy does not change source byte at index 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      const result = ArrayBuffer.from(source, 0, 2);
      result.set(0, Int.toByte(99));
      expect(source.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferFromSeven0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0900
     * @tc.desc Verify from(source,2,10) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, 2, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1000
     * @tc.desc Verify from(source,-1,1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}
