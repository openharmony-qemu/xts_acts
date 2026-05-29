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

export default function arrayBufferByteLengthFieldTest(): void {
  describe('ArrayBufferByteLengthFieldTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0100
     * @tc.desc Verify byteLength equals 8 for new ArrayBuffer(8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0200
     * @tc.desc Verify byteLength equals 0 for new ArrayBuffer(0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0300
     * @tc.desc Verify byteLength equals 4 for new ArrayBuffer(4,16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0400
     * @tc.desc Verify assigning buffer.byteLength throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      try {
        (buffer as Record<string, Object>)['byteLength'] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
