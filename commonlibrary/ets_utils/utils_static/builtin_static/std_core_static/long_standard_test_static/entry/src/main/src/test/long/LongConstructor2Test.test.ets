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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongConstructor2Test(): void {
  describe('LongConstructor2Test', () => {
    const CON2_NEG_922337203685477580: long = -922337203685477580;
    const CON2_NEG_100: long = -100;
    const CON2_NEG_1: long = -1;
    const CON2_0: long = 0;
    const CON2_1: long = 1;
    const CON2_30: int = 30;
    const CON2_42: long = 42;
    const CON2_100: long = 100;
    const CON2_200: long = 200;
    const CON2_256: long = 256;
    const CON2_922337203685477580: long = 922337203685477580;
    const CON2_STR_MIN: string = "-9223372036854775808";
    const CON2_STR_NEG_922337203685477580: string = "-922337203685477580";
    const CON2_STR_NEG_100: string = "-100";
    const CON2_STR_NEG_1: string = "-1";
    const CON2_STR_0: string = "0";
    const CON2_STR_1: string = "1";
    const CON2_STR_42: string = "42";
    const CON2_STR_100: string = "100";
    const CON2_STR_200: string = "200";
    const CON2_STR_256: string = "256";
    const CON2_STR_922337203685477580: string = "922337203685477580";
    const CON2_STR_MAX: string = "9223372036854775807";

    beforeEach(async () => { await Utils.msSleep(CON2_30); });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0100
     * @tc.name testLongConstructor2001
     * @tc.desc Verify Long constructor with value 42 returns correct toString "42"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_42);
      expect(value.toString()).assertEqual(CON2_STR_42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0200
     * @tc.name testLongConstructor2002
     * @tc.desc Verify Long constructor with value 100 returns correct toString "100"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_100);
      expect(value.toString()).assertEqual(CON2_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0300
     * @tc.name testLongConstructor2003
     * @tc.desc Verify Long constructor with value -100 returns correct toString "-100"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_100);
      expect(value.toString()).assertEqual(CON2_STR_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0400
     * @tc.name testLongConstructor2004
     * @tc.desc Verify Long constructor with value 0 returns correct toString "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_0);
      expect(value.toString()).assertEqual(CON2_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0500
     * @tc.name testLongConstructor2005
     * @tc.desc Verify Long constructor with value 1 returns correct toString "1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_1);
      expect(value.toString()).assertEqual(CON2_STR_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0600
     * @tc.name testLongConstructor2006
     * @tc.desc Verify Long constructor with value -1 returns correct toString "-1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_1);
      expect(value.toString()).assertEqual(CON2_STR_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0700
     * @tc.name testLongConstructor2007
     * @tc.desc Verify Long constructor with large positive value 922337203685477580
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_922337203685477580);
      expect(value.toString()).assertEqual(CON2_STR_922337203685477580);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0800
     * @tc.name testLongConstructor2008
     * @tc.desc Verify Long constructor with large negative value -922337203685477580
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_922337203685477580);
      expect(value.toString()).assertEqual(CON2_STR_NEG_922337203685477580);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0900
     * @tc.name testLongConstructor2009
     * @tc.desc Verify Long constructor with value 256 returns correct toString "256"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_256);
      expect(value.toString()).assertEqual(CON2_STR_256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1000
     * @tc.name testLongConstructor2010
     * @tc.desc Verify multiple independent Long instances with different values work correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Long = new Long(CON2_100);
      const v2: Long = new Long(CON2_200);
      expect(v1.toString()).assertEqual(CON2_STR_100);
      expect(v2.toString()).assertEqual(CON2_STR_200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1100
     * @tc.name testLongConstructor2011
     * @tc.desc Verify Long constructor with value 42 does not throw exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const value: Long = new Long(CON2_42);
        expect(value.toString()).assertEqual(CON2_STR_42);
      } catch (error) {
        caught = true;
      } finally {
        expect(caught).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1200
     * @tc.name testLongConstructor2012
     * @tc.desc Verify Long constructor with Long.MAX_VALUE returns correct toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      expect(value.toString()).assertEqual(CON2_STR_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1300
     * @tc.name testLongConstructor2013
     * @tc.desc Verify Long constructor with Long.MIN_VALUE returns correct toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      expect(value.toString()).assertEqual(CON2_STR_MIN);
    });
  });
}
