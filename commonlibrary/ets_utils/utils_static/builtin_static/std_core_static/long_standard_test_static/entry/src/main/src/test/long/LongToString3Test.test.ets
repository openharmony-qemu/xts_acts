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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongToString3Test(): void {
  describe('LongToString3Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const TS3_NEG_255: int = -255;
    const TS3_NEG_1: int = -1;
    const TS3_0: int = 0;
    const TS3_1: int = 1;
    const TS3_2: int = 2;
    const TS3_3: int = 3;
    const TS3_10: int = 10;
    const TS3_16: int = 16;
    const TS3_35: int = 35;
    const TS3_36: int = 36;
    const TS3_37: int = 37;
    const TS3_255: int = 255;
    const TS3_1295: int = 1295;
    const TS3_4294967295: long = 4294967295;
    const TS3_STR_0: string = "0";
    const TS3_STR_1: string = "1";
    const TS3_STR_101: string = "101";
    const TS3_STR_Z: string = "z";
    const TS3_STR_ZZ: string = "zz";
    const TS3_STR_BIN_32ONES: string = "11111111111111111111111111111111";
    const TS3_STR_MAX_HEX: string = "7fffffffffffffff";
    const TS3_STR_NEG_FF: string = "-ff";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0100
     * @tc.name testLongToString3001
     * @tc.desc Verify new Long(1295).toString(36) returns "zz"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_1295);
      const result: string = value.toString(TS3_36);
      expect(result).assertEqual(TS3_STR_ZZ);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0200
     * @tc.name testLongToString3002
     * @tc.desc Verify new Long(10).toString(3) returns "101"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_10);
      const result: string = value.toString(TS3_3);
      expect(result).assertEqual(TS3_STR_101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0300
     * @tc.name testLongToString3003
     * @tc.desc Verify radix=2 boundary (minimum valid)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_1);
      const result: string = value.toString(TS3_2);
      expect(result).assertEqual(TS3_STR_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0400
     * @tc.name testLongToString3004
     * @tc.desc Verify new Long(0).toString(16) returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_0);
      const result: string = value.toString(TS3_16);
      expect(result).assertEqual(TS3_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0500
     * @tc.name testLongToString3005
     * @tc.desc Verify new Long(35).toString(36) returns "z" (max single char)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_35);
      const result: string = value.toString(TS3_36);
      expect(result).assertEqual(TS3_STR_Z);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0600
     * @tc.name testLongToString3006
     * @tc.desc Verify large value binary string is correct
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_4294967295);
      const result: string = value.toString(TS3_2);
      expect(result).assertEqual(TS3_STR_BIN_32ONES);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0700
     * @tc.name testLongToString3007
     * @tc.desc Verify radix=1 throws RangeError (below minimum valid radix 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_255);
      try {
        value.toString(TS3_1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0800
     * @tc.name testLongToString3008
     * @tc.desc Verify radix=37 throws RangeError (above maximum valid radix 36)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_255);
      try {
        value.toString(TS3_37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_0900
     * @tc.name testLongToString3009
     * @tc.desc Verify radix=-1 throws RangeError (negative radix invalid)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_255);
      try {
        value.toString(TS3_NEG_1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_1000
     * @tc.name testLongToString3010
     * @tc.desc Verify new Long(255).toString(0) throws RangeError — radix=0 outside valid range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_255);
      try {
        value.toString(TS3_0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_1100
     * @tc.name testLongToString3011
     * @tc.desc Verify new Long(Long.MAX_VALUE).toString(2) — MAX_VALUE in binary returns non-empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      const result: string = value.toString(TS3_2);
      expect(result).assertContain("1111111");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_1200
     * @tc.name testLongToString3012
     * @tc.desc Verify new Long(Long.MAX_VALUE).toString(16) — MAX_VALUE in hex returns non-empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      const result: string = value.toString(TS3_16);
      expect(result).assertEqual(TS3_STR_MAX_HEX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_1300
     * @tc.name testLongToString3013
     * @tc.desc Verify negative value toString with radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TS3_NEG_255);
      const result: string = value.toString(TS3_16);
      expect(result).assertEqual(TS3_STR_NEG_FF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING3_1400
     * @tc.name testLongToString3014
     * @tc.desc Verify new Long(Long.MIN_VALUE).toString(10) returns a negative-prefixed string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToString3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: string = value.toString(TS3_10);
      expect(typeof result).assertEqual('string');
      expect(result.indexOf("-")).assertEqual(0);
    });
  });
}
