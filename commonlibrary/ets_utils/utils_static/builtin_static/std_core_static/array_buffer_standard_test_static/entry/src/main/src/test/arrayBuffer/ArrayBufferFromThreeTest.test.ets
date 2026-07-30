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

export default function arrayBufferFromThreeTest(): void {
  describe('ArrayBufferFromThreeTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromThree0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0100
     * @tc.desc Verify from(Uint8Array) copies byteLength 5 and elements 10,20,30,40,50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([10, 20, 30, 40, 50]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(10));
      expect(result.at(1)).assertEqual(Int.toByte(20));
      expect(result.at(2)).assertEqual(Int.toByte(30));
      expect(result.at(3)).assertEqual(Int.toByte(40));
      expect(result.at(4)).assertEqual(Int.toByte(50));
    });

    /**
     * @tc.name testArrayBufferFromThree0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0200
     * @tc.desc Verify from(Uint8Array subview) copies full underlying 10-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const full = new Uint8Array(buf);
      for (let i: int = 0; i < 10; i++) {
        full[i] = Int.toByte(i);
      }
      const sub = new Uint8Array(buf, 3, 5);
      const fromSub = ArrayBuffer.from(sub);
      expect(fromSub.byteLength).assertEqual(10);
      expect(fromSub.at(3)).assertEqual(Int.toByte(3));
      expect(fromSub.at(7)).assertEqual(Int.toByte(7));
    });

    /**
     * @tc.name testArrayBufferFromThree0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0300
     * @tc.desc Verify from(Uint8Array) copy is isolated from source mutations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3]);
      const result = ArrayBuffer.from(u8);
      u8[0] = 99;
      expect(result.at(0)).assertEqual(Int.toByte(1));
      expect(result === u8.buffer).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromThree0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0400
     * @tc.desc Verify from(empty Uint8Array) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.from(new Uint8Array(0)).byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromThree0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0500
     * @tc.desc Verify from(Uint8Array[255]) copies single byte 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one = ArrayBuffer.from(new Uint8Array([255]));
      expect(one.byteLength).assertEqual(1);
      expect(one.at(0)).assertEqual(Int.toByte(255));
    });

    /**
     * @tc.name testArrayBufferFromThree0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0600
     * @tc.desc Verify from(1024-element Uint8Array) copies byteLength and boundary bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array(1024);
      for (let i: int = 0; i < 1024; i++) {
        u8[i] = Int.toByte(i % 256);
      }
      const large = ArrayBuffer.from(u8);
      expect(large.byteLength).assertEqual(1024);
      expect(large.at(0)).assertEqual(Int.toByte(0));
      expect(large.at(1023)).assertEqual(Int.toByte(255));
    });

    /**
     * @tc.name testArrayBufferFromThree0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0700
     * @tc.desc Verify cast Int8Array as Object to from(Uint8Array) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8 = new Int8Array([1, 2, 3]);
      try {
        ArrayBuffer.from(Utils.castToUint8Array(i8 as Object));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0800
     * @tc.desc Verify from(Uint8Array) on attached buffer copies bytes; detached underlying (byteLength 0) not constructible in static XTS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      expect(buf.detached).assertFalse();
      const u8 = new Uint8Array(buf);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(buf.at(i));
      }
    });
  });
}
