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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';
import { SLEEP_MS } from './LongTestConstants';

export default function LongParseIntTest(): void {
  describe('LongParseIntTest', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(SLEEP_MS);
    });

    afterEach(() => {
    });

    const PI_NEG_1: int = -1;
    const PI_0: int = 0;
    const PI_1: int = 1;
    const PI_2: int = 2;
    const PI_8: int = 8;
    const PI_10: int = 10;
    const PI_16: int = 16;
    const PI_36: int = 36;
    const PI_37: int = 37;
    const PI_50: long = 50;
    const PI_STR_NEG_255: string = "-255";
    const PI_STR_NEG_FF: string = "-ff";
    const PI_STR_0: string = "0";
    const PI_STR_10: string = "10";
    const PI_STR_100: string = "100";
    const PI_STR_1010: string = "1010";
    const PI_STR_11111111: string = "11111111";
    const PI_STR_123: string = "123";
    const PI_STR_15: string = "15";
    const PI_STR_150: string = "150";
    const PI_STR_17: string = "17";
    const PI_STR_255: string = "255";
    const PI_STR_35: string = "35";
    const PI_STR_377: string = "377";
    const PI_STR_FF_UC: string = "FF";
    const PI_STR_ABC: string = "abc";
    const PI_STR_FF: string = "ff";
    const PI_STR_Z: string = "z";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0100
     * @tc.name testLongParseInt001
     * @tc.desc Verify Long.parseInt("ff", 16) returns 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_FF, PI_16);
      expect(result.toString()).assertEqual(PI_STR_255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0200
     * @tc.name testLongParseInt002
     * @tc.desc Verify Long.parseInt("1010", 2) returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_1010, PI_2);
      expect(result.toString()).assertEqual(PI_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0300
     * @tc.name testLongParseInt003
     * @tc.desc Verify Long.parseInt("17", 8) returns 15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_17, PI_8);
      expect(result.toString()).assertEqual(PI_STR_15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0400
     * @tc.name testLongParseInt004
     * @tc.desc Verify Long.parseInt("123", 10) returns 123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_123, PI_10);
      expect(result.toString()).assertEqual(PI_STR_123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0500
     * @tc.name testLongParseInt005
     * @tc.desc Verify Long.parseInt("z", 36) returns 35
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_Z, PI_36);
      expect(result.toString()).assertEqual(PI_STR_35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0600
     * @tc.name testLongParseInt006
     * @tc.desc Verify Long.parseInt("123", 0) treats as decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_123, PI_0);
      expect(result.toString()).assertEqual(PI_STR_123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0700
     * @tc.name testLongParseInt007
     * @tc.desc Verify Long.parseInt("-ff", 16) returns -255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_NEG_FF, PI_16);
      expect(result.toString()).assertEqual(PI_STR_NEG_255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0800
     * @tc.name testLongParseInt008
     * @tc.desc Verify Long.parseInt("0", 10) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_0, PI_10);
      expect(result.toString()).assertEqual(PI_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_0900
     * @tc.name testLongParseInt009
     * @tc.desc Verify Long.parseInt("0", 0) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_0, PI_0);
      expect(result.toString()).assertEqual(PI_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1000
     * @tc.name testLongParseInt010
     * @tc.desc Verify Long.parseInt("FF", 16) returns 255 (uppercase)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_FF_UC, PI_16);
      expect(result.toString()).assertEqual(PI_STR_255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1100
     * @tc.name testLongParseInt011
     * @tc.desc Verify return type is long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_123, PI_10);
      expect(result.toString()).assertEqual(PI_STR_123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1200
     * @tc.name testLongParseInt012
     * @tc.desc Verify return value can be used in arithmetic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PI_STR_100, PI_10);
      const sum: long = result + PI_50;
      expect(sum.toString()).assertEqual(PI_STR_150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1300
     * @tc.name testLongParseInt013
     * @tc.desc Verify same value parsed from different radices returns consistent result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r2: long = Long.parseInt(PI_STR_11111111, PI_2);
      const r8: long = Long.parseInt(PI_STR_377, PI_8);
      const r10: long = Long.parseInt(PI_STR_255, PI_10);
      const r16: long = Long.parseInt(PI_STR_FF, PI_16);
      expect(r2.toString()).assertEqual(r10.toString());
      expect(r8.toString()).assertEqual(r10.toString());
      expect(r16.toString()).assertEqual(r10.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1400
     * @tc.name testLongParseInt014
     * @tc.desc Verify radix=1 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt(PI_STR_0, PI_1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1500
     * @tc.name testLongParseInt015
     * @tc.desc Verify radix=37 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt(PI_STR_0, PI_37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1600
     * @tc.name testLongParseInt016
     * @tc.desc Verify radix=-1 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt(PI_STR_0, PI_NEG_1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1700
     * @tc.name testLongParseInt017
     * @tc.desc Verify invalid string "abc" with radix=10 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt(PI_STR_ABC, PI_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1800
     * @tc.name testLongParseInt018
     * @tc.desc Verify Long.parseInt("", 10) throws exception — empty string invalid
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("", PI_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_1900
     * @tc.name testLongParseInt019
     * @tc.desc Verify Long.parseInt("9223372036854775807", 10) — MAX_VALUE string parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(Long.MAX_VALUE.toString(), PI_10);
      expect(result.toString()).assertEqual(Long.MAX_VALUE.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_2000
     * @tc.name testLongParseInt020
     * @tc.desc Verify Long.parseInt with whitespace-only string throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("  ", PI_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_2100
     * @tc.name testLongParseInt021
     * @tc.desc Verify Long.parseInt with invalid characters returns the parsed prefix value 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt("12a3", PI_10);
      expect(result).assertEqual(12 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_2200
     * @tc.name testLongParseInt022
     * @tc.desc Verify Long.parseInt with overflow value throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("9223372036854775808", PI_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_2300
     * @tc.name testLongParseInt023
     * @tc.desc Verify Long.parseInt with null-like string throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("null", PI_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_2400
     * @tc.name testLongParseInt024
     * @tc.desc Verify Long.parseInt(Long.MIN_VALUE.toString(), 10) returns Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(Long.MIN_VALUE.toString(), PI_10);
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_2500
     * @tc.name testLongParseInt025
     * @tc.desc Verify Long.parseInt("-9223372036854775809", 10) — MIN-1 underflow throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseInt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("-9223372036854775809", PI_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });
  });
}
