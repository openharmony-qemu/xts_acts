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

export default function arrayBufferStringifyTest(): void {
  describe('ArrayBufferStringifyTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferStringify0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0100
     * @tc.desc Verify stringify(buf,'utf8',0,byteLength) decodes to 'ABC'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      buffer.set(1, Int.toByte(66));
      buffer.set(2, Int.toByte(67));
      const result = ArrayBuffer.stringify(buffer, 'utf8', 0, buffer.byteLength);
      expect(result).assertEqual('ABC');
    });

    /**
     * @tc.name testArrayBufferStringify0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0200
     * @tc.desc Verify stringify(buf,'utf8',1,3) decodes partial range to 'BC'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(5);
      buffer.set(0, Int.toByte(65));
      buffer.set(1, Int.toByte(66));
      buffer.set(2, Int.toByte(67));
      buffer.set(3, Int.toByte(68));
      buffer.set(4, Int.toByte(69));
      const result = ArrayBuffer.stringify(buffer, 'utf8', 1, 3);
      expect(result).assertEqual('BC');
    });

    /**
     * @tc.name testArrayBufferStringify0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0300
     * @tc.desc Verify stringify decodes UTF-8 CJK bytes to '你好'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6);
      buffer.set(0, Int.toByte(228));
      buffer.set(1, Int.toByte(189));
      buffer.set(2, Int.toByte(160));
      buffer.set(3, Int.toByte(229));
      buffer.set(4, Int.toByte(165));
      buffer.set(5, Int.toByte(189));
      const result = ArrayBuffer.stringify(buffer, 'utf8', 0, buffer.byteLength);
      expect(result).assertEqual('你好');
    });

    /**
     * @tc.name testArrayBufferStringify0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0400
     * @tc.desc Verify stringify with start==end returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      buffer.set(1, Int.toByte(66));
      buffer.set(2, Int.toByte(67));
      const result = ArrayBuffer.stringify(buffer, 'utf8', 0, 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name testArrayBufferStringify0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0500
     * @tc.desc Verify stringify with utf-8 alias decodes to 'ABC'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      buffer.set(1, Int.toByte(66));
      buffer.set(2, Int.toByte(67));
      const result = ArrayBuffer.stringify(buffer, 'utf-8', 0, buffer.byteLength);
      expect(result).assertEqual('ABC');
    });

    /**
     * @tc.name testArrayBufferStringify0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0600
     * @tc.desc Verify stringify(null,'utf8',0,3) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.stringify(Utils.castToArrayBuffer(Utils.nullAsObject()), 'utf8', 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0700
     * @tc.desc Verify stringify with invalid-encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'invalid-encoding', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0800
     * @tc.desc Verify stringify with end greater than byteLength throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'utf8', 0, buffer.byteLength + 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });
  });
}
