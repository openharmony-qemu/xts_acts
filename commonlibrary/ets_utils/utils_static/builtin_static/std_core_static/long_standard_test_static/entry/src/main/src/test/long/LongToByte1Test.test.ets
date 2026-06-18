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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongToByte1Test(): void {
  describe('LongToByte1Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TB1_OVERFLOW_BELOW_MIN: long = -129;
    const TB1_BYTE_MIN: long = -128;
    const TB1_NEG_1: long = -1;
    const TB1_0: long = 0;
    const TB1_1: long = 1;
    const TB1_12: long = 12;
    const TB1_BYTE_MAX: long = 127;
    const TB1_OVERFLOW_ABOVE_MAX: long = 128;
    const TB1_WRAP_TO_ZERO: long = 256;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0100
     * @tc.name testLongToByte1001
     * @tc.desc Verify toByte() basic 12 → 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_12);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0200
     * @tc.name testLongToByte1002
     * @tc.desc Verify toByte() value 1 → 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_1);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0300
     * @tc.name testLongToByte1003
     * @tc.desc Verify toByte() value -1 → -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_NEG_1);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0400
     * @tc.name testLongToByte1004
     * @tc.desc Verify toByte() zero 0 → 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_0);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0500
     * @tc.name testLongToByte1005
     * @tc.desc Verify toByte() byte min -128 → -128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_BYTE_MIN);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_BYTE_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0600
     * @tc.name testLongToByte1006
     * @tc.desc Verify toByte() byte max 127 → 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_BYTE_MAX);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_BYTE_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0700
     * @tc.name testLongToByte1007
     * @tc.desc Verify toByte() out of range 128 truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_OVERFLOW_ABOVE_MAX);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_BYTE_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0800
     * @tc.name testLongToByte1008
     * @tc.desc Verify toByte() out of range -129 truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_OVERFLOW_BELOW_MIN);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_BYTE_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_0900
     * @tc.name testLongToByte1009
     * @tc.desc Verify toByte() out of range 256 truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_WRAP_TO_ZERO);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_1000
     * @tc.name testLongToByte1010
     * @tc.desc Verify toByte() multiple calls consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TB1_12);
      const result1: byte = value.toByte();
      const result2: byte = value.toByte();
      const result3: byte = value.toByte();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(TB1_12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_1100
     * @tc.name testLongToByte1011
     * @tc.desc Verify toByte() multiple instances independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: Long = new Long(TB1_12);
      const value2: Long = new Long(TB1_BYTE_MAX);
      const result1: byte = value1.toByte();
      const result2: byte = value2.toByte();
      expect(result1).assertEqual(TB1_12);
      expect(result2).assertEqual(TB1_BYTE_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_1200
     * @tc.name testLongToByte1012
     * @tc.desc Verify toByte() Long.MAX_VALUE truncation — extreme upper boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE1_1300
     * @tc.name testLongToByte1013
     * @tc.desc Verify toByte() Long.MIN_VALUE truncation — extreme lower boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: byte = value.toByte();
      expect(result).assertEqual(TB1_0);
    });
  });
}

