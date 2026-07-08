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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function arrayBufferFromObjectTest(): void {
  describe('ArrayBufferFromObjectTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromObject0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0100
     * @tc.desc Verify fromObject('hello','utf8',5) yields byteLength 5 and UTF-8 bytes 104 and 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf8', 5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(104));
      expect(result.at(4)).assertEqual(Int.toByte(111));
    });

    /**
     * @tc.name testArrayBufferFromObject0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0200
     * @tc.desc Verify fromObject(src,2,4) copies 4 bytes matching src.at(2) through src.at(5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        src.set(i, Int.toByte(i + 1));
      }
      const result = ArrayBuffer.fromObject(src, 2, 4);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(src.at(2));
      expect(result.at(3)).assertEqual(src.at(5));
    });

    /**
     * @tc.name testArrayBufferFromObject0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0300
     * @tc.desc Verify fromObject('','utf8',0) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('', 'utf8', 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0400
     * @tc.desc Verify fromObject('hello','utf-8',5) yields same UTF-8 bytes as utf8 encoding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf-8', 5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(104));
      expect(result.at(4)).assertEqual(Int.toByte(111));
    });

    /**
     * @tc.name testArrayBufferFromObject0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0500
     * @tc.desc Verify fromObject(src,src.byteLength,0) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      src.set(0, Int.toByte(1));
      const result = ArrayBuffer.fromObject(src, src.byteLength, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0600
     * @tc.desc Verify fromObject(src,3,1) copies last byte 88 with byteLength 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4);
      src.set(3, Int.toByte(88));
      const result = ArrayBuffer.fromObject(src, 3, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(88));
    });

    /**
     * @tc.name testArrayBufferFromObject0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0700
     * @tc.desc Verify fromObject(src,NaN,2) coerces offset to 0 and copies first two bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4);
      src.set(0, Int.toByte(10));
      src.set(1, Int.toByte(20));
      const result = ArrayBuffer.fromObject(src, Double.toInt(Double.NaN), 2);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(10));
      expect(result.at(1)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferFromObject0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0800
     * @tc.desc Verify fromObject(src,0,4) returns a distinct copy where result !== src
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4);
      src.set(0, Int.toByte(1));
      const result = ArrayBuffer.fromObject(src, 0, 4);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromObject0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0900
     * @tc.desc Verify fromObject(number,0,4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badNum: number = 123;
      try {
        ArrayBuffer.fromObject(Utils.boxAsObject(badNum), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1000
     * @tc.desc Verify fromObject(src,-1,4) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(8);
      try {
        ArrayBuffer.fromObject(src, -1, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1100
     * @tc.desc Verify fromObject('hello','invalid-encoding',5) throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject('hello', 'invalid-encoding', 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1200
     * @tc.desc Verify fromObject(null,0,4) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.nullAsObject(), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1300
     * @tc.desc Verify fromObject(plain Object,0,4) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.plainObject(), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1400
     * @tc.desc Verify fromObject(src,2,10) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4);
      try {
        ArrayBuffer.fromObject(src, 2, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}
