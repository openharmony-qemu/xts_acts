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

export default function arrayBufferFromSixTest(): void {
  describe('ArrayBufferFromSixTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromSix0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0100
     * @tc.desc Verify from(source,1,2) copies 2 bytes from offset 1 with matching values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      for (let i: int = 0; i < 6; i++) {
        source.set(i, Int.toByte(i + 1));
      }
      const result = ArrayBuffer.from(source, 1, 2);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(source.at(1));
      expect(result.at(1)).assertEqual(source.at(2));
    });

    /**
     * @tc.name testArrayBufferFromSix0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0200
     * @tc.desc Verify from(source,0,byteLength) copies entire buffer with matching bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      expect(result.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(source.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0300
     * @tc.desc Verify from(empty source,0,0) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0400
     * @tc.desc Verify from(source,byteLength,0) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(1));
      const result = ArrayBuffer.from(source, source.byteLength, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0500
     * @tc.desc Verify from(source,byteLength-1,1) copies last single byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(3, Int.toByte(99));
      const result = ArrayBuffer.from(source, source.byteLength - 1, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferFromSix0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0600
     * @tc.desc Verify from(source,0,byteLength) returns distinct copy where result !== source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(1));
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      expect(result.byteLength).assertEqual(source.byteLength);
      expect(result !== source).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSix0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0700
     * @tc.desc Verify from(source,offset,len) copies tail when offset+length equals byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      for (let i: int = 0; i < 6; i++) {
        source.set(i, Int.toByte(i + 10));
      }
      const result = ArrayBuffer.from(source, 2, source.byteLength - 2);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(source.at(2));
      expect(result.at(3)).assertEqual(source.at(5));
    });

    /**
     * @tc.name testArrayBufferFromSix0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0800
     * @tc.desc Verify from(source,-1,1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0900
     * @tc.desc Verify from(source,2,10) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, 2, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}
