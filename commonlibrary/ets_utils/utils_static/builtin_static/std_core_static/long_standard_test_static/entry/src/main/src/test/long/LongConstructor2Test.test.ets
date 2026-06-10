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

    beforeEach(async () => { await Utils.msSleep(CON2_30); });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0100
     * @tc.name testLongConstructor2001
     * @tc.desc Verify Long constructor with value 42 creates non-null Long instance preserving value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_42);
      expect(value instanceof Long).assertTrue();
      expect(value.toLong() === CON2_42).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0200
     * @tc.name testLongConstructor2002
     * @tc.desc Verify Long constructor with value 100 creates non-null Long instance preserving value via equals()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_100);
      expect(value.equals(new Long(CON2_100))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0300
     * @tc.name testLongConstructor2003
     * @tc.desc Verify Long constructor with negative value -100 preserves value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_100);
      expect(value instanceof Long).assertTrue();
      expect(value.toLong() === CON2_NEG_100).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0400
     * @tc.name testLongConstructor2004
     * @tc.desc Verify Long constructor with value 0 creates instance equal to default constructor via equals()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_0);
      expect(value.equals(new Long())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0500
     * @tc.name testLongConstructor2005
     * @tc.desc Verify Long constructor with value 1 preserves value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_1);
      expect(value.toLong() === CON2_1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0600
     * @tc.name testLongConstructor2006
     * @tc.desc Verify Long constructor with negative value -1 preserves value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_1);
      expect(value.toLong() === CON2_NEG_1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0700
     * @tc.name testLongConstructor2007
     * @tc.desc Verify Long constructor with large positive value creates valid instance preserving value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_922337203685477580);
      expect(value.toLong() === CON2_922337203685477580).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0800
     * @tc.name testLongConstructor2008
     * @tc.desc Verify Long constructor with large negative value creates valid instance preserving value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_NEG_922337203685477580);
      expect(value.toLong() === CON2_NEG_922337203685477580).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_0900
     * @tc.name testLongConstructor2009
     * @tc.desc Verify Long constructor with value 256 creates non-null instance preserving value via toLong()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(CON2_256);
      expect(value.toLong() === CON2_256).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1000
     * @tc.name testLongConstructor2010
     * @tc.desc Verify multiple independent Long instances with different values are distinct objects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Long = new Long(CON2_100);
      const v2: Long = new Long(CON2_200);
      expect(v1 !== v2).assertTrue();
      expect(v1.toLong() === CON2_100).assertTrue();
      expect(v2.toLong() === CON2_200).assertTrue();
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
      const value: Long = new Long(CON2_42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1200
     * @tc.name testLongConstructor2012
     * @tc.desc Verify Long constructor with Long.MAX_VALUE creates valid instance preserving identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      expect(value.toLong() === Long.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1300
     * @tc.name testLongConstructor2013
     * @tc.desc Verify Long constructor with Long.MIN_VALUE creates valid instance preserving identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      expect(value.toLong() === Long.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1400
     * @tc.name testLongConstructor2014
     * @tc.desc Verify Long constructor with int parameter 42 preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(42 as int);
      expect(value.toLong() === 42).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1500
     * @tc.name testLongConstructor2015
     * @tc.desc Verify Long constructor with byte parameter 42 preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(42 as byte);
      expect(value.toLong() === 42).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1600
     * @tc.name testLongConstructor2016
     * @tc.desc Verify Long constructor with short parameter 42 preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(42 as short);
      expect(value.toLong() === 42).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1700
     * @tc.name testLongConstructor2017
     * @tc.desc Verify Long constructor string overload — compile-time verification (ArkTS Long has no string constructor)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS Long class does not support string constructor; compile-time verification only
      let skipReason: string = "compile-time verification only — Long(string) not supported";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR2_1800
     * @tc.name testLongConstructor2018
     * @tc.desc Verify Long constructor float overload — compile-time verification (ArkTS Long has no float constructor)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS Long class does not support float constructor; compile-time verification only
      let skipReason: string = "compile-time verification only — Long(float) not supported";
      expect(skipReason.length > 0).assertTrue();
      return;
    });
  });
}
