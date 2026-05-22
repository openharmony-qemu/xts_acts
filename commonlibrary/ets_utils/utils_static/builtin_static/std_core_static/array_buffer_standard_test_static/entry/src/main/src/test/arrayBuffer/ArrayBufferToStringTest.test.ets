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

export default function arrayBufferToStringTest(): void {
  describe('ArrayBufferToStringTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });




    /**
     * @tc.name testArrayBufferToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0010
     * @tc.desc Verify toString tag is independent of byteLength (0, 1, 8, 1024, 65536)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected = "[object ArrayBuffer]";
      expect(new ArrayBuffer(8).toString()).assertEqual(expected);
      expect(new ArrayBuffer(0).toString()).assertEqual(expected);
      expect(new ArrayBuffer(1).toString()).assertEqual(expected);
      expect(new ArrayBuffer(1024).toString()).assertEqual(expected);
      expect(new ArrayBuffer(65536).toString()).assertEqual(expected);
    });

    /**
     * @tc.name testArrayBufferToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0020
     * @tc.desc Verify result.length equals "[object ArrayBuffer]".length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result.length).assertEqual("[object ArrayBuffer]".length);
    });

    /**
     * @tc.name testArrayBufferToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0030
     * @tc.desc Verify result === "[object ArrayBuffer]" is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result === "[object ArrayBuffer]").assertTrue();
    });

    /**
     * @tc.name testArrayBufferToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0040
     * @tc.desc Verify result equals "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0050
     * @tc.desc Verify result equals "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(4);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0060
     * @tc.desc Verify result equals "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0070
     * @tc.desc Verify result equals "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 8);
      let result = sliced.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0080
     * @tc.desc Verify result equals "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new Uint8Array(buffer);
      view[0] = 72;
      view[1] = 101;
      view[2] = 108;
      view[3] = 108;
      view[4] = 111;
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

  });
}
