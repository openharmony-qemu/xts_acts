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
     * @tc.desc Verify buffer.byteLength equals 8
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
     * @tc.desc Verify buffer.byteLength equals 0
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
     * @tc.desc Verify buffer.byteLength equals 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(1024);
      expect(buffer.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferLike0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0400
     * @tc.desc Verify buffer.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBufferLike = new ArrayBuffer(4);
      buffer = new ArrayBuffer(16);
      expect(buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferLike0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0500
     * @tc.desc Verify return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(1);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0600
     * @tc.desc Verify abBuffer.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const likeBuffer: ArrayBufferLike = new ArrayBuffer(8);
      const abBuffer: ArrayBuffer = likeBuffer;
      expect(abBuffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0700
     * @tc.desc Verify buffer.byteLength equals 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(32);
      expect(buffer.byteLength).assertEqual(32);
    });

    /**
     * @tc.name testArrayBufferLike0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0800
     * @tc.desc Verify bytesLength return type is int or number and len equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const len: int = buffer.byteLength;
      expect(typeof len === 'int').assertTrue();
      expect(len).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferLike0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0900
     * @tc.desc Verify return value is ArrayBuffer instance and sliced.byteLength equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const sliced: ArrayBuffer = buffer.slice(4);
      expect(sliced.byteLength).assertEqual(12);
      expect(sliced instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1000
     * @tc.desc Verify sliced.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const sliced: ArrayBuffer = buffer.slice(4, 10);
      expect(sliced.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferLike0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1100
     * @tc.desc Verify sliced !== buffer is true and sliced.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced: ArrayBuffer = buffer.slice(0);
      expect(sliced.byteLength).assertEqual(8);
      expect(sliced !== buffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1200
     * @tc.desc Verify sliced !== buffer is true and sliced.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced: ArrayBuffer = buffer.slice(0, buffer.byteLength as int);
      expect(sliced.byteLength).assertEqual(8);
      expect(sliced !== buffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1300
     * @tc.desc Verify return value is ArrayBuffer instance and sliced.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced: ArrayBuffer = buffer.slice(2);
      expect(sliced instanceof ArrayBuffer).assertTrue();
      expect(sliced.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferLike0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1400
     * @tc.desc Verify typeof str === 'string' is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const str: string = buffer.toString();
      expect(typeof str === 'string').assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1500
     * @tc.desc Verify arrayBufferLikeReadByteLength(buffer) equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(arrayBufferLikeReadByteLength(buffer)).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1600
     * @tc.desc Verify return value is ArrayBuffer instance and buffer.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = arrayBufferLikeCreateBuffer(16);
      expect(buffer.byteLength).assertEqual(16);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1700
     * @tc.desc Verify int8.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const int8 = new Int8Array(buffer);
      expect(int8.byteLength).assertEqual(8);
      expect(int8.length).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1800
     * @tc.desc Verify view.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const view = new DataView(buffer);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferLike0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1900
     * @tc.desc Verify return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2000
     * @tc.desc Verify typeof buffer === 'object' is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(typeof buffer === 'object').assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2100
     * @tc.desc Verify byteLength is read-only (dynamic assign throws ClassCastError)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const before = buffer.byteLength;
      try {
        (buffer as Record<string, Object>)['byteLength'] = 16 as Object;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(buffer.byteLength).assertEqual(before);
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2200
     * @tc.desc Verify int32[0] equals 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const int32 = new Int32Array(buffer);
      int32[0] = 42;
      expect(int32[0]).assertEqual(42);
    });

    /**
     * @tc.name testArrayBufferLike0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2300
     * @tc.desc Verify slicedView[0] equals 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const int32 = new Int32Array(buffer);
      int32[0] = 100;
      const sliced = buffer.slice(0);
      const slicedView = new Int32Array(sliced);
      expect(slicedView[0]).assertEqual(100);
      slicedView[0] = 200;
      expect(int32[0]).assertEqual(100);
    });

    /**
     * @tc.name testArrayBufferLike0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2400
     * @tc.desc Verify new ArrayBuffer(-1) throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBufferLike = new ArrayBuffer(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferLike0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2500
     * @tc.desc Verify return value is ArrayBuffer instance and buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(Double.NaN);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2600
     * @tc.desc Verify new ArrayBuffer(len) throws OutOfMemoryError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const len: int = Double.toInt(Double.POSITIVE_INFINITY);
        const buffer: ArrayBufferLike = new ArrayBuffer(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.name testArrayBufferLike0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2700
     * @tc.desc Verify new ArrayBuffer(bad) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bad: int = Utils.castToInt('abc' as Object);
        const buffer: ArrayBufferLike = new ArrayBuffer(bad);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferLike0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2800
     * @tc.desc Verify sliced.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced = buffer.slice(6, 2);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferLike0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2900
     * @tc.desc Verify sliced.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced = buffer.slice(100);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferLike0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3000
     * @tc.desc Verify sliced.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced = buffer.slice(-4);
      expect(sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferLike0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3100
     * @tc.desc Verify buffer.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(buffer.byteLength).assertEqual(4);
    });
  });
}
