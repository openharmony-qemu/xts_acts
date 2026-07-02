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

function arrayBufferLikeReadByteLength(buf: ArrayBufferLike): number {
  return buf.byteLength;
}

function arrayBufferLikeCreateBuffer(size: number): ArrayBufferLike {
  return new ArrayBuffer(size);
}

export default function arrayBufferLikeTest(): void {
  describe('ArrayBufferLikeTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferLike0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0100
     * @tc.desc Verify ArrayBufferLike byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0200
     * @tc.desc Verify ArrayBufferLike byteLength equals 0 for zero-length buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferLike0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0300
     * @tc.desc Verify ArrayBufferLike is assignable to ArrayBuffer with byteLength 16 and instanceof ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const likeBuffer: ArrayBufferLike = new ArrayBuffer(8);
      const abBuffer: ArrayBuffer = likeBuffer;
      expect(abBuffer.byteLength).assertEqual(8);
      const created = arrayBufferLikeCreateBuffer(16);
      expect(arrayBufferLikeReadByteLength(created)).assertEqual(16);
      expect(created instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0400
     * @tc.desc Verify assigning byteLength on ArrayBufferLike throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      try {
        (buffer as Record<string, Object>)['byteLength'] = Utils.boxAsObject(16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
