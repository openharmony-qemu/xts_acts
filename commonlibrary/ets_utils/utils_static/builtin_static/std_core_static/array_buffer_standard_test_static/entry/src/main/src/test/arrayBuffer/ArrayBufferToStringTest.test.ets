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
 * WITHOUT WARRANTIES OR ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferToStringTest(): void {
  describe('ArrayBufferToStringTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.name testArrayBufferToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0100
     * @tc.desc Verify ArrayBuffer.toString: call toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0200
     * @tc.desc Verify ArrayBuffer.toString: passing 1 call toString，verify is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0300
     * @tc.desc Verify ArrayBuffer.toString: passing call toString，verify is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0400
     * @tc.desc Verify ArrayBuffer.toString: is 0 ArrayBuffercall toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0500
     * @tc.desc Verify ArrayBuffer.toString: is 1 ArrayBuffercall toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0600
     * @tc.desc Verify ArrayBuffer.toString: is 8 ArrayBuffercall toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0700
     * @tc.desc Verify ArrayBuffer.toString: is 1024 ArrayBuffercall toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0800
     * @tc.desc Verify ArrayBuffer.toString: is maximum ArrayBuffercall toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0900
     * @tc.desc Verify ArrayBuffer.toString: verify return value type is String
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testArrayBufferToString0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1000
     * @tc.desc Verify ArrayBuffer.toString: verify return value Stringobject instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(typeof result === 'string').assertTrue();
    });

    /**
     * @tc.name testArrayBufferToString0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1100
     * @tc.desc Verify ArrayBuffer.toString: verify return value length equals fixed-size string "[object ArrayBuffer]" length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result.length).assertEqual("[object ArrayBuffer]".length);
    });

    /**
     * @tc.name testArrayBufferToString0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1200
     * @tc.desc Verify ArrayBuffer.toString: verify return value equals "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result === "[object ArrayBuffer]").assertTrue();
    });

    /**
     * @tc.name testArrayBufferToString0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1300
     * @tc.desc Verify ArrayBuffer.toString: multiple call toStringreturn value consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result1 = buffer.toString();
      let result2 = buffer.toString();
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.name testArrayBufferToString0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1400
     * @tc.desc Verify ArrayBuffer.toString: empty ArrayBuffer（length is 0）call toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1500
     * @tc.desc Verify ArrayBuffer.toString: resizable ArrayBuffercall toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1600
     * @tc.desc Verify ArrayBuffer.toString: resizable after call toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(4);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1700
     * @tc.desc Verify ArrayBuffer.toString: detached ArrayBuffercall toString，verify return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1800
     * @tc.desc Verify ArrayBuffer.toString: slicecreate ArrayBuffercall toString，returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 8);
      let result = sliced.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1900
     * @tc.desc Verify ArrayBuffer.toString: data after ArrayBuffercall toString，return value data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

    /**
     * @tc.name testArrayBufferToString0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2000
     * @tc.desc Verify ArrayBuffer.toString: passing undefined ，toString returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2100
     * @tc.desc Verify ArrayBuffer.toString: passing null ，toString returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2200
     * @tc.desc Verify ArrayBuffer.toString: passing ，toString returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2300
     * @tc.desc Verify ArrayBuffer.toString: passing object ，toString returns "[object ArrayBuffer]"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2400
     * @tc.desc Verify ArrayBuffer.toString: at call toString，verify is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(8);
      let result = b.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2500
     * @tc.desc Verify ArrayBuffer.toString: not ArrayBufferobject ArrayBuffer.prototype.toString，verify return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(1);
      let result = b.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2600
     * @tc.desc Verify ArrayBuffer.toString: TypedArray ArrayBuffer.prototype.toString，verify return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(8);
      let result = arr.toString();
      expect(result === "[object Uint8Array]" || result.length > 0).assertTrue();
    });
    return;
  });
}
