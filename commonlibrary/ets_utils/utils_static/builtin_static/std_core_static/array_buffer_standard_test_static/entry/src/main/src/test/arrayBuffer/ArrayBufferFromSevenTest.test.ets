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

export default function arrayBufferFromSevenTest(): void {
  describe('ArrayBufferFromSevenTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromSeven0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0100
     * @tc.desc Normal: from(source) copies entire buffer
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
     * @tc.desc Normal: from(source, 2, 4) copies 4 bytes from offset 2
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
     * @tc.desc Normal: 2-arg omit length copies tail from offset 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        source.set(i, Int.toByte(i + 1));
      }
      const result = Utils.fromArrayBufferWithOffset(source, 3);
      expect(result.byteLength).assertEqual(source.byteLength - 3);
      for (let i: int = 0; i < result.byteLength; i++) {
        expect(result.at(i)).assertEqual(source.at(i + 3));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0400
     * @tc.desc Boundary: empty source yields empty copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0500
     * @tc.desc Boundary: length 0 at offset 0 yields empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0600
     * @tc.desc Boundary: NaN offset coerces to 0 (STA NaN→0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(11));
      source.set(1, Int.toByte(22));
      source.set(2, Int.toByte(33));
      source.set(3, Int.toByte(44));
      const result = ArrayBuffer.from(source, Double.NaN, 4);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(11));
    });

    /**
     * @tc.name testArrayBufferFromSeven0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0700
     * @tc.desc Boundary: fractional offset 1.5 truncates to 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));
      const result = ArrayBuffer.from(source, 1.5, 3);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(0)).assertEqual(source.at(1));
    });

    /**
     * @tc.name testArrayBufferFromSeven0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0800
     * @tc.desc Boundary: NaN length coerces to 0 (STA NaN→0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      const result = ArrayBuffer.from(source, 0, Double.NaN);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0900
     * @tc.desc Boundary: modifying copy does not affect source bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      const result = ArrayBuffer.from(source, 0, 2);
      result.set(0, Int.toByte(99));
      expect(source.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferFromSeven0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1000
     * @tc.desc Error: from(source, 2, 10) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, 2, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1100
     * @tc.desc Error: from(source, -1, 1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
