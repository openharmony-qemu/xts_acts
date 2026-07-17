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
  beforeEach, describe, expect, it, Level, Size, TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function byteConstructorTwo2Test(): void {
  describe('ByteConstructorTwo2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testByteConstructorTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0100
     * @tc.desc Verify Byte constructor with int literal 0x0A equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte(0x0A);
      expect(b.toByte()).assertEqual(10);
    });

    /**
     * @tc.name testByteConstructorTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0200
     * @tc.desc Verify Byte constructor with int literal 0o14 equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte(0o14);
      expect(b.toByte()).assertEqual(12);
    });

    /**
     * @tc.name testByteConstructorTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0300
     * @tc.desc Verify Byte constructor with int literal -1 equals -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte(-1);
      expect(b.toByte()).assertEqual(-1);
    });

    /**
     * @tc.name testByteConstructorTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0400
     * @tc.desc Verify multiple Byte constructor instances with int literals are independent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: Byte = new Byte(10);
      const b2: Byte = new Byte(20);
      const b3: Byte = new Byte(30);
      expect(b1.toByte()).assertEqual(10);
      expect(b2.toByte()).assertEqual(20);
      expect(b3.toByte()).assertEqual(30);
    });

    /**
     * @tc.name testByteConstructorTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0500
     * @tc.desc Verify Byte constructor with Int.toByte(0x80) truncates to -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte(Int.toByte(0x80));
      expect(b.toByte()).assertEqual(-128);
    });

    /**
     * @tc.name testByteConstructorTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0600
     * @tc.desc Verify Byte constructor with Int.toByte(-129) truncates to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte(Int.toByte(-129));
      expect(b.toByte()).assertEqual(127);
    });

    /**
     * @tc.name testByteConstructorTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0700
     * @tc.desc Verify Byte constructor with Int.toByte(0x81) truncates to -127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte(Int.toByte(0x81));
      expect(b.toByte()).assertEqual(-127);
    });

    /**
     * @tc.name testByteConstructorTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_TWO_0800
     * @tc.desc Verify Byte constructor with int literal 0 equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte(0);
      expect(b.toByte()).assertEqual(0);
    });
  });
}