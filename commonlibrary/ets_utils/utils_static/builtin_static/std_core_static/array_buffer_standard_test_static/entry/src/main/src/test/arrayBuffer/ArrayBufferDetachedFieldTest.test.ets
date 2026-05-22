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

export default function arrayBufferDetachedFieldTest(): void {
  describe('ArrayBufferDetachedFieldTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });


    /**
     * @tc.name testArrayBufferDetachedField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0100
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const result = buffer.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0200
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      const result = buffer.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0300
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 32);
      const result = buffer.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0400
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      const result = buffer.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0500
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const result = buffer.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0600
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      const result = buffer.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0700
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("ABC", "utf8");
      const result = buffer.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0800
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 10);
      const result = sliced.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0900
     * @tc.desc Verify result is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 10);
      const result = buffer.detached;
      expect(result).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1000
     * @tc.desc Verify result1 === result2 && result2 === result3 && result1 === false is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const result1 = buffer.detached;
      const result2 = buffer.detached;
      const result3 = buffer.detached;
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1100
     * @tc.desc Verify detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1200
     * @tc.desc Verify detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Int8Array(buffer);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1300
     * @tc.desc Verify detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const i8 = new Int8Array(buffer);
      const u8 = new Uint8Array(buffer);
      const i32 = new Int32Array(buffer);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1400
     * @tc.desc Verify typeof result equals "boolean"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const result = buffer.detached;
      expect(typeof result).assertEqual("boolean");
    });
    /**
     * @tc.name testArrayBufferDetachedField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1500
     * @tc.desc Verify result === false is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1600
     * @tc.desc Verify result !== true is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const result = buffer.detached;
      expect(result !== true).assertTrue();
    });
    /**
     * @tc.name testArrayBufferDetachedField0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1700
     * @tc.desc Verify detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1800
     * @tc.desc Verify detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(16);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_1900
     * @tc.desc Verify detached is false and detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(8);
      expect(buffer.detached).assertFalse();
      buffer.resize(2);
      expect(buffer.detached).assertFalse();
      buffer.resize(16);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2000
     * @tc.desc Verify API call throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      try {
        (buffer as Record<string, Object>)["detached"] = true as Object;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2100
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2200
     * @tc.desc Verify result1 === result2 && result1 === false is true && result2 === false is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      const result1 = buffer.detached;
      const result2 = buffer.detached;
      expect(result1 === result2).assertTrue();
      expect(result1).assertFalse();
      expect(result2).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2300
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2400
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2500
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0, 8);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.detached).assertFalse();
    });
    /**
     * @tc.name testArrayBufferDetachedField0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_2600
     * @tc.desc Verify typeof result === 'boolean' && result === false is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      expect(typeof buffer.detached === 'boolean').assertTrue();
      expect(buffer.detached).assertFalse();
    });
  });
}
