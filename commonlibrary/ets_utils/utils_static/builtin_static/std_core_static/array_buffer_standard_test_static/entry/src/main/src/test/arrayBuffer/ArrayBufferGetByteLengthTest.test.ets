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

export default function arrayBufferGetByteLengthTest(): void {
  describe('ArrayBufferGetByteLengthTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0100
     * @tc.desc Verify getByteLength() on ArrayBuffer(8) returns 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.getByteLength()).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0200
     * @tc.desc Verify getByteLength() on ArrayBuffer(0) returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.getByteLength()).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0300
     * @tc.desc Verify getByteLength() equals byteLength property on ArrayBuffer(8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0400
     * @tc.desc Verify getByteLength() returns 4 for new ArrayBuffer(4,16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      expect(buffer.getByteLength()).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0500
     * @tc.desc Verify getByteLength() returns 6 and equals byteLength after resize(6)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      expect(buffer.getByteLength()).assertEqual(6);
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });
  });
}
